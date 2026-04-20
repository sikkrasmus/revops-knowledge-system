---
type: playbook
title: Negotiation playbook
description: Negotiation converts a proposal into a signable contract. Most negotiation is procedural; strategic negotiation is rarer than reps think.
owner: rasmus@latentflows.com
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

# Negotiation playbook

Negotiation is the stage between proposal acceptance in principle and contract signature. The common misread is that negotiation is strategic; most of it is procedural — MSA redlines, procurement checkboxes, payment-term adjustments, and signing-authority coordination. Strategic negotiation (price, term, scope) should be resolved before this stage or it erodes the deal [source: sources/internal-docs/README.md].

---

## Entry criteria

- Proposal delivered and received positively by the economic buyer or their delegate.
- Scope, pricing, and term in principle agreed.
- Paper-process path known: named legal contact, named procurement contact, named approver at each step.
- Target signature date set.

## What negotiation produces

- Finalized and redlined contract: MSA or order form, or both.
- Confirmed procurement onboarding: vendor records, COI, DPA, security attestations as required.
- Signed approval chain from economic buyer through any final authority.
- Mutual close plan: a shared document with named owners, dates, and artifacts from signature through kickoff.

## MEDDPICC letters this stage finalizes

- **P — Paper process**: fully resolved. Every redline, every procurement checkbox, every approval handled.
- **E — Economic buyer**: final commitment or delegation documented.
- **D — Decision process**: the stage-by-stage approval chain executes exactly; slips here indicate decision-process was under-mapped upstream.

## Running negotiation

A mutual close plan is the central artifact. It's a shared doc (buyer-visible, often in a CRM or deal-room tool) with every step from proposal acceptance to kickoff. Reviewed weekly or twice weekly in the close period.

Typical mutual close plan stages:

1. **Redline pass 1.** Our paper → their legal. Their markup returns within N days.
2. **Redline pass 2.** We respond to markup; anything unresolved escalates to the pricing/legal deal-desk framework.
3. **Procurement onboarding.** Vendor record, COI, DPA, security attestations, payment setup.
4. **Security / IT review** (enterprise, usually in parallel with legal).
5. **Final commercial approvals.** Any non-standard term goes to deal desk or CFO per [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md).
6. **Signature.** Contract routed for signature; verify counter-signature.
7. **Kickoff trigger.** Signature confirmed → automatic handoff to CS per [`expansion-handoff.md`](expansion-handoff.md).

## Common failure modes

- **Opening scope churn.** Buyer reopens scope or pricing in negotiation because the economic buyer never saw the proposal. Nearly always traces to an upstream MEDDPICC gap [source: sources/internal-docs/README.md].
- **Legal stall.** Their legal team is overloaded; redlines sit for 2+ weeks. Mutual close plan with named dates and weekly pulse reduces this; personal escalation through the economic buyer is the last lever.
- **Procurement surprise.** Vendor onboarding requires certifications we don't have, a questionnaire we haven't seen, or a document format we haven't used. Prevent by collecting procurement requirements during evaluation.
- **Non-standard concessions without deal-desk approval.** Reps agreeing to terms they don't have authority to grant. Deal desk surfaces the gap at the worst possible time.
- **Mutual close plan absent.** No shared visibility; the deal "stalls" because no one is tracking the ball.

## Exit criteria (binary)

- [ ] Contract redline converged; both legal teams signed off on final text.
- [ ] Procurement records complete; vendor onboarding approved.
- [ ] Security / IT review approved (enterprise) or marked not-required (mid-market).
- [ ] All non-standard terms escalated and approved per [`../frameworks/`](../frameworks/).
- [ ] Signature routed; counter-signature received; ACV, start date, term confirmed in writing.
- [ ] Mutual close plan updated through kickoff trigger.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Redline pass typically 1-2 rounds, 7-14 day turnaround each.
- Procurement often absent or one-form; no COI / DPA.
- Security review: often just SOC 2 attestation and SSO confirmation.
- Signature: single economic buyer signs; sometimes countersigned by a finance delegate.
- Total negotiation cycle: 10-20 business days typical.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Redline pass 2-4 rounds, 14-30 day cycles, counsel on both sides.
- Procurement: vendor questionnaire, COI, DPA, SCCs (for EU data), sometimes diversity certifications.
- Security review: SOC 2 Type II, pen-test summary, architecture diagram, incident-response process, data-residency options, SSO + SCIM.
- Signature chain: 2-4 signers; economic buyer may not be the last signer.
- Total negotiation cycle: 30-90 business days typical; outliers to 6 months.
- Multi-entity deals multiply the paper count (one order form per entity or one master with schedules).

## Shared-spine inputs

- [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md) — what authority level can approve which concession
- [`../../../shared/pricing/`](../../../shared/pricing/) — commercial mechanics reference
- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — SKU and edition anchors when scope shifts
- [`../../../shared/personas/`](../../../shared/personas/) — CFO, legal, procurement personas

## Related

- [`../methodology/`](../methodology/) — MEDDPICC finalized
- [`proposal.md`](proposal.md) — entry stage
- [`close.md`](close.md) — next stage
- [`../frameworks/`](../frameworks/) — deal-desk escalation rules

## Change log

- 2026-04-20 — Phase 1 initial page.
