# LLMOps — Production LLM Operations

LLMOps is the practice of deploying, monitoring, and maintaining Large Language Model applications in production. It combines MLOps principles with the unique challenges of generative AI systems.

## Why LLMOps is Different from Traditional MLOps

| Traditional MLOps | LLMOps |
|------------------|--------|
| Deterministic outputs | Non-deterministic, probabilistic |
| Numeric predictions | Natural language outputs |
| Small models (MBs) | Huge models (GBs-TBs) |
| Fast inference (<1ms) | Slow inference (1-30 seconds) |
| Easy to evaluate (accuracy) | Hard to evaluate (quality?) |
| Train your own model | Usually use pre-trained APIs |
| Version data + model | Version data + prompts + model |

## Production Stack

```
User Request
    │
[Rate Limiting / Auth]
    │
[Semantic Cache]          ← Check if similar question answered before
    │ (cache miss)
[Prompt Construction]     ← System prompt + context + user query
    │
[LLM API]                 ← OpenAI, Anthropic, Azure OpenAI, etc.
    │
[Output Validation]       ← Format check, safety filter, hallucination check
    │
[Response + Cache Store]  ← Cache for future similar queries
    │
[Observability]           ← Log token usage, latency, cost, quality
    │
Final Response
```

## Prompt Versioning and Management

```python
# Never hardcode prompts — version them like code
# prompts/v1/rag_system.txt → prompts/v2/rag_system.txt

import yaml
from pathlib import Path
from datetime import datetime

class PromptRegistry:
    def __init__(self, prompts_dir: str = "prompts"):
        self.dir = Path(prompts_dir)

    def get(self, name: str, version: str = "latest") -> str:
        if version == "latest":
            # Find highest version
            versions = sorted(
                self.dir.glob(f"{name}_v*.txt"),
                key=lambda p: int(p.stem.split("_v")[1])
            )
            if not versions:
                raise FileNotFoundError(f"No prompt found: {name}")
            path = versions[-1]
        else:
            path = self.dir / f"{name}_v{version}.txt"

        return path.read_text()

    def save(self, name: str, content: str, notes: str = "") -> str:
        existing = list(self.dir.glob(f"{name}_v*.txt"))
        next_version = len(existing) + 1
        path = self.dir / f"{name}_v{next_version}.txt"
        path.write_text(content)

        # Save metadata
        meta = {
            "version": next_version,
            "created": datetime.now().isoformat(),
            "notes": notes
        }
        (self.dir / f"{name}_v{next_version}_meta.yaml").write_text(
            yaml.dump(meta)
        )
        return f"Saved as v{next_version}"


registry = PromptRegistry()
system_prompt = registry.get("rag_assistant")
```

## Semantic Caching

```python
from anthropic import Anthropic
import hashlib
import json
import redis
from sentence_transformers import SentenceTransformer
import numpy as np

client = Anthropic()
r = redis.Redis(host='localhost', port=6379)
encoder = SentenceTransformer('all-MiniLM-L6-v2')

def semantic_cache_get(query: str, threshold: float = 0.92) -> str | None:
    query_embedding = encoder.encode(query)

    # Check all cached queries for semantic similarity
    cached_keys = r.keys("cache:embedding:*")
    for key in cached_keys:
        cached_embedding = np.frombuffer(r.get(key), dtype=np.float32)
        similarity = np.dot(query_embedding, cached_embedding) / (
            np.linalg.norm(query_embedding) * np.linalg.norm(cached_embedding)
        )
        if similarity >= threshold:
            cache_id = key.decode().replace("cache:embedding:", "")
            return r.get(f"cache:response:{cache_id}").decode()

    return None

def semantic_cache_set(query: str, response: str):
    cache_id = hashlib.md5(query.encode()).hexdigest()
    embedding = encoder.encode(query).astype(np.float32)
    r.setex(f"cache:embedding:{cache_id}", 3600, embedding.tobytes())
    r.setex(f"cache:response:{cache_id}", 3600, response)

def cached_llm_call(user_message: str, system: str) -> str:
    # Check cache first
    cached = semantic_cache_get(user_message)
    if cached:
        print("Cache hit!")
        return cached

    # Call LLM
    response = client.messages.create(
        model="claude-sonnet-4-20250514",
        max_tokens=1000,
        system=system,
        messages=[{"role": "user", "content": user_message}]
    )
    result = response.content[0].text

    # Cache result
    semantic_cache_set(user_message, result)
    return result
```

