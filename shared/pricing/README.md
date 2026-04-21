---
type: meta
title: Pricing
description: Price book, discount guardrails, and usage meters. Highest-conflict shared artifact.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - finance-lead
  - sales-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
---

# Pricing

Price book, discount guardrails, and usage meters. The highest-conflict shared component. Reviewer routing is strict and all changes PR regardless of maturity stage.

Template: [`../../schema/page-templates/shared/pricing-policy.md`](../../schema/page-templates/shared/pricing-policy.md), [`../../schema/page-templates/shared/discount-guardrail.md`](../../schema/page-templates/shared/discount-guardrail.md).

---

## Structure

- **[`price-book.md`](price-book.md).** Canonical price book. All pricing with in-file section labels by motion and segment.
- **[`discount-guardrails.md`](discount-guardrails.md).** Discount rules, approval thresholds, strategic exception band.
- **[`usage-meters.md`](usage-meters.md).** For usage-billed motions: what gets metered, how, billing cadence, overage handling.

## Ownership

- **Owner**: RevOps lead.
- **Co-authors**: Finance lead, Sales lead.
- **Required reviewers on any change**: RevOps, Finance, and Sales lead. Legal on MSA language changes.
- **Consumers**: Sales (quoting), Finance (billing, revenue recognition), Legal (contracts), CS (renewals and expansion).

## Change class

**Always PR** (never auto-merge, regardless of maturity stage):

- Any change to `price-book.md`
- Any change to approval thresholds in `discount-guardrails.md`
- Any change to billable units, overage policy, or rate in `usage-meters.md`

**Changes that can eventually auto-merge at Stage 2+**:

- Formatting, backlink fixes, and cross-reference updates that do not change amounts or thresholds.

## What's sourced where

- **List price.** From the pricing committee decision log (product, finance, RevOps).
- **Discount patterns.** From closed-won analysis in HubSpot or Salesforce. Cited with `as_of:` dates.
- **Strategic exceptions.** From deal desk approvals, ranked by frequency.
- **Usage meter rates.** From the billing system (source of truth).

Every price claim cites its source. Unsourced price claims fail `ci verify`.

## Lint signals specific to pricing

- **Discount guardrail drift.** If closed-deal pattern diverges from documented guardrails by >15% over 90 days, flag for review.
- **Verification stale.** Pricing pages extend `verified_until` quarterly, not annually. Short staleness window.
- **Cross-doc contradiction.** If a sales playbook or CS renewal play cites a discount or price that does not match the price book, flag.

## Review cadence

- **Quarterly.** Full re-verification of price-book against closed-won patterns.
- **On pricing committee decision.** PR the same week.
- **On motion or segment shift.** Full re-verification when the company enters or exits a motion or segment.

## Related

- [`../product-and-packaging/`](../product-and-packaging/), what's being priced
- [`../icp/`](../icp/), segment pricing anchors to ICP tiers
- [`../../functions/FUTURE-FUNCTIONS.md`](../../functions/FUTURE-FUNCTIONS.md), where the finance and legal function (revenue recognition, contract terms) is described.
- [`../../functions/sales/`](../../functions/sales/) (Phase 1), quoting plays reference this
