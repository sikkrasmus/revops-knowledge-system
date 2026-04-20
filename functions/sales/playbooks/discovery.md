---
type: playbook
title: Discovery playbook
description: What a rep does in discovery — the first real working session with the buyer. Fills Metrics, Identify pain, Champion, and starts Economic buyer.
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

# Discovery playbook

Discovery is the first working session — the call where the rep stops pitching and starts inspecting. The goal is to leave discovery with four things: a quantified pain, a named economic buyer, a verified (or at least hypothesized) champion, and a decision criteria draft. Everything downstream is easier or harder to the extent these four are solid [source: sources/internal-docs/README.md].

---

## Entry criteria

- Account passes tier-1 or tier-2 fit per [`../../../shared/icp/`](../../../shared/icp/).
- A scheduled working call (30-60 min) with a named contact who has stated a problem.
- A hypothesis about which shared persona the contact maps to ([`../../../shared/personas/`](../../../shared/personas/)).
- Rep has read the last three related calls / email threads in the account and the ICP tier page for the segment.

## What discovery produces

| Artifact | Form | Where it lives |
|---|---|---|
| Quantified pain statement | Email recap to champion + CRM note | CRM opportunity |
| Metric + baseline + target | Email recap confirmed by champion | CRM opportunity |
| Economic buyer name + committee sketch | CRM account record | CRM account |
| Champion hypothesis (pre-champion or confirmed) | CRM opportunity | CRM opportunity |
| Decision criteria draft (3-5 items) | Email recap or shared doc | CRM opportunity |
| Next-step artifact (demo scope, follow-up call, async artifact) | Calendar invite + prep doc | Calendar |

## MEDDPICC letters this stage fills

- **M — Metrics**: baseline + target + deadline + owner. This is the single hardest letter to get in discovery; failing here is the most common source of stall at proposal stage [source: sources/internal-docs/README.md].
- **I — Identify pain**: current-state description with named owner and impact.
- **C — Champion**: confirmed or at minimum hypothesized with a testable next step.
- **E — Economic buyer (partial)**: named, title confirmed, path to meeting them sketched.

Decision criteria, Decision process, Paper process, and Competition are typically refined after discovery — see [`demo.md`](demo.md), [`evaluation.md`](evaluation.md).

## What a good discovery call sounds like

A SPICED-style structure is the simplest working question order. Three minutes of framing, 35 minutes of the buyer talking, 10 minutes on next steps.

1. **Situation.** "Tell me about the current state — who touches this workflow today, how long it takes, what tools."
2. **Pain.** "What breaks? Where does it slow down? Who gets paged when it does?"
3. **Impact.** "What's the cost of the status quo for another two quarters? Which number on your board slide is affected?"
4. **Critical event.** "Why solve this now? What triggers the timeline?"
5. **Decision.** "Walk me through how a purchase of this size gets approved here."

The rep takes notes, does not present, and summarizes at the end.

## Common failure modes

- **Demo-in-discovery.** The rep pitches the product instead of inspecting the problem. Discovery becomes a feature tour and the buyer doesn't reveal the metric, the economic buyer, or the real champion.
- **Accepting qualitative pain.** "Our quoting is slow" is not quantified pain. If the rep leaves without a number, Metrics is unfilled and the deal doesn't forecast.
- **Missing the committee map.** Rep asks about the contact's role but not about everyone else involved. Economic buyer and Champion both live in the committee; skipping the committee question hides them.
- **Next step is "send more info."** A discovery that ends with "I'll send over some materials" has produced nothing testable. Good next steps have artifacts and deadlines.

## Exit criteria (binary)

- [ ] Quantified pain statement captured in writing and confirmed by the contact.
- [ ] Metric + baseline + target + timeframe + owner documented.
- [ ] Economic buyer named with title; path to meeting them identified.
- [ ] Champion hypothesized with a small testable ask in place.
- [ ] Decision criteria draft (3+ items) emailed back and acknowledged.
- [ ] Next step on calendar with named participants and a specific artifact promise.

Any box unchecked → the stage is not complete, even if CRM stage has been flipped. The forecast penalty for premature stage-advance is significant [source: sources/internal-docs/README.md].

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- One 45-minute call usually covers discovery end-to-end.
- Contact is frequently also the champion and occasionally also the economic buyer. When all three collapse into one person, the deal is either very fast or very fragile; force a committee conversation early.
- Decision criteria draft is typically 3-5 items; rarely formal procurement.
- Timebox: discovery should complete within 10 business days of first qualified conversation; longer suggests the buyer isn't prioritized.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Discovery is multi-call: first the operational champion, then a technical deep-dive, then an executive session with the economic buyer or sponsor.
- Decision criteria often comes from a formal internal doc (not a casual email); ask for it explicitly.
- Committee map should include: operational champion, technical evaluator, economic buyer, procurement contact, legal contact, security contact. Most will not be in the first call; all should be named by end of discovery.
- Timebox: 3-6 weeks for discovery end-to-end is normal; longer than 8 weeks without a committee map is a qualification problem.

## Shared-spine inputs

- [`../../../shared/icp/`](../../../shared/icp/) — tier and segment qualification
- [`../../../shared/personas/`](../../../shared/personas/) — persona map for who the rep is talking to
- [`../../../shared/personas/buying-committees/`](../../../shared/personas/buying-committees/) — canonical committee shapes
- [`../../../shared/positioning/`](../../../shared/positioning/) — first-call framing language
- [`../../../shared/data-definitions/`](../../../shared/data-definitions/) — metric vocabulary the rep uses

## Related

- [`../methodology/`](../methodology/) — MEDDPICC the stage is filling
- [`demo.md`](demo.md) — next stage
- [`../frameworks/`](../frameworks/) — qualification framework that gates entry

## Change log

- 2026-04-20 — Phase 1 initial page.
