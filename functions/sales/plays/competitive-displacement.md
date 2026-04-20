---
type: play
title: Competitive displacement
description: Play for displacing an incumbent vendor when buyer-side dissatisfaction signal is present. Counter-positioning, de-risking, and transition planning.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
  - product-lead
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
  - marketing
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Competitive displacement

A play for accounts where a competitor is incumbent and the buyer has signaled dissatisfaction. Displacement deals are higher-risk than net-new — buyer has sunk cost and political exposure — but close at elevated ACV when they work because the buyer has already validated the category and is ready to spend on a step change [source: sources/internal-docs/README.md].

The play sequences discovery, demo, and evaluation with specific counter-positioning tactics and de-risking artifacts. It does not short-cut the playbooks; it layers displacement-specific work on top.

---

## Trigger

Fires when all are true:

- Known incumbency: the account is using a specific competitor (confirmed via public signal, inbound conversation, or competitive-intel sources).
- Dissatisfaction signal: at least one of — public complaint or candid internal note, new RevOps / Head of Revenue hire reviewing the stack, recent tool-rationalization initiative, contract renewal window open within 6-9 months, visible migration project.
- Our offering covers at least 80% of the incumbent's use cases with clear delta on the dissatisfaction axis.

## Target

The operational lead responsible for the category (Head of RevOps, VP Sales Ops, VP CS depending on our category). Enterprise: additionally the economic buyer and the project's executive sponsor.

## Outcome metric

- Primary: qualified opportunity with named champion and evaluation commit.
- Secondary: POC or pilot scoped.
- Tertiary: decision-criteria document where our delta is explicitly named.

## The sequence

### Stage 1 — Displacement-aware discovery (1-2 weeks)

- **First call focus:** understand the specific pain with the incumbent, not general category pain.
- Probe questions beyond standard discovery:
  - "What were the three biggest reasons you picked [incumbent] originally? Are those still the priorities?"
  - "If you could change one thing about your current setup, what would it be and what's stopping you?"
  - "What does a successful replacement look like? What does a failed replacement look like?"
- **Document the delta.** After the call, write a specific delta note: what we do that the incumbent doesn't, what the incumbent does that we don't, what's equivalent. Honest inventory.
- **Check the win-loss patterns.** Review [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) for displacement deals against this competitor. Prior wins and losses inform the work.

### Stage 2 — Demo tuned to the delta (1-2 weeks)

- The demo emphasizes the delta — the specific thing the incumbent doesn't do that solves the buyer's stated pain. Spending time on equivalent features wastes the buyer's attention.
- Bring a transition plan to the second demo: how migration from the incumbent works, estimated duration, who does what, what breaks temporarily.
- Address the incumbent's strengths honestly. Buyer respects acknowledgment; selling against an imaginary weak competitor damages trust.
- Reference the specific battlecard for the incumbent (if filled) in [`../battlecards/`](../battlecards/).

### Stage 3 — De-risked evaluation (30-60 days)

- POC scope includes the migration itself where feasible — not just the end-state workflow. Buyer derisks the transition, not only the destination.
- Measure against concrete criteria that include parity-with-incumbent on the workflows they depend on, plus the delta gains.
- Weekly pulse surfaces transition-specific blockers (data export from incumbent, API parity gaps, retraining needs).
- Executive sponsor is involved from the POC kickoff. Displacement decisions have political weight that operational leads can't absorb alone.

### Stage 4 — Commercial structuring

- Ramp structure is common in displacement: a lower first-year commit with expansion in year two as usage shifts fully off the incumbent.
- Buyouts or co-termination of the incumbent contract sometimes figure in; route through [`../frameworks/deal-desk-escalation.md`](../frameworks/deal-desk-escalation.md).
- Reference-customer commitments are valuable here — incumbent reference pressure is real.

## Counter-positioning principles

- **Specific over general.** "Our integration with [system] is native, theirs requires middleware" beats "we integrate better."
- **Buyer-said, not us-said.** "You mentioned earlier that export turnaround takes 48 hours; in our setup this is on-demand" is stronger than "we're faster."
- **Never attack without evidence.** Claims about the competitor that aren't sourceable erode trust. Cite [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) or observed calls; if neither, don't make the claim.
- **Respect the incumbent choice.** Mocking the competitor mocks the buyer who picked them. The buyer has to feel okay about the transition.

## Common failure modes

- **Pitching on the delta without matching parity.** Delta features matter; parity failures kill deals. An AE who wins the demo on our delta and loses evaluation because a core workflow degrades has mis-sold.
- **Underselling transition cost.** Buyers know transitions are hard. Pretending otherwise signals we haven't thought it through.
- **Skipping executive sponsorship.** Displacement deals stall at the economic-buyer layer without an executive sponsor; operational lead alone can't drive the change.
- **Ignoring the incumbent's contract dynamics.** Renewal dates, auto-renewal clauses, termination notice windows — ignorance here wastes 3-6 months.
- **Attacking rather than competing.** Personal attacks on the competitor, unsourced claims, or demo snide-comments. Every time.

## Outcome to next play

- Successful displacement closed → immediate referral-ask candidate ([`referral-ask.md`](referral-ask.md)) once go-live is stable.
- Lost to the incumbent's counter-proposal → contribute a detailed postmortem using [`../../../schema/page-templates/sales/postmortem.md`](../../../schema/page-templates/sales/postmortem.md).
- Stalled → re-qualify via [`../frameworks/qualification.md`](../frameworks/qualification.md); if the trigger fades, nurture with quarterly pulse.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Cycle: 60-120 days from trigger to close.
- POC is typically 30-45 days; often done alongside continued incumbent usage.
- Single economic buyer; lighter political dynamics.
- Migration often self-serve or lightly-supported.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Cycle: 6-12 months, sometimes longer.
- POC is 60-90 days with formal kickoff, success criteria, executive check-ins.
- Migration planning is a real project with named resources on both sides.
- Contract buyouts, co-termination, and parallel-run periods are common in commercial structuring.
- Legal and procurement review factor in the incumbent's contract terms.

## Shared-spine inputs

- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — incumbent profiles and counter-positioning
- [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) — prior displacement evidence
- [`../../../shared/positioning/`](../../../shared/positioning/) — value-prop framing
- [`../../../shared/pricing/`](../../../shared/pricing/) — ramp structures for displacement
- [`../battlecards/`](../battlecards/) — deployable counter-positioning per competitor

## Related

- [`../playbooks/discovery.md`](../playbooks/discovery.md), [`demo.md`](../playbooks/demo.md), [`evaluation.md`](../playbooks/evaluation.md) — stages this play layers onto
- [`../frameworks/deal-desk-escalation.md`](../frameworks/deal-desk-escalation.md) — ramp and buyout structuring
- [`../battlecards/`](../battlecards/) — per-competitor tactics

## Change log

- 2026-04-20 — Phase 1 initial page.
