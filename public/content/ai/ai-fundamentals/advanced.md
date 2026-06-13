# AI Fundamentals — Advanced

## Evaluations (Evals)

```python
# Evals = automated tests for LLM outputs
# Critical for: catching regressions when you change prompts or models

import anthropic
from dataclasses import dataclass
import json

@dataclass
class EvalCase:
    input: str
    expected_keywords: list[str]
    expected_format: str = None
    min_score: float = 0.8

def run_evals(test_cases: list[EvalCase], model: str = "claude-sonnet-4-6"):
    client = anthropic.Anthropic()
    results = []

    for case in test_cases:
        response = client.messages.create(
            model=model,
            max_tokens=500,
            messages=[{"role": "user", "content": case.input}]
        )
        output = response.content[0].text

        # Check keyword presence
        keyword_score = sum(
            1 for kw in case.expected_keywords if kw.lower() in output.lower()
        ) / len(case.expected_keywords)

        # Check format if specified
        format_ok = True
        if case.expected_format == "json":
            try:
                json.loads(output)
            except:
                format_ok = False

        passed = keyword_score >= case.min_score and format_ok

        results.append({
            "input": case.input[:50],
            "passed": passed,
            "keyword_score": keyword_score,
        })

    pass_rate = sum(1 for r in results if r["passed"]) / len(results)
    print(f"Pass rate: {pass_rate:.0%} ({sum(1 for r in results if r['passed'])}/{len(results)})")
    return results

# Define test suite
test_cases = [
    EvalCase(
        input="What is Docker?",
        expected_keywords=["container", "image", "isolation"],
    ),
    EvalCase(
        input="Extract name and age from: Alice is 30 years old",
        expected_keywords=["Alice", "30"],
        expected_format="json",
    ),
]
run_evals(test_cases)
```

## Building Production AI Systems

```python
# Production patterns: retry, fallback, circuit breaker

import anthropic
import time
from tenacity import retry, stop_after_attempt, wait_exponential, retry_if_exception_type

client = anthropic.Anthropic()

@retry(
    stop=stop_after_attempt(3),
    wait=wait_exponential(multiplier=1, min=4, max=10),
    retry=retry_if_exception_type((anthropic.RateLimitError, anthropic.APIConnectionError))
)
def call_claude_with_retry(messages: list, model: str = "claude-sonnet-4-6") -> str:
    response = client.messages.create(
        model=model,
        max_tokens=1024,
        messages=messages
    )
    return response.content[0].text

# Model fallback chain
def call_with_fallback(messages: list) -> str:
    models = ["claude-opus-4-6", "claude-sonnet-4-6"]
    for model in models:
        try:
            return call_claude_with_retry(messages, model=model)
        except anthropic.APIStatusError as e:
            if e.status_code == 529:  # Overloaded
                continue
            raise
    raise Exception("All models unavailable")

# Cost tracking
class TrackedClient:
    def __init__(self):
        self.client = anthropic.Anthropic()
        self.total_input_tokens = 0
        self.total_output_tokens = 0

    def create(self, **kwargs) -> anthropic.types.Message:
        response = self.client.messages.create(**kwargs)
        self.total_input_tokens += response.usage.input_tokens
        self.total_output_tokens += response.usage.output_tokens
        return response

    @property
    def estimated_cost_usd(self) -> float:
        # Claude Sonnet 4.6: $3/1M input, $15/1M output
        return (self.total_input_tokens * 3 + self.total_output_tokens * 15) / 1_000_000
```

## AI Fundamentals Cheatsheet

```python
# ── ANTHROPIC API ─────────────────────────────────────────
import anthropic
client = anthropic.Anthropic()  # ANTHROPIC_API_KEY from env

# Basic completion
r = client.messages.create(
    model="claude-sonnet-4-6",    # or claude-opus-4-6, claude-haiku-4-5-20251001
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)
text = r.content[0].text
tokens_used = r.usage.input_tokens + r.usage.output_tokens

# Streaming
with client.messages.stream(
    model="claude-sonnet-4-6", max_tokens=1024,
    messages=[{"role": "user", "content": "Write a long essay"}]
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)

# System prompt
r = client.messages.create(
    model="claude-sonnet-4-6",
    max_tokens=1024,
    system="You are a DevOps expert. Be concise.",
    messages=[{"role": "user", "content": "Explain Helm"}]
)

# Vision (image input)
import base64
with open("diagram.png", "rb") as f:
    img_data = base64.standard_b64encode(f.read()).decode("utf-8")

r = client.messages.create(
    model="claude-sonnet-4-6", max_tokens=1024,
    messages=[{"role": "user", "content": [
        {"type": "image", "source": {"type": "base64", "media_type": "image/png", "data": img_data}},
        {"type": "text", "text": "Describe this architecture diagram"}
    ]}]
)

# ── MODELS AND PRICING ────────────────────────────────────
# claude-opus-4-6:    $15/$75 per 1M tokens  — most capable
# claude-sonnet-4-6:  $3/$15 per 1M tokens   — balanced (recommended)
# claude-haiku-4-5:   $0.25/$1.25 per 1M    — fastest, cheapest

# 1 token ≈ 4 chars ≈ 0.75 words
# 1000-word essay ≈ 1,333 tokens ≈ $0.004 with Sonnet
```
