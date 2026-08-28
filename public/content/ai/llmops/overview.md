# LLMOps Overview

**Before you start:** basic familiarity with calling an LLM API and the RAG/fine-tuning concepts from LLM Engineering is assumed — this page is about operating those systems in production, not building them from scratch. General DevOps/monitoring background helps but isn't required.

## What is LLMOps?

LLMOps (Large Language Model Operations) is the practice of deploying, monitoring, managing, and improving LLM-based applications in production. It extends MLOps principles to the unique challenges of foundation models: prompt engineering, evaluation, safety, cost management, and continuous improvement from feedback.

## Why This Exists (The Hook)

A traditional ML model, once trained and deployed, behaves predictably — the same input reliably produces the same output, and "is it working" is a matter of checking known metrics. An LLM in production is a different kind of system to operate: the same prompt can produce different outputs run to run, a small prompt change can silently break behavior that worked yesterday, and "quality" itself has to be measured with judgment calls (is this answer good?) rather than a simple accuracy number. LLMOps exists because operating a system like that — reliably, at scale, without the cost or hallucination rate quietly exploding — needs its own dedicated practice.

**Analogy** — Traditional MLOps is like maintaining a factory machine: once calibrated and tested, it does the same mechanical operation every time, and monitoring means watching for wear and drift from that fixed baseline. LLMOps is like managing a large team of skilled-but-unpredictable freelance writers: you can't just calibrate them once — you have to keep giving them clear briefs (prompts), spot-check their output for quality (evaluation), watch what each one costs you (cost tracking), and have a process for when one of them makes something up with total confidence (hallucination guardrails).

**Try it (2 minutes)** — Reason through why "version models" isn't enough for LLMOps, the way it was for MLOps: if a production RAG chatbot suddenly starts giving wrong answers, and nothing about the underlying foundation model changed, what else could have changed that a traditional ML monitoring setup wouldn't catch — the prompt template? The vector database's indexed documents? The chunking strategy? This is exactly why LLMOps versions prompts, RAG data, and evaluations separately, not just the model.

## LLMOps vs MLOps

```conceptgrid
{
  "boxes": [
    { "title": "Training / Prompting", "description": "MLOps trains on task data. LLMOps prompt-engineers a foundation model", "color": "blue" },
    { "title": "Evaluation", "description": "MLOps uses metrics. LLMOps uses LLM-as-judge + human review", "color": "purple" },
    { "title": "Improvement", "description": "MLOps retrains on new data. LLMOps fine-tunes or augments with RAG", "color": "amber" },
    { "title": "Monitoring", "description": "MLOps monitors predictions. LLMOps monitors hallucinations, toxicity, latency, cost", "color": "green" }
  ]
}
```

## Core LLMOps Components

```conceptgrid
{
  "boxes": [
    { "title": "Prompt Management", "description": "Versioning in Git, A/B testing, template + few-shot management", "color": "blue" },
    { "title": "Evaluation", "description": "Automated (RAGAS, LLM-as-judge) + human feedback loops", "color": "purple" },
    { "title": "Observability", "description": "Tracing every call, monitoring latency/cost/error rates", "color": "amber" },
    { "title": "Guardrails", "description": "Input: PII/injection detection. Output: hallucination/toxicity checks", "color": "red" }
  ]
}
```

```
1. PROMPT MANAGEMENT:
   Versioning prompts in Git (or Langfuse, PromptLayer, etc.)
   A/B testing different prompt versions
   Prompt templates with variable injection
   System prompt + few-shot examples management

2. EVALUATION:
   Automated: G-Eval, RAGAS (RAG-specific), LLM-as-judge
   Human: feedback loops, annotation pipelines (Label Studio, Argilla)
   Metrics: faithfulness, answer relevancy, context recall, toxicity
   Regression testing: does new prompt/model break previous test cases?

3. OBSERVABILITY:
   Tracing: LangSmith, Langfuse, Helicone, Phoenix (Arize)
   Log: every LLM call (prompt, response, tokens, latency, cost)
   Monitor: error rates, latency p50/p95/p99, token usage, cost
   Alerts: spike in cost, latency degradation, error rate increase

4. RETRIEVAL AUGMENTED GENERATION (RAG):
   Vector database: Qdrant, Chroma, Weaviate, Pinecone, pgvector
   Embedding model: text-embedding-3-small, Nomic-embed, E5-large
   Chunking strategy: fixed-size, semantic, recursive character
   Retrieval: dense (semantic), sparse (BM25), or hybrid
   Evaluation: RAGAS metrics (faithfulness, relevance, recall)

5. FINE-TUNING:
   When: domain-specific language, format compliance, few-shot insufficient
   Methods: full fine-tuning, LoRA/QLoRA (parameter-efficient)
   Tools: Unsloth, Axolotl, LLaMA Factory, Hugging Face TRL
   Data: high quality > quantity; 100-1000 examples minimum

6. GUARDRAILS:
   Input: detect PII, prompt injection, off-topic requests
   Output: detect hallucinations, toxicity, PII leakage, formatting errors
   Tools: NeMo Guardrails, Guardrails AI, custom classifiers
```

## LLMOps Stack

```
ORCHESTRATION:     LangChain, LlamaIndex, Haystack, CrewAI
TRACING:           LangSmith, Langfuse, Helicone, W&B Weave
VECTOR STORES:     Qdrant, Pinecone, Weaviate, Chroma, pgvector
MODELS:            OpenAI GPT-4o, Anthropic Claude, Gemini, Llama3 (self-hosted)
INFERENCE:         vLLM, TGI (Hugging Face), Ollama (local), Bedrock, Vertex AI
EVALUATION:        RAGAS, DeepEval, Promptfoo, LangSmith evals
EXPERIMENT TRACK:  MLflow, Weights & Biases, CometML
DEPLOYMENT:        FastAPI + Docker + Kubernetes (or Cloud Run, Lambda)
```

## Study Resources
- **LLMOps course** (Deeplearning.ai) — free short courses on LLMOps
- **LangSmith documentation** — tracing and evaluation for LangChain apps
- **Langfuse documentation** — open-source LLM observability platform
- **RAGAS documentation** (docs.ragas.io) — RAG evaluation framework
- **Building LLM Powered Applications** (Valentina Alto) — practical book
