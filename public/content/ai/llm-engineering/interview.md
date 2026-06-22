# AI Engineering Interview Questions

## LLMs and Prompt Engineering

**Q: What is a Large Language Model (LLM)? How does it work?**

An LLM is a neural network trained on massive text datasets to predict the next token (word piece) given previous tokens. This simple objective at scale produces models that can reason, code, and converse.

**Architecture:** Transformer with self-attention.
Key components:
- **Tokenizer**: Converts text to token IDs (GPT-4 uses ~100K vocab tokens)
- **Embeddings**: Map token IDs to dense vectors
- **Transformer blocks**: Self-attention + feed-forward layers stacked (GPT-4: ~96 layers)
- **Output head**: Predicts probability distribution over next token

**Inference:** Input tokens → forward pass → softmax → sample or argmax next token → repeat (autoregressive generation).

**Key parameters affecting output:**
- **Temperature** (0-2): 0 = deterministic, 1 = normal, 2 = very creative/random
- **Top-p (nucleus sampling)**: Only consider tokens comprising top p% of probability mass
- **Max tokens**: Maximum output length
- **System prompt**: Persistent instructions for the model's behaviour

---

**Q: What is RAG (Retrieval Augmented Generation)? Why is it used?**

RAG combines LLMs with a retrieval system to answer questions using real, up-to-date, private documents — solving LLMs' key limitations:
- **Knowledge cutoff**: LLMs don't know recent events
- **Hallucination**: LLMs invent facts when uncertain
- **Private data**: LLMs can't access your company's documents

**RAG Pipeline:**

```
User Query → [Embedding Model] → Query Vector
                                      ↓
          [Vector Database] → Retrieve top-k similar chunks
                                      ↓
[LLM] ← Query + Retrieved Context → [Prompt Assembly]
  ↓
Answer (grounded in retrieved documents)
```

**Key components:**
1. **Document ingestion**: Load → chunk → embed → store in vector DB
2. **Retrieval**: Embed query → similarity search → retrieve chunks
3. **Augmentation**: Inject retrieved chunks into LLM prompt
4. **Generation**: LLM answers based on retrieved context

**Vector databases:** Pinecone, Weaviate, Qdrant, ChromaDB, pgvector.

---

**Q: Explain embedding models and vector similarity.**

**Embedding model**: Converts text/data into dense numerical vectors where semantic similarity = vector proximity.

```python
# Example: Sentence embeddings
"Dog barks"          → [0.2, -0.1, 0.8, ...]  # 1536-dim vector
"Cat meows"          → [0.2, -0.1, 0.7, ...]  # Similar vector
"Stock market drops" → [-0.5, 0.3, -0.2, ...] # Very different vector
```

**Similarity metrics:**
- **Cosine similarity**: Angle between vectors (most common for text). Range -1 to 1.
- **Dot product**: Unnormalised similarity (faster, used in FAISS)
- **Euclidean distance**: Physical distance (less common for text)

**Popular embedding models:**
- OpenAI `text-embedding-3-small` / `text-embedding-3-large`
- Sentence-transformers (open-source): `all-MiniLM-L6-v2`, `bge-large-en`
- Cohere Embed
- Nomic `nomic-embed-text` (runs locally with Ollama)

---

**Q: What is an AI Agent? How is it different from a simple LLM call?**

A simple LLM call: single query → single response.

An AI agent: LLM that can **reason, plan, and take actions** using tools, iterating until a goal is achieved.

**Agent loop (ReAct pattern: Reason + Act):**
```
User: "Research the top 3 competitors of Tesla and summarise their EV strategies"
  ↓
LLM: "I need to search the web for this. Action: search('Tesla competitors EV')"
  ↓
Tool executes → returns results
  ↓
LLM: "I have info about BYD and Rivian. I need more on VW. Action: search('VW EV strategy 2024')"
  ↓
Tool executes → returns results
  ↓
LLM: "I now have enough info. Final answer: BYD focuses on..."
```

**Key components:**
- **LLM** (brain): Reasoning and planning
- **Tools**: Functions the agent can call (search, code execution, API calls, database)
- **Memory**: Short-term (conversation) + Long-term (vector DB)
- **Orchestrator**: LangChain, LangGraph, AutoGen, CrewAI

---

**Q: What is LangChain? When would you use it?**

LangChain is a framework for building LLM applications — chains of components (prompt → LLM → parser) and agents with tools.

