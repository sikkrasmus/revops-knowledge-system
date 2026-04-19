---
type: meta
title: Pricing
description: Price book, discount guardrails, and usage meters. Highest-conflict shared artifact.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Pricing

Price book, discount guardrails, and usage meters. The highest-conflict shared component — reviewer routing is strict, all changes PR regardless of maturity stage.

Template: [`../../schema/page-templates/shared/pricing-policy.md`](../../schema/page-templates/shared/pricing-policy.md), [`../../schema/page-templates/shared/discount-guardrail.md`](../../schema/page-templates/shared/discount-guardrail.md).

---

## Structure

- **[`price-book.md`](price-book.md)** — the canonical price book. All pricing with in-file section labels by motion/segment.
- **[`discount-guardrails.md`](discount-guardrails.md)** — discount rules, approval thresholds, strategic exception band.
- **[`usage-meters.md`](usage-meters.md)** — for usage-billed motions: what gets metered, how, billing cadence, overage handling.

## Ownership

- **Owner**: RevOps lead.
- **Co-authors**: Finance lead, Sales lead.
- **Required reviewers on any change**: RevOps + Finance + Sales lead. Legal on MSA language changes.
- **Consumers**: Sales (quoting), Finance (billing, revenue recognition), Legal (contracts), CS (renewals and expansion).

## Change class

**Always PR** (never auto-merge, regardless of maturity stage):

- Any change to `price-book.md`
- Any change to approval thresholds in `discount-guardrails.md`
- Any change to billable units, overage policy, or rate in `usage-meters.md`

**Changes that can eventually auto-merge at Stage 2+**:

- Formatting, backlink fixes, cross-reference updates that don't change amounts or thresholds.

## What's sourced where

- **List price** — from the pricing committee decision log (product + finance + RevOps).
- **Discount patterns** — from closed-won analysis in HubSpot/Salesforce. Cited with `as_of:` dates.
- **Strategic exceptions** — from deal desk approvals, ranked by frequency.
- **Usage meter rates** — from the billing system (source of truth).

Every price claim cites its source. Unsourced price claims fail `ci verify`.

## Lint signals specific to pricing

- **Discount guardrail drift** — if closed-deal pattern diverges from documented guardrails by >15% over 90 days, flag for review.
- **Verification stale** — pricing pages extend `verified_until` quarterly, not annually. Short staleness window.
- **Cross-doc contradiction** — if a sales playbook or CS renewal play cites a discount or price that doesn't match the price book, flag.

## Review cadence

- **Quarterly** — full re-verification of price-book against closed-won patterns.
- **On pricing committee decision** — PR the same week.
- **On motion / segment shift** — full re-verification when the company enters / exits a motion or segment.

## Related

- [`../product-and-packaging/`](../product-and-packaging/) — what's being priced
- [`../icp/`](../icp/) — segment pricing anchors to ICP tiers
- [`../../functions/finance-legal/`](../../functions/finance-legal/) (Phase 2) — revenue recognition, contract terms
- [`../../functions/sales/`](../../functions/sales/) (Phase 1) — quoting plays reference this
