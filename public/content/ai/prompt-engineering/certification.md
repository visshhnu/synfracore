# Prompt Engineering Certification Guide

## Certifications Available

| Course / Cert | Provider | Cost | Format |
|---------------|----------|------|--------|
| **Prompt Engineering for Developers** | DeepLearning.AI/OpenAI | Free | Jupyter notebooks |
| **ChatGPT Prompt Engineering** | DeepLearning.AI | Free | 1-hour course |
| **Anthropic Prompt Engineering Guide** | Anthropic | Free | Docs + Console |
| **Learn Prompting Certificate** | LearnPrompting.org | Free | Self-paced |

---

## Core Techniques — Cheatsheet

```
TECHNIQUE          WHEN TO USE                        EXAMPLE TRIGGER
───────────────────────────────────────────────────────────────────────
Zero-shot          Simple tasks, general knowledge    Direct instruction
Few-shot           Pattern matching, classification   "Here are 3 examples:"
Chain-of-Thought   Math, logic, multi-step reasoning  "Let's think step by step"
Self-consistency   High-stakes reasoning              Run 5x, take majority vote
ReAct              Agents (tool use)                  Thought/Action/Observation
Structured output  Downstream JSON parsing            "Return only valid JSON:"
Role prompting     Expertise persona                  "You are a senior DevOps..."
Delimiters         Safety, clear boundaries           <document>...</document>
```

---

## Practical Patterns

```python
from openai import OpenAI
client = OpenAI()

# FEW-SHOT — give examples so model follows the pattern
few_shot_prompt = """Classify as positive/negative/neutral:
Review: "Love this product!" -> positive
Review: "Terrible, broke on day 1" -> negative
Review: "It is okay I guess" -> neutral
Review: "{review}" ->"""

# CHAIN-OF-THOUGHT — explicit reasoning steps
cot_prompt = """Solve step by step. Show each calculation.
Problem: A train travels 60km/h for 2.5 hours. How far does it travel?
Answer: Let me work through this step by step."""

# STRUCTURED OUTPUT — enforce JSON
json_prompt = """Extract the following from the text and return ONLY valid JSON:
{
  "person_name": string,
  "issue_type": "billing" | "technical" | "general",
  "urgency": "low" | "medium" | "high"
}
Text: {user_text}"""

# DELIMITERS — separate instructions from user data (prevents injection)
safe_prompt = """Summarise the document below in 2 bullet points.
<document>
{user_provided_document}
</document>"""
```

---

## System Prompt Architecture

```
BEST PRACTICE STRUCTURE:
  [1] Role:       "You are a senior Python code reviewer..."
  [2] Task:       "Review code for bugs, security issues, and style..."
  [3] Constraints:"Focus on Python 3.10+. Do not suggest rewrites."
  [4] Format:     "Return a numbered list. One issue per line."
  [5] Examples:   "Example output: 1. Line 12: potential SQL injection..."
  [6] Fallback:   "If no issues found, say: Code looks good."

WHAT TO AVOID:
  - Secrets in system prompt (users can extract them)
  - "Never do X" instructions (easily bypassed)
  - Contradictory instructions
  - Extremely long prompts for simple tasks (costs more, often worse)
```

---

## Token Optimisation

```
COST REDUCTION:
  Shorter prompts = fewer tokens = lower cost
  Caching: identical system prompts cached by OpenAI/Anthropic
  Model routing: simple tasks to gpt-4o-mini/claude-haiku

QUALITY IMPROVEMENT:
  Temperature=0 for deterministic structured output
  Use XML/delimiter tags to separate parts of prompt
  Specify exact output format (length, style, structure)
  Use "ONLY" and "EXACTLY" for strict compliance
```

## Revision Notes
```
MUST-KNOW TECHNIQUES:
  Zero-shot: just describe the task
  Few-shot: 2-5 examples for pattern matching
  CoT: "think step by step" for math/logic
  Self-consistency: sample multiple times, take majority

STRUCTURED OUTPUT:
  Include schema in prompt | "Return ONLY valid JSON"
  Use Pydantic + with_structured_output for reliability

DELIMITERS: XML tags prevent injection and clarify boundaries
  <instruction>...</instruction> | <document>...</document>

SYSTEM PROMPT: Role + Task + Constraints + Format + Examples
  Temperature 0 for structured tasks | 0.7 for creative

PROMPT INJECTION: user input inside prompts can override instructions
  Defence: delimiters + output validation + sandboxing
```
