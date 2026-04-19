# Architecture

Three layers. Three operations. Navigation trio. Source-storage model. Component model.

For the *why* behind each choice, see [`../PRINCIPLES.md`](../PRINCIPLES.md).

---

## Three layers

### Layer 1 — Raw sources

Files in [`../sources/`](../sources/) plus live-system queries via connector specs in [`../ingestion/connectors/`](../ingestion/connectors/). Hybrid policy in [`../sources/POLICY.md`](../sources/POLICY.md):

- **In-repo**: synthesized markdown summaries of calls, cleaned Confluence/Notion/Drive exports, redacted deal reviews. Small, non-sensitive, auditable.
- **Out-of-repo**: raw recordings, sensitive contracts, full transcripts. Referenced by URL with `as_of:` timestamps.
- **Live systems**: never duplicated. Cited via connector-spec protocols (`hubspot://`, `gong://`, `stripe://`).

This split matters because the wiki is a reconciled artifact, not a replica. A single wiki page often synthesizes multiple sources; re-syncing would overwrite the synthesis.

### Layer 2 — The wiki

Markdown files in a git repo. Two parts:

- **[`../shared/`](../shared/)** — seven co-authored-shared components (ICP, personas, product-and-packaging, pricing, positioning, competitive-intel, data-definitions).
- **[`../functions/`](../functions/)** — function-specific content (sales, marketing, CS, support, RevOps, finance-legal).

Motion (`plg` / `sales-assisted` / `enterprise`) and segment (`smb` / `mid-market` / `enterprise`) are frontmatter tags on pages + in-file section labels on headings. Never parallel directory trees. Never overlay directories. One canonical page per artifact; views projected by filter.

### Layer 3 — The schema

Operating agreement between humans, LLMs, and reviewers:

- **[`../schema/authoring-contract.md`](../schema/authoring-contract.md)** — who does what, source precedence, citation rules, never-edit files.
- **[`../schema/frontmatter.md`](../schema/frontmatter.md)** — required/optional fields by page type.
- **[`../schema/section-labels.md`](../schema/section-labels.md)** — in-file motion/segment grammar.
- **[`../schema/enums.yaml`](../schema/enums.yaml)** — machine-readable allowed values.
- **[`../schema/page-templates/`](../schema/page-templates/)** — shape of each page type.

## Three operations

### Ingest

Changes land via PR. v1 ships the artifact-commit path — humans and LLMs edit via PR. Abstract connector pattern in [`../ingestion/connectors/PATTERN.md`](../ingestion/connectors/PATTERN.md) specifies the five lifecycle stages (auth → extract → synthesize → snapshot → PR). Real implementations Phase 3+.

Conversation-harvest (ingest session transcripts for candidate changes) is documented in [`../ingestion/conversation-harvest/DESIGN.md`](../ingestion/conversation-harvest/DESIGN.md). Phase 4+.

### Query

Humans and agents retrieve via `ci` (see [`../consumption/cli/`](../consumption/cli/)) or native Read/Grep.

Retrieval protocol:

1. Read [`../index.md`](../index.md) to locate candidate pages — the catalog.
2. `ci show <slug>` to drill into a page.
3. `ci sources <slug>` to see provenance.
4. `ci verify <slug>` before trusting load-bearing content.
5. Cite `[source: ...]` in any summary back to the user.

The `index.md` catalog replaces embedding-based retrieval at our scale (hundreds to low thousands of pages).

### Lint

Weekly pass ([`../ingestion/drift-detection.md`](../ingestion/drift-detection.md)) detects three freshness signals:

- **Source drift** — source changed since snapshot.
- **Verification stale** — `verified_until` passed.
- **Contradiction** — another page claims incompatible fact.

When a signal fires: frontmatter flag set (not auto-rewritten), surface in `ci stale`, LLM opens a reconciliation PR. Nothing auto-rewrites. Reconciliation is judgment.

## Navigation trio

Three files at the repo root:

| File | Role | Maintained by |
|---|---|---|
| [`../CLAUDE.md`](../CLAUDE.md) | Routing. Map. Loaded on session start. | Hand-written |
| [`../index.md`](../index.md) | Catalog. Every page one-liner + metadata. | `ci reindex` (deterministic) |
| [`../log.md`](../log.md) | Audit. Chronological events. | Automation-appended on merge |

The LLM reads `index.md` first for retrieval. Neither `index.md` nor `log.md` is ever hand-edited; both are automation-maintained.

## Component model

Three-layer model for where content lives:

1. **Shared spine** — seven co-authored components in `shared/`. Every function reads from.
2. **Function-specific** — per-function directories (`functions/<name>/`). Methodology, playbooks, frameworks, plays.
3. **Motion/segment variation** — frontmatter tags on pages + in-file section labels on headings. Never parallel trees.

Shared spine qualifying criteria: multi-author, friction-generating when out of sync, broadly referenced. Less-shared content (authored-shared: single author, many readers) lives in function directories to avoid heavy review machinery.

## Storage and transport

- **Storage**: markdown files in git. No database. No CMS. No vendor.
- **Retrieval**: grep + find + frontmatter filtering. No embeddings.
- **Identity**: git commits. Every change is a diff attributable to a human or LLM author.
- **Audit**: `git log`, `log.md`, and the PR history.

When does a vector DB make sense? When the corpus crosses ~5,000 pages AND queries frequently hit the long tail (no obvious page match via `index.md` + grep). For a single company's GTM/RevOps knowledge, that ceiling is distant. If you hit it, the answer is better structure (sub-indexes, function-level indexes) before considering a vector engine.

## Graduated trust (governance)

Two dimensions, orthogonal:

### Maturity stage

| Stage | Timeline | Auto-merge posture |
|---|---|---|
| Stage 1 | Months 0-3 | 100% PR |
| Stage 2 | Months 3-6 | Routine low-risk auto-merges (backlinks, format) |
| Stage 3 | Months 6+ | Multi-source consensus, pattern-matched autonomy |

### Content type

Some content classes always PR regardless of stage (ICP, pricing, packaging, legal, strategic positioning, new page, delete page). Others scale with maturity.

Details: [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md) and [`../ingestion/auto-merge-rules.yaml`](../ingestion/auto-merge-rules.yaml) (concept only in v1).

## Why this architecture

- **Markdown-in-git** — portable, inspectable, diffable, forkable. Twenty-year durability.
- **Grep-native** — no magic. What you grep is what the LLM retrieves.
- **Schema-first** — the operating agreement is explicit. Drift is a lint failure, not a whispered complaint.
- **Provenance throughout** — every claim cites a source; every source resolves.
- **Humans in the loop by default, automation earns autonomy** — trust is graduated.

## Related

- [`01-WHY.md`](01-WHY.md) — failure modes prior attempts ran into
- [`03-IMPLEMENTATION.md`](03-IMPLEMENTATION.md) — the 4 hard parts + CLI + graduated trust + drift
- [`05-COMPARISON.md`](05-COMPARISON.md) — how this fits alongside Glean, Guru, Notion AI, etc.
- [`06-AGENTS-IN-ACTION.md`](06-AGENTS-IN-ACTION.md) — concrete agent scenarios
