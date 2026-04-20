---
type: buying-committee
title: Enterprise direct committee
description: Enterprise buying-committee configuration — full committee including procurement, security, legal, with multi-signer paper process.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - revops-lead
  - marketing-lead
last_reviewed: 2026-04-20
verified_until: 2026-07-20
motion:
  - enterprise
segment:
  - enterprise
consumers:
  - sales
  - marketing
  - cs
  - legal
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Enterprise direct committee

> Phase 1 addition to the shared spine. Surfaced because Phase 1 Sales content references a full enterprise buying-committee shape that wasn't yet captured as a standalone committee configuration.

## Context

Applies to enterprise deals in the direct (non-partner) motion — typically $150K+ ACV, 4-12 month cycle, multi-year term with ramp structures. Full committee: operational champion + executive sponsor + technical evaluator + security + procurement + legal, with multiple signers on paper.

Distinct from mid-market sales-assisted ([`mid-market-sales-assisted.md`](mid-market-sales-assisted.md)) in three dimensions: committee size (6-12 people vs. 2-4), paper-process weight (multi-round legal + procurement vs. single-form), and decision cadence (staged executive checkpoints vs. compressed approver sign-off).

## Committee members

| Role | Involvement | Typical objection | Links |
|---|---|---|---|
| Operational champion (Head of function — RevOps, VP Sales, Head of Data) | Drives evaluation day-to-day, owns the POC | "Implementation risk" | [Head of RevOps](../personas/head-of-revops.md), [VP Sales](../personas/vp-sales.md) |
| Executive sponsor (C-level or SVP) | Political cover, budget commitment | "Why this vs. consolidating with an incumbent" | — |
| Economic buyer (often same as executive sponsor; sometimes separate CFO-adjacent role) | Signs / approves final commercial | "ROI, cost of switching, multi-year risk" | — |
| Technical evaluator (architect, platform lead, data lead) | Fit assessment against existing stack | "Integration depth, data model fit, performance at scale" | — |
| Security reviewer | Security + compliance posture | "SOC 2 Type II, data residency, SSO / SCIM, audit, incident response" | — |
| Procurement contact | Vendor onboarding, payment terms, standard clauses | "Preferred payment terms, insurance, diversity certifications" | — |
| Legal contact | MSA redlines, DPA, liability, IP | "Liability caps, IP assignment, termination clauses" | — |
| Optional: end-user representative from the team that will operate the tool daily | Usability, onboarding reality | "How will my team actually adopt this" | — |

Total committee size: 6-12 people. In the largest enterprise deals committee can expand past 15 (governance, risk, architecture review boards).

## Decision flow

The cycle is staged, not linear. Multiple workstreams run in parallel.

1. **Discovery (weeks 1-6).** Operational champion + technical evaluator identify pain, scope, committee map. Executive sponsor briefed.
2. **Demo series (weeks 4-10).** Committee-facing overview; technical deep-dive; security-specific session.
3. **POC / evaluation (weeks 8-16).** Formal scoping doc, success criteria, parallel paper-process kickoff (security review, MSA redlines start in parallel).
4. **Executive checkpoints** at POC-midpoint and POC-close. Executive sponsor and economic buyer validate business case.
5. **Proposal** (weeks 14-20). Commercial structure with multi-year ramp, usage commits, non-price concessions per [`../../pricing/discount-guardrails.md`](../../pricing/discount-guardrails.md).
6. **Negotiation** (weeks 18-36). MSA redlines 2-4 rounds; security approval; procurement vendor onboarding; payment-term finalization.
7. **Signature**. Typically multi-signer — economic buyer + procurement + sometimes a separate finance authority.
8. **Kickoff** (weeks 28-40). Formal onboarding project: dedicated CS manager, implementation manager, executive sponsor buy-in, 30/60/90 milestones.

Total cycle: 4-9 months typical; outliers to 12+ months for complex multi-entity deals.

## Typical pushback patterns

- **Security review stall.** New SOC 2 finding, DPA redline dispute, data-residency requirement not yet supported. Adds 2-6 weeks; resolution is technical and legal, not sales.
- **Procurement surprise.** Vendor onboarding hits a requirement discovered late (diversity cert, specific insurance, unusual payment terms). Prevent via procurement engagement during evaluation.
- **Executive sponsor turnover.** New sponsor mid-cycle resets the political case. Operational champion re-earns the room; the deal slips a quarter at minimum.
- **Multi-entity structure.** One economic buyer, multiple entities each with separate procurement paths. Paper count multiplies; cycle elongates.
- **Competitive re-emergence late.** Incumbent counter-proposal at proposal or negotiation stage. Late-stage competitive defense is much harder than discovery-stage positioning.

## Deal risks

- **Stalled at security review** — usually a compliance-posture gap. Early disclosure of certifications and architecture prevents late surprise.
- **Lost when** the executive sponsor can't get budget ratified by the next fiscal cycle, or when procurement's standard terms (payment, liability, IP) collide with our template in ways deal desk can't resolve.
- **Won but under-scoped** — multi-year commit with no expansion path; renewal becomes flat and the account doesn't grow. Expansion-watch signals are documented in [`../../../functions/sales/playbooks/expansion-handoff.md`](../../../functions/sales/playbooks/expansion-handoff.md).

## Segment-specific variants

### Upper enterprise (>$500K ACV)  {segment: enterprise}

- Committee typically 10-15 people; governance / risk / architecture review boards may formally convene.
- Executive sponsor is C-level; economic buyer is frequently separate (CFO or equivalent with signing authority).
- Paper cycle 3-6 months by itself; MSA is our template in name only, with substantial redlines.
- Reference-customer expectations higher — at least 2-3 peer-scale references.

## Related

- [`mid-market-sales-assisted.md`](mid-market-sales-assisted.md) — mid-market committee variant
- [`../personas/`](../personas/) — individual persona pages
- [`../../icp/tier-1.md`](../../icp/tier-1.md) — ICP this committee typically applies to
- [`../../pricing/`](../../pricing/) — commercial structures the committee navigates
- [`../../../functions/sales/playbooks/`](../../../functions/sales/playbooks/) — stage playbooks adapted for this committee shape
- [`../../../functions/sales/plays/competitive-displacement.md`](../../../functions/sales/plays/competitive-displacement.md) — play frequently run inside this committee

## Change log

- 2026-04-20 — Phase 1 addition. Surfaced by Phase 1 Sales content referencing a full enterprise committee shape.
