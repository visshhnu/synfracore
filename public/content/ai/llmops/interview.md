# LLMOps Interview Questions

## Core Concepts

**Q: What is LLMOps?**

LLMOps = operations practices for deploying, monitoring, and maintaining LLM applications in production. Differs from MLOps: pre-trained models, per-token cost, subjective quality evaluation, time-to-first-token latency.

**Q: LLM evaluation**

```python
from ragas import evaluate
from ragas.metrics import faithfulness, answer_relevancy, context_recall

# Offline: RAGAS evaluation
result = evaluate(dataset, metrics=[faithfulness, answer_relevancy, context_recall])
# faithfulness: 0.94 | answer_relevancy: 0.87 | context_recall: 0.91

# Online: LLM-as-judge for production sampling
# Human feedback: thumbs up/down -> evaluation dataset
```

**Q: LLM serving options**

```bash
# vLLM — open-source models, production grade
python -m vllm.entrypoints.openai.api_server \
  --model meta-llama/Meta-Llama-3-8B-Instruct \
  --tensor-parallel-size 2
# PagedAttention: 2-4x throughput vs naive serving

# Managed: OpenAI API, Anthropic, AWS Bedrock, Azure OpenAI
# Local dev: Ollama (quantised models on CPU)
```

**Q: Fine-tuning — when?**

Use when: consistent output format needed, domain tone, RAG failing.
NOT for: new facts (use RAG), if system prompt works, data < 1000 examples.

```python
from peft import LoraConfig, get_peft_model
# QLoRA: 4-bit + LoRA adapters = 0.1% parameters, single GPU
lora_config = LoraConfig(r=64, target_modules=["q_proj", "v_proj"])
model = get_peft_model(quantised_model, lora_config)
```

**Key metrics:** TTFT (latency), TPS (throughput), cost/request, faithfulness score, user thumbs rate.

Tooling: LangSmith, Langfuse, Arize Phoenix. Treat prompts as code — version in Git.

## Revision Notes
```
LLMOPS: Deploy + Monitor + Evaluate LLM apps
vs MLOps: per-token cost | subjective eval | TTFT matters

EVALUATION:
Offline: RAGAS (faithfulness=no hallucination, relevancy, recall)
Online: LLM-as-judge + human feedback

SERVING: vLLM (PagedAttention) | Managed APIs | Ollama (local)
FINE-TUNING: LoRA/QLoRA (0.1% params, single GPU)
Use for format/tone — NOT for new facts (use RAG instead)

MONITORING: TTFT + TPS + cost + faithfulness + refusal rate
Prompt versioning in Git | A/B test prompt changes
```
