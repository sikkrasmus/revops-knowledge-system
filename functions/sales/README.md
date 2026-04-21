---
type: function-readme
title: Sales function
description: Sales function — what it owns, consumes, and publishes. Scaffold in Phase 0, filled in Phase 1.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - revops-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
consumers:
  - sales
  - cs
  - marketing
  - revops
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Sales function

**Phase status**: scaffolded in Phase 0; content filled in Phase 1.

Sales is the first vertical function to fill because (a) audience demand lives there, (b) sales has the densest downstream references to the shared spine, and (c) v0's existing templates (battlecard, objection, pricing-pattern, postmortem, champion-profile) salvage cleanly into `schema/page-templates/sales/` in Phase 1.

---

## What the function owns

- **Methodology** — the sales process framework (MEDDPICC, BANT, or chosen methodology) with motion/segment adaptations.
- **Playbooks** — by deal stage (discovery, demo, evaluation, proposal, negotiation, close, expansion handoff).
- **Frameworks** — qualification frameworks, deal-desk rules, escalation frameworks, forecast methodology.
- **Plays** — repeatable plays (outbound sequences, objection handling trees, referral asks, competitive displacement, renewal acceleration).
- **Battlecards** — per competitor, per segment.
- **Tools and stack** — CRM config, sequencer, call recorder, CPQ/quoting, deal desk tooling.

## What the function consumes from `shared/`

- **[`shared/icp/`](../../shared/icp/)** — qualify tight against Tier 1; use Tier 2 for inbound.
- **[`shared/personas/`](../../shared/personas/)** — buying-committee mapping in discovery.
- **[`shared/pricing/`](../../shared/pricing/)** — quoting, discount approvals, multi-year ramp structures.
- **[`shared/positioning/`](../../shared/positioning/)** — first-call openers, pitch language.
- **[`shared/competitive-intel/`](../../shared/competitive-intel/)** — base for battlecards and counter-positioning.
- **[`shared/product-and-packaging/`](../../shared/product-and-packaging/)** — SKU inclusions and limitations when proposing.
- **[`shared/data-definitions/`](../../shared/data-definitions/)** — ARR, ACV, NRR, pipeline coverage definitions for forecasting.

## What the function publishes back to `shared/`

- Closed-deal evidence into `shared/competitive-intel/win-loss-patterns.md`.
- Discount-pattern reality into `shared/pricing/discount-guardrails.md` via pattern-observation PRs.
- Persona refinement from discovery-call patterns into `shared/personas/`.
- ICP-validation signals (segment win rates) into `shared/icp/`.

Changes to the shared spine originating in Sales always PR through the shared reviewer routing in [`../../ingestion/pr-workflow.md`](../../ingestion/pr-workflow.md).

## Planned Phase 1 structure

```
functions/sales/
├── README.md                              (this file)
├── methodology/
│   ├── README.md
│   └── meddpicc.md                        — MEDDPICC framework with motion variants
├── playbooks/
│   ├── README.md
│   ├── discovery.md
│   ├── demo.md
│   ├── evaluation.md
│   ├── proposal.md
│   ├── negotiation.md
│   ├── close.md
│   └── expansion-handoff.md
├── frameworks/
│   ├── qualification.md
│   ├── deal-desk-escalation.md
│   └── forecast-methodology.md
├── plays/
│   ├── outbound-sequence-mid-market.md
│   ├── competitive-displacement.md
│   ├── referral-ask.md
│   └── renewal-acceleration.md
├── battlecards/
│   └── README.md                          — one file per competitor
├── objections/
│   └── README.md                          — one file per common objection
└── tools-and-stack/
    └── README.md
```

Phase 1 fills these with real content. The v0 salvaged templates (battlecard, objection, pricing-pattern, postmortem, champion-profile) land in `schema/page-templates/sales/` and are used by the above directory.

## Ownership

- **Owner**: Sales lead.
- **Co-authors**: RevOps lead (tool/process alignment), CS lead (expansion handoff).
- **Consumers**: Sales, CS, Marketing, RevOps.

## Related

- [`../../shared/`](../../shared/) — spine Sales consumes from
- [`../../docs/03-IMPLEMENTATION.md`](../../docs/03-IMPLEMENTATION.md) — suggested rollout and the eight hard parts
