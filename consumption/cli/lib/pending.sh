#!/usr/bin/env bash
# ci pending — list open PRs on the wiki.

ci_cmd_pending() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|--help)
        cat <<'EOF'
ci pending

Wraps `gh pr list`. Requires gh installed + authenticated.
EOF
        return 0 ;;
      *) shift ;;
    esac
  done

  if ! command -v gh >/dev/null 2>&1; then
    ci_err "pending: requires 'gh' (GitHub CLI) installed and authenticated"
    return 1
  fi

  local root
  root=$(ci_repo_root)
  cd "$root"

  gh pr list --state open --json number,title,author,updatedAt,labels \
    --template '{{range .}}#{{.number}}  {{.title}} ({{.author.login}}, {{timeago .updatedAt}}){{"\n"}}{{end}}'
}
