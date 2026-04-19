---
type: meta
title: Ingestion
description: How changes land in the corpus — PR workflow, graduated trust, drift detection, connector patterns.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Ingestion

How changes land in the corpus. Three paths:

- **Artifact-commit** (v1, shippable) — function heads and contributors commit via PR. [`artifact-commit/`](artifact-commit/).
- **Connectors** (Phase 3 / community) — automated pipelines that pull from source systems and open PRs. Abstract pattern only in v1: [`connectors/PATTERN.md`](connectors/PATTERN.md).
- **Conversation harvest** (Phase 4+) — ingest Claude Code / Cowork session transcripts. Design doc only: [`conversation-harvest/DESIGN.md`](conversation-harvest/DESIGN.md).

Governance applies to all three paths equally: [`pr-workflow.md`](pr-workflow.md).

---

## Contents

| File | Purpose |
|---|---|
| [`pr-workflow.md`](pr-workflow.md) | Graduated trust model, reviewer routing, PR etiquette |
| [`artifact-commit/`](artifact-commit/) | v1 ingestion — humans and LLMs commit via PR |
| [`drift-detection.md`](drift-detection.md) | Lint-pass spec: source drift, verification stale, contradiction |
| [`auto-merge-rules.yaml`](auto-merge-rules.yaml) | Which change classes auto-merge at which stage (concept only in v1) |
| [`connectors/`](connectors/) | Abstract connector pattern (no real implementations in v1) |
| [`conversation-harvest/DESIGN.md`](conversation-harvest/DESIGN.md) | Future ingestion path — design only |

## Phase 0 governance posture

- **Every change PRs.** No auto-merge in v1. `auto-merge-rules.yaml` ships as concept for Stage 2+ operators.
- **Reviewer routing follows directory ownership** in [`pr-workflow.md`](pr-workflow.md).
- **Drift detection runs weekly** as documented in [`drift-detection.md`](drift-detection.md). Not enforced in Phase 0 CI — that's a Stage 2 concern. Operators can run the spec as a manual lint pass today.

## Related

- [`../schema/authoring-contract.md`](../schema/authoring-contract.md) — what the LLM must do when editing
- [`../PRINCIPLES.md`](../PRINCIPLES.md) — graduated trust principle
