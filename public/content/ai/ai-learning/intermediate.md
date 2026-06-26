tly

- **Provide examples**: Show one example of the output format you want

- **Iterate**: Treat it as a conversation. "Add error handling." "Make it more concise."


## 🗺️ AI/ML Learning Roadmap›


| Month | Focus | Project to build |
|---|---|---|
| 1 | Python + NumPy + Pandas | Data analysis scripts, understand arrays and DataFrames |
| 2 | ML basics — scikit-learn | Train a classification model on real dataset (kaggle.com) |
| 3 | LLM APIs — OpenAI/Anthropic | Build a RAG system on your own documentation |
| 4 | MLOps — MLflow, Docker for ML | Containerise a model training pipeline with experiment tracking |
| 5 | LangChain/LangGraph agents | Build an incident triage agent that calls your monitoring APIs |
| 6 | Production deployment — vLLM on K8s | Deploy an open-source LLM (Llama 3) on Kubernetes |

**The DevOps Advantage**You already know Kubernetes, Docker, CI/CD, and cloud. That puts you ahead of 80% of ML engineers who cannot deploy their own models. MLOps + DevOps is the highest-demand intersection in tech right now.


## 🎯 Interview Questions›


AI LEARNING · BEGINNER
What is the difference between AI, Machine Learning, and Deep Learning?
These are nested concepts. AI (Artificial Intelligence) is the broadest term — any technique that enables machines to mimic human intelligence. Includes rule-based systems, expert systems, and modern ML. Machine Learning is a subset of AI — systems that learn patterns from data without being explicitly programmed. You feed data, the algorithm finds patterns, makes predictions. Examples: fraud detection, spam filtering, recommendation engines. Deep Learning is a subset of ML — uses neural networks with many layers. Particularly powerful for unstructured data (images, audio, text). Requires large datasets and significant compute. Examples: image recognition, speech-to-text, ChatGPT. In 2024: when people say AI they usually mean LLMs or generative AI. When DevOps engineers talk about AI they increasingly mean MLOps — running ML models in production Kubernetes infrastructure.

AI LEARNING · ENGINEER
What is an LLM and how does it work?
A Large Language Model (LLM) is a neural network with billions of parameters trained to predict the next token in a sequence. Training: Pre-training — ingest trillions of tokens from the internet and books, adjust parameters to predict next token better, runs weeks on thousands of GPUs ($50-100M for frontier models). Instruction tuning (SFT) — fine-tune on human Q&A pairs to follow instructions rather than just autocomplete. RLHF (Reinforcement Learning from Human Feedback) — humans rank responses, reward model learns preferences, LLM trained to score higher. This makes Claude and GPT respond helpfully. Why hallucination happens: LLMs predict plausible-sounding text based on patterns — they do not look facts up. For frequent training topics: reliable. For obscure facts, recent events, specific numbers: confidently wrong. Fix: RAG grounds answers in real documents. Key concepts: context window (how much text the model processes at once), temperature (0=deterministic, 1+=creative), embeddings (text as vectors — similar meaning=similar vectors).

AI LEARNING · ENGINEER
What is RAG and how would you implement it for a DevOps use case?
RAG (Retrieval-Augmented Generation) solves the key LLM limitation: models only know their training data. RAG retrieves relevant documents at query time and adds them to the LLM context. How it works: Indexing (offline) — split documents into chunks, convert each to an embedding vector, store in vector database (Pinecone, ChromaDB, pgvector). Retrieval (at query time) — convert user question to embedding, find most similar chunks via vector similarity search, retrieve top-K chunks. Generation — send retrieved chunks + question to LLM, answer is grounded in your actual documents. DevOps use cases: Runbook assistant — ask "how do I handle a Kafka consumer lag spike?" and get answers from your actual runbooks. Incident assistant — feed recent alerts and logs, get probable root cause analysis. Code review helper — retrieve coding standards, check new code against them. Architecture assistant — answer design questions using your existing ADRs. Implementation: LangChain or LlamaIndex for orchestration, any vector DB for storage, OpenAI/Anthropic API for the LLM.

AI LEARNING · ENGINEER
What is MLOps and how does it relate to DevOps?
MLOps applies DevOps principles to machine learning. Training a model is 20% of the work — production deployment, monitoring, and retraining is 80%. DevOps to MLOps mapping: Code version control → model + dataset versioning (DVC, MLflow). CI/CD pipeline → ML pipeline: data → train → evaluate → register → deploy. Container registry → model registry (MLflow, Hugging Face Hub). Kubernetes deployment → model serving (KServe, Triton, vLLM). Application monitoring → model monitoring: accuracy drift, data drift, bias detection. A/B testing → champion/challenger model testing. Rollback → model version rollback if performance drops. Key MLOps tools: MLflow (experiment tracking — log parameters, metrics, compare runs), Kubeflow (ML pipelines on Kubernetes — each step is a container), vLLM (serve LLMs 10-20x faster), Evidently (data drift detection). The DevOps advantage: if you already know Kubernetes, Docker, CI/CD, and cloud — you are ahead of 80% of ML engineers who cannot deploy their own models.

AI LEARNING · ARCHITECT
What are AI Agents and how are they used in DevOps?
AI Agents are LLM-based systems that take actions, not just answer questions. Components: LLM (brain), tools (functions it can call — APIs, code execution, database queries), memory (conversation context), planning loop (decide next action). DevOps agent examples: Incident Response Agent — receives PagerDuty alert, queries Prometheus API, checks recent deployments in ArgoCD, searches runbook vector database, posts root cause analysis to Slack, creates Jira ticket. Fully automated L1 triage. Cost Optimisation Agent — scans AWS/Azure weekly, identifies idle resources, calculates savings, creates Terraform PR to resize, applies after human approval. Pipeline Debug Agent — CI fails, agent reads error logs, identifies failing test, suggests fix in PR comment. Frameworks: LangGraph (stateful multi-step workflows), CrewAI (multiple agents with roles that collaborate), AutoGen (Microsoft, conversational multi-agent). Current reality: agents work well for well-defined tasks with clear tools. They struggle with ambiguous situations and judgment calls. Use for repetitive structured automation — not for decisions requiring business context.

AI LEARNING · PRODUCTION
How do you monitor and evaluate LLM output quality in production?
Evaluating LLM outputs differs from traditional testing — no single correct answer. Strategies: Automated metrics for RAG — faithfulness (does the answer come from retrieved context?), answer relevancy (does it answer the question?), context precision (are retrieved chunks relevant?). Tools: RAGAS, DeepEval. LLM-as-judge — use a strong LLM (GPT-4, Claude) to evaluate responses from a weaker model. Define a rubric: accuracy, completeness, conciseness, safety. Works for open-ended responses. Human evaluation — for high-stakes applications, sample responses weekly and have domain experts rate them. Create a golden dataset of Q&A pairs and check for regression. A/B testing — route 10% of traffic to new model or prompt version, compare user satisfaction and task completion rate. Production monitoring — track proxy metrics: user thumbs-up/thumbs-down, conversation length (short dead-end = unhelpful), follow-up clarification questions (indicates unclear response). For DevOps runbook assistants: did the on-call engineer follow suggested steps? Did the incident resolve? Outcome metrics are more valuable than any automated score.


Continue Learning
[☸️ Kubernetes](/devops/kubernetes.html)[🐍 Python DevOps](/devops/python-devops.html)[🛡️ DevSecOps](/security/devsecops.html)[🏠 Home](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤
