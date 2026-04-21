#!/usr/bin/env bash
# ci diff — show pending changes + reviewer routing classification.

ci_cmd_diff() {
  local pr=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|--help)
        cat <<'EOF'
ci diff <pr-number>

Shows the PR's diff summary (via gh) and classifies affected
directories for reviewer routing per ingestion/pr-workflow.md.
EOF
        return 0 ;;
      -*) ci_err "diff: unknown flag: $1"; return 3 ;;
      *) pr="$1"; shift ;;
    esac
  done

  [[ -n "$pr" ]] || { ci_err "diff: PR number required"; return 3; }

  if ! command -v gh >/dev/null 2>&1; then
    ci_err "diff: requires 'gh' (GitHub CLI) installed and authenticated"
    return 1
  fi

  local root
  root=$(ci_repo_root)
  cd "$root"

  echo "# PR #${pr} diff summary"
  gh pr diff "$pr" --name-only 2>/dev/null || { ci_err "diff: could not fetch PR #${pr}"; return 1; }

  echo ""
  echo "# Routing classification (per ingestion/pr-workflow.md)"
  gh pr diff "$pr" --name-only 2>/dev/null | sort -u | while read -r f; do
    local route="(unclassified)"
    case "$f" in
      shared/icp/*)                    route="RevOps lead; co-reviewers: Sales lead, Marketing lead" ;;
      shared/personas/*)               route="Sales lead; co-reviewers: Marketing lead, CS lead" ;;
      shared/product-and-packaging/*)  route="Product lead; co-reviewers: RevOps lead, Finance lead" ;;
      shared/pricing/*)                route="RevOps lead; co-reviewers: Finance lead, Sales lead" ;;
      shared/positioning/*)            route="Marketing lead; co-reviewers: Sales lead, Product lead" ;;
      shared/competitive-intel/*)      route="Marketing lead; co-reviewers: Sales lead, Product lead" ;;
      shared/data-definitions/*)      route="RevOps lead; co-reviewers: Finance lead" ;;
      functions/sales/*)               route="Sales lead; co-reviewer: RevOps lead" ;;
      functions/marketing/*)           route="Marketing lead" ;;
      functions/customer-success/*)    route="CS lead; co-reviewer: Sales lead" ;;
      functions/support/*)             route="Support lead" ;;
      functions/revops/*)              route="RevOps lead; co-reviewer: Finance lead" ;;
      functions/finance-legal/*)       route="Finance lead; co-reviewer: Legal" ;;
      sources/*)                       route="RevOps lead; co-reviewer: Legal on PII-sensitive" ;;
      ingestion/*|schema/*)            route="RevOps lead" ;;
      README.md|CLAUDE.md|PRINCIPLES.md) route="Repo owner" ;;
    esac
    printf '  %-50s  %s\n' "$f" "$route"
  done
}
