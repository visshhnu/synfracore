# AI/ML Interview Q&A

**Q: What is the difference between ML, DL, and LLMs?**
ML: algorithms that learn patterns from data (regression, trees, SVM). DL: ML using neural networks (CNNs, RNNs). LLMs: very large transformer-based DL models trained on text (GPT-4, Claude, Gemini). LLMs are a subset of DL.

**Q: What is RAG?**
Retrieval-Augmented Generation: combine LLM with a knowledge base. Query → retrieve relevant docs from vector DB → pass to LLM as context → LLM generates grounded answer. Avoids hallucination, enables real-time knowledge.

**Q: What is prompt engineering?**
Crafting inputs to LLMs to get desired outputs. Techniques: few-shot (examples), chain-of-thought (step by step), system prompts, output format specification, role assignment.
