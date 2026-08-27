# AI & Machine Learning Engineering

Artificial Intelligence is transforming software engineering. As a developer or DevOps engineer today, you need to understand how to build with AI — calling APIs, building RAG systems, deploying models, and monitoring AI in production.

## How a Large Language Model Works

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

Each parameter is a floating point number, adjusted during training on billions of tokens to encode patterns of language, facts, and reasoning. GPT-4 has roughly 1.8 trillion parameters; Claude 3 has hundreds of billions; Llama 3.1 8B has 8 billion — more parameters generally means more capacity to encode nuance, at the cost of more compute to run.

```conceptgrid
{
  "boxes": [
    { "title": "Temperature", "description": "0 = deterministic, 1 = creative, >1 = random", "color": "blue" },
    { "title": "Context Window", "description": "Max tokens in/out. Claude: 200K tokens ≈ 150K words", "color": "green" },
    { "title": "Tokens", "description": "~4 characters each. 1K tokens ≈ 750 words", "color": "purple" },
    { "title": "Hallucination", "description": "Confident wrong answers. Fix with RAG + grounding", "color": "amber" },
    { "title": "Fine-tuning", "description": "Update weights on your data. Costly but powerful", "color": "slate" },
    { "title": "Embeddings", "description": "Text → numbers for similarity search (RAG)", "color": "cyan" }
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
