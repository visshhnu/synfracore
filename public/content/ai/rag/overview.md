# RAG — Retrieval Augmented Generation

RAG is the most important pattern in production LLM systems. It solves the fundamental problem of LLMs: they have a knowledge cutoff and don't know about your private data. RAG lets LLMs answer questions about YOUR documents, databases, and real-time information.

## The Problem RAG Solves

```
Without RAG:
User: "What is our Q3 deployment policy?"
LLM:  "I don't have access to your company's internal policies."

With RAG:
User: "What is our Q3 deployment policy?"
System: [searches policy docs] → [finds relevant policy] → [injects into prompt]
LLM:  "According to your deployment policy document, Q3 deployments require..."
```

LLMs are expensive to fine-tune and have training cutoffs. RAG is cheaper, more accurate for factual retrieval, and updateable in real-time.

## RAG Architecture

```
Documents/Data
     │
     ▼
[Document Loader]
(PDFs, URLs, Confluence, Notion, S3...)
     │
     ▼
[Text Splitter]
(Chunk into smaller pieces)
     │
     ▼
[Embedding Model]
(text → vector, e.g. text-embedding-3-small)
     │
     ▼
[Vector Database]
(Pinecone, Chroma, Weaviate, pgvector)
     │
     │ ← At query time:
     │
[User Query] → [Embed query] → [Similarity Search] → [Top K chunks]
                                                            │
                                               [Inject into LLM prompt]
                                                            │
                                                       [LLM Response]
```

## Chunking Strategies

How you split documents dramatically affects RAG quality.

```python
from langchain.text_splitter import (
    RecursiveCharacterTextSplitter,
    MarkdownHeaderTextSplitter,
    TokenTextSplitter,
)

# Strategy 1: Recursive Character Splitting (most common)
splitter = RecursiveCharacterTextSplitter(
    chunk_size=1000,        # Characters per chunk
    chunk_overlap=200,      # Overlap prevents cutting context
    separators=["\n\n", "\n", " ", ""],  # Split on these in order
)
chunks = splitter.split_documents(docs)

# Strategy 2: Split by Markdown headers (for structured docs)
md_splitter = MarkdownHeaderTextSplitter(
    headers_to_split_on=[
        ("#", "Header1"),
        ("##", "Header2"),
        ("###", "Header3"),
    ]
)
chunks = md_splitter.split_text(markdown_text)
# Each chunk keeps header context in metadata

# Strategy 3: Token-based (for LLM context window optimization)
token_splitter = TokenTextSplitter(
    encoding_name="cl100k_base",  # GPT-4 tokenizer
    chunk_size=512,               # Tokens, not chars
    chunk_overlap=50,
)
```

**Chunking rules of thumb:**
- Technical docs: 500-1000 chars with 100-200 overlap
- Legal/compliance: 1000-2000 chars (context matters)
- Code: split by function/class, not arbitrary chars
- Always include metadata: source file, page number, section

## Vector Databases

```python
# Chroma — local, great for development
from langchain_community.vectorstores import Chroma
from langchain_openai import OpenAIEmbeddings

embeddings = OpenAIEmbeddings(model="text-embedding-3-small")

# Create and persist
vectorstore = Chroma.from_documents(
    documents=chunks,
    embedding=embeddings,
    persist_directory="./chroma_db",
    collection_name="company_docs"
)

# Load existing
vectorstore = Chroma(
    persist_directory="./chroma_db",
    embedding_function=embeddings,
    collection_name="company_docs"
)

# Search
results = vectorstore.similarity_search(
    "What is the deployment process?",
    k=5  # Return top 5 most relevant chunks
)

# Search with scores
results = vectorstore.similarity_search_with_relevance_scores(
    "deployment policy",
    k=5,
    score_threshold=0.7  # Only return if relevance > 0.7
)
```

