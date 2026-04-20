---
type: battlecard
title: Competitor X — enterprise incumbent battlecard
description: Battlecard against the enterprise-incumbent archetype — large install base, legacy architecture, broad feature surface. Reference shape.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - marketing-lead
  - product-lead
last_reviewed: 2026-04-20
verified_until: 2026-07-20
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - marketing
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Competitor X — enterprise incumbent battlecard

> Phase 1 worked example. "Competitor X" is an abstract archetype — the enterprise-incumbent shape with a large install base, a mature but legacy architecture, and a broad feature surface accumulated over time. Replace with real competitor data when forking; keep the section shape.

## When to deploy this battlecard

Deploy when the buyer has Competitor X installed or named it as the default option. Most common shape: mid-market or enterprise deal where the buyer is evaluating alternatives because Competitor X's deployment has proven operationally heavy, or because a new operator (RevOps hire, new CRO) is re-evaluating the stack. Dissatisfaction signals that mark this deal shape are listed in [`../plays/competitive-displacement.md`](../plays/competitive-displacement.md).

Do **not** deploy this card against a buyer who is actively satisfied with Competitor X. A battlecard without a dissatisfaction signal becomes a smear campaign.

## The competitor in one paragraph

Competitor X is a long-tenured category leader with wide adoption across mid-market and enterprise. Their strength is breadth and market familiarity; their weakness is the operational cost of running a system built on architectural decisions from an earlier generation. Canonical profile (firmographics, product shape, public positioning) lives in [`../../../shared/competitive-intel/competitors/`](../../../shared/competitive-intel/competitors/).

## Where we win

- **Time-to-first-value is materially shorter.** Our deployments reach the first-value milestone in weeks rather than quarters; buyers cite this as the determining factor in closed-won deals against Competitor X [source: sources/internal-docs/README.md].
- **Operating cost is lower end-to-end.** Fewer admin hours per week, smaller integration-maintenance footprint, less dependency on specialist consultants for standard changes [source: sources/internal-docs/README.md].
- **Modern architecture supports adjacent tooling cleanly.** API-first integration posture matches the shape of buyers whose data stack has modernized in the last 3-5 years.
- **Narrower, deeper feature set on the core workflow.** Buyers whose pain is concentrated on one or two workflows consume value faster when the product isn't fighting a broad feature surface.

## Where they win

Honest accounting. Reps who don't acknowledge these lose trust fast.

- **Breadth of feature surface.** Buyers with a wide use-case spread (10+ distinct workflows) often prefer the one-vendor coverage Competitor X offers, even if individual workflows are weaker [source: sources/internal-docs/README.md].
- **Install-base familiarity.** A buyer organization with 5+ years of Competitor X deployment has institutional muscle memory; switching introduces real training cost.
- **Ecosystem and partner depth.** Competitor X has a larger partner network — implementation, consulting, and integration partners — which matters to enterprise buyers who outsource these functions.
- **Incumbent procurement path.** Competitor X already has MSAs, security approvals, and procurement onboarding in the buyer's systems. A net-new vendor has to re-earn all of that.

## Counter-positioning tactics

| Their claim | Our response | Evidence |
|---|---|---|
| "We cover every use case you have today and tomorrow" | "Coverage of everything costs operational weight on the things you actually do weekly. Which 2-3 workflows drive the business case? That's where the delta lives." | [source: sources/internal-docs/README.md] |
| "We're the proven category leader" | "Leadership of the category Competitor X defined is real. The category you're buying for has shifted since then; time-to-value and operating cost now weigh more than feature-surface area in this segment." | [source: sources/internal-docs/README.md] |
| "Switching is expensive and risky" | "The switching cost is real. Here's our transition plan [`../plays/competitive-displacement.md`](../plays/competitive-displacement.md), and here's how we structure the commercials so the first year is low-risk — [`../../../shared/pricing/`](../../../shared/pricing/)." | Displacement play + pricing spine |
| "We have a partner for everything" | "A partner ecosystem helps when the product needs partners. When the product is simpler to run, the partner question shifts — you don't need the ecosystem, you need fewer specialists." | [source: sources/internal-docs/README.md] |

## Traps to avoid

- **Don't attack Competitor X in the demo room.** Verbal attacks mock the buyer's prior decision. Counter-positioning is done in async artifacts and 1:1 calls, not in front of the committee.
- **Don't promise parity we don't have.** When a workflow is genuinely weaker in our product, acknowledge it and scope-out or bridge, don't fake it. Buyers who discover gap in evaluation lose trust faster than buyers told upfront.
- **Don't ignore switching cost.** A transition plan is mandatory; "it'll just work" is dismissive and wrong.
- **Don't chase feature-by-feature comparison matrices.** The conversation becomes a feature checklist and our delta — operational weight, time-to-value — disappears from view.
- **Don't underestimate incumbent procurement momentum.** Procurement teams who already have Competitor X in their system resist net-new vendors on default bias. Start paper-process early — [`../playbooks/evaluation.md`](../playbooks/evaluation.md) and [`../playbooks/negotiation.md`](../playbooks/negotiation.md).

## Segment variants

### Mid-market variant  {segment: mid-market}

- Deal shape: 60-120 day cycle, ACV $50-150K, single economic buyer with 1-2 approval layers.
- Dominant displacement driver: operational cost — a RevOps or ops team of 2-4 people spending too much of their week maintaining Competitor X.
- Buying committee is usually operational lead + an exec sponsor; procurement is light.
- Typical outcome: 1-year initial term with expansion within 12 months if time-to-value hits.

### Enterprise variant  {segment: enterprise}

- Deal shape: 6-12 month cycle, ACV $300K-$1M+, multi-signer procurement.
- Dominant displacement driver: architectural modernization — buyer is consolidating a modernized data stack and Competitor X isn't fitting.
- Buying committee expands to include data/platform architecture leads, security, legal, procurement. Executive sponsor mandatory.
- Typical outcome: multi-year ramp structure with buyout of overlapping Competitor X commitments; ramp often includes year-1 parallel-run period.

## Related

- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — canonical competitor profile
- [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) — patterns this card draws from
- [`../../../shared/positioning/`](../../../shared/positioning/) — value-prop framing
- [`../plays/competitive-displacement.md`](../plays/competitive-displacement.md) — play this card equips
- [`../objections/`](../objections/) — objections that commonly accompany this competitive shape

## Change log

- 2026-04-20 — Phase 1 worked example created against the enterprise-incumbent archetype.
