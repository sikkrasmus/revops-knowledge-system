---
type: framework
title: Forecast methodology
description: How we produce weekly commit / best-case / pipeline numbers. Reads MEDDPICC completeness, deal stage, and historical close rate.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - revops-lead
  - finance-lead
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
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Forecast methodology

Forecast is the weekly number the CRO defends to the CEO and Board. It is not a gut call; it is a mechanical function of MEDDPICC completeness, deal stage, historical close rate by segment, and a small set of manager overrides. Forecasts that can't be decomposed back to those inputs are not forecasts — they are opinions [source: sources/internal-docs/README.md].

The methodology below replaces stage-weighted forecasting (the "stage × probability" approach) because stage-weighted forecasts reward stage-advance, not close probability, and drift badly in environments where reps stage-inflate [source: sources/internal-docs/README.md].

---

## Inputs

For each opportunity:

- **Stage** from [`../playbooks/`](../playbooks/) — one of discovery / demo / evaluation / proposal / negotiation / close / expansion-handoff.
- **MEDDPICC completeness score** (0-8) from [`../methodology/`](../methodology/) — count of letters with artifact evidence, not assumption.
- **ACV** committed (or top-of-band for multi-scenario deals).
- **Expected close date** (always within a current-quarter window for forecast-relevant deals).
- **Historical close rate by segment + motion + source channel**, from RevOps analytics.

## The forecast categories

| Category | Definition | Default probability bands |
|---|---|---|
| **Commit** | High confidence the deal closes in the current quarter | 75% and up |
| **Best case** | Meaningful path to close, but with identified risk | 40-74% |
| **Pipeline** | Real deal, not forecast-relevant for the current quarter | <40% |
| **Omitted** | Deal in early / unqualified state — not in forecast | — |

Probability is not a rep feeling; it's derived from the inputs below.

## The decision rules

### Rule 1 — Stage and MEDDPICC floors

A deal can only enter Commit if it meets all of:

- Stage ∈ {proposal, negotiation, close}
- MEDDPICC score ≥ 7 of 8
- Economic buyer has been met (E letter evidenced by a meeting artifact, not a name)
- Paper process understood (P letter evidenced, not planned)
- Expected close date within the current quarter

A deal missing any of these sits in Best case or lower.

### Rule 2 — Best case criteria

A deal in Best case meets all of:

- Stage ∈ {evaluation, proposal, negotiation}
- MEDDPICC score ≥ 5
- Expected close date within the current quarter

### Rule 3 — Pipeline (not forecast-relevant)

Every other opportunity with a qualified stage but missing Commit or Best-case conditions.

### Rule 4 — Omitted

Opportunities in discovery or earlier, or with MEDDPICC score ≤ 2, are not in the forecast. They're in pipeline count but not pipeline value for the forecast roll-up.

## Probability calibration

Per deal in Commit or Best case, probability is the product of three factors:

1. **Base rate** — historical close rate for this segment, motion, stage, and source channel. Sourced from RevOps analytics; refreshed quarterly.
2. **MEDDPICC multiplier** — deals with all 8 letters close at significantly higher rates than 5-6-letter deals at the same stage [source: sources/internal-docs/README.md]. Multiplier applied per RevOps' calibration table.
3. **Idiosyncratic adjustment** — known issues in this specific deal. Champion turnover, security review exception, procurement freeze, etc. Bounded: cannot push a deal into Commit by itself.

The manager does not move a deal into Commit on "feel." If the inputs don't support Commit, it sits in Best case regardless of AE conviction.

## The weekly forecast ritual

1. **AE self-forecasts Friday EOD.** AE categorizes each opportunity in their book (Commit / Best / Pipeline / Omitted) with MEDDPICC score and a one-sentence rationale per Commit deal.
2. **Manager 1:1 inspects Monday AM.** Manager walks each Commit deal. For each, asks for the evidence behind the letters. Moves deals out of Commit that don't meet the rules.
3. **Sales lead rolls up Monday PM.** Sum Commit + Best case × probability bands, compared to the segment-level quota allocation and remaining-quarter coverage.
4. **RevOps publishes Tuesday AM.** Final forecast number + change from prior week + callouts on material movement (deals added to / removed from Commit).
5. **Deviation review every Thursday.** Forecasted deals that are not advancing on the expected timeline get a deviation note; 2 consecutive weeks without movement → automatic demotion.

## Historical-accuracy feedback

Every close cycle, the RevOps team runs forecast-accuracy analysis:

- For each deal closed-won, -lost, or slipped: compare the final outcome to the Monday-of-close-quarter forecast category.
- Aggregate by segment, motion, rep, manager, MEDDPICC-at-forecast-time.
- The output updates the base-rate table and flags reps or managers with consistent over- or under-forecast bias.

Forecast accuracy is the primary health metric for the methodology. A methodology with 60% accuracy is broken — examine which inputs (rep discipline, base rates, MEDDPICC quality) are the failure source [source: sources/internal-docs/README.md].

## Common failure modes

- **Stage-inflation feeds forecast-inflation.** Deals advanced prematurely end up in the Commit band without the MEDDPICC backing. Rule 1 catches most of this at manager inspection; the remaining slips when managers rubber-stamp.
- **Manager override without rule basis.** Deal moved to Commit because the manager "likes it." No documented reason tied to the inputs. Every Commit has an input-backed rationale.
- **Best-case stuffing.** Reps over-categorize into Best case to hit internal pipeline-coverage ratios. RevOps measures Best-case conversion to Commit; reps whose Best case rarely converts have their ratios investigated, not the number.
- **Idiosyncratic adjustments not bounded.** Single-deal multipliers stacking so a weak deal appears strong. Adjustments are capped.
- **Forecast and commit plan confused.** Forecast is what we expect to happen. Commit plan is what we need to happen. They're different artifacts; don't conflate.

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Shorter cycle → more deals cycle through per quarter → base-rate calibration is statistically robust.
- Commit / Best-case split is more stable week-to-week.
- A typical healthy pipeline-coverage ratio is 3-4× quarterly quota.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Long cycles mean deals commit and slip on multi-quarter horizons.
- Commit forecast is heavily weighted by P (paper process) evidence — specifically, confirmed procurement timelines and redline-convergence status.
- A typical healthy pipeline-coverage ratio is 4-6× quarterly quota given slip rates.
- Slip is treated as a forecast-methodology signal: 2+ consecutive quarters slipping a deal suggests it either needs category reassignment or re-qualification.

## Shared-spine inputs

- [`../../../shared/data-definitions/`](../../../shared/data-definitions/) — ACV, ARR, and pipeline-coverage definitions
- [`../../../shared/icp/`](../../../shared/icp/) — segment definitions that base-rate tables aggregate against

## Related

- [`../methodology/`](../methodology/) — MEDDPICC, the primary input
- [`../playbooks/`](../playbooks/) — stage model
- [`qualification.md`](qualification.md) — determines what enters pipeline
- [`deal-desk-escalation.md`](deal-desk-escalation.md) — open escalations factor into forecast confidence

## Change log

- 2026-04-20 — Phase 1 initial page.
