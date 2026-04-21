---
type: meta
title: Positioning
description: Value props, category narrative, and elevator pitches. Strategic content, always PR.
owner: rasmus@latentflows.com
reviewers:
  - marketing-lead
  - sales-lead
  - product-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# Positioning

Value props, category narrative, and elevator pitches. The durable story the company tells about itself. Strategic content: always PR regardless of maturity stage.

Template: [`../../schema/page-templates/shared/positioning.md`](../../schema/page-templates/shared/positioning.md).

---

## Structure

- **[`value-props.md`](value-props.md).** Core value propositions, one per target segment and motion combination.
- **[`category-narrative.md`](category-narrative.md).** Which category we claim, how we frame it, why it matters.
- **[`elevator-pitches.md`](elevator-pitches.md).** Short pitch variants for common scenarios (cold email, first call opener, demo lead-in, event intro).

## Ownership

- **Owner**: Marketing lead (primary accountability for narrative).
- **Co-authors**: Sales lead (customer-facing language), Product lead (product truth).
- **Required reviewers on strategic changes**: Marketing, Sales, and Product leads.
- **Consumers**: Marketing, Sales, CS, Product.

## Change class

**Always PR** (never auto-merge):

- Category claim changes
- Core value prop changes
- Primary differentiator changes

**Can eventually auto-merge at Stage 2+**:

- Backlink fixes, formatting, adding a proof point to an existing value prop without changing the prop itself

## What's sourced where

- **Value props.** Validated by win-rate data, customer reference quotes, and Gong call patterns ("when we said X, the buyer said Y").
- **Category narrative.** Analyst briefings (Gartner, Forrester if applicable), competitive positioning analysis, category-definition reference docs.
- **Elevator pitches.** Tested on actual calls, refined based on response patterns.

Every positioning claim cites the evidence that backs it. Unsupported positioning rots fastest.

## Review cadence

- **Semi-annually.** Full positioning audit against customer feedback, competitive movement, product evolution.
- **On major product release.** Pitch and value prop PR to reflect new capability.
- **On competitive movement.** When a competitor reframes or the market category shifts, re-evaluate.

## Common failure modes

- **Category confusion.** We claim one category in marketing and a different one in sales. `ci verify` catches this via cross-doc lint.
- **Feature-led vs. outcome-led drift.** Internal pages list features; customer-facing language talks outcomes. Variant lock-in follows.
- **Stale proof points.** Last year's case study with no new ones. Positioning starts to sound generic.

## Related

- [`../competitive-intel/`](../competitive-intel/), competitor positioning we differentiate against
- [`../icp/`](../icp/), audiences this positioning targets
- [`../product-and-packaging/`](../product-and-packaging/), what's being positioned
