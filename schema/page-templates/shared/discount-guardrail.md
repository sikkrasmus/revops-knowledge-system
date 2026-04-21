---
type: discount-guardrail
title: "<Guardrail label, e.g., Mid-market discount guardrails 2026>"
description: "<one-line summary of scope and approval thresholds>."
owner: "<email-or-github-handle>"
reviewers:
  - <revops-lead>
  - <finance-lead>
last_reviewed: <YYYY-MM-DD>
verified_until: <YYYY-MM-DD>
motion:
  - <enum value>
segment:
  - <enum value>
consumers:
  - sales
  - finance
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# <Guardrail label>

> Template for discount guardrail pages. Replace frontmatter and content, remove this blockquote.

## Approval thresholds

| Discount range | Approver | Required conditions |
|---|---|---|
| 0–10% | AE | Standard |
| 10–18% | Deal Desk | Justification note required |
| 18–25% | VP Sales / RevOps Lead | Strategic exception conditions |
| >25% | CFO | Multi-year + reference commit + strategic logo |

## Strategic exception band

The 18–25% band applies only when ALL conditions are met:

- `<condition 1, e.g., 3-year term>`
- `<condition 2, e.g., multi-product bundle>`
- `<condition 3, e.g., reference-customer commitment>`
- `<condition 4, e.g., target vertical, net-new logo>`

Missing any condition → hold at 18% max.

## Concession tiers (non-price)

In lieu of or alongside discount:

- **3-year term** in exchange for `<X>%` discount
- **Reference commitment** in exchange for `<X>%` discount
- **Case-study rights** in exchange for `<X>%` discount
- **Multi-entity rollout** in exchange for `<X>%` discount

## Observed pattern (evidence-based)

<Pattern from the last N closed deals: which conditions actually correlate with discount tier. Cite postmortem pages or HubSpot closed-won queries.>

Example: "Last 12 closed deals at >18% discount in mid-market manufacturing: all had 3-year term; 9 of 12 had multi-product; 7 of 12 had reference commit" [source: hubspot://deals?stage=closed-won&discount>0.18&segment=mid-market&vertical=manufacturing as_of:YYYY-MM-DD].

## When a deal hits the exception band

1. AE submits Deal Desk form with conditions checklist.
2. Deal Desk reviews conditions, pulls comparable closed deals from [`../../functions/sales/playbooks/`](../../functions/sales/playbooks/) or equivalent.
3. Approval routed to VP Sales / RevOps Lead.
4. Rationale logged to `log.md` on deal close for lint pattern tracking.

## Lint signals

- If discount guardrails haven't been re-verified against actual closed-deal patterns in >90 days: flag with `verification_stale: true`.
- If >30% of strategic-exception deals are closing without all conditions met: flag for policy review PR.

## Related

- [`pricing-policy.md`](./pricing-policy.md), the price book these guardrails protect
- [`../../functions/sales/`](../../functions/sales/), sales playbooks reference this

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
