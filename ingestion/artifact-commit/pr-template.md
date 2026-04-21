---
type: meta
title: PR Template
description: Required fields for every PR against the corpus.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# PR Template

Copy this into every PR description. Required fields in **bold**.

---

## **Summary**

<One paragraph: what changed, why, which functions are affected.>

## **Change class**

Pick one. Full glossary in [`../auto-merge-rules.yaml`](../auto-merge-rules.yaml).

**Always PR (any stage):**

- `icp_definition_change`
- `pricing_change`
- `product_packaging_change`
- `legal_compliance_change`
- `strategic_positioning_change`
- `competitive_counter_positioning_change`
- `new_page_create`
- `page_delete`
- `page_rename`
- `schema_change`
- `ingestion_change`
- `any_change_flagged_source_drift_large`

**Stage 2+ auto-merge candidates:**

- `backlink_update`
- `cross_reference_fix`
- `format_fix`
- `last_reviewed_refresh`
- `index_md_entry_add` (via `ci reindex`)
- `single_canonical_source_factual_update`
- `frontmatter_field_typo_fix`

**Stage 3+ auto-merge candidates:**

- `multi_source_consensus_factual_update`
- `pattern_matched_change`
- `high_trust_contributor_change`

**Other:** explain.

## **Sources cited**

- `<source 1: file path or system://query as_of:date>`
- `<source 2>`

Each factual claim in the diff must match a source here.

## **Affected consumers**

Functions whose pages cite the changed pages. Get this from:

```bash
ci graph <page-slug>
```

- `<list of affected pages and their functions>`

## **Confidence**

`low`, `medium`, or `high`. Author's assessment of how solid the source evidence is.

## **Lint status**

Paste `ci verify --all` output. Should be clean. If not, note the exceptions and why.

## **Reviewer**

Per [`../pr-workflow.md`](../pr-workflow.md) §3 routing. Tag:

- Primary reviewer: `@<primary>`
- Co-reviewers: `@<co-reviewer 1>`, `@<co-reviewer 2>`

## **Rollback plan**

- If this change needs rollback: `git revert <merge-sha>`. Any affected downstream pages?
- For a strategic change, note the fallback content source.

---

## For LLM-authored PRs, additional context

- **Prompt used** (if applicable): `<paste or link>`
- **Extraction confidence per claim**: attach if available
- **Alternative reconciliations considered**: `<if the diff involved choosing between sources>`
