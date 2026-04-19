#!/usr/bin/env bash
# ci show — print a page; optionally filter to sections matching a label.

ci_cmd_show() {
  local slug="" section_filter=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --section-filter) section_filter="$2"; shift 2 ;;
      -h|--help)
        cat <<'EOF'
ci show <slug> [--section-filter "key=value"]

Prints the page. With --section-filter, emits only labeled sections
matching the filter (e.g., "motion=plg").
EOF
        return 0 ;;
      -*) ci_err "show: unknown flag: $1"; return 3 ;;
      *) slug="$1"; shift ;;
    esac
  done

  [[ -n "$slug" ]] || { ci_err "show: slug required"; return 3; }

  local path
  path=$(ci_resolve_slug "$slug") || return 1

  local root
  root=$(ci_repo_root)

  if [[ -z "$section_filter" ]]; then
    cat "${root}/${path}"
    return 0
  fi

  # Filter by label
  local key="${section_filter%%=*}"
  local val="${section_filter#*=}"
  awk -v key="$key" -v val="$val" '
    function is_heading(line) { return (line ~ /^#+ /) }
    BEGIN { in_match = 0; cur_level = 0; match_level = 0 }
    {
      if (is_heading($0)) {
        # Count number of # chars
        h = $0; sub(/[^#].*/, "", h); level = length(h)

        if (match($0, /  \{[^}]+\}$/)) {
          label = substr($0, RSTART+3, RLENGTH-4)
          if (index(label, key ": " val) > 0) {
            in_match = 1; match_level = level
            print; next
          } else {
            if (in_match && level <= match_level) in_match = 0
          }
        } else {
          if (in_match && level <= match_level) in_match = 0
        }
      }
      if (in_match) print
    }
  ' "${root}/${path}"
}
