# LLMOps Certification Guide

## Certifications Available

| Cert / Course | Provider | Cost | Level |
|---------------|----------|------|-------|
| **DeepLearning.AI LLMOps** | Coursera | Free | Intermediate |
| **Weights & Biases MLOps Course** | W&B | Free | Intermediate |
| **DataTalks.Club MLOps Zoomcamp** | DataTalks | Free | Intermediate |
| **Google Professional ML Engineer** | Google | $200 | Advanced |
| **AWS Certified ML Specialty** | AWS | $300 | Advanced |

---

## LLMOps Core — Key Components

```python
# HIGH-THROUGHPUT SERVING WITH vLLM
# vLLM uses PagedAttention for efficient memory management
# docker run --gpus all -p 8000:8000 vllm/vllm-openai \
#   --model mistralai/Mistral-7B-Instruct-v0.3

from openai import OpenAI
client = OpenAI(base_url="http://localhost:8000/v1", api_key="token")
response = client.chat.completions.create(
    model="mistralai/Mistral-7B-Instruct-v0.3",
    messages=[{"role": "user", "content": "Hello"}]
)
# vLLM: 24x higher throughput than HuggingFace naive serving

# FINE-TUNING WITH LORA (Low-Rank Adaptation)
from peft import LoraConfig, get_peft_model, TaskType

lora_config = LoraConfig(
    task_type=TaskType.CAUSAL_LM,
    r=16,              # rank: 8-64 typical (lower = fewer params)
    lora_alpha=32,     # scaling: usually 2x rank
    target_modules=["q_proj", "v_proj"],  # which layers to adapt
    lora_dropout=0.05,
)
peft_model = get_peft_model(base_model, lora_config)
peft_model.print_trainable_parameters()
# trainable: 4,194,304 || all: 7B (0.06% trained, 94% frozen)

# RAGAS EVALUATION
from ragas import evaluate
from ragas.metrics import faithfulness, answer_relevancy, context_recall
from datasets import Dataset

eval_data = Dataset.from_dict({
    "question": ["What is LangChain?"],
    "answer": ["LangChain is a framework for LLM applications"],
    "contexts": [["LangChain helps build LLM-powered apps using chains"]],
    "ground_truth": ["LangChain is a framework for building LLM applications"],
})
scores = evaluate(eval_data, metrics=[faithfulness, answer_relevancy, context_recall])
# faithfulness: 0-1, measures hallucination (higher = less hallucination)
# context_recall: 0-1, were the right chunks retrieved?

# LANGSMITH TRACING
import os
os.environ["LANGCHAIN_TRACING_V2"] = "true"
os.environ["LANGCHAIN_API_KEY"] = "ls__xxxx"
# All LangChain chain/agent calls now traced automatically in LangSmith
```

---

## LLMOps vs Traditional MLOps

```
TRADITIONAL MLOPS          LLMOPS ADDITIONS
─────────────────────────────────────────────────────────────────
Model versioning (MLflow)  + Prompt versioning (LangSmith)
Training pipeline          + Fine-tuning pipeline (LoRA/PEFT)
Model registry             + Foundation model selection & eval
Serving (Triton/TorchServe)+ LLM serving (vLLM, TGI, Ollama)
Monitoring (accuracy)      + Hallucination rate, token cost, latency
A/B testing                + Prompt A/B testing
Feature store              + Vector store / RAG knowledge base
Data versioning (DVC)      + RAG document versioning
```

---

## LLMOps Stack Reference

```
SERVING:
  vLLM:         GPU-based, PagedAttention, OpenAI-compatible API
  TGI:          HuggingFace Text Generation Inference, production-grade
  Ollama:       local/edge, runs 7B-70B quantised models on CPU/GPU
  OpenAI/Anthropic: managed API (no infra, pay per token)

FINE-TUNING:
  LoRA:         train 0.1% of params, near full-model quality
  QLoRA:        4-bit quantised base + LoRA = fits in consumer GPU
  PEFT library: Hugging Face library for all parameter-efficient methods
  TRL/SFTTrainer: supervised fine-tuning + DPO/RLHF tooling

EVALUATION:
  RAGAS:        RAG-specific: faithfulness, context recall, answer relevancy
  LLM-as-judge: use strong LLM to score open-ended responses
  Braintrust:   evaluation + tracing platform
  Promptfoo:    CLI-based LLM evaluation framework

MONITORING:
  LangSmith:    tracing + datasets + playground + evaluations
  Langfuse:     open source alternative to LangSmith
  Arize:        ML + LLM observability platform
  Datadog:      LLM Observability (traces, cost, quality metrics)

EXPERIMENTS:
  MLflow:       model versioning, experiment tracking (classic MLOps)
  W&B:          experiment tracking + model registry + sweeps
  Comet:        ML experiment management
```

---

## Production Deployment Checklist

```
SERVING:
  Define SLA: latency (p50/p95/p99) + availability (99.9%)
  Rate limiting per user/tenant
  Token budget enforcement (prevent runaway costs)
  Fallback to smaller model on primary failure

QUALITY GATES:
  Automated eval on golden dataset before every deployment
  Regression test: new prompt/model must not degrade on existing test set
  A/B test: route 5% traffic to new version, compare metrics

MONITORING METRICS:
  TTFT (time to first token) | TBT (time between tokens)
  Cost per 1K tokens per endpoint
  Hallucination rate (track with RAGAS/LLM-judge pipeline)
  User satisfaction (thumbs up/down, follow-up questions)
```

## Revision Notes
```
LLMOPS ADDS TO MLOPS:
  Prompt management | RAG pipelines | Token cost tracking | Hallucination monitoring
  Foundation model selection | LoRA fine-tuning | LLM-as-judge evaluation

FINE-TUNING DECISION:
  Use RAG when: knowledge changes frequently, need citations
  Use fine-tuning when: consistent style/format/persona, domain-specific vocabulary
  Use both: fine-tuned base + RAG for knowledge (most powerful)

LORA: rank decomposition — inject small trainable matrices, freeze 99.9% of model
VLLM: PagedAttention = efficient KV cache management = 24x throughput vs naive

KEY METRICS:
  Faithfulness: answers grounded in context (no hallucination)
  TTFT: time to first token (user experience for streaming)
  Cost/request: crucial for unit economics
```
