---
type: playbook
title: Proposal playbook
description: Proposal is the formal pricing and structure the buyer takes internally for approval. Shaped by everything upstream, validated by the economic buyer.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - revops-lead
  - finance-lead
last_reviewed: 2026-04-20
verified_until: 2026-10-20
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - revops
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Proposal playbook

Proposal is the document the buyer takes internally to get approval. It is not a negotiation opening; it is the shape of the deal the buyer has told you they will approve. A proposal written without upstream confirmation of scope, price band, and procurement path is a guessing exercise [source: sources/internal-docs/README.md].

---

## Entry criteria

- Evaluation exit criteria met ([`evaluation.md`](evaluation.md)).
- Economic buyer has signaled disposition (even if not committed).
- Procurement path understood: does the buyer want an order form, an MSA redline, a purchasing platform submission?
- Scope agreed: SKUs, edition, term, rough ACV band.
- Discount ask (if any) anticipated against [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md).

## What proposal produces

- A written proposal (order form, MSA-anchored document, or PDF summary) with pricing, terms, success metrics, and commercial mechanics.
- A clear economic-buyer path: either the economic buyer signs directly, or the champion has committed to walking the proposal up.
- A timeline to signature with named approval steps.

## MEDDPICC letters this stage primarily refines

- **P — Paper process**: the proposal is the first artifact that paper-processes. MSA questions, redline expectations, payment terms, procurement workflow all come forward.
- **E — Economic buyer**: must now commit. A proposal the economic buyer hasn't seen is a proposal that will be re-opened.
- **M — Metrics**: restated in the proposal as the success definition. The proposal's "why" is the metric, not the feature set.

## What a good proposal contains

Every proposal in this function has, in order:

1. **Recap of pain and metric.** Written in the buyer's language, citing the artifact where they first said it. Reminds the internal approver who hasn't been in the calls why this purchase exists.
2. **Proposed solution scope.** Named edition + SKUs + add-ons referenced from [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/).
3. **Success criteria and mutual commitments.** What the buyer commits to for the deployment to succeed (data availability, stakeholder involvement, timeline).
4. **Commercial terms.** Pricing per [`../../../shared/pricing/`](../../../shared/pricing/). Term, payment cadence, ramp (if any), discount (if any, justified against [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md)).
5. **Timeline.** From signature through onboarding through first-value milestone.
6. **Next-step signature path.** Who signs, in what order, on what tool.

## Common failure modes

- **Proposal as opening bid.** Sending a padded proposal expecting a negotiation. Buyers read this as untrustworthy and proposals routinely die in procurement review over the delta.
- **Proposal without economic-buyer preview.** Sent to the champion for "internal approval" without the EB having seen the shape. Deal re-opens in negotiation stage with scope churn.
- **Surprise pricing structure.** Usage bands or ramp mechanics the buyer hasn't been walked through before. Confusion in internal review slows signature by weeks.
- **No success criteria in the proposal.** The doc becomes a transactional pricing sheet; CS starts without a shared definition of win.
- **Discount granted without guardrail alignment.** Rep offers an 18% discount without meeting the strategic-exception-band conditions in [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md). Deal desk rejects at close.

## Exit criteria (binary)

- [ ] Proposal delivered with every section above.
- [ ] Economic buyer has seen the proposal (directly or via a documented champion walkthrough).
- [ ] Paper-process path is known: who redlines, who signs, what tool, typical turnaround.
- [ ] Scope and pricing reviewed against shared/pricing/ guardrails.
- [ ] Next-step calendar event scheduled for proposal review with named participants.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Proposal is usually a one-page order form plus a two-page cover / recap.
- Pricing structure is standard-edition + seat/usage tier + 1- or 3-year term.
- MSA is typically our standard template, signed as-is or with a short redline pass.
- Discount bands: 0-10% no justification, 10-18% with deal-desk sign-off per [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md).
- Economic buyer signs directly; approval chain is typically 1-2 layers.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Proposal is MSA-anchored, often with a schedule or order-form exhibit. Procurement may require a vendor-specific document format.
- Pricing can include usage bands, multi-year ramps, custom commit tiers, and penalty / remedy clauses.
- MSA redlines typically multi-round; legal on both sides.
- Security addendum (data processing, DPA, SOC 2 attestations) often attached.
- Economic buyer delegates signature to a procurement-signed document; final authority sits higher than signature.
- Multi-entity rollouts add order-form complexity; see [`../../../schema/page-templates/sales/pricing-pattern.md`](../../../schema/page-templates/sales/pricing-pattern.md) for the multi-entity pattern template.

## Shared-spine inputs

- [`../../../shared/pricing/`](../../../shared/pricing/) — the canonical price book
- [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md) — discount rules
- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — SKU and edition definitions
- [`../../../shared/positioning/`](../../../shared/positioning/) — value-prop language for the proposal recap

## Related

- [`../methodology/`](../methodology/) — MEDDPICC the stage finalizes
- [`evaluation.md`](evaluation.md) — entry stage
- [`negotiation.md`](negotiation.md) — next stage
- [`../frameworks/`](../frameworks/) — deal-desk escalation patterns for non-standard asks

## Change log

- 2026-04-20 — Phase 1 initial page.
