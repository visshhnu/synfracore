# LLMOps — Intermediate

## LangSmith Tracing

```python
# LangSmith: observability platform for LLM apps
# pip install langsmith

import os
os.environ["LANGCHAIN_API_KEY"] = "your-key"
os.environ["LANGCHAIN_TRACING_V2"] = "true"
os.environ["LANGCHAIN_PROJECT"] = "my-rag-app"

# All LangChain calls now automatically traced
# View in LangSmith dashboard: latency, cost, inputs, outputs, errors

# Manual tracing for non-LangChain code
from langsmith import traceable, Client

client = Client()

@traceable(run_type="llm", name="my-claude-call")
def call_claude(prompt: str) -> str:
    response = anthropic_client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1024,
        messages=[{"role": "user", "content": prompt}]
    )
    return response.content[0].text

@traceable(run_type="retriever", name="vector-search")  
def retrieve_docs(query: str) -> list:
    return vectorstore.similarity_search(query, k=5)

@traceable(run_type="chain", name="rag-pipeline")
def rag_pipeline(question: str) -> str:
    docs = retrieve_docs(question)
    context = "\n".join(d.page_content for d in docs)
    return call_claude(f"Context: {context}\n\nQuestion: {question}")

# LangSmith auto-captures: timing, token usage, inputs, outputs, errors
```

## A/B Testing Prompts

```python
import random
from typing import Callable

class PromptABTest:
    """A/B test different prompts in production."""
    
    def __init__(self, variants: dict[str, str], traffic_split: dict[str, float] = None):
        self.variants = variants  # {"control": "prompt v1", "treatment": "prompt v2"}
        self.traffic_split = traffic_split or {k: 1/len(variants) for k in variants}
        self.results = {k: {"calls": 0, "avg_rating": 0.0} for k in variants}
    
    def get_variant(self, user_id: str = None) -> tuple[str, str]:
        """Get variant (deterministic for same user_id)."""
        if user_id:
            # Deterministic: same user always gets same variant
            idx = hash(user_id) % 100
            cumulative = 0
            for variant, pct in self.traffic_split.items():
                cumulative += pct * 100
                if idx < cumulative:
                    return variant, self.variants[variant]
        
        # Random split
        rand = random.random()
        cumulative = 0
        for variant, pct in self.traffic_split.items():
            cumulative += pct
            if rand < cumulative:
                return variant, self.variants[variant]
    
    def record_feedback(self, variant: str, rating: float):
        """Record user feedback (1-5 stars)."""
        r = self.results[variant]
        r["avg_rating"] = (r["avg_rating"] * r["calls"] + rating) / (r["calls"] + 1)
        r["calls"] += 1
    
    def get_winner(self) -> str:
        return max(self.results, key=lambda k: self.results[k]["avg_rating"])

test = PromptABTest(variants={
    "control": "Answer the question concisely.",
    "treatment": "Answer the question with a practical example and best practices."
})
```
