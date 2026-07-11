# Python Foundations for AI FAQ

**Q: Do I need to learn `pandas` and `scikit-learn` for this track, or is that a different path?**
A: Different path, mostly. `pandas`/`scikit-learn` are core to data science/ML model-building; this page is about Python for building applications *with* existing AI models (APIs, RAG, agents), which leans on `numpy`, `json`, `asyncio`, and SDK client patterns instead. You'll likely touch `pandas` eventually if you're processing larger datasets for RAG ingestion, but it's not a prerequisite for anything on this page.

**Q: I know Python but have never used an LLM API — where do I actually start?**
A: Skip straight to this page's Overview and Fundamentals — general Python competence is exactly the prerequisite assumed here, and re-doing basics you already have wastes time. Get an API key, make one real call, then work through the JSON and conversation-history patterns; that's the actual on-ramp specific to this track.

**Q: Is LangChain/LlamaIndex worth learning, or should I build things from scratch first?**
A: Build the core mechanisms yourself first — a simple retrieval function, a basic agent loop (both covered in Intermediate/Advanced) — before reaching for a framework that does it for you. This isn't purism: understanding what a RAG framework is doing underneath makes you dramatically more effective at debugging it when it doesn't behave as expected, which happens often enough that the underlying understanding pays for itself quickly.

**Q: How much math do I actually need, honestly?**
A: For the applied-engineering track this page covers: very little beyond the cosine-similarity formula itself, which you can use correctly without deriving it. If you find yourself wanting to understand *why* embeddings work the way they do at a deeper level, or you're moving toward model training/fine-tuning rather than just using existing models, that's when linear algebra and calculus start mattering — not before.

**Q: Should I use synchronous or async code for my first AI project?**
A: Synchronous, for your first project specifically — get the core logic (prompt construction, API call, response handling) working and correct first, then add `asyncio` once you have a genuine reason to (multiple independent calls you want to run concurrently). Adding async complexity before you need it makes debugging your first working version harder for no real benefit yet.

**Q: My model calls work fine in a notebook but fail when I put them in a script/production code — why?**
A: Usually environment differences, not a Python-vs-notebook issue per se: a notebook often has an API key set in its kernel's environment (loaded once, persisted across cells) that a fresh script execution doesn't have unless you explicitly load it (via `os.environ` or a `.env` file loader). Second most common cause: notebooks are forgiving about re-running cells out of order, which can hide state-dependency bugs (a variable defined in an earlier cell that a script, run top-to-bottom once, never had set) that only surface once the code runs as a real, linear script.

**Q: Do I need a GPU for anything covered on this page?**
A: No — everything here calls a hosted model API (Anthropic, OpenAI, etc.) over the network; the actual model inference happens on the provider's infrastructure, not your machine. You'd need a GPU if you were running models locally or training/fine-tuning your own, which is outside this page's applied-API-engineering scope.
