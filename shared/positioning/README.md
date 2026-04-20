---
type: meta
title: Positioning
description: Value props, category narrative, and elevator pitches. Strategic — always PR.
owner: rasmus@latentflows.com
reviewers:
  - marketing-lead
  - sales-lead
  - product-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# Positioning

Value props, category narrative, and elevator pitches — the durable story the company tells about itself. Strategic content; always PR regardless of maturity stage.

Template: [`../../schema/page-templates/shared/positioning.md`](../../schema/page-templates/shared/positioning.md).

---

## Structure

- **[`value-props.md`](value-props.md)** — core value propositions, one per target segment / motion combination
- **[`category-narrative.md`](category-narrative.md)** — which category we claim, how we frame it, why it matters
- **[`elevator-pitches.md`](elevator-pitches.md)** — short pitch variants for common scenarios (cold email, first call opener, demo lead-in, event intro)

## Ownership

- **Owner**: Marketing lead (primary accountability for narrative).
- **Co-authors**: Sales lead (customer-facing language), Product lead (product truth).
- **Required reviewers on strategic changes**: Marketing + Sales + Product leads.
- **Consumers**: Marketing, Sales, CS, Product.

## Change class

**Always PR** (never auto-merge):

- Category claim changes
- Core value prop changes
- Primary differentiator changes

**Can eventually auto-merge at Stage 2+**:

- Backlink fixes, formatting, adding a proof point to an existing value prop without changing the prop itself

## What's sourced where

- **Value props** — validated by win-rate data, customer reference quotes, and Gong call patterns ("when we said X, the buyer said Y").
- **Category narrative** — analyst briefings (Gartner, Forrester if applicable), competitive positioning analysis, category-definition reference docs.
- **Elevator pitches** — tested on actual calls, refined based on response patterns.

Every positioning claim cites the evidence that backs it. Unsupported positioning rots fastest.

## Review cadence

- **Semi-annually** — full positioning audit against customer feedback, competitive movement, product evolution.
- **On major product release** — pitch and value prop PR to reflect new capability.
- **On competitive movement** — when a competitor reframes or the market category shifts, re-evaluate.

## Common failure modes

- **Category confusion** — we claim one category in marketing and a different one in sales. `ci verify` catches this via cross-doc lint.
- **Feature-led vs. outcome-led drift** — internal pages list features; customer-facing language talks outcomes. Variant lock-in.
- **Stale proof points** — last year's case study, no new ones, positioning starts to sound generic.

## Related

- [`../competitive-intel/`](../competitive-intel/) — competitor positioning we differentiate against
- [`../icp/`](../icp/) — audiences this positioning targets
- [`../product-and-packaging/`](../product-and-packaging/) — what's being positioned
