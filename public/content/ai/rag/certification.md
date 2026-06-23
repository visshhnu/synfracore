# RAG (Retrieval-Augmented Generation) Certification Guide

## Certifications Available

RAG is a technique, not a certification track. Learn it through:

| Course / Cert | Provider | Cost | Focus |
|---------------|----------|------|-------|
| **DeepLearning.AI RAG courses** | DL.AI | Free | Build RAG systems |
| **LangChain Academy** | LangChain | Free | RAG + LangGraph |
| **AWS Certified ML Specialty** | AWS | $300 | Bedrock Knowledge Bases |
| **Google Professional ML Engineer** | Google | $200 | Vertex AI Search |
| **Qdrant Vector Search course** | Qdrant | Free | Vector store deep dive |

---

## RAG Pipeline — Complete Code

```python
from langchain_community.document_loaders import PyPDFLoader, DirectoryLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_openai import OpenAIEmbeddings, ChatOpenAI
from langchain_community.vectorstores import Chroma
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.runnables import RunnablePassthrough
from langchain_core.output_parsers import StrOutputParser

# STEP 1: LOAD
loader = DirectoryLoader("./docs", glob="**/*.pdf", loader_cls=PyPDFLoader)
documents = loader.load()

# STEP 2: CHUNK
splitter = RecursiveCharacterTextSplitter(
    chunk_size=1000,
    chunk_overlap=200,
    separators=["\n\n", "\n", ".", " ", ""],
)
chunks = splitter.split_documents(documents)

# STEP 3: EMBED AND STORE
embeddings = OpenAIEmbeddings(model="text-embedding-3-small")
vectorstore = Chroma.from_documents(chunks, embeddings, persist_directory="./db")

# STEP 4: RETRIEVE
retriever = vectorstore.as_retriever(
    search_type="mmr",
    search_kwargs={"k": 4, "fetch_k": 20}
)

# STEP 5: GENERATE
llm = ChatOpenAI(model="gpt-4o-mini")
prompt = ChatPromptTemplate.from_template("""
Answer using ONLY the context. If unsure, say you do not have that information.

Context: {context}
Question: {question}
""")

def format_docs(docs):
    return "\n\n---\n\n".join(doc.page_content for doc in docs)

rag_chain = (
    {"context": retriever | format_docs, "question": RunnablePassthrough()}
    | prompt | llm | StrOutputParser()
)
answer = rag_chain.invoke("What are the main requirements?")
```

---

## Advanced RAG Techniques

```python
# HYBRID SEARCH (dense + sparse BM25)
from langchain_community.retrievers import BM25Retriever
from langchain.retrievers import EnsembleRetriever

bm25 = BM25Retriever.from_documents(chunks)
bm25.k = 4
ensemble = EnsembleRetriever(
    retrievers=[bm25, vectorstore.as_retriever(search_kwargs={"k": 4})],
    weights=[0.5, 0.5]
)

# MULTI-QUERY RETRIEVAL
from langchain.retrievers.multi_query import MultiQueryRetriever
multi_retriever = MultiQueryRetriever.from_llm(
    retriever=vectorstore.as_retriever(), llm=llm
)
# Generates 3 query variations, retrieves for all, deduplicates

# RAGAS EVALUATION
from ragas import evaluate
from ragas.metrics import faithfulness, answer_relevancy, context_recall, context_precision
# faithfulness: no hallucination (grounded in context)
# context_recall: retrieved the right chunks
# answer_relevancy: answer addresses the question
# context_precision: retrieved chunks are actually useful
```

---

## Chunking Strategy Guide

```
FIXED SIZE (RecursiveCharacterTextSplitter):
  chunk_size: 512-1024 chars (sweet spot for most use cases)
  chunk_overlap: 10-20% of chunk_size (preserve cross-boundary context)

SEMANTIC CHUNKING:
  Split on meaning boundaries (paragraph, section) not character count
  Slower but higher quality for structured documents

PARENT-CHILD:
  Index small chunks (precise retrieval)
  Return large parent chunk (full context)

DOCUMENT-AWARE:
  PDFs: split on page boundaries
  Code: split on function/class boundaries
  Markdown: split on headers
```

## Revision Notes
```
RAG PIPELINE: Load → Split → Embed → Store → Retrieve → Generate

CHUNKING: chunk_size=1000, overlap=200 (RecursiveCharacterTextSplitter default)
EMBEDDING: text-embedding-3-small (cheap) | text-embedding-3-large (quality)
VECTOR STORES: Chroma (local dev) | Qdrant (production) | FAISS (in-memory)

RETRIEVAL:
  similarity: basic cosine | mmr: diverse results | hybrid: BM25 + dense
  HyDE: embed hypothetical answer not question (better semantic match)
  Multi-query: generate 3 query variants, merge results

RAGAS SCORES (0-1, higher better):
  faithfulness >0.9 | context_recall >0.8 | answer_relevancy >0.8

RAG vs FINE-TUNING:
  RAG: dynamic knowledge, no retraining needed
  Fine-tuning: consistent style, tone, or format
  Both: fine-tuned model + RAG knowledge base
```
