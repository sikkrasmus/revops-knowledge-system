---
type: meta
title: Commit Conventions
description: Commit-message format for changes in this corpus, plus the automation-commit and bootstrap-commit rules.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# Commit Conventions

Commit messages follow a minimal conventional-commits subset.

---

## Format

```
<type>: <imperative, specific description>

<optional body>
```

### Types

| Type | When to use |
|---|---|
| `feat` | New content: new page, new section, new metric definition |
| `update` | Update to existing content (non-trivial) |
| `fix` | Fix to incorrect claim, broken link, frontmatter error |
| `docs` | Changes to meta-docs (README, PRINCIPLES, schema/) |
| `chore` | Housekeeping: rename, move, dependency update |
| `refactor` | Restructure without content change |
| `revert` | Revert a previous commit |

### Subject line rules

- Lowercase after the type prefix.
- Imperative mood: "add tier 1 ICP", not "added" or "adding".
- Specific: "update NRR definition to include cohort-fixing note", not "update NRR".
- Under 80 chars.

### Body

Optional. Use for:

- Why this change (when not obvious from subject).
- Source citations for factual updates.
- Affected downstream pages if cross-cutting.
- `[source: ...]` citations for claim-backed changes.

## Examples

```
feat: add tier-1 ICP with firmographics and triggers
```

```
update: refine discount guardrails strategic-exception band

Observed pattern from last 12 closed deals: all 12 had 3-year term.
Previously listed as "typically", promoting to required.

Sources:
- sources/internal-docs/2026-04-01-q1-deal-review.md
- hubspot://deals?stage=closed-won&discount>0.18&segment=mid-market as_of:2026-04-19
```

```
fix: broken link from shared/pricing/README.md to functions/sales/
```

```
chore: rename shared/positioning/elevator-pitch.md to elevator-pitches.md

Downstream inbound links updated in 7 pages.
```

## Automation-generated commits

Two automation patterns commit to the repo. Both have rules.

### `[skip ci]` on log-append commits

`log-append.yml` (`.github/workflows/log-append.yml`) appends a one-line entry to `log.md` after every PR merge. That commit carries `[skip ci]` in its subject so `verify.yml` doesn't re-run on the append itself. Without `[skip ci]`, verify would run for every log entry, which is wasteful and creates a feedback loop where a verify failure on a log-append could block subsequent merges.

Identity: `github-actions[bot]`. Subject format: `chore: append pr-merged entry to log.md [skip ci]`.

### `[bootstrap]` sentinel for the initial reindex

The `[bootstrap]` token in a commit subject tells `ci reindex --check` to skip its staleness check for that one commit only. It exists for one reason: the initial reindex commit when the repo is first set up. At that point, `index.md` is being created from scratch, so there is nothing to compare against.

Used exactly once per repo. After the bootstrap commit, every subsequent push runs `ci reindex --check` normally, and CI fails on a stale `index.md`.

The behavior is implemented in `consumption/cli/lib/reindex.sh` and referenced from `.github/workflows/verify.yml`.

## Attribution

Per global git config (`commit.author`), commits use the repo owner's identity. No `Co-Authored-By` trailer on LLM-authored commits. Attribution is intentionally disabled repo-wide.

## Related

- [`pr-template.md`](pr-template.md), PR description template
- [`../pr-workflow.md`](../pr-workflow.md), routing and approval rules
