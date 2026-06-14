# AI Engineering -- Portfolio Projects

Three projects from basic API integration to production RAG. Demonstrate real LLM engineering skills.

---

## Project 1: DevOps Assistant Chatbot with Claude

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `claude-devops-chatbot`

**What you build:** A multi-turn chatbot specialized in DevOps questions with a custom system prompt and Streamlit web interface.

### Core implementation
```python
import anthropic
import streamlit as st

client = anthropic.Anthropic()

SYSTEM_PROMPT = """You are DevOpsGPT, an expert DevOps and cloud engineering assistant.
Your expertise includes Docker, Kubernetes, Terraform, CI/CD, AWS, Azure, and monitoring.
Give practical, actionable answers with working commands when helpful.
Mention security implications for any configuration.
Keep answers concise but complete."""

def chat(messages: list) -> str:
    response = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1000,
        system=SYSTEM_PROMPT,
        messages=messages
    )
    return response.content[0].text

st.title("DevOps Assistant")

if "messages" not in st.session_state:
    st.session_state.messages = []

for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

if prompt := st.chat_input("Ask about Docker, Kubernetes, AWS..."):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)
    with st.chat_message("assistant"):
        with st.spinner("Thinking..."):
            response = chat(st.session_state.messages)
            st.markdown(response)
    st.session_state.messages.append({"role": "assistant", "content": response})
```

### Steps
1. Build CLI version first (simpler to test)
2. Add Streamlit UI
3. Test with 20+ different DevOps questions
4. Add suggested starter questions
5. Track token usage and cost per conversation
6. Deploy to Streamlit Cloud (free, shareable link)
7. Add export conversation as markdown feature

---

## Project 2: Document Q&A System (RAG)

**Level:** Intermediate | **Time:** 3 days | **GitHub:** `rag-document-qa`

**What you build:** Upload any PDF/text and ask questions about it. Uses RAG to answer from your specific documents.

### Complete pipeline
```python
from anthropic import Anthropic
from langchain.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.embeddings import OllamaEmbeddings
from langchain_community.vectorstores import Chroma

client = Anthropic()

class DocumentQA:
    def __init__(self):
        self.vectorstore = None
        self.embeddings = OllamaEmbeddings(model="nomic-embed-text")

    def load_document(self, path: str):
        docs = PyPDFLoader(path).load()
        chunks = RecursiveCharacterTextSplitter(
            chunk_size=500, chunk_overlap=50
        ).split_documents(docs)
        self.vectorstore = Chroma.from_documents(chunks, self.embeddings)
        return len(chunks)

    def answer(self, question: str) -> dict:
        relevant_docs = self.vectorstore.similarity_search(question, k=4)
        context = "

---

".join(d.page_content for d in relevant_docs)

        response = client.messages.create(
            model="claude-haiku-4-5-20251001",
            max_tokens=800,
            system="Answer questions based ONLY on the provided context. Say you do not have that information if it is not in the context.",
            messages=[{"role": "user", "content": f"Context:
{context}

Question: {question}"}]
        )

        return {
            "answer": response.content[0].text,
            "sources": [d.metadata.get("source", "Document") for d in relevant_docs]
        }
```

### Steps
1. Start with text files before adding PDF support
2. Test retrieval quality before adding LLM (print retrieved chunks)
3. Build test set: 10 questions with known answers from document
4. Measure accuracy: aim for 85%+ correct answers
5. Build Streamlit UI with file upload and chat
6. Compare: 3 chunks vs 5 chunks retrieved
7. Document cost per question at different usage scales

---

## Project 3: AI Agent with Tool Use

**Level:** Advanced | **Time:** 4 days | **GitHub:** `devops-ai-agent`

**What you build:** An autonomous agent that uses tools to diagnose and fix infrastructure issues.

### Agent implementation
```python
import anthropic, subprocess
client = anthropic.Anthropic()

tools = [
    {"name": "run_command",
     "description": "Run a bash diagnostic command and return output",
     "input_schema": {"type": "object",
         "properties": {"cmd": {"type": "string"}},
         "required": ["cmd"]}},
    {"name": "check_kubernetes",
     "description": "Get Kubernetes resource status",
     "input_schema": {"type": "object",
         "properties": {
             "resource": {"type": "string", "enum": ["pods","deployments","events"]},
             "namespace": {"type": "string", "default": "default"}},
         "required": ["resource"]}}
]

def execute_tool(name, inputs):
    if name == "run_command":
        r = subprocess.run(inputs["cmd"], shell=True,
                          capture_output=True, text=True, timeout=30)
        return r.stdout[:2000] + r.stderr[:500]
    if name == "check_kubernetes":
        r = subprocess.run(
            f"kubectl get {inputs['resource']} -n {inputs.get('namespace','default')}",
            shell=True, capture_output=True, text=True)
        return r.stdout + r.stderr

def agent(task: str, max_steps: int = 10) -> str:
    messages = [{"role": "user", "content": task}]
    for _ in range(max_steps):
        r = client.messages.create(model="claude-sonnet-4-6",
            max_tokens=4096, tools=tools, messages=messages,
            system="You are a DevOps expert. Use tools to investigate issues. Think step by step.")
        messages.append({"role": "assistant", "content": r.content})
        if r.stop_reason == "end_turn":
            return next(b.text for b in r.content if hasattr(b, "text"))
        if r.stop_reason == "tool_use":
            results = [{"type": "tool_result", "tool_use_id": b.id,
                        "content": execute_tool(b.name, b.input)}
                       for b in r.content if b.type == "tool_use"]
            messages.append({"role": "user", "content": results})
    return "Max steps reached"

print(agent("The payment service pods are crashing. Diagnose the issue."))
```

### Steps
1. Build single-tool agent first (just run_command)
2. Add more tools incrementally
3. Test on real diagnostic scenarios (pod crashes, high CPU)
4. Add safety filter: block destructive commands (rm -rf, DROP TABLE)
5. Add structured incident report output at the end
6. Log all tool calls for debugging
7. Measure: how many steps does the agent need for common issues?

---

## Portfolio Checklist
- [ ] Live demo deployed (Streamlit Cloud or Hugging Face Spaces)
- [ ] README has architecture diagram and example questions
- [ ] Cost per conversation documented
- [ ] Error handling for API timeouts and rate limits
- [ ] Project 2 answer quality measured and documented
