---
type: play
title: Renewal acceleration
description: Play to close renewals 90-120 days early while capturing expansion ACV. Coordinated with CS; reads usage, committee, and commercial signals.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - cs-lead
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
  - cs
  - revops
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Renewal acceleration

A play to close renewals 90-120 days early and capture expansion ACV at the renewal moment. The default rep behavior — wait until 30 days before renewal and react — compresses leverage on both sides and frequently results in flat renewals when expansion would have been feasible [source: sources/internal-docs/README.md].

The play is co-run with CS: CS owns the customer relationship and the usage signal; Sales owns the commercial structuring. When the two are synchronized from 120 days out, the renewal becomes an expansion conversation at the right time, not a retention scramble at the wrong one.

NRR — [`../../../shared/data-definitions/metrics/nrr.md`](../../../shared/data-definitions/metrics/nrr.md) — is the downstream metric this play protects.

---

## Trigger

Fires 120 days before the renewal date for every active customer, with modifiers:

- **Green signal** (accelerate): usage trending up, adoption above target, positive EBR, expansion-watch signals firing (see [`../playbooks/expansion-handoff.md`](../playbooks/expansion-handoff.md)).
- **Yellow signal** (stabilize before accelerating): usage flat, champion changed, recent support escalations. Run the CS stabilization cycle first; bring Sales in at 90-day mark if stabilized.
- **Red signal** (retention mode, not this play): usage down, champion gone, recent severe escalation, hard signal of competitive evaluation. This is a different play (not covered in Phase 1).

## Target

Champion + economic buyer from the original deal, plus new stakeholders who came in during the customer's deployment (expansion candidates, new executive sponsors, additional use cases).

## Outcome metric

- Primary: renewal + expansion closed 90-120 days early with NRR > 100%.
- Secondary: multi-year renewal (extending term) with updated pricing structure.
- Tertiary: flat renewal — the minimum acceptable outcome in a yellow-signal account, paired with a stabilization plan.

## The sequence

### T-120 days — joint CS + Sales pulse

- CS reports on usage, adoption, champion health, satisfaction signals.
- Sales reviews the original MEDDPICC snapshot — especially the committee map — for drift: champion turnover, economic buyer change, new stakeholders.
- Decision: green / yellow / red.
- If green: move to T-90 business-case prep.

### T-90 days — business-case prep

- Sales + CS jointly prepare a value-recap artifact:
  - The business metric from the original proposal + current state of that metric (delivered, in progress, missed).
  - Specific outcomes the customer has seen (quantified where possible).
  - Expansion candidates named: new workflows, additional teams, additional entities, new SKUs.
- The artifact is shaped as "here's what you've gained" followed by "here's what you could gain next" — not a pitch deck, a data-backed summary.
- Share the artifact with the champion asynchronously; schedule a 30-60 minute conversation to walk it.

### T-60 days — expansion conversation

- Joint meeting with the champion and economic buyer.
- Sales walks the value-recap artifact; customer validates or corrects the numbers.
- Expansion options are presented as specific proposals with pricing, not abstract "here's what we could do together."
- If expansion is in scope, a revised proposal follows within 5 business days.
- If expansion is not in scope but renewal is confirmed, commercial terms are structured for a multi-year signature.

### T-30 days — signature

- Proposal converged. Contract redlined. Paper-process through per [`../playbooks/negotiation.md`](../playbooks/negotiation.md).
- Signature obtained before the original renewal date.
- CS receives the updated customer shape for onboarding of any expansion scope.

## Commercial structuring

- **Multi-year term uplift.** A 3-year renewal at a stepped price escalator (year 1 flat or light lift, year 2-3 more material) often closes faster than a 1-year renewal because the customer wants price certainty.
- **Expansion bundled into renewal.** New SKUs or add-ons added at the renewal moment with pricing per [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/).
- **Ramp usage commits.** For usage-billed motions, expand the committed tier now to capture trajectory upside; see [`../../../shared/pricing/usage-meters.md`](../../../shared/pricing/usage-meters.md).
- **Non-standard asks go through [`../frameworks/deal-desk-escalation.md`](../frameworks/deal-desk-escalation.md).** Renewal acceleration is not a license to skip deal-desk routing.

## Common failure modes

- **Late start.** Kicking off at T-30 days. Renewal slips to last-minute; expansion conversation never happens.
- **Renewal as pure retention.** Approaching the conversation defensively ("please re-sign") rather than with a business case. Customer reads the posture; renewal becomes flat by default.
- **Sales disengaged pre-trigger.** Sales disappears after closing, then reappears at renewal. Champion doesn't trust the re-engagement. CS-Sales continuity from kickoff prevents this.
- **Expansion pitched without usage data.** Offering expansion when the customer hasn't fully deployed the current scope. Buyer feels over-sold.
- **No economic-buyer refresh.** Economic buyer from the original deal has moved on. Sales pitches the expansion to a champion who doesn't have current budget authority. Renewal becomes stalled at a new approval layer.
- **Skipping the yellow-signal stabilization cycle.** Treating a yellow-signal account like green. Push-to-expand on a wobbling relationship accelerates churn rather than NRR.

## Outcome to next play

- Successful expansion + multi-year → referral-ask candidate within 60 days of signature.
- Stabilized but not expanded → re-run the play at the next renewal cycle with stabilization as the foundation.
- Moved to red signal during the cycle → pivot into a retention play (not in Phase 1 scope).

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- 60-90 day acceleration window is realistic; 120 days may be over-engineered for the cycle length.
- Expansion candidates are usually seat growth or add-on SKUs.
- Commercial structuring is light; multi-year uplift is the main lever.
- Often a single joint CS + Sales call covers T-60; another covers signature.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Full 120-day cycle is realistic and often shortest-feasible.
- Expansion candidates include new business units, new geographic entities, new product lines, custom usage commits.
- Commercial structuring includes MSA refresh, multi-year ramps, custom tier construction, optional reference-program extension.
- Executive business review cycle often aligns naturally with the T-90 and T-60 moments.
- Procurement re-engagement at T-45 with re-approval; procurement treats the renewal as a new vendor purchase in some orgs.

## Shared-spine inputs

- [`../../../shared/data-definitions/metrics/nrr.md`](../../../shared/data-definitions/metrics/nrr.md) — the downstream metric
- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — expansion SKU catalog
- [`../../../shared/pricing/`](../../../shared/pricing/) — ramp structures, multi-year mechanics
- [`../../../shared/pricing/usage-meters.md`](../../../shared/pricing/usage-meters.md) — usage-meter re-tiering
- [`../../../shared/personas/buying-committees/`](../../../shared/personas/buying-committees/) — committee refresh for renewal

## Related

- [`../playbooks/expansion-handoff.md`](../playbooks/expansion-handoff.md) — the CS handoff that keeps this play feasible
- [`../frameworks/deal-desk-escalation.md`](../frameworks/deal-desk-escalation.md) — non-standard-ask routing
- [`referral-ask.md`](referral-ask.md) — downstream pipeline play
- [`../playbooks/negotiation.md`](../playbooks/negotiation.md) — paper-process for the renewal contract

## Change log

- 2026-04-20 — Phase 1 initial page.
