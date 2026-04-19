---
type: meta
title: Internal Doc Snapshots
description: Synthesized Confluence/Notion/Drive page snapshots. Originals stay in source system.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Internal Doc Snapshots

Synthesized snapshots of Confluence, Notion, or Google Drive pages. Original pages stay in the source system (system of record). This directory holds the condensed markdown copy the wiki was derived from.

## Why snapshots, not live sync

Per principle 9 in [`../../PRINCIPLES.md`](../../PRINCIPLES.md): the wiki is a reconciled artifact, not a replica. Re-syncing would overwrite synthesis (a wiki page often combines one Confluence page + three calls + a deal review). Snapshots capture the state of the source at ingestion time; drift is detected and surfaces as a flag, not an overwrite.

## What to include

- The core content of the page that the wiki is citing, in markdown form.
- Structural preservation (headings, lists) where it aids reading.
- The original URL and fetch timestamp in frontmatter.

## What to exclude

- Verbose formatting that doesn't aid comprehension.
- Personal annotations in the original page.
- Comment threads unless the comment is load-bearing.

## Naming

```
<YYYY-MM-DD>-<doc-slug>.md
```

## Template frontmatter

```yaml
---
type: source
title: <doc title>
description: <one-line summary>
owner: <email-or-github-handle>
last_reviewed: <YYYY-MM-DD>
source_system: confluence  # or notion / drive
source_url: https://<org>.atlassian.net/wiki/spaces/...
source_captured_at: <YYYY-MM-DD>
source_drift: false
pii_status: redacted  # or none
consumers:
  - sales
  - revops
---
```

## Drift detection for internal docs

- Webhook-based where the source system supports (Confluence webhooks).
- Scheduled pull with content-hash comparison otherwise.
- On change detected: set `source_drift: true` on the *wiki page that cites this snapshot*, not the snapshot itself.

See [`../../ingestion/drift-detection.md`](../../ingestion/drift-detection.md).

## Phase 0 content

This README serves as the placeholder source referenced by shared spine pages in Phase 0. Real snapshots arrive in the Phase 3 synthetic-company instance.
