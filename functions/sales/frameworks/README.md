---
type: function-readme
title: Sales frameworks
description: Decision frameworks — qualification, deal-desk escalation, forecast methodology. Frameworks answer "what should we do" given inputs.
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
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Sales frameworks

Decision frameworks, not playbooks. A framework answers "what should we do given these inputs"; a playbook answers "what do we do in this stage." The two are complementary. An AE running a discovery call uses the discovery playbook for the motion; the AE deciding whether to engage that account at all used the qualification framework upstream.

---

## Frameworks in this directory

| Framework | Page | Used by | Primary input |
|---|---|---|---|
| Qualification | [`qualification.md`](qualification.md) | AEs, BDRs, sales managers | ICP fit signals, committee evidence |
| Deal-desk escalation | [`deal-desk-escalation.md`](deal-desk-escalation.md) | AEs, deal desk, RevOps | Non-standard terms: discount, payment, MSA, multi-entity |
| Forecast methodology | [`forecast-methodology.md`](forecast-methodology.md) | Sales managers, RevOps, CRO | MEDDPICC completeness + stage + historical close rate |

## How frameworks compose

Qualification is upstream of methodology. An account that fails qualification does not advance to MEDDPICC — that's a miss in pipeline hygiene.

Deal-desk escalation is triggered during proposal or negotiation when a non-standard ask lands. It reads from [`../../../shared/pricing/discount-guardrails.md`](../../../shared/pricing/discount-guardrails.md) and routes through the approver chain. It does not replace the pricing policy; it enforces it.

Forecast methodology consumes MEDDPICC completeness ([`../methodology/`](../methodology/)) and the stage model ([`../playbooks/`](../playbooks/)) to produce a weekly commit / best-case / pipeline number that roll up to a forecast the CRO can actually defend.

## What frameworks are not

- **Not scripts.** A framework tells you the decision rule; the language for executing it lives in playbooks and plays.
- **Not policy ownership.** Pricing policy lives in [`../../../shared/pricing/`](../../../shared/pricing/); escalation framework tells you when and to whom the policy escalates.
- **Not single-use.** Frameworks are consulted every time the input conditions arise — not just once per deal.

## Related

- [`../methodology/`](../methodology/) — MEDDPICC, the diagnostic frameworks consume
- [`../playbooks/`](../playbooks/) — stage-specific motions
- [`../../../shared/pricing/`](../../../shared/pricing/) — pricing reality the deal-desk framework enforces
- [`../../../shared/icp/`](../../../shared/icp/) — fit inputs the qualification framework reads

## Change log

- 2026-04-20 — Phase 1 scaffold. Three frameworks established.
