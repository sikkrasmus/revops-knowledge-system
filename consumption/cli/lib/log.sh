#!/usr/bin/env bash
# ci log — filtered read of log.md.

ci_cmd_log() {
  local since="" type_filter=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --since) since="$2"; shift 2 ;;
      --type) type_filter="$2"; shift 2 ;;
      -h|--help)
        cat <<'EOF'
ci log [--since <duration>] [--type <event>]

Filters:
  --since 7d | 30d | 90d | <YYYY-MM-DD>
  --type ingest | auto-merge | lint | pr-merged | pr-opened |
         rollback | drift-detected | verification-refreshed | bootstrap
EOF
        return 0 ;;
      *) ci_err "log: unknown flag: $1"; return 3 ;;
    esac
  done

  local root
  root=$(ci_repo_root)
  local file="${root}/log.md"

  [[ -f "$file" ]] || { ci_err "log: log.md not found"; return 1; }

  # Resolve --since into ISO date cutoff.
  local cutoff=""
  if [[ -n "$since" ]]; then
    if ci_is_iso_date "$since"; then
      cutoff="$since"
    else
      local n="${since%[dD]}"
      if [[ "$n" =~ ^[0-9]+$ ]]; then
        if date -j >/dev/null 2>&1; then
          cutoff=$(date -v -"${n}"d -u +%Y-%m-%d)
        else
          cutoff=$(date -u -d "-${n} day" +%Y-%m-%d)
        fi
      else
        ci_err "log: invalid --since: ${since}"
        return 3
      fi
    fi
  fi

  # Entries: "## [YYYY-MM-DD] <event-type> | ..."
  # Portable across BSD awk (macOS) by avoiding 3-arg match().
  awk -v cutoff="$cutoff" -v type="$type_filter" '
    /^## \[[0-9]{4}-[0-9]{2}-[0-9]{2}\]/ {
      # Extract date: 4 chars after the opening [
      # Line format: "## [2026-04-19] <event> | ..."
      entry_date = substr($0, 5, 10)
      # Remainder after "] "
      rest = substr($0, 17)
      # Trim leading spaces
      sub(/^[[:space:]]+/, "", rest)
      # Event type is the first space-delimited token
      n = split(rest, parts, " ")
      event_type = parts[1]

      keep = 1
      if (cutoff != "" && entry_date < cutoff) keep = 0
      if (type != "" && event_type != type) keep = 0
      if (keep) print
    }
  ' "$file"
}
