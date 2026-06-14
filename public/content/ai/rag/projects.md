# RAG Systems -- Portfolio Projects

---

## Project 1: Company Knowledge Base Q&A

**Level:** Intermediate | **Time:** 3 days | **GitHub:** `rag-knowledge-base`

Internal knowledge base Q&A -- upload company docs, get accurate answers with citations.

```python
from anthropic import Anthropic
from langchain_community.document_loaders import DirectoryLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import Chroma
from langchain_community.embeddings import OllamaEmbeddings

client = Anthropic()

class KnowledgeBase:
    def __init__(self, docs_dir: str):
        docs = DirectoryLoader(docs_dir, glob="**/*.{md,txt,pdf}").load()
        chunks = RecursiveCharacterTextSplitter(
            chunk_size=500, chunk_overlap=50
        ).split_documents(docs)

        self.vectorstore = Chroma.from_documents(
            chunks, OllamaEmbeddings(model="nomic-embed-text")
        )
        print(f"Indexed {len(chunks)} chunks from {len(docs)} documents")

    def ask(self, question: str) -> dict:
        sources = self.vectorstore.similarity_search_with_score(question, k=4)
        context = "

".join(f"[{doc.metadata.get("source","")}]
{doc.page_content}"
                               for doc, score in sources if score < 0.8)

        response = client.messages.create(
            model="claude-haiku-4-5-20251001",
            max_tokens=1000,
            system="""Answer based ONLY on the context provided.
Always cite which document your answer comes from.
If the answer is not in the context, say so clearly.""",
            messages=[{"role": "user",
                       "content": f"Context:
{context}

Question: {question}"}]
        )

        return {
            "answer": response.content[0].text,
            "sources": [doc.metadata.get("source") for doc, _ in sources],
            "cost": f"${(response.usage.input_tokens * 0.00025 + response.usage.output_tokens * 0.00125) / 1000:.4f}"
        }

kb = KnowledgeBase("./company-docs")
result = kb.ask("What is our refund policy?")
print(result["answer"])
print("Sources:", result["sources"])
```

**Steps:** Index company docs, build Streamlit UI, measure accuracy with 20-question test set, add feedback system

---

## Project 2: Multi-Source Research Assistant

**Level:** Advanced | **Time:** 4 days | **GitHub:** `rag-research-assistant`

RAG system that searches across web + internal docs + uploaded files simultaneously.

```python
from langchain.tools import DuckDuckGoSearchResults
from langchain_community.document_loaders import PyPDFLoader

def research(question: str, uploaded_files: list = None):
    sources = []

    # Source 1: Web search
    web_results = DuckDuckGoSearchResults(num_results=3).run(question)
    sources.append({"type": "web", "content": web_results})

    # Source 2: Uploaded files
    if uploaded_files:
        for file in uploaded_files:
            docs = PyPDFLoader(file).load()
            relevant = vectorstore.similarity_search(question, k=2)
            sources.append({"type": "document", "content": relevant})

    # Source 3: Curated knowledge base
    internal = internal_vectorstore.similarity_search(question, k=3)
    sources.append({"type": "internal", "content": internal})

    # Synthesize from all sources
    return synthesize_answer(question, sources)
```

**Steps:** Multi-source retrieval, source attribution in answers, add reranking, export research report as PDF

---

## Portfolio Checklist
- [ ] Working demo with real documents
- [ ] Accuracy measured: test set with known answers
- [ ] Source citations in every answer
- [ ] Cost per query documented
- [ ] Handles "I do not know" gracefully (no hallucination)
