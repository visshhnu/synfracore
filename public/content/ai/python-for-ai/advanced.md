# Python Foundations for AI — Advanced

## Async Python for concurrent AI calls

Sequential API calls are slow by construction — calling a model 10 times, one after another, takes 10x one call's latency. `asyncio` lets you fire them concurrently:

```python
import asyncio
from anthropic import AsyncAnthropic

client = AsyncAnthropic(api_key="...")

async def call_one(prompt: str) -> str:
    response = await client.messages.create(
        model="claude-sonnet-4-6", max_tokens=500,
        messages=[{"role": "user", "content": prompt}],
    )
    return response.content[0].text

async def call_many(prompts: list[str]) -> list[str]:
    return await asyncio.gather(*[call_one(p) for p in prompts])
```

`asyncio.gather` here fires every call essentially at once, rather than waiting for each to finish before starting the next — for 10 independent prompts, this is the difference between roughly 10x one call's latency and roughly 1x it (bounded by the slowest individual call, plus whatever concurrency limit the API itself enforces).

## Building a real agent loop

An "AI agent" is, mechanically, a loop: call the model, check if it wants to use a tool, execute the tool, feed the result back, repeat until the model produces a final answer instead of another tool call:

```python
def run_agent(user_message: str, tools: dict, max_iterations: int = 10) -> str:
    messages = [{"role": "user", "content": user_message}]
    for _ in range(max_iterations):
        response = client.messages.create(
            model="claude-sonnet-4-6", max_tokens=1000,
            messages=messages, tools=list(tools.values()),
        )
        if response.stop_reason != "tool_use":
            return response.content[0].text  # model gave a final answer

        tool_call = next(b for b in response.content if b.type == "tool_use")
        result = tools[tool_call.name]["fn"](**tool_call.input)
        messages.append({"role": "assistant", "content": response.content})
        messages.append({"role": "user", "content": [
            {"type": "tool_result", "tool_use_id": tool_call.id, "content": str(result)}
        ]})
    return "Max iterations reached without a final answer."
```

The `max_iterations` cap isn't defensive paranoia — a badly-prompted or genuinely stuck agent can loop on tool calls indefinitely without one, and every iteration costs real API tokens. Production agent code always has a hard cap, not an optimistic assumption that the model will eventually stop on its own.

## Cost and token management as a real engineering concern

At any real scale, token usage is a cost line item, not an abstraction — and Python is where you actually control it:

```python
def estimate_cost(input_tokens: int, output_tokens: int, input_rate: float, output_rate: float) -> float:
    return (input_tokens / 1_000_000 * input_rate) + (output_tokens / 1_000_000 * output_rate)

# Prompt caching (where supported) can cut repeated-context cost significantly
# by not re-billing full price for a system prompt/context sent on every call —
# check your specific provider's current caching mechanism and pricing, since
# both evolve; don't hardcode an assumed discount rate into cost-estimation code.
```

A common production pattern: log token usage per request from day one, even before cost is a visible problem — retrofitting usage tracking after a surprise bill is much harder than having the data already flowing.

## Evaluation — testing AI output like you'd test any other code

The advanced-but-essential skill most tutorials skip: how do you know if a prompt change made things better or worse? Not by eyeballing a few examples — by running a fixed evaluation set through both versions and scoring programmatically:

```python
def run_eval(eval_cases: list[dict], prompt_fn) -> float:
    correct = 0
    for case in eval_cases:
        result = prompt_fn(case["input"])
        if case["expected_check"](result):  # a function, not just exact-match
            correct += 1
    return correct / len(eval_cases)
```

`expected_check` being a function rather than a strict string match matters — LLM output is rarely byte-identical across runs even for a "correct" answer, so evaluation logic usually needs semantic or structural checks (does the response contain the right entity, is the JSON schema valid) rather than exact-match assertions.

## Production hardening checklist for AI-calling code

- Timeouts on every API call — a hung request without one can block indefinitely.
- Retry logic with exponential backoff (see Fundamentals) — but with a max-retry cap, and logging when the cap is hit, not silently swallowing repeated failures.
- Input validation *before* the API call, not just output validation after — sending malformed input wastes a paid call that was going to fail anyway.
- Structured logging of prompts, responses, and token counts — you cannot debug or cost-audit an AI system you can't see into after the fact.
- A fallback behavior for when the API is down or rate-limited — what does your application actually do, concretely, not "it handles it gracefully" as a vague plan.
