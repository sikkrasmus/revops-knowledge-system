---
type: meta
title: Future functions
description: Marketing, customer success, support, RevOps, and finance/legal. What each would cover when filled, and how to fill them using the sales pattern as the template.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
last_reviewed: 2026-04-21
verified_until: 2026-10-21
---

# Future functions

Five functions still to fill: marketing, customer success, support, RevOps, finance and legal. This page describes what each owns when filled, what it consumes from `shared/`, and who reviews it.

The pattern to copy is [`sales/`](sales/). It ships filled end to end with methodology, deal-stage playbooks, decision frameworks, plays, battlecards, objections, and a tools-and-stack category map. Every other function follows the same skeleton: methodology, playbooks, frameworks, plays, plus optional templates and tools-and-stack subdirs.

The order in [`../docs/03-IMPLEMENTATION.md`](../docs/03-IMPLEMENTATION.md) is to fill marketing first (shares positioning, competitive intel, ICP heavily), then customer success (shares ICP, personas, pricing for expansion), then RevOps (owns data definitions), then finance/legal (authored-shared: pricing, contracts, compliance posture), then support.

You can stop at two or three functions if your GTM motion does not need the rest. Adopting the shared spine plus one or two functions is a valid endpoint.

---

## Marketing

**Owns when filled.** Campaign playbooks by segment and stage. Content strategy and calendar by pillar and channel. Brand and voice guidelines. Demand-gen frameworks (ABM, demand waterfall, MQL to SQL handoff). Analyst-relations posture. Events strategy. Launch playbooks.

**Consumes from `shared/`.**

- [`../shared/icp/`](../shared/icp/) for targeting.
- [`../shared/personas/`](../shared/personas/) for content persona-targeting.
- [`../shared/positioning/`](../shared/positioning/) where Marketing is a primary co-author.
- [`../shared/competitive-intel/`](../shared/competitive-intel/) for competitive content.
- [`../shared/data-definitions/`](../shared/data-definitions/) for MQL, SQL, and attribution definitions.

**Ownership.** Marketing lead is the primary owner. Co-authors are the sales lead (MQL to SQL handoff) and product lead (launches). Consumers: marketing, sales, product.

---

## Customer success

**Owns when filled.** Onboarding playbooks by segment and product. Adoption frameworks. Renewal motions and expansion plays. Health-score methodology. QBR and EBR templates. Escalation matrix. Account-team structure (pooled vs. dedicated) by tier.

**Consumes from `shared/`.**

- [`../shared/icp/`](../shared/icp/) for fit assessment post-close (informs expansion potential and churn risk).
- [`../shared/personas/`](../shared/personas/) for stakeholder identification during engagement.
- [`../shared/pricing/`](../shared/pricing/) for renewal price floors and expansion pricing.
- [`../shared/product-and-packaging/`](../shared/product-and-packaging/) for upsell and cross-sell paths.
- [`../shared/data-definitions/`](../shared/data-definitions/) for NRR, GRR, and churn definitions.

**Ownership.** CS lead is the primary owner. Co-authors are the sales lead (deal handoff) and product lead (adoption blockers). Consumers: CS, sales, product.

---

## Support

**Owns when filled.** Knowledge-base articles (end-user-facing). Internal troubleshooting runbooks. Escalation paths from Support to Engineering or Product. SLA definitions by edition. Incident-response patterns. Deflection playbooks.

**Consumes from `shared/`.**

- [`../shared/product-and-packaging/`](../shared/product-and-packaging/) for SKU limits and known limitations.
- [`../shared/data-definitions/`](../shared/data-definitions/) for CSAT, TTR, and SLA metrics.

**Ownership.** Support lead is the primary owner. Co-authors are the product lead (known issues) and CS lead (account escalations). Consumers: support, CS, product.

---

## RevOps

**Owns when filled.** Tooling stack documentation (CRM, data warehouse, BI, attribution, sequencer, CPQ, deal desk). Data model (CRM schema, data warehouse objects, cross-system identity mapping). Forecasting methodology. Territory and comp-plan operationalization. Reporting and analytics (dashboards, canonical reports). Process documentation (lead routing, deal stage progression, handoffs). GTM-process-stage definitions.

**Consumes from `shared/`.**

- [`../shared/icp/`](../shared/icp/) for segmentation and territory design.
- [`../shared/data-definitions/`](../shared/data-definitions/) where RevOps is the primary owner.
- [`../shared/pricing/`](../shared/pricing/) for quoting and revenue-recognition alignment.

**Authors back into shared.** RevOps is the primary owner of [`../shared/data-definitions/`](../shared/data-definitions/) and contributes heavily to [`../shared/icp/`](../shared/icp/) and [`../shared/pricing/`](../shared/pricing/). Operational content (tool config, process flows, analytics) lives in this directory.

**Ownership.** RevOps lead is the primary owner. Co-authors are the finance lead (revenue recognition, comp) and sales lead (operational alignment). Consumers: every function.

---

## Finance and legal

**Owns when filled.** Revenue-recognition policy (ASC 606 / IFRS 15 posture). MSA templates and redline playbook. Legal and compliance posture (SOC 2, GDPR, HIPAA readiness, PII handling). Non-standard term approval rules. Invoicing and collections policy. Audit and controls. Sanctions and restricted-party screening.

**Consumes from `shared/`.**

- [`../shared/pricing/`](../shared/pricing/) for revenue recognition and contract structure.
- [`../shared/product-and-packaging/`](../shared/product-and-packaging/) for delivery-obligation definitions.

**Authors back into shared.** Finance and legal is the primary owner of revenue-recognition and legal-posture content in this directory. Some of it is authored-shared: single-author here, many readers across all functions.

**Always-PR content.** Every change in this directory always PRs, regardless of maturity stage. Legal review is typical on MSA template changes, indemnification, and data-handling policies.

**Ownership.** Finance lead owns revenue-recognition and invoicing. Legal owns contract and compliance content. Co-author: RevOps lead (operational alignment). Consumers: every function.

---

## How to fill a function

The fill pattern is identical across functions. Look at [`sales/`](sales/) for the worked example, then:

1. Create the function directory: `methodology/`, `playbooks/`, `frameworks/`, `plays/`, plus optional `tools-and-stack/` and `templates/`.
2. Write the methodology page first. It anchors everything else.
3. Add playbooks by scenario (deal stage for sales, campaign type for marketing, renewal motion for CS).
4. Add decision frameworks for the recurring judgment calls.
5. Add plays for the specific repeatable motions.
6. Cite shared components in every page where the content depends on them.
7. Follow the [authoring contract](../schema/authoring-contract.md) for frontmatter, citations, and review routing.

`ci verify --all` enforces the schema. `ci graph` shows whether the function is well-cross-referenced into the spine.

---

## Related

- [`sales/`](sales/), the filled function and the template to copy.
- [`../shared/`](../shared/), the seven co-authored components every function reads from.
- [`../docs/03-IMPLEMENTATION.md`](../docs/03-IMPLEMENTATION.md), the suggested rollout plan and the eight hard parts of running this in production.
- [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md), reviewer routing per directory.
