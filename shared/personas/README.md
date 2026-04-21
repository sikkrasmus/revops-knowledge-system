---
type: meta
title: Personas & Buying Committees
description: Individual roles plus buying-committee configurations across deal sizes and motions.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
  - cs-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# Personas and Buying Committees

Two layers:

- **Personas.** Individual roles. One file per role in [`personas/`](personas/).
- **Buying committees.** Multi-persona configurations scoped by deal size, segment, and motion. One file per config in [`buying-committees/`](buying-committees/).

Template: [`../../schema/page-templates/shared/persona.md`](../../schema/page-templates/shared/persona.md) and [`../../schema/page-templates/shared/buying-committee.md`](../../schema/page-templates/shared/buying-committee.md).

---

## Why two layers

A persona is atomic. One role with pains, authority, objections, and buying preferences. Reusable across deals.

A buying committee is a configuration: "for $50K mid-market deals, the committee is champion plus approver plus reviewer, and here is how the decision actually moves." Committees reference personas. Personas do not reference committees.

## Persona list

- [`personas/head-of-revops.md`](personas/head-of-revops.md), Head of RevOps (Phase 0)
- [`personas/vp-sales.md`](personas/vp-sales.md), VP Sales (Phase 1 addition, surfaced by Sales function fill)

Additional personas get added as the spine fills. Common roles worth their own page: VP Marketing, CFO, Head of Data, Head of CS, Head of Product, CRO, COO.

## Buying-committee list

- [`buying-committees/mid-market-sales-assisted.md`](buying-committees/mid-market-sales-assisted.md), mid-market sales-assisted committee (Phase 0)
- [`buying-committees/enterprise-direct.md`](buying-committees/enterprise-direct.md), enterprise direct committee (Phase 1 addition)

Add more as you encounter distinct committee configurations. Open slots:

- `smb-plg.md`, self-serve plus ICs
- `multi-entity.md`, same buyer spanning multiple business units with shared procurement

## Ownership

- **Owner**: Sales lead (primary accountability, since sales has the closest buyer contact).
- **Co-authors**: Marketing lead (persona research), CS lead (post-close expansion buyer).
- **Consumers**: Marketing, Sales, CS, Product.

## What's sourced where

- **Persona pains.** From discovery call transcripts (Gong, Fathom), marketing research, and lost-deal postmortems.
- **Committee decision flows.** From closed-won retrospectives and Gong call patterns.
- **Authority signals.** From actual signed-deal roles, not assumed roles.

Every claim is cited. Stale persona content is one of the most common drift patterns, so re-verify quarterly.

## Related

- [`../icp/`](../icp/), which personas are primary in which tier
- [`../pricing/`](../pricing/), pricing routes to persona authority
- [`../positioning/`](../positioning/), positioning variants by persona
