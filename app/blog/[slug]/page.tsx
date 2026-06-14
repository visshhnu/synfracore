export const runtime = "edge";
import { notFound } from "next/navigation";
import Link from "next/link";
import { ShareButtons } from "@/components/growth/ShareButtons";
import { NewsletterSignup } from "@/components/growth/NewsletterSignup";
import { TelegramBanner } from "@/components/growth/TelegramBanner";

type Props = { params: Promise<{ slug: string }> };

const articles: Record<string, { title: string; tag: string; date: string; readTime: string; body: string[] }> = {
  "docker-beginner-guide": {
    title: "Docker for Beginners: From Zero to Your First Container in 30 Minutes",
    tag: "Docker", date: "January 2025", readTime: "8 min read",
    body: [
      "## What is Docker and Why Does It Matter?",
      "Docker packages applications into containers — lightweight, portable units that include everything the app needs: code, runtime, and libraries. The problem it solves: 'It works on my machine.' Containers run identically everywhere.",
      "## Install Docker",
      "**macOS / Windows:** Download Docker Desktop from docker.com. It includes everything.",
      "**Ubuntu/Linux:**",
      "```bash\ncurl -fsSL https://get.docker.com | sh\nsudo usermod -aG docker $USER\ndocker run hello-world\n```",
      "## Your First Container",
      "```bash\ndocker run -d -p 8080:80 --name my-nginx nginx\n# Visit http://localhost:8080\ndocker ps\ndocker logs my-nginx\ndocker stop my-nginx && docker rm my-nginx\n```",
      "## Build Your Own Image",
      "Create a file called `Dockerfile`:",
      "```dockerfile\nFROM python:3.12-slim\nWORKDIR /app\nCOPY requirements.txt .\nRUN pip install --no-cache-dir -r requirements.txt\nCOPY . .\nEXPOSE 8000\nCMD [\"python\", \"app.py\"]\n```",
      "```bash\ndocker build -t my-app:v1 .\ndocker run -d -p 8000:8000 my-app:v1\n```",
      "## Docker Compose for Multi-Container Apps",
      "```yaml\nversion: \"3.8\"\nservices:\n  web:\n    build: .\n    ports: [\"8000:8000\"]\n    depends_on: [db]\n  db:\n    image: postgres:16-alpine\n    environment:\n      POSTGRES_PASSWORD: secret\n    volumes: [db-data:/var/lib/postgresql/data]\nvolumes:\n  db-data:\n```",
      "```bash\ndocker compose up -d\ndocker compose logs -f\ndocker compose down\n```",
      "## Essential Commands",
      "```bash\ndocker ps                 # Running containers\ndocker ps -a              # All containers\ndocker images             # List images\ndocker exec -it myapp sh  # Shell into container\ndocker logs myapp         # View logs\ndocker stats              # Live resource usage\ndocker system prune       # Clean up unused resources\n```",
      "## What Next?",
      "Go to the Docker Intermediate section to learn multi-stage builds, networking, and production security patterns.",
    ]
  },
  "kubernetes-vs-docker-swarm": {
    title: "Kubernetes vs Docker Swarm in 2025: Which Should You Learn First?",
    tag: "Kubernetes", date: "January 2025", readTime: "6 min read",
    body: [
      "## The Short Answer",
      "Learn Kubernetes. The job market has decided — Kubernetes appears in 94% of container orchestration job postings. Docker Swarm is rare.",
      "## Docker Swarm: Simple and Fast",
      "Swarm is built into Docker. Zero installation required.",
      "```bash\ndocker swarm init\ndocker service create --replicas 3 --name api my-api:v1\ndocker service scale api=5\n```",
      "Simple, production-ready for smaller deployments. Good for: small teams, simple apps, minimal operational overhead.",
      "## Kubernetes: Powerful but Complex",
      "```yaml\napiVersion: apps/v1\nkind: Deployment\nmetadata: {name: api}\nspec:\n  replicas: 3\n  selector: {matchLabels: {app: api}}\n  template:\n    spec:\n      containers:\n      - name: api\n        image: my-api:v1\n        resources:\n          limits: {memory: \"256Mi\", cpu: \"500m\"}\n```",
      "More verbose but more powerful: autoscaling, service mesh, custom resources, 1000+ ecosystem tools.",
      "## Job Market Reality (2025)",
      "Job postings mentioning Kubernetes: ~94%. Job postings mentioning Docker Swarm: ~6%. Every major cloud provider offers managed Kubernetes (EKS, GKE, AKS). The market has spoken.",
      "## When to Use Docker Swarm Instead",
      "Small team, simple stack, need to ship fast. Existing Docker Compose files you want to scale slightly. Resource-constrained environments (Swarm overhead is much lower).",
      "## Recommendation",
      "Learn Kubernetes for your career. Start with minikube or kind locally. Master Deployments, Services, ConfigMaps, Secrets, then Helm. That foundation will serve you for years.",
    ]
  },
  "terraform-aws-starter": {
    title: "Your First Terraform Project: Build a Complete AWS VPC in 20 Minutes",
    tag: "Terraform", date: "February 2025", readTime: "10 min read",
    body: [
      "## Prerequisites",
      "AWS account (free tier works), Terraform installed (`brew install terraform`), AWS CLI configured (`aws configure`).",
      "## Project Structure",
      "```\nterraform-vpc/\n├── main.tf\n├── variables.tf\n├── outputs.tf\n└── terraform.tfvars\n```",
      "## variables.tf",
      "```hcl\nvariable \"region\"      { default = \"ap-south-1\" }\nvariable \"project\"     { default = \"myproject\" }\nvariable \"environment\" { default = \"dev\" }\n```",
      "## main.tf — Core Resources",
      "```hcl\nterraform {\n  required_providers {\n    aws = { source = \"hashicorp/aws\", version = \"~> 5.0\" }\n  }\n}\n\nprovider \"aws\" { region = var.region }\n\nresource \"aws_vpc\" \"main\" {\n  cidr_block           = \"10.0.0.0/16\"\n  enable_dns_hostnames = true\n  tags = { Name = \"${var.project}-${var.environment}-vpc\" }\n}\n\nresource \"aws_subnet\" \"public\" {\n  count                   = 2\n  vpc_id                  = aws_vpc.main.id\n  cidr_block              = \"10.0.${count.index}.0/24\"\n  availability_zone       = data.aws_availability_zones.available.names[count.index]\n  map_public_ip_on_launch = true\n}\n\nresource \"aws_nat_gateway\" \"main\" {\n  allocation_id = aws_eip.nat.id\n  subnet_id     = aws_subnet.public[0].id\n}\n\ndata \"aws_availability_zones\" \"available\" { state = \"available\" }\n```",
      "## Apply It",
      "```bash\nterraform init    # Download AWS provider\nterraform plan    # Preview (23 resources)\nterraform apply   # Type yes to create\nterraform output  # See VPC ID and subnet IDs\nterraform destroy # Clean up when done\n```",
      "## Cost Warning",
      "The NAT Gateway costs ~$0.05/hour. Run `terraform destroy` when you are done learning to avoid charges.",
    ]
  },
  "devops-salary-india-2025": {
    title: "DevOps Engineer Salaries in India 2025: City-wise, Experience-wise Breakdown",
    tag: "Career", date: "February 2025", readTime: "5 min read",
    body: [
      "## Salary Ranges by Experience",
      "Data from Naukri, LinkedIn, Glassdoor, and community surveys (2024-2025).",
      "## Junior DevOps Engineer (0-2 years)",
      "Bangalore: ₹6-12 LPA | Hyderabad: ₹5-10 LPA | Pune: ₹5-9 LPA | Mumbai: ₹6-11 LPA | Remote: ₹5-10 LPA",
      "What gets you to the higher end: Kubernetes certification (CKA), AWS/Azure cert, actual project experience.",
      "## Mid-Level (2-5 years)",
      "Bangalore: ₹15-28 LPA | Hyderabad: ₹12-24 LPA | Pune: ₹12-22 LPA | Remote: ₹14-25 LPA",
      "Key differentiators: owning production systems, cloud certifications (AWS SAA), team lead experience.",
      "## Senior DevOps / Platform Engineer (5-8 years)",
      "Bangalore: ₹28-50 LPA | Remote: ₹25-45 LPA. Architecture decisions, mentoring, and incident ownership define this level.",
      "## Skills That Increase Salary",
      "| Skill | Salary Bump |\n|---|---|\n| Kubernetes (CKA certified) | +20-35% |\n| AWS Solutions Architect | +15-25% |\n| Platform Engineering | +25-40% |\n| AI/ML infra (LLMOps) | +30-50% |",
      "## Product vs Service Companies",
      "Product companies (Flipkart, Swiggy, CRED, Razorpay): 30-60% above market. MNC product offices (Google, Microsoft, Amazon): 2-4x market rate. MNC services (TCS, Infosys): usually at or below market rate.",
      "## How to Move Up Faster",
      "1. Certifications matter at 0-3 years (unlock resume filters). 2. Build real projects on GitHub — not tutorials. 3. Contribute to internal projects that go to production. 4. Study one level above your current role.",
    ]
  },
  "cka-exam-guide": {
    title: "CKA Exam Guide 2025: What I Wish I Knew Before Studying",
    tag: "Kubernetes", date: "March 2025", readTime: "12 min read",
    body: [
      "## The CKA is Different",
      "Not multiple choice — it is a live terminal exam. You get a Kubernetes cluster and 2 hours to complete 15-20 hands-on tasks. No options to pick from. You either know how to do it or you do not.",
      "## Domain Weights",
      "30% Troubleshooting | 25% Cluster Architecture | 20% Services and Networking | 15% Workloads | 10% Storage. Troubleshooting is the biggest section — spend most prep time on it.",
      "## The 5 Mistakes Most Candidates Make",
      "**1. Studying theory instead of practicing** — Muscle memory matters. Set up minikube and do everything from the CLI.",
      "**2. Not mastering kubectl shortcuts** — 7 minutes per task. Speed is essential.",
      "```bash\nalias k=kubectl\nexport do=\"--dry-run=client -o yaml\"\nexport now=\"--force --grace-period 0\"\n```",
      "**3. Not using killer.sh** — Buy the exam from Linux Foundation (includes killer.sh sessions). It is harder than the real exam. Score 85%+ there before booking.",
      "**4. Skipping ETCD backup/restore** — Appears in almost every exam. Practice until automatic.",
      "**5. Not practicing the exam docs** — kubernetes.io/docs is allowed. Learn to navigate it fast.",
      "## 6-Week Study Plan",
      "Weeks 1-2: Core objects (Pods, Deployments, Services, ConfigMaps, Secrets). Weeks 3-4: RBAC, NetworkPolicy, PV/PVC, Ingress, HPA. Week 5: Troubleshooting — set up broken clusters and fix them. Week 6: killer.sh mock exams only.",
      "## Resources",
      "KodeKloud CKA course (best structured content), killer.sh (2 sessions included with exam purchase), kubernetes.io/docs (practice navigating it — it is your lifeline in the exam). Passing score: 66%.",
    ]
  },
  "rag-beginner-guide": {
    title: "Build a RAG System in Python: Step-by-Step with Claude API",
    tag: "AI", date: "March 2025", readTime: "15 min read",
    body: [
      "## What is RAG and Why You Need It",
      "LLMs do not know your internal documents. RAG (Retrieval-Augmented Generation) retrieves relevant content from YOUR documents at query time and gives it to the LLM as context. The LLM answers based on YOUR data, not just its training.",
      "## Install Dependencies",
      "```bash\npip install anthropic langchain langchain-community chromadb pypdf sentence-transformers\n```",
      "## Complete RAG System",
      "```python\nimport anthropic\nfrom langchain_community.document_loaders import PyPDFLoader\nfrom langchain.text_splitter import RecursiveCharacterTextSplitter\nfrom langchain_community.embeddings import HuggingFaceEmbeddings\nfrom langchain_community.vectorstores import Chroma\n\nclient = anthropic.Anthropic()\n\ndef load_documents(paths):\n    all_docs = []\n    for p in paths:\n        all_docs.extend(PyPDFLoader(p).load())\n    chunks = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50).split_documents(all_docs)\n    embeddings = HuggingFaceEmbeddings(model_name=\"sentence-transformers/all-MiniLM-L6-v2\")\n    return Chroma.from_documents(chunks, embeddings)\n\ndef answer(vectorstore, question):\n    docs = vectorstore.similarity_search(question, k=4)\n    context = \"\\n\\n\".join([d.page_content for d in docs])\n    r = client.messages.create(\n        model=\"claude-haiku-4-5-20251001\",\n        max_tokens=800,\n        system=\"Answer ONLY from the provided context. Say so if the answer is not there.\",\n        messages=[{\"role\": \"user\", \"content\": f\"Context:\\n{context}\\n\\nQuestion: {question}\"}]\n    )\n    return r.content[0].text\n\nvs = load_documents([\"company_handbook.pdf\"])\nprint(answer(vs, \"What is the refund policy?\"))\n```",
      "## Add Streamlit UI",
      "```python\nimport streamlit as st\nst.title(\"Document Q&A\")\nuploaded = st.file_uploader(\"Upload PDFs\", type=\"pdf\", accept_multiple_files=True)\nif uploaded:\n    # save to temp files, load_documents(), show chat interface\n    pass\n```",
      "```bash\nstreamlit run app.py\n```",
      "## What Makes a Production RAG Better",
      "This is a basic implementation. Production systems add: hybrid search (BM25 + vectors), reranking, query rewriting, and evaluation pipelines. See the RAG section in the AI Academy for advanced patterns.",
    ]
  },
  "ansible-playbook-guide": {
    title: "Your First Ansible Playbook: Automate Server Setup in 15 Minutes",
    tag: "DevOps", date: "April 2025", readTime: "10 min read",
    body: [
      "## The Problem Ansible Solves",
      "You have 10 new Ubuntu servers. Each needs nginx, a deploy user, firewall rules, and app config. Manually: 2 hours. With Ansible: 3 minutes, identically on all 10.",
      "## setup-webserver.yml",
      "```yaml\n---\n- name: Set up web servers\n  hosts: webservers\n  become: true\n  vars:\n    app_port: 8080\n    deploy_user: deploy\n  tasks:\n    - name: Install nginx\n      apt: { name: nginx, state: present, update_cache: yes }\n    - name: Start nginx\n      service: { name: nginx, state: started, enabled: yes }\n    - name: Create deploy user\n      user: { name: \"{{ deploy_user }}\", shell: /bin/bash, groups: sudo }\n    - name: Allow ports\n      ufw: { rule: allow, port: \"{{ item }}\", proto: tcp }\n      loop: [\"22\", \"80\", \"443\", \"{{ app_port }}\"]\n    - name: Copy nginx config\n      template: { src: templates/nginx.conf.j2, dest: /etc/nginx/conf.d/myapp.conf }\n      notify: Reload nginx\n  handlers:\n    - name: Reload nginx\n      service: { name: nginx, state: reloaded }\n```",
      "## Inventory File",
      "```ini\n[webservers]\nserver1 ansible_host=192.168.1.10 ansible_user=ubuntu\nserver2 ansible_host=192.168.1.11 ansible_user=ubuntu\nserver3 ansible_host=192.168.1.12 ansible_user=ubuntu\n```",
      "## Run It",
      "```bash\nansible-playbook -i inventory.ini setup-webserver.yml --check  # Dry run\nansible-playbook -i inventory.ini setup-webserver.yml           # Run\n```",
      "## Key Concepts",
      "**Idempotency:** Run 10 times, same result as once. nginx being 'present' is checked, not installed blindly.",
      "**Handlers:** Only run when triggered by `notify`. Nginx only reloads if the config file actually changed.",
      "**Loops:** `loop` runs the same task with different values — cleaner than copy-pasting 4 identical tasks.",
      "Next: Ansible Intermediate covers roles, Vault (encrypted secrets), and dynamic cloud inventory.",
    ]
  },
  "postgresql-indexing-guide": {
    title: "PostgreSQL Indexing: Why Your Queries Are Slow and How to Fix Them",
    tag: "Databases", date: "April 2025", readTime: "12 min read",
    body: [
      "## Always Read the Plan First",
      "```sql\nEXPLAIN ANALYZE\nSELECT * FROM orders WHERE user_id = 12345;\n```",
      "Two outcomes:\n- `Seq Scan on orders` — reads EVERY row. Add an index.\n- `Index Scan using idx_orders_user_id` — fast. Good.",
      "## Rule 1: Index Every Foreign Key",
      "```sql\n-- You almost certainly run this:\nSELECT * FROM orders WHERE user_id = $1;\n\n-- Add this:\nCREATE INDEX idx_orders_user_id ON orders(user_id);\n```",
      "## Rule 2: Composite Index for WHERE + ORDER BY",
      "```sql\n-- This query:\nSELECT * FROM orders WHERE status = 'pending' ORDER BY created_at DESC;\n\n-- Needs this (column order matters!):\nCREATE INDEX idx_orders_status_created ON orders(status, created_at DESC);\n```",
      "## Rule 3: Partial Indexes",
      "```sql\n-- Only index active users:\nCREATE INDEX idx_active_users ON users(email) WHERE is_active = true;\n-- Smaller, faster, only covers rows you actually query.\n```",
      "## Rule 4: Find Your Slow Queries",
      "```sql\nCREATE EXTENSION IF NOT EXISTS pg_stat_statements;\n\nSELECT query, calls,\n       round(total_exec_time / calls) AS avg_ms\nFROM pg_stat_statements\nORDER BY avg_ms DESC LIMIT 20;\n-- Run EXPLAIN ANALYZE on the top results.\n```",
      "## Rule 5: Delete Unused Indexes",
      "```sql\nSELECT indexrelid::regclass, idx_scan\nFROM pg_stat_user_indexes\nWHERE idx_scan = 0;\n-- These indexes slow writes but help nothing. Drop them.\n\nDROP INDEX CONCURRENTLY idx_unused;  -- CONCURRENTLY avoids table lock\n```",
      "**Remember:** Every index speeds up reads but slows INSERT/UPDATE/DELETE. Only index columns you actually filter or sort by.",
    ]
  },
  "aws-cost-optimization": {
    title: "Reduce Your AWS Bill by 60%: Real Techniques That Actually Work",
    tag: "Cloud", date: "May 2025", readTime: "8 min read",
    body: [
      "## The 6 Changes That Actually Move the Needle",
      "Most cost guides list 50 things. These 6 account for 80%+ of savings.",
      "## 1. Right-Size EC2 Instances",
      "```bash\n# Check 2-week average CPU\naws cloudwatch get-metric-statistics \\\n  --namespace AWS/EC2 --metric-name CPUUtilization \\\n  --dimensions Name=InstanceId,Value=i-xxx \\\n  --start-time 2024-01-01T00:00:00Z --end-time 2024-01-14T00:00:00Z \\\n  --period 86400 --statistics Average\n\n# Average CPU < 20% and peak < 40%? Downsize by one size.\n# t3.large -> t3.medium saves ~50% on that instance.\n```",
      "## 2. Savings Plans (30-60% Discount)",
      "Commit to a spend amount for 1 year, no instance changes required. AWS Cost Management > Savings Plans > Compute Savings Plans. A t3.medium: $456/year on-demand vs $280/year on Savings Plan.",
      "## 3. S3 Lifecycle Rules",
      "```json\n{\n  \"Rules\": [{\n    \"ID\": \"Move old logs\",\n    \"Filter\": {\"Prefix\": \"logs/\"},\n    \"Transitions\": [\n      {\"Days\": 30, \"StorageClass\": \"STANDARD_IA\"},\n      {\"Days\": 90, \"StorageClass\": \"GLACIER\"}\n    ],\n    \"Expiration\": {\"Days\": 2555}\n  }]\n}\n```\nTypical result: 2TB of logs from $46/month to $8/month.",
      "## 4. Delete Orphaned EBS Volumes",
      "```bash\naws ec2 describe-volumes \\\n  --filters Name=status,Values=available \\\n  --query 'Volumes[*].[VolumeId,Size]' --output table\n# Review then delete what you do not need\n```\nAlso check: unattached Elastic IPs ($3.65/month each), unused load balancers ($18/month each).",
      "## 5. Spot Instances for Non-Critical Workloads",
      "70-90% cheaper than on-demand. Perfect for: CI/CD agents, batch jobs, dev environments. Not for: production databases or web servers.",
      "## 6. Budget Alert (Do This Today)",
      "AWS Console > Billing > Budgets > Create Budget. Also enable Cost Anomaly Detection — it catches unusual spend before you see it on the bill.",
      "| Action | Typical Saving |\n|---|---|\n| Right-sizing EC2 | 20-40% of EC2 |\n| Savings Plans | 30-60% of compute |\n| S3 Lifecycle Rules | 40-80% of S3 |\n| Spot for batch jobs | 70-90% of those workloads |",
    ]
  },
  "kubernetes-troubleshooting": {
    title: "Kubernetes Troubleshooting: The 10 Most Common Issues and Fixes",
    tag: "Kubernetes", date: "May 2025", readTime: "14 min read",
    body: [
      "## Start Here Every Time",
      "```bash\nkubectl get pods -n <namespace>\nkubectl describe pod <pod-name> -n <ns>  # Events section has the answer 80% of the time\nkubectl logs <pod-name> -n <ns>\n```",
      "## 1. CrashLoopBackOff",
      "```bash\nkubectl logs my-pod --previous  # Logs from the crashed instance\n```\nCauses: app crashes at startup, liveness probe too aggressive, OOMKilled. The logs almost always show the exact error.",
      "## 2. ImagePullBackOff",
      "```bash\nkubectl describe pod my-pod  # Look in Events\n```\nCauses: image name typo, private registry without imagePullSecret, Docker Hub rate limit.\n```bash\nkubectl create secret docker-registry regcred \\\n  --docker-server=registry.example.com \\\n  --docker-username=myuser --docker-password=mypassword\n```",
      "## 3. Pending Pod (Never Schedules)",
      "```bash\nkubectl describe pod my-pod\n# Look for: \"0/3 nodes available: Insufficient memory\"\n# Or: \"node affinity doesn't match\"\nkubectl describe nodes | grep -A 5 \"Allocated resources\"\n```",
      "## 4. OOMKilled",
      "```bash\nkubectl describe pod my-pod  # Look for OOMKilled in Last State\n# Fix: increase memory limit or fix memory leak\n# resources:\n#   limits: {memory: \"512Mi\"}  # was 256Mi\n```",
      "## 5. Service Not Reachable",
      "```bash\nkubectl get endpoints my-service  # Empty = selector mismatch\nkubectl describe service my-service  # Check Selector\nkubectl get pod my-pod --show-labels  # Do labels match?\n```",
      "## 6-10 Quick Reference",
      "**Stuck Terminating:** `kubectl delete pod stuck-pod --force --grace-period=0`\n\n**Node NotReady:** SSH to node, `sudo systemctl status kubelet && sudo journalctl -u kubelet -n 50`\n\n**Deployment Not Rolling:** `kubectl rollout status deployment/my-deploy` then check new pod logs\n\n**DNS Broken:** `kubectl run debug --image=busybox --rm -it -- nslookup kubernetes.default`\n\n**High Restarts:** `kubectl logs my-pod --previous` + check liveness probe initialDelaySeconds",
      "## Your Troubleshooting Cheatsheet",
      "```bash\n# Cluster health\nkubectl get nodes\nkubectl get pods -A | grep -v Running | grep -v Completed\nkubectl top nodes && kubectl top pods -A\n\n# Events sorted by time\nkubectl get events --sort-by=.lastTimestamp -n <namespace>\n```",
    ]
  },
};

