---
type: persona
title: VP Sales
description: VP Sales persona — carries the quota, owns the sales operating system, balances rep capacity against pipeline reality.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
  - revops-lead
last_reviewed: 2026-04-20
verified_until: 2026-07-20
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - marketing
  - sales
  - cs
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# VP Sales

> Phase 1 addition to the shared spine. Surfaced because Phase 1 Sales content (methodology, playbooks, plays) referenced a VP Sales persona that didn't previously exist as a standalone file.

## Role summary

VP Sales (sometimes VP of Sales, Senior Sales Director, or Head of Sales) owns the revenue-producing motion. Reports to CRO, CEO, or COO depending on company shape. Typically manages 1-3 layers of people — team leads / managers above ICs — ranging from 5 to 60+ reps. Carries the aggregate quota; is fired or promoted on the delta.

The role exists to convert pipeline into closed revenue. Everything about the job — process, tooling, compensation design, hiring, forecasting — is downstream of that conversion.

## Scope and authority

- **Owns**: sales methodology adoption, playbook enforcement, rep ramp programs, compensation plan design (often jointly with Finance / RevOps), territory and named-account design (jointly with RevOps), deal-desk escalation approval for the discount band above the rep tier.
- **Reports to**: CRO, CEO, or COO. In $10-30M ARR companies this is often the top revenue role.
- **Direct reports**: 3-12 typically — sales managers, enablement leads, sometimes solutions engineering.
- **Budget authority**: headcount + tooling co-approval; deal-discount authority at the strategic-exception band per [`../../pricing/discount-guardrails.md`](../../pricing/discount-guardrails.md).

## Primary pains

- **Pipeline quality, not quantity.** The VP's forecast depends on pipeline coverage being real — too much junk pipeline means forecast misses even at healthy coverage ratios.
- **Rep capacity allocation.** Carrying too many accounts per rep dilutes execution; too few loses coverage of the addressable market. Named-account design is a constant tuning problem.
- **Forecast credibility.** Weekly roll-up that the CRO can defend to the CEO / Board. Forecast misses compound — one miss costs credibility; two consecutive misses cost the role.
- **Deal slip at late stage.** Deals that pass evaluation and then stall in procurement or legal — the VP can't personally unstick every deal, so patterns matter.
- **Ramp time for new reps.** Hiring is the response to coverage gaps; every month of slow ramp delays the response.

## What they care about

- Rep attainment distribution — not just the average but the shape (too top-heavy = hiring or territory problem; too bottom-heavy = management problem)
- MEDDPICC discipline across the floor — see [`../../../functions/sales/methodology/`](../../../functions/sales/methodology/)
- Pipeline coverage ratio by segment and motion
- Cycle time by stage and segment
- Win rate by segment, motion, and source channel
- Average deal size trend — and what's driving any movement
- Forecast accuracy — Monday-of-quarter-close forecast vs. actual

## What they dismiss

- "AI-SDR will solve your pipeline problem" pitches without a data-quality story — the VP knows the real constraint is pipeline quality, not prospector volume
- Tool proposals that add overhead without a rep-facing productivity story
- Positioning pitches that don't translate to a rep's one-call pitch
- Competitive intelligence that isn't actionable at deal level

## How they buy

- **Typical buying committee role**: Decision-maker or economic buyer for tools that affect sales execution. Influencer or champion for broader RevOps tools. See [`../buying-committees/`](../buying-committees/) for the configurations.
- **Buying motion preference**: wants a pilot with their real reps on real deals; does not make decisions on demos alone. 30-60 day pilot is typical.
- **Evaluation criteria**: (1) does the tool actually get used by reps without enforcement, (2) does it move a metric the VP reports on, (3) integration with the existing stack without doubling admin overhead.

## Objections (top 3)

- **"My reps won't use it."** — Counter with the adoption pattern from a comparable pilot, not a promise. Also see [`../../../functions/sales/objections/`](../../../functions/sales/objections/).
- **"We have a tool for that already."** — Counter with the specific capability gap, not feature breadth.
- **"I can't add overhead to my reps' workflow."** — Counter with a specific workflow showing time saved, not promised.

## Motion-specific notes

### Sales-assisted motion  {motion: sales-assisted}

- VP Sales at $10-30M ARR often doubles as the deal desk and as the primary pipeline-review manager; authority is concentrated.
- Purchase decisions for sales tooling are usually VP Sales + CRO (if separate) + RevOps lead; procurement is light.
- Pilot expectations: 30-day real-deal pilot with 2-4 reps is typical before a rollout.

### Enterprise motion  {motion: enterprise}

- VP Sales sits within a larger revenue org; authority is shared with CRO, Head of Enablement, and RevOps.
- Purchase decisions involve Finance, IT, Security, and often a Sales Operations function with its own authority.
- Pilot expectations: formal POC with success criteria, executive readout, 60-90 day evaluation before global rollout.

## Career motivations

- **Delivering the number** is the first-order motivator — quota attainment is visible and compounds trust.
- **Promotion path** — VP Sales at $10-30M often promotes into CRO or Head of GTM at scale; success here is strongly tied to being seen as the operator who made the org scalable.
- **Reputation in the category** — external visibility at conferences, podcasts, LinkedIn content in the sales-leadership community matters to many VPs.

## Related

- [`../buying-committees/`](../buying-committees/) — committees where VP Sales appears
- [`../../icp/`](../../icp/) — ICP tiers where VP Sales is the primary operator buyer
- [`../../pricing/discount-guardrails.md`](../../pricing/discount-guardrails.md) — the discount authority at VP tier
- [`head-of-revops.md`](head-of-revops.md) — common counterpart in RevOps-adjacent decisions
- [`../../../functions/sales/`](../../../functions/sales/) — the function VP Sales operates

## Change log

- 2026-04-20 — Phase 1 addition. Surfaced by Phase 1 Sales content referencing VP Sales as a persona.
