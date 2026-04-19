---
type: meta
title: PR Template
description: Required fields for every PR against the corpus.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# PR Template

Copy this into every PR description. Required fields in **bold**.

---

## **Summary**

<One paragraph: what changed, why, which function(s) are affected.>

## **Change class**

One of (see [`../auto-merge-rules.yaml`](../auto-merge-rules.yaml)):

- `icp_definition_change` — always PR
- `pricing_change` — always PR
- `product_packaging_change` — always PR
- `legal_compliance_change` — always PR
- `strategic_positioning_change` — always PR
- `new_page_create` — always PR
- `page_delete` — always PR
- `new_page_rename` — always PR
- `single_canonical_source_factual_update` — Stage 2+ auto-merge candidate
- `backlink_update` — Stage 2+ auto-merge candidate
- `cross_reference_fix` — Stage 2+ auto-merge candidate
- `index_md_entry_add` — auto-mergeable (via `ci reindex`)
- `format_fix` — Stage 2+ auto-merge candidate
- `last_reviewed_refresh` — Stage 2+ auto-merge candidate
- `other` — explain

## **Sources cited**

- `<source 1 — file path or system://query as_of:date>`
- `<source 2>`

Each factual claim in the diff must match a source here.

## **Affected consumers**

Functions whose pages cite the changed page(s). Get this from:

```bash
ci graph <page-slug>
```

- `<list of affected pages and their functions>`

## **Confidence**

`low` / `medium` / `high` — author's assessment of how solid the source evidence is.

## **Lint status**

Paste `ci verify --all` output. Should be clean; if not, note the exceptions and why.

## **Reviewer**

Per [`../pr-workflow.md`](../pr-workflow.md) §3 routing. Tag:

- Primary reviewer: `@<primary>`
- Co-reviewers: `@<co-reviewer 1>`, `@<co-reviewer 2>`

## **Rollback plan**

- If this change needs rollback: `git revert <merge-sha>` — any affected downstream pages?
- For a strategic change, note the fallback content source.

---

## For LLM-authored PRs — additional context

- **Prompt used** (if applicable): `<paste or link>`
- **Extraction confidence per claim**: attach if available
- **Alternative reconciliations considered**: `<if the diff involved choosing between sources>`
