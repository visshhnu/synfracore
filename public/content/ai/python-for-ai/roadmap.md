# Python Foundations for AI — Learning Roadmap

## Stage 1 — Python basics, if you don't already have them (1-2 weeks)

If you can already write a function, use a dict, and read a `for` loop comfortably, skip this stage entirely — it's not this page's job to re-teach general Python, and re-doing basics you already know wastes time you should spend on the AI-specific parts below.

## Stage 2 — This page's core (1 week)

Work through Overview → Fundamentals → Intermediate in order, actually typing the code, not just reading it. Specifically get comfortable with: JSON parsing, list-of-dicts manipulation for conversation history, and the cosine-similarity NumPy snippet — these three show up in almost everything downstream.

## Stage 3 — Make your first real API call (2-3 days)

Get an API key (Anthropic or OpenAI), install the SDK, and make one real call from your own code — not copy-pasted from a tutorial without understanding it. Deliberately trigger a rate-limit or auth error once, so the error-handling patterns in Fundamentals stop being abstract.

## Stage 4 — Build something small end-to-end (1 week)

A genuinely useful first project: a command-line tool that takes a question, calls a model, and prints a streamed response (see Intermediate's streaming section). Small scope, but it forces you to actually wire together prompt construction, an API call, and output handling — the full loop, not an isolated snippet.

## Stage 5 — RAG basics (1-2 weeks)

Build the simple retrieval function from Intermediate (`find_most_similar`) against a small set of your own documents — even 10-20 text files is enough to learn the pattern. This is the actual mechanical foundation under every "chat with your documents" product you've seen.

## Stage 6 — Agents and production concerns (2+ weeks, ongoing)

Build a simple tool-using agent loop (see Advanced) with at least one real tool (a calculator function, a web search call — something genuinely executable, not a fake placeholder). Then go back and add the production-hardening items from Advanced's checklist to something you've already built — timeouts, retries, structured logging. This is where "I can write AI code" becomes "I can ship AI code that survives contact with real usage."

## What "done" looks like at each level

- **Can follow AI tutorials without getting lost**: comfortable with JSON, dicts, basic error handling — Stage 2 complete.
- **Can build a working AI feature**: has made real API calls, handled errors, built something small end-to-end — Stage 4 complete.
- **Can build production AI systems**: has implemented RAG retrieval and an agent loop from scratch (not just called a framework's built-in version), understands async for concurrent calls, and has actually added cost/logging/fallback handling to real code — Stage 6 complete.
