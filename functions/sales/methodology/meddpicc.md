---
type: methodology
title: MEDDPICC — canonical sales methodology
description: The canonical methodology. Eight letters every qualified deal must fill in, with motion and segment adaptations.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - revops-lead
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
  - revops
  - cs
  - marketing
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# MEDDPICC — canonical sales methodology

MEDDPICC is the diagnostic framework every deal is inspected against in this function. It does not script a conversation; it names the eight pieces of information that must stabilize before a deal is forecastable, and it makes the Champion and Paper Process — the two most common failure modes in mid-market and enterprise B2B SaaS — impossible to skip [source: sources/internal-docs/README.md].

The methodology replaces MEDDIC, BANT, and pure SPICED for this function. MEDDIC is lighter but under-weights Paper Process and Competition, both of which cause late-stage slip in enterprise deals. BANT anchors on budget first, which misses the truth that budget is usually created, not found [source: sources/internal-docs/README.md]. SPICED is a discovery lens and pairs with MEDDPICC rather than replacing it — SPICED structures the first call; MEDDPICC structures the deal.

---

## The eight letters

### M — Metrics

The quantified business outcome the buyer will attribute to the purchase. Not features, not deliverables — the number on the buyer's slide six months after go-live.

**Filled in looks like:** A specific metric, a current baseline, a target value, a deadline, and a named owner who will be graded on the delta. "Reduce time-to-quote from 9 days to under 3 days by end of Q3, owned by the Head of RevOps" is filled in. "Improve efficiency" is not.

**Typical failure mode.** The AE accepts the buyer's first framing ("we need better reporting") without converting it to a number. Six months into the deal the economic buyer asks "what business outcome is this solving?" and the room goes quiet.

**How to probe.**

- "If this project is successful 12 months from now, which metric on your board slide changed?"
- "What's the current baseline — what does that metric read today?"
- "What would a successful outcome look like — the specific number?"
- "Who gets promoted when it hits? Who gets fired if it doesn't?"

**Source-of-truth for the metric language.** Use the shared definitions so Sales, Marketing, CS, and Finance are speaking the same number. See [`../../../shared/data-definitions/`](../../../shared/data-definitions/).

### E — Economic buyer

The single person who can unilaterally say yes or no to the purchase at the contemplated ACV, with discretionary budget authority that covers the deal or with authority to create the budget.

**Filled in looks like:** First name, last name, title, direct evidence of budget authority, a documented 1:1 with the AE or the AE's exec, and a stated perspective on the project in their own words.

**Typical failure mode.** The champion insists the economic buyer doesn't need to be involved until the final meeting. This is nearly always wrong. Deals where the AE does not meet the economic buyer before proposal stage close at under half the rate of deals where they do [source: sources/internal-docs/README.md].

**How to probe.**

- "Walk me through how a purchase of this size gets approved in your org."
- "Who signs? Who funds it? What's the last comparable purchase — same signers?"
- "When's the right time for me to meet them, and what do they need to see?"

**Committee context.** Economic-buyer identity varies by segment and motion — see [`../../../shared/personas/buying-committees/`](../../../shared/personas/buying-committees/) for the canonical committee shapes.

### D — Decision criteria

The written or unwritten list of attributes the buyer will evaluate options against. Ideally sourced directly from the buyer, not assumed by the AE.

**Filled in looks like:** A prioritized list of 4-8 criteria, confirmed in writing (email recap is sufficient), with at least one criterion you influenced into the list. If every criterion on the list was already the buyer's when you walked in, you are selling into a comparison, not shaping it.

**Typical failure mode.** The AE never gets the criteria in writing, runs the evaluation on what they assume matters, and loses on a criterion they didn't know mattered (integration with a specific system, a compliance posture, a reference in a specific vertical).

**How to probe.**

- "What has to be true for us to be the right answer?"
- "If a peer vendor showed up tomorrow with X, would that change things?"
- "Which of these criteria are must-haves and which are nice-to-haves?"

### D — Decision process

The step-by-step sequence the organization uses to move from evaluation to signature. Includes who approves at each step, what artifacts each step requires, and the sequence of internal meetings.

**Filled in looks like:** A written timeline with named stages (technical review, security review, procurement kickoff, legal, signature), named owners per stage, and realistic durations from prior comparable purchases at the account.

**Typical failure mode.** The deal hits "legal review" 10 days before quarter-end and the AE discovers the org's standard legal cycle is 4-6 weeks. This is not a legal problem; it is a decision-process problem that should have been uncovered in discovery.

**How to probe.**

- "Walk me through the last time your org bought a piece of software in this size range — what happened between signature and kickoff?"
- "Who does security review and what's their typical turnaround?"
- "Is there a procurement office and what do they need from us?"

### P — Paper process

The mechanical contract path: redlines, MSA or order-form preference, signing authority, procurement requirements, and the specific pricing structure the organization can actually pay for.

**Filled in looks like:** Named legal contact, known MSA position (existing template, willing to use ours, prefer theirs), understood procurement requirements (vendor onboarding, diversity requirements, certificates of insurance), and confirmed payment terms that match the proposal.

