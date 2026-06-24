# LLMOps Overview

## What is LLMOps?

LLMOps (Large Language Model Operations) is the practice of deploying, monitoring, managing, and improving LLM-based applications in production. It extends MLOps principles to the unique challenges of foundation models: prompt engineering, evaluation, safety, cost management, and continuous improvement from feedback.

## LLMOps vs MLOps

```
TRADITIONAL MLOPS:               LLMOPS:
  Train model on task data    →  Prompt-engineer a foundation model
  Evaluate with metrics       →  Evaluate with LLM-as-judge + human review
  Retrain on new data         →  Fine-tune or RAG augmentation
  Deploy model endpoint       →  Deploy app + model + vector store
  Monitor predictions         →  Monitor for hallucinations, toxicity, latency, cost
  Version models              →  Version prompts, models, RAG data, evaluations
```

## Core LLMOps Components

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
