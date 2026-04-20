---
type: playbook
title: Demo playbook
description: Demo is the working session that turns hypothesized pain into a concrete evaluation plan. Not a feature tour.
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
  - marketing
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Demo playbook

Demo is a working session to confirm that what the product does maps to the pain surfaced in discovery, on artifacts that resemble the buyer's real world. It is not a feature tour, not a capabilities overview, and not a demo of the full product. A good demo is 40% the buyer talking.

---

## Entry criteria

- Discovery exit criteria met ([`discovery.md`](discovery.md)).
- Metric + baseline + target documented.
- At least one additional stakeholder confirmed for the demo (not just the champion).
- A specific workflow or artifact the buyer wants to see resembling their own data / process.

## What demo produces

- Confirmation or falsification that the product solves the specific pain named in discovery.
- A decision-criteria draft refined into a written list (3-8 items).
- An evaluation-stage scope: what a POC / pilot / trial looks like, with stakeholders and success criteria.
- Further committee members identified (often a demo surfaces the technical evaluator and, for enterprise, the security reviewer).

## MEDDPICC letters this stage touches

- **D — Decision criteria**: moves from sketched to written, prioritized, and shared.
- **M — Metrics**: refined — translates the high-level business metric into specific product telemetry or workflow outputs.
- **I — Identify pain**: pressure-tested. If the demo doesn't resonate with the room, pain is not as named.
- **C — Competition**: commonly surfaces. Buyer reveals other vendors being shown similar demos.
- **C — Champion**: tested by observing who runs the room after the AE finishes.

## The demo structure

The working structure is recap → scenario walk → evaluation scope → next step. Not slides-then-product.

1. **Recap (2-3 min).** "Last time you described X pain, Y metric, Z stakeholders. Today we're going to walk through how the product handles the specific Z-stakeholder workflow you mentioned. If that doesn't resonate, we redirect mid-session."
2. **Scenario walk (20-30 min).** Use a sandbox that resembles the buyer's world — their naming conventions, their segment, their integration. Do the workflow the buyer described. Stop often. Ask "what does this look like in your setup?" not "do you see how this would help?"
3. **Evaluation scope (10-15 min).** "Based on what you've seen, here's what I'd propose as a short evaluation. We'd connect [system A + system B], run [workflow 1 + 2] for [N days], measure [metric + target]. Who needs to be involved? What success criteria matter?"
4. **Next step (5 min).** Calendar the evaluation kickoff. Name artifacts. Confirm owners.

## Common failure modes

- **Full product tour.** Rep demos every feature "in case something sticks." Buyer disengages; pain-mapping never happens.
- **Sandbox that looks nothing like the buyer's world.** Demos in a generic environment tell the buyer to imagine; imagination is expensive.
- **Demo-to-champion-only.** Champion already believes. Demo exists to convert the second and third stakeholders.
- **No evaluation scope named.** Demo ends with "great, we'll be in touch." This is a stalled deal in the making.
- **Competitor comparisons in the demo.** Attacking a competitor in the demo room degrades trust. Counter-positioning lives in battlecards and async materials.

## Exit criteria (binary)

- [ ] Decision criteria in writing, prioritized, acknowledged by buyer.
- [ ] At least one additional stakeholder has attended and voiced a reaction.
- [ ] Evaluation-stage scope proposed: systems, workflow, duration, success criteria, owners.
- [ ] Competition explicit — named alternatives or confirmed no-alternative.
- [ ] Next step calendared with named participants and specific artifact.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Single demo session usually suffices; sometimes a 20-min follow-up for a second stakeholder.
- Evaluation scope is typically a 2-4 week self-run trial rather than a formal POC.
- Technical depth is moderate; integration questions are answered by showing, not by architecture slides.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Demo is usually a series: overview for the committee, technical deep-dive with architects, security-focused session, sometimes a scripted live-data walkthrough.
- Evaluation scope is a formal POC with a signed scoping doc, success criteria confirmed by the economic buyer, and a defined decision date.
- A solutions or sales engineer co-runs demos; AE leads the room and relationship; SE carries the product depth.

## Shared-spine inputs

- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — SKU inclusions to scope the demo accurately
- [`../../../shared/positioning/`](../../../shared/positioning/) — value-prop framing
- [`../../../shared/personas/`](../../../shared/personas/) — who's in the room, what matters to each
- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — quiet competitor awareness (not for attacking in the room)

## Related

- [`../methodology/`](../methodology/) — MEDDPICC the demo advances
- [`discovery.md`](discovery.md) — entry stage
- [`evaluation.md`](evaluation.md) — next stage
- [`../battlecards/`](../battlecards/) — async competitive material

## Change log

- 2026-04-20 — Phase 1 initial page.
