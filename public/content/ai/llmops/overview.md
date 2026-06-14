# LLMOps — Overview

## What is LLMOps?

LLMOps (Large Language Model Operations) is the discipline of deploying, monitoring, evaluating, and maintaining LLM-based applications in production. It extends MLOps practices to the unique challenges of generative AI.

## Why LLMOps Matters

Building an LLM prototype is easy. Running it reliably in production is hard:
- **Quality degrades** — prompts that worked in testing fail in production edge cases
- **Costs spiral** — an unoptimized prompt can cost 10x more than necessary
- **Latency varies** — users abandon if responses take > 5 seconds
- **Hallucinations surface** — incorrect answers erode user trust
- **Models deprecate** — providers retire models, forcing migration

## LLMOps vs MLOps

| Concern | MLOps | LLMOps |
|---|---|---|
| Training | Retrain models on new data | Fine-tune (rare) or prompt-tune |
| Evaluation | Accuracy, F1, AUC | Faithfulness, relevance, coherence |
| Versioning | Model weights | Prompts, chains, retrieval config |
| Monitoring | Prediction drift | Output quality, token costs, latency |
| Infrastructure | GPU clusters | API rate limits, context windows |

## The LLMOps Stack

```
Input → Guardrails → LLM API → Output Evaluation → Response
          ↓                           ↓
       Prompt Registry          Observability (LangSmith, Helicone)
          ↓                           ↓
       Experiment Tracking       Cost Tracking
```

**Key tools:**
- **LangSmith** — prompt versioning, tracing, evaluation (LangChain)
- **Helicone** — observability proxy, caching, cost tracking
- **Weave** (Weights & Biases) — experiment tracking for LLMs
- **Promptfoo** — prompt testing and evaluation framework
- **Humanloop** — prompt management and A/B testing

## Getting Started

1. Start with the **AI Fundamentals** and **Prompt Engineering** sections
2. Build a working LLM app (see AI Agents or RAG sections)
3. Learn evaluation frameworks — RAGAS for RAG, custom evals for chatbots
4. Study cost optimization — model selection, caching, prompt compression
5. Set up observability — trace every LLM call in production

## Course Sections
- **Fundamentals** — evaluation metrics, cost management, prompt versioning
- **Intermediate** — observability setup, A/B testing prompts, caching
- **Advanced** — fine-tuning decisions, production architecture, CI/CD for prompts
- **Labs** — build an evaluation pipeline with Claude API
