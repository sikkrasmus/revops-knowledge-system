# Honest comparison

Where this framework fits alongside adjacent categories. The point isn't "we're better" — the categories overlap unevenly. A sales team running in production probably uses three or four of these together. Understanding what each does well tells you which to adopt, which to replace, and which are orthogonal.

---

## Enterprise search (Glean, Elastic, Coveo, Algolia)

**What they do well**: index many systems, unified search across them, great UX for end users.

**Where they struggle**: they surface existing content, they don't maintain it. If your Confluence has a stale ICP definition, Glean faithfully surfaces the stale version — it doesn't know it's stale.

**How they compose**: this framework can sit alongside. A Company Index corpus in git is searchable by Glean if you want a unified surface — Glean points at the repo, indexes the pages, delivers them via their UX. The maintenance layer is this framework; the universal-search UX is Glean.

## Sales enablement platforms (Highspot, Seismic, Guru)

**What they do well**: content distribution to reps, playbook rollouts, analytics on what reps use.

**Where they struggle**: they're consumption surfaces without a maintenance layer behind them. When the battlecard goes stale, someone has to notice and update it. The platforms don't have opinions about where content comes from or how to keep it current.

**How they compose**: publish content from this framework into Highspot/Seismic/Guru for the rep-facing UX. The corpus is the source of truth; the platform is the delivery channel. Maintenance is pulled upstream.

## Knowledge base tools (Notion AI, Confluence, Guru)

**What they do well**: collaborative writing, comments, versions, WYSIWYG.

**Where they struggle**: not git-tracked, no typed schemas, no automated lint, no PR-review workflow. They're wikis, not intelligence layers. Every one of them has been used and abandoned by RevOps teams at least once.

**How they compose**: not well. The authoring ergonomics of Notion/Confluence are better for some teams; the maintenance discipline of git + markdown + CI is superior for intelligence-layer use cases. Pick one, don't try to bridge them in production.

## Karpathy's LLM Wiki

**What it's great for**: the foundational pattern — markdown in git, `CLAUDE.md` + `index.md` + `log.md`, LLM maintains, humans review. This framework builds directly on it. Credit where due: [the original gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) is required reading.

**Where it stops**: it's a general pattern, not a domain-specific implementation. For RevOps, you need the shared spine, the function model, motion/segment tags, the graduated-trust governance, the drift-detection spec, the CLI. This framework adds those.

**How they compose**: this is a specialization. If you're building a knowledge base for a different domain (engineering, research, compliance), the Karpathy pattern is the starting point; build your own domain-specific schema on top.

## Sales agents (11x, Artisan, Clay, Default)

**What they do**: agents that run outbound, enrichment, qualification.

**Where they struggle**: they infer context from whatever the organization gives them. When the ICP document is stale and the persona page is missing, the agent hallucinates. [50-70% churn in 3 months](https://prospeo.io/s/ai-sdrs).

**How they compose**: they read from this framework. A Company Index corpus IS the "structured context" the agent needs. Agents that can be pointed at a repo + schema + CLI get materially better output. Agents that demand their own proprietary context model are the ones that rot under production conditions.

## Deal desk / quote-to-cash (Salesforce CPQ, HubSpot Breeze, DealHub, Nue.io)

**What they do**: quote generation, approval workflows, configure-price-quote logic.

**Where they struggle**: pricing policy lives in the tool's configuration — not accessible as a reviewable artifact. When pricing changes, it's a config change; when the policy document in Confluence drifts from the config, no one notices.

**How they compose**: this framework captures pricing policy as a reviewable artifact in [`../shared/pricing/`](../shared/pricing/). The CPQ tool's configuration should match; drift between the two surfaces as `has_contradiction` in the lint pass. The CPQ is the enforcement; this framework is the canonical definition.

## CRM-native AI (Salesforce Agentforce, HubSpot Breeze)

**What they do**: AI features on top of the CRM — summarization, next-step suggestions, outbound drafts.

**Where they struggle**: same substrate problem as external agents. The CRM has records, but the context those records lack (ICP patterns, persona mental models, win-loss patterns) isn't in the CRM. AI features on top of records without context produce generic output.

**How they compose**: CRM-native AI reads from this framework for context. Or: the CRM stays the system of record for transactional data (deals, activities, contacts), and this framework is the reasoning layer.

## Data/analytics layer (dbt, Hightouch, Metabase)

**What they do**: canonical data models (dbt), reverse-ETL (Hightouch), analytics dashboards (Metabase, Looker).

**Where they struggle**: they're about *data* — not about the mental models, policies, playbooks, and patterns that operators need. A metric definition in dbt is different from a metric definition in `shared/data-definitions/` — the dbt definition is the calculation; our definition is the decision-framework around the metric.

**How they compose**: explicitly complementary. dbt owns the data model; this framework owns the narrative and policy around the data. RevOps teams often want both. Our [`../shared/data-definitions/`](../shared/data-definitions/) directory should cite the dbt model as a source.

## Custom-built internal wikis

**What they do**: a team builds their own. Usually starts as an internal Notion or a hand-rolled Jekyll/Docusaurus repo.

**Where they struggle**: the maintenance economics don't work. A custom wiki at $10M ARR is usually unmaintained by $20M ARR. Or it gets rebuilt every 18 months when the new VP arrives.

**How they compose**: fork this framework. The structure, schema, and CLI are already built. Customize the shared spine to your org's specifics. Fill the functions as you go.

---

## Quick-decide table

| If you need... | Use |
|---|---|
| A canonical, LLM-maintainable knowledge layer across GTM/RevOps | This framework |
| Universal search across systems | Glean / Elastic + this framework as a searchable corpus |
| Content delivery to reps | Highspot / Guru, publishing from this framework |
| Collaborative writing for a non-engineering team | Start with Notion; move to this framework when you hit the 100-page threshold where rot begins |
| Sales agents that don't hallucinate | This framework + point an existing agent at it |
| Quote-to-cash enforcement | CPQ tool + this framework as the pricing policy canonical |
| Data modeling | dbt + this framework for the narrative/policy layer |

## What this framework is not

- A CRM replacement.
- A CMS replacement for customer-facing content.
- A replacement for data modeling.
- A tool-in-a-box — it's a framework you fork, adapt, and run.

## Related

- [`01-WHY.md`](01-WHY.md) — the failure modes this is designed against
- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md) — three layers + navigation trio
- [`03-IMPLEMENTATION.md`](03-IMPLEMENTATION.md) — the 4 hard parts of running in production
- [`../PILOT.md`](../PILOT.md) — paid implementation
