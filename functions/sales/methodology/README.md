---
type: function-readme
title: Sales methodology
description: Canonical sales methodology for the function. MEDDPICC with motion and segment adaptations.
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

# Sales methodology

The methodology is the operating framework every deal is run against. It defines the information a rep must surface, the order in which that information stabilizes, and the exit criteria for advancing a stage. It does not define stage-by-stage plays — those live in [`../playbooks/`](../playbooks/).

One methodology is canonical here: **MEDDPICC**. Chosen over MEDDIC, BANT, and SPICED for three reasons: (1) it names the Champion and Paper Process explicitly, which are the two failure modes most common in mid-market + enterprise B2B SaaS deals [source: sources/internal-docs/README.md]; (2) it scales across sales-assisted and enterprise motions without bifurcating; (3) it integrates cleanly with the shared spine — Metrics → [`../../../shared/data-definitions/`](../../../shared/data-definitions/), Economic Buyer → [`../../../shared/personas/`](../../../shared/personas/), Paper Process → [`../../../shared/pricing/`](../../../shared/pricing/).

---

## What this directory contains

- [`meddpicc.md`](meddpicc.md) — the canonical methodology page. Motion and segment variants via in-file section labels.

In Phase 1 this directory is single-methodology. If a second methodology is ever adopted (for a motion the current one doesn't fit), it lands here as a sibling page, not a replacement — and the README gains a routing table.

## What the methodology is for

- **Consistent deal inspection.** Pipeline reviews and forecast calls ask the same questions across reps. The methodology is the contract between AE and manager for what "qualified" means.
- **Early-stage triage.** Discovery fills in the first half of MEDDPICC (Metrics, Economic buyer, Decision criteria, Decision process, Identify pain, Champion). Stalled deals almost always map to a missing letter [source: sources/internal-docs/README.md].
- **Forecast confidence.** A deal with all letters filled forecasts more reliably than a deal at the same stage without them. The forecast methodology in [`../frameworks/`](../frameworks/) consumes MEDDPICC completeness as an input.

## What it is not for

- **Stage-by-stage tactics.** Those belong in [`../playbooks/`](../playbooks/). Methodology answers "what do we need to know"; playbooks answer "what do we do in this stage."
- **Qualification at the account level before engagement.** That's the qualification framework in [`../frameworks/`](../frameworks/), which operates upstream on ICP fit.
- **Scripting.** MEDDPICC is a diagnostic, not a script. Discovery questions, demo structure, and proposal language come from the shared spine plus playbooks.

## How to use this with the rest of the corpus

| Need | Look in |
|---|---|
| "What questions do I ask in discovery?" | [`../playbooks/`](../playbooks/) |
| "Is this account worth pursuing?" | [`../frameworks/`](../frameworks/) |
| "What does the buying committee typically look like at this segment?" | [`../../../shared/personas/buying-committees/`](../../../shared/personas/buying-committees/) |
| "What metrics do buyers care about in our category?" | [`../../../shared/data-definitions/`](../../../shared/data-definitions/) |
| "Which competitor keeps showing up and how do I handle them?" | [`../battlecards/`](../battlecards/) |
| "How do I forecast the pipeline this methodology creates?" | [`../frameworks/`](../frameworks/) |

## Related

- [`../../../shared/personas/`](../../../shared/personas/) — Economic buyer and Champion personas
- [`../../../shared/data-definitions/`](../../../shared/data-definitions/) — Metrics language
- [`../../../shared/pricing/`](../../../shared/pricing/) — Paper Process inputs
- [`../../../shared/icp/`](../../../shared/icp/) — tier fit gating qualification
- [`../frameworks/`](../frameworks/) — upstream qualification framework

## Change log

- 2026-04-20 — Phase 1 scaffold. MEDDPICC established as the canonical methodology.
