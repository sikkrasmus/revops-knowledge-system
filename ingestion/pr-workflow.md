---
type: meta
title: PR Workflow
description: Graduated trust model, reviewer routing, and PR etiquette for every change in the corpus.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# PR Workflow

The canonical HITL governance pattern. Graduated trust (from [`../PRINCIPLES.md`](../PRINCIPLES.md) §6), reviewer routing, and PR etiquette. Every change — human, LLM, or automated — flows through this.

---

## 1. Graduated trust

Trust is earned in stages. At each stage, the default behavior for a change class is "PR to human" or "auto-merge with post-hoc audit."

| Stage | Timeline | What auto-merges |
|---|---|---|
| **Stage 1 — Gated** | Months 0-3 | Nothing. 100% PR. Build human confidence in the corpus and in the LLM's change quality. |
| **Stage 2 — Routine autonomy** | Months 3-6 | Cross-reference updates, backlinks, format fixes, single-canonical-source factual updates where the source is authoritative (e.g., updated price list → pricing page with matching citation). |
| **Stage 3 — Pattern autonomy** | Months 6+ | Multi-source consensus changes (sources agree), pattern-matched changes (similar change accepted N times), high-trust contributor changes. |

**Phase 0 / v1 is Stage 1.** Auto-merge is not wired into CI. The [`auto-merge-rules.yaml`](auto-merge-rules.yaml) file ships as concept for operators who move to Stage 2 later.

## 2. Content-type dimension

Orthogonal to maturity stage. Some content types always PR, regardless of stage.

### Always PR (never auto-merge, at any stage)

- ICP definition changes (`shared/icp/`)
- Pricing & discounting (`shared/pricing/`)
- Product & packaging changes (`shared/product-and-packaging/`)
- Legal / compliance posture (`functions/finance-legal/`, Phase 2)
- Positioning & messaging strategic changes (`shared/positioning/`)
- Competitor counter-positioning strategic changes (`shared/competitive-intel/counters` in sales battlecards)
- New page creation (anywhere)
- Page deletion (anywhere)
- Any change flagged `source_drift: true` where the drift is large
- Any change to `schema/`
- Any change to `ingestion/`

### Always auto-mergeable (from Stage 2 on)

- Backlink updates (page A moved → update links in all citing pages)
- Cross-reference fixes (broken internal link → canonical target)
- Frontmatter `last_reviewed` timestamp updates (no content change)
- Broken-link fixes with canonical replacements

### Everything else

Falls in the middle. Stage determines auto-merge vs. PR.

## 3. Reviewer routing

Review ownership follows directory. Each directory has a designated owner and co-authors, documented in the directory's README.

### Default routing

| Directory | Primary reviewer | Required co-reviewers on substantive changes |
|---|---|---|
| `shared/icp/` | RevOps lead | Sales lead, Marketing lead |
| `shared/personas/` | Sales lead | Marketing lead, CS lead |
| `shared/product-and-packaging/` | Product lead | RevOps lead, Finance lead |
| `shared/pricing/` | RevOps lead | Finance lead, Sales lead |
| `shared/positioning/` | Marketing lead | Sales lead, Product lead |
| `shared/competitive-intel/` | Marketing lead | Sales lead, Product lead |
| `shared/data-definitions/` | RevOps lead | Finance lead |
| `functions/sales/` | Sales lead | RevOps lead |
| `functions/marketing/` | Marketing lead | — |
| `functions/customer-success/` | CS lead | Sales lead |
| `functions/support/` | Support lead | — |
| `functions/revops/` | RevOps lead | Finance lead |
| `functions/finance-legal/` | Finance lead | Legal |
| `sources/` | RevOps lead | Legal on PII-sensitive |
| `ingestion/` | RevOps lead | — |
| `schema/` | RevOps lead | — |
| Root docs (`README.md`, `CLAUDE.md`, etc.) | Repo owner | — |

### Cross-directory changes

A PR touching multiple directories requires all affected primary reviewers to approve. Single reviewer can't rubber-stamp a cross-functional change.

### Escalation

- **Strategic content changes** (always-PR list above) — when reviewers disagree, escalate to the content's executive sponsor (CRO for sales-adjacent, CMO for marketing-adjacent, etc.).
- **Source of truth conflicts** — when two sources contradict and reviewers can't resolve, the function that owns the most downstream consumers decides.
- **Lint-exception requests** — when an automated check blocks a change that a human believes should merge, the change request goes to RevOps lead.

## 4. Conflict-resolution policy

When a PR surfaces a contradiction (new source conflicts with existing page or with another source):

1. **Do not overwrite silently.** Frontmatter `has_contradiction: [<conflicting-source-or-page>]` flag added.
2. **Both sources cited** in the PR description.
3. **Precedence applied** per [`../schema/authoring-contract.md`](../schema/authoring-contract.md) §2 (signed/dated > recorded conversation > recent internal written > synthesized > email/chat).
4. **If precedence cannot resolve**, the call hands to the page's primary reviewer.
5. **Merge logs to `log.md`** via `log-append.yml` workflow.

## 5. PR etiquette

Every LLM-authored PR includes:

- **Clear title** following [`artifact-commit/commit-conventions.md`](artifact-commit/commit-conventions.md).
- **Summary** — what changed, why, which function(s) are affected.
- **Sources cited** — every factual claim in the PR description links to its source.
- **Affected consumers** — use `ci graph` to enumerate pages that cite the changed page.
- **Confidence score** — `low` / `medium` / `high` (heuristic in v1).
- **Lint status** — attach `ci verify` output.
- **Change class** — map to [`auto-merge-rules.yaml`](auto-merge-rules.yaml) categories so reviewer knows what gate applies.

Use the template in [`artifact-commit/pr-template.md`](artifact-commit/pr-template.md).

## 6. Human-authored PRs

Humans authoring directly follow the same contract — frontmatter, citations, review routing. The exception: a human making an obvious local fix (typo, broken link) can self-merge if the change is in their directory of ownership and the fix is trivially verifiable.

## 7. Rollback

Every change — auto-merged or PR'd — is `git revert`-able. The revert itself is a PR:

- Reverts of strategic content require the original PR's reviewers to approve.
- Reverts of routine auto-merges can be expedited.
- All reverts append to `log.md` with the original PR referenced.

## 8. Periodic audits

Separate from per-PR review:

- **Weekly**: `ci stale` report reviewed by RevOps lead. Triage: needs-reverify vs. needs-reconciliation vs. acceptable staleness.
- **Monthly**: sample audit of auto-merged PRs from the past month. Confirm quality hasn't degraded.
- **Quarterly**: review `auto-merge-rules.yaml` — which classes move up a stage, which demote, which new ones.

## Related

- [`../schema/authoring-contract.md`](../schema/authoring-contract.md) — editing rules
- [`auto-merge-rules.yaml`](auto-merge-rules.yaml) — change-class matrix
- [`drift-detection.md`](drift-detection.md) — how drift surfaces into PRs
- [`artifact-commit/`](artifact-commit/) — v1 ingestion path
