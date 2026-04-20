---
type: meta
title: Issue template — contradiction found
description: Use when two pages or a page and a source make incompatible claims.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Issue template — contradiction found

Copy into a new issue when lint or human review surfaces a contradiction.

---

## **Claim A (Page 1)**

- **Page**: `<page path>`
- **Claim**: <quote>

## **Claim B (Page 2 or source)**

- **Location**: `<page path or source reference>`
- **Claim**: <quote>

## **Why they contradict**

<One sentence: specifically what makes these incompatible.>

## **Precedence analysis**

Per [`../../../schema/authoring-contract.md`](../../../schema/authoring-contract.md) §2:

- Claim A source tier: `<signed-dated / recorded-conversation / written-internal / synthesized / chat>`
- Claim B source tier: `<same taxonomy>`
- Recency: which is newer

## **Proposed resolution**

- [ ] Claim A wins — update Claim B's page to align or remove
- [ ] Claim B wins — update Claim A's page
- [ ] Both are partially right — re-synthesize into a unified claim
- [ ] Can't resolve mechanically — escalate

## **Assigned reviewer**

Highest-authority reviewer across the affected pages.

## **Related**

- `<related issues / PRs>`
