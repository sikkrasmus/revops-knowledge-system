# Agents In Action

The Company Index framework is only as valuable as what plugs into it. Here's what three different AI agents do with a Company Index — and what they do without one.

The scenarios below are queryable today. Point any LLM (Claude, GPT, Gemini) at the [`examples/seed-wiki/`](../examples/seed-wiki/) directory and reproduce them yourself.

---

## Why this matters

The dirty secret of the AI GTM agent boom: [50-70% of teams buying AI SDRs churn within 3 months](https://prospeo.io/s/ai-sdrs) — 10x typical SaaS churn rates. The post-mortems are remarkably consistent across products:

> *"Despite providing detailed ICP information and brand guidelines, the output reads like generic AI-generated email."* — [11x Alice review, marketbetter.ai](https://marketbetter.ai/blog/11x-ai-review-2026/)

> *"Hallucination is significant since they don't train their agent... sometimes giving information that isn't theirs."* — [Agentforce G2 review, oliv.ai](https://www.oliv.ai/blog/salesforce-agentforce-reviews-analyzed)

> *"Breeze performance is content-driven: if the knowledge base is thin, outdated, or inconsistent, you'll see that immediately in escalations and unanswered questions."* — [eesel.ai HubSpot Breeze review](https://www.eesel.ai/blog/hubspot-breeze-ai-review)

The agents aren't broken. The substrate they're plugged into is unstructured, undated, untyped, and uncross-referenced. They re-derive context from scratch every query — and confidently fill the gaps with hallucination.

A Company Index is what closes those gaps.

---

## Scenario 1 — AI SDR drafting outbound

**Context**: Acme Robotics ($25M ARR SaaS, mid-market manufacturing vertical, two product lines: Floor Optimizer and Quality Sentinel) deploys an AI SDR. The agent receives a new lead: VP Operations at MetalCraft Industries, a 600-person mid-market metal fabricator. Job is to draft a first-touch outbound email.

### Without a Company Index

The agent has access to: the lead's LinkedIn profile, MetalCraft's website, basic firmographics, and a generic "brand voice" prompt the team copy-pasted from a Notion doc 8 months ago.

```
Subject: Helping MetalCraft scale operations

Hi [First Name],

I noticed MetalCraft is a leader in metal fabrication and you're focused on
operations. At Acme Robotics, we help companies like yours optimize their
manufacturing operations and improve quality control.

Would you be open to a quick 15-minute conversation to explore how Acme can
help MetalCraft drive operational efficiency?

Best,
[Agent]
```

Generic. Off-brand. No specific differentiation. Mentions the wrong product mix for this segment. Does not reference the actual buyer's pain (operations VPs at fabricators care about throughput consistency under labor variability — not "operational efficiency"). The kind of email that gets archived in 4 seconds.

### With a Company Index

The agent queries the index:

```
For an outbound to a VP Operations at a mid-market metal fabricator,
what's our active ICP, the proven pain narrative, the right product
positioning, and the most-tested first-touch angle?
```

The index returns:

- **ICP page**: "Mid-Market Manufacturing" — verified 2026-03-12, expires 2026-06-12. SPICED structure: Critical Event = "labor variability spike or compliance audit." Decision Criteria = "throughput per shift, defect rate per 10K units."
- **Pricing Pattern page**: "Per-line + per-quality-event" — the right unit economics framing for this segment.
- **Champion Profile page**: VP Operations — Power signal: "owns the floor budget, reports to COO, has been in role 18+ months." Personal motivation: "wants to ship the throughput win in time for board review."
- **Postmortem page**: Last 3 wins in this segment — all opened with the throughput-consistency angle, not efficiency.
- **Battlecard page**: Two competitors active in this segment (FactoryAI, ShopTrack) — both stronger on optimization, weaker on quality integration. Trap-setting: ask about defect-rate visibility.

The agent drafts:

```
Subject: Throughput consistency at MetalCraft — last 3 fabricators saw
14-22% lift

Hi [First Name],

Quick note. The last three mid-market fabricators we worked with — Argon
Steel, Brennan Metals, and a Texas-based shop — were all hitting their
throughput targets in good shifts but losing 14-22% to variability across
weeks. The pattern: defect-rate visibility was lagging the floor by 3-5
days, so corrections happened after the bad batch shipped.

Acme's Quality Sentinel closes that gap to under 4 hours. Floor Optimizer
sequences around it.

I noticed MetalCraft just hired four floor leads in Q1. If you're seeing
similar variability swings, worth 15 minutes? I can walk through the
Brennan rollout — they got their next board update in 6 weeks.

[Agent]

— Sources cited internally: ICP page §3, Postmortem pages PM-2026-01,
PM-2026-02, PM-2026-04
```

Specific. On-brand. Cites the right product mix. Anchored on the actual buyer pain (variability, not "efficiency"). References real proof points without naming customers publicly. Trap-setting embedded.

**The difference is not a better agent. It's the substrate the agent is reading from.**

---

## Scenario 2 — Deal desk responding to a 25% discount ask

**Context**: A mid-market deal at Acme is in late-stage. The buyer's procurement team comes back asking for 25% off list. Standard discount guidance is "up to 10% AE-approved, up to 18% deal-desk-approved, anything above requires CFO sign-off." The AE escalates.

### Without a Company Index

The deal desk lead reads the email, opens 4 Slack channels, asks the CFO for guidance, pulls 3 prior deals from Salesforce manually, drafts a response. Round trip: 2 days. The AE meanwhile loses momentum with the buyer.

The CFO's instinct, based on memory: "We've never gone above 18% in mid-market." Wrong — last quarter we closed 4 deals in this exact segment at 22-24% with strategic-account justifications. But that pattern lives in nobody's head.

### With a Company Index

The AE pings the deal desk agent. The agent queries:

```
Buyer is asking 25% off list. Segment is mid-market manufacturing,
ACV $145K, 3-year term, multi-product (Floor Optimizer + Quality
Sentinel). What does the discount pattern in this segment look like
over the last 12 months, and what did the closed deals at >18%
discount have in common?
```

The index returns:

- **Pricing Pattern page**: "Mid-Market Manufacturing — Multi-Product" — Discount guardrails: max 18% standard. **Strategic exception band: 19-25% when (a) 3-year term, (b) multi-product, (c) reference-customer commitment, (d) net new logo in target vertical.**
- **Postmortem pages**: 4 closed deals in this segment at >18% discount in Q4 2025 / Q1 2026. All four had the strategic exception conditions. Average ACV: $138K. All four converted to expansion within 9 months.
- **Champion Profile page**: VP Operations buyer — typical pushback when held at 18%: "renewal risk if we underperform." Mitigated in 3 of 4 strategic-exception deals by adding a 6-month performance review checkpoint.
- **Conflict flag**: Standard guideline says max 18%; closed-deal evidence shows 22-24% is the working pattern with clear conditions. The Conflict Resolution log shows the deal desk lead validated this pattern in March 2026 — the guideline page is stale.

The agent drafts a response in 30 seconds for the deal desk lead's approval:

```
Approve up to 22% IF buyer commits to:
1. 3-year term (currently 1-year — push for 3)
2. Reference-customer call in their network within 60 days of close
3. 6-month performance review checkpoint clause

Otherwise hold at 18%, walk if needed. Last 4 strategic-exception deals
in this segment at 22-24% all expanded within 9 months — pattern is real.

Auto-flagged: pricing guideline page (PP-mfg-mm-multi.md) needs update.
Last verified 2025-09-14. Should I open a PR to refresh the guardrail
language?
```

The deal desk lead approves. The AE responds to the buyer in 45 minutes with a structured counter. The deal closes at 21% the following week.

**Two days collapsed to 45 minutes. The CFO's stale instinct overridden by the actual evidence. And the index flags its own staleness.**

---

## Scenario 3 — New-hire AE asking a discovery question

**Context**: Mike, a new AE at Acme, is preparing for a discovery call with a fintech lead. He knows SOC 2 will come up. He doesn't know how Acme handles it for mid-market fintechs (a segment he hasn't sold into yet).

### Without a Company Index

Mike posts in #sales-help: *"How do we handle SOC 2 questions from mid-market fintechs?"*

Three reps reply within 4 hours with three different versions. Two of the answers are 8 months stale. One is correct but lacks the "what to say next" follow-up. Mike pieces together a generic answer, sends it on the call, and the prospect's CISO sees through it.

[Forrester: 65% of sales reps can't find the right content; reps spend 440 hours/year searching.](https://www.spekit.com/blog/sales-enablement-statistics-trends)

### With a Company Index

Mike queries the index:

```
How do we handle SOC 2 objections from mid-market fintech buyers?
What's the tested response, and what comes next in the conversation?
```

The index returns:

- **Objection page**: "SOC 2 — fintech mid-market" — verified 2026-03-28. Tested response (4 sentences). What NOT to say (overpromising on Type 2 audit timing). Reframe question to ask back ("what's your audit cadence?").
- **Postmortem pages**: 3 most recent fintech deals where SOC 2 surfaced — 2 won, 1 lost. Lost one: pushed too hard on certification timing without acknowledging the buyer's audit window. Won ones: led with the SOC 2 evidence vault, not the certificate.
- **Battlecard page**: Top 2 competitors in fintech segment — one (Vextrix) leads with their SOC 2 cert in every deal; counter-positioning included.
- **Pricing Pattern page**: Fintech mid-market deals close 8% below other segments on average — security review costs are real and worth pricing in.

Mike reads it in 4 minutes. Goes into the call with a tested response, a follow-up question, and an awareness that the lost deal in this segment failed by pushing too hard. He handles the objection on the call. The prospect's CISO actually respects the answer.

**4 hours of Slack archaeology collapsed to 4 minutes. The new-hire ramp problem starts to dissolve.**

(Average SaaS sales ramp is now 5.7 months in 2025 — [up 32% from 4.3 months in 2020](https://salesso.com/blog/sales-ramp-up-statistics-2025-benchmarks-best-practices/), despite the entire AI tooling boom. The unfindable-knowledge tax is the largest single contributor.)

---

## Three more scenarios, briefer

The full walkthroughs for these live in [`examples/agent-scenarios/`](../examples/agent-scenarios/):

### CSM preparing for a QBR with an at-risk account
The CSM agent queries: which postmortems and champion profiles are most relevant; which expansion patterns the segment historically follows; which objection patterns surface in renewal conversations. Output: a QBR prep doc with cited risk indicators and 3 expansion plays — not a generic template.

### Forecasting agent assessing pipeline-stage confidence
The forecast agent traverses: which deals match closed-won patterns from postmortems; which deals show conflict signals (e.g., champion profile says "VP Engineering" but the active contact is a director); which segment-level pricing patterns are diverging from current guidance. Output: confidence-weighted forecast with deal-level reasoning, not a CRM-stage-multiplier guess.

### RFP response drafting
The RFP agent queries: ICP and Battlecard for the buyer's segment; the most differentiated pricing pattern; the postmortems where similar RFPs were won/lost. Output: an RFP draft that leads with proven differentiation per question — not a generic capabilities dump.

---

## What changes when the substrate is real

Three things, every time:

1. **Output stops being generic.** Agents reference specific postmortems, named pricing patterns, the right product mix per segment.
2. **Hallucinations become detectable.** When the agent has a typed schema and dated sources, it can refuse, hedge, or escalate instead of confidently making things up. The index knows what it doesn't know.
3. **Cycle times collapse on the queries that matter.** Discount approvals in 45 minutes instead of 2 days. Discovery prep in 4 minutes instead of 4 hours. Forecast confidence in seconds instead of a Friday afternoon.

This is what "foundation before agents" means in practice. The agents you're already evaluating — 11x, Artisan, Clay, Default, Agentforce, Breeze — get materially better when they read from a Company Index. Without it, you're paying for confidently-wrong output at scale.

---

## Try it yourself

Every scenario above is reproducible against the seed wiki in this repo. Point any LLM at [`examples/seed-wiki/`](../examples/seed-wiki/), paste the queries from the scenario files, and compare what you get against the without-Index baseline.

If you want this running on your real source data instead of synthetic Acme Robotics, the [pilot](../PILOT.md) is how you skip the 3-month learning curve.
