---
type: framework
title: Qualification framework
description: Decision tree for whether an account enters active pursuit. Upstream of MEDDPICC; reads ICP fit and committee signals.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - revops-lead
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
  - revops
  - marketing
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Qualification framework

Qualification answers one question: "Does this account merit our time right now?" It reads the shared ICP, the current signals in the account, and the state of the rep's pipeline, and returns engage / engage-later / disqualify. Qualification is upstream of methodology; an account failing qualification should not show up in MEDDPICC inspection [source: sources/internal-docs/README.md].

Qualification is the first place pipeline hygiene either holds or breaks. A book of business top-loaded with accounts that shouldn't be in it burns rep capacity on low-probability work.

---

## The decision tree

Walk the tree top-to-bottom for each account. First firing rule wins.

### Rule 1 — Hard disqualifiers

Check [`../../../shared/icp/disqualifiers.md`](../../../shared/icp/disqualifiers.md). Any match → **disqualify**. Examples:

- Pre-product-market-fit (under ~$10M ARR proxy)
- Regulated industry without the required compliance posture
- Active procurement freeze documented in the last 60 days
- Recent churn or paused account (<180 days ago)

No further assessment. Move to the next account.

### Rule 2 — Tier-1 match

Check [`../../../shared/icp/tier-1.md`](../../../shared/icp/tier-1.md). All firmographic gates pass **and** at least one trigger fires → **engage actively**. Full MEDDPICC. Outbound concentration. First-call priority.

### Rule 3 — Tier-2 match with trigger

Check [`../../../shared/icp/tier-2.md`](../../../shared/icp/tier-2.md). Firmographic gates pass **and** at least one trigger fires → **engage**. Standard pursuit; may deprioritize if rep pipeline is above capacity.

### Rule 4 — Tier-2 match without trigger

Firmographic gates pass, no active trigger → **nurture**. ABM list; wait for a trigger. Do not actively work; do not count in pipeline coverage.

### Rule 5 — Tier-3 match

Check [`../../../shared/icp/tier-3.md`](../../../shared/icp/tier-3.md). Inbound priority only; minimal outbound. If the account self-serves into a paid plan, standard PLG motion applies; if they raise their hand for sales, engage with a light-touch cycle.

### Rule 6 — Below tier

No tier match and no trigger → **disqualify**. Out of scope.

## Inputs the tree consumes

- [`../../../shared/icp/tier-1.md`](../../../shared/icp/tier-1.md), [`tier-2.md`](../../../shared/icp/tier-2.md), [`tier-3.md`](../../../shared/icp/tier-3.md) — canonical tier definitions
- [`../../../shared/icp/disqualifiers.md`](../../../shared/icp/disqualifiers.md) — hard exclusions
- Account-level signals (triggers) surfaced by RevOps tooling, Marketing, and the rep's own research
- Pipeline-capacity awareness — the rep's current active-opportunity count and named-account coverage ratio

## Beyond the tree — the second-pass test

After the tree returns engage or engage-later, a working second-pass test catches the subtler misqualifications:

1. **Is there a named person at the account with a testable pain?** If no, the account is pre-qualification; work in Marketing to surface a pain before Sales enters.
2. **Does our pricing structure fit their likely buying shape?** An enterprise-only pricing reality engaging a self-serve-only segment wastes cycles on both sides.
3. **Is the rep's pipeline already above capacity?** An over-pipelined rep qualifying in a new account adds a stall, not a close. Rule: an account added to active pursuit should displace a stalled one, not stack on top.
4. **Does any deal-blocker exist that has caused losses before?** Single-vendor stack with a competitor already installed; public merger in progress; CIO mandate to consolidate tooling in a way that excludes our category.

## Decision outputs

| Output | Meaning | Downstream action |
|---|---|---|
| **Engage actively** | Tier-1 or high-signal Tier-2 | Full MEDDPICC, weekly inspection, outbound concentration |
| **Engage** | Tier-2 with trigger | Standard pursuit; MEDDPICC applies; may pause if rep capacity strained |
| **Nurture** | Tier-2 without trigger | Marketing owns; Sales re-qualifies when a trigger fires |
| **Inbound-only** | Tier-3 | Minimal outbound; self-serve conversion priority; sales engages on raise-hand |
| **Disqualify** | Hard rule fired or below tier | Remove from pursuit list; do not re-qualify without material change |

## Common failure modes

- **Rubber-stamp qualification.** Rep qualifies everything as engage; pipeline inflates; forecast accuracy collapses. Qualification fails open.
- **Ignoring hard disqualifiers.** Rep is drawn to a logo brand in a regulated industry we don't support; spends three months; loses on a compliance gate that was knowable on day one.
- **Qualifying on a single signal.** One hiring signal alone isn't a qualification — tier firmographic fit plus trigger is the requirement.
- **Missing pipeline capacity.** Rep above capacity keeps adding accounts; active accounts go cold; everything stalls.
- **No re-qualification cadence.** Accounts that passed qualification six months ago are still on the pursuit list with no pulse. Quarterly re-qualification is the floor.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Tree weighs triggers heavily — mid-market without an active trigger is difficult to break into cold.
- Outbound motion targets tier-1 + tier-2-with-trigger; tier-2-without-trigger is Marketing-owned.
- Pipeline capacity is typically 30-50 active named accounts per AE.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Tree weighs tier fit slightly more — the trigger window is longer and more forgiving.
- Named-account model: each rep carries 8-15 named accounts.
- Re-qualification is continuous; a named account is never fully "disqualified" unless a hard rule fires.

## Exit / re-entry rules

- Disqualified accounts re-enter qualification when a material signal changes (hard disqualifier removed, or a tier-unlocking event: funding, leadership change, product launch).
- Nurture accounts graduate to engage on first trigger.
- Engaged accounts that go 90 days without advancing a MEDDPICC letter enter a forced re-qualification (is the deal real, should we disengage, what's the next concrete step).

## Related

- [`../../../shared/icp/`](../../../shared/icp/) — canonical ICP and disqualifiers
- [`../methodology/`](../methodology/) — MEDDPICC, applied after qualification engages
- [`../playbooks/discovery.md`](../playbooks/discovery.md) — first stage once qualified
- [`forecast-methodology.md`](forecast-methodology.md) — consumes the qualified pipeline
- [`deal-desk-escalation.md`](deal-desk-escalation.md) — kicks in once a deal is advanced

## Change log

- 2026-04-20 — Phase 1 initial page.