**Core abstractions:**
```python
# Basic chain
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate

llm = ChatOpenAI(model="gpt-4o-mini")
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant."),
    ("human", "{input}")
])
chain = prompt | llm  # Pipe operator chains components
result = chain.invoke({"input": "What is RAG?"})

# RAG chain
from langchain_community.vectorstores import Qdrant
from langchain.chains import RetrievalQA

vectorstore = Qdrant.from_texts(texts, embedding_model)
retriever = vectorstore.as_retriever(search_kwargs={"k": 4})
qa_chain = RetrievalQA.from_chain_type(llm=llm, retriever=retriever)
result = qa_chain.invoke({"query": "What does our API documentation say about authentication?"})
```

**LangGraph**: For stateful, multi-step agents with cycles (e.g., agents that can loop until satisfied).

---

**Q: Explain LLM evaluation. How do you measure RAG quality?**

LLM outputs are hard to evaluate automatically. Key metrics:

**RAG-specific metrics (RAGAS framework):**
- **Faithfulness**: Does answer stay true to retrieved context? (no hallucinations)
- **Answer Relevance**: Does answer actually address the question?
- **Context Recall**: Did retrieval find all relevant information?
- **Context Precision**: Was retrieved context relevant (no noise)?

**General LLM metrics:**
- **Factuality**: Are stated facts correct? (requires ground truth)
- **Coherence**: Is the response logically structured?
- **Helpfulness**: Does it solve the user's actual need? (often requires human eval)
- **Safety**: Does it avoid harmful content?

**Evaluation approaches:**
1. **LLM-as-judge**: Use GPT-4 to evaluate another model's output (cheap, scalable)
2. **Human evaluation**: Gold standard but expensive (use for key benchmarks)
3. **Automated metrics**: BLEU, ROUGE, BERTScore (useful for structured tasks)

---

**Q: What is fine-tuning? When should you fine-tune vs use RAG?**

**Fine-tuning**: Training a pre-trained model on your specific dataset to adjust its weights.

| | RAG | Fine-tuning |
|---|---|---|
| Purpose | Access new/private knowledge | Change model behaviour/style |
| When | Up-to-date info, large knowledge base | Consistent format, specific domain expertise |
| Cost | Low (vector DB + retrieval) | High (GPU training time) |
| Maintenance | Update vector DB when data changes | Retrain when behaviour needs updating |
| Best for | FAQ bots, document Q&A, search | Code completion, specific task models, style |

**Rule of thumb**: Try RAG first. Fine-tune only when RAG consistently fails for your use case.

**PEFT methods (Parameter-Efficient Fine-Tuning):**
- **LoRA** (Low-Rank Adaptation): Train small adapter matrices instead of full model weights
- **QLoRA**: Quantised LoRA — fine-tune 4-bit quantised models (runs on smaller GPUs)

---

**Q: How do you deploy and serve LLMs in production?**

**Options by scale:**

**Small scale / internal:**
- Ollama: Run open-source models locally (Llama 3, Mistral, Qwen)
- vLLM: Efficient inference server with PagedAttention (2-4x throughput vs naive)

**Medium scale:**
- AWS Bedrock / Azure OpenAI: Managed API, no infra management
- GCP Vertex AI: Google's hosted models + fine-tuning

**Large scale / custom:**
- vLLM on GPU cluster with Kubernetes
- TGI (Text Generation Inference) — HuggingFace's inference server
- Ray Serve for distributed inference

**Production considerations:**
- **Latency**: First token latency (TTFT) + tokens per second. Users tolerate ~500ms TTFT.
- **Cost**: Token pricing × usage. Cache common prompts.
- **Monitoring**: Track latency, token usage, error rate, and response quality
- **Guardrails**: Input/output filtering (Llama Guard, OpenAI moderation API, custom classifiers)
- **Observability**: LangSmith, Langfuse, Arize Phoenix for LLM traces

## Revision Notes
```
LLM: Transformer trained to predict next token. Temperature controls randomness.

RAG PIPELINE:
Ingest: load → chunk → embed → store in vector DB
Query: embed → similarity search → retrieve → augment prompt → generate

EMBEDDING: text → vector. Cosine similarity for retrieval. Models: text-embedding-3, nomic-embed.

AGENT: LLM + tools + memory + loop until goal achieved
Frameworks: LangChain (chains), LangGraph (stateful agents), CrewAI (multi-agent)

EVALUATION:
RAG: Faithfulness (no hallucination) + Relevance + Context Recall + Precision
Methods: LLM-as-judge (scalable) | Human eval (gold standard) | RAGAS framework

FINE-TUNING vs RAG:
RAG: new/changing knowledge, large knowledge base → try first
Fine-tune: behaviour/style change, consistent format → expensive, use when RAG fails
LoRA/QLoRA: efficient fine-tuning without full weight update

DEPLOYMENT:
Ollama: local | vLLM: production GPU | Bedrock/Azure OpenAI: managed
Monitor: latency, token usage, quality | Guardrails: content filtering
```