**Typical failure mode.** AE quotes a 3-year multi-year deal with upfront annual payment. Procurement reveals in week 8 that the org only pays quarterly in arrears and the CFO will not approve upfront. The deal slips one or two quarters — or dies on a detail that was knowable in week 2.

**How to probe.**

- "When we get to paper, who on your side will redline the MSA?"
- "What are your standard payment terms — are we going to have to negotiate that?"
- "Do you use a procurement platform? Is there a vendor onboarding step?"

**Source-of-truth for what we can offer.** See [`../../../shared/pricing/`](../../../shared/pricing/). If a buyer's constraint breaks the canonical structure, deal-desk escalation applies — see [`../frameworks/`](../frameworks/).

### I — Identify pain

The documented, quantified, and owned operational problem the purchase solves. Distinct from Metrics: Metrics is the measurable outcome; Identify Pain is the present-tense problem whose continuation is unacceptable.

**Filled in looks like:** A concrete description of the current state (who is doing what today, how long it takes, what it costs), a named owner who is personally affected, and evidence that the pain has already triggered an internal review or escalation.

**Typical failure mode.** The buyer describes pain in the abstract ("our quoting is slow"), the AE accepts it, and the buyer is not actually uncomfortable enough to change. "Your product is a nice-to-have" is the outcome. Quantified pain beats unquantified pain by a factor that shows up in close rates [source: sources/internal-docs/README.md].

**How to probe.**

- "Walk me through a day in the life of a rep / CSM / analyst dealing with this today."
- "When did this first become a problem? Who escalated it first?"
- "What's the cost of doing nothing for another two quarters?"

### C — Champion

The person inside the account who sells for you when you are not in the room. Per MEDDPICC the champion has three traits: power/influence, track record for change, and personal motivation. The champion profile template covers this in full — see [`../../../schema/page-templates/sales/champion-profile.md`](../../../schema/page-templates/sales/champion-profile.md).

**Filled in looks like:** A named person who has (a) defended the purchase in a meeting you were not in, (b) shared an internal doc they were not obligated to share, (c) pulled another stakeholder into a call without being asked, and (d) can name the person most likely to block the deal plus what that person cares about.

**Typical failure mode.** The AE confuses an enthusiastic user or a helpful coach for a champion. Coaches share information; champions spend political capital. Without a real champion, the deal stalls at economic-buyer stage because no one inside the account is pushing it up the list of priorities [source: sources/internal-docs/README.md].

**How to probe.**

- "Who besides you will I need to convince here? How do I earn that meeting?"
- "What's the last big internal change you drove? How did that go?"
- "If this doesn't happen, what does your quarter look like?"

**Test it.** Ask the champion to do something small but slightly inconvenient — introduce a peer, set up a review meeting, share an internal doc. Champions do it. Coaches don't.

### C — Competition

Explicit awareness of what you are being compared against — incumbent tooling, internal build, a named competitor, or do-nothing. Every deal has a competitor; "no competition" is a qualification gap.

**Filled in looks like:** A named alternative (vendor, system, or "do nothing"), an understanding of where the alternative is stronger, and a counter-position the champion can carry into rooms you are not in.

**Typical failure mode.** The AE assumes the deal is uncompetitive, skips counter-positioning in the proposal, and loses on a quiet comparison the buyer never raised explicitly. "We decided to stay with what we have" is almost always a competitive loss the AE did not know they were in.

**How to probe.**

- "What else are you looking at, formally or informally?"
- "If we weren't an option, what's plan B?"
- "What would make you pick the incumbent / build / other vendor?"

**Source-of-truth.** See [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) for the canonical competitor profiles. Deal-level battlecards in [`../battlecards/`](../battlecards/) draw from there.

---

## Motion and segment variants

The letters don't change by motion or segment; the weight and mechanics of filling them in do.

### Sales-assisted mid-market variant  {motion: sales-assisted, segment: mid-market}

- Cycle: 30-90 days typical. All eight letters should be filled by end of evaluation stage; gaps after proposal stage are red flags.
- **Economic buyer** is typically a VP or department head with discretionary budget up to $75K-$150K ACV.
- **Paper process** is lighter — often a one-page order form against an existing MSA; procurement involvement is limited.
- **Champion** is usually a single operator (Head of RevOps, VP Sales, CS lead). Multi-champion dynamics are rare.
- **Decision process** is compressed: 1-2 approval layers above the champion.
- The common slip in this segment is **Metrics** — mid-market buyers describe outcomes qualitatively unless pushed. Failing to force a number early predicts a stall at proposal [source: sources/internal-docs/README.md].

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Cycle: 4-9 months typical. Letter completeness is staged: Metrics, Identify pain, Champion by end of discovery; Economic buyer, Decision criteria, Decision process by end of evaluation; Paper process and Competition continuous.
- **Economic buyer** is typically a C-level or SVP with stated budget ownership; sometimes a sponsor committee rather than a single person.
- **Paper process** dominates the back half of the cycle — MSA negotiation, security review (SOC 2, data residency, SSO, audit log), procurement vendor onboarding, legal redlines. 30-60 days is typical for paper alone [source: sources/internal-docs/README.md].
- **Champion** dynamics are multi-layered: the operational champion gets you through evaluation; an executive sponsor gets you through signature.
- **Decision process** involves 4-7 approval layers; map them explicitly.
- **Competition** is nearly always multi-vendor formal RFP or RFI, even when the buyer claims otherwise.

