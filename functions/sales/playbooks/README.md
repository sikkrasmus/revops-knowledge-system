---
type: function-readme
title: Sales playbooks
description: Deal-stage playbooks. One page per stage, each declaring inputs, exit criteria, and the MEDDPICC letters it fills.
owner: rasmus@latentflows.com
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

# Sales playbooks

One playbook per deal stage. Each page answers "what does the rep do in this stage, what does the stage produce, and what has to be true to exit."

The canonical stage model below is what CRM stages and forecast categories map to. The model is deliberately light — seven stages, each with clean entry and exit criteria, each tied to specific MEDDPICC letters. Stage sprawl (12+ stages) makes pipeline inspection impossible and forecasts meaningless [source: sources/internal-docs/README.md].

---

## Stage model

| Order | Stage | Playbook | Primary MEDDPICC letters |
|---|---|---|---|
| 1 | Discovery | [`discovery.md`](discovery.md) | M, I, C (Champion), E |
| 2 | Demo | [`demo.md`](demo.md) | D (criteria), refines M + I |
| 3 | Evaluation | [`evaluation.md`](evaluation.md) | D (process), C (competition), P |
| 4 | Proposal | [`proposal.md`](proposal.md) | P (paper), E (economic buyer validation) |
| 5 | Negotiation | [`negotiation.md`](negotiation.md) | P (paper), E (final approval) |
| 6 | Close | [`close.md`](close.md) | P (final paper) |
| 7 | Expansion handoff | [`expansion-handoff.md`](expansion-handoff.md) | — (post-signature handoff to CS) |

Each playbook page contains:

- What the stage is for
- Entry criteria (what must be true to enter)
- What the stage produces (artifacts, confirmed information)
- Common failure modes
- MEDDPICC letters this stage primarily fills or refines
- Motion and segment variants (via section labels)
- Exit criteria (binary conditions)
- Shared-spine references the stage depends on

## How playbooks differ from plays

A **playbook** is stage-bound. A **play** ([`../plays/`](../plays/)) is a repeatable motion across stages — outbound sequence, competitive displacement, referral ask, renewal acceleration. Playbook: "what do we do in the discovery stage." Play: "how do we run the outbound sequence that fills the top of the funnel."

## How playbooks relate to methodology

The methodology ([`../methodology/`](../methodology/)) names what must be true for a deal to be qualified. Playbooks name what the rep does at each stage to make those things true. Playbooks do not replace MEDDPICC; they operationalize it.

## Related

- [`../methodology/`](../methodology/) — MEDDPICC, the diagnostic framework these playbooks fill
- [`../frameworks/`](../frameworks/) — qualification, deal-desk, forecast methodology
- [`../plays/`](../plays/) — repeatable plays that cut across stages
- [`../../../shared/`](../../../shared/) — the spine every playbook consumes from

## Change log

- 2026-04-20 — Phase 1 scaffold. Seven-stage model established.
