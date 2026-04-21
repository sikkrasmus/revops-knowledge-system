---
type: meta
title: Contract Excerpts
description: Redacted contract excerpts. Pricing terms, SLA language, notable clauses. Originals in legal vault.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# Contract Excerpts

Redacted contract excerpts. Original signed contracts stay in the legal vault (Google Drive, DocuSign, Ironclad, or equivalent). This directory holds excerpts that wiki pages (pricing, usage-meters, compliance posture) can cite.

## What to include

- Pricing or discount tier language that informs the price book or discount guardrails.
- SLA definitions that inform CS commitments.
- Usage-meter or overage language.
- Non-standard terms that require tracking (a custom indemnification that might set precedent, for instance).

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

## What ships here

No actual contract excerpts. A fork populates this directory with real excerpts.

## Related

- [`../POLICY.md`](../POLICY.md), PII and sensitivity rules
- [`../../shared/pricing/`](../../shared/pricing/), pricing that references contracts
