---
type: persona
title: Head of RevOps
description: Head of RevOps persona. Cross-functional operator who owns the GTM operating system.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
  - revops-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - marketing
  - sales
  - cs
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Head of RevOps

> Phase 0 abstract example.

## Role summary

Head of RevOps (sometimes VP RevOps, Director of RevOps, or Head of Revenue Operations) owns the operating system across Sales, Marketing, and CS. Reports to CRO, CFO, or COO depending on company shape. Typically manages 3 to 10 ICs spanning analytics, tooling, enablement, and process.

The role exists to systematize revenue generation (data, process, tooling, metrics, reporting) so the operators (AEs, CSMs, marketers) can focus on customer interactions.

## Scope and authority

- **Owns**: GTM tooling budget, data model across CRM, data warehouse, and analytics, attribution model, forecast methodology, territory design, comp plan operationalization.
- **Reports to**: CRO, CFO, or COO.
- **Direct reports**: 3 to 10 typically (data analysts, systems admins, enablement leads, deal desk).
- **Budget authority**: $50K to $500K per tool purchase typical; CFO sign-off above.

## Primary pains

- **Data quality and fragmentation.** CRM data is stale, overlapping, and contradicts the data warehouse. Source of truth is ambiguous.
- **Forecasting credibility.** CEO and Board ask for pipeline coverage by segment. The answer requires 3 hours of analyst time and still comes with caveats.
- **Tool sprawl.** 30+ tools in the stack, unclear ownership, overlapping licenses, unused seats.
- **Cross-functional alignment.** Marketing's MQL definition does not match Sales's SQL threshold, which does not match Finance's ARR recognition.
- **AI rollouts that do not ship.** AI SDR or AI deal desk pilots that stall because the underlying data is unstructured.

## What they care about

- Time-to-insight on "what's happening in the business right now"
- Pipeline-to-revenue conversion consistency across segments
- Reduction in manual analyst hours per recurring report
- Data integrity across systems (single definition, single source)

## What they dismiss

- "AI-powered" pitches without a data-quality story
- "Single source of truth" promises from a point-tool vendor
- Any pitch that skips over how integration actually works

## How they buy

- **Typical buying committee role**: Decision-maker or influencer depending on budget authority and the tool's scope.
- **Buying motion preference**: evaluates on technical merit first; cares about integration depth; wants a POC or pilot before committing.
- **Evaluation criteria**: (1) integration with existing stack, (2) data-model fit, (3) whether it reduces or increases operational overhead.

## Objections (top 3)

- **"We've tried tools like this and they didn't stick."** Counter with how this one earns trust incrementally rather than demanding full migration.
- **"Our data is too messy."** Counter with how the tool works alongside messy data, not on top of a perfect foundation.
- **"We can build this internally."** Counter with opportunity cost, not capability.

## Motion-specific notes

### Sales-assisted motion  {motion: sales-assisted}

Will evaluate during a formal pilot of 30 to 60 days. Wants to see a dataset from their own CRM running, not a demo. Champion is often a mid-level analyst; decision-maker is the Head of RevOps themselves.

### Enterprise motion  {motion: enterprise}

Loops in security, legal, and IT early. Expects SOC 2, data residency options, SSO, audit log, role-based access. May require a vendor-risk-assessment questionnaire.

## Related

- [`../buying-committees/`](../buying-committees/), committees where this role appears
- [`../../icp/`](../../icp/), ICP tiers where Head of RevOps is the primary buyer
- [`../../pricing/`](../../pricing/), how pricing engages with RevOps' budget authority
