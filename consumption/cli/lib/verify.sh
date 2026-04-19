#!/usr/bin/env bash
# ci verify — frontmatter + links + citations check for one page or the whole corpus.

# Counters kept in temp files so they survive subshells (pipes,
# command substitutions). Set up once per invocation in ci_cmd_verify.
_ci_verify_fail_file=""
_ci_verify_warn_file=""
_ci_verify_corpus=0

# Print a failure; increment counter via file.
_v_fail() {
  printf 'FAIL  %s: %s\n' "$1" "$2"
  [[ -n "$_ci_verify_fail_file" ]] && echo "F" >> "$_ci_verify_fail_file"
}
_v_warn() {
  printf 'WARN  %s: %s\n' "$1" "$2"
  [[ -n "$_ci_verify_warn_file" ]] && echo "W" >> "$_ci_verify_warn_file"
}

# Enum check
_v_check_enum() {
  local file="$1" field="$2" value="$3"
  if [[ -n "$value" && "$value" != "null" ]]; then
    if ! ci_enum_has "$field" "$value"; then
      _v_fail "$file" "frontmatter.${field}='${value}' not in enums.yaml"
    fi
  fi
}

_v_check_enum_list() {
  local file="$1" field="$2"
  ci_get_list "$file" "$field" | while read -r v; do
    [[ -z "$v" ]] && continue
    _v_check_enum "$file" "$field" "$v"
  done
}

