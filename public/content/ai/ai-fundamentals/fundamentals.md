# AI Fundamentals — How LLMs Actually Work

**Before you start:** this tab assumes you've read the Overview's "next-token prediction" idea (a phone keyboard guessing your next word, at a vastly bigger scale) — this page goes one level deeper into the mechanism itself, still with no prior ML/math background required.

**Analogy — what "attention" actually does.** Read this sentence: "The trophy didn't fit in the suitcase because *it* was too big." To know what "it" refers to, you unconsciously looked back at both "trophy" and "suitcase" and judged which one makes sense as "too big." **Attention** is the part of a transformer that does exactly this, automatically, for every token against every other token in the input — deciding how much each earlier word should influence the model's understanding of the current one. Stack enough of these attention passes together, alternated with some further number-crunching (feed-forward layers, below), and the model builds up a genuinely rich sense of how the words in a sentence relate to each other — not just what each word means alone.

## What an LLM Is

```
Large Language Model = Neural network trained to predict the next token

Token: Roughly a word fragment (~4 characters on average)
  "DevOps" = 1 token
  "Kubernetes" = 2-3 tokens
  GPT-4: 100 trillion parameters, trained on ~13 trillion tokens

Training: Show the model billions of documents
  → Model learns statistical patterns of language
  → It learns facts, reasoning, coding, writing styles
  → It learns relationships between concepts

Inference: Given a prompt, sample next token, append, repeat
  → Temperature 0: Always pick most likely token (deterministic)
  → Temperature 1: Sample proportionally (creative)
  → Temperature > 1: More random, less coherent
```

## The Transformer Architecture

```
Embedding layer:  Tokens → vectors (numbers representing meaning —
                  same idea as the Overview's embeddings, just used
                  internally here instead of for RAG search)
Attention heads:  Each token "attends to" other tokens (the trophy/
                  suitcase example above) — a model runs many of
                  these attention heads in parallel, each free to
                  learn a different kind of relationship (grammar,
                  reference, topic, etc.)
Feed-forward:     Further processes each token's own position,
                  independently of the others, after attention has
                  mixed in the surrounding context
Layer norm:       A rescaling step that keeps the numbers flowing
                  through the network in a stable, workable range
                  as they pass through many layers
Stack N layers:   Repeat this whole attention → feed-forward block
                  N times, each layer building a richer understanding
                  on top of the last. GPT-4 has ~96 layers

Key insight: "Attention is all you need" (2017 paper)
  Before Transformers: RNNs processed tokens sequentially
  Transformers: Process all tokens in parallel → scalable
```

## Context Window

```
Context window = max tokens the model can process at once

GPT-4:          128,000 tokens (~96,000 words)
Claude 3.5:     200,000 tokens (~150,000 words)
Gemini 1.5 Pro: 1,000,000 tokens (~750,000 words)

What fits in context:
  100K tokens ≈ 75,000 words ≈ a full novel ≈ 5,000 lines of code

Limitations:
  - Cost scales with tokens (input + output)
  - Attention gets expensive fast as context grows: doubling the
    input length roughly quadruples the attention computation
    (every token attends to every other token, so the work grows
    with the square of the length — written "O(n²)" for short),
    not just double
  - Models perform worse at very long contexts ("lost in the middle")
```

## Hallucination

```
LLMs generate plausible-sounding text, not necessarily true text.
The model doesn't "know" things — it generates tokens that fit the pattern.

Causes:
  - Training data had incorrect information
  - Model extrapolates beyond what it was trained on
  - Generating text that "sounds like" a valid answer

Mitigation:
  - RAG: Retrieve facts from a database, inject into prompt
  - Grounding: Ask model to cite sources
  - Verification: Always verify factual claims independently
  - Self-consistency: Run multiple times, check agreement
  - Fine-tuning: Train on accurate domain-specific data
```

## Types of AI Models

```
Language Models (LLM):     Text → Text
  GPT-4, Claude 3, Gemini, Llama 3, Mistral

Embedding Models:          Text → Vector (numbers)
  text-embedding-3, embed-english-v3
  Use for: semantic search, similarity, RAG retrieval

Image Generation:          Text → Image
  DALL-E 3, Midjourney, Stable Diffusion

Multimodal:               Text+Image → Text
  GPT-4V, Claude 3 (vision), Gemini

Audio:                    Audio → Text, Text → Audio
  Whisper (transcription), ElevenLabs (TTS)

Video:                    Text → Video
  Sora, Runway, Pika
```

## API Basics

```python
import anthropic

client = anthropic.Anthropic(api_key="your-key")

# Basic completion
message = client.messages.create(
    model="claude-opus-4-6",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Explain transformer attention"}]
)
print(message.content[0].text)

# Cost estimation
# Claude Opus 4.6: $15 per 1M input tokens, $75 per 1M output tokens
# Claude Sonnet 4.6: $3 per 1M input, $15 per 1M output
# 1 token ≈ 4 characters ≈ 0.75 words
# 1000 word essay ≈ 1333 tokens

# Streaming response
with client.messages.stream(
    model="claude-sonnet-4-6",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Write a haiku about Kubernetes"}]
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

## Fine-tuning vs Prompting vs RAG

```
Prompting (System prompt + few-shot examples):
  Cost: Free (just tokens)
  When: Change behavior, format, persona, style
  Limit: Can't add new knowledge beyond context window

RAG (Retrieval Augmented Generation):
  Cost: Embedding DB + retrieval infra
  When: Need up-to-date or private knowledge
  Limit: Retrieval quality determines answer quality

Fine-tuning:
  Cost: $100-$10,000+ depending on data/model size
  When: Need consistent style/format, teach specialized domain
  Limit: Static — knowledge doesn't update; overfitting risk

Rule of thumb:
  Try prompting first → if quality insufficient, try RAG
  → if still insufficient, consider fine-tuning
```
