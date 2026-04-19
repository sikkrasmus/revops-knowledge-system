# Frontmatter Specification

Every page in this corpus has YAML frontmatter between `---` markers at the top. `ci verify` enforces it. Enum values are centralized in [`enums.yaml`](enums.yaml) and validated mechanically.

This is the precise spec. For the operating agreement (who writes what, when to PR), see [`authoring-contract.md`](authoring-contract.md).

---

## Canonical example

```yaml
---
type: icp                                    # enum — see enums.yaml
title: Tier 1 ICP — Multi-product Platforms
description: Tier 1 ICP profile for $25-100M ARR multi-product B2B SaaS companies.
owner: rasmus@unfrankenstein.io              # email or github handle
reviewers:                                   # list; required for shared/ + functions/
  - revops-lead
  - sales-lead
last_reviewed: 2026-04-19                    # ISO date; required
verified_until: 2026-07-19                   # ISO date; required for shared/ + functions/
motion:                                      # list; enum
  - sales-assisted
  - enterprise
segment:                                     # list; enum
  - mid-market
  - enterprise
consumers:                                   # list; enum (functions that read this page)
  - marketing
  - sales
  - cs
  - finance
sources:                                     # list; claim-level source references
  - sources/calls/2026-04-15-acme-discovery.md
  - hubspot://deals?stage=closed-won&period=2026-Q1 as_of:2026-04-19
source_drift: false                          # optional; set by drift-detection lint
verification_stale: false                    # optional; set by ci verify
has_contradiction: null                      # optional; null or list of page paths
confidence: high                             # optional; enum
---
```

## Required fields

| Field | Type | Required on | Notes |
|---|---|---|---|
| `type` | enum | all pages | See [`enums.yaml`](enums.yaml) for allowed values |
| `title` | string | all pages | Free text, used in `index.md` link text |
| `description` | string | all pages | Single line, max 200 chars, ends with `.`. Used by `ci reindex` as the one-line summary in `index.md`. |
| `owner` | string | all pages | Email or github handle |
| `last_reviewed` | ISO date | all pages | `YYYY-MM-DD` |
| `verified_until` | ISO date | `shared/`, `functions/` | `YYYY-MM-DD` — when today > this date, `ci verify` sets `verification_stale: true` |
| `reviewers` | list[string] | `shared/`, `functions/` | List of reviewer handles or role slugs |

## Conditionally-required fields

| Field | When required |
|---|---|
| `motion` | When the page's content is motion-specific — typically `shared/pricing/`, `shared/positioning/`, `shared/personas/`, most `functions/` pages |
| `segment` | When the page's content is segment-specific — ICP tiers, segment-specific playbooks |
| `consumers` | On all `shared/` pages. States which functions read this page. |
| `sources` | On any page with factual claims. Required for all `shared/` pages. |

## Optional fields

| Field | Type | Set by |
|---|---|---|
| `source_drift` | bool | Drift-detection lint when a source has changed since snapshot |
| `verification_stale` | bool | `ci verify` when today > `verified_until` |
| `has_contradiction` | list[string] or null | Lint pass when another page cites a conflicting claim |
| `confidence` | enum (`low` / `medium` / `high`) | LLM author on creation/edit |

## Field formats

- **Dates** — ISO 8601 `YYYY-MM-DD`. No other formats accepted.
- **Lists** — YAML sequences. Empty list is `[]` (not omitted).
- **Optional fields** — when the field exists but has no value, use explicit `null` (not omitted).
- **Enums** — exact string match against [`enums.yaml`](enums.yaml). Unknown values fail `ci verify`.

## Motion and segment

See [`section-labels.md`](section-labels.md) for how in-file headings can scope sub-sections to specific motion/segment combinations.

Page-level frontmatter tags are the broad filter (e.g., `motion: [plg, sales-assisted]` = this page applies to PLG and sales-assisted motions). In-file section labels are the precise per-section scope (e.g., `## Enterprise pricing  {motion: enterprise}` = only this heading's content applies to enterprise motion).

## Source references

Two formats accepted:

- **File reference**: `sources/<category>/<filename>` — must resolve to a file in the repo.
- **System query**: `<system>://<query-string> as_of:<ISO-date>` — `<system>` must have a connector spec in `ingestion/connectors/`. The `as_of:` timestamp is required.

Claim-level citations in page body use square brackets: `[source: <reference>]`. `ci verify` requires every `[source: ...]` to match an entry in `sources:` and vice versa.

## `ci verify` checks

`ci verify <page>` enforces:

1. Frontmatter block present; YAML parses.
2. All required fields present for the page's directory.
3. Field types valid (dates parse, lists are lists).
4. Enum values in [`enums.yaml`](enums.yaml).
5. `description` is single-line, max 200 chars, ends with `.`.
6. `verified_until` not in past (warning unless `--strict`).
7. Source references resolve (files exist or connector spec exists).
8. Every `[source: ...]` citation appears in `sources:` and vice versa.

`ci verify --all` adds corpus-wide checks — duplicate slugs, `index.md` freshness.

## Adding enum values

New `type`, `motion`, `segment`, `consumers`, or `confidence` value requires a PR to [`enums.yaml`](enums.yaml) with a brief rationale. Don't add values ad-hoc in page frontmatter — `ci verify` will fail.

## Why frontmatter at all

- Enables `ci reindex` to build `index.md` deterministically.
- Enables `ci list` filters (by type, motion, segment, consumer).
- Enables staleness and drift detection (dates, flags).
- Enables graph queries (`consumers`, `sources`).
- Turns the markdown corpus into a structured, queryable surface without a database.

Every optional field you skip degrades one of the above. Fill frontmatter carefully.