### Notes on cross-motion handoff

When an account moves from PLG or self-serve into sales-assisted motion (a PLG lead expands into a larger committee-bought renewal), MEDDPICC is applied fresh at the moment sales is re-engaged. Usage signals from the PLG motion inform Metrics and Identify pain but do not substitute for the other six letters.

---

## Using MEDDPICC in pipeline inspection

### The weekly pipeline review

Every opportunity past qualification stage has a MEDDPICC score. Score is the count of letters with concrete evidence (not assumed content). A deal with score <5 does not belong in the commit forecast regardless of reported stage.

| Score | Forecast category |
|---|---|
| 7-8 | Commit — forecast at 70%+ close probability in current quarter |
| 5-6 | Best case — forecast at 35-55% |
| 3-4 | Pipeline — no current-quarter forecast |
| 0-2 | Early — active discovery; not yet forecastable |

The exact percentages come from [`../frameworks/`](../frameworks/); the MEDDPICC-to-forecast mapping is the input, not the output.

### The deal inspection script

Managers inspect deals by walking the letters in sequence and asking the AE for evidence on each:

1. Show me the metric on a buyer-written artifact.
2. Show me the Economic buyer's title and the last contact.
3. Show me the decision criteria in a buyer email or doc.
4. Show me the decision process with named stages and owners.
5. Show me the Paper process — MSA position, payment terms, procurement path.
6. Show me Identify pain — a current-state description owned by a named person.
7. Show me the Champion — what have they done for you that a non-champion wouldn't?
8. Show me Competition — named alternatives and counter-position.

An AE cannot "narrate" a letter. Each letter is backed by an artifact (email, call recording, deal-room doc, CRM note citing a source). No artifact, no letter.

---

## Anti-patterns

- **Narrating instead of filling.** Listing MEDDPICC answers from memory without pointing at an artifact. Every letter is backed by a source; "the champion told me" is not a source unless it's in a call recording or email.
- **Front-loading Paper process.** Asking about contracts and payment terms on the first call makes the buyer defensive. Paper process is probed in evaluation stage, not discovery.
- **Treating MEDDPICC as a script.** It's a diagnostic. The discovery playbook ([`../playbooks/`](../playbooks/)) carries the actual question sequence; MEDDPICC names what those questions must surface.
- **Ignoring letters that don't apply "at this stage."** Every letter is in scope from discovery on; what changes is the depth of evidence. A deal with no working Competition entry in discovery is mis-qualified, not early.
- **Champion = user.** A user loves the product. A champion risks political capital for it. The test is in the champion profile template.

---

## How this methodology integrates with the corpus

- **Inputs.** Shared personas ([`../../../shared/personas/`](../../../shared/personas/)), shared ICP ([`../../../shared/icp/`](../../../shared/icp/)), data definitions ([`../../../shared/data-definitions/`](../../../shared/data-definitions/)), pricing reality ([`../../../shared/pricing/`](../../../shared/pricing/)).
- **Upstream qualification.** The qualification framework ([`../frameworks/`](../frameworks/)) decides whether an account merits MEDDPICC effort; MEDDPICC doesn't apply to accounts that fail tier fit.
- **Playbook hooks.** Each deal-stage playbook in [`../playbooks/`](../playbooks/) declares which letters it primarily fills and which it refines.
- **Forecast.** MEDDPICC completeness feeds [`../frameworks/`](../frameworks/) directly.
- **Postmortems.** Every closed-lost or no-decision postmortem maps the outcome to at least one under-filled letter, per [`../../../schema/page-templates/sales/postmortem.md`](../../../schema/page-templates/sales/postmortem.md).

---

## Related

- [`../playbooks/`](../playbooks/) — stage-specific plays that fill and refine MEDDPICC letters
- [`../frameworks/`](../frameworks/) — upstream fit gating
- [`../frameworks/`](../frameworks/) — consumes MEDDPICC completeness
- [`../../../shared/personas/`](../../../shared/personas/) — Economic buyer + Champion anchors
- [`../../../shared/icp/`](../../../shared/icp/) — fit signals that upstream MEDDPICC applicability
- [`../../../shared/pricing/`](../../../shared/pricing/) — Paper process inputs
- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — Competition source-of-truth
- [`../../../shared/data-definitions/`](../../../shared/data-definitions/) — Metrics language

## Change log

- 2026-04-20 — Phase 1 initial page. MEDDPICC canonical with sales-assisted mid-market and enterprise variants.
