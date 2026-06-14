export const runtime = "edge";
import { notFound } from "next/navigation";
import Link from "next/link";

type Props = { params: Promise<{ slug: string }> };

const articles: Record<string, {
  title: string; tag: string; date: string; readTime: string;
  content: string;
}> = {
  "docker-beginner-guide": {
    title: "Docker for Beginners: From Zero to Your First Container in 30 Minutes",
    tag: "Docker", date: "January 2025", readTime: "8 min read",
    content: `
## What is Docker and Why Does It Matter?

Docker is a platform for packaging applications into containers — lightweight, portable units that include everything the app needs to run: code, runtime, libraries, and settings.

**The problem Docker solves:** "It works on my machine." A container bundles the app with its environment, so it works identically on your laptop, your colleague's machine, and the production server.

## Install Docker

**macOS / Windows:** Download Docker Desktop from docker.com. It includes everything you need.

**Linux (Ubuntu):**
\`\`\`bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
# Log out and back in, then:
docker --version
\`\`\`

## Your First Container

\`\`\`bash
# Pull and run nginx (a web server)
docker run -d -p 8080:80 --name my-nginx nginx

# Visit http://localhost:8080 — you'll see the nginx welcome page

# See running containers
docker ps

# View logs
docker logs my-nginx

# Stop and remove
docker stop my-nginx
docker rm my-nginx
\`\`\`

## Build Your Own Image

Create a file called \`Dockerfile\` (no extension):

\`\`\`dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python", "app.py"]
\`\`\`

Build and run it:
\`\`\`bash
docker build -t my-app:v1 .
docker run -d -p 8000:8000 my-app:v1
\`\`\`

## Multi-Container App with Docker Compose

Create \`docker-compose.yml\`:

\`\`\`yaml
version: "3.8"
services:
  web:
    build: .
    ports: ["8000:8000"]
    depends_on: [db, redis]
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: secret
    volumes: [db-data:/var/lib/postgresql/data]
  redis:
    image: redis:7-alpine
volumes:
  db-data:
\`\`\`

\`\`\`bash
docker compose up -d      # Start all services
docker compose logs -f    # Follow logs
docker compose down       # Stop all
\`\`\`

## Key Commands to Remember

\`\`\`bash
docker ps                 # List running containers
docker ps -a              # All containers (including stopped)
docker images             # List images
docker image ls           # Same as above
docker pull nginx         # Download image
docker exec -it myapp sh  # Shell into running container
docker logs myapp         # View logs
docker inspect myapp      # Full container details (JSON)
docker stats              # Live CPU/memory usage
docker system prune       # Clean up unused resources
\`\`\`

## What's Next?

Once you're comfortable with these basics, move to the **Docker Intermediate** section to learn multi-stage builds, networking, and security best practices.
    `
  },
  "kubernetes-vs-docker-swarm": {
    title: "Kubernetes vs Docker Swarm in 2025: Which Should You Learn First?",
    tag: "Kubernetes", date: "January 2025", readTime: "6 min read",
    content: `
## The Short Answer

**Learn Kubernetes.** Not because Docker Swarm is bad — it isn't — but because the job market has made its decision. Kubernetes is on 90%+ of job descriptions that mention container orchestration.

## What Problem Are We Solving?

When you have 1 container, Docker is enough. When you have 100 containers across 10 servers — you need orchestration. Who restarts containers that crash? Who distributes traffic? Who handles rolling updates? That's what Kubernetes and Swarm both do.

## Docker Swarm: Simple and Fast

Swarm is built into Docker. Zero installation — if you have Docker, you have Swarm.

\`\`\`bash
docker swarm init
docker service create --replicas 3 --name api my-api:v1
docker service scale api=5
\`\`\`

That's most of Swarm. Simple, fast, and production-ready for smaller deployments.

**Where Swarm shines:** Small teams, simple apps, when you need container orchestration without the Kubernetes learning curve.

## Kubernetes: Powerful but Complex

\`\`\`yaml
apiVersion: apps/v1
kind: Deployment
metadata: {name: api}
spec:
  replicas: 3
  selector: {matchLabels: {app: api}}
  template:
    metadata: {labels: {app: api}}
    spec:
      containers:
      - name: api
        image: my-api:v1
        resources:
          requests: {cpu: "100m", memory: "128Mi"}
          limits: {cpu: "500m", memory: "512Mi"}
\`\`\`

More verbose. But also more powerful: autoscaling, service mesh, custom resources, multi-cluster, and an ecosystem of 1000+ tools built on top of it.

## Job Market Reality (2025)

Job postings mentioning Kubernetes: ~94%
Job postings mentioning Docker Swarm: ~6%

Every major cloud provider offers managed Kubernetes (EKS, GKE, AKS). Every major company runs it. The ecosystem has converged.

## When to Use Docker Swarm Instead

- Small team, simple stack, need to ship fast
- Existing Docker Compose files you want to scale slightly
- Resource-constrained environments (Swarm overhead is much lower)
- You want to avoid the Kubernetes complexity tax for a small project

## Recommendation

**Learn Kubernetes for your career.** Start with Minikube or Kind locally. Get comfortable with Deployments, Services, ConfigMaps, and Secrets. Then learn Helm. That foundation will serve you for years.

If you work somewhere using Swarm, Swarm knowledge transfers easily once you understand Kubernetes concepts. The reverse is also true.
    `
  },
  "devops-salary-india-2025": {
    title: "DevOps Engineer Salaries in India 2025: City-wise, Experience-wise Breakdown",
    tag: "Career", date: "February 2025", readTime: "5 min read",
    content: `
## Salary Ranges by Experience Level

These figures are based on publicly available data from Naukri, LinkedIn, Glassdoor, and community surveys (2024-2025).

### Junior DevOps Engineer (0-2 years)
- Bangalore: ₹6-12 LPA
- Hyderabad: ₹5-10 LPA
- Pune: ₹5-9 LPA
- Mumbai: ₹6-11 LPA
- Chennai: ₹5-9 LPA
- Remote (India): ₹5-10 LPA

**What gets you to the higher end:** Kubernetes certification (CKA), AWS/Azure cert, actual project experience vs just course certificates.

### Mid-Level DevOps Engineer (2-5 years)
- Bangalore: ₹15-28 LPA
- Hyderabad: ₹12-24 LPA
- Pune: ₹12-22 LPA
- Mumbai: ₹14-26 LPA
- Remote (India): ₹14-25 LPA

**Key differentiators at this level:** Owning production systems, cloud certifications (AWS SAA, Azure Solutions Architect), team lead experience.

### Senior DevOps / Platform Engineer (5-8 years)
- Bangalore: ₹28-50 LPA
- Hyderabad: ₹24-42 LPA
- Remote (India): ₹25-45 LPA

**Senior title needs:** Architecture decisions, mentoring, cross-team platform ownership, incident ownership.

### DevOps Architect / Principal (8+ years)
- Any city: ₹50-90 LPA
- Top product companies: ₹80-130 LPA

## Skills That Increase Salary

| Skill | Salary Bump |
|---|---|
| Kubernetes (CKA certified) | +20-35% |
| AWS Solutions Architect | +15-25% |
| Terraform + IaC expertise | +15-20% |
| Platform Engineering | +25-40% |
| AI/ML infra (LLMOps) | +30-50% |

## Product vs Service Companies

**Product companies** (Flipkart, Swiggy, PhonePe, CRED, Razorpay): 30-60% higher than market average. Harder to get in, work at larger scale.

**MNC service companies** (TCS, Infosys, Wipro, HCL): Usually market rate or slightly below. Volume hiring.

**MNC product offices** (Google, Microsoft, Amazon, Meta): 2-4x market rate. Highly competitive.

**Startups (Series B+):** Competitive cash + meaningful ESOPs. High risk, high reward.

## How to Move Up Faster

1. Certifications do matter at 0-3 years — they unlock resume filters
2. Open source contributions on GitHub get noticed by product companies
3. Build something real and put it on GitHub — not tutorial projects
4. Contribute to internal projects that go to production
5. Learn one level above your current role (junior → study mid-level skills)
    `
  },
  "terraform-aws-starter": {
    title: "Your First Terraform Project: Build a Complete AWS VPC in 20 Minutes",
    tag: "Terraform", date: "February 2025", readTime: "10 min read",
    content: `
## Prerequisites

- AWS account (free tier works)
- Terraform installed: \`brew install terraform\` (Mac) or download from terraform.io
- AWS CLI configured: \`aws configure\`

## Project Structure

\`\`\`
terraform-vpc/
├── main.tf        ← resources
├── variables.tf   ← inputs
├── outputs.tf     ← what to show after apply
└── terraform.tfvars ← your values
\`\`\`

## variables.tf

\`\`\`hcl
variable "region" {
  default = "ap-south-1"
}
variable "project" {
  default = "myproject"
}
variable "environment" {
  default = "dev"
}
\`\`\`

## main.tf

\`\`\`hcl
terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "\${var.project}-\${var.environment}-vpc" }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "\${var.project}-igw" }
}

# Public subnets (2 AZs)
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.\${count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "\${var.project}-public-\${count.index + 1}" }
}

# Private subnets (2 AZs)
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.\${count.index + 10}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = { Name = "\${var.project}-private-\${count.index + 1}" }
}

# NAT Gateway (allows private subnets to reach internet)
resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags = { Name = "\${var.project}-nat" }
}

# Route tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = { Name = "\${var.project}-public-rt" }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = { Name = "\${var.project}-private-rt" }
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

data "aws_availability_zones" "available" { state = "available" }
\`\`\`

## outputs.tf

\`\`\`hcl
output "vpc_id" { value = aws_vpc.main.id }
output "public_subnet_ids" { value = aws_subnet.public[*].id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
\`\`\`

## Apply It

\`\`\`bash
terraform init      # Download AWS provider
terraform plan      # Preview what will be created (23 resources)
terraform apply     # Type "yes" to create
# Takes ~3 minutes (NAT Gateway takes longest)

# See what was created
terraform output

# Destroy when done (to avoid charges)
terraform destroy
\`\`\`

## What Got Created

After apply you have: 1 VPC, 1 Internet Gateway, 1 NAT Gateway, 4 subnets (2 public, 2 private), 2 route tables, route table associations. This is the standard 3-tier AWS network topology used by most production applications.

**Cost warning:** The NAT Gateway costs ~$0.05/hour + data transfer. Destroy it when you're done learning.
    `
  },
  "cka-exam-guide": {
    title: "CKA Exam Guide 2025: What I Wish I Knew Before Studying",
    tag: "Kubernetes", date: "March 2025", readTime: "12 min read",
    content: `
## The CKA is Different From Other Exams

Most certification exams are multiple choice — memorize facts, pick answers. The CKA (Certified Kubernetes Administrator) is performance-based. You get a terminal, a live Kubernetes cluster, and 2 hours to complete 15-20 tasks. No options to pick from. You either know how to do it or you don't.

This changes how you should study.

## What's Actually on the Exam

The official domains and their weights:
- **30%** Troubleshooting — debugging broken clusters, nodes, pods, networking
- **25%** Cluster Architecture, Installation & Configuration
- **20%** Services & Networking
- **15%** Workloads & Scheduling
- **10%** Storage

**Troubleshooting is 30% — it's the biggest section.** Spend most of your prep time learning to diagnose problems, not just create resources.

## The 5 Mistakes Most Candidates Make

**1. Studying theory instead of practicing**
Reading about Kubernetes doesn't help you in a terminal-based exam. You need muscle memory. Set up a local cluster (minikube or kind) and do everything from the command line.

**2. Not mastering kubectl shortcuts**
You have 2 hours for 17 tasks — roughly 7 minutes per task. Speed matters.
\`\`\`bash
alias k=kubectl
export do="--dry-run=client -o yaml"  # k create deploy nginx --image=nginx $do
export now="--force --grace-period 0"  # k delete pod stuck-pod $now
\`\`\`

**3. Not practicing in the exam environment**
The exam uses a browser-based terminal. Buy killer.sh sessions ($36 for two 36-hour sessions) — it mimics the exact exam UI and is harder than the real exam.

**4. Not using the Kubernetes docs effectively**
kubernetes.io/docs is allowed during the exam. Bookmark these pages:
- Tasks > Configure Pods and Containers
- Concepts > Cluster Administration > Networking
- Reference > kubectl CLI

**5. Skipping the hard topics**
ETCD backup/restore and cluster upgrades (kubeadm upgrade) appear in almost every exam. Practice them until they're automatic.

## Study Plan (6 Weeks)

**Weeks 1-2: Core concepts**
Pods, Deployments, Services, ConfigMaps, Secrets, Namespaces. Do every task with kubectl, not YAML files.

**Weeks 3-4: Intermediate**
RBAC, NetworkPolicy, PV/PVC, StorageClass, Ingress, resource limits, HPA.

**Week 5: Troubleshooting**
Set up clusters that are intentionally broken. Fix them. Practice: node not ready, pod crashlooping, service not routing traffic, DNS not working.

**Week 6: Mock exams**
killer.sh sessions. Time yourself. Aim for 90%+ before booking the real exam.

## Resources That Actually Help

1. **KodeKloud CKA course** — best structured learning, includes practice labs
2. **killer.sh** — 2 sessions included with your CKA purchase from Linux Foundation
3. **kubernetes.io/docs** — learn to navigate it quickly, it's your lifeline in the exam
4. **Kubernetes the Hard Way** (Kelsey Hightower) — if you want to really understand what kubeadm does

## Booking and Logistics

- Buy from training.linuxfoundation.org — includes one free retake
- Schedule at least 2-3 weeks after you feel ready (exam slots book up)
- Online proctored — you need a clean desk, webcam, and quiet room
- 66% to pass. You don't need to be perfect.
    `
  },
  "rag-beginner-guide": {
    title: "Build a RAG System in Python: Step-by-Step with Claude API",
    tag: "AI", date: "March 2025", readTime: "15 min read",
    content: `
## What is RAG and Why Do You Need It?

LLMs like Claude are trained on data up to a cutoff date. They don't know about:
- Your internal company documents
- Recent events after their training
- Your specific product, codebase, or knowledge base

RAG (Retrieval-Augmented Generation) solves this by retrieving relevant information from your documents at query time and giving it to the LLM as context. The LLM answers based on YOUR documents, not just its training data.

## How RAG Works

\`\`\`
Your PDFs/docs
      ↓
  Split into chunks (500 words each)
      ↓
  Convert chunks to embeddings (vectors)
      ↓
  Store in vector database
      ↓
[User asks question]
      ↓
  Convert question to embedding
      ↓
  Find most similar chunks in vector DB
      ↓
  Send: question + relevant chunks → Claude
      ↓
  Claude answers based on YOUR documents
\`\`\`

## Install Dependencies

\`\`\`bash
pip install anthropic langchain langchain-community chromadb pypdf sentence-transformers
\`\`\`

## Complete RAG System

\`\`\`python
import anthropic
from langchain_community.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma

client = anthropic.Anthropic()

def load_and_index_documents(file_paths: list[str]):
    """Load PDFs and build the vector database."""
    # Load documents
    all_docs = []
    for path in file_paths:
        loader = PyPDFLoader(path)
        all_docs.extend(loader.load())
    
    # Split into chunks
    splitter = RecursiveCharacterTextSplitter(
        chunk_size=500,
        chunk_overlap=50,
    )
    chunks = splitter.split_documents(all_docs)
    print(f"Created {len(chunks)} chunks from {len(all_docs)} pages")
    
    # Create embeddings (free, runs locally)
    embeddings = HuggingFaceEmbeddings(
        model_name="sentence-transformers/all-MiniLM-L6-v2"
    )
    
    # Store in Chroma vector database
    vectorstore = Chroma.from_documents(chunks, embeddings)
    return vectorstore

def answer_question(vectorstore, question: str) -> dict:
    """Find relevant docs and ask Claude to answer."""
    # Find the 4 most relevant chunks
    relevant_docs = vectorstore.similarity_search(question, k=4)
    
    # Build context from retrieved chunks
    context = "\n\n---\n\n".join([
        f"[Source: {doc.metadata.get('source', 'document')} page {doc.metadata.get('page', '?')}]\n{doc.page_content}"
        for doc in relevant_docs
    ])
    
    # Ask Claude
    response = client.messages.create(
        model="claude-haiku-4-5-20251001",  # Fast and cheap for Q&A
        max_tokens=1000,
        system="""Answer questions based ONLY on the provided context.
        
Rules:
- Only use information from the context below
- If the answer is not in the context, say "I don't have that information in these documents"
- Always cite which source/page your answer comes from
- Be concise and direct""",
        messages=[{
            "role": "user",
            "content": f"Context:\n{context}\n\nQuestion: {question}"
        }]
    )
    
    return {
        "answer": response.content[0].text,
        "sources": list(set([
            f"Page {doc.metadata.get('page', '?')}"
            for doc in relevant_docs
        ])),
        "cost_usd": round(
            (response.usage.input_tokens * 0.00025 + response.usage.output_tokens * 0.00125) / 1000,
            5
        )
    }

# Usage
if __name__ == "__main__":
    # Index your documents (do this once)
    vs = load_and_index_documents(["company_handbook.pdf", "product_docs.pdf"])
    
    # Ask questions
    questions = [
        "What is the refund policy?",
        "How do I reset my password?",
        "What are the office hours?",
    ]
    
    for q in questions:
        print(f"\nQ: {q}")
        result = answer_question(vs, q)
        print(f"A: {result['answer']}")
        print(f"Sources: {', '.join(result['sources'])}")
        print(f"Cost: \${result['cost_usd']}")
\`\`\`

## Add a Web Interface with Streamlit

\`\`\`bash
pip install streamlit
\`\`\`

\`\`\`python
# app.py
import streamlit as st

st.title("Document Q&A")

uploaded = st.file_uploader("Upload PDFs", type="pdf", accept_multiple_files=True)

if uploaded and "vectorstore" not in st.session_state:
    with st.spinner("Indexing documents..."):
        # Save uploaded files temporarily
        import tempfile, os
        paths = []
        for f in uploaded:
            with tempfile.NamedTemporaryFile(delete=False, suffix=".pdf") as tmp:
                tmp.write(f.read())
                paths.append(tmp.name)
        st.session_state.vectorstore = load_and_index_documents(paths)
    st.success(f"Indexed {len(uploaded)} documents!")

if "vectorstore" in st.session_state:
    question = st.text_input("Ask a question about your documents:")
    if question:
        with st.spinner("Searching and answering..."):
            result = answer_question(st.session_state.vectorstore, question)
        st.write(result["answer"])
        st.caption(f"Sources: {', '.join(result['sources'])} | Cost: \${result['cost_usd']}")
\`\`\`

\`\`\`bash
streamlit run app.py
\`\`\`

## What's Next

This is a basic RAG system. Production systems add: hybrid search (BM25 + vectors), reranking, query rewriting, chunk metadata filtering, and evaluation pipelines. Check the RAG section in the AI Academy for advanced patterns.
    `
  },
};