# Check one page.
_v_verify_page() {
  local rel="$1"
  local root
  root=$(ci_repo_root)
  local file="${root}/${rel}"

  # 1. Frontmatter present
  if ! ci_has_frontmatter "$file"; then
    # Non-frontmatter file: skipped silently, unless in --strict corpus mode
    return 0
  fi

  # YAML parse check
  if ! ci_extract_frontmatter "$file" | yq eval '.' - >/dev/null 2>&1; then
    _v_fail "$rel" "frontmatter YAML does not parse"
    return 0
  fi

  # 2. Required fields
  local type title desc owner last_reviewed
  type=$(ci_get_field "$file" type)
  title=$(ci_get_field "$file" title)
  desc=$(ci_get_field "$file" description)
  owner=$(ci_get_field "$file" owner)
  last_reviewed=$(ci_get_field "$file" last_reviewed)

  [[ -n "$type" && "$type" != "null" ]] || _v_fail "$rel" "missing required field: type"
  [[ -n "$title" && "$title" != "null" ]] || _v_fail "$rel" "missing required field: title"
  [[ -n "$desc" && "$desc" != "null" ]] || _v_fail "$rel" "missing required field: description"
  [[ -n "$owner" && "$owner" != "null" ]] || _v_fail "$rel" "missing required field: owner"
  [[ -n "$last_reviewed" && "$last_reviewed" != "null" ]] || _v_fail "$rel" "missing required field: last_reviewed"

  # verified_until + reviewers required for shared/ and functions/
  case "$rel" in
    shared/*|functions/*)
      local vu reviewers
      vu=$(ci_get_field "$file" verified_until)
      reviewers=$(ci_get_list "$file" reviewers | head -n1 || true)
      [[ -n "$vu" && "$vu" != "null" ]] || _v_fail "$rel" "missing required field: verified_until"
      [[ -n "$reviewers" ]] || _v_fail "$rel" "missing required field: reviewers"
      ;;
  esac

  # 3. Date formats
  [[ -n "$last_reviewed" ]] && ! ci_is_iso_date "$last_reviewed" && _v_fail "$rel" "last_reviewed not ISO date: $last_reviewed"

  local vu
  vu=$(ci_get_field "$file" verified_until)
  if [[ -n "$vu" && "$vu" != "null" ]]; then
    ci_is_iso_date "$vu" || _v_fail "$rel" "verified_until not ISO date: $vu"
    # 6. Stale warning
    local d
    d=$(ci_days_since "$vu" 2>/dev/null || echo 0)
    if [[ "$d" -gt 0 ]]; then
      _v_warn "$rel" "verified_until passed $d days ago"
    fi
  fi

  # 4. Enum membership
  _v_check_enum "$file" type "$type"
  _v_check_enum_list "$file" motion
  _v_check_enum_list "$file" segment
  _v_check_enum_list "$file" consumers
  local confidence
  confidence=$(ci_get_field "$file" confidence)
  [[ -n "$confidence" && "$confidence" != "null" ]] && _v_check_enum "$file" confidence "$confidence"

  # 5. Description format: single line, ≤200, ends with .
  if [[ -n "$desc" ]]; then
    local desc_len=${#desc}
    [[ "$desc" == *$'\n'* ]] && _v_fail "$rel" "description has newline"
    [[ "$desc_len" -gt 200 ]] && _v_fail "$rel" "description too long ($desc_len > 200)"
    [[ "$desc" == *. || "$desc" == *! || "$desc" == *? ]] || _v_fail "$rel" "description must end with . ! or ?"
  fi

  # 7. Section labels parse (per schema/section-labels.md)
  awk '
    /^#{1,6} / {
      if (match($0, /  \{[^}]+\}$/)) {
        label = substr($0, RSTART+3, RLENGTH-4)
        # Valid pattern: key: value (, key: value)*
        if (label !~ /^[a-z_]+: [a-z-]+( , [a-z_]+: [a-z-]+)*$/ && label !~ /^[a-z_]+: [a-z-]+(, [a-z_]+: [a-z-]+)*$/) {
          printf "BAD_LABEL\t%s\t%s\n", NR, $0
        }
      }
    }
  ' "$file" | while IFS=$'\t' read -r _ lineno line; do
    _v_fail "$rel" "bad section label at line ${lineno}: ${line}"
  done

  # 8. Internal links resolve.
  # Use grep -oE + sed for portability (GNU awk's 3-arg match() is not
  # available on BSD awk shipped with macOS).
  grep -oE '\]\([^)]+\)' "$file" | sed -E 's/^\]\((.*)\)$/\1/' | while read -r target; do
    [[ -z "$target" ]] && continue
    # Skip external, anchors, images
    case "$target" in
      http*|mailto:*|'#'*|*.png|*.jpg|*.gif|*.svg) continue ;;
    esac
    # Strip anchors
    target="${target%%#*}"
    [[ -z "$target" ]] && continue
    local dir resolved
    dir=$(dirname "$file")
    resolved=$(cd "$dir" 2>/dev/null && cd "$(dirname "$target")" 2>/dev/null && pwd || true)
    if [[ -z "$resolved" ]]; then
      _v_fail "$rel" "link does not resolve: ${target}"
      continue
    fi
    resolved="${resolved}/$(basename "$target")"
    if [[ ! -e "$resolved" ]]; then
      _v_fail "$rel" "link does not resolve: ${target}"
    fi
  done

  # 9. Source references resolve
  ci_get_list "$file" sources | while read -r s; do
    [[ -z "$s" ]] && continue
    if [[ "$s" == sources/* ]]; then
      [[ -f "${root}/${s}" ]] || _v_fail "$rel" "source reference missing: ${s}"
    elif [[ "$s" == *://*" as_of:"* ]] || [[ "$s" == *://* ]]; then
      # system-query reference; basic format check
      :
    else
      _v_warn "$rel" "unusual source reference format: ${s}"
    fi
  done

  # 10. Orphan claim citations.
  # Extract everything between "[source: " and "]" in non-code-block
  # regions. Code fences (``` or ~~~) bracket example citations that
  # shouldn't count as real claims.
  local claims
  claims=$(awk '
    /^```/   { fence = !fence; next }
    /^~~~/   { fence = !fence; next }
    !fence   { print }
  ' "$file" | grep -oE '\[source: [^]]+\]' | sed -E 's/^\[source: (.*)\]$/\1/' | sort -u)

  if [[ -n "$claims" ]]; then
    local fm_sources
    fm_sources=$(ci_get_list "$file" sources | sort -u)
    while IFS= read -r c; do
      [[ -z "$c" ]] && continue
      # Skip placeholder citations used as examples (not real claims).
      case "$c" in
        *...*|*"<"*|*"{"*|*'`'*) continue ;;
      esac
      # Match exact or prefix (as_of timestamps are permitted)
      if ! grep -qFx "$c" <<< "$fm_sources"; then
        # Also allow if the first part (before " as_of:") matches
        local stripped="${c% as_of:*}"
        if ! grep -qF "$stripped" <<< "$fm_sources"; then
          _v_warn "$rel" "claim-level citation not in frontmatter sources: ${c}"
        fi
      fi
    done <<< "$claims"
  fi
}

# Corpus-wide checks: duplicate slugs, index freshness.
_v_corpus_checks() {
  local root
  root=$(ci_repo_root)
  cd "$root"

  # 11. Duplicate slugs (impossible in the filesystem, but distinct filenames across dirs are not)
  # Note: in this system a slug IS the repo-relative path, so collisions happen only on same path
  # (not a concern). We check for duplicate `title` to flag potential confusion.
  local dup
  dup=$(ci_iter_pages | while read -r r; do
    ci_has_frontmatter "$r" || continue
    local t
    t=$(ci_get_field "$r" title)
    printf '%s\t%s\n' "$t" "$r"
  done | sort | awk -F'\t' '
    NR>1 && $1 == prev_title { print prev_file "\t" $2 }
    { prev_title = $1; prev_file = $2 }
  ')
  if [[ -n "$dup" ]]; then
    while IFS=$'\t' read -r a b; do
      _v_warn "corpus" "duplicate title between ${a} and ${b}"
    done <<< "$dup"
  fi

  # 13. index.md current (implemented inside reindex.sh --check)
  # The check is done separately by `ci reindex --check`.
}

ci_cmd_verify() {
  local all=0 strict=0 target=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --all) all=1; shift ;;
      --strict) strict=1; shift ;;
      -h|--help)
        cat <<'EOF'
ci verify <slug> | ci verify --all [--strict]

Per-page checks:
  frontmatter present + parses; required fields; enum membership; date
  formats; description format; section labels; internal links; source
  references; claim-citation consistency.

Corpus-wide (--all):
  duplicate titles; index.md freshness (run via `ci reindex --check`).

Exit 0 ok, 1 page failure, 2 corpus failure, 3 usage error.
EOF
        return 0 ;;
      -*) ci_err "verify: unknown flag: $1"; return 3 ;;
      *) target="$1"; shift ;;
    esac
  done

  # Temp-file counters survive subshells/pipes.
  _ci_verify_fail_file=$(mktemp 2>/dev/null || mktemp -t ci-verify-fail)
  _ci_verify_warn_file=$(mktemp 2>/dev/null || mktemp -t ci-verify-warn)
  : > "$_ci_verify_fail_file"
  : > "$_ci_verify_warn_file"

  if [[ $all -eq 1 ]]; then
    local rel
    while read -r rel; do
      _v_verify_page "$rel"
    done < <(ci_iter_pages)
    _v_corpus_checks
    _ci_verify_corpus=1
  elif [[ -n "$target" ]]; then
    local path
    path=$(ci_resolve_slug "$target") || return 1
    _v_verify_page "$path"
  else
    ci_err "verify: supply a slug or --all"
    return 3
  fi

  local fail_count warn_count
  fail_count=$(wc -l < "$_ci_verify_fail_file" | tr -d ' ')
  warn_count=$(wc -l < "$_ci_verify_warn_file" | tr -d ' ')
  rm -f "$_ci_verify_fail_file" "$_ci_verify_warn_file"

  printf '\n'
  printf 'verify: %d fail, %d warn\n' "$fail_count" "$warn_count"

  [[ "$fail_count" -gt 0 ]] && return 1
  return 0
}
