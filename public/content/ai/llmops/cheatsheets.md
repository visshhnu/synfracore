# LLMOps — Cheatsheet

```python
# ── COST TRACKING ─────────────────────────────────────────
# Claude Sonnet pricing (per 1M tokens):
# Input: $3.00  | Cache write: $3.75 | Cache read: $0.30
# Output: $15.00
# 
# GPT-4o-mini pricing:
# Input: $0.15 | Output: $0.60

def estimate_cost(input_tokens: int, output_tokens: int, model: str = "claude-sonnet-4-6") -> float:
    prices = {
        "claude-sonnet-4-6":    {"in": 3.00, "out": 15.00},
        "claude-opus-4-6":      {"in": 15.00, "out": 75.00},
        "gpt-4o":               {"in": 2.50, "out": 10.00},
        "gpt-4o-mini":          {"in": 0.15, "out": 0.60},
    }
    p = prices.get(model, {"in": 3.00, "out": 15.00})
    return (input_tokens * p["in"] + output_tokens * p["out"]) / 1_000_000

# ── LANGSMITH SETUP ───────────────────────────────────────
import os
os.environ["LANGCHAIN_API_KEY"] = "your-key"
os.environ["LANGCHAIN_TRACING_V2"] = "true"
os.environ["LANGCHAIN_PROJECT"] = "production"
# All LangChain calls auto-traced in LangSmith dashboard

# ── RETRY + FALLBACK ──────────────────────────────────────
from tenacity import retry, stop_after_attempt, wait_exponential, retry_if_exception_type
import anthropic

@retry(
    stop=stop_after_attempt(3),
    wait=wait_exponential(min=4, max=30),
    retry=retry_if_exception_type((anthropic.RateLimitError, anthropic.APIConnectionError))
)
def call_with_retry(messages: list, model="claude-sonnet-4-6") -> str:
    r = anthropic.Anthropic().messages.create(
        model=model, max_tokens=1024, messages=messages
    )
    return r.content[0].text

# ── CACHING ───────────────────────────────────────────────
import hashlib, json
from functools import lru_cache

class ResponseCache:
    def __init__(self): self._cache = {}
    
    def get_or_generate(self, prompt: str, generate_fn) -> str:
        key = hashlib.md5(prompt.encode()).hexdigest()
        if key not in self._cache:
            self._cache[key] = generate_fn(prompt)
        return self._cache[key]

# ── EVALUATION TEMPLATE ───────────────────────────────────
def llm_as_judge(question: str, answer: str, rubric: str = "accuracy,helpfulness,conciseness") -> dict:
    """Use GPT-4o-mini to score another model's output."""
    from openai import OpenAI
    r = OpenAI().chat.completions.create(
        model="gpt-4o-mini",
        response_format={"type": "json_object"},
        messages=[{"role": "user", "content": f"""Rate this response on {rubric} (1-5 each).
Question: {question}
Answer: {answer}
JSON: {{"scores": {{"accuracy": N, "helpfulness": N, "conciseness": N}}, "reasoning": "..."}}"""}]
    )
    return json.loads(r.choices[0].message.content)

# ── KEY METRICS ───────────────────────────────────────────
# Latency:   Track p50/p95/p99 with histogram
# Cost:      $ per user, $ per feature, daily budget alerts  
# Quality:   Thumbs up/down rate, LLM-as-judge score
# Errors:    Rate limit hits, timeout rate, error rate
# Hallucination: % responses flagged by faithfulness check
```
