#!/usr/bin/env bash
# ci list — list pages matching frontmatter filters.

ci_cmd_list() {
  local filter_type="" filter_function="" filter_motion="" filter_segment="" filter_consumer=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --type) filter_type="$2"; shift 2 ;;
      --function) filter_function="$2"; shift 2 ;;
      --motion) filter_motion="$2"; shift 2 ;;
      --segment) filter_segment="$2"; shift 2 ;;
      --consumer) filter_consumer="$2"; shift 2 ;;
      -h|--help)
        cat <<'EOF'
ci list [filters]

FILTERS
  --type <enum>       Page type (icp, pricing-policy, etc.)
  --function <name>   Function name (sales, marketing, revops, ...)
  --motion <enum>     plg | sales-assisted | enterprise
  --segment <enum>    smb | mid-market | enterprise
  --consumer <enum>   Which function consumes this page
EOF
        return 0 ;;
      *) ci_err "list: unknown flag: $1"; return 3 ;;
    esac
  done

  local root
  root=$(ci_repo_root)
  cd "$root"

  local rel
  ci_iter_pages | while read -r rel; do
    ci_has_frontmatter "$rel" || continue

    if [[ -n "$filter_type" ]]; then
      local t
      t=$(ci_get_field "$rel" type)
      [[ "$t" == "$filter_type" ]] || continue
    fi

    if [[ -n "$filter_function" ]]; then
      case "$rel" in
        "functions/${filter_function}"/*) : ;;
        *) continue ;;
      esac
    fi

    if [[ -n "$filter_motion" ]]; then
      ci_get_list "$rel" motion | grep -qFx "$filter_motion" || continue
    fi

    if [[ -n "$filter_segment" ]]; then
      ci_get_list "$rel" segment | grep -qFx "$filter_segment" || continue
    fi

    if [[ -n "$filter_consumer" ]]; then
      ci_get_list "$rel" consumers | grep -qFx "$filter_consumer" || continue
    fi

    local title desc
    title=$(ci_get_field "$rel" title)
    desc=$(ci_get_field "$rel" description)
    printf '%-60s  %s\n' "$rel" "$title"
  done
}