```python
# Pinecone — managed, production-grade
import pinecone
from langchain_community.vectorstores import Pinecone

pc = pinecone.Pinecone(api_key="YOUR_API_KEY")
index = pc.Index("company-knowledge-base")

vectorstore = Pinecone(
    index=index,
    embedding=embeddings,
    text_key="text"
)

# Metadata filtering — only search within specific namespace
results = vectorstore.similarity_search(
    "deployment policy",
    k=5,
    filter={"department": "engineering", "doc_type": "policy"}
)
```

## Complete Production RAG Pipeline

```python
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_community.document_loaders import (
    PyPDFLoader, WebBaseLoader, ConfluenceLoader
)
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough, RunnableLambda
from typing import List
import logging

logger = logging.getLogger(__name__)

class RAGPipeline:
    def __init__(self, persist_dir: str = "./vectorstore"):
        self.embeddings = OpenAIEmbeddings(model="text-embedding-3-small")
        self.llm = ChatOpenAI(model="gpt-4o", temperature=0)
        self.persist_dir = persist_dir
        self.vectorstore = None

    def ingest_documents(self, sources: List[str]):
        """Load, chunk, and index documents."""
        all_docs = []

        for source in sources:
            logger.info(f"Loading: {source}")
            if source.endswith(".pdf"):
                loader = PyPDFLoader(source)
            elif source.startswith("http"):
                loader = WebBaseLoader(source)
            else:
                raise ValueError(f"Unsupported source: {source}")

            docs = loader.load()
            # Add source metadata
            for doc in docs:
                doc.metadata["source"] = source

            all_docs.extend(docs)

        # Split into chunks
        splitter = RecursiveCharacterTextSplitter(
            chunk_size=1000,
            chunk_overlap=200,
        )
        chunks = splitter.split_documents(all_docs)
        logger.info(f"Created {len(chunks)} chunks from {len(all_docs)} documents")

        # Create vector store
        self.vectorstore = Chroma.from_documents(
            documents=chunks,
            embedding=self.embeddings,
            persist_directory=self.persist_dir,
        )
        logger.info("Ingestion complete")

    def load_existing(self):
        """Load existing vector store."""
        self.vectorstore = Chroma(
            persist_directory=self.persist_dir,
            embedding_function=self.embeddings,
        )

    def build_chain(self):
        """Build the RAG chain."""
        retriever = self.vectorstore.as_retriever(
            search_type="mmr",          # Maximum Marginal Relevance — diverse results
            search_kwargs={
                "k": 6,                 # Retrieve 6 chunks
                "fetch_k": 20,          # Fetch 20, then pick diverse 6
                "lambda_mult": 0.7,     # 0=max diversity, 1=max relevance
            }
        )

        prompt = ChatPromptTemplate.from_messages([
            ("system", """You are a helpful assistant that answers questions 
based strictly on the provided context documents.

Rules:
- Only use information from the provided context
- If the answer is not in the context, say "I don't have information about that in the provided documents"
- Always cite the source document
- Be concise and direct

Context:
{context}"""),
            ("human", "{question}")
        ])

        def format_docs(docs):
            parts = []
            for doc in docs:
                source = doc.metadata.get("source", "unknown")
                page = doc.metadata.get("page", "")
                parts.append(f"[Source: {source}{f', page {page}' if page else ''}]\n{doc.page_content}")
            return "\n\n---\n\n".join(parts)

        chain = (
            {
                "context": retriever | format_docs,
                "question": RunnablePassthrough()
            }
            | prompt
            | self.llm
            | StrOutputParser()
        )

        return chain

    def query(self, question: str, stream: bool = False) -> str:
        chain = self.build_chain()
        if stream:
            for chunk in chain.stream(question):
                print(chunk, end="", flush=True)
            print()
        else:
            return chain.invoke(question)


# Usage
rag = RAGPipeline()

# First time — ingest documents
rag.ingest_documents([
    "docs/deployment-policy.pdf",
    "docs/incident-runbook.pdf",
    "https://company.wiki/engineering/standards",
])

# Subsequent times — load existing
# rag.load_existing()

answer = rag.query("What is the rollback procedure for production deployments?")
print(answer)
```

