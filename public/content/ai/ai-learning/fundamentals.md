# AI Learning — Fundamentals

## AI Is Not Just a Chatbot

When most people say "AI" they mean ChatGPT or Gemini — conversational bots. That's one small application. Artificial Intelligence covers machine learning, deep learning, computer vision, NLP, reinforcement learning, and large language models — each has been transforming industries for years before ChatGPT made it visible to everyone.

| AI Branch | What it does | Real application |
|---|---|---|
| Machine Learning | Learns patterns from data to make predictions | Fraud detection, medical diagnosis, recommendations |
| Deep Learning | Multi-layer neural networks for complex patterns | Image recognition, speech-to-text, translation |
| NLP | Understanding and generating human language | Chatbots, document summarisation, sentiment analysis |
| Computer Vision | Understanding images and video | Face recognition, defect detection, self-driving |
| LLMs | Large Language Models — predict next token in text | ChatGPT, Claude, Gemini, GitHub Copilot |
| Generative AI | Creates new content — text, images, code, audio | Midjourney, DALL-E, Stable Diffusion |
| Reinforcement Learning | Learns by trial and error with rewards | AlphaGo, robotics, RLHF for LLMs |
| MLOps | Running ML models in production reliably | Model serving, monitoring, retraining pipelines |

## How LLMs Actually Work

A Large Language Model is a neural network with billions of parameters trained to predict what token (word fragment) comes next. Training ingests trillions of tokens from the internet and books, adjusting billions of parameters to predict better — the result is a model that has compressed human written knowledge into its weights.

**The 3-stage training process:**
- **Pre-training** — raw internet text, predict next tokens. Billions of examples, weeks on thousands of GPUs, $50M-100M for frontier models.
- **Instruction Tuning (SFT)** — fine-tune on human-written Q&A pairs. Teaches the model to answer helpfully, not just autocomplete.
- **RLHF** — humans rank model responses. A reward model learns human preferences, and the LLM is trained via reinforcement learning to score higher against it. This is what makes Claude/GPT behave as assistants rather than raw autocomplete engines.

**Why LLMs hallucinate:** LLMs don't look things up — they predict plausible-sounding text based on patterns. For frequent training-data topics this is reliable; for obscure facts, recent events, or specific numbers they generate confident-sounding wrong answers. The fix is Retrieval-Augmented Generation (RAG), grounding answers in real documents rather than the model's own memorized weights.

**Key concepts:**
- **Context window** — how much text the model processes at once (4K to 2M tokens). Larger context is more expensive but lets the model reason over more data.
- **Temperature** — 0 means deterministic (always the same answer); 1+ means creative and varied. Use 0 for code generation, ~0.7 for creative writing.
- **Embeddings** — convert text to vectors where similar meaning produces similar vectors, used for semantic search and RAG retrieval.
- **Tokens** — roughly 1 token ≈ 4 characters. Pricing is per token; a word like "tokenisation" is typically 2-3 tokens.

## MLOps — Running ML in Production

MLOps is DevOps for machine learning — existing DevOps skills transfer directly, just applied to a different artifact (a model instead of an application binary).

| DevOps concept | MLOps equivalent |
|---|---|
| Code version control | Model + dataset versioning (DVC, MLflow) |
| CI/CD pipeline | ML pipeline: data → train → evaluate → register → deploy |
| Container registry | Model registry (MLflow, Hugging Face Hub) |
| Kubernetes deployment | Model serving on K8s (KServe, Triton, vLLM) |
| Application monitoring | Model monitoring: accuracy drift, data drift, bias |
| A/B testing | Champion/challenger model testing |
| Rollback | Model version rollback if performance drops |

