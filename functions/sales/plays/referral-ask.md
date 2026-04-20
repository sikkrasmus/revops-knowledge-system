---
type: play
title: Referral ask
description: Moment-based play for sourcing warm pipeline from existing customers at success milestones.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - cs-lead
  - marketing-lead
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
  - cs
  - marketing
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Referral ask

A moment-based play: ask existing customers for referrals at the specific times when they are most likely to say yes and most likely to make a useful introduction. Warm pipeline from referrals converts at materially higher rates than cold outbound [source: sources/internal-docs/README.md], but only when the ask is timed, specific, and easy for the customer.

This play co-runs with CS — CS sees the moments first; Sales executes the ask. The play sits in `functions/sales/` because the pipeline outcome is a Sales asset.

---

## Trigger

The ask fires at one of five moments:

1. **Go-live success.** The initial deployment hit its 30 or 60-day milestone with the metric on track.
2. **EBR moment.** The quarterly or semi-annual executive business review included a customer-stated "this is working."
3. **Expansion signature.** Customer just expanded the footprint — upgrade, additional seats, add-on, additional entity.
4. **Public advocacy moment.** Customer posted a positive signal publicly — LinkedIn post, panel appearance, podcast mention.
5. **NPS promoter response.** Customer returned an NPS score of 9 or 10 with a comment.

No other moment fires the play. Asking during onboarding, during a support escalation, or during a renewal negotiation is bad timing and actively damages the relationship.

## Target

The customer contact in the strongest relational position — typically the champion from the original deal, sometimes the executive sponsor, occasionally a power user who raised their hand publicly. CS confirms the right person before Sales makes the ask.

## Outcome metric

- Primary: named, warm introductions to qualified prospects.
- Secondary: public-attributed references (LinkedIn post, case study, speaking opportunity).
- Tertiary: participation in our reference program (the customer agrees to take reference calls).

## The ask — what good looks like

The working ask has four pieces:

1. **Acknowledge the specific moment.** "You mentioned at the EBR that the migration hit its 60-day metric two weeks early." Acknowledgment that is specific is believable; generic thanks is forgettable.
2. **Offer something useful in exchange.** Not cash (mid-market + enterprise don't need incentives and incentives damage trust). Examples: early access to a new capability, a curated peer forum invite, speaking opportunity, case-study placement.
3. **Make the referral specific, not open-ended.** "Is there a Head of RevOps at [peer company] you'd introduce us to?" is easier to answer than "know anyone who could use us?"
4. **Make the introduction easy.** Provide a written 3-sentence intro the customer can forward. The customer should have to do ~30 seconds of work.

Anti-pattern asks: "any referrals?", any ask with a cash incentive in mid-market or enterprise, any ask during an unrelated conversation (renewal, upsell, support).

## The sequence

### Before the ask

- CS surfaces the moment in the weekly sales-CS sync.
- Sales confirms the relationship-strongest contact and the right company archetype to target.
- Sales drafts the ask — specific moment, specific named target prospect, written intro draft.

### The ask

- Best medium: email (not LinkedIn, not phone). Gives the customer time to respond without pressure.
- Length: ≤100 words.
- Single specific named target per ask where possible; at most 2-3 targets per ask.

### After the ask

- If yes: customer forwards our intro draft; we respond to the intro with value (not a pitch) within 24 hours.
- If soft no: thank them, ask whether now isn't the right time or whether they don't know the prospect; respect the answer.
- If no response in 7 days: one polite follow-up, then drop. Do not re-ask at this moment.

### After a successful intro

- Loop the customer in on progress (briefly). "Wanted you to know we had a great first conversation with [name] yesterday. Thank you again for the intro."
- Three months later, send a genuine thank-you even if the opportunity didn't close.

## Common failure modes

- **Asking without moment.** Cold referral asks on ordinary check-ins return polite deflections and signal we're transactional.
- **Open-ended asks.** "Who else could use us?" puts work on the customer; they default to saying they'll think about it; they don't.
- **Cash incentives in mid-market/enterprise.** Cheapens the relationship; damages the customer's trust signal when they forward the intro.
- **Asking in a support or renewal window.** Misreads the relational state; looks tone-deaf.
- **No follow-through on the intro.** Customer makes the intro; we reply slowly; customer's credibility with the prospect takes a hit. They won't do it again.

## Outcome to next play

- Warm intro received → prospect enters [`outbound-sequence-mid-market.md`](outbound-sequence-mid-market.md) at a compressed cadence (intros skip the cold-opener touches); first call is typically booked within 7-14 days.
- Public attribution given → Marketing surfaces the moment for case-study pipeline.
- Reference-program participation → CS updates the customer reference list; AE adds to the prospecting toolkit.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Most common trigger is go-live success or NPS promoter moment.
- Ask cadence: 1-2 asks per year per customer maximum; annual cap avoids fatigue.
- Target 1-2 named prospects per ask.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- EBR moments and expansion signatures dominate.
- Ask cadence: 1 ask per year per executive relationship, coordinated with CS and the executive sponsor on our side.
- Target prospects are often named at the executive peer-network level; intros may route through the customer's exec assistant.
- Reference program participation is higher-leverage than specific intros for some enterprise customers — a good reference call converts at the same rate as an intro.

## Shared-spine inputs

- [`../../../shared/personas/`](../../../shared/personas/) — the persona that's best positioned to make the intro
- [`../../../shared/icp/`](../../../shared/icp/) — the tier the target prospect needs to match
- [`../../../shared/positioning/`](../../../shared/positioning/) — the language the intro carries

## Related

- [`../playbooks/expansion-handoff.md`](../playbooks/expansion-handoff.md) — the CS handoff that keeps this play feasible
- [`outbound-sequence-mid-market.md`](outbound-sequence-mid-market.md) — where warm intros feed
- [`renewal-acceleration.md`](renewal-acceleration.md) — referral asks commonly emerge mid-renewal cycle

## Change log

- 2026-04-20 — Phase 1 initial page.
