---
type: meta
title: Contract Excerpts
description: Redacted contract excerpts — pricing terms, SLA language, notable clauses. Originals in legal vault.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Contract Excerpts

Redacted contract excerpts. Original signed contracts stay in the legal vault (Google Drive / DocuSign / Ironclad / etc.). This directory holds excerpts that wiki pages — pricing, usage-meters, compliance posture — can cite.

## What to include

- Pricing / discount tier language that informs the price book or discount guardrails.
- SLA definitions that inform CS commitments.
- Usage-meter / overage language.
- Non-standard terms that require tracking (e.g., a custom indemnification that might set precedent).

## What to exclude

- Customer-identifying info unless explicitly consented.
- Compensation terms.
- Proprietary pricing of third-party suppliers.

## Template frontmatter

```yaml
---
type: source
title: <contract excerpt title>
description: <one-line summary>
owner: <email-or-github-handle>
last_reviewed: <YYYY-MM-DD>
source_system: drive
source_url: https://drive.google.com/...
source_captured_at: <YYYY-MM-DD>
source_drift: false
pii_status: redacted
consumers:
  - sales
  - finance
  - legal
---
```

## Phase 0 content

No actual contract excerpts ship in Phase 0. Phase 3 synthetic-company instance populates.

## Related

- [`../POLICY.md`](../POLICY.md) — PII and sensitivity rules
- [`../../shared/pricing/`](../../shared/pricing/) — pricing that references contracts
