export const runtime = "edge";

export type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

export type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

export type TechLabs = {
  [techSlug: string]: Lab[];
};

export const labs_ai: TechLabs = {
"openai": [
  { id: "openai-lab-1", title: "OpenAI API: Chat, Functions, and Vision", difficulty: "Intermediate", duration: "30 min",
    tools: ["python", "openai"], objective: "Call GPT-4o-mini, use function calling for structured output, analyze images",
    interface: "code-editor",
    steps: [
      { id: "ai1", title: "Basic chat completion", type: "code",
        description: "Your first OpenAI API call — understand the request and response structure.",
        language: "python",
        code: `from openai import OpenAI
client = OpenAI()  # Uses OPENAI_API_KEY env var

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful DevOps expert. Be concise and practical."},
        {"role": "user", "content": "What is a Kubernetes Pod? Give a 3-bullet summary."}
    ],
    max_tokens=200,
    temperature=0.7
)

print("Answer:", response.choices[0].message.content)
print(f"Tokens: " + str(response.usage.prompt_tokens) + " in + " + str(response.usage.completion_tokens) + " out")
cost = (response.usage.prompt_tokens * 0.00015 + response.usage.completion_tokens * 0.0006) / 1000
print(f"Cost: {cost:.6f}")`,
        explanation: "gpt-4o-mini: cheapest ($0.15/1M input). temperature=0: deterministic. temperature=1: creative. Track token usage — costs scale with volume." },
      { id: "ai2", title: "Function calling for structured output", type: "code",
        description: "Force GPT to return JSON matching your exact schema — more reliable than asking in the prompt.",
        language: "python",
        code: `from openai import OpenAI
import json
client = OpenAI()

tools = [{"type": "function", "function": {
    "name": "extract_incident_info",
    "description": "Extract structured info from an incident report",
    "parameters": {
        "type": "object",
        "properties": {
            "severity": {"type": "string", "enum": ["P1","P2","P3","P4"]},
            "services": {"type": "array", "items": {"type": "string"}},
            "root_cause": {"type": "string"},
            "users_impacted": {"type": "integer"}
        },
        "required": ["severity", "services", "root_cause"]
    }
}}]

incident = "At 14:30, payment service returned 500 errors. DB connections exhausted. ~2000 users affected. Fixed by increasing pool size."

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role":"user","content":f"Extract info from: {incident}"}],
    tools=tools,
    tool_choice={"type":"function","name":"extract_incident_info"}
)

result = json.loads(response.choices[0].message.tool_calls[0].function.arguments)
print(json.dumps(result, indent=2))`,
        explanation: "tool_choice forces a specific function call, guaranteeing structured output. Better than asking 'respond in JSON' which the model may not follow consistently." },
    ],
  },
],

// ═══ AI: PROMPT ENGINEERING ═══

"prompt-engineering": [
  { id: "pe-lab-1", title: "Prompting Techniques That Actually Work", difficulty: "Beginner", duration: "25 min",
    tools: ["python", "anthropic"], objective: "Compare zero-shot, few-shot, CoT, and structured output — see the difference",
    interface: "code-editor",
    steps: [
      { id: "pe1", title: "Zero-shot vs Few-shot", type: "code",
        description: "Adding examples (few-shot) dramatically improves output consistency.",
        language: "python",
        code: `import anthropic
client = anthropic.Anthropic()

def ask(prompt):
    r = client.messages.create(model="claude-haiku-4-5-20251001", max_tokens=200,
        messages=[{"role":"user","content":prompt}])
    return r.content[0].text

review = "Product is great but delivery was slow and packaging was damaged"

print("ZERO-SHOT (just ask):")
print(ask(f"What is the sentiment of this review? {review}"))

print("\nFEW-SHOT (with examples):")
print(ask(f"""Classify review as POSITIVE, NEGATIVE, or MIXED.

"Amazing product, fast shipping!" → POSITIVE
"Terrible quality, broke in a day" → NEGATIVE  
"Good product but arrived late" → MIXED

"{review}" →"""))

print("\nCHAIN-OF-THOUGHT:")
print(ask(f"""Analyze this review step-by-step:
1. What does the customer like?
2. What are their complaints?
3. Overall sentiment?

Review: {review}"""))`,
        explanation: "Few-shot examples constrain the output format and improve accuracy. CoT (chain-of-thought) makes the model reason explicitly before concluding. Always test multiple approaches on your specific task." },
    ],
  },
],

// ═══ AI: LANGCHAIN LAB ═══

"langchain": [
  { id: "lc-lab-1", title: "LangChain: RAG in 50 Lines", difficulty: "Intermediate", duration: "25 min",
    tools: ["python", "langchain"], objective: "Build a complete RAG pipeline: load → chunk → embed → retrieve → answer",
    interface: "code-editor",
    steps: [
      { id: "lc1", title: "Complete RAG pipeline", type: "code",
        description: "Full RAG in one script — from documents to answers.",
        language: "python",
        code: `# pip install langchain langchain-openai langchain-community chromadb
from langchain.document_loaders import TextLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_openai import OpenAIEmbeddings, ChatOpenAI
from langchain_community.vectorstores import Chroma
from langchain.chains import RetrievalQA

# 1. Load document
with open("devops-guide.txt", "w") as f:
    f.write("Kubernetes is a container orchestration platform. Pods are the smallest deployable unit. Deployments manage replica sets. Services expose pods via stable DNS names. ConfigMaps store config. Secrets store sensitive data. HPA autoscales pods based on CPU/memory.")

docs = TextLoader("devops-guide.txt").load()

# 2. Split into chunks
chunks = RecursiveCharacterTextSplitter(chunk_size=200, chunk_overlap=20).split_documents(docs)
print(f"Split into {len(chunks)} chunks")

# 3. Embed and store
vectorstore = Chroma.from_documents(chunks, OpenAIEmbeddings(model="text-embedding-3-small"))

# 4. Create RAG chain
qa = RetrievalQA.from_chain_type(
    llm=ChatOpenAI(model="gpt-4o-mini"),
    retriever=vectorstore.as_retriever(search_kwargs={"k": 3}),
    return_source_documents=True
)

# 5. Ask questions
result = qa.invoke({"query": "What is a Kubernetes Pod?"})
print("Answer:", result["result"])
print("Sources:", len(result["source_documents"]), "chunks retrieved")`,
        explanation: "This is the complete RAG loop. In production: use a persistent vector store (Chroma with disk/Pinecone), add reranking, implement chat history, and cache embeddings." },
    ],
  },
],

// ═══ AI: RAG LAB ═══

"rag": [
  { id: "rag-lab-1", title: "Production RAG: Hybrid Search + Reranking", difficulty: "Advanced", duration: "30 min",
    tools: ["python"], objective: "Build RAG with hybrid search and cross-encoder reranking for 30% better accuracy",
    interface: "code-editor",
    steps: [
      { id: "rag1", title: "Hybrid search pipeline", type: "code",
        description: "Combine semantic search (dense) and keyword search (sparse) for better retrieval.",
        language: "python",
        code: `# pip install langchain langchain-openai rank-bm25 sentence-transformers chromadb
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_community.retrievers import BM25Retriever
from langchain.retrievers import EnsembleRetriever
from sentence_transformers import CrossEncoder

# Setup
docs = load_your_documents()  # List of LangChain Documents
embeddings = OpenAIEmbeddings(model="text-embedding-3-small")

# Dense retriever (semantic)
dense = Chroma.from_documents(docs, embeddings).as_retriever(search_kwargs={"k": 10})

# Sparse retriever (BM25 keyword)
sparse = BM25Retriever.from_documents(docs, k=10)

# Hybrid: combine both
hybrid = EnsembleRetriever(retrievers=[dense, sparse], weights=[0.6, 0.4])

# Reranker: more accurate second-stage scoring
reranker = CrossEncoder("cross-encoder/ms-marco-MiniLM-L-6-v2")

def retrieve(query: str, k=5):
    candidates = hybrid.invoke(query)[:20]  # Get 20 candidates
    scores = reranker.predict([(query, d.page_content) for d in candidates])
    ranked = sorted(zip(scores, candidates), reverse=True)
    return [doc for _, doc in ranked[:k]]   # Return top-k

results = retrieve("how to debug kubernetes pod crashes?")
print(f"Retrieved {len(results)} relevant chunks")`,
        explanation: "Two-stage: fast retrieval (20 candidates) → accurate reranking (top 5). Cross-encoder is 10x slower but 30% more accurate than bi-encoder. This pipeline handles both exact keyword and semantic queries." },
    ],
  },
],

// ═══ AI: AI AGENTS ═══

"ai-agents": [
  { id: "agents-lab-1", title: "Build an Autonomous DevOps Agent", difficulty: "Advanced", duration: "35 min",
    tools: ["python", "anthropic"], objective: "Create an agent that uses tools to diagnose infrastructure issues",
    interface: "code-editor",
    steps: [
      { id: "ag1", title: "Define tools and run the agent loop", type: "code",
        description: "Tools give the AI capabilities. The loop: think → act → observe → repeat.",
        language: "python",
        code: `import anthropic, subprocess, json
client = anthropic.Anthropic()

tools = [
    {"name": "run_command", "description": "Execute a bash diagnostic command",
     "input_schema": {"type": "object", "properties": {
         "command": {"type": "string"}}, "required": ["command"]}},
    {"name": "check_kubernetes", "description": "Check K8s resource status",
     "input_schema": {"type": "object", "properties": {
         "resource": {"type": "string", "enum": ["pods","deployments","events"]},
         "namespace": {"type": "string", "default": "default"}}, "required": ["resource"]}},
]

def execute(name, inputs):
    if name == "run_command":
        r = subprocess.run(inputs["command"], shell=True, capture_output=True, text=True, timeout=10)
        return r.stdout + r.stderr or "(no output)"
    elif name == "check_kubernetes":
        r = subprocess.run(f"kubectl get {inputs['resource']} -n {inputs.get('namespace','default')}",
                          shell=True, capture_output=True, text=True)
        return r.stdout + r.stderr

def agent(task: str, max_steps=10):
    messages = [{"role": "user", "content": task}]
    for _ in range(max_steps):
        r = client.messages.create(model="claude-sonnet-4-6", max_tokens=2048,
            tools=tools, messages=messages,
            system="You are a DevOps expert. Use tools to investigate issues. Think step by step.")
        messages.append({"role": "assistant", "content": r.content})
        if r.stop_reason == "end_turn":
            return next(b.text for b in r.content if hasattr(b,"text"))
        results = [{"type":"tool_result","tool_use_id":b.id,"content":execute(b.name,b.input)}
                   for b in r.content if b.type=="tool_use"]
        messages.append({"role":"user","content":results})

print(agent("The API is slow. Check what's consuming the most CPU and memory on this system."))`,
        explanation: "The agent loop is simple: call API → if tool_use, execute tools and send results back → repeat until end_turn. The model decides which tools to call based on what it observes." },
    ],
  },
],

// ═══ AI: AI FUNDAMENTALS ═══

"ai-fundamentals": [
  { id: "aif-lab-1", title: "Anthropic Claude API Complete Guide", difficulty: "Beginner", duration: "25 min",
    tools: ["python", "anthropic"], objective: "Master Claude API: basic calls, streaming, vision, tool use, cost tracking",
    interface: "code-editor",
    steps: [
      { id: "aif1", title: "Core API patterns", type: "code",
        description: "All the patterns you need for production Claude applications.",
        language: "python",
        code: `import anthropic, base64
client = anthropic.Anthropic()

# 1. Basic call
r = client.messages.create(
    model="claude-haiku-4-5-20251001",
    max_tokens=500,
    system="You are a helpful DevOps expert.",
    messages=[{"role":"user","content":"What is Docker in one paragraph?"}]
)
print("Answer:", r.content[0].text)
print(f"Cost: ~\${(r.usage.input_tokens*0.00025 + r.usage.output_tokens*0.00125)/1000:.6f}")

# 2. Multi-turn conversation
messages = []
for question in ["What is Kubernetes?", "How does it differ from Docker Swarm?"]:
    messages.append({"role":"user","content":question})
    r = client.messages.create(model="claude-haiku-4-5-20251001", max_tokens=200, messages=messages)
    reply = r.content[0].text
    messages.append({"role":"assistant","content":reply})
    print(f"Q: {question}\nA: {reply[:100]}...\n")

# 3. Streaming (don't wait for full response)
with client.messages.stream(
    model="claude-haiku-4-5-20251001", max_tokens=200,
    messages=[{"role":"user","content":"List 5 Linux commands for DevOps"}]
) as stream:
    for chunk in stream.text_stream:
        print(chunk, end="", flush=True)`,
        explanation: "Use haiku for development (cheapest). Upgrade to sonnet for production quality. Always stream long responses for better UX. Track costs from usage.input_tokens and usage.output_tokens." },
    ],
  },
],

// ═══ AI: LLMOPS ═══

"llmops": [
  { id: "llmops-lab-1", title: "LLMOps: Evaluate and Monitor AI Systems", difficulty: "Advanced", duration: "30 min",
    tools: ["python"], objective: "Build evaluation pipeline, track costs, implement guardrails",
    interface: "code-editor",
    steps: [
      { id: "llm1", title: "Automated evaluation pipeline", type: "code",
        description: "Run automated evals to catch regressions before deploying prompt changes.",
        language: "python",
        code: `import anthropic
from dataclasses import dataclass

client = anthropic.Anthropic()

@dataclass
class EvalCase:
    name: str
    input: str
    must_contain: list[str]
    must_not_contain: list[str] = None

def run_evals(system_prompt: str, cases: list[EvalCase], model="claude-haiku-4-5-20251001"):
    results = []
    total_cost = 0.0
    
    for case in cases:
        r = client.messages.create(model=model, max_tokens=500,
            system=system_prompt, messages=[{"role":"user","content":case.input}])
        
        output = r.content[0].text
        total_cost += (r.usage.input_tokens * 0.00025 + r.usage.output_tokens * 0.00125) / 1000
        
        keyword_pass = all(kw.lower() in output.lower() for kw in case.must_contain)
        ban_pass = not any(w.lower() in output.lower() for w in (case.must_not_contain or []))
        passed = keyword_pass and ban_pass
        
        results.append({"case": case.name, "passed": passed})
        print(f"{'✅' if passed else '❌'} {case.name}")
    
    pass_rate = sum(r['passed'] for r in results) / len(results) * 100
    print(f"\nPass rate: {pass_rate:.0f}% | Cost: \${total_cost:.4f}")
    return results

SYSTEM = "You are a helpful DevOps expert. Be accurate, concise, and include code examples."

cases = [
    EvalCase("Docker basics", "What is Docker?", ["container","image"], ["wrong","incorrect"]),
    EvalCase("K8s pod", "What is a Kubernetes Pod?", ["container","pod","namespace"]),
    EvalCase("No hallucination", "What is the latest Kubernetes version?", ["version","kubernetes"]),
]

run_evals(SYSTEM, cases)`,
        explanation: "Run evals on every prompt change. Compare old vs new with identical test cases. If pass rate drops >5%, investigate which cases broke. Track cost per eval to budget testing." },
    ],
  },
],

// ═══ DATA: PANDAS ═══
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_ai[tech] || [];
}
