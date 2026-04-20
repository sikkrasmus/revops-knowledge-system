---
type: playbook
title: Evaluation playbook
description: Evaluation is the stage where the buyer runs the product against their own data and signs off that it works. Scope, measure, decide.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - revops-lead
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
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Evaluation playbook

Evaluation is the working period when the buyer operates the product against real data, measured against agreed criteria, toward a named decision date. If scoped well, evaluation is the highest-converting stage in the funnel. If scoped poorly, it becomes an indefinite trial that erodes urgency [source: sources/internal-docs/README.md].

---

## Entry criteria

- Decision criteria in writing and acknowledged by the buyer.
- Evaluation scope proposed in demo stage and accepted — systems, workflows, duration, success criteria, owners.
- Technical contact identified on the buyer side.
- Decision date named (even if soft) and shared with the economic buyer.

## What evaluation produces

| Artifact | Form |
|---|---|
| Signed scoping doc (or email-equivalent in mid-market) | PDF or email thread |
| Success-criteria checklist | Shared doc |
| Weekly pulse-check notes | CRM opportunity |
| Final evaluation review call + summary | Email + CRM |
| Buy / no-buy / adjust-scope decision | Email from buyer, ideally economic-buyer-copied |

## MEDDPICC letters this stage primarily refines

- **D — Decision process**: the exact sequence from evaluation decision to signature becomes explicit — security review, legal, procurement, signature.
- **C — Competition**: by the end of evaluation, the rep knows every alternative being evaluated, the buyer's comparative read, and any criteria they're failing on.
- **P — Paper process (early)**: security review and legal redlines commonly start during evaluation in enterprise; mid-market paper kicks off at evaluation exit.
- **E — Economic buyer**: must be meaningfully engaged by evaluation end; a no-show economic buyer at evaluation close is a deal in serious trouble.

## How a working evaluation is run

The AE is not a bystander. Evaluation succeeds when the AE is the project manager of the buyer's evaluation project — not the product, the project [source: sources/internal-docs/README.md].

1. **Kickoff call.** Reconfirm scope, owners, deadlines, and decision date. Get everyone named. Schedule the weekly pulse and the final review up front.
2. **Weekly pulse (15-30 min).** Review progress against success criteria. Surface blockers. Red/yellow/green each criterion. AE writes the recap; buyer validates.
3. **Mid-evaluation checkpoint.** Halfway through, the AE asks: "If we ended evaluation today, which criteria would you mark green, and what's keeping the others yellow or red?" This is the moment to course-correct scope or extend — not the last day.
4. **Final review call.** Walk each criterion. Buyer decides. AE documents.

## Common failure modes

- **Open-ended trial.** No decision date. The trial becomes indefinite. Urgency collapses. Budget window passes.
- **Scope that misses the deal-winning workflow.** Evaluation runs against features that aren't the purchase driver; the purchase-driving workflow never gets tested.
- **No economic buyer in the loop.** Champion runs the evaluation; economic buyer first sees results in the proposal. Economic-buyer surprise at proposal stage is the most common cause of late-stage slip [source: sources/internal-docs/README.md].
- **Silent mid-evaluation stalls.** Weekly pulse skipped for two weeks; AE learns in the final review that the workflow broke on week 2 and was abandoned.
- **Security / legal / procurement blocked until after evaluation.** Those paths take weeks; starting them in parallel saves 3-6 weeks of cycle time in enterprise.

## Exit criteria (binary)

- [ ] Success criteria each marked buy / no-buy / adjust-scope in writing.
- [ ] Decision process documented: named stages, owners, typical durations.
- [ ] Economic buyer has seen evaluation results (directly or via the champion) and signaled disposition.
- [ ] Competition explicit: named alternatives and comparative read.
- [ ] Paper-process inputs collected: MSA position, procurement path, payment-term constraints, security review initiated.
- [ ] Proposal scope agreed: SKUs, edition, term, estimated ACV band.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Evaluation is typically a 14-30 day self-run trial in a sandbox or lightly-connected environment.
- Success criteria are 3-5 items; all should be buy / no-buy after evaluation.
- Security review usually light; procurement often absent; legal is a one-page order form.
- Economic buyer's engagement is often a 30-minute call in the last week.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Evaluation is a formal POC, 30-90 days, signed scoping doc, often includes integration to one or two production systems.
- Success criteria are 5-10 items, with some weighted (must-pass vs. nice-to-have).
- Security review, legal redlines, and procurement onboarding run in parallel with evaluation — see [`../frameworks/`](../frameworks/) deal-desk escalation patterns.
- Executive checkpoints with the economic buyer at 50% and 100% of evaluation duration.
- Vendor risk assessment likely; SOC 2, data residency, SSO, audit log documentation should be ready to attach.

## Shared-spine inputs

- [`../../../shared/pricing/`](../../../shared/pricing/) — pricing structure that will govern the proposal
- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — SKUs and add-ons being evaluated
- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — competitor awareness during evaluation
- [`../../../shared/personas/buying-committees/`](../../../shared/personas/buying-committees/) — committee engagement expectations

## Related

- [`../methodology/`](../methodology/) — MEDDPICC the stage refines
- [`demo.md`](demo.md) — entry stage
- [`proposal.md`](proposal.md) — next stage
- [`../frameworks/`](../frameworks/) — deal-desk escalation patterns

## Change log

- 2026-04-20 — Phase 1 initial page.
