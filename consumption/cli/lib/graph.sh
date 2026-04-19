#!/usr/bin/env bash
# ci graph — inbound + outbound links for a page.

ci_cmd_graph() {
  local slug=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|--help)
        cat <<'EOF'
ci graph <slug>

Lists:
  INBOUND  — pages with markdown links to this page
  OUTBOUND — pages this page links to
EOF
        return 0 ;;
      -*) ci_err "graph: unknown flag: $1"; return 3 ;;
      *) slug="$1"; shift ;;
    esac
  done

  [[ -n "$slug" ]] || { ci_err "graph: slug required"; return 3; }

  local path
  path=$(ci_resolve_slug "$slug") || return 1

  local root
  root=$(ci_repo_root)
  cd "$root"

  local basename_md
  basename_md=$(basename "$path")

  echo "# INBOUND — pages linking to ${path}"
  ci_iter_pages | while read -r rel; do
    [[ "$rel" == "$path" ]] && continue
    # Match relative link to this page by basename or full path fragment
    if grep -Eq "\]\([^)]*${basename_md}\)" "$rel" 2>/dev/null; then
      printf '  %s\n' "$rel"
    fi
  done | sort -u

  echo ""
  echo "# OUTBOUND — pages this page links to"
  # Portable link extraction (BSD awk on macOS lacks 3-arg match())
  grep -oE '\]\([^)]+\)' "$path" 2>/dev/null | sed -E 's/^\]\((.*)\)$/\1/' | while read -r target; do
    # Skip external URLs, anchors, images
    case "$target" in
      http*|mailto:*|'#'*|*.png|*.jpg|*.gif|*.svg) continue ;;
    esac
    # Resolve relative path
    local dir resolved
    dir=$(dirname "$path")
    resolved=$(cd "$dir" 2>/dev/null && cd "$(dirname "$target")" 2>/dev/null && pwd)/$(basename "$target") || true
    if [[ -n "$resolved" ]]; then
      local relpath="${resolved#"$root/"}"
      if [[ -f "$resolved" ]]; then
        printf '  %s\n' "$relpath"
      else
        printf '  %s  [BROKEN]\n' "$relpath"
      fi
    fi
  done | sort -u
}
