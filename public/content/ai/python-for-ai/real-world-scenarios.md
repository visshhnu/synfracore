# Python Foundations for AI — Common Failure Patterns

Unlike some other Real World pages on this site, which cite specific, dated, publicly-documented incidents (the DevOps academy's, for example), the three patterns below are **composite and illustrative** — synthesized from failure modes that recur across AI-engineering work, not write-ups of a specific, named, citable incident. Treat them as "this class of mistake is common and worth designing against," not as a documented case study of one particular company or event.

## The uncapped agent loop that burns real budget

A common failure pattern in tool-using agent code: a loop with no hard iteration cap gets into a cycle where the model keeps calling a tool, getting a result it interprets as insufficient, and calling the same or a related tool again — sometimes because the tool's output format wasn't quite what the model expected, sometimes because the underlying task genuinely didn't have a clean stopping condition the prompt accounted for. Without an iteration limit, this doesn't crash — it just keeps running, each iteration a real, paid API call, until someone notices the cost or the process is manually killed.

**Lesson:** the `max_iterations` cap covered in this page's Advanced section isn't defensive boilerplate — it's the difference between "an agent that occasionally needs a retry" and "an agent that can silently consume unbounded budget." Treat it as a required safeguard from the first version, not something to add after a bill surprises you.

## The silent embedding failure that quietly degrades search quality

A plausible, common failure shape in RAG systems: an embedding call that occasionally fails (a transient API error) gets caught, and the calling code substitutes a zero-vector placeholder instead of raising or logging the failure clearly — the intent is graceful degradation, but the actual effect is a growing fraction of documents with degenerate, zero-filled embeddings that match nothing meaningfully in cosine-similarity search (see Troubleshooting's note on `nan` results being a symptom of exactly this). The degradation is gradual and non-obvious — no single dramatic failure, just steadily worse results — until someone audits the embedding store directly.

**Lesson:** "handle the error gracefully" needs to mean something more specific than "don't crash" — a silent fallback that produces plausible-looking but functionally broken data (a zero vector that's still a valid-shaped array) can be worse than a loud failure, because it doesn't get noticed until someone specifically goes looking for it.

## The exact-match evaluation that hides a real prompt regression

A common measurement mistake: a team iterating on a prompt uses a simple exact-match evaluation harness — checking whether the model's output exactly matches a reference answer string. A prompt change that's genuinely an improvement (better reasoning, more accurate answers, just phrased slightly differently than the reference strings) can score *worse* on this evaluation than the old prompt, because exact-match penalizes correct-but-differently-worded answers as failures — risking a team reverting a real improvement based on a flawed measurement, unless someone manually reviews a sample of the "failing" cases and notices most are actually correct.

**Lesson:** this page's Interview Q&A section covers the exact-match-vs-structural-check distinction as an interview question for a reason — it's not an academic point, it's a mistake that's easy to make when reaching for the simplest possible evaluation method without considering whether it actually measures what you think it measures.
