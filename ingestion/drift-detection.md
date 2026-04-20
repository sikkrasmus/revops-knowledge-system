---
type: meta
title: Drift Detection
description: Lint-pass spec for three freshness signals — source drift, verification stale, contradiction.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Drift Detection

The weekly lint-pass spec. Three freshness signals, how they're detected, how they're flagged, how they generate reconciliation PRs.

**Phase 0 / v1**: documented mechanics, operator-runnable as a manual pass. Not fully wired into CI (Stage 2 concern). `ci verify` enforces some mechanical checks (verified_until, frontmatter); the full drift pass runs via a separate script that operators run weekly.

---

## The three signals

| Signal | Meaning | Detection | Frontmatter flag |
|---|---|---|---|
| **Source drift** | Source changed since snapshot | Webhook or weekly lint (content hash compare, or system-specific diff) | `source_drift: true` |
| **Verification stale** | `verified_until` passed; no re-confirmation | Date check: `today > verified_until` | `verification_stale: true` |
| **Contradiction** | Another page now cites a conflicting claim | Weekly lint, graph-aware | `has_contradiction: [<paths>]` |

## Signal 1 — Source drift

### For in-repo sources (`sources/`)

These are snapshots — they don't "drift" in the file sense. Drift here means the original source system content has changed:

- **Confluence / Notion / Drive docs**: compare source URL's current content-hash with hash at `source_captured_at`. If different: drift.
- **Deal reviews / calls**: typically no re-capture. Drift is rare.
- **Contracts**: only if renegotiated. Tracked via legal system, not automated.

### For system-query sources

These are point-in-time queries. Drift here means the current query result differs from the snapshotted answer:

- **CRM queries** (`hubspot://`, `salesforce://`): re-run the query, compare. Thresholds per source (see connector spec).
- **Usage data** (`stripe://`): typically the wiki synthesizes patterns; drift threshold is bigger.

### When drift fires

1. The wiki page that cites the drifted source gets `source_drift: true` in frontmatter.
2. The lint pass appends a `drift-detected` entry to `log.md`.
3. An issue is opened using [`artifact-commit/issue-templates/source-drift.md`](artifact-commit/issue-templates/source-drift.md).
4. A reconciliation PR is expected within a SLA (TBD per content class — pricing: 7 days; positioning: 30 days).
5. **Nothing auto-rewrites the page.** Reconciliation is a judgment call.

## Signal 2 — Verification stale

### Mechanics

- `verified_until` is an ISO date on every `shared/` and `functions/` page.
- `ci verify` checks `today > verified_until`.
- Default verification windows by content class:

| Content class | Default window |
|---|---|
| Pricing / discount-guardrails | 90 days |
| ICP tiers | 90 days |
| Positioning strategic | 180 days |
| Product-and-packaging | 90 days |
| Personas | 180 days |
| Competitive intel profiles | 90 days |
| Data definitions | 365 days |
| Function-specific playbooks | 180 days |

### When verification-stale fires

1. `verification_stale: true` set in frontmatter (mechanically).
2. Page surfaces in `ci stale` output.
3. Weekly lint pass logs to `log.md` which pages went stale this week.
4. Re-verification PR from owner refreshes `last_reviewed` and extends `verified_until`.

A page can stay stale — that's an operational choice — but it shows up in `ci stale` every week until handled. Pages that stay stale for more than 2 verification windows get a `confidence: low` demotion automatically.

## Signal 3 — Contradiction

### Detection

Graph-aware lint that compares claims across pages:

1. **Same fact, different value** — two pages both claim NRR benchmark, different numbers.
2. **Page A cites X; Page B cites ¬X** — requires claim extraction from page body.
3. **Source reference mismatch** — two pages cite the same source but report different synthesized claims.

V1 detection is regex + frontmatter pattern matching for the common cases. Full claim-extraction (LLM-based) is Phase 4.

### When contradiction fires

1. `has_contradiction: [<paths-of-conflicting-pages>]` added to both pages.
2. Issue opened using [`artifact-commit/issue-templates/contradiction.md`](artifact-commit/issue-templates/contradiction.md).
3. Reconciliation PR required before either page's next edit.

## How the lint pass runs

### Phase 0 posture

**Operator-runnable.** A Bash script reads all pages, applies the signal-detection logic, writes flags to frontmatter (via PR, not direct write), and opens issues.

```bash
# From repo root
./scripts/drift-lint.sh  # illustrative; Phase 0 ships as manual procedure
```

Detailed step-by-step in the lint-pass spec below.

### Phase 2+ posture

Wire into GitHub Actions on a schedule (weekly). Opens issues programmatically. Opens reconciliation PRs as drafts for reviewer to pick up.

## Lint pass step-by-step (for the Phase 0 manual run)

For each `.md` file in `shared/`, `functions/`, `sources/`:

1. Parse frontmatter (`yq`).
2. If `verified_until < today`: set `verification_stale: true` (open a PR with this single-field change).
3. For each source reference in `sources:` list:
   - File reference: confirm file exists and content-hash matches stored hash (if we track it).
   - System-query reference: re-run via connector (if implemented); compare to snapshot. Set `source_drift: true` if diff.
4. For each pair of pages in the same category (ICP tiers, metric definitions, competitor profiles): cross-compare structured frontmatter fields and known numeric claims.
5. Append a summary to `log.md` with counts and list of affected pages.

## What the lint pass does NOT do

- **Never overwrites page content.** It only adds flags and opens PRs/issues.
- **Never auto-resolves contradictions.** Always PR with human decision.
- **Never reduces `verified_until`.** Only humans (via PR) do that.

## Related

- [`pr-workflow.md`](pr-workflow.md) — graduated trust + reviewer routing
- [`artifact-commit/issue-templates/`](artifact-commit/issue-templates/) — issue templates for the three signals
- [`../schema/frontmatter.md`](../schema/frontmatter.md) — the flag fields
- [`../consumption/cli/README.md`](../consumption/cli/README.md) — `ci verify` and `ci stale` commands
