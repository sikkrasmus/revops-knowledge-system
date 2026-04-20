---
type: discount-guardrail
title: Discount guardrails
description: Discount approval thresholds and strategic exception band. Phase 0 abstract example.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - finance-lead
  - sales-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Discount guardrails

> Phase 0 abstract example. Replace percentages and conditions with real policy when forking.

## Approval thresholds

| Discount range | Approver | Required conditions |
|---|---|---|
| 0–10% | AE | Standard — no special justification |
| 10–18% | Deal Desk | Justification note + comparable-deal citation |
| 18–25% | VP Sales / RevOps Lead | Strategic exception conditions (see below) |
| >25% | CFO | Multi-year + reference commitment + strategic logo |

## Strategic exception band (18–25%)

All four conditions must be met:

- **3-year term**
- **Multi-product bundle** (two or more SKUs)
- **Reference-customer commitment** — customer agrees to a reference call within 90 days
- **Target-segment net-new logo** — matches Tier 1 firmographics, not already a customer or recent churn

Missing any condition → hold at 18% max. The pattern is the combination; no individual condition unlocks the exception band.

## Non-price concession tiers

In lieu of or alongside discount — grant these against discount budget:

- **3-year term commitment** — worth ~5% equivalent in effective discount
- **Public reference / case study rights** — worth ~3% equivalent
- **Multi-entity rollout** — worth 3-5% equivalent
- **Design-partner program** — worth 5-10% equivalent if the partnership yields product input

## Observed pattern (sourced)

- Last 12 closed deals at >18% discount in mid-market segment: all had 3-year term; 10 of 12 had multi-product; 8 of 12 had reference commit [source: sources/internal-docs/README.md].
- Strategic-exception deals retain and expand at 1.4x the rate of standard-discount deals in the same segment [source: sources/internal-docs/README.md].

## When a deal hits the exception band

1. AE submits Deal Desk form with all four conditions checked.
2. Deal Desk pulls comparable closed deals (last 12 months, same segment) for sanity check.
3. Approval routes to VP Sales or RevOps lead based on deal size.
4. Approval + rationale logged to `log.md` on close via PR.
5. Quarterly lint pass compares approved-exception deals to the condition checklist to detect drift.

## Always-CFO escalation triggers

Any of:

- Discount above 25%
- Strategic-exception band but missing one or more conditions (override request)
- Multi-year without annual ramp
- Non-standard payment terms combined with above-list discount
- Competing-displacement case where we're taking revenue from a peer at >15% below our floor

## Lint signals

- **Drift alert**: if >30% of approved exception-band deals are missing one or more conditions, open a policy review PR.
- **Verification stale**: policy is re-verified against actual closed-deal patterns quarterly. Short staleness window.

## Related

- [`price-book.md`](price-book.md) — the pricing this guardrails protect
- [`../../functions/sales/`](../../functions/sales/) (Phase 1) — deal desk plays reference this
- [`../../functions/finance-legal/`](../../functions/finance-legal/) (Phase 2) — revenue recognition impact
