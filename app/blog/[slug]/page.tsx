export const runtime = "edge";
import { notFound } from "next/navigation";
import Link from "next/link";
import { ShareButtons } from "@/components/growth/ShareButtons";
import { NewsletterSignup } from "@/components/growth/NewsletterSignup";
import { TelegramBanner } from "@/components/growth/TelegramBanner";
import { BlogReactions } from "@/components/blog/BlogReactions";

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
    title: "Build a RAG System in Python: Step-by-Step with SynfraAI",
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

  "how-to-learn-devops-2026": {
    title: "How to Learn DevOps in 2026: The Complete Roadmap",
    tag: "DevOps", date: "January 2026", readTime: "10 min read",
    body: [
      "## What DevOps Actually Means in 2026",
      "DevOps is not a job title or a tool — it is a culture and practice of breaking the wall between development and operations teams. In 2026, every tech company runs on DevOps principles: fast deployments, automated testing, infrastructure as code, and continuous feedback loops.",
      "## The Correct Learning Order",
      "Most beginners make the mistake of jumping into Kubernetes before understanding Linux. Here is the sequence that actually gets you hired:\n\n**Phase 1 — Foundation (Months 1-2):** Linux fundamentals, Git, basic networking (TCP/IP, DNS, HTTP), and Python or Bash scripting. Without these, nothing else makes sense.\n\n**Phase 2 — Containers (Month 3):** Docker. Build images, run containers, write Docker Compose files. This is the single most employable skill in the list.\n\n**Phase 3 — Cloud (Months 4-5):** Pick one cloud — AWS for maximum job opportunities. Learn EC2, S3, VPC, IAM, RDS. Get the AWS Solutions Architect Associate certification.\n\n**Phase 4 — Orchestration (Month 6):** Kubernetes. Deployments, Services, ConfigMaps, Secrets, Ingress. Study for CKA.\n\n**Phase 5 — Automation (Months 7-8):** Terraform and Ansible. These appear in almost every DevOps job description.\n\n**Phase 6 — CI/CD and Monitoring (Months 9-10):** Jenkins or GitHub Actions for pipelines. Prometheus and Grafana for monitoring.",
      "## What to Build to Get Hired",
      "Projects matter more than certificates. Build these three:\n1. A Dockerized web app deployed on AWS EC2 with a CI/CD pipeline\n2. A Kubernetes cluster on EKS with Helm charts\n3. A Terraform module that provisions a complete AWS environment\n\nPut all three on GitHub with good READMEs. This is what interviewers actually look at.",
      "## Salary Expectations in 2026 (India)",
      "Fresher: ₹4-8 LPA. 2-3 years: ₹12-20 LPA. 5+ years: ₹25-45 LPA. Senior/Architect: ₹50-80 LPA. Remote roles for foreign companies: $40,000-$100,000+ USD. OpenShift skills add ₹5-10 LPA premium in telecom and enterprise.",
      "## Start Today",
      "Do not wait until you know everything. Deploy your first Docker container today. The rest will follow. Check out the [SynfraCore DevOps Academy](/academies/devops) for the complete structured learning path.",
    ]
  },
  "devops-salary-india-2026": {
    title: "DevOps Engineer Salary in India 2026: City-wise Breakdown",
    tag: "Career", date: "February 2026", readTime: "8 min read",
    body: [
      "## The Numbers That Matter",
      "DevOps is one of the highest-paying tech roles in India in 2026. Here is the real data from Naukri, LinkedIn, and community salary surveys.",
      "## By Experience Level",
      "| Level | Experience | Salary Range |\n|---|---|---|\n| Fresher | 0-1 year | ₹3.5 - 7 LPA |\n| Junior | 1-3 years | ₹8 - 15 LPA |\n| Mid | 3-5 years | ₹15 - 28 LPA |\n| Senior | 5-8 years | ₹28 - 50 LPA |\n| Lead/Architect | 8+ years | ₹50 - 90 LPA |",
      "## By City",
      "**Bengaluru:** India's DevOps capital. Best salaries, most openings. Mid-level: ₹18-30 LPA.\n\n**Hyderabad:** Growing fast. Major AWS, Microsoft, Google offices. Mid-level: ₹15-25 LPA.\n\n**Pune:** Strong DevOps market. Mid-level: ₹14-22 LPA.\n\n**Chennai:** Good opportunities. Mid-level: ₹12-20 LPA.\n\n**Mumbai:** Finance and fintech companies. Mid-level: ₹15-26 LPA.\n\n**Remote:** The game-changer. Indian engineers working for US/EU companies earn ₹40-100 LPA remotely.",
      "## Skills That Increase Your Salary",
      "- **Kubernetes + CKA certification:** +₹3-8 LPA premium\n- **AWS with SAA-C03:** +₹2-5 LPA premium\n- **OpenShift (OCP):** +₹5-10 LPA in enterprise/telecom\n- **Terraform + IaC:** +₹3-6 LPA\n- **Platform Engineering:** +₹8-15 LPA over regular DevOps\n- **AI/ML Ops integration:** Emerging, +₹5-15 LPA",
      "## How to Negotiate",
      "Always counter-offer. Come with data from Naukri/LinkedIn for your role and city. CKA or AWS SAA certification is worth ₹2-5 LPA in negotiation power alone. Working for a US startup remotely is the highest ROI move — a mid-level engineer at ₹18 LPA locally can earn ₹50-80 LPA remotely.",
    ]
  },
  "openshift-vs-kubernetes-2026": {
    title: "OpenShift vs Kubernetes 2026: Enterprise Choice Explained",
    tag: "DevOps", date: "March 2026", readTime: "9 min read",
    body: [
      "## OpenShift Is Kubernetes — Plus Enterprise Additions",
      "OpenShift is not a replacement for Kubernetes — it IS Kubernetes, with enterprise additions. Every kubectl command works on OpenShift (using the oc CLI which is a superset). Same Deployments, Services, ConfigMaps. What OpenShift adds is what enterprises actually need in production.",
      "## Key Additions Over Vanilla Kubernetes",
      "**Security Context Constraints (SCCs):** More granular than Kubernetes Pod Security Admission. Battle-tested in highly regulated environments.\n\n**Built-in HAProxy Router (Routes):** No need to install and configure an Ingress controller. Works out of the box with Edge, Passthrough, and Reencrypt TLS modes.\n\n**Cluster Version Operator:** Managed upgrades. `oc adm upgrade` upgrades all components in the right order, rolling nodes one by one. Vanilla Kubernetes upgrades are manual and risky.\n\n**OperatorHub:** One-click installation of certified, Red Hat-supported operators. All tested and supported under one support contract.",
      "## Where OpenShift Dominates",
      "**Telecom:** 5G networks, NFV workloads, ORAN. Vodafone, Orange, Nokia deployments are almost universally on OpenShift.\n\n**Banking and Finance:** Compliance, FedRAMP, FIPS 140-2.\n\n**Healthcare:** HIPAA compliance and enterprise support SLAs.\n\n**Government:** Air-gapped deployments with the Agent-based installer.",
      "## The Job Market Reality",
      "OpenShift skills command a ₹5-10 LPA premium in enterprise and telecom hiring. Red Hat Certified OpenShift Administrator (EX280) is one of the most valuable certifications for senior DevOps roles in India in 2026.",
      "## Verdict",
      "Startups and small teams: managed Kubernetes (EKS, GKE, AKS) — most flexibility at lowest cost. Enterprises with security and compliance requirements: OpenShift. Learn both — start with Kubernetes fundamentals, then OpenShift for enterprise work. Check out our [OpenShift Academy](/academies/devops/openshift) for the complete OCP learning path.",
    ]
  },
  "what-is-rag-2026": {
    title: "What is RAG? Retrieval-Augmented Generation Explained Simply (2026)",
    tag: "AI", date: "January 2026", readTime: "8 min read",
    body: [
      "## The Problem RAG Solves",
      "Large Language Models like GPT-4 and Claude/SynfraAI know a lot — but they were trained on data up to a certain date, and they do not know anything specific to your organisation: internal documents, customer data, recent updates, proprietary knowledge. RAG (Retrieval-Augmented Generation) solves this by giving the LLM relevant documents at query time.",
      "## How RAG Works",
      "```\n1. INGEST (done once):\n   Your documents → split into chunks → convert to vectors (embeddings)\n   → store in a vector database\n\n2. QUERY (every user question):\n   Question → converted to vector → vector DB finds similar chunks\n   → top K chunks + question sent to LLM → answer with context\n```",
      "## Build a Simple RAG System",
      "```python\nfrom langchain_community.document_loaders import PyPDFLoader\nfrom langchain.text_splitter import RecursiveCharacterTextSplitter\nfrom langchain_community.vectorstores import Chroma\nfrom langchain_community.embeddings import HuggingFaceEmbeddings\nimport anthropic\n\n# Step 1: Load and split\ndocs = PyPDFLoader('handbook.pdf').load()\nchunks = RecursiveCharacterTextSplitter(chunk_size=500).split_documents(docs)\n\n# Step 2: Create vector store\nvectorstore = Chroma.from_documents(chunks, HuggingFaceEmbeddings())\n\n# Step 3: Answer questions\ndef ask(question):\n    results = vectorstore.similarity_search(question, k=3)\n    context = '\\n\\n'.join([r.page_content for r in results])\n    client = anthropic.Anthropic()\n    msg = client.messages.create(\n        model='claude-sonnet-4-6', max_tokens=1024,\n        messages=[{'role': 'user', 'content': f'Context:\\n{context}\\n\\nAnswer: {question}'}]\n    )\n    return msg.content[0].text\n```",
      "## RAG vs Fine-tuning",
      "**Fine-tuning:** Train model on your data — expensive, slow to update, good for style/format adaptation.\n**RAG:** Retrieve context at query time — cheap, always up to date, good for factual Q&A over documents.\n\nFor most enterprise use cases in 2026, RAG is the correct approach. Fine-tune only when RAG cannot solve the problem.",
      "## Learn More",
      "See the [AI Academy RAG section](/academies/ai/rag) for hands-on RAG tutorials with code examples.",
    ]
  },
  "gut-health-complete-guide-2026": {
    title: "Gut Health 2026: The Complete Guide to Your Microbiome",
    tag: "Health", date: "January 2026", readTime: "10 min read",
    body: [
      "## Your Gut Is Your Second Brain",
      "Your gut contains approximately 100 trillion bacteria — more cells than your entire body. This microbiome influences not just digestion, but your immune system (70% lives in the gut), mental health (90% of serotonin produced in the gut), energy levels, sleep quality, and risk of chronic diseases.",
      "## Signs of an Unhealthy Gut",
      "If you experience several of these regularly, your gut health needs attention: frequent bloating or gas, irregular bowel movements, food intolerances that have developed over time, persistent fatigue, poor sleep quality, skin problems (acne, eczema), frequent infections, anxiety or depression, sugar cravings, brain fog.",
      "## Five Pillars of Gut Health",
      "**1. Diverse Diet:** Aim to eat 30+ different plant foods per week. Each plant feeds different bacteria, creating a more diverse microbiome. Monday: apple, banana, brown rice, lentils, spinach, garlic, onion = 7 plants already.\n\n**2. Fermented Foods:** Include daily — idli, dosa, dhokla (excellent Indian fermented foods), yogurt with live cultures, kefir, kimchi. These add beneficial bacteria directly.\n\n**3. Prebiotic Foods:** Feed your bacteria — garlic, onion, bananas (slightly underripe), oats, chickpeas, lentils (dal).\n\n**4. Reduce Gut Disruptors:** Ultra-processed foods (chips, biscuits, instant noodles), excess sugar, unnecessary antibiotics, artificial sweeteners.\n\n**5. Lifestyle:** Sleep 7-9 hours (gut has a circadian rhythm), 30 minutes exercise daily, manage chronic stress (biggest microbiome disruptor).",
      "## A 7-Day Gut Reset",
      "**Days 1-3:** Remove ultra-processed foods and excess sugar. You may feel worse initially (die-off of bad bacteria — normal).\n**Days 4-7:** Add one serving of fermented food daily. Increase vegetables to half your plate at every meal. Add a handful of nuts or seeds.\n**Ongoing:** Diversity is the goal. If your diet looks the same every day, your microbiome is not diverse.",
      "## The India Advantage",
      "Traditional Indian cooking is excellent for gut health: idli and dosa (fermented), turmeric (anti-inflammatory), cumin and coriander (digestive), lentils and chickpeas (prebiotic fibre), fenugreek (methi). Traditional Indian food that is minimally processed is genuinely one of the best gut-health diets in the world.",
    ]
  },
  "mental-health-tech-professionals-2026": {
    title: "Mental Health for Tech Professionals 2026: Recognising and Preventing Burnout",
    tag: "Health", date: "February 2026", readTime: "9 min read",
    body: [
      "## The Hidden Crisis in Tech",
      "A 2025 survey found 67% of software engineers experienced burnout in the past year. 42% said mental health issues affected their productivity. Tech culture celebrates overwork — but the consequences are real, serious, and often invisible until they become a crisis.",
      "## What Burnout Actually Is",
      "Burnout is not just being tired. It is a state of chronic stress that leads to: physical and emotional exhaustion, cynicism and detachment (you stop caring about your work), and feelings of ineffectiveness. It does not go away with a weekend off. It requires real recovery — often months.",
      "## Early Warning Signs",
      "**Cognitive:** Difficulty concentrating, forgetting things you know well, making more errors than usual.\n\n**Emotional:** Irritability, feeling overwhelmed by tasks that used to feel manageable, dread on Sunday evenings, detachment from work you used to enjoy.\n\n**Physical:** Persistent fatigue even after sleep, frequent illness, disrupted sleep.",
      "## Practical Strategies That Work",
      "**Set physical work boundaries:** Close the laptop when done. No work Slack on your personal phone.\n\n**Protect your mornings:** Do not check email or Slack until 9 AM. Use the first 30 minutes for yourself.\n\n**Separate identity from work:** Your work is what you do, not who you are. A system outage is not a personal failure.\n\n**Take real vacations:** Checking Slack on vacation is not a vacation.",
      "## When to Seek Help",
      "A therapist is not just for crisis moments. In India, online therapy is now widely accessible: iCall (9152987821), YourDOST, InnerHour. Your company EAP (Employee Assistance Program) often includes free sessions — check your benefits. If you are in crisis: Vandrevala Foundation: 1860-2662-345 (24/7).",
    ]
  },
  "postgresql-vs-mysql-2026": {
    title: "PostgreSQL vs MySQL 2026: Which Database Should You Choose?",
    tag: "Databases", date: "January 2026", readTime: "8 min read",
    body: [
      "## The Short Answer",
      "For new projects in 2026, choose PostgreSQL. It is more powerful, more standards-compliant, and handles complex queries better. MySQL is right when you specifically need MySQL-compatible tools or are joining an existing MySQL project.",
      "## Feature Comparison",
      "| Feature | PostgreSQL | MySQL |\n|---|---|---|\n| JSON support | Native JSONB (indexed, queryable) | JSON type (limited) |\n| Window functions | Full support | Full support (8.0+) |\n| CTEs with recursion | Yes | Yes (8.0+) |\n| Materialized views | Yes | No |\n| Extensions | pgvector, PostGIS, TimescaleDB | Plugin-based |\n| Table inheritance | Yes | No |\n| ACID compliance | Strict | Strict (InnoDB) |",
      "## PostgreSQL Wins For",
      "**Complex queries:** Query planner is more sophisticated. Complex JOINs and window functions consistently execute faster.\n\n**JSON workloads:** JSONB is indexed and fully queryable — hybrid relational + document database.\n\n**AI/Vector search:** pgvector extension makes PostgreSQL a vector database — store embeddings alongside your data.\n\n**Extensions:** The ecosystem is unmatched — geographic data (PostGIS), time-series (TimescaleDB), full-text search, vector search all in one database.",
      "## MySQL Wins For",
      "Read-heavy web apps where you need maximum concurrent reads. Legacy PHP applications (WordPress, Drupal). Existing teams with deep MySQL expertise. When MySQL-specific tools in your stack require it.",
      "## Recommendation for 2026",
      "Start with PostgreSQL for new projects. You get more features, better SQL compliance, and the pgvector extension for AI workloads. See the [PostgreSQL Academy](/academies/databases/postgresql) for fundamentals through advanced.",
    ]
  },
  "cybersecurity-roadmap-2026": {
    title: "Cybersecurity Roadmap 2026: How to Break Into the Field",
    tag: "Security", date: "January 2026", readTime: "10 min read",
    body: [
      "## Why Cybersecurity in 2026",
      "Cybersecurity professionals are in higher demand than ever. The global cybersecurity workforce gap exceeds 3.5 million unfilled positions. In India, average salaries range from ₹8-35 LPA depending on specialisation, with significant premium for certified professionals.",
      "## The Cybersecurity Domains",
      "**Offensive Security (Red Team):** Penetration testing, ethical hacking, vulnerability assessment. Certification path: CEH → eJPT → OSCP (gold standard).\n\n**Defensive Security (Blue Team):** SOC analyst, threat detection, incident response, SIEM operations. Certification path: CompTIA Security+ → CySA+ → GCIH.\n\n**Cloud Security:** Secure cloud infrastructure. Certification: AWS Security Specialty, CCSP.\n\n**AppSec:** Code review, SAST/DAST, secure development, bug bounty.\n\n**GRC:** ISO 27001, SOC 2, GDPR, PCI-DSS compliance.",
      "## Learning Path for Beginners",
      "**Foundation (3 months):** Networking (TCP/IP, DNS, HTTP, TLS), Linux command line, Python scripting, how web apps work.\n\n**Core Security (3 months):** CompTIA Security+ — covers all fundamental security concepts. TryHackMe and HackTheBox for hands-on practice. OWASP Top 10 web vulnerabilities.\n\n**Specialise (6 months):** Choose — offensive (OSCP path) or defensive (SOC analyst path).",
      "## Free Resources",
      "TryHackMe (beginner-friendly, gamified), HackTheBox (challenging, real-world), OWASP WebGoat (intentionally vulnerable web app), VulnHub (vulnerable VM practice), Cybrary (free courses).",
      "## Certifications That Matter",
      "**Red Team:** OSCP (gold standard), CEH (common in job requirements), eJPT (good start, affordable).\n**Blue Team:** CompTIA Security+ (widely required), CySA+ (analyst-focused), GCIH (incident handling).\n**Cloud:** AWS Security Specialty, CCSP, SC-200.",
    ]
  },
  "dsa-roadmap-2026": {
    title: "DSA Roadmap 2026: Master Data Structures and Algorithms for FAANG",
    tag: "Education", date: "January 2026", readTime: "11 min read",
    body: [
      "## Why DSA Still Matters in 2026",
      "Despite debates about whether DSA interviews reflect real work, the reality is that top companies — Google, Meta, Amazon, Microsoft — all use DSA-based interviews. Mastering DSA is the entry ticket.",
      "## The Learning Order That Works",
      "**Weeks 1-2:** Arrays and Strings — two pointers, sliding window, prefix sums. 30% of interview problems.\n\n**Weeks 3-4:** Linked Lists — reverse, detect cycle, find middle, merge sorted.\n\n**Weeks 5-6:** Stacks and Queues — monotonic stack, BFS using queue.\n\n**Weeks 7-8:** Binary Search — not just find element. Binary search on answer is one of the most powerful patterns.\n\n**Weeks 9-10:** Trees — BST, DFS, BFS. Most tree questions are DFS variations.\n\n**Weeks 11-12:** Graphs — DFS, BFS, topological sort, union-find.\n\n**Weeks 13-16:** Dynamic Programming — the hardest topic. 1D DP first, then 2D DP, then string DP.",
      "## Essential Patterns",
      "```python\n# Two Pointers\ndef two_sum_sorted(arr, target):\n    left, right = 0, len(arr) - 1\n    while left < right:\n        s = arr[left] + arr[right]\n        if s == target: return [left, right]\n        elif s < target: left += 1\n        else: right -= 1\n\n# Sliding Window\ndef max_sum_subarray(arr, k):\n    window_sum = sum(arr[:k])\n    max_sum = window_sum\n    for i in range(k, len(arr)):\n        window_sum += arr[i] - arr[i-k]\n        max_sum = max(max_sum, window_sum)\n    return max_sum\n\n# Binary Search\ndef binary_search(arr, target):\n    left, right = 0, len(arr) - 1\n    while left <= right:\n        mid = (left + right) // 2\n        if arr[mid] == target: return mid\n        elif arr[mid] < target: left = mid + 1\n        else: right = mid - 1\n    return -1\n```",
      "## Practice Plan",
      "**Months 1-2:** LeetCode Easy — 70-80 problems. Speed is the goal.\n**Months 3-4:** LeetCode Medium — 100-150 problems. This is where most interviews live.\n**Months 5-6:** Company-specific problems + mock interviews.\n\nConsistency beats intensity: 1-2 problems daily beats 500 problems in a 2-month sprint.",
      "## Mock Interviews Are Non-Negotiable",
      "Solving problems alone is different from solving them out loud with someone watching. Use Pramp (free peer mock interviews) or interviewing.io. The first few mock interviews are humbling — you realise how different talking through code is from typing it silently. See the [DSA Academy](/academies/education/dsa) for structured practice.",
    ]
  },
  "aws-vs-azure-vs-gcp-2026": {
    title: "AWS vs Azure vs GCP 2026: Which Cloud Should You Learn First?",
    tag: "Cloud", date: "January 2026", readTime: "9 min read",
    body: [
      "## The Honest Answer",
      "Learn AWS first. It has 31% market share — more than Azure and GCP combined. The most jobs, tutorials, and community support. Once you understand AWS deeply, Azure and GCP are straightforward to add because the core concepts are identical.",
      "## Market Share Reality (2026)",
      "AWS: 31% — first mover, broadest service catalog (200+ services), most enterprise adoption.\nAzure: 24% — Microsoft ecosystem, dominant in enterprises running Windows/Office365/Active Directory.\nGCP: 11% — best data and AI services (BigQuery, Vertex AI, GKE).",
      "## Service Mapping",
      "| AWS | Azure | GCP |\n|---|---|---|\n| EC2 | Virtual Machines | Compute Engine |\n| S3 | Blob Storage | Cloud Storage |\n| VPC | Virtual Network | VPC |\n| IAM | Azure AD + RBAC | IAM |\n| EKS | AKS | GKE |\n| Lambda | Azure Functions | Cloud Functions |\n| RDS | Azure Database | Cloud SQL |\n| CloudWatch | Azure Monitor | Cloud Monitoring |",
      "## When to Learn Azure Instead",
      "If you work in a Microsoft-heavy enterprise (banks, insurance, government using Active Directory, SQL Server, .NET), Azure is the natural choice. Azure DevOps Pipelines are also widely used even in non-Azure environments.",
      "## Certification Order",
      "Start with AWS Certified Solutions Architect Associate (SAA-C03) — most widely recognised cloud certification in hiring. Then add Azure Administrator (AZ-104) or GCP Associate Cloud Engineer as a second. Two cloud certifications puts you ahead of 95% of candidates. See the [Cloud Academy](/academies/cloud) for all cloud learning paths.",
    ]
  },
  "work-life-balance-2026": {
    title: "Work-Life Balance in Tech 2026: What It Actually Means and How to Find It",
    tag: "Health", date: "March 2026", readTime: "8 min read",
    body: [
      "## Balance Does Not Mean Equal",
      "Work-life balance does not mean 8 hours work, 8 hours life, 8 hours sleep perfectly divided every day. It means over time, across weeks and months, you are not consistently sacrificing one domain for another. A balanced life absorbs crunch sprints and recovers.",
      "## The Tech Industry's Balance Problem",
      "Tech companies have culturally normalised overwork. The data shows: consistent overwork (50+ hours per week) reduces productivity after a few weeks, increases errors, and leads to burnout. More hours worked does not mean better output beyond a threshold.",
      "## Practical Strategies",
      "**Fixed stop time:** Commit to a specific work end time (7 PM, 6 PM) and protect it. Not every day will work — but most days should.\n\n**Use your leave:** Indian tech professionals are notoriously bad at taking leave. Take at least one week-long break every 3 months.\n\n**Protect weekends:** At minimum, protect Sunday. No work calls, no code, no Slack. One full day of not working restores resources for the week.\n\n**Async communication norms:** Push for your team to adopt the norm that Slack does not require instant response outside business hours.",
      "## The Career Trap",
      "Young developers often optimise entirely for salary — taking the highest-paying offer, working the most hours, chasing promotions. Money matters, but optimising only for it leads to: interesting but exhausting work, neglected relationships, health problems in your 30s, and the realisation in your 40s that you built a career but not a life.\n\nBetter framework: optimise for the combination of interesting work, good team, reasonable hours, and adequate compensation.",
      "## What Gets Protected, Gets Done",
      "Scheduled exercise gets done. Scheduled family dinners get done. Scheduled personal learning gets done. What is not scheduled gets squeezed out. Treat your personal time with the same seriousness as your work calendar.",
    ]
  },
  "ansible-vs-terraform-2026": {
    title: "Ansible vs Terraform 2026: The Real Difference and When to Use Each",
    tag: "DevOps", date: "February 2026", readTime: "8 min read",
    body: [
      "## The Most Common Interview Question",
      "Every DevOps interview asks this. The real answer that impresses interviewers: you use BOTH, for different things, and they complement each other perfectly.",
      "## The Core Difference",
      "**Terraform** creates and manages **infrastructure** — servers, networks, databases, load balancers. It talks to cloud APIs. It provisions the resources your applications will run on.\n\n**Ansible** configures the **software** on that infrastructure — installs packages, deploys application code, manages services, sets configuration files. It talks to servers over SSH.",
      "## A Real Example",
      "```bash\n# Terraform creates the EC2 instance\nresource \"aws_instance\" \"web\" {\n  ami           = \"ami-0c55b159cbfafe1f0\"\n  instance_type = \"t3.micro\"\n}\n\n# Ansible configures it after Terraform creates it\n- name: Deploy web application\n  hosts: web_servers\n  tasks:\n    - name: Install nginx\n      yum: { name: nginx, state: present }\n    - name: Start nginx\n      service: { name: nginx, state: started }\n```",
      "## Decision Table",
      "| Task | Tool |\n|---|---|\n| Create an EC2 instance | Terraform |\n| Install nginx on it | Ansible |\n| Create an RDS database | Terraform |\n| Configure app to connect to DB | Ansible |\n| Create a VPC with subnets | Terraform |\n| Run a command on 50 servers | Ansible ad-hoc |",
      "## What to Learn First",
      "If choosing one: learn Terraform. Infrastructure provisioning is the bottleneck in most teams. Terraform skills transfer across cloud providers. Then add Ansible for configuration management. See the [Terraform Academy](/academies/devops/terraform) and [Ansible Academy](/academies/devops/ansible) for complete learning paths.",
    ]
  },
  "personal-finance-india-2026": {
    title: "Personal Finance for Indian Developers 2026: Where to Put Your Money",
    tag: "Health", date: "April 2026", readTime: "10 min read",
    body: [
      "## The Advice Most Developers Do Not Get",
      "Tech professionals in India earn well — but many reach their 30s with little to show for it: no investments, high lifestyle inflation, no plan. This guide is practical, India-specific, and based on what actually works.",
      "## Step 1: Emergency Fund First",
      "Before any investments, build 3-6 months of expenses in an FD or liquid mutual fund. If monthly expenses are ₹50,000 → Emergency fund = ₹1,50,000 to ₹3,00,000. This protects you from lifestyle disruption if you lose your job or want to take time off between roles.",
      "## Step 2: Use All Tax-Saving Instruments",
      "**EPFO (PF):** Free money — employer contributes. Never withdraw unless absolutely necessary.\n\n**Section 80C (₹1.5 lakh deduction):** PPF (government-backed, 7.1% tax-free returns) + ELSS mutual funds (best if you can handle 3-year lock-in).\n\n**NPS:** Additional ₹50,000 deduction under Section 80CCD(1B). Good for retirement corpus.\n\n**Health insurance:** Always have your own — do not rely only on employer coverage (you lose it when you switch jobs).",
      "## Step 3: SIP in Index Funds",
      "70-80% of active mutual fund managers underperform their benchmark index over 10 years. Index funds give you market returns at minimal cost:\n\n- **Nifty 50 Index Fund:** Core holding — top 50 companies\n- **Nifty Next 50 Index Fund:** Higher growth potential\n- **US Index Fund:** Geographic diversification\n\nAutomate your SIP on the 1st of every month, right after salary credit. Increase SIP by 10-15% every year as your salary grows.",
      "## The Lifestyle Inflation Trap",
      "Every time you get a raise, invest at least 50% of the increment. Lifestyle can improve, but not faster than your savings rate grows. The engineer who earns ₹20 LPA and invests ₹6 LPA builds more wealth than the one who earns ₹30 LPA and spends ₹28 LPA.",
    ]
  },
  "terraform-best-practices-2026": {
    title: "Terraform Best Practices 2026: How Senior Engineers Write IaC",
    tag: "Terraform", date: "March 2026", readTime: "9 min read",
    body: [
      "## What Separates Senior from Junior Terraform",
      "Junior: one big main.tf, hardcoded values. Senior: modules, remote state, workspaces, CI/CD for infrastructure.",
      "## 1. Remote State\n```hcl\nterraform {\n  backend \"s3\" {\n    bucket         = \"mycompany-tfstate\"\n    key            = \"production/terraform.tfstate\"\n    region         = \"ap-south-1\"\n    encrypt        = true\n    dynamodb_table = \"terraform-state-lock\"\n  }\n}\n```\nWithout remote state: two engineers apply simultaneously, state diverges, infrastructure becomes unmanageable.",
      "## 2. Module Structure\n```\nterraform-infra/\n├── modules/vpc/\n├── modules/eks/\n├── modules/rds/\n├── environments/dev/\n└── environments/production/\n```\nSame modules, different variable values per environment.",
      "## 3. Terraform in CI/CD\nRun `terraform fmt -check`, `terraform validate`, `terraform plan` on every PR. Post plan output as PR comment so infrastructure changes get code review. `terraform apply` only on merge to main with approval. See [Terraform Academy](/academies/devops/terraform) for complete IaC path."
    ]
  },
  "what-is-serverless-2026": {
    title: "Serverless Computing 2026: What It Is and When to Use It",
    tag: "Cloud", date: "March 2026", readTime: "8 min read",
    body: [
      "## The Real Definition",
      "Serverless does not mean no servers — it means you do not manage servers. Write a function, upload it, the cloud handles scaling, patching, availability. Pay only for execution time, not idle capacity.",
      "## AWS Lambda\n```python\ndef handler(event, context):\n    bucket = event['Records'][0]['s3']['bucket']['name']\n    key    = event['Records'][0]['s3']['object']['key']\n    process_file(bucket, key)\n    return {'statusCode': 200}\n# Triggered on S3 upload. Runs 200ms. Zero cost when idle.\n```",
      "## When Serverless is Right\n- Event-driven: image resizing, webhook handlers, email notifications\n- Scheduled tasks replacing cron jobs\n- Unpredictable traffic: auto-scales 0 to 10,000 concurrently\n- Startup economics: zero cost at zero traffic",
      "## When Serverless is Wrong\n- Long-running processes (Lambda max 15 minutes) — use EC2 or ECS\n- Cold starts matter (1-3s idle startup) — unacceptable for latency-sensitive APIs\n- High consistent volume — containers often cheaper at scale\n\nSee [Lambda Academy](/academies/cloud/aws-lambda) for deep dive."
    ]
  },
  "cloud-cost-optimization-2026": {
    title: "Cloud Cost Optimization 2026: Cut Your AWS Bill by 40%",
    tag: "Cloud", date: "April 2026", readTime: "10 min read",
    body: [
      "## The Problem Nobody Talks About",
      "The average company wastes 30-35% of cloud spend on unused or over-provisioned resources. Here is how to find and fix it systematically.",
      "## Step 1: Find Where Money Goes\n```bash\naws ce get-cost-and-usage \\\n  --time-period Start=2026-01-01,End=2026-01-31 \\\n  --granularity MONTHLY --metrics BlendedCost \\\n  --group-by Type=DIMENSION,Key=SERVICE\n# Typical: EC2 40-50%, RDS 20-25%, Data transfer 10-15%\n```",
      "## Step 2: Right-Size Instances\nInstances below 20% average CPU are candidates for downsizing. An m5.xlarge at 15% CPU should be t3.large — 40% cost reduction. Use AWS Compute Optimizer for automated recommendations.",
      "## Step 3: Reserved Instances\n- 1-year No Upfront: 30-40% savings over on-demand\n- 3-year No Upfront: 45-55% savings\n- Compute Savings Plans: most flexible, applies automatically\n\nFor instances running 1+ years, reservations are mandatory — on-demand for those is just waste.",
      "## Quick Wins This Week\n1. Delete unattached EBS volumes and Elastic IPs\n2. Delete EC2 snapshots older than 90 days\n3. Turn off dev/test environments nights and weekends (saves 65%)\n4. Migrate gp2 EBS to gp3 — same performance, 20% cheaper\n5. S3 lifecycle: Standard to Glacier after 90 days (80% cheaper)\n6. Set a Budget alert at your monthly threshold"
    ]
  },
  "aws-networking-vpc-2026": {
    title: "AWS VPC Networking 2026: Complete Guide for DevOps Engineers",
    tag: "Cloud", date: "May 2026", readTime: "11 min read",
    body: [
      "## VPC is the Foundation of Everything on AWS",
      "Every EC2 instance, RDS database, and EKS cluster lives inside a VPC. Get networking wrong and nothing else works correctly.",
      "## Standard Architecture\n```\nVPC (10.0.0.0/16)\n├── Public Subnets  (10.0.1.x, 10.0.2.x) — ALB, NAT Gateway\n├── Private Subnets (10.0.11.x, 10.0.12.x) — EC2, EKS nodes\n└── Database Subnets (10.0.21.x, 10.0.22.x) — RDS, ElastiCache\nSpread across 2-3 Availability Zones for HA\n```",
      "## Key Components\n- **Internet Gateway:** Allows public subnet resources to reach internet\n- **NAT Gateway:** Private subnets initiate outbound connections without being publicly reachable. ~$0.05/hour — one per AZ for HA\n- **Security Groups:** Stateful firewall per resource. Default: deny all inbound\n- **Route Tables:** Public subnets → IGW. Private subnets → NAT Gateway",
      "## Build with Terraform\n```hcl\nresource \"aws_vpc\" \"main\" {\n  cidr_block = \"10.0.0.0/16\"\n  enable_dns_hostnames = true\n  tags = { Name = \"production-vpc\" }\n}\n```\n\nCommon mistakes: too-small CIDRs, databases in public subnets, single AZ, overlapping CIDRs preventing VPC peering. See [AWS VPC Academy](/academies/cloud/aws-vpc)."
    ]
  },
  "gcp-bigquery-guide-2026": {
    title: "GCP BigQuery 2026: Serverless Data Warehouse That Processes Petabytes",
    tag: "Cloud", date: "June 2026", readTime: "9 min read",
    body: [
      "## Why BigQuery Wins for Data Analytics",
      "Serverless — no infrastructure to manage. Query petabytes in seconds with standard SQL. Pay per query ($5/TB, first 1TB/month free). Google invented MapReduce; BigQuery is the production-grade evolution.",
      "## First Query — No Setup Needed\n```sql\nSELECT country_name, SUM(cumulative_confirmed) AS total_cases\nFROM `bigquery-public-data.covid19_open_data.covid19_open_data`\nWHERE date = '2022-01-01'\nGROUP BY country_name ORDER BY total_cases DESC LIMIT 10;\n-- Returns in seconds on millions of rows. Hits free tier.\n```",
      "## Cost Optimization with Partitioning\n```sql\nCREATE TABLE myproject.dataset.events\nPARTITION BY DATE(event_timestamp)\nAS SELECT * FROM source_table;\n\n-- Only scans Jan 2026 partitions, not entire table\nSELECT * FROM myproject.dataset.events\nWHERE DATE(event_timestamp) >= '2026-01-01';\n-- 90% less data scanned = 90% lower cost\n```",
      "## When to Choose GCP\n- Data warehouse at scale — BigQuery pricing beats Redshift running 24/7\n- Python-heavy teams — Vertex AI Workbench is the best managed notebook\n- Real-time analytics — Pub/Sub + Dataflow + BigQuery is mature\n- ML at scale — Vertex AI ahead of SageMaker in 2026\n\nSee [BigQuery Academy](/academies/cloud/bigquery)."
    ]
  },
  "langchain-tutorial-2026": {
    title: "LangChain Tutorial 2026: Build AI Applications in Python",
    tag: "AI", date: "February 2026", readTime: "10 min read",
    body: [
      "## What is LangChain?",
      "LangChain is a Python framework for building LLM applications. It provides components for connecting to LLMs, loading documents, splitting text, vector stores, chains, agents, and memory. Think of it as the React of AI development.",
      "## LCEL — The Modern Way\n```python\nfrom langchain_anthropic import ChatAnthropic\nfrom langchain_core.prompts import ChatPromptTemplate\nfrom langchain_core.output_parsers import StrOutputParser\n\nllm    = ChatAnthropic(model='claude-sonnet-4-6')\nprompt = ChatPromptTemplate.from_template('Explain {topic} simply.')\nchain  = prompt | llm | StrOutputParser()\n\nresult = chain.invoke({'topic': 'Kubernetes pods'})\nprint(result)\n```",
      "## RAG Chain in 10 Lines\n```python\nfrom langchain_community.vectorstores import Chroma\nfrom langchain_core.runnables import RunnablePassthrough\n\nretriever = vectorstore.as_retriever()\nrag_chain = (\n    {'context': retriever, 'question': RunnablePassthrough()}\n    | ChatPromptTemplate.from_template(\n        'Answer based on context:\\n{context}\\nQuestion: {question}')\n    | llm | StrOutputParser()\n)\nprint(rag_chain.invoke('What is our refund policy?'))\n```",
      "## Debug with LangSmith\nSet LANGCHAIN_TRACING_V2=true — every chain call is traced: inputs, outputs, latency, token usage, errors. Essential for production debugging. See [LangChain Academy](/academies/ai/langchain)."
    ]
  },
  "llmops-production-2026": {
    title: "LLMOps 2026: Running AI Applications in Production",
    tag: "AI", date: "March 2026", readTime: "10 min read",
    body: [
      "## What is LLMOps?",
      "LLMOps is MLOps for Large Language Models — practices, tools, and processes for deploying and maintaining LLM-powered applications at production scale.",
      "## The Stack in 2026\n- Application framework: LangChain / LlamaIndex\n- Tracing: LangSmith, Phoenix/Arize\n- Inference: Anthropic/OpenAI APIs, or vLLM/Ollama for self-hosted\n- Vector stores: Chroma, Qdrant, pgvector\n- Caching: Redis for response caching\n- Monitoring: Grafana for cost/latency dashboards",
      "## Cost Monitoring\n```python\nresponse = client.messages.create(\n    model='claude-haiku-4-5',  # cheaper for simple tasks\n    max_tokens=500,\n    messages=[{'role': 'user', 'content': prompt}]\n)\ncost = (response.usage.input_tokens * 0.0000008) + \\\n       (response.usage.output_tokens * 0.000004)\nprint(f'Cost: ${cost:.6f}')\n# Cache identical responses in Redis — major cost reduction\n```",
      "## Prompt Version Control and Evaluation\nPrompts are code. Store in Git or LangSmith. Test before deploying — use Claude-as-judge automated evaluation. Track accuracy on a test dataset before every prompt change. You cannot improve what you cannot measure. See [LLMOps Academy](/academies/ai/llmops)."
    ]
  },
  "vector-databases-2026": {
    title: "Vector Databases 2026: The Foundation of AI Search and RAG",
    tag: "AI", date: "April 2026", readTime: "9 min read",
    body: [
      "## Why Vector Databases Exist",
      "Traditional databases search by exact match. Vector databases search by meaning — find semantically similar documents even if they share no words. Powers RAG, semantic search, recommendation engines.",
      "## How It Works\n```\n'What is Kubernetes?' → [0.23, -0.45, 0.67, ...] (1536 numbers)\n'Introduction to K8s' → [0.24, -0.43, 0.65, ...]  very similar\n'Best pizza recipes'  → [-0.12, 0.89, -0.33, ...]  very different\n```\nVector search finds documents with similar vectors using ANN (Approximate Nearest Neighbor) algorithms.",
      "## Popular Databases in 2026\n| Database | Best For |\n|---|---|\n| Chroma | Development, getting started |\n| Qdrant | Production, high performance |\n| Pinecone | Fully managed, easiest setup |\n| pgvector | Already using PostgreSQL |",
      "## Semantic Search Example\n```python\nfrom qdrant_client import QdrantClient\nfrom sentence_transformers import SentenceTransformer\n\nmodel  = SentenceTransformer('all-MiniLM-L6-v2')\nclient = QdrantClient(':memory:')\n# Index documents, then search:\nresults = client.search('docs',\n    query_vector=model.encode('container orchestration').tolist(), limit=2)\nfor r in results:\n    print(f'Score: {r.score:.3f} | {r.payload[\"text\"]}')\n```\n\nIf you already run PostgreSQL, use pgvector — no new infrastructure needed. See [AI Academy](/academies/ai)."
    ]
  },
  "ai-engineering-roadmap-2026": {
    title: "AI Engineer Roadmap 2026: From Developer to AI Engineer",
    tag: "AI", date: "May 2026", readTime: "10 min read",
    body: [
      "## What is an AI Engineer?",
      "Builds products powered by AI. Unlike ML researchers who build models, AI engineers use existing models (Claude, GPT-4, Llama) via APIs and focus on: prompting, RAG, agents, evaluation, and production deployment.",
      "## The Stack You Need\n- Foundation: Python, REST APIs, SQL, basic statistics\n- LLM Fundamentals: tokens, context windows, embeddings, prompt engineering\n- Core Skills: RAG, tool use/function calling, LangChain, vector databases, LLM evaluation\n- Production: LLMOps, cost monitoring, caching, streaming, API design\n- Advanced: multi-modal, AI agents with memory, fine-tuning (LoRA)",
      "## Salaries in 2026 (India)\n| Level | Experience | Salary |\n|---|---|---|\n| Junior | 0-2 years | Rs 8-18 LPA |\n| Mid | 2-5 years | Rs 20-45 LPA |\n| Senior | 5-8 years | Rs 45-90 LPA |\n\nFor remote international roles, multiply 3-5x.",
      "## 6-Month Path\n- Months 1-2: Get comfortable with Claude and OpenAI APIs. Build 5-10 small apps\n- Month 3: Build a complete RAG system (document Q&A)\n- Month 4: Build agents with real tool use\n- Month 5: Deploy with monitoring and cost tracking\n- Month 6: One substantial portfolio project — full stack AI app with evaluation\n\nSee [AI Academy](/academies/ai) for structured learning path."
    ]
  },
  "redis-use-cases-2026": {
    title: "Redis 2026: Six Production Use Cases Every Developer Should Know",
    tag: "Databases", date: "February 2026", readTime: "7 min read",
    body: [
      "## What is Redis?",
      "Redis is an in-memory data store. Data lives in RAM — reads and writes happen in microseconds. 100-1000x faster than disk-based databases for the right use cases.",
      "## Use Case 1: Caching\n```python\nimport redis, json\nr = redis.Redis(host='localhost', port=6379)\n\ndef get_user(user_id):\n    cached = r.get(f'user:{user_id}')\n    if cached: return json.loads(cached)\n    user = db.query('SELECT * FROM users WHERE id = %s', user_id)\n    r.setex(f'user:{user_id}', 300, json.dumps(user))\n    return user\n```",
      "## Use Case 2: Rate Limiting\n```python\ndef is_rate_limited(user_id, limit=100, window=60):\n    key = f'ratelimit:{user_id}'\n    count = r.incr(key)\n    if count == 1: r.expire(key, window)\n    return count > limit\n```",
      "## Use Cases 3-6\n**Leaderboards:** `r.zadd('scores', {'player_A': 1500}); r.zrevrange('scores', 0, 9, withscores=True)`\n\n**Session Storage:** Store with TTL — any app server reads them, scales horizontally.\n\n**Pub/Sub Messaging:** Publish events, subscribe from other services.\n\n**Distributed Locks:** `r.lock('order_lock', timeout=10)` — prevent race conditions across servers.",
      "## When NOT to Use Redis\nRedis is not a primary database — use alongside PostgreSQL. Data must survive restarts? Persistent database. Data larger than RAM? Disk-based storage. See [Redis Academy](/academies/databases/redis)."
    ]
  },
  "mongodb-beginners-2026": {
    title: "MongoDB 2026: When to Use Document Database and How to Start",
    tag: "Databases", date: "March 2026", readTime: "8 min read",
    body: [
      "## When MongoDB Makes Sense",
      "Use when: data structure varies between documents, you need nested objects without JOINs, or data is document-like by nature (articles, user profiles with variable fields).\n\nDo NOT use when: data has clear relationships benefiting from JOINs, you need ACID transactions across multiple collections, or you are unsure — default to PostgreSQL.",
      "## CRUD Operations\n```javascript\nconst users = db.collection('users');\n// Insert\nawait users.insertOne({ name: 'Alice', tags: ['admin'], address: { city: 'Chennai' } });\n// Query nested fields\nconst result = await users.find({ 'address.city': 'Chennai' }).toArray();\n// Update with operators\nawait users.updateOne(\n  { name: 'Alice' },\n  { $set: { 'address.city': 'Mumbai' }, $push: { tags: 'superadmin' } }\n);\n```",
      "## Aggregation Pipeline\n```javascript\nconst result = await orders.aggregate([\n  { $match: { date: { $gte: new Date('2026-01-01') } } },\n  { $group: { _id: '$status', count: { $sum: 1 }, avg: { $avg: '$amount' } } },\n  { $sort: { count: -1 } }\n]).toArray();\n```",
      "## Common Anti-Patterns\n- Unbounded arrays (16MB document limit)\n- Using $lookup everywhere (if you JOIN constantly, use PostgreSQL)\n- Missing indexes (MongoDB scans without them, same as SQL)\n\nSee [MongoDB Academy](/academies/databases/mongodb)."
    ]
  },
  "elasticsearch-guide-2026": {
    title: "Elasticsearch 2026: Full-Text Search and Log Analytics Guide",
    tag: "Databases", date: "April 2026", readTime: "9 min read",
    body: [
      "## What is Elasticsearch?",
      "Distributed search and analytics engine — the E in the ELK stack. Exceptionally fast at full-text search and real-time analytics over large datasets.",
      "## Quick Start\n```bash\ndocker run -d -p 9200:9200 \\\n  -e 'discovery.type=single-node' \\\n  -e 'xpack.security.enabled=false' \\\n  elasticsearch:8.12.0\n\ncurl -X POST http://localhost:9200/articles/_doc \\\n  -H 'Content-Type: application/json' \\\n  -d '{\"title\": \"Docker Guide\", \"content\": \"Docker packages apps\", \"tags\": [\"devops\"]}'\n```",
      "## Python Search\n```python\nfrom elasticsearch import Elasticsearch\nes = Elasticsearch('http://localhost:9200')\n\nresults = es.search(index='articles', body={\n    'query': {'bool': {\n        'must':   [{'match': {'content': 'kubernetes pods'}}],\n        'filter': [{'terms': {'tags': ['devops']}}]\n    }}\n})\nfor hit in results['hits']['hits']:\n    print(f\"Score: {hit['_score']} | {hit['_source']['title']}\")\n```",
      "## ES vs PostgreSQL Full-Text Search\nPostgreSQL full-text works for under 10M documents with simple requirements. Use Elasticsearch for: advanced relevance tuning, faceted search, auto-complete, complex aggregations, or log analytics with Kibana.\n\nSee [ELK Academy](/academies/devops/elk-stack) for full ELK stack setup guide."
    ]
  },
  "sql-interview-questions-2026": {
    title: "Top 40 SQL Interview Questions 2026: Complete Answers",
    tag: "Databases", date: "May 2026", readTime: "13 min read",
    body: [
      "## Core Concepts (Q1-Q10)",
      "**Q1: WHERE vs HAVING?** WHERE filters rows before grouping. HAVING filters groups after GROUP BY and can use aggregates.\n\n**Q2: DELETE vs TRUNCATE vs DROP?** DELETE: removes specific rows, can roll back. TRUNCATE: removes all rows fast, DDL. DROP: removes table and structure entirely.\n\n**Q3: What are window functions?** Calculations across rows without collapsing them. ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD(), SUM() OVER().\n\n**Q4: RANK() vs DENSE_RANK()?** RANK() leaves gaps after ties: 1,1,3. DENSE_RANK() no gaps: 1,1,2. Use DENSE_RANK for Nth highest.\n\n**Q5: What is a CTE?** Common Table Expression — WITH clause. Makes complex queries readable. Supports recursion for hierarchical data.",
      "## Window Functions in Practice (Q11-Q20)",
      "**Q11: 3rd highest salary.**\n```sql\nSELECT DISTINCT salary FROM (\n    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk\n    FROM employees\n) t WHERE rnk = 3;\n```\n\n**Q12: Employees earning more than manager.**\n```sql\nSELECT e.name FROM employees e\nJOIN employees m ON e.manager_id = m.id\nWHERE e.salary > m.salary;\n```\n\n**Q13: Running total.**\n```sql\nSELECT date, amount, SUM(amount) OVER (ORDER BY date) AS running_total\nFROM sales;\n```",
      "## Performance (Q21-Q30)",
      "**Q21: How does an index work?** B-tree stores values sorted with row pointers. O(log n) lookup vs O(n) full scan. Speeds SELECT, slows INSERT/UPDATE/DELETE.\n\n**Q22: What is EXPLAIN ANALYZE?** Shows actual execution plan with timing. Look for Seq Scan on large tables (missing index) and high rows removed by filter.\n\n**Q23: Composite index leftmost prefix rule.**\n```sql\nCREATE INDEX idx ON orders(user_id, status);\n-- Uses index: WHERE user_id=1 AND status='pending'\n-- Uses index: WHERE user_id=1\n-- Does NOT use: WHERE status='pending' (skips user_id)\n```",
      "## Advanced (Q31-Q40)",
      "**Q31: Deadlock?** Thread A holds Lock 1 waits Lock 2. Thread B holds Lock 2 waits Lock 1. Both wait forever. Prevention: always acquire locks in the same order.\n\n**Q32: ACID?** Atomicity: all or nothing. Consistency: valid state to valid state. Isolation: concurrent transactions don't interfere. Durability: committed data survives crashes.\n\n**Q33: Materialized view?** Stored cached query result — fast to read, refresh manually: REFRESH MATERIALIZED VIEW my_view.\n\n**Q34: UNION vs UNION ALL?** UNION removes duplicates (slower). UNION ALL keeps all rows (faster).\n\nSee [SQL Academy](/academies/databases/sql) for hands-on practice."
    ]
  },
  "owasp-top-10-2026": {
    title: "OWASP Top 10 2026: Critical Web Security Every Developer Must Know",
    tag: "Security", date: "February 2026", readTime: "10 min read",
    body: [
      "## Why Every Developer Must Know This",
      "The OWASP Top 10 is the most referenced web application security list. Every security audit, penetration test, and compliance framework references it. If you write web applications, you are responsible for preventing these.",
      "## 1. Broken Access Control (Most Critical)\n```python\n# VULNERABLE\n@app.route('/api/users/<int:user_id>')\ndef get_user(user_id):\n    return db.get_user(user_id)  # no ownership check!\n\n# SECURE\n@app.route('/api/users/<int:user_id>')\n@login_required\ndef get_user(user_id):\n    if current_user.id != user_id and not current_user.is_admin:\n        abort(403)\n    return db.get_user(user_id)\n```",
      "## 2. SQL Injection\n```python\n# VULNERABLE — never do this\nquery = f\"SELECT * FROM users WHERE name = '{user_input}'\"\n\n# SAFE — parameterised queries\ncursor.execute('SELECT * FROM users WHERE name = %s', (user_input,))\n```",
      "## 3. Cryptographic Failures\n```python\n# WRONG — MD5 is crackable in seconds\nhash = md5(password).hexdigest()\n\n# CORRECT — bcrypt with work factor\nfrom bcrypt import hashpw, gensalt\nhashed = hashpw(password.encode(), gensalt(rounds=12))\n```",
      "## 4-10 Summary\n**#4 Insecure Design:** Missing rate limiting, no account lockout.\n**#5 Misconfiguration:** Default passwords, verbose errors.\n**#6 Vulnerable Components:** pip audit, npm audit, Dependabot.\n**#7 Auth Failures:** Implement MFA. Secure password reset.\n**#8 Integrity Failures:** Verify CI/CD artifacts.\n**#9 Logging Failures:** Log all auth events, alert on anomalies.\n**#10 SSRF:** Validate URLs your server fetches from user input.\n\nSee [Security Academy](/academies/security) for hands-on labs."
    ]
  },
  "devsecops-guide-2026": {
    title: "DevSecOps 2026: Security Inside Your CI/CD Pipeline",
    tag: "Security", date: "March 2026", readTime: "10 min read",
    body: [
      "## What is DevSecOps?",
      "Security integrated into every stage of development and deployment — not bolted on at the end. Catch vulnerabilities early when they are cheapest to fix.",
      "## The Pipeline\n- Code: SAST (scan source code — Semgrep, SonarQube)\n- Build: SCA (dependency CVE scan — pip-audit, npm audit)\n- Package: Image Scan (Trivy, Snyk)\n- Deploy: IaC Scan (Checkov for Terraform/K8s manifests)\n- Runtime: Falco (container behaviour monitoring)",
      "## GitHub Actions Security Jobs\n```yaml\njobs:\n  security:\n    steps:\n    - uses: returntocorp/semgrep-action@v1\n      with: { config: 'p/owasp-top-ten' }\n\n    - run: pip-audit requirements.txt --fail-on HIGH\n\n    - run: docker build -t myapp:${{ github.sha }} .\n    - uses: aquasecurity/trivy-action@master\n      with:\n        image-ref: myapp:${{ github.sha }}\n        severity: CRITICAL,HIGH\n        exit-code: '1'\n\n    - uses: bridgecrewio/checkov-action@master\n      with: { directory: terraform/ }\n```",
      "## Secret Scanning and Runtime Security\n```bash\n# Prevent committing secrets\ngit secrets --install && git secrets --register-aws\ngitleaks detect --source . --report-path report.sarif\n```\n\n```yaml\n# Falco — alert on suspicious container behaviour\n- rule: Shell in Production Container\n  condition: container and proc.name in (bash, sh)\n  output: 'Shell opened (user=%user.name container=%container.name)'\n  priority: WARNING\n```\nSee [Security Academy](/academies/security) for hands-on labs."
    ]
  },
  "gate-cse-2026": {
    title: "GATE CSE 2026: Complete Preparation Strategy",
    tag: "Education", date: "February 2026", readTime: "11 min read",
    body: [
      "## What GATE CSE Opens For You",
      "M.Tech at IITs/NITs (subsidised + Rs 12,400/month scholarship), PSU government jobs (BHEL, AAI, DRDO, BARC — Rs 60-80K+ monthly), and private company hiring. A top-1000 rank transforms your career options.",
      "## Syllabus Weightage\n| Topic | Marks | Priority |\n|---|---|---|\n| Engineering Mathematics | 10-15 | Very High |\n| Algorithms + Data Structures | 12-20 | Very High |\n| OS + DBMS + Networks | 18-28 | Very High |\n| Theory of Computation | 8-12 | High |\n| Digital Logic + CO | 10-14 | High |\n| Programming (C) | 6-8 | High |",
      "## 12-Month Plan\n**Months 1-3:** Engineering Mathematics + Digital Logic + C Programming. Foundational — everything builds on these.\n\n**Months 4-6:** Data Structures + Algorithms + Theory of Computation. Most challenging — maximum time here.\n\n**Months 7-9:** OS + Computer Organisation + DBMS + Computer Networks.\n\n**Months 10-11:** Full revision + previous year papers 2010-2025.\n\n**Month 12:** Full mock tests. 3 hours, timed, no breaks, analyse every mistake.",
      "## Most Important Practice",
      "Solving previous 10 years of GATE CSE papers is the single highest-impact activity. Questions repeat patterns. Free on the GATE website. Most toppers say previous papers gave them the biggest rank jump.\n\nCommon mistakes: skipping Engineering Maths (10-15 marks), ignoring C programming, not doing previous years, starting too late (need 6-12 months). See [GATE CSE Academy](/academies/exams/gate-cse)."
    ]
  },
  "system-design-interview-2026": {
    title: "System Design Interview 2026: How to Crack the Most Important Round",
    tag: "Education", date: "March 2026", readTime: "12 min read",
    body: [
      "## Why System Design Is Different",
      "DSA has correct answers. System design has trade-offs. Interviewers evaluate: can you gather requirements, understand scale, apply distributed systems patterns, and clearly articulate trade-offs.",
      "## The RESHADED Framework\n- **R**equirements: Functional + non-functional (scale, latency, availability)\n- **E**stimation: Traffic, storage, bandwidth\n- **S**torage: Database choice, schema\n- **H**igh-level design: Core components and connections\n- **A**PIs: Define contracts\n- **D**eep dive: Hardest components\n- **E**valuation: Review against requirements\n- **D**iscuss: Trade-offs and alternatives",
      "## Example: Design YouTube\n**Estimation:** 500 hours video/min x 60 x 24 = ~500TB/day upload. 5B views/day = ~58K peak req/sec.\n\n**High-Level Design:**\n```\nClient → CDN (video delivery)\n       → API Gateway\n         → Upload → Video Processing → S3\n         → Streaming → CDN\n         → Search → Elasticsearch\n         → Metadata → PostgreSQL\n```",
      "## Numbers to Know\n```\nMemory access: ~100ns\nSSD read:      ~100us\nNetwork:       ~1ms (same DC)\nMySQL:         ~1000 QPS with indexing\nRedis:         ~100,000 QPS\nKafka:         ~1M msg/s per partition\n```\n\nResources: Designing Data-Intensive Applications (Kleppmann), System Design Primer (GitHub, free), ByteByteGo YouTube. See [System Design Academy](/academies/education/system-design)."
    ]
  },
  "java-interview-2026": {
    title: "Java Interview Questions 2026: Top 40 With Detailed Answers",
    tag: "Education", date: "April 2026", readTime: "13 min read",
    body: [
      "## Core Java (Q1-Q15)",
      "**Q1: JDK vs JRE vs JVM?** JVM: executes bytecode. JRE: JVM + class libraries, for running. JDK: JRE + compiler + tools, for developing.\n\n**Q2: String immutability?** Strings cannot be modified after creation. str = str + ' world' creates a NEW object. Benefits: thread-safe, usable as HashMap keys, enables string pool optimisation.\n\n**Q3: HashMap vs Hashtable?** HashMap: not synchronised, allows null key, faster. Hashtable: synchronised, no nulls, legacy. Use ConcurrentHashMap for thread-safe maps.\n\n**Q4: How does HashMap work internally?** Array of buckets. hashCode() determines bucket index. Collisions use linked list. Java 8+: converts to red-black tree at length 8 — O(n) to O(log n).\n\n**Q5: == vs .equals()?** == compares references (memory addresses). .equals() compares content. ALWAYS use .equals() for String comparison.",
      "## OOP (Q16-Q25)",
      "**Q16: Abstract class vs interface?** Abstract: constructors, instance vars, concrete methods, single inheritance. Interface: multiple implementation, default/static methods (Java 8+). Abstract for shared code, interface for contracts.\n\n**Q17: Overloading vs overriding?** Overloading: same name, different params, compile-time. Overriding: child redefines parent method, runtime. Cannot override static, final, private methods.\n\n**Q18: What is polymorphism?** One interface, multiple implementations. Compile-time (overloading) and runtime (overriding). Core OOP pillar enabling flexible, extensible code.",
      "## Multithreading (Q26-Q35)",
      "**Q26: Thread vs Runnable?** Extending Thread prevents extending other classes. Implementing Runnable allows extending another class. Always prefer Runnable or Callable.\n\n**Q27: What is synchronized?** Prevents multiple threads executing a block simultaneously. Each object has an intrinsic lock. Prefer java.util.concurrent alternatives for performance.\n\n**Q28: What is a deadlock?** Thread A holds Lock 1 waits Lock 2. Thread B holds Lock 2 waits Lock 1. Prevention: always acquire locks in the same order.",
      "## Java 8+ Features (Q36-Q40)",
      "**Q36: Lambda expressions?** Anonymous functions: `Runnable r = () -> System.out.println(Hello)` — no anonymous class needed.\n\n**Q37: Stream API?** Functional operations on collections, lazy: `list.stream().filter(x -> x > 0).map(x -> x * 2).collect(toList())`\n\n**Q38: Optional?** Container for a value that may be null. `opt.orElse(default)`, `opt.ifPresent(consumer)` — avoids NullPointerException.\n\n**Q39: CompletableFuture?** Async computation: `CompletableFuture.supplyAsync(() -> fetchData()).thenApply(data -> process(data))`\n\n**Q40: Default methods in interfaces?** Java 8 allows interface method implementations: `default void log() {}` — add methods without breaking existing implementations.\n\nSee [Java Academy](/academies/education/java) for complete learning path."
    ]
  },
  "medical-coding-career-2026": {
    title: "Medical Coding Career 2026: Complete Guide for Beginners in India",
    tag: "Healthcare", date: "February 2026", readTime: "10 min read",
    body: [
      "## What is Medical Coding?",
      "Medical coding transforms healthcare diagnoses, procedures, and services into universal codes used for insurance billing, disease tracking, and hospital reimbursement. Every patient visit generates codes that determine payment.",
      "## The Three Code Systems\n**ICD-10-CM:** Diagnosis codes — what is wrong. Example: J18.9 = Pneumonia, unspecified.\n\n**CPT:** Procedure codes — what was done. Example: 99213 = Office visit, moderate complexity.\n\n**HCPCS:** Supply, equipment, drug codes. Example: E0601 = CPAP device. Used for Medicare/Medicaid.",
      "## Salaries in India (2026)\n| Level | Experience | Salary |\n|---|---|---|\n| Fresher | 0-1 year | Rs 2.5-4 LPA |\n| Junior | 1-3 years | Rs 4-7 LPA |\n| Senior | 3-5 years | Rs 7-12 LPA |\n| Lead/Auditor | 5+ years | Rs 12-20 LPA |\n| US Remote | 3+ years | Rs 18-35 LPA |",
      "## CPC Certification\nCPC (Certified Professional Coder) from AAPC is the gold standard. Widely recognised by employers in India. Exam: 5 hours 40 minutes, 150 questions, open book. Most failures are time management, not knowledge — practice speed.\n\nWork from home is common: major BPOs (Omega Healthcare, Inovalon, Episource) hire remote coders. Stable career, growing demand as Indian BPOs handle US healthcare billing. See [Healthcare Coding Academy](/academies/healthcare/icd-10-cm)."
    ]
  },
  "first-aid-basics-2026": {
    title: "First Aid Basics 2026: What Everyone Should Know",
    tag: "Health", date: "March 2026", readTime: "8 min read",
    body: [
      "## Why First Aid Knowledge Saves Lives",
      "In India, average ambulance response time in cities is 15-20 minutes. In cardiac arrest, every minute without CPR reduces survival by 7-10%. Bystander first aid in those first minutes makes the difference between life and death.",
      "## CPR — When Someone Collapses\n```\n1. Call 112 immediately\n2. Lay person on firm surface, tilt head back\n3. Chest compressions:\n   - Heel of hand on center of chest\n   - Push hard and fast: 5-6 cm deep, 100-120 per minute\n   - Let chest fully recoil between compressions\n4. 30 compressions : 2 rescue breaths (if trained)\n5. Do NOT stop until ambulance arrives\n```\nHands-only CPR (compressions only) is better than no CPR at all.",
      "## Choking — Heimlich Maneuver\nAdult choking (cannot speak, cannot breathe):\n1. Stand behind them, lean them slightly forward\n2. Give 5 firm back blows between shoulder blades\n3. Give 5 abdominal thrusts: fist above navel, pull sharply inward and upward\n4. Alternate 5+5 until expelled or unconscious\n\nFor infants under 1 year: 5 back blows + 5 chest thrusts only — never abdominal thrusts.",
      "## FAST — Stroke Recognition\n- Face: Ask to smile. One side drooping?\n- Arms: Raise both. One drifts down?\n- Speech: Repeat a phrase. Slurred or strange?\n- Time: Any sign = call 112 immediately. Every minute of delay = more brain damage.\n\nAlso know: every home should have a basic first aid kit — sterile bandages, antiseptic, thermometer, ORS sachets, paracetamol, gloves. Check expiry dates every 6 months."
    ]
  },
  "sleep-optimization-2026": {
    title: "Sleep Optimization for Developers 2026: Sleep Better, Think Clearer",
    tag: "Health", date: "April 2026", readTime: "8 min read",
    body: [
      "## Sleep is When Your Brain Learns",
      "Sleep consolidates memories — including everything you learned coding today. Good sleep after learning makes knowledge stick dramatically better than staying up to review. Sleep deprivation impairs judgment, creativity, and problem-solving — the exact skills that make a good engineer.",
      "## The Developer Sleep Problems\n**Cannot sleep before 1-2 AM:**\n- Blue light suppresses melatonin for 1-3 hours\n- Debugging and architecture keep the brain alert\n- Fix: Night mode on all screens after sunset. Stop coding 90 minutes before bed. Same wake time every day including weekends — shifts your sleep phase earlier within 2 weeks\n\n**Waking at 3 AM:**\n- Brain solving problems during sleep\n- Fix: Keep a notebook by the bed — write the thought that woke you. Externalising it stops your brain holding it",
      "## The Sleep Hygiene Checklist\n- Temperature: 18-20 degrees C — body needs to lower core temperature to sleep\n- Darkness: Complete blackout — even phone charging light affects melatonin\n- Consistency: Same wake time daily — the most powerful intervention\n- Caffeine cutoff: Before 2 PM — half-life is 5-6 hours\n- No screens 30-60 minutes before bed\n- Phone out of bedroom: Buy a Rs 500 alarm clock",
      "## What Actually Helps vs Hype\n**Actually works:** Consistent wake time, cool dark room, exercise (not within 2 hours of bed), limiting caffeine.\n\n**Overhyped:** Most sleep supplements except magnesium glycinate (mild evidence). White noise (helpful for some, irrelevant for others).\n\n**Track without obsessing:** Sleep Cycle app or smartwatch shows trends. Use to identify patterns, not as a daily report card — worrying about sleep data is itself a cause of poor sleep."
    ]
  },
  "jee-preparation-2026": {
    title: "JEE 2026 Preparation: Complete Strategy to Crack IIT Entrance",
    tag: "Education", date: "January 2026", readTime: "11 min read",
    body: [
      "## JEE 2026 — The Structure",
      "JEE Main 2026: NTA conducts two sessions (January + April), best score counts. JEE Advanced: for top 2.5 lakh JEE Main qualifiers — IIT admission. Physics, Chemistry, Maths carry equal weight in both.",
      "## Subject Strategy\n**Mathematics:** Most differentiating subject. Priority: Calculus (25-30% of maths), Coordinate Geometry, Complex Numbers, Probability. Minimum 150-200 problems per topic.\n\n**Physics:** Conceptual over memorisation. Priority: Mechanics (30%), Electrostatics + Current Electricity (25%), Modern Physics (15%). NCERT is mandatory — many JEE Main questions come directly from NCERT.\n\n**Chemistry:** Highest marks per hour invested. Organic (35%): reaction mechanisms. Physical (35%): numerical problems. Inorganic (30%): NCERT + periodic trends.",
      "## 12-Month Plan\n- Months 1-4: Complete NCERT for all three subjects. Non-negotiable.\n- Months 5-8: Topic-by-topic problem solving with standard books\n- Months 9-10: Previous year papers 2010-2025 — pattern recognition is crucial\n- Months 11-12: Full mock tests twice per week under timed conditions",
      "## Mock Tests Are Non-Negotiable\nTime management kills more JEE aspirants than lack of knowledge. Students doing 50+ mocks significantly outperform those who only study. JEE Main: 3 hours, 90 questions, 2 minutes per question average.\n\nKey resources: HC Verma (Physics), RD Sharma/Cengage (Maths), NCERT + VK Jaiswal (Organic Chemistry). Previous papers free on NTA website. See [JEE Maths Academy](/academies/exams/jee-maths)."
    ]
  },
  "jenkins-pipeline-tutorial-2026": {
    title: "Jenkins Pipeline Tutorial 2026: From Zero to Production CI/CD",
    tag: "DevOps", date: "April 2026", readTime: "12 min read",
    body: [
      "## Why Jenkins Still Matters in 2026",
      "GitHub Actions and GitLab CI get all the attention, but Jenkins still runs CI/CD for the majority of enterprise production workloads. Banks, telecoms, healthcare — they built on Jenkins and it works. Knowing Jenkins is a guaranteed interview question at any enterprise DevOps role.",
      "## Your First Declarative Pipeline\n```groovy\n// Jenkinsfile — place this in your Git repo root\npipeline {\n    agent any\n\n    environment {\n        APP_NAME = 'myapp'\n        DOCKER_REGISTRY = 'docker.io/myorg'\n    }\n\n    stages {\n        stage('Checkout') {\n            steps {\n                git branch: 'main', url: 'https://github.com/org/myapp.git'\n            }\n        }\n        stage('Build') {\n            steps { sh 'mvn clean package -DskipTests' }\n        }\n        stage('Test') {\n            steps { sh 'mvn test' }\n            post { always { junit 'target/surefire-reports/*.xml' } }\n        }\n        stage('Docker Build and Push') {\n            steps {\n                withCredentials([usernamePassword(\n                    credentialsId: 'dockerhub-creds',\n                    usernameVariable: 'DOCKER_USER',\n                    passwordVariable: 'DOCKER_PASS'\n                )]) {\n                    sh '''\n                        docker build -t $DOCKER_REGISTRY/$APP_NAME:$BUILD_NUMBER .\n                        docker login -u $DOCKER_USER -p $DOCKER_PASS\n                        docker push $DOCKER_REGISTRY/$APP_NAME:$BUILD_NUMBER\n                    '''\n                }\n            }\n        }\n        stage('Deploy to Kubernetes') {\n            steps {\n                sh '''\n                    kubectl set image deployment/$APP_NAME \\\\\n                        $APP_NAME=$DOCKER_REGISTRY/$APP_NAME:$BUILD_NUMBER\n                    kubectl rollout status deployment/$APP_NAME\n                '''\n            }\n        }\n    }\n    post {\n        success { echo 'Deployment successful!' }\n        failure  { echo 'Deployment failed!' }\n    }\n}\n```",
      "## Key Jenkins Concepts",
      "**Declarative vs Scripted:** Use declarative (the `pipeline {}` syntax) for 95% of use cases. Structured, validated, easy to read. Use scripted Groovy only when declarative cannot express the logic.\n\n**Agents:** `agent any` runs on any available agent. `agent { docker { image 'maven:3.9' } }` runs the stage inside a Docker container — consistent build environment.\n\n**Credentials:** Never hardcode passwords. Store in Jenkins Credentials Manager and reference with `withCredentials()`.",
      "## Parallel Stages for Speed\n```groovy\nstage('Tests') {\n    parallel {\n        stage('Unit Tests')        { steps { sh 'mvn test -Dtest=Unit*' } }\n        stage('Integration Tests') { steps { sh 'mvn test -Dtest=Integration*' } }\n        stage('Security Scan')     { steps { sh 'trivy image myapp:latest' } }\n    }\n}\n// All three run simultaneously — cuts pipeline time by 60%\n```",
      "## Common Failures and Fixes",
      "**Build fails on one agent but not another:** Use Docker agents for consistent environments.\n\n**Pipeline hangs:** Add `timeout(time: 10, unit: 'MINUTES')` to stages.\n\n**Secrets leaking in logs:** Use the Mask Passwords plugin. Never echo passwords.\n\n**Workspace pollution:** Add `cleanWs()` in `post { always { ... } }` to clean after each build.\n\nSee [Jenkins Academy](/academies/devops/jenkins) for the complete CI/CD learning path."
    ]
  },
  "gitops-argocd-beginners-2026": {
    title: "GitOps with ArgoCD 2026: Everything You Need to Know",
    tag: "DevOps", date: "April 2026", readTime: "10 min read",
    body: [
      "## What is GitOps?",
      "GitOps is a simple but powerful idea: **Git is the single source of truth for your infrastructure and applications.** Every configuration change goes through a Git pull request. Nothing is changed directly in the cluster. ArgoCD continuously watches Git and reconciles the cluster to match.",
      "## Why GitOps Changes Everything",
      "**Before GitOps:** Engineers `kubectl apply` directly in production. Changes are not tracked. Rollback means remembering what you changed. Environments drift apart.\n\n**With GitOps:** Every change is a Git commit. Full audit trail. Rollback is `git revert`. If someone manually changes the cluster, ArgoCD detects and reverts it.",
      "## Install ArgoCD on Kubernetes\n```bash\nkubectl create namespace argocd\nkubectl apply -n argocd \\\n  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml\n\n# Get admin password\nkubectl get secret argocd-initial-admin-secret -n argocd \\\n  -o jsonpath='{.data.password}' | base64 -d\n\n# Access UI\nkubectl port-forward svc/argocd-server -n argocd 8080:443\n# Open: https://localhost:8080\n```",
      "## Create Your First Application\n```yaml\napiVersion: argoproj.io/v1alpha1\nkind: Application\nmetadata:\n  name: myapp-production\n  namespace: argocd\nspec:\n  project: default\n  source:\n    repoURL: https://github.com/org/myapp-config\n    targetRevision: main\n    path: overlays/production\n  destination:\n    server: https://kubernetes.default.svc\n    namespace: production\n  syncPolicy:\n    automated:\n      prune: true       # delete resources removed from Git\n      selfHeal: true    # revert manual cluster changes\n    syncOptions:\n    - CreateNamespace=true\n```",
      "## Sync vs OutOfSync vs Drift",
      "**Synced:** Cluster matches Git exactly.\n**OutOfSync:** Cluster differs from Git — someone applied something manually, or a new commit was pushed.\n**Drift:** When cluster state diverges from Git without a commit. With `selfHeal: true`, ArgoCD detects and reverts drift within 3 minutes.",
      "## The Rollback Advantage\n```bash\n# Find last good commit\ngit log --oneline overlays/production/\n\n# Revert to it\ngit revert HEAD~1\ngit push\n# ArgoCD detects the push and rolls back within 3 minutes\n# No kubectl commands needed — Git does it all\n```\nSee [ArgoCD Academy](/academies/devops/argocd) for hands-on GitOps labs."
    ]
  },
  "cka-exam-guide-2026": {
    title: "How to Pass the CKA Exam in 2026: Complete Study Guide",
    tag: "DevOps", date: "May 2026", readTime: "14 min read",
    body: [
      "## What is the CKA?",
      "The Certified Kubernetes Administrator (CKA) is a hands-on, performance-based exam — 2 hours, 17 tasks, 66% passing score. No multiple choice. You get a live Kubernetes cluster and must solve real problems. It is the most respected Kubernetes certification and appears in almost every senior DevOps job description.",
      "## Exam Domains (2024 Curriculum)\n| Domain | Weight |\n|---|---|\n| Cluster Architecture, Installation and Configuration | 25% |\n| Workloads and Scheduling | 15% |\n| Services and Networking | 20% |\n| Storage | 10% |\n| Troubleshooting | 30% |",
      "## The Most Important Preparation Tip",
      "Speed is the biggest challenge. You have 2 hours for 17 tasks — about 7 minutes per task. You cannot Google solutions. You must know commands by muscle memory. Practice until you can type every command without thinking.",
      "## Must-Know Commands\n```bash\n# Create resources quickly with --dry-run\nkubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml\nkubectl create deployment myapp --image=myapp:v1 --replicas=3 \\\n  --dry-run=client -o yaml > deploy.yaml\n\n# Switch cluster context (exam has multiple clusters)\nkubectl config use-context cluster1\nkubectl config get-contexts\n\n# Imperative commands save time\nkubectl expose deployment myapp --port=80 --type=NodePort\nkubectl scale deployment myapp --replicas=5\nkubectl label node node1 disk=ssd\nkubectl taint node node1 key=value:NoSchedule\n\n# Set aliases at exam start (saves 30+ seconds per task)\nalias k=kubectl\nexport do='--dry-run=client -o yaml'\n# Now: k run nginx --image=nginx $do > pod.yaml\n```",
      "## Study Resources in Order",
      "1. Kubernetes.io documentation — the only resource allowed during exam. Know it deeply.\n2. Killer.sh — the official CKA simulator. Do it at least twice. Harder than the real exam.\n3. KodeKloud CKA course — best structured course for beginners.\n4. Practice cluster — run minikube or kind locally, break things and fix them.\n5. [SynfraCore Kubernetes Academy](/academies/devops/kubernetes) — fundamentals through advanced.",
      "## Timeline for Preparation",
      "3 months from zero to exam-ready:\n- Month 1: Core concepts (pods, deployments, services, namespaces)\n- Month 2: Storage, networking, RBAC, cluster administration\n- Month 3: Practice, practice, practice. Killer.sh daily.\n\nBook the exam with a 2-week buffer. The pressure of a scheduled exam forces preparation intensity."
    ]
  },
  "monitoring-prometheus-grafana-2026": {
    title: "Prometheus and Grafana 2026: Complete Monitoring Setup Guide",
    tag: "DevOps", date: "May 2026", readTime: "11 min read",
    body: [
      "## Why Monitoring Cannot Be an Afterthought",
      "Production systems fail without warning when you have no monitoring. You find out about the problem when a customer calls. With Prometheus and Grafana, you know about problems 30 minutes before users notice — and you have the data to fix them fast.",
      "## How Prometheus and Grafana Work Together\n```\nYour App (/metrics endpoint)\n    ↓ (Prometheus scrapes every 30s)\nPrometheus (stores time-series data)\n    ↓ (Grafana queries with PromQL)\nGrafana (dashboards and alerts)\n    ↓ (Alertmanager routes alerts)\nSlack / PagerDuty / Email\n```",
      "## Install with Helm\n```bash\nhelm repo add prometheus-community https://prometheus-community.github.io/helm-charts\nhelm repo update\n\n# Install Prometheus + Grafana + Alertmanager + node-exporter\nhelm install monitoring prometheus-community/kube-prometheus-stack \\\n  --namespace monitoring \\\n  --create-namespace \\\n  -f values.yaml\n\n# Access Grafana (default: admin / prom-operator)\nkubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring\n```",
      "## Make Your App Observable\n```python\nfrom prometheus_client import Counter, Histogram, start_http_server\n\nREQUESTS = Counter('http_requests_total', 'Total HTTP requests', ['method', 'status'])\nLATENCY  = Histogram('http_request_duration_seconds', 'Request latency')\n\n# Record metrics in your handlers\nwith LATENCY.time():\n    response = handle_request()\n    REQUESTS.labels(method='GET', status='200').inc()\n\n# Expose /metrics on port 8001\nstart_http_server(8001)\n```",
      "## Essential PromQL Queries\n```promql\n# Request rate (per second, last 5 minutes)\nrate(http_requests_total[5m])\n\n# Error rate percentage\nrate(http_requests_total{status=~\"5..\"}[5m])\n/ rate(http_requests_total[5m]) * 100\n\n# 95th percentile latency\nhistogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))\n\n# Pod restart count (last 1 hour)\nincrease(kube_pod_container_status_restarts_total[1h]) > 0\n```",
      "## Critical Alerts to Set Up on Day 1\n```yaml\ngroups:\n- name: critical.rules\n  rules:\n  - alert: HighErrorRate\n    expr: rate(http_requests_total{status=~\"5..\"}[5m]) > 0.05\n    for: 5m\n    labels: { severity: critical }\n    annotations:\n      summary: \"Error rate above 5%\"\n\n  - alert: NodeDiskFull\n    expr: (node_filesystem_avail_bytes / node_filesystem_size_bytes) < 0.10\n    for: 5m\n    labels: { severity: critical }\n    annotations:\n      summary: \"Node disk less than 10% free\"\n```\nSee [Prometheus Academy](/academies/devops/prometheus) for the complete observability path."
    ]
  },
  "ethical-hacking-roadmap-2026": {
    title: "Ethical Hacking Roadmap 2026: From Beginner to OSCP",
    tag: "Security", date: "January 2026", readTime: "11 min read",
    body: [
      "## What is Ethical Hacking?",
      "Ethical hacking is the practice of using the same techniques as real attackers — with written authorisation — to find vulnerabilities before they are exploited. It is the highest-skilled and highest-paid domain in cybersecurity. The path is long but every step builds practical, employable skill.",
      "## The Correct Learning Order",
      "**Step 1 — Foundations (3 months):**\nNetworking (TCP/IP, DNS, HTTP/S, how packets travel), Linux command line (essential — attackers use Linux), Python scripting (automate tasks, write simple exploits), and how web applications work (request/response, cookies, sessions, authentication flows). Skip this foundation and you will struggle with everything else.\n\n**Step 2 — Core Security Concepts (2 months):**\nOWASP Top 10 (the 10 most common web vulnerabilities), cryptography basics (symmetric, asymmetric, hashing), network protocols in depth (TCP handshake, ARP, DNS poisoning concepts), and Windows/Linux privilege escalation.\n\n**Step 3 — Hands-on Practice (ongoing):**\nTryHackMe for guided beginner labs. HackTheBox for realistic challenges. DVWA (Damn Vulnerable Web Application) locally for web app practice. VulnHub for downloadable vulnerable machines.",
      "## Tool Stack You Must Know\n```bash\n# Reconnaissance\nnmap -sC -sV -O target.ip          # port scan + service detection\nsubfinder -d example.com           # subdomain enumeration\ntheHarvester -d example.com -b google  # OSINT emails and domains\n\n# Web Application Testing\n# Burp Suite Community (free) — intercept and modify HTTP requests\ngobuster dir -u http://target.com -w /usr/share/wordlists/dirb/common.txt\nnikto -h http://target.com\n\n# Exploitation\nmsfconsole                         # Metasploit Framework\nsearchsploit apache 2.4            # search local exploit database\n\n# Post-exploitation\nlinpeas.sh                         # Linux privilege escalation enumeration\nwinpeas.exe                        # Windows privilege escalation\n```",
      "## Certification Path",
      "**eJPT (eLearnSecurity Junior Penetration Tester):** Start here. Practical exam, affordable (~$200), good validation for beginners. Pass rate is high for prepared candidates.\n\n**CEH (Certified Ethical Hacker):** Common in Indian job postings. Mostly theoretical, multiple choice. Good for resume visibility.\n\n**OSCP (Offensive Security Certified Professional):** The gold standard. 24-hour hands-on exam — you hack 5 machines and write a professional report. No hints, no multiple choice. Highly respected by every serious security employer. Aim for this after 6-12 months of consistent practice.",
      "## Salary in India (2026)\nEntry (CEH level): Rs 4-8 LPA. Mid (2-3 years, bug bounties): Rs 12-25 LPA. Senior (OSCP, red team): Rs 25-50 LPA. Top bug bounty hunters: Rs 50+ LPA equivalent from program rewards.\n\nThe fastest path to high income: CEH for employment + consistent HackTheBox + OSCP target within 12 months. See [Security Academy](/academies/security) for the complete path."
    ]
  },
  "soc-analyst-guide-2026": {
    title: "SOC Analyst Career 2026: Your Complete Entry Guide",
    tag: "Security", date: "February 2026", readTime: "9 min read",
    body: [
      "## What Does a SOC Analyst Do?",
      "A Security Operations Center (SOC) analyst monitors an organisation's IT environment 24/7 for signs of attack, investigates security alerts, and responds to incidents. Think of it as being a security detective — you see thousands of events daily, most are noise, and your job is to find the signal.",
      "## The Three Tiers",
      "**Tier 1 — Alert Triage:** Monitor dashboards, review SIEM alerts, rule out false positives, escalate real threats. Entry level, high volume. Repetitive but builds pattern recognition that makes you excellent at Tier 2.\n\n**Tier 2 — Incident Investigation:** Investigate escalated alerts, perform deeper analysis using EDR tools, contain and eradicate threats, write incident reports. This is where the real learning happens.\n\n**Tier 3 — Threat Hunting:** Proactively search for threats that bypassed automated detection. Build detection rules. Develop response playbooks. The most skilled, most paid tier.",
      "## The Tools You Must Learn\n```spl\n# Splunk SPL — most common SIEM in India\n| search sourcetype=windows_security EventCode=4625\n| stats count by user, src_ip\n| where count > 20\n| eval description=\"Possible brute force from \" . src_ip\n\n# Detect after-hours admin login\n| search sourcetype=auth_events action=login success=true\n| eval hour=strftime(_time, \"%H\")\n| where hour < 7 OR hour > 20\n\n# File integrity monitoring\n| search sourcetype=sysmon EventCode=11\n| where match(file_name, \"\\\\.exe$\")\n| stats count by host, file_path\n```",
      "## MITRE ATT&CK Framework",
      "Every SOC analyst must know MITRE ATT&CK — a publicly available knowledge base of real attacker techniques organised by tactic (Initial Access, Execution, Persistence, Privilege Escalation, etc.). When you see an alert, you map it to an ATT&CK technique. This gives context: what is the attacker trying to do, and what else might they do next?",
      "## Certifications and Salaries",
      "**CompTIA Security+:** The baseline certification for SOC roles. Widely required by Indian IT companies for security positions. Multiple choice, well-studied, achievable in 2-3 months.\n\n**CompTIA CySA+:** Analyst-focused, more practical than Security+. Strong for Tier 2 roles.\n\n**Splunk Core Certified User:** Specific to Splunk SIEM — valuable since Splunk is dominant in enterprise.\n\nSalaries (India 2026): Tier 1 fresher: Rs 3.5-7 LPA. Tier 2 (2-3 years): Rs 10-18 LPA. Tier 3/Senior: Rs 20-40 LPA. See [Security Academy](/academies/security) for hands-on SIEM labs."
    ]
  },
  "network-security-guide-2026": {
    title: "Network Security 2026: Fundamentals Every Engineer Must Know",
    tag: "Security", date: "March 2026", readTime: "9 min read",
    body: [
      "## Why Network Security is Everyone's Responsibility",
      "DevOps engineers who configure VPCs, developers who deploy applications, SREs who manage infrastructure — all make network security decisions daily. A misconfigured security group or open port is a network security failure, not just a configuration mistake.",
      "## Core Concepts",
      "**Firewalls:** Control what traffic is allowed in and out based on rules. Stateful firewalls (modern) track connection state — they know a response packet belongs to an existing allowed connection. Stateless firewalls evaluate each packet independently.\n\n**Network Segmentation:** Divide the network into zones with different trust levels. Production and development in separate networks. Databases only reachable from application servers. If one segment is compromised, the attacker cannot directly reach other segments.\n\n**VPN (Virtual Private Network):** Encrypts traffic between a device and a network. Site-to-site VPN connects office networks. Remote access VPN lets employees securely connect to corporate resources.\n\n**Zero Trust:** Never trust any connection by default, even internal ones. Verify identity + device health + context for every access request. The modern replacement for the old perimeter security model.",
      "## Common Attacks and Defences",
      "**Man-in-the-Middle (MITM):** Attacker intercepts communication between two parties.\nDefence: TLS/HTTPS everywhere. HSTS headers force HTTPS. Certificate pinning for mobile apps.\n\n**DDoS (Distributed Denial of Service):** Flood a server with traffic until it cannot serve legitimate users.\nDefence: Cloudflare or AWS Shield for DDoS mitigation. Rate limiting. Auto-scaling.\n\n**ARP Spoofing:** Attacker poisons ARP cache to redirect local network traffic through their machine.\nDefence: Dynamic ARP Inspection on managed switches. Use HTTPS everywhere so intercepted traffic is useless.\n\n**Port Scanning:** Reconnaissance technique to discover running services.\nDefence: Close unused ports. Use security groups/firewalls to whitelist only necessary traffic.",
      "## Practical AWS Network Security\n```hcl\n# Security Group — never use 0.0.0.0/0 for sensitive ports\nresource \"aws_security_group\" \"database\" {\n  ingress {\n    from_port       = 5432\n    to_port         = 5432\n    protocol        = \"tcp\"\n    security_groups = [aws_security_group.app.id]  # app only\n  }\n  # No public internet access to database\n}\n\n# WAF — protect public-facing applications\n# Block: SQL injection, XSS, common scanners\n# Rate limit: 1000 requests per IP per minute\n```\nSee [Security Academy](/academies/security/network-security) for complete guide."
    ]
  },
  "nutrition-for-tech-2026": {
    title: "Nutrition for Tech Professionals 2026: Eat for Focus and Energy",
    tag: "Health", date: "February 2026", readTime: "8 min read",
    body: [
      "## The Brain Uses 20% of Your Energy",
      "The brain is 2% of your body weight but consumes 20% of your calories. What you eat directly affects cognitive performance — focus, memory, problem-solving, and decision-making. The 3 PM crash, brain fog after a heavy lunch, sharp clarity after a good breakfast — all nutrition-driven.",
      "## Biggest Nutrition Mistakes Developers Make",
      "**Skipping meals:** Glucose is the brain's primary fuel. Skipping meals causes hypoglycemia — low blood sugar leads to poor concentration and irritability. Even if you are not hungry, eating keeps your brain fuelled.\n\n**Eating at the desk:** Distracted eating leads to eating too fast and too much. Digestion is worse when stressed. Take a real 20-minute lunch away from screens — afternoon productivity improves.\n\n**Ultra-processed convenience snacks:** Biscuits, chips, instant noodles at the desk cause blood sugar spikes followed by crashes. You feel energised for 30 minutes then exhausted for 2 hours.",
      "## Brain Foods That Actually Work",
      "**Omega-3 fatty acids:** Critical for brain structure. Found in fatty fish (sardines, mackerel — affordable canned), walnuts, flaxseeds, chia seeds. Target 2-3 servings of fatty fish per week.\n\n**Eggs:** Choline is essential for acetylcholine — the neurotransmitter for learning and memory. The whole egg, not just the white.\n\n**Dark leafy greens:** Spinach, methi (fenugreek), moringa — folate and vitamin K support brain health. Moringa is exceptionally nutrient-dense and widely available in India.\n\n**Nuts (especially walnuts):** High in DHA, vitamin E, and polyphenols. A small handful (30g) daily.",
      "## Practical Indian Developer Menu",
      "**Breakfast:** Idli + sambar (protein + fermented = sustained energy). Or 2 eggs + whole grain toast + banana. Avoid: heavy fried breakfast, skipping entirely.\n\n**Lunch:** Dal + brown rice/roti + sabzi + small salad. Key: protein + complex carb combination. Avoid: large portions, heavy fried foods.\n\n**Afternoon snack (prevent 3 PM crash):** Handful of nuts + fruit. Or curd (yogurt) + fruit. Or roasted chana.\n\n**Dinner:** Lighter than lunch. Avoid eating 2+ hours before sleep for better sleep quality.\n\n**Hydration:** 35ml per kg of body weight daily. 70kg = 2.5 litres. Keep a 1-litre bottle at your desk and refill it twice by 6 PM.",
      "## The Indian Advantage",
      "Traditional Indian cooking is genuinely excellent brain food: idli and dosa (fermented, gut-healthy), turmeric (anti-inflammatory), cumin and coriander (digestive), lentils and chickpeas (prebiotic fibre), fenugreek (regulates blood sugar). Minimally processed traditional Indian food eaten consistently is one of the best diets for cognitive performance."
    ]
  },
  "exercise-for-desk-workers-2026": {
    title: "Exercise for Desk Workers 2026: Stay Healthy When You Sit All Day",
    tag: "Health", date: "March 2026", readTime: "8 min read",
    body: [
      "## Sitting All Day is a Serious Health Risk",
      "Sitting for 8+ hours daily is associated with increased cardiovascular disease risk, type 2 diabetes, obesity, and all-cause mortality — even if you exercise for an hour. The research is clear: prolonged uninterrupted sitting has negative health effects independent of your total exercise. The solution is not just a daily gym session — it is breaking up sitting throughout the day.",
      "## The 20-8-2 Rule",
      "For every 30 minutes, aim for: 20 minutes sitting, 8 minutes standing, 2 minutes moving. Ideal ratio for metabolic health. Achievable with a few habit changes.",
      "## Immediate Changes That Help Most",
      "**Standing desk or adjustable desk:** Stand for at least 2 hours of your 8-hour workday. Alternate sitting and standing — standing all day is also bad.\n\n**Movement alarm:** Set a timer every 45-60 minutes. When it fires, stand up and move for 2-5 minutes — walk to the kitchen, do a short hall walk, do standing stretches.\n\n**Walking meetings:** Any meeting that does not require a screen can be a walking meeting. 30 minutes of walking meetings per day adds significant movement without extra time.\n\n**Walk after meals:** A 10-minute walk after eating significantly improves blood glucose management — reduces the post-meal energy crash that hits at 3 PM.",
      "## Desk Exercises — No Equipment\n```\nEvery hour, pick one (takes 2-3 minutes):\n\nNeck (prevent tech neck):\n  Slow neck rolls: left, back, right, forward x3\n  Chin tucks: pull chin back, hold 5 seconds x10\n\nWrists (prevent RSI from typing):\n  Wrist circles: 10 each direction\n  Prayer stretch: press palms together, lower slowly\n\nBack:\n  Chest opener: clasp hands behind back, squeeze shoulder blades\n  Seated twist: rotate torso left and right, hold 10 seconds each\n\nLegs:\n  Calf raises standing: 20 reps\n  Quad stretch: stand, pull one foot back, hold 20 seconds each\n```",
      "## Making It a Habit",
      "Tie exercise to existing habits:\n- After morning coffee → 10-minute walk\n- When a build is running → stretches at the desk\n- After each video call → stand and walk for 2 minutes\n- After work → gym or run BEFORE going home (not after dinner)\n\nConsistency beats intensity. 20 minutes daily is more valuable than 2 hours on Sunday. See [Human Essentials Academy](/academies/essentials) for complete wellness guide."
    ]
  },
  "digital-wellbeing-2026": {
    title: "Digital Wellbeing 2026: How to Use Technology Without Being Used by It",
    tag: "Health", date: "April 2026", readTime: "7 min read",
    body: [
      "## The Paradox of Tech Workers",
      "People who build and use technology all day are simultaneously the most connected and the most at risk of digital overload. When your work IS a screen, the boundaries between work, rest, and play all collapse onto the same device. The evening 'relaxation' of scrolling social media is still screen time — still activating the same attentional systems you have been using all day.",
      "## What Excessive Screen Time Actually Does",
      "**Attention fragmentation:** Constant notifications train your brain to expect interruption every few minutes. After years of this, sustained focus on one task for 30 minutes becomes genuinely difficult — not a willpower problem, but a trained neural pathway.\n\n**Sleep disruption:** Blue light from screens suppresses melatonin for 1-3 hours after viewing. Checking social media in bed delays sleep and reduces sleep quality even when you fall asleep on time.\n\n**Comparison anxiety:** Social media creates continuous upward comparison — you see others' career highlights and success announcements. The algorithmic feed maximises engagement, which often means maximising emotional response including envy and anxiety.",
      "## Changes With Outsized Impact",
      "**No phone for the first 30-60 minutes after waking:** Your brain just emerged from sleep and is in a receptive, creative state. Exposing it immediately to notifications and social media fragments that state before your day begins.\n\n**Phone out of the bedroom:** Charge it in another room. If you use it as an alarm, buy a Rs 500 alarm clock. Single highest-impact change for sleep quality.\n\n**Uninstall social media apps from phone:** Access from browser on desktop only. Most people find they use social media 80% less without the app on their phone.\n\n**One full offline day per week:** At least 4-6 consecutive offline hours — go for a walk, cook, read a physical book, spend time with people in person.",
      "## Turn Off All Non-Essential Notifications",
      "You do not need to know immediately about every like, comment, news headline, or app update. Check intentionally, not reactively. The rule: only keep notifications that require a response within 1 hour. Everything else can wait. Most things can wait.",
      "## What to Do With Recovered Time",
      "The most common report after reducing screen time: 'I had no idea how much time I was wasting.' Use the hours for: reading physical books, outdoor time, creative hobbies, face-to-face relationships, cooking, exercise. These activities provide genuine mental restoration in ways that passive screen consumption does not."
    ]
  },
  "placement-prep-guide-2026": {
    title: "Campus Placement Preparation 2026: Complete Guide for CS Students",
    tag: "Education", date: "March 2026", readTime: "12 min read",
    body: [
      "## The Placement Reality in 2026",
      "Campus placements for CS students are more competitive than ever. Even top NITs see candidates from IITs competing for the same packages. But campus placement remains the most efficient job-search channel for freshers — if you are well-prepared. Companies visiting your campus are specifically looking for campus hires; that advantage is significant.",
      "## What Every Round Tests",
      "**Round 1 — Online Assessment (OA):**\nTypically on HackerRank, HackerEarth, or CodeSignal. 2-3 coding problems + MCQs (aptitude, OS, DBMS, networks, C/Java basics). Time: 90-120 minutes. Practice on LeetCode and HackerRank specifically under timed conditions — speed matters as much as correctness.\n\n**Round 2 — Technical Interview:**\nDSA problems (1-2 medium-level problems, 45-60 minutes), projects discussion (know every line of your resume), core CS concepts (OS: process vs thread, deadlock, paging; DBMS: normalisation, ACID, indexes; Networks: TCP vs UDP, HTTP vs HTTPS, DNS).\n\n**Round 3 — HR Interview:**\nBehavioural questions using STAR method (Situation, Task, Action, Result). Common questions: 'Tell me about yourself' (prepare a 90-second version), 'Why our company?', 'A challenge you overcame'. Salary expectations discussion.",
      "## Resume That Gets Shortlisted",
      "**One page maximum.** Recruiters spend 10-30 seconds on a resume. Every word must earn its place.\n\n**Projects section is most important** (after education for freshers):\n- Name: descriptive, not 'Project 1'\n- Tech stack used: React, Node.js, PostgreSQL, Docker, AWS\n- What problem it solves: one sentence\n- Scale/metric: 'handles 1000 concurrent users', '95% accuracy on test set'\n\n**Good project ideas that impress:**\n- Full-stack web app with authentication, database, deployed to cloud\n- DevOps pipeline: Dockerised app + Jenkins/GitHub Actions + Kubernetes deployment\n- API project with documentation, rate limiting, and proper error handling\n- Any project that solves a real problem you personally faced",
      "## Core CS Must-Know for Interviews",
      "**Operating Systems (5-8 marks in many OAs):**\n- Process vs Thread (OS-level vs same process memory space)\n- Deadlock: four conditions (mutual exclusion, hold and wait, no preemption, circular wait)\n- Paging vs Segmentation, Virtual Memory\n- Scheduling algorithms: FCFS, SJF, Round Robin, Priority\n\n**DBMS:**\n- Normalisation: 1NF, 2NF, 3NF (be able to normalise a given table)\n- ACID properties with examples\n- Indexing: B-tree, clustered vs non-clustered\n- SQL: JOINs, GROUP BY, HAVING, window functions\n\n**Networks:**\n- TCP vs UDP differences and when to use each\n- HTTP vs HTTPS (TLS handshake, certificates)\n- DNS resolution steps\n- What happens when you type a URL in a browser (very common question)",
      "## 6-Month Timeline",
      "Starting 6 months before placement season:\n\n**Months 1-2:** DSA fundamentals — arrays, linked lists, stacks, queues, trees, binary search. LeetCode Easy (50 problems).\n\n**Months 3-4:** DSA intermediate — graphs, DP basics, sliding window, two pointers. LeetCode Medium (80 problems). Start core CS revision.\n\n**Months 5:** Company-specific practice (LeetCode company tags for your target companies). Mock interviews with friends.\n\n**Month 6:** Full mock tests under exam conditions. Final resume polish. Research target companies deeply.\n\nSee [DSA Academy](/academies/education/dsa) and [System Design Academy](/academies/education/system-design) for structured practice."
    ]
  },
  "cpp-beginners-2026": {
    title: "C++ for Beginners 2026: Learn the Language That Powers Everything",
    tag: "Education", date: "April 2026", readTime: "10 min read",
    body: [
      "## Why Learn C++ in 2026?",
      "C++ powers: game engines (Unreal Engine, Unity internals), operating systems (Windows, macOS internals), high-frequency trading systems, database engines (MySQL, PostgreSQL, SQLite all written in C/C++), embedded systems, and competitive programming. It is the language where understanding how computers actually work is unavoidable — which makes you a better programmer in every other language too.",
      "## C++ vs C vs Java vs Python\n| | C++ | Python | Java |\n|---|---|---|---|\n| Speed | Fastest (near C) | Slowest | Fast |\n| Memory control | Manual (you control) | Automatic | Automatic |\n| Use case | Systems, games, HFT | Scripts, AI, web | Enterprise, Android |\n| Learning curve | Steep | Easy | Medium |\n| Job market | Systems/embedded/gaming | Data science/web/automation | Enterprise/Android |",
      "## Core Syntax\n```cpp\n#include <iostream>\n#include <vector>\n#include <string>\nusing namespace std;\n\n// Functions\nint add(int a, int b) {\n    return a + b;\n}\n\n// Classes\nclass Person {\nprivate:\n    string name;\n    int age;\npublic:\n    Person(string n, int a) : name(n), age(a) {}  // constructor\n    void greet() {\n        cout << \"Hello, I am \" << name << \" and I am \" << age << endl;\n    }\n};\n\nint main() {\n    // Variables\n    int x = 10;\n    double pi = 3.14159;\n    string msg = \"Hello C++\";\n    bool flag = true;\n\n    // Vectors (dynamic arrays)\n    vector<int> nums = {1, 2, 3, 4, 5};\n    nums.push_back(6);\n    cout << nums.size() << endl;  // 6\n\n    // Range-based for loop\n    for (int n : nums) cout << n << \" \";\n\n    // Object creation\n    Person vishnu(\"Vishnu\", 30);\n    vishnu.greet();\n\n    return 0;\n}\n```",
      "## Pointers — The Core C++ Concept\n```cpp\nint x = 42;\nint* ptr = &x;     // ptr stores the address of x\ncout << *ptr;      // dereference: prints 42\n*ptr = 100;        // changes x to 100 through pointer\ncout << x;         // prints 100\n\n// Dynamic memory allocation\nint* arr = new int[10];  // allocate on heap\narr[0] = 1;\ndelete[] arr;            // MUST free or memory leak!\n\n// Smart pointers (C++11) — avoid manual delete\n#include <memory>\nauto smartArr = make_unique<int[]>(10);  // auto-deletes\n```",
      "## STL — Standard Template Library\n```cpp\n#include <vector>    // dynamic array\n#include <map>       // key-value store (sorted)\n#include <unordered_map>  // key-value store (hash table, O(1))\n#include <set>       // unique sorted elements\n#include <stack>     // LIFO\n#include <queue>     // FIFO\n#include <algorithm> // sort, find, max, min\n\n// Sort vector\nvector<int> v = {5, 2, 8, 1, 9};\nsort(v.begin(), v.end());  // {1, 2, 5, 8, 9}\n\n// Map\nmap<string, int> scores;\nscores[\"Alice\"] = 95;\nscores[\"Bob\"] = 87;\nfor (auto& [name, score] : scores) {\n    cout << name << \": \" << score << endl;\n}\n```",
      "## Learning Path\n- Week 1-2: Syntax, variables, loops, functions\n- Week 3-4: Arrays, pointers, strings, classes\n- Week 5-6: STL (vector, map, set), templates\n- Week 7-8: File I/O, error handling, smart pointers\n- Month 2+: Data structures from scratch (linked list, BST, graph), competitive programming\n\nResources: 'The C++ Programming Language' by Stroustrup, cppreference.com, LeetCode for practice. See [C++ Academy](/academies/education/cpp)."
    ]
  },
  "os-concepts-interview-2026": {
    title: "Operating Systems Interview Questions 2026: Top 40 With Answers",
    tag: "Education", date: "May 2026", readTime: "12 min read",
    body: [
      "## Why OS Questions Appear in Every Interview",
      "Operating system concepts test fundamental understanding of how computers work — and interviewers use them as a proxy for engineering depth. A developer who understands processes, memory, and scheduling is better at writing efficient code, debugging production issues, and understanding system bottlenecks.",
      "## Process and Thread (Q1-Q10)",
      "**Q1: What is the difference between a process and a thread?**\nA process is an independent program in execution with its own memory space (code, data, heap, stack). A thread is a lightweight unit of execution within a process — all threads in a process share the same memory space (code, data, heap) but each has its own stack and registers. Creating a thread is faster and cheaper than creating a process. Context switching between threads is faster than between processes.\n\n**Q2: What is a context switch?**\nSaving the state (registers, program counter, stack pointer) of the currently running process/thread and loading the state of the next one. Allows the OS to multitask on a single CPU core. Context switches are expensive — too many degrade performance.\n\n**Q3: What is the difference between concurrency and parallelism?**\nConcurrency: multiple tasks making progress by sharing a CPU (time-slicing). Parallelism: multiple tasks actually running simultaneously on multiple CPU cores. Concurrency is about structure, parallelism is about execution.",
      "## Synchronisation and Deadlock (Q11-Q20)",
      "**Q11: What is a race condition?**\nWhen two or more threads access shared data simultaneously and the result depends on the relative timing of their execution. Example: two threads both read a counter (value=5), both increment it, both write 6 — the increment is lost. Should be 7.\n\n**Q12: What are the four conditions for deadlock?**\nMutual exclusion: resource can only be held by one process at a time. Hold and wait: process holds a resource while waiting for another. No preemption: resources cannot be forcibly taken away. Circular wait: process A waits for B, B waits for C, C waits for A.\n\n**Q13: How do you prevent deadlock?**\nBreak one of the four conditions. Most common: prevent circular wait by imposing a total ordering on resource acquisition (always acquire Lock 1 before Lock 2). Or use tryLock with timeout to detect and break cycles.",
      "## Memory Management (Q21-Q30)",
      "**Q21: What is virtual memory?**\nAn abstraction that gives each process the illusion of having a large, private address space. The OS maps virtual addresses to physical RAM using page tables. When physical RAM is full, infrequently used pages are swapped to disk (swap space). This allows running more processes than fit in physical RAM.\n\n**Q22: What is paging vs segmentation?**\nPaging: memory divided into fixed-size blocks (pages). Eliminates external fragmentation. Simple to implement. May have internal fragmentation (last page not fully used). Segmentation: memory divided into variable-size logical segments (code, data, stack). More natural for programs but causes external fragmentation.\n\n**Q23: What is thrashing?**\nWhen a system spends more time swapping pages to/from disk than executing actual code — because the working set of all processes exceeds physical RAM. Symptoms: CPU utilisation drops while disk activity spikes. Fix: reduce number of active processes or add RAM.",
      "## Scheduling (Q31-Q40)",
      "**Q31: What is CPU scheduling and why does it matter?**\nThe OS decides which process gets CPU time when multiple are ready. Good scheduling maximises CPU utilisation, minimises response time, and ensures fairness.\n\n**Q32: Compare FCFS, SJF, and Round Robin.**\nFCFS (First Come First Served): simple, no starvation, but long jobs block short ones (convoy effect). SJF (Shortest Job First): optimal average waiting time but requires knowing burst time in advance; can starve long jobs. Round Robin: each process gets a fixed time quantum (e.g. 10ms), then CPU moves to next. Fair, good for interactive systems.\n\n**Q33: What is priority scheduling and the starvation problem?**\nProcesses assigned priorities — highest priority runs first. Problem: low-priority processes may never run if high-priority processes keep arriving. Solution: aging — gradually increase priority of waiting processes over time.\n\nSee [OS Academy](/academies/education/os) for the complete operating systems guide."
    ]
  },
  "computer-networks-interview-2026": {
    title: "Computer Networks Interview Questions 2026: Top 35 With Answers",
    tag: "Education", date: "June 2026", readTime: "11 min read",
    body: [
      "## Why Networking Questions Appear in Every Tech Interview",
      "Whether you are a DevOps engineer, backend developer, or security engineer — networking is the foundation everything else runs on. Interviewers use networking questions to test depth: do you understand what actually happens, or do you just know the surface-level answer?",
      "## OSI and TCP/IP Model (Q1-Q8)",
      "**Q1: What are the layers of the OSI model?**\nPhysical (bits on wire), Data Link (MAC addresses, Ethernet frames), Network (IP routing), Transport (TCP/UDP, ports), Session (connection management), Presentation (encoding, encryption), Application (HTTP, DNS, SMTP). Mnemonic: Please Do Not Throw Sausage Pizza Away.\n\n**Q2: What is the difference between TCP and UDP?**\nTCP: connection-oriented (3-way handshake), reliable (acknowledgements, retransmission), ordered delivery, flow control. Slower but guaranteed. Use for: HTTP, SSH, email.\nUDP: connectionless, no acknowledgements, no ordering, fastest. Use for: video streaming, DNS queries, online gaming, VoIP — where speed matters more than reliability.\n\n**Q3: Explain the TCP 3-way handshake.**\nClient sends SYN (I want to connect, my sequence number is X). Server responds SYN-ACK (acknowledged, my sequence number is Y). Client sends ACK (acknowledged). Connection established. This takes one round-trip time before any data is sent — why HTTP/2 and QUIC matter for performance.",
      "## IP Addressing and DNS (Q9-Q18)",
      "**Q9: What is the difference between a public and private IP address?**\nPrivate IP ranges (RFC 1918): 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16. Not routable on the public internet. Used inside networks (home, corporate). NAT (Network Address Translation) translates private IPs to a public IP for internet access.\n\n**Q10: What is DNS and how does DNS resolution work?**\nDNS maps domain names to IP addresses. Resolution: (1) Check browser cache. (2) Check OS cache (/etc/hosts). (3) Ask Recursive Resolver (ISP or 8.8.8.8). (4) Resolver asks Root Nameserver for .com TLD server. (5) Resolver asks .com TLD server for example.com nameserver. (6) Resolver asks example.com nameserver for the A record. (7) IP returned and cached.\n\n**Q11: What is DHCP?**\nDynamic Host Configuration Protocol automatically assigns IP addresses, subnet masks, gateways, and DNS servers to devices on a network. Without DHCP, every device would need manual static configuration.",
      "## HTTP and Web (Q19-Q28)",
      "**Q19: What is the difference between HTTP and HTTPS?**\nHTTP sends data in plain text — anyone on the network can read it. HTTPS uses TLS to encrypt data between client and server. The TLS handshake: client says hello with supported cipher suites, server sends certificate (contains public key), client verifies certificate against trusted CAs, they negotiate a symmetric session key, all subsequent data encrypted with that key.\n\n**Q20: What is a CDN?**\nContent Delivery Network — geographically distributed servers that cache static content (images, JS, CSS, videos) close to users. Instead of every Indian user loading assets from a US server (200ms latency), they load from a Cloudflare or AWS CloudFront edge node in Mumbai (10ms). Dramatically improves page load times globally.\n\n**Q21: What are HTTP status codes?**\n2xx: Success (200 OK, 201 Created, 204 No Content). 3xx: Redirect (301 Moved Permanently, 302 Found, 304 Not Modified). 4xx: Client Error (400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests). 5xx: Server Error (500 Internal Server Error, 502 Bad Gateway, 503 Service Unavailable, 504 Gateway Timeout).",
      "## Firewalls, Load Balancers, and Security (Q29-Q35)",
      "**Q29: What is a load balancer?**\nDistributes incoming traffic across multiple backend servers to prevent any single server from being overwhelmed. Load balancing algorithms: Round Robin (each server in turn), Least Connections (send to least busy server), IP Hash (same client always goes to same server — useful for sessions). Layer 4 (TCP/UDP routing) or Layer 7 (HTTP routing — can route based on URL path, headers).\n\n**Q30: What is the difference between a firewall and a WAF?**\nFirewall: filters traffic based on IP addresses, ports, and protocols (Layer 3/4). Blocks entire IP ranges or ports. WAF (Web Application Firewall): filters HTTP traffic for malicious content at the application layer — SQL injection, XSS, OWASP Top 10 attacks. Both are needed: firewall for network security, WAF for application security.\n\n**Q31: What is a VPN?**\nCreates an encrypted tunnel between your device and a remote network. Corporate VPN allows remote employees to securely access internal resources. VPN encrypts traffic at the IP level — your ISP cannot see what sites you visit, though the VPN provider can.\n\nSee [Computer Networks Academy](/academies/education/cn) for complete networking guide."
    ]
  },
  "neet-preparation-2026": {
    title: "NEET 2026 Preparation: Complete Strategy to Crack Medical Entrance",
    tag: "Education", date: "January 2026", readTime: "11 min read",
    body: [
      "## NEET 2026 — What You Need to Know",
      "NEET (National Eligibility cum Entrance Test) is the single entrance exam for MBBS and BDS admissions across India. Conducted by NTA, it has 200 questions (180 to attempt) across Physics, Chemistry, and Biology. Biology carries the most weight and is the differentiating subject.",
      "## Subject-wise Strategy and Marks Distribution",
      "**Biology (360 marks — 50% of total):**\nBotany and Zoology carry equal marks (180 each). NCERT Biology Class 11 and 12 are the definitive books — an estimated 80-90% of NEET biology questions come directly from NCERT. Read every line, every diagram caption, every table. Do not look for shortcuts in biology.\n\n**Chemistry (180 marks):**\nOrganic Chemistry (around 30%): reaction mechanisms, named reactions, identification of compounds. Physical Chemistry (around 35%): numerical problems, equilibrium, thermodynamics. Inorganic Chemistry (35%): periodic trends, coordination compounds, p-block elements — heavily NCERT-based.\n\n**Physics (180 marks):**\nCalculation-heavy. Priority topics: Mechanics (30%), Electrostatics and Current Electricity (25%), Modern Physics (15%). NCERT is necessary but not sufficient for Physics — practice numerical problems from DC Pandey.",
      "## NCERT is Non-Negotiable for Biology",
      "Do not make the mistake of reading summary books or notes instead of NCERT for Biology. The questions use exact NCERT wording. Strategy: (1) Read the chapter. (2) Make line-by-line notes of anything that feels like a 'fact'. (3) Close book and recall. (4) Solve NCERT exercises and exemplar. (5) PYQs (Previous Year Questions) from that chapter.",
      "## 12-Month Preparation Timeline",
      "**Months 1-4:** Complete NCERT for all subjects. Not a summary — the actual NCERT books, every chapter.\n\n**Months 5-8:** Topic-by-topic problem solving. DC Pandey for Physics, VK Jaiswal for Organic Chemistry, NCERT Exemplar for Biology.\n\n**Months 9-10:** Previous year papers 2015-2025 — question pattern recognition is crucial. Many concepts appear repeatedly.\n\n**Months 11-12:** Full mock tests (NTA-style, 200 questions, 3 hours 20 minutes). Target 2 mocks per week. Analyse every mistake. Revision of weak areas only — stop learning new content.",
      "## Common Mistakes That Cost Marks",
      "Negative marking: -1 for each wrong answer. Never guess randomly — only attempt if you can eliminate at least 2 of 4 options. Skipping NCERT diagrams: many questions test diagram-reading (cell structures, heart anatomy, plant tissues). Ignoring Inorganic Chemistry: students focus on Organic and Physical but Inorganic has high marks and is largely memorisation-based with NCERT.\n\nSee [NEET Biology Academy](/academies/exams/neet-biology) for chapter-wise practice."
    ]
  },
  "banking-exam-guide-2026": {
    title: "Banking Exam 2026: Complete Guide for IBPS, SBI, and RRB PO",
    tag: "Education", date: "February 2026", readTime: "11 min read",
    body: [
      "## Banking Exams in 2026 — What Changed",
      "Banking exams remain one of the most popular government job pathways in India. IBPS PO (Institute of Banking Personnel Selection Probationary Officer), SBI PO, and RRB PO (Regional Rural Bank) are the top three by competition and prestige. All follow a similar structure: Prelims → Mains → Interview.",
      "## Exam Structure",
      "**IBPS/SBI PO Prelims:** 100 questions, 1 hour. English Language (30), Quantitative Aptitude (35), Reasoning Ability (35). Sectional cutoffs — you must clear each section individually.\n\n**IBPS/SBI PO Mains:** 200 questions + essay/letter writing. English Language (35), Quantitative Aptitude (35), Reasoning and Computer Aptitude (45), General/Economy/Banking Awareness (40), Data Analysis and Interpretation (35). Duration: 3 hours.\n\n**Interview:** 25-30 minutes. Banking current affairs, your motivation for banking, leadership examples. Carried weight varies — typically 20-25% of final merit.",
      "## Subject Strategy",
      "**Quantitative Aptitude (highest effort required):**\nHigh-weightage topics: Data Interpretation (5-7 questions in sets), Simplification/Approximation, Quadratic Equations, Number Series, Percentage/Profit-Loss/SI-CI, Time-Speed-Distance, Time and Work. Practice 50 DI sets minimum. Speed comes only from practice — not from understanding shortcuts.\n\n**Reasoning Ability:**\nPuzzles and Seating Arrangement (10-15 questions in prelims) — the most important topic. Syllogisms, Blood Relations, Coding-Decoding, Direction Sense, Inequalities. Practice: 10 puzzles daily.\n\n**English Language:**\nReading Comprehension (10 questions — read economic and banking news daily), Cloze Test, Error Detection, Sentence Improvement. Read The Hindu or Economic Times editorial section for 20 minutes daily.",
      "## Banking Awareness — The Differentiator",
      "Most candidates skip this and regret it in Mains. High-scoring topics:\n- RBI functions, monetary policy tools (repo rate, reverse repo, CRR, SLR)\n- Types of banks (scheduled, nationalised, cooperative, payment banks, small finance banks)\n- Recent government schemes (PM Jan Dhan, Mudra, Stand-up India, PMAY)\n- Budget highlights (current year)\n- Important financial terms (NPA, SARFAESI, BASEL norms, MSF)\n\nRead: monthly banking awareness PDFs from Adda247 or Bankersadda.",
      "## Preparation Timeline",
      "**Months 1-3:** Basics of Quant and Reasoning. Daily: 30 questions Quant + 30 questions Reasoning.\n\n**Months 4-5:** Speed and accuracy. Full-length prelims tests. Target: 80+ out of 100 consistently.\n\n**Months 6-7:** Mains preparation. Banking Awareness intensive. English practice.\n\n**Month 8+:** Mock tests under exam conditions. GD/PI preparation for selection rounds.\n\nSee [Banking Exams Academy](/academies/exams/banking-exams) for topic-wise practice."
    ]
  },
  "upsc-prelims-strategy-2026": {
    title: "UPSC Prelims 2026: Strategy to Clear GS Paper 1 and CSAT",
    tag: "Education", date: "March 2026", readTime: "12 min read",
    body: [
      "## UPSC Prelims — What It Is and What It Tests",
      "UPSC Civil Services Preliminary Examination consists of two papers: GS Paper 1 (100 questions, 2 hours, 200 marks — general studies across history, geography, polity, economy, environment, science and technology, current affairs) and CSAT/Paper 2 (80 questions, 2 hours, 200 marks — qualifying only, minimum 33% required). CSAT tests: reading comprehension, reasoning, basic maths, and data interpretation.",
      "## The Hard Truth About UPSC Prelims",
      "Prelims has 0.33 marks negative marking per wrong answer. The cut-off is typically around 90-100 out of 200. At this level, guessing frequently costs more than it gains. You need both breadth (covering all topics) and depth (enough to eliminate wrong options) — not just surface-level awareness.",
      "## GS Paper 1 — Subject-wise Priority",
      "**Polity (15-20 marks) — highest return on investment:**\nNCERT Political Science Class 11 and 12, then M. Laxmikanth 'Indian Polity'. Constitution, fundamental rights, directive principles, DPSP, Parliament, President, Governor, judiciary — learn conceptually, not by rote. Polity questions often test conceptual clarity and the ability to apply constitutional provisions to situations.\n\n**History (15-20 marks):**\nAncient (NCERT Class 6-8 Old), Medieval (NCERT Class 7 Old), Modern (Spectrum by Rajiv Ahir — the standard book). Modern history from 1857 onwards is most important.\n\n**Geography (12-18 marks):**\nPhysical Geography (NCERT Class 11 Fundamentals of Physical Geography), Indian Geography (NCERT Class 12 India People and Economy), Atmosphere, Ocean Currents, Disaster Management. Map-based questions common.\n\n**Economy (12-18 marks):**\nNCERT Class 11 and 12 Economics, Indian Economy by Ramesh Singh or Nitin Singhania. Union Budget and Economic Survey highlights. RBI annual report basics. Focus on concepts not formulas.\n\n**Environment (10-15 marks):**\nHigh growth area — questions increasing each year. Shankar IAS Environment book is standard. Biodiversity conventions (CITES, Ramsar, CBD), climate change, national parks and biosphere reserves, pollution norms.\n\n**Current Affairs (20-25 marks indirectly):**\nAll subjects become current affairs in UPSC. Government schemes, appointments, reports (NITI Aayog, World Bank, IMF, WHO), international events, science and technology news. Read: The Hindu (preferred) or Indian Express daily.",
      "## CSAT Paper 2 — Clearing the Qualifying Bar",
      "Most candidates clear CSAT with 4-6 weeks of focused preparation. If English comprehension and reasoning come naturally, use that time for GS instead. If you struggle with maths, start CSAT practice early. Target: 70+ (well above the 66-mark qualifying threshold) so you never worry about Paper 2.\n\nCrucial tip: Time management in Paper 2 is difficult. Long comprehension passages + calculation questions in 2 hours. Always attempt comprehension questions first (highest accuracy, least calculation). Attempt reasoning next. Maths last.",
      "## The 10-Month Study Plan",
      "Months 1-3: NCERT foundation (Class 6-12 relevant books for History, Geography, Polity, Economy, Science).\nMonths 4-6: Standard references (Laxmikanth, Spectrum, Shankar Environment, Ramesh Singh Economy).\nMonths 7-8: Current affairs deep dive (last 12 months). Monthly magazines (Vision IAS, Insights on India).\nMonths 9-10: Previous year papers 2010-2024. Analyse every question. Full mock tests. Target 4-5 mocks per month.\n\nSee [UPSC Prelims Academy](/academies/exams/upsc-prelims) for subject-wise resources."
    ]
  },
  "icd10-coding-guide-2026": {
    title: "ICD-10-CM Coding 2026: Complete Beginner to Professional Guide",
    tag: "Healthcare", date: "January 2026", readTime: "12 min read",
    body: [
      "## What is ICD-10-CM?",
      "ICD-10-CM (International Classification of Diseases, 10th Revision, Clinical Modification) is the coding system used in the United States to classify diagnoses — what is wrong with the patient. Every disease, injury, symptom, sign, and social determinant of health has a specific alphanumeric code. These codes drive insurance billing, public health tracking, and research.",
      "## ICD-10-CM Code Structure",
      "Every ICD-10-CM code follows a specific format:\n```\nCode Structure:  X XX . XXXX\n                 |  |      |\n              Category  Etiology\n              (3 chars) /Anatomy\n                        /Severity\n                        (up to 4 more)\n\nExamples:\nJ18.9  = Pneumonia, unspecified organism\n  J   = Respiratory system diseases\n  J18 = Pneumonia\n  J18.9 = Unspecified pneumonia\n\nS52.501A = Unspecified fracture of lower end of right radius, initial encounter\n  S52    = Fracture of forearm\n  S52.5  = Fracture of lower end of radius\n  .501   = Unspecified, right side\n  A      = Initial encounter (7th character extensoion)\n```",
      "## The Most Important Coding Guidelines",
      "**Code to the highest level of specificity:** If a more specific code exists, use it. J18.9 (unspecified pneumonia) is only used when the type is genuinely unknown. If the provider documents bacterial pneumonia, code J15.9, not J18.9.\n\n**Principal diagnosis for inpatient:** The condition established after study to be chiefly responsible for the hospital admission. Not always the admitting diagnosis.\n\n**First-listed diagnosis for outpatient:** The primary condition for that visit. Chronic conditions like diabetes should only be coded when they affect the care given during that visit.\n\n**Signs and symptoms:** Code the definitive diagnosis if known — do not code the symptom separately. J18.9 includes the associated cough and fever — you do not code those separately when coding pneumonia.",
      "## High-Yield Chapter Review",
      "**Chapter 4 — Endocrine (E codes):** Diabetes mellitus is extremely common in coding. Know E11 (Type 2), E10 (Type 1), and how to code diabetic complications (E11.21 = Type 2 with diabetic nephropathy). The fifth and sixth characters specify the complication.\n\n**Chapter 10 — Respiratory (J codes):** COPD, asthma, pneumonia. Know the difference between acute (single episode) and chronic. J44.0 = COPD with acute lower respiratory infection.\n\n**Chapter 13 — Musculoskeletal (M codes):** Arthritis, back pain, fracture aftercare. Common in outpatient settings.\n\n**Chapter 19 — Injury and Poisoning (S and T codes):** Injury codes require 7th character extensions (A=initial encounter, D=subsequent encounter, S=sequela). Always required.",
      "## Certification Path: CPC Exam",
      "The CPC (Certified Professional Coder) from AAPC requires proficiency in ICD-10-CM, CPT, and HCPCS. For ICD-10-CM specifically: learn to use the tabular list and alphabetic index together — never code from the alphabetic index alone, always verify in the tabular list. Practice assigning codes to realistic clinical scenarios daily. See [ICD-10-CM Academy](/academies/healthcare/icd-10-cm) for chapter-by-chapter practice."
    ]
  },
  "medical-coding-interview-2026": {
    title: "Medical Coding Interview Questions 2026: Top 40 With Answers",
    tag: "Healthcare", date: "February 2026", readTime: "13 min read",
    body: [
      "## Why These Questions Are Asked",
      "Medical coding interviews test three things: coding knowledge, attention to detail, and problem-solving approach. Interviewers are looking for coders who can justify their code selection, not just assign codes from memory.",
      "## Fundamentals (Q1-Q10)",
      "**Q1: What is the difference between ICD-10-CM and CPT codes?**\nICD-10-CM codes identify the patient's diagnosis — what is wrong (disease, injury, symptom, reason for visit). CPT (Current Procedural Terminology) codes identify what was done — the procedure or service provided (office visit, surgery, lab test, imaging). Every claim needs both: what was wrong and what was done.\n\n**Q2: What is a primary diagnosis vs a secondary diagnosis?**\nFor inpatient (hospital): Primary diagnosis (also called principal diagnosis) is the condition established after study to be chiefly responsible for the admission. Secondary diagnoses are conditions that coexist at admission or develop subsequently that affect patient care. For outpatient: first-listed diagnosis is the primary reason for the visit.\n\n**Q3: What is unbundling and why is it problematic?**\nUnbundling is billing separately for services that should be included in one comprehensive code. Example: billing separate codes for each component of a comprehensive surgical package that has one inclusive CPT code. This is considered fraudulent billing and can result in audits, recoupments, and compliance violations.",
      "## ICD-10-CM Questions (Q11-Q20)",
      "**Q11: A patient is admitted with chest pain. After workup, they are diagnosed with GERD. What do you code?**\nCode the confirmed diagnosis GERD (K21.9) as the principal diagnosis. Do not code chest pain separately — it is the symptom that led to the diagnosis, and the guidelines say to code the definitive diagnosis when established.\n\n**Q12: A Type 2 diabetic patient is admitted for debridement of a diabetic foot ulcer. How do you code this?**\nPrincipal diagnosis: Diabetic foot ulcer with underlying condition — E11.621 (Type 2 diabetes mellitus with foot ulcer). Additional codes: the specific ulcer code (L97 range for non-pressure ulcer), and the debridement CPT code.\n\n**Q13: What is the 7th character extension in ICD-10-CM injury codes?**\nA = Initial encounter (active treatment phase). D = Subsequent encounter (routine care during healing). S = Sequela (complication or condition that arises as a direct result of the injury after healing is complete). These are mandatory for injury codes and many other categories. Missing or incorrect 7th characters are a common coding error.",
      "## CPT Questions (Q21-Q30)",
      "**Q21: What are the five levels of E/M office visit codes?**\nFor established patients: 99211 (minimal), 99212 (straightforward), 99213 (low), 99214 (moderate), 99215 (high). Level is based on Medical Decision Making (MDM) complexity or total time spent. Since 2021 AMA revisions, the three key components (history, exam, MDM) were replaced by MDM alone OR total time as the basis for level selection.\n\n**Q22: What is a modifier? Give two examples.**\nA modifier is a two-digit code appended to a CPT code to provide additional information without changing the code's definition. Modifier 25: Significant, separately identifiable E/M service on the same day as a procedure — used when a physician performs a procedure and a separately documented E/M service. Modifier 59: Distinct procedural service — indicates a service is distinct from another on the same day.\n\n**Q23: What is the global surgical package?**\nA CPT surgical code includes pre-operative care (1 day before for major surgery), intraoperative services, and post-operative care (90 days for major procedures, 10 days for minor procedures). Billing separately for these services included in the global package is unbundling unless a modifier justifies it.",
      "## Compliance and Audit (Q31-Q40)",
      "**Q31: What is a Charge Capture audit?**\nReviewing medical records to ensure all services provided were actually billed and coded correctly. Looks for both overcoding (billing for services not documented) and undercoding (failing to bill for services that were provided and documented).\n\n**Q32: What is the difference between upcoding and downcoding?**\nUpcoding: assigning a higher-level code than what the documentation supports to receive higher reimbursement — fraudulent. Downcoding: assigning a lower-level code than documented, often to avoid audit scrutiny — still incorrect coding and results in revenue loss.\n\n**Q33: What documentation do you look for to code an E/M visit?**\nChief complaint, history of present illness (HPI), review of systems (ROS), past/family/social history (PFSH), physical examination findings, assessment and plan, medical decision making complexity, and time if billing by time. Since 2021 revisions, MDM and time are the primary determinants of E/M level.\n\nSee [Healthcare Coding Academy](/academies/healthcare/icd-10-cm) for complete preparation guide."
    ]
  },
};

