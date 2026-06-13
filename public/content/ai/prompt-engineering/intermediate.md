# Prompt Engineering — Intermediate

## Advanced Prompt Patterns

```python
# Role prompting — give the model a specific expert persona
system = """You are a principal engineer at Google with 15 years of distributed systems experience.
You review code with extreme attention to:
1. Race conditions and concurrency bugs
2. Memory leaks and resource management
3. Security vulnerabilities
4. Performance at scale (>1M requests/day)

Format your review as:
- CRITICAL: (must fix before production)
- WARNING: (should fix soon)
- SUGGESTION: (nice to have)
Include line numbers and specific fixes."""

# Output formatting control
system = """Always respond with this exact JSON structure:
{
    "answer": "your answer here",
    "confidence": 0.0 to 1.0,
    "sources": ["source1", "source2"],
    "follow_up_questions": ["question1", "question2"]
}
No preamble. No explanation. Valid JSON only."""

# Persona consistency in multi-turn
messages = [
    {"role": "user", "content": "Act as a strict technical interviewer. Ask me one Kubernetes question."},
    {"role": "assistant", "content": "Describe the difference between a Deployment and a StatefulSet."},
    {"role": "user", "content": "A Deployment is for stateless apps..."},
    # Continue the interview
]
```

## Meta-Prompting

```python
# Use Claude to improve your own prompts
improve_prompt = """Analyze this prompt and rewrite it to be more effective:

ORIGINAL PROMPT:
{original_prompt}

Consider:
1. Is the task clearly defined?
2. Are output format requirements explicit?
3. Are there helpful examples (few-shot)?
4. Does it set appropriate constraints?
5. Does it anticipate edge cases?

Return:
- IMPROVED PROMPT: (the rewritten prompt)
- CHANGES MADE: (bulleted list of what you changed and why)"""

# Chain-of-thought for code generation
cot_code_prompt = """Write a Python function that {task}.

Think through this step by step:
1. What are the inputs and outputs?
2. What are the edge cases?
3. What's the time/space complexity?
4. Write the implementation
5. Write tests for the edge cases

Show your thinking for each step before writing code."""
```

## Constitutional AI (Self-Critique)

```python
# Self-critique loop — model reviews and improves its own output

def generate_with_critique(task: str, iterations: int = 2) -> str:
    messages = [{"role": "user", "content": task}]

    for i in range(iterations):
        # Generate response
        response = client.messages.create(
            model="claude-sonnet-4-6", max_tokens=2000,
            messages=messages
        )
        output = response.content[0].text
        messages.append({"role": "assistant", "content": output})

        if i < iterations - 1:
            # Ask model to critique and improve
            messages.append({
                "role": "user",
                "content": """Review your previous response for:
1. Accuracy — any incorrect statements?
2. Completeness — anything missing?
3. Clarity — could anything be explained better?
4. Conciseness — any unnecessary content?

Then provide an improved version."""
            })

    return output

result = generate_with_critique(
    "Explain the difference between blue-green and canary deployments"
)
```
