---
type: meta
title: Personas & Buying Committees
description: Individual roles plus buying-committee configurations across deal sizes and motions.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - marketing-lead
  - cs-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# Personas & Buying Committees

Two layers:

- **Personas** — individual roles. One file per role in [`personas/`](personas/).
- **Buying committees** — multi-persona configurations, scoped by deal size, segment, and motion. One file per config in [`buying-committees/`](buying-committees/).

Template: [`../../schema/page-templates/shared/persona.md`](../../schema/page-templates/shared/persona.md) and [`../../schema/page-templates/shared/buying-committee.md`](../../schema/page-templates/shared/buying-committee.md).

---

## Why two layers

A persona is atomic — one role with pains, authority, objections, buying preferences. Reusable.

A buying committee is a configuration — "for $50K mid-market deals, the committee is champion + approver + reviewer, and here's how the decision actually moves." Committees reference personas; personas don't reference committees.

## Persona list

- [`personas/head-of-revops.md`](personas/head-of-revops.md) — Head of RevOps (Phase 0)
- [`personas/vp-sales.md`](personas/vp-sales.md) — VP Sales (Phase 1 addition, surfaced by Sales function fill)

Additional personas get added as the spine fills. Common roles worth their own page: VP Marketing, CFO, Head of Data, Head of CS, Head of Product, CRO, COO.

## Buying-committee list

- [`buying-committees/mid-market-sales-assisted.md`](buying-committees/mid-market-sales-assisted.md) — mid-market sales-assisted committee (Phase 0)
- [`buying-committees/enterprise-direct.md`](buying-committees/enterprise-direct.md) — enterprise direct committee (Phase 1 addition)

Add more as you encounter distinct committee configurations. Open slots:

- `smb-plg.md` — self-serve + ICs
- `multi-entity.md` — same buyer spanning multiple business units with shared procurement

## Ownership

- **Owner**: Sales lead (primary accountability — sales has the closest buyer contact).
- **Co-authors**: Marketing lead (persona research), CS lead (post-close expansion buyer).
- **Consumers**: Marketing, Sales, CS, Product.

## What's sourced where

- **Persona pains** — from discovery call transcripts (Gong/Fathom), plus marketing research, plus lost-deal postmortems.
- **Committee decision flows** — from closed-won retrospectives and Gong call patterns.
- **Authority signals** — from actual signed-deal roles, not assumed roles.

Every claim is cited. Stale persona content is one of the most common drift patterns — re-verify quarterly.

## Related

- [`../icp/`](../icp/) — which personas are primary in which tier
- [`../pricing/`](../pricing/) — pricing typically routes to persona authority
- [`../positioning/`](../positioning/) — positioning variants by persona
