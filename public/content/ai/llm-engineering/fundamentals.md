# LLM Engineering Fundamentals

## What LLM Engineers Build
LLM engineers build production applications on top of Large Language Models. The core work is not training models — it is building reliable, fast, cost-effective pipelines that use pre-trained models via API.

## Core API Interaction Pattern
```python
from openai import OpenAI
client = OpenAI()

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Explain PDGM home health coding in 3 bullet points."}
    ],
    temperature=0.3,
    max_tokens=500,
)
answer = response.choices[0].message.content
cost_input = response.usage.prompt_tokens / 1e6 * 0.15
cost_output = response.usage.completion_tokens / 1e6 * 0.60
```

## Key Parameters
| Parameter | What It Does | Good Defaults |
|-----------|-------------|--------------|
| temperature | Randomness (0=deterministic) | 0.2 for facts, 0.7 for creative |
| max_tokens | Max output length | 500-2000 depending on task |
| top_p | Alternative sampling | Usually leave at 1.0 |
| frequency_penalty | Reduce repetition | 0.3-0.5 for long outputs |

## Tokens — What They Are
One token is roughly 0.75 words. Pricing is per token. Count tokens before sending:
```python
import tiktoken
enc = tiktoken.encoding_for_model("gpt-4o")
count = len(enc.encode(your_text))
```

## Prompt Template Pattern
```python
def build_prompt(context: str, question: str, role: str = "assistant") -> str:
    return f"""You are a {role}.

Use ONLY the context below to answer. If the answer is not in the context, say "I don't know."

Context:
{context}

Question: {question}

Answer:"""
```

## RAG — Retrieval Augmented Generation
The most important pattern in LLM engineering. Instead of relying on the model's training data, you retrieve relevant documents first and include them in the prompt.

```
User question → Embed question → Search vector DB → Retrieve top-K chunks
→ Add chunks to prompt → LLM answers from retrieved context
```

```python
# Simple RAG example
from openai import OpenAI
client = OpenAI()

def embed(text):
    return client.embeddings.create(
        model="text-embedding-3-small", input=text
    ).data[0].embedding

def rag_query(question, vectordb):
    q_emb = embed(question)
    chunks = vectordb.search(q_emb, top_k=5)
    context = "

".join(c.text for c in chunks)
    prompt = build_prompt(context, question)
    return client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}]
    ).choices[0].message.content
```

## Basic Evaluation
Always measure your RAG before shipping:
- **Faithfulness**: Does the answer match the retrieved context?
- **Relevancy**: Does the answer address the question?
- **Groundedness**: No hallucinated facts?

```python
# Simple faithfulness check
def check_faithfulness(answer, context, llm):
    verdict = llm.invoke(
        f"Does this answer only use information from the context? "
        f"Context: {context} Answer: {answer}. "
        f"Reply YES or NO and why."
    )
    return verdict
```

## Chunking — Splitting Documents
How you split documents affects RAG quality significantly.

```python
from langchain.text_splitter import RecursiveCharacterTextSplitter

splitter = RecursiveCharacterTextSplitter(
    chunk_size=512,        # tokens per chunk
    chunk_overlap=50,      # overlap to preserve context
    separators=["

", "
", ".", " "]
)
chunks = splitter.split_documents(documents)
```

## First 30-Day Learning Path
1. Week 1: OpenAI/Anthropic API basics, prompt engineering fundamentals
2. Week 2: Build a simple RAG pipeline with LangChain + Chroma
3. Week 3: Evaluation metrics, cost optimisation, streaming
4. Week 4: Deploy a real endpoint, add monitoring with LangSmith
