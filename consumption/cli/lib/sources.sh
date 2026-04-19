#!/usr/bin/env bash
# ci sources — show raw sources backing a page's claims.

ci_cmd_sources() {
  local slug=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|--help)
        cat <<'EOF'
ci sources <slug>

Lists the page's frontmatter sources and the claim-level [source: ...]
citations embedded in the body. Confirms each source reference resolves.
EOF
        return 0 ;;
      -*) ci_err "sources: unknown flag: $1"; return 3 ;;
      *) slug="$1"; shift ;;
    esac
  done

  [[ -n "$slug" ]] || { ci_err "sources: slug required"; return 3; }

  local path
  path=$(ci_resolve_slug "$slug") || return 1

  local root
  root=$(ci_repo_root)
  local file="${root}/${path}"

  echo "# Frontmatter sources"
  ci_get_list "$file" sources | while read -r s; do
    [[ -z "$s" ]] && continue
    local status="ok"
    if [[ "$s" == sources/* ]]; then
      [[ -f "${root}/${s}" ]] || status="MISSING"
    elif [[ "$s" == *://* ]]; then
      local sys="${s%%://*}"
      if [[ ! -f "${root}/ingestion/connectors/${sys}.md" && "$sys" != "hubspot" && "$sys" != "gong" && "$sys" != "fathom" && "$sys" != "stripe" && "$sys" != "salesforce" && "$sys" != "confluence" && "$sys" != "notion" && "$sys" != "drive" && "$sys" != "slack" ]]; then
        status="connector-spec-missing"
      fi
    else
      status="unknown-format"
    fi
    printf '  %-12s  %s\n' "$status" "$s"
  done

  echo ""
  echo "# Claim-level citations in body"
  awk '
    /\[source: [^]]+\]/ {
      line = $0
      while (match(line, /\[source: [^]]+\]/)) {
        cite = substr(line, RSTART, RLENGTH)
        print "  " cite
        line = substr(line, RSTART+RLENGTH)
      }
    }
  ' "$file" | sort -u
}