export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) return { title: "Article Not Found" };
  return {
    title: `${article.title} | SynfraCore Blog`,
    description: article.title,
  };
}

export default async function BlogPost({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) notFound();

  const tagColors: Record<string, string> = {
    Docker: "#3B82F6", Kubernetes: "#8B5CF6", Terraform: "#7C3AED",
    Career: "#10B981", AI: "#F59E0B", Cloud: "#06B6D4",
  };
  const color = tagColors[article.tag] || "#3B82F6";

  // Parse markdown-like content to HTML (simple version)
  const html = article.content
    .trim()
    .split("\n")
    .map(line => {
      if (line.startsWith("## ")) return `<h2>${line.slice(3)}</h2>`;
      if (line.startsWith("### ")) return `<h3>${line.slice(4)}</h3>`;
      if (line.startsWith("**") && line.endsWith("**")) return `<p><strong>${line.slice(2, -2)}</strong></p>`;
      if (line.startsWith("- ")) return `<li>${line.slice(2)}</li>`;
      if (line.startsWith("| ")) return `<tr>${line.split("|").filter(Boolean).map(c => `<td>${c.trim()}</td>`).join("")}</tr>`;
      if (line === "---") return `<hr/>`;
      if (line.startsWith("\`\`\`")) return line === "\`\`\`" ? "</pre>" : `<pre><code class="lang-${line.slice(3)}">`;
      if (line === "") return "<br/>";
      return `<p>${line}</p>`;
    })
    .join("\n");

  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "48px 24px" }}>
      {/* Breadcrumb */}
      <div style={{ display: "flex", gap: "8px", alignItems: "center", fontSize: "13px", color: "var(--text-4)", marginBottom: "32px" }}>
        <Link href="/blog" style={{ color: "var(--text-4)", textDecoration: "none" }}>Blog</Link>
        <span>/</span>
        <span style={{ background: `${color}18`, color, padding: "2px 8px", borderRadius: "4px", fontWeight: 700 }}>{article.tag}</span>
      </div>

      {/* Header */}
      <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(24px, 3.5vw, 38px)", fontWeight: 800, letterSpacing: "-0.02em", lineHeight: 1.25, marginBottom: "16px" }}>
        {article.title}
      </h1>
      <div style={{ display: "flex", gap: "16px", fontSize: "13px", color: "var(--text-4)", marginBottom: "40px", paddingBottom: "32px", borderBottom: "1px solid var(--border)" }}>
        <span>SynfraCore</span>
        <span>·</span>
        <span>{article.date}</span>
        <span>·</span>
        <span>{article.readTime}</span>
      </div>

      {/* Content */}
      <div className="prose" style={{ fontSize: "16px", lineHeight: 1.85, color: "var(--text-3)" }}
        dangerouslySetInnerHTML={{ __html: html }} />

      {/* Footer */}
      <div style={{ marginTop: "64px", paddingTop: "32px", borderTop: "1px solid var(--border)", display: "flex", justifyContent: "space-between", alignItems: "center", gap: "16px", flexWrap: "wrap" }}>
        <Link href="/blog" style={{ color: "var(--text-4)", textDecoration: "none", fontSize: "14px" }}>← All articles</Link>
        <Link href={`/academies/devops/${article.tag.toLowerCase()}`}
          style={{ background: `${color}18`, color, padding: "8px 16px", borderRadius: "8px", textDecoration: "none", fontSize: "13px", fontWeight: 700 }}>
          Learn {article.tag} →
        </Link>
      </div>
    </div>
  );
}
