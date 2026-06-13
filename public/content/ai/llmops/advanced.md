# LLMOps — Advanced

## Guardrails and Safety

```python
# Input/output validation for production LLM apps
import re
from anthropic import Anthropic

client = Anthropic()

class Guardrails:
    """Input and output guardrails for LLM applications."""
    
    # Patterns to block in inputs
    BLOCKED_PATTERNS = [
        r"ignore (previous|all|prior) instructions",
        r"you are now",
        r"disregard (your|all) (rules|guidelines|instructions)",
        r"jailbreak",
        r"prompt injection",
    ]
    
    # Topics to block
    BLOCKED_TOPICS = ["weapons", "illegal activities", "personal information of others"]
    
    def check_input(self, text: str) -> tuple[bool, str]:
        """Returns (is_safe, reason)."""
        text_lower = text.lower()
        
        # Check for injection patterns
        for pattern in self.BLOCKED_PATTERNS:
            if re.search(pattern, text_lower):
                return False, f"Potential prompt injection detected"
        
        # Check length
        if len(text) > 10000:
            return False, "Input too long (max 10,000 characters)"
        
        return True, "ok"
    
    def check_output(self, text: str) -> tuple[bool, str]:
        """Validate model output before returning to user."""
        # Check for PII leakage
        if re.search(r'\b\d{4}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}\b', text):
            return False, "Output may contain credit card number"
        
        if re.search(r'\b[A-Z]{2}\d{6}\b', text):
            return False, "Output may contain passport number"
        
        return True, "ok"

guardrails = Guardrails()

def safe_complete(user_input: str, system: str = "") -> str:
    is_safe, reason = guardrails.check_input(user_input)
    if not is_safe:
        return f"I can't process that request: {reason}"
    
    response = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1024,
        system=system,
        messages=[{"role": "user", "content": user_input}]
    )
    output = response.content[0].text
    
    is_safe, reason = guardrails.check_output(output)
    if not is_safe:
        return "I encountered an issue generating a safe response."
    
    return output
```

## LLMOps Cheatsheet + Interview

```
# ── KEY METRICS TO MONITOR ────────────────────────────────
Latency:       p50, p95, p99 response times
Cost:          $ per request, $ per user, daily spend
Quality:       User ratings, thumbs up/down, correction rate
Reliability:   Error rate, timeout rate, fallback rate
Hallucinations: % responses with unverified claims (use LLM-as-judge)

# ── TOOLS ─────────────────────────────────────────────────
LangSmith:     Tracing, evaluation, dataset management (LangChain native)
W&B Weave:     LLM observability, prompts, evals (any framework)
Arize:         ML observability, drift detection, LLM tracing
Helicone:      Open source proxy, logs all LLM calls
Phoenix:       Open source, runs locally, great for debugging

# ── KEY INTERVIEW QUESTIONS ───────────────────────────────
Q: How do you detect quality degradation in production LLMs?
A: Monitor user feedback (thumbs down rate), use LLM-as-judge to score
   responses periodically, run regression evals on new prompt versions,
   track semantic similarity of outputs over time, alert on anomalies.

Q: How do you reduce LLM API costs in production?
A: Prompt caching for repeated context, smaller models for simple tasks,
   response caching for identical queries, streaming to improve UX without
   extra cost, batching async workloads, tiered models (cheap→expensive).

Q: What is LLM-as-judge?
A: Using a powerful LLM to evaluate another LLM's output quality.
   Example: GPT-4 rates Claude's responses 1-5. More scalable than
   human eval, correlates well with human judgments when done carefully.
   Risk: evaluator model has its own biases and errors.
```
