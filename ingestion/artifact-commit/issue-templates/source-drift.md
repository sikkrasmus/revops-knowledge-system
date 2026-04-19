---
type: meta
title: Issue template — source drift detected
description: Use when a source underlying one or more wiki pages has changed since snapshot.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Issue template — source drift detected

Copy into a new issue when drift-detection lint fires or manual review reveals source drift.

---

## **Source**

- **Reference**: `<source path or URL>`
- **Snapshot captured at**: `<YYYY-MM-DD>`
- **Detected change at**: `<YYYY-MM-DD>`

## **Affected wiki pages**

Pages that cite this source and therefore carry `source_drift: true`:

- `<page 1>`
- `<page 2>`
- `<page 3>`

## **Drift summary**

<What changed at the source. Keep factual — link to before/after if possible.>

## **Reconciliation proposal**

- [ ] Re-synthesize from current source (single-source driven pages)
- [ ] Combine new source with existing synthesis (multi-source pages)
- [ ] Source is wrong or superseded — leave wiki as-is, annotate
- [ ] Escalate — conflicting with another source on same topic

## **Assigned reviewer**

Per [`../../pr-workflow.md`](../../pr-workflow.md) routing for the affected pages.

## **Related**

- [`../../drift-detection.md`](../../drift-detection.md)
