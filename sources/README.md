---
type: meta
title: Sources
description: File-based source layer. Snapshots of calls, contracts, decks, and internal docs with hybrid in-repo/out-of-repo policy.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Sources

The file-based source layer. Synthesized snapshots of external source material (calls, contracts, decks, internal docs) that the corpus cites. Hybrid in-repo and out-of-repo policy per [`POLICY.md`](POLICY.md).

Live systems (HubSpot, Gong, Stripe, Salesforce, Slack) are **never duplicated here**. They are cited by point-in-time reference via connector specs in [`../ingestion/connectors/`](../ingestion/connectors/).

---

## Two source models

The framework recognizes exactly two ways a wiki page is backed by evidence.

1. **In-repo synthesized snapshot.** Markdown file under `sources/`. Captured at ingestion time, immutable once captured (beyond PII re-review). Cited as `[source: sources/<category>/<filename>]`.
2. **Live-system reference.** Connector spec in `ingestion/connectors/` defines the system. Cited as `[source: <system>://<query> as_of:<ISO-date>]`. Never copied into the repo.

Both rules are framework-binding. Which subdirectories you carve under `sources/` is an instance choice. The five below are the example shape for B2B SaaS sales-assisted at $10 to $100M ARR. A devtools or PLG fork might add `community/` (Discord transcripts, GitHub issues). A vertical SaaS fork in a regulated industry might add `regulatory/` (compliance docs, audit findings). Adjust to fit.

## Example directory layout

| Directory | What lives here | Raw source lives in |
|---|---|---|
| [`calls/`](calls/) | synthesized call summaries (markdown) | Gong, Fathom, Chorus, Avoma |
| [`contracts/`](contracts/) | redacted contract excerpts | Legal vault, Google Drive |
| [`decks/`](decks/) | deck excerpts (markdown, not original slides) | Google Drive, Notion |
| [`internal-docs/`](internal-docs/) | synthesized Confluence, Notion, Drive snapshots | Confluence, Notion, Google Drive |
| [`deal-reviews/`](deal-reviews/) | redacted deal review notes | Salesforce, HubSpot deal rooms |

## What goes in-repo

Per [`POLICY.md`](POLICY.md):

- Synthesized markdown summaries (LLM-generated or human-written)
- Small, non-sensitive, auditable content
- Content that has been through PII redaction

## What stays out-of-repo

- Raw audio/video recordings
- Sensitive contracts (unredacted)
- Full transcripts containing PII that can't be redacted without destroying meaning
- Anything the source system is the system of record for (live CRM data, billing events, production logs)

Out-of-repo content is referenced by URL with permissioned access. Citations carry the URL plus a fetch timestamp.

## Citation formats

**In-repo file reference:**

```markdown
Multi-product platforms close 40% faster than single-product peers
[source: sources/calls/2026-04-15-acme-discovery.md].
```

**Out-of-repo / live-system reference:**

```markdown
[source: https://gong.io/calls/abc123 as_of:2026-04-15]
[source: hubspot://deals?stage=closed-won&period=2026-Q1 as_of:2026-04-19]
```

`ci verify` enforces:

- File references must resolve to existing files in this directory.
- System-query references must reference a connector spec in `ingestion/connectors/`.
- External URLs with `as_of:` are valid but not resolved (would require live fetch).

## Ownership

- **Owner**: RevOps lead (coordinates the ingestion surface).
- **Per-file owner**: stated in the file's frontmatter `owner` field.
- **Review**: source snapshots are reviewed for PII compliance before merge.

## Naming convention

```
<YYYY-MM-DD>-<slug>.md
```

Example: `2026-04-15-acme-discovery.md`. A call on 2026-04-15, slug `acme-discovery`.

Slug tips:

- Anonymize if the customer name is sensitive. Use an alias.
- Don't put individual names in the slug.
- Keep it short. The slug is the identifier forever.

## Frontmatter requirements (source pages)

```yaml
---
type: source
title: <descriptive title>
description: <one-line summary>
owner: <email-or-github-handle>
last_reviewed: <YYYY-MM-DD>
# verified_until optional on sources/ pages
# reviewers optional on sources/ pages
source_system: <gong | fathom | confluence | drive | hubspot | ...>
source_url: <URL in original system>
source_captured_at: <YYYY-MM-DD>
source_drift: false
pii_status: <redacted | none | needs-review>
consumers:
  - <function>
---
```

See [`POLICY.md`](POLICY.md) for PII status definitions and handling.

## Relation to the wiki

Sources are **snapshots at ingestion time**. The wiki page synthesized from a source is a reconciled artifact. You cannot re-sync it by re-fetching the source, because synthesis usually combines multiple sources.

Drift is detected (webhook where available, lint pass weekly) and surfaces as a frontmatter flag on the *wiki page*, not the source. The source file itself is immutable once captured (beyond PII re-review).

See [`../ingestion/drift-detection.md`](../ingestion/drift-detection.md).

## Related

- [`POLICY.md`](POLICY.md), hybrid in-repo and out-of-repo policy, PII rules
- [`../ingestion/connectors/PATTERN.md`](../ingestion/connectors/PATTERN.md), abstract connector pattern
- [`../schema/authoring-contract.md`](../schema/authoring-contract.md), citation requirements
- [`../schema/frontmatter.md`](../schema/frontmatter.md), base frontmatter spec for all pages
