---
type: objection
title: "\"We can build this internally\""
description: Common objection from RevOps and engineering-leadership buyers. Underlying concern is usually opportunity cost, not capability.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
last_reviewed: 2026-04-20
verified_until: 2026-07-20
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
confidence: medium
---

# "We can build this internally"

Worked objection page for the "build vs. buy" pushback that surfaces frequently in mid-market and enterprise deals. The surface objection is about capability; the underlying concern is almost always opportunity cost and career risk, and the tested response names that directly [source: sources/internal-docs/README.md].

---

## The objection in the buyer's words

> "We've looked at this space. Our engineering team could build something like this in-house. Why should we buy rather than build?"

Or the softer variant:

> "This doesn't look that complex. Our data team has thought about building this kind of system themselves."

## When it surfaces

- **Persona(s)**: Head of RevOps, VP Engineering, Head of Data, occasionally CFO ([`../../../shared/personas/personas/head-of-revops.md`](../../../shared/personas/personas/head-of-revops.md)).
- **Deal stage(s)**: Discovery and demo most often; occasionally reappears in evaluation as a pre-commitment challenge.
- **Frequency**: Heard in a material share of mid-market and enterprise first-calls where the buyer has in-house engineering capacity; patterns show up in win-loss analysis [source: sources/internal-docs/README.md].
- **Upstream cause**: Either a genuine prior consideration of an in-house build, a posture-setting move in negotiation, or a legitimate concern about dependency on a new vendor.

## What it actually means

Three underlying concerns, almost always one of them:

1. **Opportunity cost framed as cost justification.** The buyer isn't actually planning to build; they are testing whether our price is worth the displaced engineering capacity.
2. **Career-risk management.** The buyer has been burned by a vendor before. "We could build it" is a way of saying "I don't want to be the person who picked a vendor that didn't work out."
3. **Genuine build-vs-buy assessment.** The buyer is actually considering an internal build. Rarer in mid-market; more common in enterprise where engineering capacity is abundant.

The tested response handles all three. Treating every instance as (3) and arguing capability-vs-capability misses the concern in (1) and (2), which are the more common cases.

## Tested response

Three beats. Acknowledge → reframe as opportunity cost → offer a concrete de-risking next step.

1. **Acknowledge the question is legitimate.** "That's a fair question. A real engineering team can definitely build something that works. The question I'd be asking myself in your seat is whether building this is the best use of engineering time, given everything else on their roadmap."

2. **Reframe around opportunity cost and the hidden maintenance curve.** "Teams we've worked with who considered building say the same thing: the first version is feasible; the second year — patches, edge cases, integrations as the stack changes — is where the real cost lives. Your engineering team's time is expensive. The question isn't 'can we build it' but 'what's the roadmap you'd deprioritize to maintain it.'"

3. **Offer a concrete next step that de-risks.** Depending on which underlying concern is most present:
   - For opportunity cost (1): "Would it be useful to see what our TCO looks like over two years compared to the engineering-capacity cost you're imagining? I can put that together."
   - For career risk (2): "It might be worth talking to [a peer customer who had the same question and ended up buying]. They can tell you the story of how they thought about this."
   - For genuine build (3): "If build is a real option, the best way to test it is to run a scoped evaluation against what we'd deliver. You'll know within 30-60 days whether our shape matches your requirements; if it doesn't, the build decision is clearer."

## What NOT to say

- **Don't** list features and claim the in-house team couldn't replicate them. This insults the buyer's team, and reps who try this lose deals in demo [source: sources/internal-docs/README.md].
- **Don't** dismiss the build option ("nobody actually builds this themselves"). The buyer will disengage; they have to feel taken seriously.
- **Don't** respond with a pure cost comparison ("we're cheaper than one FTE"). The buyer hasn't actually priced their engineering time and a cost argument without acknowledging the broader decision framing lands flat.
- **Don't** attack internal builds generically. The buyer may have built something before that worked. Generic attacks cost trust.

## Follow-up artifacts

- **TCO comparison model** — a one-page side-by-side covering 2-3 year horizon with engineering-capacity cost, maintenance cost, opportunity cost, and our pricing. Customized per deal; template lives in sales enablement.
- **Peer-customer intro** — a warm intro to a customer who considered building and didn't. Pulled via [`../plays/referral-ask.md`](../plays/referral-ask.md).
- **Scoped evaluation proposal** — if build is a real option, the evaluation playbook ([`../playbooks/evaluation.md`](../playbooks/evaluation.md)) scope doc becomes the artifact.

## Segment / motion variants

### Mid-market variant  {segment: mid-market}

- Most common underlying concern is (1) — opportunity cost framed as cost justification.
- Engineering team is typically small; the "we can build it" claim is real in the sense that the team could, but almost never has bandwidth.
- TCO comparison is the most effective artifact.
- The full response sequence in a single 5-minute exchange is typical.

### Enterprise variant  {segment: enterprise}

- Concerns (2) and (3) more common — career risk and genuine build evaluation.
- Engineering team has capacity; the build option is more real. Do not dismiss it.
- Peer-customer references from comparable-size enterprise accounts are the highest-leverage artifact.
- Response unfolds across multiple conversations, not a single exchange. Scoped evaluation is often the de-risk step that decides the deal.

## Related

- [`../../../shared/personas/personas/head-of-revops.md`](../../../shared/personas/personas/head-of-revops.md) — canonical persona who most often raises this objection
- [`../../../shared/positioning/`](../../../shared/positioning/) — value-prop framing used in the reframe beat
- [`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md) — patterns show which underlying concern dominated in past deals
- [`../plays/referral-ask.md`](../plays/referral-ask.md) — where peer references are sourced
- [`../playbooks/discovery.md`](../playbooks/discovery.md), [`demo.md`](../playbooks/demo.md) — stages the objection most often fires in

## Change log

- 2026-04-20 — Phase 1 worked example.
