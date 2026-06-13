# Prompt Engineering — Advanced

## DSPy — Programmatic Prompt Optimization

```python
# DSPy: instead of hand-crafting prompts, OPTIMIZE them automatically
# Compiles your natural language task into optimized prompts
# pip install dspy-ai

import dspy

# Configure language model
lm = dspy.LM(model="anthropic/claude-sonnet-4-6")
dspy.configure(lm=lm)

# Define your task as a signature
class DevOpsQA(dspy.Signature):
    """Answer DevOps questions accurately with practical examples."""
    question = dspy.InputField()
    answer = dspy.OutputField(desc="Detailed answer with code examples")

# Chain of thought reasoning (auto-added by dspy)
class DevOpsCoT(dspy.Module):
    def __init__(self):
        self.answer = dspy.ChainOfThought(DevOpsQA)

    def forward(self, question):
        return self.answer(question=question)

# Create training examples
trainset = [
    dspy.Example(
        question="What is a Kubernetes Deployment?",
        answer="A Deployment manages stateless pods..."
    ).with_inputs("question"),
    # Add more examples
]

# Optimize prompts automatically using training examples
from dspy.teleprompt import BootstrapFewShot
optimizer = BootstrapFewShot(metric=lambda gold, pred, trace: gold.answer in pred.answer)
compiled = optimizer.compile(DevOpsCoT(), trainset=trainset)

# Optimized module performs better than hand-crafted prompts
result = compiled(question="Explain the difference between RollingUpdate and Recreate")
```

## Prompt Engineering Cheatsheet

```
# ── CORE TECHNIQUES ────────────────────────────────────────
Zero-shot:    Just ask, no examples
Few-shot:     3-5 input→output examples before the task
Chain-of-thought: "Think step by step" or "Let's work through this"
Self-consistency: Run N times, take majority vote
Tree-of-thought: Explore multiple reasoning paths

# ── OUTPUT CONTROL ─────────────────────────────────────────
Format JSON:  "Respond ONLY with valid JSON. Schema: {key: type, ...}"
Limit length: "In exactly 3 bullet points" / "In under 50 words"
Persona:      "You are a {expert} with {N} years experience in {domain}"
Constraints:  "Never mention competitors. Always cite sources."
              "If you're unsure, say 'I don't know' rather than guess"

# ── AVOID HALLUCINATIONS ───────────────────────────────────
"If you don't know, say so clearly"
"Only use information from the provided context"
"Cite which part of the document supports each claim"
"Rate your confidence 1-10 for each answer"

# ── TASK DECOMPOSITION ────────────────────────────────────
"Break this into steps before solving"
"First identify what information you need, then answer"
"Solve a simpler version first, then generalize"

# ── DEBUGGING BAD OUTPUTS ─────────────────────────────────
1. Add more specific constraints
2. Add counter-examples (what NOT to do)
3. Add few-shot examples of good output
4. Lower temperature for more deterministic output
5. Break complex task into smaller subtasks
6. Ask model to explain its reasoning
```
