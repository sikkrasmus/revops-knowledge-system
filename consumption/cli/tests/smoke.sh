#!/usr/bin/env bash
# smoke.sh — minimal end-to-end checks for each ci command.
# Run from repo root: ./consumption/cli/tests/smoke.sh
# Exit 0 all pass; exit 1 any failure.

set -u

_pass=0
_fail=0

_check() {
  local label="$1"
  local cmd="$2"
  local expect="${3:-}"   # optional — substring expected in output
  local out
  out=$(eval "$cmd" 2>&1)
  local rc=$?
  if [[ $rc -ne 0 && "$label" != *"expect-fail"* ]]; then
    printf 'FAIL  %s  (exit %d)\n' "$label" "$rc"
    _fail=$((_fail + 1))
    return
  fi
  if [[ -n "$expect" ]] && ! grep -qF -- "$expect" <<< "$out"; then
    printf 'FAIL  %s  (expected substring: %s)\n' "$label" "$expect"
    _fail=$((_fail + 1))
    return
  fi
  printf 'PASS  %s\n' "$label"
  _pass=$((_pass + 1))
}

cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

CI=./consumption/cli/ci

echo "== ci command smoke test =="
_check "help"                   "$CI --help"                                 "ci <command>"
_check "version"                "$CI --version"                              "ci "
_check "unknown-command expect-fail"  "$CI nope"                             ""
_check "list no-filter"         "$CI list"
_check "list type=icp"          "$CI list --type icp"                         "tier"
_check "list motion=plg"        "$CI list --motion plg"                       "elevator-pitches"
_check "show shared/icp/tier-1" "$CI show shared/icp/tier-1"                  "Tier 1 ICP"
_check "search discount"        "$CI search discount"                         "discount-guardrails"
_check "sources page"           "$CI sources shared/icp/tier-1"               "Frontmatter sources"
_check "graph page"             "$CI graph shared/pricing/price-book"         "INBOUND"
_check "log all"                "$CI log"                                     ""
_check "reindex --check"        "$CI reindex --check"                         "current"
# verify returns 1 when corpus has failures; smoke test expects it to run at
# minimum without crashing, so we check only for output shape.
_check "verify single page"     "$CI verify shared/pricing/price-book"        "verify:"
_check "stale report"           "$CI stale"                                   "Stale verifications"

# `pending` and `diff` require gh auth; skip in smoke if unavailable.
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  _check "pending"              "$CI pending"                                 ""
  # diff requires a live PR number — skip by default.
else
  echo "SKIP  pending / diff (gh not authenticated)"
fi

printf '\nsmoke: %d pass, %d fail\n' "$_pass" "$_fail"
[[ "$_fail" -eq 0 ]]
