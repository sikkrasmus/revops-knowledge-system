---
type: play
title: Outbound sequence — mid-market
description: 21-day multi-channel outbound sequence for named mid-market accounts with active triggers. Produces qualified first meetings.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - marketing-lead
last_reviewed: 2026-04-20
verified_until: 2026-10-20
motion:
  - sales-assisted
segment:
  - mid-market
consumers:
  - sales
  - marketing
  - revops
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Outbound sequence — mid-market

A 21-day, 8-touch, multi-channel sequence for named mid-market accounts where the qualification framework has returned engage or engage actively and a trigger is active. Produces first-call meetings with a persona on the canonical buying committee [source: sources/internal-docs/README.md].

This is not mass outbound. It is tight, per-account, hand-shaped at the critical touches and automated at the routine ones.

---

## Trigger

Fires when all are true:

- Account on the tier-1 or tier-2-with-trigger list per [`../frameworks/qualification.md`](../frameworks/qualification.md)
- Target persona identified (mapped to [`../../../shared/personas/`](../../../shared/personas/))
- At least one named trigger fresh in the last 90 days — hire, funding event, product launch, tool consolidation, public pain signal

## Target

One named persona per account — typically Head of RevOps, VP Sales, or CRO for this tier [source: sources/internal-docs/README.md]. Optional secondary contact (deal desk manager, senior operator) when committee evidence suggests multi-buyer.

## Outcome metric

- Primary: meetings booked with the target persona.
- Secondary: meaningful replies (stated interest + willingness to continue).
- Tertiary: negative replies with useful intel (wrong time, different stakeholder, different problem).

## The sequence

| Day | Channel | Touch | Personalization |
|---|---|---|---|
| 0 | Email | Trigger-based opener — names the signal, positions one value prop, asks a direct question | High — trigger + one insight specific to the account |
| 2 | LinkedIn | Connect request with short note referencing the email | Medium — acknowledges email without repeating it |
| 4 | Email | Value forward — a specific resource relevant to the trigger (customer story, benchmark, short frame) | Medium — matched to the persona's likely operating focus |
| 7 | Phone | Call + voicemail if no answer | High — prepared to discuss the trigger, not pitch |
| 10 | Email | Social proof — a peer-company outcome in the same tier | Medium — abstract, not named |
| 14 | LinkedIn | DM that references a specific piece of the recipient's public content | High — manual, never scripted |
| 18 | Email | Hard ask — "is this a non-priority for you right now, or the wrong moment?" | Low — template |
| 21 | Email | Courtesy close — "I'll pause outreach here; open to re-engage when the timing is right" | Low — template |

Each email is ≤ 100 words. Voicemails are ≤ 30 seconds. LinkedIn notes are ≤ 250 characters.

## The opener — what good looks like

The day-0 opener is the single highest-leverage touch. A working opener has:

- A subject line referencing the trigger, not the product.
- A single opening sentence that demonstrates the rep knows something specific about the account.
- One value prop framed as a question ("Is [problem] something your team is reconciling since [trigger event]?").
- A direct, low-friction ask ("Worth a 15-minute conversation next week?").
- No boilerplate signature block, no calendar link in the first touch.

Anti-pattern openers: pitches, feature lists, "I noticed you're the [title]" without a trigger, "touching base" language.

## Templates and shared-spine references

- Email openers and value-forward copy pull language from [`../../../shared/positioning/elevator-pitches.md`](../../../shared/positioning/elevator-pitches.md) — specifically the cold-email and first-call variants.
- Social-proof touches reference customer-archetype patterns (not real customers) from [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md).
- Persona angles come from [`../../../shared/personas/`](../../../shared/personas/) — never treat the recipient as a generic buyer.

## Common failure modes

- **Cadence without personalization.** Running the sequence as pure automation. Reply rates collapse; negative signals to the domain compound.
- **Pitching in the opener.** Using the first touch to explain what we sell. Openers that sell don't work [source: sources/internal-docs/README.md].
- **Ignoring replies.** A "not now" reply is real signal — acknowledge it, pause the sequence, re-engage on a later trigger.
- **Wrong persona in the sequence.** Running the play against a persona that's not on the buying committee — produces polite replies that go nowhere.
- **No disqualification.** Continuing the play after the account has signaled a hard disqualifier (new competitor contract signed, procurement freeze). Burns reputation.

## Outcome to next play

- Meeting booked → discovery playbook ([`../playbooks/discovery.md`](../playbooks/discovery.md)).
- Negative reply with context → re-qualify, potentially nurture.
- No reply after day 21 → pause for 90 days; re-sequence on next trigger.
- Negative reply without context → respect it; remove from active list; note in CRM.

## Motion and segment notes

This play is scoped to **sales-assisted / mid-market**. Variants are separate plays, not in-file labels:

- Enterprise outbound runs as a longer, more committee-oriented sequence; not covered by this play.
- PLG self-serve conversion follows a different play (Phase 2 scope).

## Shared-spine inputs

- [`../../../shared/icp/tier-1.md`](../../../shared/icp/tier-1.md), [`tier-2.md`](../../../shared/icp/tier-2.md) — who this play targets
- [`../../../shared/personas/`](../../../shared/personas/) — persona angles
- [`../../../shared/positioning/elevator-pitches.md`](../../../shared/positioning/elevator-pitches.md) — opener and touch copy
- [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) — social-proof framing

## Related

- [`../frameworks/qualification.md`](../frameworks/qualification.md) — upstream gate
- [`../playbooks/discovery.md`](../playbooks/discovery.md) — what comes after a successful meeting booking
- [`referral-ask.md`](referral-ask.md) — parallel pipeline source

## Change log

- 2026-04-20 — Phase 1 initial page.
