# AI & Machine Learning Engineering

Artificial Intelligence is transforming software engineering. As a developer or DevOps engineer today, you need to understand how to build with AI — calling APIs, building RAG systems, deploying models, and monitoring AI in production.

## How a Large Language Model Works

```svg
<svg viewBox="0 0 720 300" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Title -->
  <text x="360" y="28" font-size="14" fill="#A78BFA" text-anchor="middle" font-weight="800">LLM Inference: How Text Generation Works</text>

  <!-- Input -->
  <rect x="10" y="44" width="160" height="56" rx="10" fill="#1E3A5F" stroke="#3B82F6" stroke-width="2"/>
  <text x="90" y="67" font-size="11" fill="#93C5FD" text-anchor="middle" font-weight="700">Your Prompt</text>
  <text x="90" y="84" font-size="10" fill="#60A5FA" text-anchor="middle">"What is Docker?"</text>
  <text x="90" y="97" font-size="9" fill="#3B82F6" text-anchor="middle">Tokenized → numbers</text>

  <!-- Arrow -->
  <line x1="170" y1="72" x2="196" y2="72" stroke="#6B7280" stroke-width="1.5" marker-end="url(#a1)"/>
  <defs><marker id="a1" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#6B7280"/></marker></defs>

  <!-- Transformer blocks -->
  <rect x="196" y="40" width="310" height="64" rx="10" fill="#2D1B69" stroke="#8B5CF6" stroke-width="2"/>
  <text x="351" y="64" font-size="12" fill="#C4B5FD" text-anchor="middle" font-weight="800">Transformer Neural Network</text>
  <text x="235" y="84" font-size="9" fill="#A78BFA" text-anchor="middle">Attention</text>
  <text x="295" y="84" font-size="9" fill="#A78BFA" text-anchor="middle">Feed-Forward</text>
  <text x="370" y="84" font-size="9" fill="#A78BFA" text-anchor="middle">Layer Norm</text>
  <text x="440" y="84" font-size="9" fill="#A78BFA" text-anchor="middle">96+ Layers</text>
  <rect x="210" y="73" width="72" height="22" rx="5" fill="#4C1D95" opacity="0.5"/>
  <rect x="270" y="73" width="95" height="22" rx="5" fill="#4C1D95" opacity="0.5"/>
  <rect x="345" y="73" width="80" height="22" rx="5" fill="#4C1D95" opacity="0.5"/>
  <rect x="415" y="73" width="75" height="22" rx="5" fill="#4C1D95" opacity="0.5"/>

  <!-- Arrow -->
  <line x1="506" y1="72" x2="532" y2="72" stroke="#6B7280" stroke-width="1.5" marker-end="url(#a1)"/>

  <!-- Output -->
  <rect x="532" y="44" width="160" height="56" rx="10" fill="#064E3B" stroke="#10B981" stroke-width="2"/>
  <text x="612" y="67" font-size="11" fill="#6EE7B7" text-anchor="middle" font-weight="700">Next Token</text>
  <text x="612" y="84" font-size="10" fill="#34D399" text-anchor="middle">"Docker" → probability</text>
  <text x="612" y="97" font-size="9" fill="#10B981" text-anchor="middle">Sample → repeat 1000x</text>

  <!-- Token → Text loop -->
  <path d="M 692 100 Q 720 130 692 160" fill="none" stroke="#F59E0B" stroke-width="1.5" stroke-dasharray="4,2"/>
  <text x="726" y="132" font-size="9" fill="#F59E0B" text-anchor="middle">repeat</text>

  <!-- Parameters explanation -->
  <rect x="10" y="130" width="700" height="68" rx="10" fill="#0F172A" stroke="#374151" stroke-width="1"/>
  <text x="370" y="152" font-size="12" fill="#9CA3AF" text-anchor="middle" font-weight="700">What "Parameters" Actually Means</text>
  <text x="180" y="172" font-size="10" fill="#6B7280" text-anchor="middle">GPT-4: ~1.8T params</text>
  <text x="370" y="172" font-size="10" fill="#6B7280" text-anchor="middle">Claude 3: hundreds of B params</text>
  <text x="560" y="172" font-size="10" fill="#6B7280" text-anchor="middle">Llama 3.1 8B: 8 billion params</text>
  <text x="370" y="188" font-size="9" fill="#4B5563" text-anchor="middle">Each parameter is a floating point number. Trained on billions of tokens to encode patterns of language, facts, and reasoning.</text>

  <!-- Key concepts bar -->
  <rect x="10" y="216" width="108" height="72" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="64" y="238" font-size="10" fill="#93C5FD" text-anchor="middle" font-weight="700">Temperature</text>
  <text x="64" y="256" font-size="9" fill="#60A5FA" text-anchor="middle">0 = deterministic</text>
  <text x="64" y="270" font-size="9" fill="#60A5FA" text-anchor="middle">1 = creative</text>
  <text x="64" y="282" font-size="9" fill="#3B82F6" text-anchor="middle">&gt;1 = random</text>

  <rect x="126" y="216" width="108" height="72" rx="8" fill="#064E3B" stroke="#10B981" stroke-width="1"/>
  <text x="180" y="238" font-size="10" fill="#6EE7B7" text-anchor="middle" font-weight="700">Context Window</text>
  <text x="180" y="256" font-size="9" fill="#34D399" text-anchor="middle">Max tokens in/out</text>
  <text x="180" y="270" font-size="9" fill="#34D399" text-anchor="middle">Claude: 200K tokens</text>
  <text x="180" y="282" font-size="9" fill="#10B981" text-anchor="middle">≈ 150K words</text>

  <rect x="242" y="216" width="108" height="72" rx="8" fill="#2D1B69" stroke="#8B5CF6" stroke-width="1"/>
  <text x="296" y="238" font-size="10" fill="#C4B5FD" text-anchor="middle" font-weight="700">Tokens</text>
  <text x="296" y="256" font-size="9" fill="#A78BFA" text-anchor="middle">~4 chars each</text>
  <text x="296" y="270" font-size="9" fill="#A78BFA" text-anchor="middle">1K tokens ≈ 750</text>
  <text x="296" y="282" font-size="9" fill="#8B5CF6" text-anchor="middle">words</text>

  <rect x="358" y="216" width="108" height="72" rx="8" fill="#78350F" stroke="#F59E0B" stroke-width="1"/>
  <text x="412" y="238" font-size="10" fill="#FDE68A" text-anchor="middle" font-weight="700">Hallucination</text>
  <text x="412" y="256" font-size="9" fill="#FCD34D" text-anchor="middle">Confident wrong</text>
  <text x="412" y="270" font-size="9" fill="#FCD34D" text-anchor="middle">answers. Fix with</text>
  <text x="412" y="282" font-size="9" fill="#F59E0B" text-anchor="middle">RAG + grounding</text>

  <rect x="474" y="216" width="108" height="72" rx="8" fill="#1C1917" stroke="#78716C" stroke-width="1"/>
  <text x="528" y="238" font-size="10" fill="#D6D3D1" text-anchor="middle" font-weight="700">Fine-tuning</text>
  <text x="528" y="256" font-size="9" fill="#A8A29E" text-anchor="middle">Update weights on</text>
  <text x="528" y="270" font-size="9" fill="#A8A29E" text-anchor="middle">your data. Costly</text>
  <text x="528" y="282" font-size="9" fill="#78716C" text-anchor="middle">but powerful</text>

  <rect x="590" y="216" width="120" height="72" rx="8" fill="#0C4A6E" stroke="#0284C7" stroke-width="1"/>
  <text x="650" y="238" font-size="10" fill="#7DD3FC" text-anchor="middle" font-weight="700">Embeddings</text>
  <text x="650" y="256" font-size="9" fill="#38BDF8" text-anchor="middle">Text → numbers</text>
  <text x="650" y="270" font-size="9" fill="#38BDF8" text-anchor="middle">for similarity</text>
  <text x="650" y="282" font-size="9" fill="#0284C7" text-anchor="middle">search (RAG)</text>
</svg>
```

