---
type: meta
title: Data Definitions
description: Opinionated, research-grounded metric and KPI definitions. The definitions layer.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - finance-lead
last_reviewed: 2026-04-19
verified_until: 2027-04-19
---

# Data Definitions

The "definitions layer." Every metric, KPI, funnel stage, or commercial term used across the company has a single definition here. Opinionated — we take a position, cite the research that backs it, and document the common misdefinitions we reject.

Template: [`../../schema/page-templates/shared/metric-definition.md`](../../schema/page-templates/shared/metric-definition.md).

---

## Structure

All metric definitions live under [`metrics/`](metrics/). One file per metric.

Phase 0 example included: [`metrics/nrr.md`](metrics/nrr.md). The full Phase 0 set that an in-production fork should fill:

- `mql.md`, `sql.md`, `sal.md` — funnel stages
- `arr.md`, `mrr.md` — recurring revenue
- `logo-churn.md`, `revenue-churn.md` — churn variants
- `nrr.md`, `grr.md` — retention
- `cac.md`, `payback.md` — acquisition economics
- `pipeline-coverage.md` — forecasting

## Ownership

- **Owner**: RevOps lead (RevOps owns data definitions by default).
- **Co-authors**: Finance lead (financial metrics), Marketing lead (funnel metrics), CS lead (retention metrics).
- **Consumers**: All functions. Every downstream metric calculation references here.

## Why opinionated

The industry cannot agree on basic definitions (MQL vs. MAL vs. MQA; NRR including logo vs. net-new; CAC fully-loaded vs. sales-only). A company that tries to stay neutral gets contradictions across functions: Marketing's MQL definition doesn't match Sales's SQL threshold, and Finance reports a third version to the board.

This directory takes a position. Every metric page:

- States the definition unambiguously.
- Shows the formula with variable definitions.
- Provides a worked example.
- Cites benchmark research (SaaS Capital, OPEXEngine, Bessemer State of the Cloud, KeyBanc SaaS Survey, etc.).
- Lists common misdefinitions we reject and why.

## Review cadence

- **Annually** — full re-verification of every metric against current practice and benchmark research.
- **On methodology change** — e.g., switching from a trailing-3-month to trailing-12-month NRR: full cross-corpus audit of every page that cites the metric.

## Change class

**Always PR**. A metric change cascades across every dashboard, report, and downstream page. Never auto-merge regardless of stage.

## Lint signals

- **Cross-doc contradiction** — if a dashboard definition, a page claim, or a function-specific report uses a metric differently than this directory defines it: `has_contradiction` flag.
- **Citation rot** — if a benchmark source is >3 years old: `verification_stale: true`.

## Related

- [`../../functions/revops/`](../../functions/revops/) (Phase 2) — analytics and reporting
- [`../../functions/finance-legal/`](../../functions/finance-legal/) (Phase 2) — financial reporting
- [`../icp/`](../icp/), [`../pricing/`](../pricing/) — reference metrics defined here
