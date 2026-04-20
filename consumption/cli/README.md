---
type: meta
title: ci CLI
description: Bash + yq CLI for the Company Index. Eleven commands wrapping grep, frontmatter filters, and the navigation trio.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# `ci` CLI

Bash + `yq` convenience wrappers around grep, find, frontmatter filtering, and the navigation trio. Zero runtime install beyond `yq` (shellcheck-friendly). Agents invoke via the Bash tool; humans rarely run directly — they ask Claude, which runs bash.

---

## Install

```bash
# Clone the repo (or fork into your org)
git clone git@github.com:sikkrasmus/revops-knowledge-system.git
cd revops-knowledge-system

# Install yq if you haven't
brew install yq    # macOS
# apt install yq   # Ubuntu

# Optional: add ci to PATH
ln -s "$PWD/consumption/cli/ci" /usr/local/bin/ci
```

Or just invoke via path: `./consumption/cli/ci <command>`.

## Commands

| Command | Purpose |
|---|---|
| `ci list [--type T] [--function F] [--motion M] [--segment S] [--consumer C]` | List pages matching frontmatter filters |
| `ci show <slug> [--section-filter "key=value"]` | Print a page with resolved cross-references |
| `ci search "<query>" [--limit N]` | Ranked grep (title + description + body + recency) |
| `ci sources <slug>` | Show raw sources backing a page's claims |
| `ci graph <slug>` | Inbound + outbound links for a page |
| `ci pending` | Open PRs on the wiki (`gh pr list` wrapper) |
| `ci diff <pr-number>` | Show pending changes + reviewer routing classification |
| `ci verify <slug-or-path>` | Freshness + schema check for a single page |
| `ci verify --all [--strict]` | Walk corpus; run all per-page + corpus-wide checks |
| `ci stale` | Corpus-wide staleness + drift report |
| `ci log [--since <duration>] [--type <event>]` | Filtered read of `log.md` |
| `ci reindex [--check]` | Regenerate `index.md` from frontmatter; `--check` exits non-zero if stale |

All commands: `ci -h` or `ci <command> -h`.

## Exit codes

- `0` — success
- `1` — per-page check failed / page not found / command failed
- `2` — corpus-wide check failed (duplicate slugs, stale index)
- `3` — usage error (bad arguments)

## Slug convention

A page's slug is its **repo-relative path without the `.md` extension**. Examples:

| File | Slug |
|---|---|
| `shared/icp/tier-1.md` | `shared/icp/tier-1` |
| `shared/pricing/price-book.md` | `shared/pricing/price-book` |
| `functions/sales/README.md` | `functions/sales/README` |

CLI tolerance:

- Trailing `.md` accepted but stripped.
- Leading `./` accepted but stripped.
- Bare filename without path is rejected with a disambiguation prompt unless unique.

## Filter semantics (`ci list`)

- Multiple filter flags AND together.
- List values in frontmatter match if any flag value is in the list (e.g., `--motion plg` matches pages with `motion: [plg, sales-assisted]`).
- Unknown enum values error out.

## Search ranking (`ci search`)

Score formula:

```
score = 2 × title_match_count
      + 1.5 × description_match_count
      + 1 × body_match_count
      + recency_boost

recency_boost = 0.5 if last_reviewed within 30 days
              = 0.25 if within 90 days
              = 0 otherwise
```

Tied scores sort alphabetically by slug. Top 20 by default; `--limit N` to override.

## Scope — what the CLI sees

**Skip list** (not walked by any command):

- `.git/`, `.github/`, `node_modules/`
- Hidden files / directories (name starts with `.`)
- `docs/` (long-form explanatory docs, not cataloged)
- `schema/page-templates/` (author templates, not content)
- `index.md`, `log.md` (automation-maintained; self-exclude)

**Markdown files without frontmatter** are silently skipped by `list`, `search`, `reindex`, and `verify` (the SPEC rule — "skip if no frontmatter block"). If you author a new page and want it cataloged, add frontmatter.

## Common helpers (`lib/common.sh`)

Shared utilities for subscripts. Functions:

- `ci_repo_root` — finds repo root by walking up for `.git` or `CLAUDE.md`
- `ci_iter_pages` — emits all markdown files in scope (respecting skip list)
- `ci_parse_frontmatter <file>` — emits `key=value` lines from frontmatter
- `ci_get_field <file> <field>` — gets one frontmatter field
- `ci_resolve_slug <input>` — canonicalizes slug
- `ci_is_source <path>` — whether a source reference resolves

## Tests

`consumption/cli/tests/smoke.sh` runs each command against a fixture corpus in `consumption/cli/tests/fixtures/`. Part of `verify.yml` CI.

```bash
./consumption/cli/tests/smoke.sh
```

## SKILL for Claude Code / Cowork

See [`../SKILL.md`](../SKILL.md). Registers `ci` as the canonical retrieval path for this corpus.