const tagColors: Record<string, string> = {
  Docker: "#3B82F6", Kubernetes: "#8B5CF6", Terraform: "#7C3AED",
  Career: "#10B981", AI: "#F59E0B", Cloud: "#06B6D4", DevOps: "#3B82F6",
  Databases: "#10B981", Security: "#EF4444", Health: "#22C55E",
  Education: "#A855F7", Ansible: "#EF4444", AWS: "#F97316",
};

export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) return { title: "Article Not Found" };
  return { title: `${article.title} | SynfraCore Blog`, description: article.title };
}

function formatInlineBlog(text: string): string {
  return text
    .replace(/`([^`]+)`/g, '<code style="background:var(--bg-2);padding:2px 6px;border-radius:4px;font-family:monospace;font-size:0.9em;color:#60A5FA">$1</code>')
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
    .replace(/\*([^*]+)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" style="color:#60A5FA;text-decoration:underline">$1</a>');
}

function renderLine(line: string, i: number) {
  if (line.startsWith("## ")) return <h2 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "22px", margin: "36px 0 12px" }}>{line.slice(3)}</h2>;
  if (line.startsWith("### ")) return <h3 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", margin: "28px 0 10px" }}>{line.slice(4)}</h3>;
  if (line.match(/^[-*] /)) return <div key={i} style={{ display:"flex", gap:"10px", margin:"4px 0" }}><span style={{ color:"#60A5FA", flexShrink:0, marginTop:"2px" }}>•</span><span style={{ color:"var(--text-3)", fontSize:"15px", lineHeight:1.7 }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(line.slice(2)) }}/></div>;
  if (line.match(/^\d+\. /)) { const num = line.match(/^(\d+)\. /)?.[1]; return <div key={i} style={{ display:"flex", gap:"10px", margin:"4px 0" }}><span style={{ color:"#60A5FA", flexShrink:0, fontWeight:700, minWidth:"20px" }}>{num}.</span><span style={{ color:"var(--text-3)", fontSize:"15px", lineHeight:1.7 }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(line.replace(/^\d+\. /,"")) }}/></div>; }
  if (line.startsWith("| ")) return null;
  if (line.startsWith("```")) return null;
  if (line === "" || line === "---") return <div key={i} style={{ height:"8px" }}/>;
  return <p key={i} style={{ margin:"0 0 12px", lineHeight:1.85, color:"var(--text-3)", fontSize:"15px" }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(line) }}/>;
}

