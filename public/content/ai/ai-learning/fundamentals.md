# AI Learning

Domains › AI Learning
🤖**AI Learning**
BeginnerPractitionerAdvancedArchitectLLMs, MLOps, RAG, AI Agents, MLOps pipelines, AI in DevOps — from awareness to production deployment
[What is AI](#sec-what)[How LLMs Work](#sec-llm)[MLOps](#sec-mlops)[RAG](#sec-rag)[AI Agents](#sec-agents)[AI in DevOps](#sec-devops-ai)[Roadmap](#sec-roadmap-ai)


## 🤖 What is AI — Beyond the Chatbot›


#### AI is not just a chatbot — it is an entirely new computing paradigm

When most people say "AI" they mean ChatGPT or Gemini — conversational bots. That is one small application. Artificial Intelligence covers: machine learning, deep learning, computer vision, NLP, reinforcement learning, and large language models. Each of these has been transforming industries for years before ChatGPT made it visible to everyone.


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


## 🧠 How LLMs Actually Work›


#### The mechanics behind ChatGPT, Claude, and Gemini

A Large Language Model is a neural network with billions of parameters trained to predict what token (word fragment) comes next. Training: ingest trillions of tokens from the internet and books, adjust billions of parameters to predict better. Result: a model that has compressed human written knowledge into its weights.


#### The 3-stage training process


- **Pre-training** — raw internet text, predict next tokens. Billions of examples. Weeks on thousands of GPUs. Cost: $50M-100M for frontier models.

- **Instruction Tuning (SFT)** — fine-tune on human-written Q&A pairs. Teaches the model to answer helpfully, not just autocomplete.

- **RLHF** — humans rank model responses. Reward model learns human preferences. LLM trained via RL to score higher. This is what makes Claude/GPT behave as assistants.


#### Why LLMs hallucinate — the core limitation

LLMs do not look things up. They predict plausible-sounding text based on patterns. For frequent training data topics: reliable. For obscure facts, recent events, specific numbers: they generate confident-sounding wrong answers. Fix: use RAG (Retrieval-Augmented Generation) to ground answers in real documents.


#### Key concepts


- **Context window** — how much text the model processes at once (4K to 2M tokens). Larger = more expensive but can reason over more data.

- **Temperature** — 0 = always same answer (deterministic). 1+ = creative, varied. Use 0 for code, 0.7 for creative writing.

- **Embeddings** — convert text to vectors. Similar meaning = similar vectors. Used for semantic search and RAG.

- **Tokens** — 1 token ≈ 4 characters. Pricing is per token. "tokenisation" = 2-3 tokens.


## ⚙️ MLOps — Running ML in Production›


#### MLOps = DevOps for Machine Learning. Your DevOps skills transfer directly.

| DevOps concept | MLOps equivalent |
|---|---|
| Code version control | Model + dataset versioning (DVC, MLflow) |
| CI/CD pipeline | ML pipeline: data → train → evaluate → register → deploy |
| Container registry | Model registry (MLflow, Hugging Face Hub) |
| Kubernetes deployment | Model serving on K8s (KServe, Triton, vLLM) |
| Application monitoring | Model monitoring: accuracy drift, data drift, bias |
| A/B testing | Champion/challenger model testing |
| Rollback | Model version rollback if performance drops |


#### MLOps tools stack

🔬

MLflowExperiment Tracking
Track experiments: log parameters, metrics, artifacts. Compare runs. Register models. Open-source, runs anywhere.

🏭

KubeflowML Pipelines on K8s
Kubernetes-native ML workflows. Each pipeline step is a container. Build train-evaluate-deploy pipelines.

🤗

Hugging FaceModel Hub
GitHub for ML models. 500K+ pre-trained models. Fine-tune and deploy. Every major LLM available here.

⚡

vLLMLLM Serving
High-throughput LLM inference. Serves Llama, Mistral, Qwen at 10-20x speed. Essential for production LLM deployment on K8s.

📊

EvidentlyModel Monitoring
Data drift detection, model quality metrics, visual dashboards. Open-source.

🔧

RayDistributed ML
Scale training and serving across machines. Ray Train + Ray Serve.


## 🔍 RAG — Give LLMs Your Data›


#### RAG = Retrieval-Augmented Generation

Raw LLMs only know their training data. RAG lets them answer questions about your documents — internal wikis, runbooks, codebase, customer data — by retrieving relevant content at query time.


#### How RAG works


- **Index** — split documents into chunks → convert each to embedding vector → store in vector database (Pinecone, ChromaDB, pgvector)

- **Retrieve** — user asks question → convert to embedding → find most similar chunks → retrieve top-K

- **Generate** — send retrieved chunks + question to LLM → answer grounded in your documents


```
from langchain.vectorstores import Chroma
from langchain.embeddings import OpenAIEmbeddings
from langchain.chains import RetrievalQA

vectordb = Chroma.from_documents(docs, OpenAIEmbeddings())
qa = RetrievalQA.from_chain_type(llm=llm,
retriever=vectordb.as_retriever(search_kwargs={"k": 4}))
result = qa.run("What is the TeMIP alarm resync procedure?")
```


#### DevOps RAG use cases


- Runbook assistant — ask questions, get answers from your actual runbooks

- Incident assistant — feed recent alerts and logs, get probable root cause

- Code review — retrieve coding standards, check new code against them

- Security policy checker — check infrastructure configs against compliance policies


## 🤝 AI Agents — Autonomous Action›


#### Agents take actions, not just answer questions

A chatbot responds. An AI Agent executes tasks by calling tools, making decisions, and taking multi-step actions autonomously. Components: LLM (brain) + tools (what it can call) + memory (context) + planning.


🔧

Incident Response AgentAutonomous
Alert fires → queries metrics API → checks recent deployments → searches runbooks → posts analysis to Slack → creates Jira ticket. Zero human for L1 triage.

💰

Cost Optimisation AgentWeekly
Scans AWS/Azure → identifies idle resources → calculates savings → creates PR to resize → applies after approval.

📝

PR Review AgentAssisted
Reviews code → checks standards → runs security scan → summarises for reviewer. Cuts review time 40%.
#### Agent frameworks


- **LangGraph** — stateful multi-agent workflows. Best for complex, multi-step pipelines.

- **CrewAI** — multi-agent teams with roles (researcher, coder, reviewer) that collaborate.

- **AutoGen (Microsoft)** — conversational agents that talk to each other to solve problems.

- **Semantic Kernel** — enterprise-grade agent SDK for Python and .NET.


## ⚡ AI Tools for DevOps Engineers — Use Today›


🐙

GitHub CopilotCoding
Autocompletes code as you type. Generates tests, writes docstrings, suggests fixes. ₹1,600/month.

🖥️

CursorIDE
AI-first code editor. Chat with your entire codebase. Ask it to refactor, debug, write from scratch.

📊

Datadog AI / Dynatrace DavisMonitoring
AI root cause analysis. Correlates metrics, traces, logs. Identifies root cause automatically.

🔒

GitHub Advanced SecuritySecurity
AI-powered SAST. Understands code semantics, far fewer false positives.

🚀

AWS CodeWhispererCoding (Free)
Free for individuals. Specialised in AWS SDK code. Security scanning included.
#### Prompt engineering that actually works


- **Be specific about context**: "K8s 1.29 on EKS, pod in OOMKilled. Here is pod spec: [spec]. What are likely causes?"

- **Ask for step-by-step**: "Think through this step by step before answering" — reduces errors significan
