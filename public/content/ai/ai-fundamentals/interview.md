# AI Fundamentals Interview Questions

## How LLMs Work

**Q: Explain how Large Language Models work.**

LLMs are transformer neural networks trained to predict the next token. Components:
- **Tokenizer**: Text -> token IDs (~100K vocab for GPT-4)
- **Embeddings**: Token IDs -> dense vectors
- **Transformer blocks**: Self-attention + feed-forward layers (stacked)
- **Output**: Softmax -> next token probability distribution

Inference is autoregressive: generate one token, append to input, repeat.

**Self-attention intuition:**
Each token creates Query (Q), Key (K), Value (V) vectors. Attention score = Q*K^T / sqrt(d). Softmax -> weights -> weighted sum of V. Allows "bank" to mean financial or geographical based on surrounding context.

---

**Q: Key parameters — temperature, top-p, context window.**

**Temperature (0-2):** Controls randomness.
- 0 = deterministic (factual tasks) | 1 = balanced | 2 = creative

**Top-p (0-1):** Only consider tokens comprising top p% of probability mass.
- 0.9 = more focused | 0.95 = more diverse

**Context window:** Max tokens (input + output). GPT-4o = 128K (~95K words). Claude 3 = 200K.

---

**Q: What is RAG and why use it?**

RAG (Retrieval Augmented Generation) grounds LLM answers in retrieved documents.

Solves:
1. Knowledge cutoff: retrieve from updated docs
2. Hallucination: anchor to retrieved context ("answer only from provided context")
3. Private data: embed company docs locally

Pipeline: Query -> embed -> vector DB similarity search -> top-k chunks -> LLM + context -> answer

---

**Q: Fine-tuning vs prompting vs RAG — when to use each?**

| Approach | Use When | Cost |
|---|---|---|
| Prompting | Behaviour achievable in system prompt | Free |
| RAG | New/changing facts, private data | Low (vector DB) |
| Fine-tuning | Consistent format, domain tone, reduce prompt size | High (GPU) |

Always try prompting first, then RAG, then fine-tuning as a last resort.

## Revision Notes
```
LLM: Transformer trained to predict next token (autoregressive)
Self-attention: Q*K^T/sqrt(d) -> weights -> weighted sum of V
Captures context: same word, different meaning based on surrounding tokens

PARAMETERS:
Temperature: 0=deterministic, 1=balanced, 2=creative
Top-p: nucleus sampling (consider top p% probability tokens)
Context window: total tokens in/out (GPT-4o=128K)

RAG: vector DB retrieval + LLM generation
Solves: cutoff, hallucination, private data
Pipeline: query -> embed -> search -> chunks -> LLM

DECISION ORDER:
1. Prompting (free) -> 2. RAG (cheap) -> 3. Fine-tuning (expensive)
```
