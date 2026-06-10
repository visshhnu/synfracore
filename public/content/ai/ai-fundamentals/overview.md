# AI Fundamentals — From Zero to AI-Ready

Artificial Intelligence is transforming every industry. Before building AI applications, every engineer needs a clear mental model of what AI actually is, how it works, and where the boundaries lie.

## The AI Landscape

```
Artificial Intelligence (AI)
  └── Machine Learning (ML) — learns from data
        ├── Traditional ML — algorithms, features, structured data
        │     ├── Supervised (labels provided)
        │     ├── Unsupervised (no labels, find patterns)
        │     └── Reinforcement (learns from rewards)
        └── Deep Learning (DL) — neural networks
              ├── Computer Vision (CNNs)
              ├── Natural Language Processing (NLP)
              └── Large Language Models (LLMs) ← Where the industry is today
```

## How Large Language Models Work

LLMs are the technology behind ChatGPT, Claude, Gemini, and every AI assistant. Understanding them removes the "magic" and lets you build with them effectively.

### Step 1 — Tokenization
Text is split into tokens (roughly 3-4 characters each):

```
"Hello world" → ["Hello", " world"]
"DevOps" → ["Dev", "Ops"]
"Kubernetes" → ["Kub", "ernet", "es"]

1 token ≈ 4 characters ≈ 0.75 words
gpt-4 context: 128,000 tokens ≈ ~96,000 words ≈ a short novel
```

### Step 2 — Embeddings
Each token becomes a vector (list of numbers) in high-dimensional space. Similar concepts cluster together:

```
"king" → [0.2, 0.8, 0.1, ...]
"queen" → [0.3, 0.7, 0.2, ...]
"president" → [0.2, 0.8, 0.3, ...]
# These are semantically close in the embedding space

"dog" → [0.9, 0.1, 0.8, ...]
# This is far from "king" semantically
```

### Step 3 — Attention Mechanism (The "A" in Transformer)
Self-attention lets each token "look at" every other token to understand context:

```
"The bank was steep" — "bank" attends to "steep" → river bank
"The bank was closed" — "bank" attends to "closed" → financial bank

This is how LLMs understand that "it" in "The dog ate the bone because it was hungry"
refers to "dog" not "bone".
```

### Step 4 — Training
Pre-training: fed trillions of tokens from the internet, books, code. Learn to predict the next token.

Fine-tuning + RLHF: Adjusted to be helpful, harmless, and honest using human feedback.

### Step 5 — Inference
Given your prompt → model predicts the most likely next token → repeats until done:

```
Input: "The capital of France is"
Token 1: " Paris"  (probability: 0.97)
Token 2: "."       (probability: 0.89)
Token 3: <END>
```

The **temperature** controls randomness:
- `temperature=0` → always picks highest probability token (deterministic)
- `temperature=1` → sampling from probability distribution (creative)
- `temperature=2` → very random (often incoherent)

## Key Concepts Every AI Engineer Needs

### Context Window
The amount of text the model can "see" at once:
```
GPT-4o:         128,000 tokens  (~96,000 words)
Claude 3.7:     200,000 tokens  (~150,000 words)  
Gemini 1.5 Pro: 1,000,000 tokens (~750,000 words)

Practical implication: Fitting an entire codebase in context for code review
```

### Hallucination
LLMs generate plausible-sounding text — they don't "know" facts, they predict likely token sequences. They can confidently state false information.

**Mitigation strategies:**
- RAG (Retrieval Augmented Generation) — give the model actual facts
- Prompt engineering — "only answer based on the provided context"
- Output validation — verify facts programmatically
- Citation requirements — "cite your source in the document"

### Tokens, Cost & Latency
```
Provider pricing (approx, 2024):
Claude Sonnet:  $3/M input tokens,  $15/M output tokens
GPT-4o:         $5/M input tokens,  $15/M output tokens  
GPT-4o-mini:    $0.15/M input,      $0.60/M output

1M tokens ≈ 750,000 words ≈ 3 average novels

For a typical chatbot message (500 input, 200 output):
Claude Sonnet: $0.0015 + $0.003 = ~$0.005 per conversation turn
```

