---
type: playbook
title: Close playbook
description: Close is the mechanical stage from countersigned contract through CRM-closed-won and CS kickoff trigger.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - revops-lead
  - cs-lead
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
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Close playbook

Close is narrow: counter-signed contract → CRM closed-won → CS kickoff trigger. It is mechanical, fast, and should be boring. Interesting things happening in close are symptoms of upstream issues — usually a MEDDPICC letter that wasn't solid. Close is not where deals are won; it's where deals are recognized [source: sources/internal-docs/README.md].

---

## Entry criteria

- Negotiation exit criteria met ([`negotiation.md`](negotiation.md)).
- Contract counter-signed by our side.
- Start date, term, ACV, and edition / SKUs all confirmed in writing.

## What close produces

| Artifact | Owner |
|---|---|
| CRM opportunity marked closed-won with the final ACV, term, and effective date | AE |
| MEDDPICC final completeness snapshot | AE |
| Deal review note (brief — what won, what almost lost it, what surprised) | AE |
| Revenue-recognition inputs for Finance | RevOps / Finance |
| CS kickoff task triggered, handoff meeting scheduled within 5 business days | AE + CS manager |
| Win-loss signal logged for [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) | AE |
| Reference-rights confirmation (if applicable) | AE |

## MEDDPICC letters in close

Close does not fill new letters. It finalizes the snapshot — what the deal looked like at signature — for downstream consumption (forecast accuracy analysis, postmortem inputs, pattern detection).

## Running close

Close should take 1-5 business days. Delays indicate an upstream issue.

1. **Counter-sign verification.** Confirm the signed document on the signing platform. Download the executed PDF. Store in the deal room.
2. **Finance handoff.** Send the executed contract + an order-summary payload to Finance for billing / rev-rec setup.
3. **CS handoff.** Trigger the expansion-handoff workflow per [`expansion-handoff.md`](expansion-handoff.md). Schedule the joint kickoff call within 5 business days of signature.
4. **CRM update.** Mark closed-won. Enter final ACV, term, edition, effective date, signed-document link. Include a one-paragraph deal summary.
5. **Deal review note.** 3-5 sentence write-up: what won, what almost lost it, what surprised. Goes to the team folder / sales-lead review queue. Feeds win-loss patterns.
6. **MEDDPICC snapshot.** The final state of each letter, for the next forecast-accuracy pass.

## Common failure modes

- **Post-sign scope edits.** Buyer requests a scope adjustment "since we're about to sign." Treat as a re-open of negotiation. Don't close-won on a verbal.
- **CS handoff delayed.** AE loops off the deal before kickoff. First-week experience suffers and expansion signals weaken.
- **Forgetting reference rights.** Close is the cleanest moment to capture reference-call rights. Ask at signature, document in the CRM.
- **Missing deal review note.** The case study, battlecard refresh, and postmortem pipeline all feed off these notes. Skipping them is taxing the next rep in this segment.

## Exit criteria (binary)

- [ ] CRM closed-won with final fields.
- [ ] Executed contract filed.
- [ ] Finance handoff confirmed.
- [ ] CS kickoff task triggered; kickoff meeting on the calendar within 5 business days.
- [ ] Deal review note written and filed.
- [ ] Win-loss signal logged; reference rights captured if applicable.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Typical close cycle: 1-3 business days.
- Finance handoff is a single order-form + billing email.
- CS handoff is email-based with a short kickoff call; full onboarding is self-serve guided.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Typical close cycle: 3-10 business days because of multi-signer execution.
- Finance handoff includes multi-entity billing structure, multi-currency if applicable, and revenue-recognition treatment review for multi-year ramps.
- CS handoff is a formal onboarding project: joint kickoff with executive sponsors, named onboarding manager, and a 30/60/90 plan.
- Reference rights are captured in the contract (not verbally); privacy and PR review may apply.

## Shared-spine inputs

- [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) — patterns we contribute to
- [`../../../shared/pricing/`](../../../shared/pricing/) — commercial terms logged back against pricing policy
- [`../../../shared/data-definitions/`](../../../shared/data-definitions/) — ARR / ACV conventions

## Related

- [`../methodology/`](../methodology/) — MEDDPICC final snapshot
- [`negotiation.md`](negotiation.md) — entry stage
- [`expansion-handoff.md`](expansion-handoff.md) — post-close workflow
- [`../frameworks/`](../frameworks/) — forecast methodology consumes close outputs

## Change log

- 2026-04-20 — Phase 1 initial page.
