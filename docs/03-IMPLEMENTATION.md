# Where this gets hard

Teams that fork this framework and run it in production spend three to six months working through eight specific problems. The framework points at each one and tells you what we have already thought through. The work that is left is yours.

This doc has two parts. First, a suggested rollout plan that sequences the work into four phases. Second, the eight hard parts that trip teams up at each phase, with what fails and what works.

---

## Suggested rollout

Four phases. Each one is a meaningful unit of value on its own. Do not start a later phase before the previous one is stable in practice.

### Phase 0, the shared spine (weeks 1 to 4)

Stand up the framework itself. Schema, navigation trio, CLI, governance rules, and the seven shared components ([`../shared/`](../shared/)) with at least one templated page each. Sources scaffolds and the abstract connector pattern. CI green on `ci verify --all` and `ci reindex --check`.

Success criteria. The corpus has structure even if it is mostly templates. Agents can read `index.md` and locate pages. Reviewers know what a valid page looks like.

### Phase 1, one filled function (weeks 4 to 10)

Pick the function with the densest downstream demand. Sales is the default because it references every shared component (ICP, pricing, personas, positioning, competitive intel) and because audience demand for sales content is highest in most orgs.

Fill methodology, deal-stage playbooks, decision frameworks, plays, and at least one battlecard and one objection. Use the function as a forcing function for shared-spine gaps. Most teams discover their pricing or positioning is unclear only when sales tries to cite it.

Success criteria. The function is usable end to end by a real AE for a real call. Every page cites a shared component. `ci graph` shows dense cross-references.

### Phase 2, remaining functions (months 3 to 6)

Generalize the pattern across marketing, customer success, support, RevOps, and finance/legal. Sequence by reuse: marketing first (shares positioning, competitive intel, ICP heavily), then CS (shares ICP, personas, pricing for expansion), then RevOps (owns data-definitions), then finance/legal (authored-shared: pricing, contracts, compliance posture), then support.

You can stop at two or three functions if the org's GTM motion does not need the rest. Adopting the shared spine plus one or two functions is a valid endpoint.

### Phase 3, advanced ingestion and maintenance (months 6+)

Reduce the human-in-the-loop burden once the corpus and the review pipeline have a stable track record. Wire automated staleness detection beyond `verified_until`, cross-corpus consistency checks, conversation-harvest from session transcripts, and Stage 2 to Stage 3 auto-merge enforcement.

Phase 3 unlocks only when Stage 2 governance is wired in practice, not just on paper. Most teams spend longer here than they expect because the trust calibration work in problem 7 below is judgment, not automation.

### What is never in scope

- Embeddings or a vector DB. Better structure (sub-indexes, function-level indexes) is the answer if scale demands better retrieval.
- A CMS or database-backed storage. The corpus is markdown in git.
- Multi-tenant SaaS hosting. This framework is self-hosted.
- Hard gates on which functions you adopt. Adopt the shared spine only, or only sales, or only RevOps. Each is valid.

---

## The eight hard parts

The hard parts cluster into four groups: plumbing (1 and 2), schema and onboarding (3 and 4), operating the review loop (5, 6, 7), and economics (8).

---

## 1. Source-system plumbing

**The problem.** Connectors against HubSpot, Salesforce, Gong, Fathom, Stripe, Confluence, and Notion are real engineering projects. Each one has to handle auth flows, rate limits, pagination, webhook signatures, and schema drift inside the source system itself. One to two weeks of focused work per connector is realistic if you want it to hold up.

**What fails.** Teams underestimate the work, ship a sloppy v1, then spend months patching edge cases. Or they lean on vendor-built integrations that do not give them the extraction control they need.

**What works.**

- Follow the abstract pattern in [`../ingestion/connectors/PATTERN.md`](../ingestion/connectors/PATTERN.md). Five stages, same for every connector: auth, extract, synthesize, snapshot, PR.
- Start with one high-signal source, usually the call recorder. Get extract and synthesize working end to end. Then add others.
- Use [`../sources/POLICY.md`](../sources/POLICY.md) to decide in-repo vs. out-of-repo before writing the connector, not after.

---

## 2. PII at extraction

**The problem.** Call transcripts and Confluence exports carry personal data, account-identifying detail, and sometimes regulated content (health, financial, compensation). If PII reaches the wiki, you have a leak. If you over-redact, the wiki loses the detail that makes it useful.

**What fails.** The common failure is treating PII as a downstream review problem. Teams synthesize freely, hope reviewers catch leaks at PR time, and quietly accumulate violations because reviewers cannot reliably eyeball every diff. The opposite failure is over-redaction, where the summaries get so bland they lose the named patterns the wiki is supposed to capture.

**What works.**