## Types of AI Models

### Generative AI
Creates new content (text, images, code, audio, video):
- **Text**: Claude, GPT-4, Gemini, Llama
- **Images**: DALL-E 3, Midjourney, Stable Diffusion
- **Code**: GitHub Copilot, Cursor, Claude Code
- **Audio**: ElevenLabs, Whisper (STT), TTS-1
- **Video**: Sora, Runway, Kling

### Discriminative / Classification
Classifies or predicts from existing data:
- Spam detection
- Sentiment analysis
- Medical image diagnosis
- Fraud detection

### Embedding Models
Convert text/images to vectors for search and similarity:
- `text-embedding-3-small` (OpenAI)
- `all-MiniLM-L6-v2` (sentence-transformers)
- Used in RAG, semantic search, recommendation systems

## Choosing the Right Model

```
Task                        Model Choice            Why
─────────────────────────────────────────────────────────
Simple Q&A / chatbot        GPT-4o-mini, Haiku      Cost-effective
Complex reasoning           Claude Sonnet, GPT-4o   Best capability
Code generation             Claude Sonnet, GPT-4o   Strongest coding
Long document analysis      Claude 3.7 (200K)       Largest context
Real-time / low latency     Groq (LPU hardware)     Fastest inference
Local / private data        Llama 3, Mistral        No data leaves server
Image understanding         GPT-4o, Claude 3        Multimodal
Embeddings                  text-embedding-3-small  Cheap, good quality
```

## The AI Engineering Stack

```
┌─────────────────────────────────────────────┐
│              User Interface                  │  ← Chat, API, web app
├─────────────────────────────────────────────┤
│           Orchestration Layer                │  ← LangChain, LlamaIndex
│   (chains, agents, memory, routing)          │
├─────────────────────────────────────────────┤
│         Knowledge & Retrieval                │  ← RAG, Vector DB
│   (embeddings, search, context injection)    │
├─────────────────────────────────────────────┤
│              LLM Provider                    │  ← OpenAI, Anthropic
│   (GPT-4, Claude, Gemini, Llama)            │
├─────────────────────────────────────────────┤
│         Observability & Ops                  │  ← LangSmith, LLMOps
│   (tracing, eval, cost, latency)            │
└─────────────────────────────────────────────┘
```

## Quick Python Start

```python
# Install: pip install anthropic openai
import anthropic

client = anthropic.Anthropic()

# Basic call
message = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Explain Kubernetes in 2 sentences."}
    ]
)
print(message.content[0].text)

# With system prompt
message = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=1024,
    system="You are a senior DevOps engineer. Give concise, production-quality answers.",
    messages=[
        {"role": "user", "content": "What is the best way to manage Kubernetes secrets?"}
    ]
)

# Streaming (for real-time responses)
with client.messages.stream(
    model="claude-sonnet-4-20250514",
    max_tokens=1000,
    messages=[{"role": "user", "content": "Write a Dockerfile for a Python app"}]
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

## Interview Questions

**What is the difference between AI, ML, and Deep Learning?**
AI is the broad field of making machines intelligent. ML is a subset where systems learn from data rather than being explicitly programmed. Deep Learning is a subset of ML using neural networks with many layers — it's what powers modern LLMs, computer vision, and speech recognition. Think of it as concentric circles: AI ⊃ ML ⊃ Deep Learning ⊃ LLMs.

**What is temperature in LLMs and when would you set it to 0?**
Temperature controls the randomness of token selection. At temperature=0, the model always picks the most probable next token — responses are deterministic and consistent. Set temperature=0 for: data extraction, classification, code generation, anything where you need reproducible results. Use higher temperature (0.7-1.0) for creative writing, brainstorming, generating varied responses. Most production applications use low temperature (0-0.3) for reliability.