function renderBody(body: string[]) {
  // Flatten all body items — each item may contain \n-embedded multi-line content
  const rawLines: string[] = [];
  for (const item of body) {
    const expanded = item.split("\n");
    rawLines.push(...expanded);
  }

  const elements: React.ReactNode[] = [];
  let i = 0;

  while (i < rawLines.length) {
    const line = rawLines[i];

    // Code block
    if (line.startsWith("```")) {
      const lang = line.slice(3).trim();
      const codeLines: string[] = [];
      i++;
      while (i < rawLines.length && !rawLines[i].startsWith("```")) {
        codeLines.push(rawLines[i]);
        i++;
      }
      elements.push(
        <div key={`code-${i}`} style={{ margin:"16px 0", borderRadius:"12px", overflow:"hidden", border:"1px solid var(--border)" }}>
          {lang && <div style={{ background:"var(--bg-2)", padding:"5px 16px", fontSize:"11px", color:"#60A5FA", fontFamily:"monospace", fontWeight:700, letterSpacing:"0.06em", textTransform:"uppercase" as const }}>{lang}</div>}
          <pre style={{ background:"var(--bg)", padding:"20px", margin:0, overflowX:"auto" as const }}>
            <code style={{ color:"var(--text-2)", fontSize:"13px", fontFamily:"'JetBrains Mono',monospace", lineHeight:1.75 }}>{codeLines.join("\n")}</code>
          </pre>
        </div>
      );
    }
    // Table
    else if (line.startsWith("| ")) {
      const rows: string[] = [];
      while (i < rawLines.length && rawLines[i].startsWith("| ")) {
        rows.push(rawLines[i]);
        i++;
      }
      const [header, , ...dataRows] = rows;
      const headers = header.split("|").filter(Boolean).map(h => h.trim());
      elements.push(
        <div key={`tbl-${i}`} style={{ overflowX:"auto" as const, margin:"16px 0" }}>
          <table style={{ width:"100%", borderCollapse:"collapse" as const, fontSize:"14px" }}>
            <thead>
              <tr style={{ borderBottom:"2px solid var(--border)", background:"var(--bg-2)" }}>
                {headers.map((h, hi) => <th key={hi} style={{ padding:"10px 16px", textAlign:"left" as const, fontWeight:700 }}>{h}</th>)}
              </tr>
            </thead>
            <tbody>
              {dataRows.filter(r => !r.includes("---")).map((row, ri) => (
                <tr key={ri} style={{ borderBottom:"1px solid var(--border)" }}>
                  {row.split("|").filter(Boolean).map((c, ci) => (
                    <td key={ci} style={{ padding:"10px 16px", color:"var(--text-3)" }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(c.trim()) }}/>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      );
      continue;
    }
    else {
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
      {/* Likes and Comments */}
      <BlogReactions slug={slug} title={article.title} />

      {/* Share buttons */}
      <div style={{ marginTop: "32px" }}>
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