## The AI Stack for Engineers

```svg
<svg viewBox="0 0 720 260" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Stack layers (bottom to top) -->
  <rect x="10" y="210" width="700" height="40" rx="8" fill="#1F2937" stroke="#6B7280" stroke-width="1.5"/>
  <text x="360" y="235" font-size="12" fill="#9CA3AF" text-anchor="middle" font-weight="700">Foundation Models (GPT-4, Claude 3, Gemini, Llama 3, Mistral)</text>

  <rect x="10" y="162" width="700" height="40" rx="8" fill="#064E3B" stroke="#10B981" stroke-width="1.5"/>
  <text x="360" y="185" font-size="12" fill="#34D399" text-anchor="middle" font-weight="700">Model APIs (Anthropic API, OpenAI API, Bedrock, Vertex AI)</text>
  <text x="360" y="198" font-size="9" fill="#6EE7B7" text-anchor="middle">Pay per token · No infrastructure management · Easy to start</text>

  <rect x="10" y="114" width="700" height="40" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1.5"/>
  <text x="360" y="137" font-size="12" fill="#93C5FD" text-anchor="middle" font-weight="700">AI Frameworks (LangChain, LlamaIndex, CrewAI, AutoGen)</text>
  <text x="360" y="150" font-size="9" fill="#60A5FA" text-anchor="middle">Chains · Agents · RAG pipelines · Tool use · Memory</text>

  <rect x="10" y="66" width="700" height="40" rx="8" fill="#2D1B69" stroke="#8B5CF6" stroke-width="1.5"/>
  <text x="360" y="89" font-size="12" fill="#C4B5FD" text-anchor="middle" font-weight="700">Vector Databases (Pinecone, Chroma, Weaviate, pgvector)</text>
  <text x="360" y="102" font-size="9" fill="#A78BFA" text-anchor="middle">Store embeddings · Semantic search · RAG retrieval</text>

  <rect x="10" y="18" width="700" height="40" rx="8" fill="#78350F" stroke="#F59E0B" stroke-width="1.5"/>
  <text x="360" y="41" font-size="12" fill="#FDE68A" text-anchor="middle" font-weight="700">LLMOps (LangSmith, Weights &amp; Biases, Arize, MLflow)</text>
  <text x="360" y="54" font-size="9" fill="#FCD34D" text-anchor="middle">Tracing · Evaluation · Cost tracking · A/B testing · Monitoring</text>
</svg>
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
