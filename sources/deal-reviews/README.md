---
type: meta
title: Deal Review Notes
description: Redacted deal-review notes — retrospectives on specific closed-won or closed-lost deals.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Deal Review Notes

Redacted deal-review notes. Retrospectives on specific closed deals — what worked, what didn't, what informed the outcome. Wiki pages (postmortem, win-loss-pattern, pricing-pattern, champion-profile) cite these.

## What to include

- Deal identifiers (internal CRM deal ID; customer name aliased unless consented).
- Outcome: closed-won / closed-lost / no-decision, timeline, ACV band.
- Key events: triggers, stakeholder changes, objections, pricing negotiation arc.
- Stakeholder roles and committee composition (aliased).
- What we'd do differently.

## What to exclude

- Unaliased individual names.
- Sensitive internal personnel discussion.
- Verbatim contract terms (keep those in [`../contracts/`](../contracts/) if needed).

## Naming

```
<YYYY-MM-DD>-<deal-slug>.md
```

Deal slugs are anonymized by default: `deal-mm-q1-2026-enterprise-metal-fabricator`, not a customer name.

## Template frontmatter

```yaml
---
type: source
title: <deal review title>
description: <one-line summary>
owner: <email-or-github-handle>
last_reviewed: <YYYY-MM-DD>
source_system: hubspot  # or salesforce
source_url: https://app.hubspot.com/deals/<deal-id>
source_captured_at: <YYYY-MM-DD>
source_drift: false
pii_status: redacted
consumers:
  - sales
  - cs
  - revops
---
```

## Cadence

Deal reviews should be written within 7 days of close (won or lost) while context is fresh. Weekly batch ingestion acceptable for high-velocity segments.

## Phase 0 content

None. Phase 3 synthetic-company instance populates with worked examples.

## Related

- [`../../shared/competitive-intel/win-loss-patterns.md`](../../shared/competitive-intel/win-loss-patterns.md) — patterns synthesized from these
- [`../../shared/pricing/discount-guardrails.md`](../../shared/pricing/discount-guardrails.md) — pricing patterns synthesized from these