const tagColors: Record<string, string> = {
  Docker: "#3B82F6", Kubernetes: "#8B5CF6", Terraform: "#7C3AED",
  Career: "#10B981", AI: "#F59E0B", Cloud: "#06B6D4", DevOps: "#3B82F6", Databases: "#10B981",
};

export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) return { title: "Article Not Found" };
  return { title: `${article.title} | SynfraCore Blog`, description: article.title };
}

function renderLine(line: string, i: number) {
  if (line.startsWith("## ")) return <h2 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "22px", margin: "36px 0 12px" }}>{line.slice(3)}</h2>;
  if (line.startsWith("### ")) return <h3 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", margin: "28px 0 10px" }}>{line.slice(4)}</h3>;
  if (line.startsWith("```")) {
    return null; // handled in renderBody
  }
  if (line.startsWith("| ")) {
    return null; // handled in renderBody
  }
  if (line === "") return <br key={i}/>;
  return <p key={i} style={{ margin: "0 0 14px", lineHeight: 1.85, color: "var(--text-3)" }}>{line}</p>;
}

function renderBody(body: string[]) {
  const elements: React.ReactNode[] = [];
  let i = 0;
  while (i < body.length) {
    const line = body[i];
    if (line.startsWith("```")) {
      // Find closing ```
      let code = "";
      i++;
      while (i < body.length && !body[i].startsWith("```")) {
        code += body[i] + "\n";
        i++;
      }
      elements.push(
        <pre key={i} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "20px", overflowX: "auto", fontSize: "13px", lineHeight: 1.7, margin: "16px 0" }}>
          <code style={{ fontFamily: "'JetBrains Mono',monospace", color: "var(--text-2)" }}>{code}</code>
        </pre>
      );
    } else if (line.startsWith("| ")) {
      // Collect table rows
      const rows: string[] = [];
      while (i < body.length && body[i].startsWith("| ")) {
        rows.push(body[i]);
        i++;
      }
      const [header, , ...dataRows] = rows;
      const headers = header.split("|").filter(Boolean).map(h => h.trim());
      elements.push(
        <table key={i} style={{ width: "100%", borderCollapse: "collapse", margin: "16px 0", fontSize: "14px" }}>
          <thead>
            <tr style={{ borderBottom: "2px solid var(--border)" }}>
              {headers.map((h, hi) => <th key={hi} style={{ padding: "10px 16px", textAlign: "left", fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700 }}>{h}</th>)}
            </tr>
          </thead>
          <tbody>
            {dataRows.map((row, ri) => (
              <tr key={ri} style={{ borderBottom: "1px solid var(--border)" }}>
                {row.split("|").filter(Boolean).map((c, ci) => (
                  <td key={ci} style={{ padding: "10px 16px", color: "var(--text-3)" }}>{c.trim()}</td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      );
      continue;
    } else {
      const el = renderLine(line, i);
      if (el) elements.push(el);
    }
    i++;
  }
  return elements;
}

export default async function BlogPost({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) notFound();
  const color = tagColors[article.tag] || "#3B82F6";

  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "48px 24px" }}>
      <div style={{ display: "flex", gap: "8px", alignItems: "center", fontSize: "13px", color: "var(--text-4)", marginBottom: "32px" }}>
        <a href="/blog" style={{ color: "var(--text-4)", textDecoration: "none" }}>Blog</a>
        <span>/</span>
        <span style={{ background: `${color}18`, color, padding: "2px 8px", borderRadius: "4px", fontWeight: 700 }}>{article.tag}</span>
      </div>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "clamp(22px,3.5vw,36px)", fontWeight: 800, letterSpacing: "-0.02em", lineHeight: 1.25, marginBottom: "16px" }}>
        {article.title}
      </h1>
      <div style={{ display: "flex", gap: "16px", fontSize: "13px", color: "var(--text-4)", marginBottom: "40px", paddingBottom: "32px", borderBottom: "1px solid var(--border)" }}>
        <span>SynfraCore</span><span>·</span><span>{article.date}</span><span>·</span><span>{article.readTime}</span>
      </div>
      <div style={{ fontSize: "16px" }}>
        {renderBody(article.body)}
      </div>
      {/* Share buttons */}
      <div style={{ marginTop: "48px" }}>
        <ShareButtons title={article.title} />
      </div>

      {/* Newsletter signup */}
      <div style={{ marginTop: "24px" }}>
        <NewsletterSignup variant="inline" context="blog article" />
      </div>

      {/* Telegram CTA */}
      <div style={{ marginTop: "16px" }}>
        <TelegramBanner variant="card" />
      </div>

      {/* Article footer nav */}
      <div style={{ marginTop: "40px", paddingTop: "32px", borderTop: "1px solid var(--border)", display: "flex", justifyContent: "space-between", alignItems: "center", gap: "16px", flexWrap: "wrap" }}>
        <a href="/blog" style={{ color: "var(--text-4)", textDecoration: "none", fontSize: "14px" }}>← All articles</a>
        <a href="/academies" style={{ background: `${color}18`, color, padding: "8px 16px", borderRadius: "8px", textDecoration: "none", fontSize: "13px", fontWeight: 700 }}>
          Start Learning {article.tag} →
        </a>
      </div>
    </div>
  );
}
