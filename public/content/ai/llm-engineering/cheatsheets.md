# LLM Engineering Cheatsheet

## API Quick Reference

### OpenAI
```python
from openai import OpenAI
client = OpenAI()

# Chat
resp = client.chat.completions.create(
    model="gpt-4o",           # gpt-4o-mini for cheap, o1 for reasoning
    messages=[{"role": "system", "content": "..."}, {"role": "user", "content": "..."}],
    temperature=0.3, max_tokens=1000
)
text = resp.choices[0].message.content
tokens = resp.usage.total_tokens

# Embed
emb = client.embeddings.create(model="text-embedding-3-small", input="text")
vector = emb.data[0].embedding  # 1536-dim list
```

### Anthropic Claude
```python
import anthropic
client = anthropic.Anthropic()
msg = client.messages.create(
    model="claude-3-5-sonnet-20241022", max_tokens=1024,
    system="...", messages=[{"role": "user", "content": "..."}]
)
print(msg.content[0].text)
```

## Model Selection
| Task | Model | Cost |
|------|-------|------|
| Simple Q&A | gpt-4o-mini | Cheapest |
| Complex reasoning | gpt-4o | Medium |
| Long doc analysis | Claude Sonnet (200K) | Medium |
| Deep reasoning | o1, o3 | Most expensive |
| Local/private | Llama 3.1 via Ollama | Free |
| Embeddings | text-embedding-3-small | Very cheap |

## Token Math
- 1 token ≈ 0.75 words
- gpt-4o-mini: $0.15/M input, $0.60/M output
- gpt-4o: $2.50/M input, $10/M output
- text-embedding-3-small: $0.02/M tokens

## Chunking Reference
| Strategy | Chunk Size | Overlap | Best For |
|----------|-----------|---------|---------|
| Fixed | 512 tokens | 50 | Dense prose |
| Semantic | Paragraph | 0 | Structured docs |
| Recursive | 1000 chars | 100 | General purpose |
| Sentence | 1-5 sentences | 1 | Q&A |

## RAG Quality Metrics (RAGAS)
| Metric | Good | Description |
|--------|------|-------------|
| Faithfulness | > 0.9 | Answer grounded in context |
| Answer Relevancy | > 0.85 | Answer addresses question |
| Context Recall | > 0.8 | Relevant docs retrieved |
| Context Precision | > 0.7 | Retrieved docs are useful |

## Common Errors
| Error | Fix |
|-------|-----|
| 429 Rate limit | Exponential backoff: 1s, 2s, 4s, 8s + jitter |
| Context too long | Truncate chunks, reduce system prompt |
| Hallucination | Add RAG context, lower temperature |
| Slow response | Use mini model, enable streaming, cache |
| Empty output | Increase max_tokens, check stop sequences |

## Ollama Local Setup
```bash
curl https://ollama.ai/install.sh | sh
ollama pull llama3.1        # 4.7 GB
ollama pull nomic-embed-text # embeddings

# Use like OpenAI
from openai import OpenAI
client = OpenAI(base_url="http://localhost:11434/v1", api_key="ollama")
```
