---
type: function-readme
title: Sales plays
description: Repeatable plays — narrower than playbooks, more concrete than frameworks. Outbound, displacement, referral, renewal acceleration.
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
  - marketing
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Sales plays

Plays are repeatable motions that cut across deal stages. A play has a trigger (signal that fires it), a sequence (what the rep does, in order), an artifact set (touches, templates), and a measurable outcome. Plays are what reps run; playbooks are how stages work.

The four plays in this directory cover the common shapes of active work:

| Play | Trigger | Primary motion |
|---|---|---|
| [`outbound-sequence-mid-market.md`](outbound-sequence-mid-market.md) | Named account matches tier-1 or tier-2-with-trigger | Build pipeline; set first-call conversations |
| [`competitive-displacement.md`](competitive-displacement.md) | Known competitor incumbency + buyer-side dissatisfaction signal | Replace the incumbent vendor |
| [`referral-ask.md`](referral-ask.md) | Successful go-live milestone or positive EBR moment | Source warm pipeline from existing customers |
| [`renewal-acceleration.md`](renewal-acceleration.md) | Renewal window opens; expansion signals present | Close renewal early + capture expansion ACV |

## How plays relate to playbooks and frameworks

- **Playbooks** (stage) — what a rep does in discovery, demo, evaluation, etc.
- **Frameworks** (decision) — when and how to decide, given inputs.
- **Plays** (motion) — repeatable workflows that compose playbook stages with specific touches and templates.

An outbound play runs through multiple stages — pre-discovery through discovery. A displacement play runs through discovery, demo, and evaluation with specific counter-positioning tactics. A play is the shape of a sequence; the playbooks are the shape of each stage inside that sequence.

## Authoring new plays

New plays meet these conditions before they land here:

1. **Trigger is unambiguous.** A rep should be able to look at an account and know within 2 minutes whether this play applies.
2. **Sequence is reproducible.** Another rep can run the same play and expect comparable results — if the play depends on rep ingenuity, it's a tactic, not a play.
3. **Artifacts are versioned and shared-spine-linked.** Templates for touches, emails, and async materials cite the shared positioning / pricing / competitive-intel they depend on.
4. **Outcome is measurable.** Meetings booked, stages advanced, ACV influenced, renewal retention rate.

A draft play that doesn't meet all four sits in a `/plays/drafts/` area until it does (not yet created in Phase 1).

## Related

- [`../playbooks/`](../playbooks/) — the stage model plays operate inside
- [`../methodology/`](../methodology/) — MEDDPICC, filled by plays
- [`../frameworks/`](../frameworks/) — qualification upstream; deal-desk downstream
- [`../../../shared/`](../../../shared/) — positioning, pricing, competitive-intel that plays cite

## Change log

- 2026-04-20 — Phase 1 scaffold. Four plays established.
