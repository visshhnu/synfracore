# Python Foundations for AI — Portfolio Projects

## Project 1: Streaming CLI chat tool (Beginner)

A command-line tool that maintains conversation history (a list of dicts, per Fundamentals), sends it to a model, and streams the response back token by token instead of waiting for the full reply.

**What this demonstrates:** you can wire together prompt construction, an actual API call, conversation state management, and streaming output — the real end-to-end loop, not an isolated snippet. **What to show:** the code, plus a short recording or GIF of it actually streaming — static screenshots don't demonstrate streaming behavior.

## Project 2: "Chat with your documents" RAG tool (Intermediate)

Take a small set of your own text files (notes, articles, anything), generate embeddings for each, and build a query interface using the cosine-similarity retrieval function from Intermediate — return the most relevant chunks for a user's question, then feed them to a model as context for the actual answer.

**What this demonstrates:** you understand RAG as a mechanism, not just as a framework you imported — building the retrieval step yourself (even without a real vector database) shows you know what LangChain/LlamaIndex are actually doing underneath. **What to show:** the embedding + retrieval code specifically, not just "I used library X" — a reviewer wants to see you understand the mechanism.

## Project 3: A genuinely useful tool-using agent (Intermediate/Advanced)

Build the agent loop from Advanced with at least one real, executable tool — not a toy example. Good candidates: a tool that queries a real API (weather, a public dataset), a calculator for actual math the model shouldn't be doing via next-token prediction, or a file-search tool over a local directory.

**What this demonstrates:** you understand the model-calls-tool-gets-result-continues loop mechanically, including the max-iteration safeguard and structured tool-result formatting. **What to show:** a transcript of a multi-step interaction where the agent actually used the tool more than once, plus your handling of what happens if the tool call fails.

## Project 4: Evaluation harness for a prompt you've built (Advanced)

Take a prompt from an earlier project and build a small evaluation set (10-20 hand-written test cases with expected properties, not exact-match strings) plus the `run_eval`-style scoring function from Advanced. Then deliberately try two different versions of the prompt and show the eval score difference.

**What this demonstrates:** most people iterate on prompts by eyeballing a few outputs; showing you can measure prompt quality programmatically is a genuine differentiator, and it's the actual practice real AI engineering teams use before shipping a prompt change. **What to show:** both prompt versions, the eval cases, and the before/after scores — the comparison is the point, not either prompt in isolation.

## Project 5: Production-hardened version of any earlier project (Advanced)

Take Project 1, 2, or 3 and add: timeouts, retry with exponential backoff, structured logging of every request (prompt, response, token count, latency), and a defined fallback behavior for API failures.

**What this demonstrates:** the gap between "I can build an AI feature" and "I can ship one that survives real usage" is almost entirely in this hardening layer — most portfolios skip it, so having it explicitly is a real signal. **What to show:** a before/after comparison of the same project, and specifically call out in your README what happens when the API is down or rate-limited — walk through it concretely, don't just claim "it's handled."
