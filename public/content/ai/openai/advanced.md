# OpenAI — Advanced + Cheatsheet + Interview

## Fine-Tuning

```python
# Fine-tune GPT-3.5 or GPT-4o-mini on your data
# Use when: consistent style/format, specialized domain, Claude/GPT differences

# 1. Prepare training data (JSONL format)
import json
training_data = [
    {
        "messages": [
            {"role": "system", "content": "You are a DevOps expert."},
            {"role": "user", "content": "What is a DaemonSet?"},
            {"role": "assistant", "content": "A DaemonSet ensures one pod runs on every node..."}
        ]
    },
    # Add 50-100+ examples for best results
]

with open("training.jsonl", "w") as f:
    for item in training_data:
        f.write(json.dumps(item) + "\n")

# 2. Upload training file
file = client.files.create(file=open("training.jsonl", "rb"), purpose="fine-tune")

# 3. Create fine-tuning job
job = client.fine_tuning.jobs.create(
    training_file=file.id,
    model="gpt-4o-mini-2024-07-18",
    hyperparameters={"n_epochs": 3}
)

# 4. Monitor progress
import time
while True:
    job = client.fine_tuning.jobs.retrieve(job.id)
    print(f"Status: {job.status}")
    if job.status in ["succeeded", "failed"]:
        break
    time.sleep(30)

# 5. Use fine-tuned model
response = client.chat.completions.create(
    model=job.fine_tuned_model,
    messages=[{"role": "user", "content": "Explain pod scheduling"}]
)
```

## OpenAI Cheatsheet + Interview

```python
# ── MODELS QUICK REFERENCE ────────────────────────────────
# gpt-4o:       Best multimodal, vision, fast
# gpt-4o-mini:  Cheap, fast, most tasks (recommended default)
# o1:           Slow but strong multi-step reasoning
# o1-mini:      Cheaper o1, STEM tasks
# gpt-3.5-turbo: Legacy, cheapest, use gpt-4o-mini instead

# ── API PATTERNS ──────────────────────────────────────────
# Temperature: 0=deterministic, 0.7=balanced, 1=creative
# max_tokens:  Hard limit on output length
# top_p:       0.9=nucleus sampling (use temperature OR top_p, not both)
# frequency_penalty: -2 to 2, reduce repetition (0.5 is good)
# presence_penalty: -2 to 2, encourage new topics

# ── KEY INTERVIEW QUESTIONS ───────────────────────────────
# What is the difference between GPT-4 and o1?
# GPT-4: Standard transformer, generates tokens sequentially
# o1: Uses "chain of thought" internally before responding — much better
#     at multi-step reasoning, math, coding problems but much slower/expensive

# When would you fine-tune vs use RAG?
# RAG: Dynamic data that changes, need source attribution, privacy concerns
# Fine-tune: Consistent output format, brand voice, specialized terminology
#            that the base model doesn't know, latency-critical (no retrieval step)

# What is the context window limit in practice?
# 128K tokens ≈ 100K words ≈ a full novel
# But: performance degrades for info in the middle of very long contexts
# Best practice: put most important info at start and end of context
# Use RAG to avoid stuffing everything into context
```