## Observability and Monitoring

```python
import time
import logging
from dataclasses import dataclass, field
from typing import Optional
import anthropic

@dataclass
class LLMCallMetrics:
    model: str
    prompt_tokens: int = 0
    completion_tokens: int = 0
    total_tokens: int = 0
    latency_ms: float = 0
    cost_usd: float = 0
    cache_hit: bool = False
    error: Optional[str] = None
    session_id: str = ""
    user_id: str = ""

# Token pricing (update regularly)
PRICING = {
    "claude-sonnet-4-20250514": {"input": 3.0, "output": 15.0},   # per 1M tokens
    "gpt-4o": {"input": 5.0, "output": 15.0},
    "gpt-4o-mini": {"input": 0.15, "output": 0.60},
}

def calculate_cost(model: str, input_tokens: int, output_tokens: int) -> float:
    if model not in PRICING:
        return 0.0
    p = PRICING[model]
    return (input_tokens * p["input"] + output_tokens * p["output"]) / 1_000_000

def instrumented_llm_call(
    messages: list,
    model: str = "claude-sonnet-4-20250514",
    system: str = "",
    user_id: str = "",
    session_id: str = "",
) -> tuple[str, LLMCallMetrics]:
    client = anthropic.Anthropic()
    metrics = LLMCallMetrics(model=model, user_id=user_id, session_id=session_id)
    start = time.time()

    try:
        response = client.messages.create(
            model=model,
            max_tokens=2000,
            system=system,
            messages=messages
        )

        metrics.latency_ms = (time.time() - start) * 1000
        metrics.prompt_tokens = response.usage.input_tokens
        metrics.completion_tokens = response.usage.output_tokens
        metrics.total_tokens = metrics.prompt_tokens + metrics.completion_tokens
        metrics.cost_usd = calculate_cost(model, metrics.prompt_tokens, metrics.completion_tokens)

        result = response.content[0].text

    except Exception as e:
        metrics.latency_ms = (time.time() - start) * 1000
        metrics.error = str(e)
        logging.error(f"LLM call failed: {e}", extra={"metrics": metrics.__dict__})
        raise

    # Log to observability platform
    logging.info("llm_call", extra={
        "model": model,
        "latency_ms": round(metrics.latency_ms, 1),
        "tokens": metrics.total_tokens,
        "cost_usd": round(metrics.cost_usd, 6),
        "session_id": session_id,
        "user_id": user_id,
    })

    return result, metrics
```

## Evaluation Framework

```python
# LLM output evaluation — the hardest part of LLMOps
from anthropic import Anthropic

client = Anthropic()

def evaluate_rag_response(
    question: str,
    context: str,
    response: str,
    ground_truth: str = None
) -> dict:
    """Use an LLM to evaluate another LLM's response."""

    eval_prompt = f"""Evaluate this AI assistant response on three criteria.
Return ONLY valid JSON.

Question: {question}
Context provided: {context}
AI Response: {response}
{f'Ground truth: {ground_truth}' if ground_truth else ''}

Evaluate:
1. faithfulness (0-1): Is the response supported by the context? 
   1.0 = fully grounded, 0.0 = hallucinated
2. relevancy (0-1): Does it answer the question asked?
3. completeness (0-1): Does it cover all important aspects?

Return:
{{"faithfulness": 0.0-1.0, "relevancy": 0.0-1.0, "completeness": 0.0-1.0, 
  "issues": ["list any problems found"], "overall": 0.0-1.0}}"""

    eval_response = client.messages.create(
        model="claude-sonnet-4-20250514",
        max_tokens=300,
        messages=[{"role": "user", "content": eval_prompt}]
    )

    import json
    return json.loads(eval_response.content[0].text)


# A/B testing prompts
def ab_test_prompts(
    prompt_a: str,
    prompt_b: str,
    test_cases: list[dict],
    evaluator_fn = evaluate_rag_response
) -> dict:
    results = {"prompt_a": [], "prompt_b": []}

    for case in test_cases:
        for variant, prompt in [("prompt_a", prompt_a), ("prompt_b", prompt_b)]:
            response = client.messages.create(
                model="claude-sonnet-4-20250514",
                max_tokens=1000,
                system=prompt,
                messages=[{"role": "user", "content": case["question"]}]
            )
            text = response.content[0].text
            score = evaluator_fn(
                question=case["question"],
                context=case.get("context", ""),
                response=text,
                ground_truth=case.get("ground_truth")
            )
            results[variant].append(score["overall"])

    return {
        "prompt_a_avg": sum(results["prompt_a"]) / len(results["prompt_a"]),
        "prompt_b_avg": sum(results["prompt_b"]) / len(results["prompt_b"]),
        "winner": "A" if results["prompt_a"] > results["prompt_b"] else "B"
    }
```

