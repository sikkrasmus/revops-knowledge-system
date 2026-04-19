#!/usr/bin/env bash
# ci search — ranked grep across the corpus.

ci_cmd_search() {
  local query="" limit=20
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --limit) limit="$2"; shift 2 ;;
      -h|--help)
        cat <<'EOF'
ci search "<query>" [--limit N]

Scores each page:
  score = 2*title_hits + 1.5*description_hits + 1*body_hits + recency_boost
Recency:
  +0.5 if last_reviewed within 30 days
  +0.25 within 90 days
  0 otherwise
Prints top N (default 20), ranked desc, ties alphabetical.
EOF
        return 0 ;;
      -*) ci_err "search: unknown flag: $1"; return 3 ;;
      *) query="$1"; shift ;;
    esac
  done

  [[ -n "$query" ]] || { ci_err "search: query required"; return 3; }

  local root
  root=$(ci_repo_root)
  cd "$root"

  local rel
  ci_iter_pages | while read -r rel; do
    ci_has_frontmatter "$rel" || continue

    local title desc last_reviewed
    title=$(ci_get_field "$rel" title)
    desc=$(ci_get_field "$rel" description)
    last_reviewed=$(ci_get_field "$rel" last_reviewed)

    # Count match occurrences (not lines). -o emits one match per line;
    # wc -l then counts matches. -c would return a single "N" line and
    # always produce wc output of 1, which silently defeats ranking.
    local title_hits desc_hits body_hits
    title_hits=$(printf '%s' "$title" | grep -Fio "$query" 2>/dev/null | wc -l | tr -d ' ')
    desc_hits=$(printf '%s' "$desc" | grep -Fio "$query" 2>/dev/null | wc -l | tr -d ' ')
    body_hits=$(grep -Fio "$query" "$rel" 2>/dev/null | wc -l | tr -d ' ')

    local total=$(( title_hits + desc_hits + body_hits ))
    [[ "$total" -gt 0 ]] || continue

    local recency=0
    if [[ -n "$last_reviewed" && "$last_reviewed" != "null" ]]; then
      local d
      d=$(ci_days_since "$last_reviewed" 2>/dev/null || echo 9999)
      if [[ "$d" -le 30 ]]; then
        recency=50
      elif [[ "$d" -le 90 ]]; then
        recency=25
      fi
    fi

    # Integer scoring (multiply by 10 to preserve 0.5/0.25 increments)
    local score=$(( 20*title_hits + 15*desc_hits + 10*body_hits + recency ))
    printf '%d\t%s\t%s\n' "$score" "$rel" "$title"
  done | sort -t $'\t' -k1,1nr -k2,2 | head -n "$limit" | awk -F'\t' '{
    score = $1 / 10
    printf "%.2f  %-50s  %s\n", score, $2, $3
  }'
}
