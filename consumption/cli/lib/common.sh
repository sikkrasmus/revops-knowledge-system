#!/usr/bin/env bash
# Common helpers sourced by ci subcommands.
# NOTE: strict mode is intentionally NOT set here — helpers are called
# from pipelines where non-zero exits are expected control flow
# (filter-fail = skip). The `ci` entrypoint sets -u; -e is avoided to
# keep pipeline filters ergonomic.

# ---------- Repo root ----------
ci_repo_root() {
  local dir="${CI_REPO_ROOT:-$PWD}"
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir/.git" ]] || [[ -f "$dir/CLAUDE.md" && -f "$dir/index.md" ]]; then
      printf '%s\n' "$dir"
      return 0
    fi
    dir=$(dirname "$dir")
  done
  echo "ci: cannot find repo root (looked for .git/ or CLAUDE.md+index.md)" >&2
  return 1
}

# ---------- Scope ----------
# Skip list: directories and files never considered by ci.
_ci_skip_paths=(
  ".git"
  ".github"
  "node_modules"
  "docs"
  "schema/page-templates"
)

_ci_skip_files=(
  "index.md"
  "log.md"
  "LAUNCH-PLAN.md"
  "PHASES.md"
)

# Is the given repo-relative path skipped?
ci_is_skipped() {
  local rel="$1"
  case "$rel" in
    .*|*/.*) return 0 ;;  # hidden files/dirs
  esac
  local p
  for p in "${_ci_skip_paths[@]}"; do
    case "$rel" in
      "$p"|"$p"/*) return 0 ;;
    esac
  done
  local f
  for f in "${_ci_skip_files[@]}"; do
    [[ "$rel" == "$f" ]] && return 0
  done
  return 1
}

# Emit all .md files in scope as repo-relative paths.
ci_iter_pages() {
  local root
  root=$(ci_repo_root)
  (
    cd "$root"
    find . -type f -name '*.md' -print 2>/dev/null | sed 's|^\./||' | sort | while read -r rel; do
      if ! ci_is_skipped "$rel"; then
        printf '%s\n' "$rel"
      fi
    done
  )
}

# ---------- Frontmatter ----------
# Has the file a frontmatter block?
ci_has_frontmatter() {
  local f="$1"
  [[ -f "$f" ]] || return 1
  local first
  first=$(head -n1 "$f" 2>/dev/null || true)
  [[ "$first" == "---" ]]
}

# Extract the raw YAML frontmatter of a file to stdout.
ci_extract_frontmatter() {
  local f="$1"
  [[ -f "$f" ]] || return 1
  awk '
    BEGIN { in_fm=0; count=0 }
    /^---$/ {
      count++
      if (count==1) { in_fm=1; next }
      if (count==2) { exit }
    }
    in_fm { print }
  ' "$f"
}

# Get a single frontmatter field value (scalar or list as YAML).
# Usage: ci_get_field <file> <field>
ci_get_field() {
  local f="$1"
  local field="$2"
  ci_extract_frontmatter "$f" | yq eval ".${field} // \"\"" - 2>/dev/null || true
}

# Get a list field as newline-separated values.
# Usage: ci_get_list <file> <field>
ci_get_list() {
  local f="$1"
  local field="$2"
  ci_extract_frontmatter "$f" | yq eval ".${field}[]?" - 2>/dev/null || true
}

# ---------- Slug resolution ----------
# Normalize a user input to a repo-relative path (with .md).
ci_resolve_slug() {
  local input="$1"
  # Strip leading ./
  input="${input#./}"
  # Strip trailing .md if present; we'll add it back
  input="${input%.md}"
  local path="${input}.md"
  local root
  root=$(ci_repo_root)
  if [[ -f "${root}/${path}" ]]; then
    printf '%s\n' "$path"
    return 0
  fi
  # Try bare filename match (unique only)
  local matches
  matches=$(ci_iter_pages | grep -F "/${input}.md" | grep -v '^$' || true)
  local count
  count=$(printf '%s\n' "$matches" | grep -c . || true)
  if [[ "$count" == "1" ]]; then
    printf '%s\n' "$matches"
    return 0
  fi
  if [[ "$count" == "0" ]]; then
    echo "ci: slug not found: ${input}" >&2
    return 1
  fi
  echo "ci: ambiguous slug ${input}; candidates:" >&2
  printf '  %s\n' $matches >&2
  return 1
}

# ---------- Enums ----------
# Load enums.yaml once into cache; query membership.
_ci_enums_cache=""

_ci_load_enums() {
  local root
  root=$(ci_repo_root)
  local f="${root}/schema/enums.yaml"
  if [[ ! -f "$f" ]]; then
    _ci_enums_cache="__missing__"
    return 0
  fi
  _ci_enums_cache=$(cat "$f")
}

# Check whether <value> is in enum <field>.
# Usage: ci_enum_has <field> <value>
ci_enum_has() {
  local field="$1"
  local value="$2"
  [[ -z "$_ci_enums_cache" ]] && _ci_load_enums
  [[ "$_ci_enums_cache" == "__missing__" ]] && return 1
  printf '%s\n' "$_ci_enums_cache" | yq eval ".${field}[] | select(. == \"${value}\")" - 2>/dev/null | grep -q .
}

# ---------- Dates ----------
# ISO date validation.
ci_is_iso_date() {
  local d="$1"
  [[ "$d" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]
}

# Compute days since an ISO date. Negative = in future.
ci_days_since() {
  local d="$1"
  ci_is_iso_date "$d" || { echo 0; return; }
  local today today_s d_s
  today=$(date -u +%Y-%m-%d)
  if date -j >/dev/null 2>&1; then
    # BSD date (macOS)
    today_s=$(date -j -f %Y-%m-%d "$today" +%s 2>/dev/null || echo 0)
    d_s=$(date -j -f %Y-%m-%d "$d" +%s 2>/dev/null || echo 0)
  else
    # GNU date
    today_s=$(date -d "$today" +%s 2>/dev/null || echo 0)
    d_s=$(date -d "$d" +%s 2>/dev/null || echo 0)
  fi
  echo $(( (today_s - d_s) / 86400 ))
}

# ---------- Output helpers ----------
ci_err() {
  printf 'ci: %s\n' "$*" >&2
}

ci_debug() {
  [[ -n "${CI_DEBUG:-}" ]] && printf 'ci[debug]: %s\n' "$*" >&2
  return 0
}
