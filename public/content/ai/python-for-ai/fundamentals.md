# Python Foundations for AI — Fundamentals

This builds directly on the Overview's fast-track code. If you skipped straight here, go back — the Overview's JSON and NumPy sections are load-bearing for everything below.

## String handling for prompts — more important than it sounds

Prompt construction is string manipulation, and sloppy string handling produces sloppy prompts. F-strings are the standard tool, but the details matter once prompts get longer than one line:

```python
# Multi-line prompts — triple-quoted strings, not string concatenation
def build_system_prompt(role: str, constraints: list[str]) -> str:
    constraint_list = "\n".join(f"- {c}" for c in constraints)
    return f"""You are a {role}.

Follow these constraints:
{constraint_list}
"""
```

Concatenating a long prompt with `+` across many lines is genuinely harder to read and edit than an f-string built this way — this isn't a style preference, it's the difference between a prompt you can quickly scan for correctness and one you can't.

## Working with lists of dicts — the shape of conversation history

Every chat-style AI interaction is, underneath the SDK, a list of `{"role": ..., "content": ...}` dicts. Manipulating this list correctly is a core skill, not an implementation detail you can ignore:

```python
history: list[dict] = []

def add_turn(history: list[dict], role: str, content: str) -> list[dict]:
    history.append({"role": role, "content": content})
    return history

history = add_turn(history, "user", "What is a vector database?")
history = add_turn(history, "assistant", "A vector database stores embeddings...")

# Getting just the last N turns — common when managing context window size
recent = history[-4:]
```

## Error handling for API calls — not optional, APIs fail

A real difference between tutorial code and production AI code: tutorials call an API and assume it works. Real code accounts for rate limits, timeouts, and malformed responses:

```python
import time

def call_model_with_retry(prompt: str, max_retries: int = 3) -> str:
    for attempt in range(max_retries):
        try:
            return call_model(prompt)  # your actual API call
        except Exception as e:
            if attempt == max_retries - 1:
                raise
            wait = 2 ** attempt  # exponential backoff
            time.sleep(wait)
```

Exponential backoff specifically — not a fixed retry delay — matters because a fixed delay under a rate limit just means every retry hits the same wall at the same time; a growing delay actually gives the rate limit window a chance to clear.

## List comprehensions for processing model outputs

A pattern you'll use constantly once you're processing batches — extracting fields from a list of API responses, filtering by a condition:

```python
responses = [{"text": "yes", "confidence": 0.91}, {"text": "no", "confidence": 0.42}]

# Filter by confidence threshold — common in production pipelines
confident = [r["text"] for r in responses if r["confidence"] > 0.7]
```

## Reading tracebacks from a failed API call, without panicking

A failed `requests`/SDK call produces a traceback that looks intimidating but usually names the real problem in its last line — a `401` means your API key is wrong or missing, a `429` means you're rate-limited, a `KeyError` on the response usually means the API returned an error object shaped differently than the success response you expected, and your code didn't check for that. Reading the *last line* of a traceback first, before scrolling up, is the single most useful debugging habit for this kind of code.
