# Prompt Engineering — Cheatsheet

```
# ── CORE TECHNIQUES ────────────────────────────────────────
Zero-shot:         Ask directly, no examples
One-shot:          One input→output example
Few-shot:          3-10 examples (most reliable)
CoT:               "Think step by step" / "Let's reason through this"
Self-consistency:  Run 5x, take majority answer
ReAct:             Thought → Action → Observation loop (agents)
Tree-of-thought:   Explore multiple reasoning branches

# ── SYSTEM PROMPT PATTERNS ────────────────────────────────
Role + Expertise:
  "You are a senior {role} with {N} years experience in {domain}."

Output Format:
  "Always respond with JSON: {key: type, key2: type}"
  "Format: ###Title\n**Bold** key points\n- Bullets"
  "Respond in under 3 bullet points."

Constraints:
  "Only use information from the provided context."
  "If unsure, say 'I don't know' rather than guessing."
  "Never recommend [competitor]. Always cite sources."

Personas:
  "You are a strict interviewer. Ask one question at a time."
  "You are a patient tutor. Check understanding frequently."

# ── FEW-SHOT TEMPLATE ─────────────────────────────────────
Input: <example 1>
Output: <good answer 1>

Input: <example 2>
Output: <good answer 2>

Input: {actual input}
Output:

# ── CHAIN OF THOUGHT ──────────────────────────────────────
"Before answering, think through:
1. What information do I need?
2. What are the constraints?
3. Work through step by step.
Then provide your final answer."

# ── STRUCTURED OUTPUT ────────────────────────────────────
"Respond ONLY with valid JSON. No preamble. No explanation.
Schema: {
  'summary': 'string',
  'key_points': ['string'],
  'confidence': 0.0-1.0
}"

# ── ANTI-HALLUCINATION ───────────────────────────────────
"Base your answer ONLY on the following context. 
If the context doesn't contain the answer, say 'Not found in context.'
Context: {context}"

# ── DEBUGGING BAD OUTPUTS ────────────────────────────────
1. Add explicit format requirements
2. Add "bad example" (show what NOT to do)
3. Add more few-shot examples
4. Lower temperature (0 = deterministic)
5. Break into smaller subtasks
6. Ask model to explain its reasoning first
7. Use tool use to force JSON output

# ── QUICK TRICKS ─────────────────────────────────────────
Longer = worse:   Remove filler. Every word should add value.
Negatives work:   "Do NOT include..." (models understand don't)
Anchoring:        Start with examples before asking
Delimiters:       Use XML tags to separate sections
                  <context>...</context><question>...</question>
Emotional appeal: "This is important for my career" - doesn't help
Personas:         "Act as X" works for style, not capability
```
