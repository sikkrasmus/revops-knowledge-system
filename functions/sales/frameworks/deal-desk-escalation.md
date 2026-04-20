---
type: framework
title: Deal-desk escalation framework
description: Decision tree for routing non-standard deal asks. Reads the shared discount guardrails and pricing policy; outputs approver + required conditions.
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
  - legal
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Deal-desk escalation framework

Deal-desk escalation is the routing logic that sits on top of the canonical pricing policy. When a deal asks for something the standard policy doesn't cover — discount above band, payment term deviation, multi-entity structure, unusual usage commit — this framework routes the ask to the right approver with the right required conditions.

It does not decide whether the ask is granted. It decides who decides and what they need to see. The pricing policy itself lives in [`../../../shared/pricing/`](../../../shared/pricing/); this framework enforces the escalation rules that policy implies.

---

## Trigger: what requires escalation

Any one of these triggers the framework:

| Trigger | Source of rule |
|---|---|
| Discount above 10% | [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md) |
| Payment terms beyond Net 30 | Pricing policy common principles |
| Multi-year without annual ramp | Pricing policy ramp patterns |
| Non-standard MSA redline classes (IP assignment, uncapped liability, custom indemnity) | Legal policy |
| Usage meter custom tier or band | [`../../../shared/pricing/usage-meters.md`](../../../shared/pricing/usage-meters.md) |
| Multi-entity rollout with non-standard signature flow | Pricing policy |
| Proposed non-price concession (reference rights, co-marketing, custom roadmap commit) in exchange for above-band discount | Discount guardrails non-price-concession tiers |

If none of the above apply, the deal is standard and does not enter escalation. AE quotes per the policy and moves on.

## The decision tree

### Rule 1 — Discount band routing

Read [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md) for the approver thresholds.

| Discount band | Approver | Conditions |
|---|---|---|
| 0-10% | AE self-approves | None beyond standard justification |
| 10-18% | Deal Desk | Justification note + comparable-deal citation |
| 18-25% | VP Sales or RevOps Lead | All four strategic-exception conditions must be met (3-year, multi-product, reference-customer commit, tier-1 net-new) |
| >25% | CFO | Multi-year + reference + strategic logo + written rationale |

The conditions are non-negotiable. Missing any strategic-exception condition caps the discount at 18%, not 25%.

### Rule 2 — Payment-term routing

| Deviation | Approver |
|---|---|
| Net 45 or Net 60 | Finance Lead |
| Quarterly or monthly payment with annual pricing | Finance Lead + CFO if >$100K ACV |
| Deferred revenue recognition request | CFO + Legal |
| Non-standard currency | Finance Lead |

Starting-point rule: Sales does not commit to payment terms without Finance sign-off. Buyer verbally asks → Sales responds "let me confirm that with our finance team."

### Rule 3 — MSA redline routing

| Redline class | Approver |
|---|---|
| Standard redlines (notice periods, data-handling clauses, standard liability caps) | Legal |
| Uncapped liability, custom IP assignment, unusual warranty | Legal + CFO |
| Procurement-platform-imposed terms we haven't signed before | Legal + Deal Desk |
| Sovereign data residency commitments | Legal + Security + CFO |

Sales' job in MSA redlines is to triage and hand to the right approver fast — not to negotiate terms directly.

### Rule 4 — Non-price concession routing

Non-price concessions (reference rights, co-marketing, custom roadmap commit, design-partner program) are worth discount-equivalent value per [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md). Escalation routing:

| Concession | Approver | Discount-equivalent value |
|---|---|---|
| 3-year term commit (vs. 1-year) | Deal Desk | ~5% |
| Public reference / case-study rights | Marketing Lead + Deal Desk | ~3% |
| Multi-entity rollout | Deal Desk + Finance | 3-5% |
| Design-partner program with product input rights | Product Lead + Deal Desk | 5-10% |
| Custom roadmap commit | Product Lead + CEO | Case-by-case |

## How the rep initiates escalation

1. Identify the trigger before sending a proposal. Do not escalate after sending.
2. Open a deal-desk ticket with: account name, proposed ACV, ask in plain language, conditions being met / not met against the relevant guardrail, proposed rationale.
3. Attach the comparable-deal citations if the ask is discount-related — Deal Desk looks at comparable patterns, not individual justifications.
4. Wait for the approver's response before committing verbally or in writing to the buyer.

## Common failure modes

- **Verbal commitments before approval.** AE agrees on a call, then submits the escalation and gets declined. Trust with the buyer erodes. The working rule: "I'll confirm that with our deal desk and come back to you within 24 hours."
- **Escalating without meeting conditions.** Submitting an 18-25% discount ask without three of the four strategic-exception conditions wastes everyone's time and tells Deal Desk the rep isn't reading guardrails.
- **Bundling escalations.** A single deal with discount + payment-term + MSA-redline escalations all submitted at once creates a tangled approval chain. Unbundle and route each.
- **Skipping comparable-deal citations.** Discount escalations without comparables get bounced.
- **Missing re-approval on scope changes.** An approved discount assumes a specific scope; if the scope shrinks mid-negotiation, the discount must be re-approved.

## Escalation exit

An escalation is resolved when:

- The approver has explicitly approved, explicitly denied, or explicitly counter-proposed.
- The outcome is documented in the CRM opportunity with the approver named and the conditions recorded.
- The buyer has been informed with accurate language (approved at X%, approved with condition Y, or declined with alternative Z).

Escalations don't "time out." Un-responded escalations are the Deal Desk's oldest-first queue, not the rep's concern after submission.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- The common escalation is a 10-18% discount ask with a 1-year term. Deal Desk decides in 24-48 hours.
- Payment-term escalations are rare; most mid-market buyers accept Net 30.
- MSA redlines are light; Legal's escalation queue is fast.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Multiple simultaneous escalations are typical (discount + payment + MSA + multi-entity). Deal Desk coordinates approver sequencing.
- 18-25% strategic-exception band is common and demands full documentation.
- CFO-level escalations (>25% or non-standard payment structures) can take 5-10 business days; build this into the mutual close plan.
- Legal redline escalations routinely hit 3-4 rounds.

## Shared-spine inputs

- [`../../../shared/pricing/`](../../../shared/pricing/) — the policy this framework enforces
- [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md) — discount band definitions and strategic-exception conditions
- [`../../../shared/pricing/usage-meters.md`](../../../shared/pricing/usage-meters.md) — usage-meter customization rules
- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — SKU inclusions when scope is re-shaped

## Related

- [`../playbooks/proposal.md`](../playbooks/proposal.md) — stage where most escalations originate
- [`../playbooks/negotiation.md`](../playbooks/negotiation.md) — stage where MSA and payment escalations typically fire
- [`qualification.md`](qualification.md) — upstream; mis-qualified accounts produce exotic escalation patterns
- [`forecast-methodology.md`](forecast-methodology.md) — open escalations reduce forecast confidence

## Change log

- 2026-04-20 — Phase 1 initial page.
