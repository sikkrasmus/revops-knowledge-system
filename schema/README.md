---
type: meta
title: Schema
description: The binding contract for every page in the corpus. Frontmatter, citations, section labels, page templates, enum values.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# Schema

The binding contract for every page in the corpus. Whatever the page is (shared-spine ICP, function playbook, source snapshot), it conforms to what this directory specifies.

The `shared/` and `functions/` directory layouts are instance choices. The schema is not. A fork can rename `shared/icp/` or move sales out of Phase 1, but it cannot drop frontmatter, drop citations, or invent its own grammar for section labels without breaking the rest of the system.

---

## What lives here

| File | Purpose |
|---|---|
| [`authoring-contract.md`](authoring-contract.md) | Operating agreement between humans, LLMs, and reviewers. Source precedence, citations, conflict resolution, never-edit-directly files, voice. |
| [`frontmatter.md`](frontmatter.md) | YAML frontmatter spec. Required and optional fields by page type. Field formats. What `ci verify` checks. |
| [`section-labels.md`](section-labels.md) | In-file syntax for scoping headings to motion or segment combinations. Grammar plus regex parser. |
| [`enums.yaml`](enums.yaml) | Machine-readable enum values for `type`, `motion`, `segment`, `consumers`, `confidence`. Read by `ci verify`. |
| [`page-templates/`](page-templates/) | Starting-point markdown templates for each page type. Copy, fill, commit. |

## What is framework vs instance

| Concern | Layer | Fork can change? |
|---|---|---|
| Frontmatter is required on every page | Framework | No |
| Claim-level `[source: ...]` citations are required | Framework | No |
| Section-label grammar (two-space rule, key-value braces) | Framework | No |
| Three freshness signals (`source_drift`, `verification_stale`, `has_contradiction`) | Framework | No |
| `motion` enum values (`plg`, `sales-assisted`, `enterprise`) | Default | Yes, adjust to fit GTM shape |
| `segment` enum values (`smb`, `mid-market`, `enterprise`) | Default | Yes, adjust to fit segmentation |
| `type` enum values | Mixed | Universal types (e.g., `icp`, `persona`, `metric-definition`) are framework. Sales-specific types (e.g., `battlecard`, `champion-profile`) ship as defaults from the filled instance, drop them in a marketing-led or CS-led fork. |
| `consumers` enum values | Default | Yes, depends on which functions a fork carries |
| Page templates in `page-templates/shared/` | Default | Yes, edit to match the spine your fork lands on |
| Page templates in `page-templates/sales/` | Instance | Drop or replace if sales is not your Phase 1 |

## How the schema gets enforced

- **`ci verify <slug>`** runs the mechanical checks: frontmatter present, fields valid, enum values match, source references resolve, every `[source: ...]` cited is in the `sources:` list. Spec: [`frontmatter.md`](frontmatter.md) §`ci verify` checks.
- **`ci verify --all`** adds corpus-wide checks: duplicate slugs, `index.md` freshness, broken internal links, orphan `sources:` entries.
- **PR review** enforces the judgmental parts: source-precedence calls, contradiction resolution, voice, change-class routing.

`ci verify` running clean does not mean the page is correct. It means the page is well-formed. Correctness is the reviewer's job.

## Adding to the schema

Adding a new page type, a new enum value, or a new section-label key is a schema change. Schema changes always PR, regardless of maturity stage.

1. PR to `enums.yaml` with the new value and a one-line rationale.
2. PR to the relevant spec doc (`frontmatter.md` or `section-labels.md`) documenting what it means and when to use it.
3. PR to the `ci verify` regex if the change touches section-label grammar.
4. New page template if a new `type` warrants one.

Do not introduce values ad-hoc in page frontmatter. `ci verify` will fail.
