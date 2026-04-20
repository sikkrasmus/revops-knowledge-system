---
type: function-readme
title: Sales objections
description: Objection library — one page per common objection with persona, stage, frequency, tested response, and traps to avoid.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
last_reviewed: 2026-04-20
verified_until: 2026-10-20
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - marketing
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Sales objections

The objection library. One page per common objection. Each page answers: which persona raises it, at which deal stage, how often, why the buyer actually says it, what response has tested well, and what response has lost deals. An objection library is one of the cheapest enablement investments in a sales function and one of the most frequently skipped [source: sources/internal-docs/README.md].

---

## What an objection page is for

- **In-the-moment reference.** A rep hearing a familiar objection can consult the page to get language that's been pressure-tested rather than improvising.
- **Enablement.** New reps learn the objection landscape by reading the library.
- **Pattern signal.** When a new objection starts showing up across reps, it surfaces here first — Marketing and Product pick it up as signal of a positioning or roadmap gap.

## What an objection page is not

- **Not a script.** The tested response is the shape of the answer, not a verbatim line. Reps adapt to the room.
- **Not a rebuttal list.** Objections are signals about underlying concerns. A page that rebuts without naming the underlying concern is surface-level and wears out fast.
- **Not a place to store one-off rep insights.** A one-rep observation is a rep note, not an objection page. An objection page needs evidence across deals.

## Structure

Every objection page uses the template in [`../../../schema/page-templates/sales/objection.md`](../../../schema/page-templates/sales/objection.md). Sections are:

1. The objection in the buyer's words (paraphrased or verbatim)
2. When it surfaces (persona, stage, frequency)
3. What it actually means (the underlying concern)
4. Tested response (a structured sequence)
5. What NOT to say (sourced)
6. Segment / motion variants
7. Follow-up artifacts
8. Related
9. Change log

## Authoring rules

- **Cite persona source.** Every objection page links to the canonical persona(s) that raise it under [`../../../shared/personas/`](../../../shared/personas/).
- **Frequency claim is sourced.** "Heard in ~40% of mid-market discovery calls" requires a citation — a closed-deal analysis, a call-recording sample, or win-loss patterns data.
- **Tested-response section is structured, not a paragraph.** Responses have a 2-3 beat structure (acknowledge → reframe → next step). Paragraph responses don't transfer across reps.
- **"What NOT to say" is specific and sourced.** Vague cautions don't help. "Don't respond with X because it lost 3 of the last 5 deals that started this way" is useful.
- **Motion and segment variants where they differ.** Same objection from a mid-market Head of RevOps ≠ same objection from an enterprise CFO.

## Phase 1 content

- [`we-built-this-internally.md`](we-built-this-internally.md) — one worked objection page against a common mid-market and enterprise scenario. Intended as a reference shape.

## Related

- [`../../../shared/personas/`](../../../shared/personas/) — personas that raise objections
- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — where competitive objections also live
- [`../../../schema/page-templates/sales/objection.md`](../../../schema/page-templates/sales/objection.md) — template for new pages
- [`../battlecards/`](../battlecards/) — competitive counter-positioning (overlaps for competition-triggered objections)
- [`../playbooks/`](../playbooks/) — the stages at which objections surface

## Change log

- 2026-04-20 — Phase 1 scaffold. One worked objection example included as a reference shape.
