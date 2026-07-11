# Python Foundations for AI — Key Takeaways

- **This is applied-engineering Python, not general Python or ML/data-science Python** — the goal is building *with* AI systems (APIs, RAG, agents), not training models. Know which track you're actually on; they diverge more than the shared keywords suggest.
- **JSON fluency is the single most load-bearing skill here** — every LLM API speaks JSON for both requests and responses; comfort parsing and constructing it underlies almost everything else on this page.
- **Cosine similarity between vectors is the mathematical core of embeddings, semantic search, and RAG** — one formula, genuinely worth understanding directly in NumPy rather than treating it as a vector-database black box.
- **API calls fail in production — code that doesn't handle rate limits, timeouts, and malformed responses isn't production code**, no matter how correct its happy path is.
- **Streaming is a generator pattern, not an AI-specific trick** — it matters for human-facing text output specifically; structured output you're parsing programmatically usually needs the complete response instead.
- **`asyncio` helps because API calls are I/O-bound, not because Python gets true CPU parallelism from it** — concurrent calls wait on the network together instead of sequentially, which is the actual source of the speedup.
- **An agent is a loop with a hard iteration cap** — model calls tool, gets result, continues, until a final answer or the cap is hit. The cap isn't optional safety theater; an uncapped loop burns real API cost.
- **Evaluate prompts with structural/semantic checks, not exact-match** — LLM output varies in phrasing even when correct, so a scoring function that checks for the right property (not the exact string) is what real evaluation looks like.
- **Track token usage and cost from the first version of a feature**, not after a surprise bill — retrofitting visibility is much harder than having it from the start.
- **A working portfolio matters more than a certification for this specific skill area** — there's no dominant standardized "Python for AI" credential; what gets evaluated is real, working code.
