---
type: meta
title: Ingestion
description: How changes land in the corpus. PR workflow, graduated trust, drift detection, connector patterns.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# Ingestion

How changes land in the corpus. Three paths.

- **Artifact-commit** (v1, shippable). Function heads and contributors commit via PR. See [`artifact-commit/`](artifact-commit/).
- **Connectors** (build in-house or fork from community). Automated pipelines that pull from source systems and open PRs. Abstract pattern only in v1: [`connectors/PATTERN.md`](connectors/PATTERN.md).
- **Conversation harvest** (aspirational, not built). Ingest Claude Code or Cowork session transcripts. Design doc only: [`conversation-harvest/DESIGN.md`](conversation-harvest/DESIGN.md).

Governance applies to all three paths equally. See [`pr-workflow.md`](pr-workflow.md).

---

## Contents

| File | Purpose |
|---|---|
| [`pr-workflow.md`](pr-workflow.md) | Graduated trust model, reviewer routing, PR etiquette |
| [`artifact-commit/`](artifact-commit/) | v1 ingestion. Humans and LLMs commit via PR. |
| [`drift-detection.md`](drift-detection.md) | Lint-pass spec: source drift, verification stale, contradiction |
| [`auto-merge-rules.yaml`](auto-merge-rules.yaml) | Which change classes auto-merge at which stage. Concept only in v1. |
| [`connectors/`](connectors/) | Abstract connector pattern. No real implementations in v1. |
| [`conversation-harvest/DESIGN.md`](conversation-harvest/DESIGN.md) | Aspirational ingestion path. Design only. |

## What ships today

- **Every change PRs.** No auto-merge in v1. `auto-merge-rules.yaml` ships as concept for operators who move to Stage 2+ later.
- **Reviewer routing follows directory ownership** per [`pr-workflow.md`](pr-workflow.md).
- **Drift detection runs as a manual lint pass.** Spec is in [`drift-detection.md`](drift-detection.md). Not wired into CI in v1 (a Stage 2 concern). Operators can run the spec today as a script.

## Related

- [`../schema/authoring-contract.md`](../schema/authoring-contract.md), what the LLM must do when editing
- [`../PRINCIPLES.md`](../PRINCIPLES.md), graduated trust principle
