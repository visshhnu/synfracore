# Python Foundations for AI — Prerequisites

You don't need a CS degree or prior ML exposure for this page specifically — that's the point of it existing. But skipping the following will make everything downstream (RAG, LangChain, embeddings) feel like magic instead of mechanics.

## Actually required

- **Absolute Python basics** — variables, `if`/`else`, `for` loops, and how to run a `.py` file. If you've never written a line of Python, do a genuine "Python in a weekend" crash course first — this page assumes that layer exists, it doesn't teach it.
- **Comfort reading, not writing, JSON** — you don't need to memorize JSON syntax, but you need to not be intimidated by nested `{}`/`[]` when an API response prints one to your terminal. Every LLM API speaks JSON; this page's own "Working With JSON" section is where that comfort gets built if you don't have it yet.
- **A working Python install and a way to run code** — VS Code with the Python extension, or a Jupyter notebook (via Google Colab if you don't want to install anything locally) both work fine. Don't get stuck picking the "best" editor before writing your first line.

## Not required, despite what a lot of "learn AI" content implies

- **Linear algebra / calculus** — you don't need to derive gradient descent to build with AI APIs and embeddings. The NumPy section on this page teaches exactly the one operation (cosine similarity) that matters practically, without a math prerequisite chapter first.
- **A machine learning background** — "Python for AI" here means Python skills for *using and building with* AI systems (APIs, embeddings, RAG, agents), not for training models from scratch. If your actual goal is ML research/model training, that's a different, deeper track — this page is the applied-engineering on-ramp, not that.
- **Any specific AI SDK experience** — Anthropic's SDK, OpenAI's SDK, LangChain — they all follow patterns this page's Object-Oriented Basics section covers generically; you'll pick up SDK-specific syntax fast once the underlying pattern (client objects, message history as a list of dicts) isn't new to you.