## Guardrails and Safety

```python
from anthropic import Anthropic

client = Anthropic()

class LLMGuardrails:
    BLOCKED_PATTERNS = [
        "ignore previous instructions",
        "system prompt",
        "jailbreak",
        "you are now",
    ]

    def check_input(self, user_input: str) -> tuple[bool, str]:
        """Returns (is_safe, reason)"""
        lower = user_input.lower()
        for pattern in self.BLOCKED_PATTERNS:
            if pattern in lower:
                return False, f"Blocked pattern: {pattern}"

        if len(user_input) > 10000:
            return False, "Input too long"

        return True, "OK"

    def check_output(self, response: str, context: str = "") -> tuple[bool, str]:
        """Validate LLM output before serving to user"""
        # Check for PII leakage
        import re
        pii_patterns = [
            r'\b\d{3}-\d{2}-\d{4}\b',   # SSN
            r'\b\d{16}\b',               # Credit card
            r'\b[A-Z]{2}\d{6}\b',        # Passport-like
        ]
        for pattern in pii_patterns:
            if re.search(pattern, response):
                return False, "PII detected in response"

        return True, "OK"

    def moderate_with_llm(self, content: str) -> dict:
        """Use Claude for nuanced content moderation"""
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=100,
            messages=[{
                "role": "user",
                "content": f"""Is this content safe for a professional technical learning platform?
Content: {content}
Return JSON: {{"safe": true/false, "category": "safe|spam|harmful|off-topic", "reason": "brief reason"}}"""
            }]
        )
        import json
        return json.loads(response.content[0].text)
```

## Cost Optimization

```python
# Strategy 1: Route to cheaper models for simple queries
def smart_model_router(query: str, complexity_threshold: float = 0.7) -> str:
    """Route simple queries to cheap model, complex to powerful model"""
    classifier_response = client.messages.create(
        model="claude-haiku-4-5-20251001",  # Use cheapest model to classify
        max_tokens=10,
        messages=[{
            "role": "user",
            "content": f"Rate complexity 0-1 (number only): {query}"
        }]
    )
    complexity = float(classifier_response.content[0].text.strip())

    if complexity < complexity_threshold:
        return "claude-haiku-4-5-20251001"  # 20x cheaper
    else:
        return "claude-sonnet-4-20250514"   # More capable

# Strategy 2: Output caching
# Same prompt + same model version = deterministic enough to cache
# Cache aggressively for knowledge-base Q&A

# Strategy 3: Streaming to improve perceived latency
def stream_response(messages: list):
    with client.messages.stream(
        model="claude-sonnet-4-20250514",
        max_tokens=1000,
        messages=messages
    ) as stream:
        for text in stream.text_stream:
            yield text   # Stream to frontend in real-time
```

## Interview Questions

**What is the main challenge of evaluating LLM applications?**
Unlike traditional ML where you have a ground truth label and can compute accuracy, LLM outputs are natural language — there's no single right answer. A response might be factually correct, well-written, and still miss what the user actually needed. Evaluation approaches: automated LLM-as-judge (use a second LLM to rate responses), reference-based metrics (ROUGE, BLEU — but these correlate poorly with human judgment), human evaluation (expensive but gold standard), and task-specific metrics (for RAG: faithfulness, relevancy; for summarization: coverage). Production LLMOps requires all of these in combination.

**How do you handle LLM hallucinations in production?**
Multiple layers: RAG — ground responses in retrieved documents instead of relying on parametric knowledge; prompt engineering — "only answer based on the provided context, say I don't know if uncertain"; output validation — use a second LLM call to verify the response is supported by context; semantic similarity — check if the response contains claims not present in source; confidence estimation — some models provide logprobs; human-in-the-loop for high-stakes domains; and monitoring — track when users flag incorrect responses to identify failure patterns.