**MLOps tools stack:**
- **MLflow** (experiment tracking) — logs parameters, metrics, and artifacts; compares runs; registers models. Open-source, runs anywhere.
- **Kubeflow** (ML pipelines on K8s) — Kubernetes-native ML workflows where each pipeline step is a container.
- **Hugging Face** (model hub) — the "GitHub for ML models," 500K+ pre-trained models, fine-tune and deploy directly.
- **vLLM** (LLM serving) — high-throughput inference serving Llama, Mistral, Qwen at 10-20x speed versus naive serving; essential for production LLM deployment on K8s.
- **Evidently** (model monitoring) — data drift detection, model quality metrics, visual dashboards.
- **Ray** (distributed ML) — scales training and serving across machines via Ray Train + Ray Serve.

## RAG — Give LLMs Your Data

Raw LLMs only know their training data. RAG lets them answer questions about your own documents — internal wikis, runbooks, codebase, customer data — by retrieving relevant content at query time.

**How RAG works:**
1. **Index** — split documents into chunks, convert each to an embedding vector, store in a vector database (Pinecone, ChromaDB, pgvector).
2. **Retrieve** — a user's question is converted to an embedding, the most similar chunks are found, and the top-K are retrieved.
3. **Generate** — the retrieved chunks plus the question are sent to the LLM, producing an answer grounded in your actual documents.

```python
from langchain.vectorstores import Chroma
from langchain.embeddings import OpenAIEmbeddings
from langchain.chains import RetrievalQA

vectordb = Chroma.from_documents(docs, OpenAIEmbeddings())
qa = RetrievalQA.from_chain_type(
    llm=llm,
    retriever=vectordb.as_retriever(search_kwargs={"k": 4})
)
result = qa.run("What is the alarm resync procedure?")
```

**DevOps RAG use cases:** a runbook assistant that answers questions from your actual runbooks; an incident assistant that ingests recent alerts and logs to suggest a probable root cause; code review that retrieves your team's coding standards and checks new code against them; a security policy checker that checks infrastructure configs against compliance policies.

## AI Agents — Autonomous Action

A chatbot responds; an AI agent executes tasks by calling tools, making decisions, and taking multi-step actions autonomously. Components: an LLM (the "brain"), tools (what it can call), memory (context), and planning.

- **Incident Response Agent** — an alert fires, the agent queries the metrics API, checks recent deployments, searches runbooks, posts analysis to Slack, and creates a Jira ticket — zero human needed for L1 triage.
- **Cost Optimisation Agent** — scans AWS/Azure weekly, identifies idle resources, calculates savings, and creates a PR to resize, applied after human approval.
- **PR Review Agent** — reviews code, checks standards, runs a security scan, and summarises for the human reviewer, cutting review time significantly.

**Agent frameworks:**
- **LangGraph** — stateful multi-agent workflows, best for complex multi-step pipelines.
- **CrewAI** — multi-agent teams with defined roles (researcher, coder, reviewer) that collaborate.
- **AutoGen (Microsoft)** — conversational agents that talk to each other to solve problems.
- **Semantic Kernel** — enterprise-grade agent SDK for Python and .NET.

## AI Tools for DevOps Engineers — Use Today

- **GitHub Copilot** (coding) — autocompletes code as you type, generates tests, writes docstrings, suggests fixes.
- **Cursor** (IDE) — an AI-first code editor that lets you chat with your entire codebase and ask it to refactor, debug, or write from scratch.
- **Datadog AI / Dynatrace Davis** (monitoring) — AI root cause analysis that correlates metrics, traces, and logs to identify root cause automatically.
- **GitHub Advanced Security** (security) — AI-powered SAST that understands code semantics, producing far fewer false positives than pattern-matching scanners.
- **AWS CodeWhisperer** (coding, free for individuals) — specialised in AWS SDK code, with security scanning included.

**Prompt engineering that actually works:**
- Be specific about context: "K8s 1.29 on EKS, pod in OOMKilled. Here is the pod spec: [spec]. What are the likely causes?" — a vague prompt gets a vague, generic answer.
- Ask for step-by-step reasoning: "Think through this step by step before answering" measurably reduces errors, since it forces the model to work through intermediate reasoning rather than jumping straight to a plausible-sounding conclusion.
