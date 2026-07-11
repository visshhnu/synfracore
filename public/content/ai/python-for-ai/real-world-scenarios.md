# Python Foundations for AI — Real World

## The uncapped agent loop that burned a real budget

A recurring, widely-discussed pattern in early production agent deployments: a tool-using agent loop with no hard iteration cap gets into a cycle where the model keeps calling a tool, getting a result it interprets as insufficient, and calling the same or a related tool again — sometimes because the tool's output format wasn't quite what the model expected, sometimes because the underlying task genuinely didn't have a clean stopping condition the prompt accounted for. Without an iteration limit, this doesn't crash — it just keeps running, each iteration a real, paid API call, until someone notices the bill or the process is manually killed.

**Lesson:** the `max_iterations` cap covered in this page's Advanced section isn't defensive boilerplate — it's the difference between "an agent that occasionally needs a retry" and "an agent that can silently consume unbounded budget." Production agent code treats this as a required safeguard, not an optional nicety, from the first version.

## The silent embedding failure that degraded search quality for weeks

A team building a RAG search feature had an embedding call that occasionally failed (a transient API error) but the calling code caught the exception and substituted a zero-vector placeholder instead of raising or logging the failure clearly — the intent was graceful degradation, but the actual effect was that a growing fraction of documents had degenerate, zero-filled embeddings that matched nothing meaningfully in cosine-similarity search (see Troubleshooting's note on `nan` results being a symptom of exactly this). Search quality degraded gradually and non-obviously — no single dramatic failure, just steadily worse results — until someone audited the embedding store directly and found a meaningful fraction of documents were effectively unsearchable.

**Lesson:** "handle the error gracefully" needs to mean something more specific than "don't crash" — a silent fallback that produces plausible-looking but functionally broken data (a zero vector that's still a valid-shaped array) can be worse than a loud failure, because it doesn't get noticed until someone specifically goes looking for it.

## The exact-match evaluation that hid a real prompt regression

A team iterating on a prompt used a simple exact-match evaluation harness — checking whether the model's output exactly matched a reference answer string. A prompt change that was genuinely an improvement (better reasoning, more accurate answers, just phrased slightly differently than the reference strings) scored *worse* on this evaluation than the old prompt, because exact-match penalized correct-but-differently-worded answers as failures. The team nearly reverted a real improvement based on a flawed measurement, before someone manually reviewed a sample of the "failing" cases and found most were actually correct, just not verbatim matches.

**Lesson:** this page's Interview Q&A section covers the exact-match-vs-structural-check distinction as an interview question for a reason — it's not an academic point, it's a mistake real teams make when they reach for the simplest possible evaluation method without considering whether it actually measures what they think it measures.
