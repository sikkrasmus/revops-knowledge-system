---
type: meta
title: Commit Conventions
description: Commit-message format for changes in this corpus.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
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
- Imperative mood: "add tier 1 ICP" not "added" / "adding".
- Specific: "update NRR definition to include cohort-fixing note" not "update NRR".
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
Previously listed as "typically" — promoting to required.

Sources:
- sources/internal-docs/2026-04-01-q1-deal-review.md
- hubspot://deals?stage=closed-won&discount>0.18&segment=mid-market as_of:2026-04-19
```

```
fix: broken link from shared/pricing/README.md to functions/sales/
```

```
chore: rename shared/positioning/elevator-pitch.md → elevator-pitches.md

Downstream inbound links updated in 7 pages.
```

## Automation-generated commits

`log-append.yml` commits use `github-actions[bot]` identity with `[skip ci]` in the subject to prevent verify-loop triggering. See `.github/workflows/log-append.yml` at the repo root.

Sentinel commits:

- `[bootstrap]` in the commit subject allows `ci reindex --check` to skip verification for that commit only. Used exactly once — the initial reindex per the CI bootstrap policy documented alongside the workflow. See [`../../PRINCIPLES.md`](../../PRINCIPLES.md) and the workflow file comments.

## Attribution

Per global git config (`commit.author`), commits use the repo owner's identity. No `Co-Authored-By` trailer on LLM-authored commits — attribution is intentionally disabled repo-wide.

## Related

- [`pr-template.md`](pr-template.md) — PR description template
- [`../pr-workflow.md`](../pr-workflow.md) — routing and approval rules