- Treat PII filtering as load-bearing inside the synthesis prompt itself. The connector does redaction at extraction, not after.
- Use the `pii_status` enum from [`../sources/POLICY.md`](../sources/POLICY.md): `none`, `redacted`, `needs-review`. The third value blocks merge.
- Decide once, in writing, what counts as PII for your business. The list usually covers customer employee names, email addresses, phone numbers, account identifiers that resolve to individuals, compensation data, health information, and anything regulated by GDPR, CCPA, or HIPAA in your jurisdiction.
- Redact to roles and aliases, not full removal. "VP Operations at FabricatorCo" preserves pattern; "[redacted]" does not.
- Plan for revocation. A customer can withdraw consent. Have a runbook for removing a synthesized source file via PR, and for the rarer case where you need to purge git history.

What this framework does not do for you: pick a redaction model, tune its precision, monitor its false-negative rate over time, or carry the legal liability when it misses something. That is yours.

---

## 3. Schema design

**The problem.** The schema (frontmatter, page types, enums, section labels) is the operating agreement between humans and LLMs. Get it wrong and every page is off. Every query surfaces noise. Every ingest pass needs heavy human cleanup.

**What fails.** Teams design from first principles. They over-engineer. They add fields no one fills in. They invent page types for hypothetical future uses. They end up with a 40-page spec that nobody follows.

**What works.**

- Start with the schema in this repo. It is already battle-tested against the seven shared components.
- When adding a page type, constrain it sharply. Required structure. Required frontmatter. Anti-patterns. Document those three before adding the type.
- Keep enums small. [`../schema/enums.yaml`](../schema/enums.yaml) is machine-validated, so adding a value requires a PR. That is a feature.
- Motion and segment are tags, not directories. Parallel directory trees for variants are the most common early mistake, and the most expensive to undo.

---

## 4. Cold-start from an existing wiki

**The problem.** Most teams already have a Confluence, Notion, or Guru graveyard. Hundreds of stale pages, mixed quality, no citations, no schema. The question is what to backfill, what to discard, and how to handle citations for content that has no traceable origin.

**What fails.** One common pattern is to bulk-import the old wiki and try to clean it up in place. The schema violations swamp the team and the project stalls inside the first month. The opposite pattern is to start from a blank repo and rebuild from live sources only. That throws away the institutional knowledge captured in the old wiki and burns trust early.

**What works.**

- Treat the existing wiki as a source, not a starting corpus. Snapshot the relevant pages into `sources/internal-docs/` with `pii_status` review and `as_of:` timestamps.
- Backfill the new corpus from those snapshots through the same LLM-synthesize pipeline that connectors use. The synthesis pass forces structure, citations, and frontmatter.
- Discard aggressively. A 600-page Confluence usually compresses into 60 to 100 typed pages. The discarded content was unread anyway.
- For legacy claims with no traceable source, mark them `confidence: low` and open follow-up issues to reverify or remove. Do not let them silently inherit the credibility of cited content.
- Plan eight to twelve weeks for the backfill of a mid-sized GTM org. Less if the existing wiki is already shallow.

---

## 5. Reviewer fatigue

**The problem.** At Stage 1 (100% PR), every change hits a human. At 50 pages and 3 PRs per week, fine. At 300 pages and 30 PRs per week, reviewers burn out. Quality drops. Diffs get rubber-stamped. Trust erodes.

**What works.**

- **Stage appropriately.** Stage 1 for the first 90 days. Stage 2 once you have pattern confidence. Stage 3 when pattern-matched changes have a clean track record.
- **Funnel by class, not by page.** From Stage 2, auto-merge routine classes (backlinks, cross-references, format fixes). Always-PR classes (ICP, pricing, packaging, legal, positioning) stay gated forever.
- **Rotate review ownership.** Each function has a primary reviewer plus co-reviewers. Primary gets notified first. If the primary does not respond in 24 hours, the next reviewer picks it up.
- **Run post-hoc audits.** Sample auto-merged changes weekly. If quality drops, pull that class back to PR-required.

---

## 6. Conflict-resolution UX

**The problem.** When a new source contradicts an existing page, the system does not auto-resolve. It flags `has_contradiction`, both sources are cited, and a human decides. That human-in-the-loop step is where most operators stall. The reviewer faces two plausible claims and no good interface for adjudicating them.

**What fails.** Reviewers default to the newer source without checking precedence. Or they pick the source that matches their prior belief. Or they merge with both claims still in the page, leaving the contradiction unresolved.

**What works.**

