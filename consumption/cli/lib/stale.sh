#!/usr/bin/env bash
# ci stale — corpus-wide staleness + drift report.

ci_cmd_stale() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|--help)
        cat <<'EOF'
ci stale

Walks the corpus; reports pages with:
  - verified_until in the past
  - source_drift: true
  - verification_stale: true
  - has_contradiction non-null/non-empty
EOF
        return 0 ;;
      *) shift ;;
    esac
  done

  local root
  root=$(ci_repo_root)
  cd "$root"

  local any=0

  echo "# Stale verifications (today > verified_until)"
  ci_iter_pages | while read -r rel; do
    ci_has_frontmatter "$rel" || continue
    local vu
    vu=$(ci_get_field "$rel" verified_until)
    [[ -z "$vu" || "$vu" == "null" ]] && continue
    ci_is_iso_date "$vu" || continue
    local d
    d=$(ci_days_since "$vu")
    if [[ "$d" -gt 0 ]]; then
      printf '  %s  (stale %d days; verified_until: %s)\n' "$rel" "$d" "$vu"
    fi
  done

  echo ""
  echo "# source_drift: true"
  ci_iter_pages | while read -r rel; do
    ci_has_frontmatter "$rel" || continue
    local sd
    sd=$(ci_get_field "$rel" source_drift)
    [[ "$sd" == "true" ]] && printf '  %s\n' "$rel"
  done

  echo ""
  echo "# verification_stale: true"
  ci_iter_pages | while read -r rel; do
    ci_has_frontmatter "$rel" || continue
    local vs
    vs=$(ci_get_field "$rel" verification_stale)
    [[ "$vs" == "true" ]] && printf '  %s\n' "$rel"
  done

  echo ""
  echo "# has_contradiction"
  ci_iter_pages | while read -r rel; do
    ci_has_frontmatter "$rel" || continue
    local hc
    hc=$(ci_get_field "$rel" has_contradiction)
    if [[ -n "$hc" && "$hc" != "null" && "$hc" != "[]" ]]; then
      printf '  %s  -> %s\n' "$rel" "$hc"
    fi
  done

  echo ""
  echo "Done."
}