## Advanced RAG Techniques

```python
# 1. Hybrid Search — combine semantic + keyword
from langchain.retrievers import EnsembleRetriever, BM25Retriever

bm25_retriever = BM25Retriever.from_documents(chunks)
bm25_retriever.k = 5

vector_retriever = vectorstore.as_retriever(search_kwargs={"k": 5})

# Combine: 60% vector, 40% keyword
hybrid_retriever = EnsembleRetriever(
    retrievers=[bm25_retriever, vector_retriever],
    weights=[0.4, 0.6]
)

# 2. Re-ranking — reorder retrieved docs by relevance
from langchain.retrievers.contextual_compression import ContextualCompressionRetriever
from langchain_cohere import CohereRerank

reranker = CohereRerank(top_n=3)  # Keep top 3 after reranking
compression_retriever = ContextualCompressionRetriever(
    base_compressor=reranker,
    base_retriever=vector_retriever
)

# 3. Query transformation — improve retrieval with query rewriting
query_transform_prompt = ChatPromptTemplate.from_template("""
Generate 3 different search queries to find information about: {question}
Output only the queries, one per line.
""")

def generate_queries(question: str) -> List[str]:
    response = llm.invoke(query_transform_prompt.format(question=question))
    return response.content.strip().split("\n")
```

## Evaluating RAG Quality

```python
# Key metrics for RAG evaluation:

# 1. Retrieval precision — are retrieved chunks relevant?
# 2. Answer faithfulness — does answer stay within retrieved context?
# 3. Answer relevancy — does answer actually address the question?

# Use RAGAS framework for automated evaluation
from ragas import evaluate
from ragas.metrics import (
    faithfulness,
    answer_relevancy,
    context_recall,
    context_precision,
)

# Build evaluation dataset
eval_data = {
    "question": ["What is the deployment rollback process?"],
    "answer": [rag.query("What is the deployment rollback process?")],
    "contexts": [retriever.get_relevant_documents("deployment rollback")],
    "ground_truth": ["The rollback process involves reverting the Git commit..."]
}

results = evaluate(eval_data, metrics=[
    faithfulness,
    answer_relevancy,
    context_precision,
    context_recall
])
print(results)
```

## Interview Questions

**What is the difference between RAG and fine-tuning?**
Fine-tuning trains the model weights on your data — expensive (thousands of dollars), slow, and the model's knowledge is frozen at training time. RAG retrieves relevant information at inference time and injects it into the prompt — cheap, fast, and updateable instantly by adding new documents. Fine-tuning is better for learning new response styles, formats, or domain-specific reasoning patterns. RAG is better for factual knowledge that changes frequently. Most production systems use RAG; fine-tuning is reserved for specific behavioral changes.

**How do you handle a RAG system that returns wrong or hallucinated answers?**
First, check retrieval quality — are the right chunks being retrieved? Use similarity score thresholds to reject low-confidence retrievals. Second, improve chunking — ensure chunks have enough context (add surrounding text, parent document). Third, strengthen the system prompt with "only answer from context" instructions. Fourth, add a faithfulness check — have a second LLM call verify the answer is supported by the retrieved context. Fifth, implement human feedback loops to identify and fix systematic failures.

**What embedding model should you use?**
For English: OpenAI `text-embedding-3-small` (1536 dims, cost-effective) or `text-embedding-3-large` (3072 dims, higher quality). For multilingual: `text-embedding-3-large` or Cohere's multilingual embeddings. For on-premise/privacy: `sentence-transformers/all-mpnet-base-v2` (free, good quality). Key principle: use the same model for indexing AND querying — mixing models breaks semantic search.