- Apply the precedence rules from [`../schema/authoring-contract.md`](../schema/authoring-contract.md) §2 mechanically. Signed and dated beats recorded conversation. Recorded conversation beats internal written. Internal written beats synthesized. Synthesized beats email or chat. Recency breaks ties within a tier.
- When precedence cannot resolve, route to the page's primary reviewer. Set a 48-hour SLA on contradiction PRs. Stale contradictions rot the corpus faster than missing data.
- Render the diff with both sources side by side in the PR description. Give the reviewer the precedence verdict as a starting point, not a final answer.
- Log the resolution. Future contradictions on related claims should reference past resolutions, so the team is not relitigating the same calls.

What this framework does not do: build the side-by-side diff UI. The PR template gives you the structure. Wiring it into your code review tool is yours.

---

## 7. Trust calibration

**The problem.** When is the LLM right enough to rely on? When do you trust auto-merge? How do you spot corpus rot from under-review?

**What fails.** Teams either over-trust (auto-merge everything, then discover six months later that 30% of pages have subtle errors) or under-trust (gate everything forever, never ship the productivity gain that justifies the project).

**What works.**

- **Start at 100% PR.** Build trust empirically.
- **Track rollback rate per change class.** One reverted backlink update in 90 days is fine. Three reverts means you pull backlinks back to PR-required.
- **Run `ci stale` and `ci log` weekly.** A growing stale list means review is falling behind. Dropping log activity means the LLM is not being invoked enough. Both are signals.
- **Use per-page confidence.** LLM-authored PRs carry `confidence: low / medium / high`. Low always PRs. High on routine classes are auto-merge candidates from Stage 2.

---

## 8. Cost and volume management

**The problem.** Each LLM synthesis pass costs API tokens. Each reviewer hour costs salary. Without a budget and a forecast, the project dies on a finance review somewhere in month four.

**What fails.** Teams ship without a cost model. They get a surprise invoice. Or they panic-cap usage and the wiki freezes mid-build.

**What works.** Budget against the four cost axes: API tokens, reviewer hours, connector engineering, and infrastructure.

A speculative band for a 200-person GTM team operating Stage 1, with one connected source (call recorder) and a corpus of 100 to 200 pages:

| Cost line | Stage 1 (months 0 to 3) | Stage 2 (months 3 to 6) |
|---|---|---|
| Source events ingested | 80 to 150 per week | 80 to 150 per week |
| LLM PRs opened | 15 to 40 per week | 15 to 40 per week |
| Reviewer hours per week | 8 to 15 | 3 to 6 |
| API cost per month | $200 to $800 | $200 to $800 |
| Connector eng (one-time) | 2 to 4 weeks | as needed |

These bands are speculative and meant to set order of magnitude. They will move with model pricing, with how many functions you fill, and with how many connectors you wire. The point is that the math is bounded and visible. Anyone reviewing the project should be able to point at the line item that is growing and say so.

What this framework does not do: track these numbers for you. Pipe your token bills, your reviewer time, and your rollback rate into whatever observability stack you already use. Treat the corpus like any other production system.

---

## Where this fits alongside adjacent tools

These categories overlap unevenly. A team in production usually runs three or four of them together.

| Category | What they do well | What they don't | How this framework relates |
|---|---|---|---|
| **Enterprise search** (Glean, Elastic, Coveo) | Unified search across many systems | Surface content, do not maintain it | Point them at this corpus for universal-search UX. Maintenance stays here. |
| **Sales enablement** (Highspot, Seismic, Guru) | Content distribution, rollouts, analytics | No maintenance layer behind delivery | Publish from this corpus to their UX. Corpus is the source of truth. |
| **Knowledge-base tools** (Notion, Confluence) | Collaborative writing, comments, versions | No git, no typed schemas, no lint, no PR review | Pick one. Do not bridge them in production. |
| **Sales agents** (11x, Artisan, Clay) | Run outbound, enrichment, qualification | Hallucinate when substrate is thin | They read from this corpus. Substrate-first resolves the churn pattern. |
| **CPQ / deal desk** (Salesforce CPQ, DealHub) | Quote generation, approval workflows | Pricing policy lives in tool config, not as a reviewable artifact | This framework is the canonical pricing definition. CPQ is the enforcement. |
| **CRM-native AI** (Agentforce, Breeze) | AI on top of CRM records | Records without context produce generic output | CRM stays system of record. This framework is the reasoning layer. |
| **Data and analytics** (dbt, Hightouch, Metabase) | Data models, reverse ETL, dashboards | About data, not mental models or policies or patterns | Complementary. dbt owns the model. This owns the narrative. Cite dbt as a source. |

---

## What this framework is not

- A CRM replacement.
- A CMS for customer-facing content.
- A data-modeling tool.
- A tool-in-a-box. It is a framework you fork, adapt, and run.

---

## Related

- [`01-WHY.md`](01-WHY.md), the failure modes this framework is designed against.
- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md), the three layers and three operations.
- [`04-AGENTS-IN-ACTION.md`](04-AGENTS-IN-ACTION.md), what agents do on a structured corpus.
