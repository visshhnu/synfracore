export type Technology = {
  slug: string;
  name: string;
  icon: string;
  description: string;
  level: "Beginner" | "Intermediate" | "Advanced";
  tags: string[];
};

export type Academy = {
  slug: string;
  title: string;
  subtitle: string;
  icon: string;
  color: string;
  gradient: string;
  description: string;
  technologies: Technology[];
};

export const academies: Academy[] = [
  {
    slug: "infrastructure",
    title: "Infrastructure Academy",
    subtitle: "DevOps & Platform Engineering",
    icon: "⚙️",
    color: "#3B82F6",
    gradient: "from-blue-600 to-cyan-500",
    description: "Master the foundation of modern infrastructure — Linux, containers, orchestration, CI/CD, and everything in between.",
    technologies: [
      { slug: "linux", name: "Linux", icon: "🐧", description: "Master the Linux operating system for DevOps and cloud environments", level: "Beginner", tags: ["OS", "Shell", "Admin"] },
      { slug: "networking", name: "Networking", icon: "🌐", description: "TCP/IP, DNS, VPNs, and network fundamentals for cloud engineers", level: "Beginner", tags: ["TCP/IP", "DNS", "VPN"] },
      { slug: "git", name: "Git & GitHub", icon: "🔀", description: "Version control, branching strategies, and collaborative workflows", level: "Beginner", tags: ["VCS", "CI/CD", "Collaboration"] },
      { slug: "shell-scripting", name: "Shell Scripting", icon: "💻", description: "Automate tasks with Bash and shell scripting", level: "Intermediate", tags: ["Bash", "Automation", "Scripting"] },
      { slug: "docker", name: "Docker", icon: "🐳", description: "Containerization, Docker Compose, and container best practices", level: "Intermediate", tags: ["Containers", "OCI", "Microservices"] },
      { slug: "jenkins", name: "Jenkins", icon: "🤖", description: "CI/CD pipelines, declarative pipelines, and plugin ecosystem", level: "Intermediate", tags: ["CI/CD", "Pipelines", "Automation"] },
      { slug: "terraform", name: "Terraform", icon: "🏗️", description: "Infrastructure as Code with HashiCorp Terraform", level: "Intermediate", tags: ["IaC", "HashiCorp", "Provisioning"] },
      { slug: "kubernetes", name: "Kubernetes", icon: "☸️", description: "Container orchestration, workloads, networking, and production operations", level: "Advanced", tags: ["Orchestration", "CNCF", "Containers"] },
      { slug: "helm", name: "Helm", icon: "⛵", description: "Kubernetes package manager and chart development", level: "Advanced", tags: ["K8s", "Charts", "Packaging"] },
      { slug: "argocd", name: "ArgoCD", icon: "🔄", description: "GitOps continuous delivery for Kubernetes", level: "Advanced", tags: ["GitOps", "CD", "Kubernetes"] },
      { slug: "ansible", name: "Ansible", icon: "🎭", description: "Configuration management and automation at scale", level: "Intermediate", tags: ["Config Management", "Automation", "IaC"] },
      { slug: "python", name: "Python", icon: "🐍", description: "Python for DevOps automation, scripting, and tooling", level: "Beginner", tags: ["Scripting", "Automation", "APIs"] },
      { slug: "nginx", name: "Nginx", icon: "⚡", description: "Web server, reverse proxy, and load balancer configuration", level: "Intermediate", tags: ["Web Server", "Proxy", "Load Balancer"] },
      { slug: "prometheus", name: "Prometheus", icon: "🔥", description: "Metrics collection, PromQL, alerting rules, and recording rules", level: "Intermediate", tags: ["Monitoring", "Metrics", "CNCF"] },
      { slug: "grafana", name: "Grafana", icon: "📊", description: "Dashboards, visualization, and observability platform", level: "Intermediate", tags: ["Dashboards", "Observability", "Visualization"] },
      { slug: "elk-stack", name: "ELK Stack", icon: "🔍", description: "Elasticsearch, Logstash, Kibana for log management", level: "Advanced", tags: ["Logging", "Search", "Analytics"] },
      { slug: "postgresql", name: "PostgreSQL", icon: "🐘", description: "Advanced open-source relational database — indexing, performance, replication", level: "Intermediate", tags: ["Database", "SQL", "Relational"] },
      { slug: "mysql", name: "MySQL", icon: "🐬", description: "World's most popular open-source relational database", level: "Beginner", tags: ["Database", "SQL", "Relational"] },
      { slug: "mongodb", name: "MongoDB", icon: "🍃", description: "Document database — schema design, aggregation, indexing, Atlas", level: "Intermediate", tags: ["NoSQL", "Document", "Database"] },
      { slug: "redis", name: "Redis", icon: "⚡", description: "In-memory data store — caching, pub/sub, session management", level: "Intermediate", tags: ["Cache", "In-memory", "Database"] },
      { slug: "cassandra", name: "Cassandra", icon: "👁️", description: "Wide-column distributed database for massive scale", level: "Advanced", tags: ["NoSQL", "Distributed", "Database"] },
    ],
  },
  {
    slug: "cloud",
    title: "Cloud Academy",
    subtitle: "AWS, Azure & GCP",
    icon: "☁️",
    color: "#F59E0B",
    gradient: "from-orange-500 to-amber-400",
    description: "Deep-dive into the world's leading cloud platforms. Build, deploy, and manage cloud-native workloads.",
    technologies: [
      { slug: "aws-iam", name: "IAM", icon: "🔐", description: "AWS Identity and Access Management — users, roles, policies", level: "Beginner", tags: ["Security", "Identity", "AWS"] },
      { slug: "aws-ec2", name: "EC2", icon: "🖥️", description: "Virtual machines, auto-scaling groups, launch templates", level: "Beginner", tags: ["Compute", "VMs", "AWS"] },
      { slug: "aws-vpc", name: "VPC", icon: "🕸️", description: "Virtual Private Cloud, subnets, routing, security groups", level: "Intermediate", tags: ["Networking", "Security", "AWS"] },
      { slug: "aws-s3", name: "S3", icon: "🗄️", description: "Object storage, bucket policies, versioning, lifecycle", level: "Beginner", tags: ["Storage", "Object Store", "AWS"] },
      { slug: "aws-rds", name: "RDS", icon: "🗃️", description: "Managed relational databases — MySQL, PostgreSQL, Aurora", level: "Intermediate", tags: ["Database", "Managed", "AWS"] },
      { slug: "aws-lambda", name: "Lambda", icon: "λ", description: "Serverless functions, event-driven architecture", level: "Intermediate", tags: ["Serverless", "FaaS", "AWS"] },
      { slug: "aws-eks", name: "EKS", icon: "☸️", description: "Managed Kubernetes on AWS — clusters, node groups, Fargate", level: "Advanced", tags: ["K8s", "Managed", "AWS"] },
      { slug: "cloudformation", name: "CloudFormation", icon: "📋", description: "AWS native IaC — stacks, templates, change sets", level: "Advanced", tags: ["IaC", "Templates", "AWS"] },
      { slug: "route53", name: "Route53", icon: "🌍", description: "DNS service, routing policies, health checks", level: "Intermediate", tags: ["DNS", "Routing", "AWS"] },
      { slug: "azure-entra", name: "Entra ID", icon: "🛡️", description: "Azure Active Directory, SSO, RBAC, conditional access", level: "Intermediate", tags: ["Identity", "SSO", "Azure"] },
      { slug: "azure-vms", name: "Virtual Machines", icon: "💻", description: "Azure VMs, scale sets, availability zones", level: "Beginner", tags: ["Compute", "VMs", "Azure"] },
      { slug: "azure-vnets", name: "VNets", icon: "🕸️", description: "Azure Virtual Networks, peering, NSGs, private endpoints", level: "Intermediate", tags: ["Networking", "Security", "Azure"] },
      { slug: "azure-aks", name: "AKS", icon: "☸️", description: "Azure Kubernetes Service — fully managed K8s", level: "Advanced", tags: ["K8s", "Managed", "Azure"] },
      { slug: "azure-devops", name: "Azure DevOps", icon: "🔄", description: "Pipelines, boards, repos, artifacts, test plans", level: "Intermediate", tags: ["CI/CD", "DevOps", "Azure"] },
      { slug: "gke", name: "GKE", icon: "☸️", description: "Google Kubernetes Engine, Autopilot, workload identity", level: "Advanced", tags: ["K8s", "Google", "GCP"] },
      { slug: "cloud-security", name: "Cloud Security", icon: "🔒", description: "Security posture management, compliance, guardrails", level: "Advanced", tags: ["Security", "Compliance", "Multi-Cloud"] },
      { slug: "landing-zones", name: "Landing Zones", icon: "🏢", description: "Enterprise cloud foundations, governance, account vending", level: "Advanced", tags: ["Enterprise", "Governance", "Architecture"] },
      { slug: "cost-optimization", name: "Cost Optimization", icon: "💰", description: "FinOps practices, rightsizing, reservations, savings plans", level: "Intermediate", tags: ["FinOps", "Cost", "Optimization"] },
    ],
  },
  {
    slug: "ai",
    title: "AI Academy",
    subtitle: "AI, LLMs & MLOps",
    icon: "🤖",
    color: "#8B5CF6",
    gradient: "from-violet-600 to-purple-500",
    description: "From AI fundamentals to production LLM systems. Master the complete AI engineering stack.",
    technologies: [
      { slug: "ai-fundamentals", name: "AI Fundamentals", icon: "🧠", description: "ML concepts, neural networks, model types, evaluation", level: "Beginner", tags: ["ML", "Deep Learning", "Concepts"] },
      { slug: "ai-for-devops", name: "AI for DevOps", icon: "⚙️", description: "Using AI tools to accelerate DevOps workflows", level: "Intermediate", tags: ["AIOps", "Automation", "DevOps"] },
      { slug: "prompt-engineering", name: "Prompt Engineering", icon: "✍️", description: "Techniques for effective LLM prompting and chain-of-thought", level: "Beginner", tags: ["LLMs", "Prompting", "NLP"] },
      { slug: "langchain", name: "LangChain", icon: "⛓️", description: "Building LLM applications with chains, agents, and tools", level: "Intermediate", tags: ["LLMs", "Agents", "Framework"] },
      { slug: "langgraph", name: "LangGraph", icon: "🕸️", description: "Stateful multi-agent workflows with graph-based orchestration", level: "Advanced", tags: ["Agents", "Graphs", "Multi-Agent"] },
      { slug: "rag", name: "RAG", icon: "📚", description: "Retrieval-Augmented Generation — architecture and implementation", level: "Intermediate", tags: ["RAG", "Embeddings", "Search"] },
      { slug: "vector-databases", name: "Vector Databases", icon: "🗂️", description: "Pinecone, Weaviate, Chroma — semantic search and embeddings", level: "Intermediate", tags: ["Embeddings", "Search", "Storage"] },
      { slug: "ai-agents", name: "AI Agents", icon: "🤖", description: "Autonomous agents, tool use, planning and reasoning", level: "Advanced", tags: ["Agents", "Autonomy", "Planning"] },
      { slug: "mcp", name: "MCP", icon: "🔌", description: "Model Context Protocol — AI tool integration standard", level: "Advanced", tags: ["Protocol", "Tools", "Integration"] },
      { slug: "llmops", name: "LLMOps", icon: "🔬", description: "Productionizing LLMs — monitoring, fine-tuning, evaluation", level: "Advanced", tags: ["MLOps", "Production", "Monitoring"] },
      { slug: "openai", name: "OpenAI", icon: "🌟", description: "GPT-4, function calling, assistants API, embeddings", level: "Intermediate", tags: ["GPT", "APIs", "OpenAI"] },
      { slug: "agentic-ai", name: "Agentic AI", icon: "🧩", description: "Building production-grade agentic systems end-to-end", level: "Advanced", tags: ["Agents", "Systems", "Production"] },
    ],
  },
  {
    slug: "data",
    title: "Data Analytics Academy",
    subtitle: "Analytics, BI & Data Engineering",
    icon: "📊",
    color: "#10B981",
    gradient: "from-emerald-500 to-teal-400",
    description: "Transform raw data into actionable insights. From SQL to Power BI, Python analytics to data engineering.",
    technologies: [
      { slug: "excel", name: "Excel", icon: "📋", description: "Excel fundamentals — formulas, pivot tables, charts", level: "Beginner", tags: ["Spreadsheets", "Analysis", "Business"] },
      { slug: "advanced-excel", name: "Advanced Excel", icon: "📈", description: "Power Query, VBA, dynamic arrays, advanced formulas", level: "Intermediate", tags: ["Power Query", "VBA", "Automation"] },
      { slug: "sql", name: "SQL", icon: "🗄️", description: "Query writing, optimization, joins, window functions", level: "Beginner", tags: ["Database", "Querying", "Analytics"] },
      { slug: "power-bi", name: "Power BI", icon: "📊", description: "DAX, data modeling, reports, and Power BI Service", level: "Intermediate", tags: ["BI", "Dashboards", "Microsoft"] },
      { slug: "tableau", name: "Tableau", icon: "🎨", description: "Visual analytics, calculated fields, server deployment", level: "Intermediate", tags: ["BI", "Visualization", "Dashboards"] },
      { slug: "python-analytics", name: "Python Analytics", icon: "🐍", description: "Data analysis workflow with Python ecosystem", level: "Intermediate", tags: ["Python", "Analytics", "Scripting"] },
      { slug: "pandas", name: "Pandas", icon: "🐼", description: "Data manipulation, cleaning, merging, reshaping", level: "Intermediate", tags: ["DataFrame", "ETL", "Python"] },
      { slug: "numpy", name: "NumPy", icon: "🔢", description: "Numerical computing, arrays, linear algebra", level: "Intermediate", tags: ["Numerical", "Arrays", "Python"] },
      { slug: "data-engineering", name: "Data Engineering", icon: "🔧", description: "Pipelines, Airflow, dbt, data lakes, Spark", level: "Advanced", tags: ["Pipelines", "ETL", "Spark"] },
      { slug: "dashboarding", name: "Dashboarding", icon: "🖥️", description: "Building executive dashboards and KPI trackers", level: "Intermediate", tags: ["BI", "KPIs", "Design"] },
    ],
  },
  {
    slug: "healthcare",
    title: "Healthcare Academy",
    subtitle: "Medical Coding & Compliance",
    icon: "🏥",
    color: "#EF4444",
    gradient: "from-red-500 to-rose-400",
    description: "Comprehensive medical coding education — ICD-10-CM, CPT, HCPCS, and real case studies for certification.",
    technologies: [
      { slug: "icd-10-cm", name: "ICD-10-CM", icon: "📋", description: "International classification of diseases — diagnosis coding", level: "Beginner", tags: ["Diagnosis", "Coding", "ICD"] },
      { slug: "cpt", name: "CPT", icon: "🔬", description: "Current Procedural Terminology — procedure and service coding", level: "Intermediate", tags: ["Procedures", "Billing", "CPT"] },
      { slug: "hcpcs", name: "HCPCS", icon: "💊", description: "Healthcare Common Procedure Coding System level II codes", level: "Intermediate", tags: ["DMEPOS", "Drugs", "HCPCS"] },
      { slug: "coding-guidelines", name: "Coding Guidelines", icon: "📖", description: "Official AHA/AMA/CMS guidelines, conventions, and instructions", level: "Beginner", tags: ["Guidelines", "Compliance", "Rules"] },
      { slug: "mock-exams", name: "Mock Exams", icon: "📝", description: "CPC, CCS, RHIA practice exams and timed testing", level: "Intermediate", tags: ["Exams", "Practice", "CPC"] },
      { slug: "real-case-studies", name: "Real Case Studies", icon: "🏥", description: "Actual patient records — E&M, surgery, radiology coding", level: "Advanced", tags: ["Cases", "Practice", "Real World"] },
    ],
  },
  {
    slug: "security",
    title: "Cybersecurity Academy",
    subtitle: "Ethical Hacking & SOC",
    icon: "🛡️",
    color: "#6366F1",
    gradient: "from-indigo-600 to-blue-500",
    description: "From security fundamentals to offensive and defensive operations — SOC, pen testing, and SIEM mastery.",
    technologies: [
      { slug: "security-fundamentals", name: "Security Fundamentals", icon: "🔐", description: "CIA triad, threat modeling, risk management, compliance", level: "Beginner", tags: ["Fundamentals", "Risk", "Compliance"] },
      { slug: "ethical-hacking", name: "Ethical Hacking", icon: "🎯", description: "Reconnaissance, exploitation, post-exploitation methodology", level: "Advanced", tags: ["Offensive", "CEH", "Penetration"] },
      { slug: "network-security", name: "Network Security", icon: "🌐", description: "Firewalls, IDS/IPS, network monitoring, packet analysis", level: "Intermediate", tags: ["Network", "Firewall", "IDS"] },
      { slug: "soc", name: "SOC Operations", icon: "🖥️", description: "Security Operations Center — monitoring, triage, incident response", level: "Intermediate", tags: ["SOC", "Monitoring", "IR"] },
      { slug: "pen-testing", name: "Pen Testing", icon: "🔍", description: "Penetration testing methodology, tools, and reporting", level: "Advanced", tags: ["OSCP", "Offensive", "Tools"] },
      { slug: "siem", name: "SIEM", icon: "📊", description: "Splunk, Sentinel, QRadar — log aggregation and correlation", level: "Intermediate", tags: ["SIEM", "Splunk", "Detection"] },
      { slug: "security-operations", name: "Security Operations", icon: "🛡️", description: "Threat hunting, malware analysis, blue team operations", level: "Advanced", tags: ["Blue Team", "Threat Hunting", "IR"] },
    ],
  },
];

export function getAcademy(slug: string): Academy | undefined {
  return academies.find((a) => a.slug === slug);
}

export function getTechnology(academySlug: string, techSlug: string): Technology | undefined {
  const academy = getAcademy(academySlug);
  return academy?.technologies.find((t) => t.slug === techSlug);
}
