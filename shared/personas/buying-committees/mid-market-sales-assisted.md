---
type: buying-committee
title: Mid-market sales-assisted committee
description: Typical buying-committee configuration for mid-market sales-assisted deals.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - revops-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - sales-assisted
segment:
  - mid-market
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

# Mid-market sales-assisted committee

> Phase 0 abstract example.

## Context

Applies to mid-market deals in the sales-assisted motion — typically $15-80K ACV, 1-3 month sales cycle, 1-2 year term. Not enterprise (no procurement/legal/security review as gate), not SMB/PLG (there is an AE).

## Committee members

| Role | Involvement | Typical objection | Links |
|---|---|---|---|
| Champion (typically Head of function — RevOps, Sales, Marketing, CS) | Drives evaluation, owns recommendation | "Implementation risk" | [Head of RevOps](../personas/head-of-revops.md) |
| Approver (typically VP-level — VP Sales, VP Operations, COO) | Sign-off on budget | "ROI case — show me" | — |
| Reviewer (typically an IC or senior IC who uses the tool daily) | Technical fit, integration check | "Will this integrate with X?" | — |

Total committee size: 2-4 people. Finance is occasionally looped in for budget approval above a threshold; security is rarely involved.

## Decision flow

1. **Discovery** — Champion has an open problem and researches options. First call with AE typically.
2. **Technical evaluation** — Reviewer joins for demo, asks integration questions, occasionally a short pilot.
3. **Business case** — Champion + Reviewer build the ROI story for the Approver.
4. **Approval** — Approver asks for reference calls, pricing negotiation, and signs the contract.
5. **Kickoff** — CS onboarding typically 2-4 weeks.

Total cycle: 4-12 weeks. Longer when the Approver is net-new to the role or the company has had a recent tooling consolidation.

## Typical pushback patterns

- **Mid-funnel stall** — "We need to finish Q-end first; let's talk in 3 weeks." Usually recoverable with a clear ROI hook tied to the next quarter.
- **Approver new to role** — asks for 3+ references and extra proof points. Accommodate with a case-study-forward pitch.
- **Integration scope creep** — Reviewer adds "nice to have" integrations late in cycle, threatening to extend the deal. Scope-lock after technical evaluation.

## Deal risks

- **Stalled at technical evaluation**: usually an integration gap. Either solve or disqualify.
- **Lost when**: Champion departs (new-hire risk flag), or Approver changes, or a competitor lands at a materially lower price with similar integration depth.

## Segment-specific variants

### Lower mid-market (under $25K ACV)  {segment: mid-market}

Committee compresses to 2 people (Champion + Approver). Cycle shortens to 2-6 weeks. Less negotiation leverage on pricing.

## Related

- [`../personas/`](../personas/) — individual persona pages
- [`../../icp/`](../../icp/) — ICP tiers this committee configuration applies to
- [`../../pricing/`](../../pricing/) — mid-market pricing guidance
