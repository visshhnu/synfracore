# AI & Machine Learning Engineering

> **Build with AI: APIs, retrieval, agents, and production LLM systems**

**Category:** AI / Machine Learning
**Learning Path:** What → How It Works → Learning Modules → Building With AI

**Before you start:** no prior AI/ML background is required — this is the entry point for the whole AI academy. Basic comfort reading code (any language) helps for the later Python examples, but isn't required to follow the concepts.

---

## What Is a Large Language Model, Really?

Think of your phone's keyboard suggesting the next word as you type — it learned, from your own past messages, that "see you" is probably followed by "soon." A **Large Language Model (LLM)** — the technology behind tools like ChatGPT and Claude — does the exact same thing at a vastly larger scale: predict the next **token** (a chunk of text, usually a few characters — not always a whole word), then treat its own guess as new input and predict the next one after that, thousands of times in a row to write whole paragraphs. It learned this by reading a staggering slice of public text rather than just your messages, but the underlying trick — guess the most likely next piece of text, one piece at a time — is the same.

That single idea explains almost everything else on this page. An LLM doesn't "look things up" or "know facts" the way a database does — it's an extremely well-read pattern-predictor. That's exactly why it can state a confident, fluent, completely wrong answer just as smoothly as a correct one (called **hallucination** — the model is still just predicting plausible-sounding text, not checking a fact against a source), and exactly why handing it real documents to read from first (a technique called **RAG**, covered below) makes it far more reliable.

## How Text Generation Actually Works

```flow
{
  "title": "LLM Inference: How Text Generation Works",
  "layout": "flow",
  "steps": [
    { "label": "Your Prompt", "sublabel": "\"What is Docker?\"", "detail": "Tokenized → numbers", "color": "blue" },
    { "label": "Transformer Neural Network", "sublabel": "Attention · Feed-Forward · Layer Norm · 96+ Layers", "color": "purple" },
    { "label": "Next Token", "sublabel": "\"Docker\" → probability", "detail": "Sample → repeat 1000x", "color": "green" }
  ]
}
```

Inside the model, a **parameter** is a single adjustable number — think of it as one dial among billions. During **training** (showing the model huge amounts of text and nudging every dial slightly whenever its next-token guess was wrong), those billions of dials gradually settle into values that, together, encode patterns of language, facts, and reasoning. GPT-4 has roughly 1.8 trillion of these parameters; Claude 3 has hundreds of billions; Llama 3.1 8B has 8 billion — more parameters generally means more capacity to encode nuance, at the cost of more compute to run.

```conceptgrid
{
  "boxes": [
    { "title": "Temperature", "description": "How random the next-token pick is: 0 = always the single most likely token (same input, same output every time), 1 = natural variety, >1 = increasingly random", "color": "blue" },
    { "title": "Context Window", "description": "The max text the model can read + write in one go, measured in tokens. Claude: 200K tokens ≈ 150K words", "color": "green" },
    { "title": "Tokens", "description": "The chunks of text a model actually reads/writes, not whole words — ~4 characters each. 1K tokens ≈ 750 words", "color": "purple" },
    { "title": "Hallucination", "description": "A confident, fluent, wrong answer — the model predicting plausible text, not checking a fact. Fixed by RAG + grounding (below)", "color": "amber" },
    { "title": "Fine-tuning", "description": "Training the model further on your own data, adjusting its parameters directly. Costly but powerful for teaching a specific style or task", "color": "slate" },
    { "title": "Embeddings", "description": "Converting text into a list of numbers that captures its meaning, so a computer can measure how similar two pieces of text are — what RAG's retrieval step (below) actually searches over", "color": "cyan" }
  ]
}
```

## The AI Stack for Engineers

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "LLMOps", "sublabel": "LangSmith, Weights & Biases, Arize, MLflow", "detail": "Tracing · Evaluation · Cost tracking · A/B testing · Monitoring", "color": "amber" },
    { "label": "Vector Databases", "sublabel": "Pinecone, Chroma, Weaviate, pgvector", "detail": "Store embeddings · Semantic search · RAG retrieval", "color": "purple" },
    { "label": "AI Frameworks", "sublabel": "LangChain, LlamaIndex, CrewAI, AutoGen", "detail": "Chains · Agents · RAG pipelines · Tool use · Memory", "color": "blue" },
    { "label": "Model APIs", "sublabel": "Anthropic API, OpenAI API, Bedrock, Vertex AI", "detail": "Pay per token · No infrastructure management · Easy to start", "color": "green" },
    { "label": "Foundation Models", "sublabel": "GPT-4, Claude 3, Gemini, Llama 3, Mistral", "color": "slate" }
  ]
}
```

## Calling the Anthropic API

```python
import anthropic

client = anthropic.Anthropic()  # Uses ANTHROPIC_API_KEY env var

# Simple completion
message = client.messages.create(
    model="claude-opus-4-6",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Explain Docker in 3 sentences."}
    ]
)
print(message.content[0].text)
```

:::tip Cost Estimation
Claude Sonnet: **$3 per 1M input tokens, $15 per 1M output tokens**

1,000 word essay ≈ 1,300 tokens ≈ **$0.004** to generate.
For most applications, AI API costs are surprisingly low.
:::

## RAG vs Fine-Tuning — When to Use Each

**RAG (Retrieval-Augmented Generation)** is the "handing it real documents to read first" idea from above, made concrete: before answering, the system searches a store of your own real documents (using embeddings, defined above, to find the most relevant ones) and hands the model those documents as extra context — so it's predicting the next token while looking at actual source material instead of only its trained-in memory. This is different from fine-tuning, which changes the model's parameters themselves rather than what it's shown at answer time:

| | RAG | Fine-Tuning |
|---|---|---|
| **Updates knowledge** | Yes — just re-index | No — must retrain |
| **Private data** | Yes | Yes |
| **Latency** | Slightly higher (retrieval step) | Same as base model |
| **Cost** | Retrieval infra | Training compute |
| **Best for** | Current info, citations, Q&A | Style, format, specialized tasks |

:::info Start Simple
For 90% of use cases: **Prompt Engineering first → RAG if you need private/current data → Fine-tuning only if still insufficient**. Most teams over-engineer this.
:::
