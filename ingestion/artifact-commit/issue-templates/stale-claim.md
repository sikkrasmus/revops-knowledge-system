---
type: meta
title: Issue template — stale claim
description: Use when a specific claim in a page appears out-of-date but the corrected value isn't yet clear.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Issue template — stale claim

Copy into a new issue.

---

## **Page**

`<page path, e.g., shared/pricing/discount-guardrails.md>`

## **Claim**

Quote the specific claim that looks stale:

> <claim text with surrounding sentence for context>

## **Why it looks stale**

- `<e.g., contradicted by closed deal pattern last 30 days>`
- `<e.g., source `<cited source>` has changed and page hasn't re-synthesized>`
- `<e.g., verified_until passed N days ago>`

## **Proposed action**

- [ ] Re-verify against current source
- [ ] Refresh `verified_until` with no content change
- [ ] Update content based on new evidence (PR would follow)
- [ ] Escalate for strategic review

## **Assigned reviewer**

Per [`../../pr-workflow.md`](../../pr-workflow.md) routing: `@<primary>`

## **Related**

- `<any related issues or PRs>`
