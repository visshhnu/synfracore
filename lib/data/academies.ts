export const runtime = "edge";

export type Technology = {
  slug: string;
  name: string;
  icon: string;
  description: string;
  level: "Beginner" | "Intermediate" | "Advanced";
  tags: string[];
};

export type Domain = {
  slug: string;
  name: string;
  icon: string;
  description: string;
  color: string;
  technologies: Technology[];
};

export type Academy = {
  slug: string;
  title: string;
  subtitle: string;
  icon: string;
  color: string;
  description: string;
  domains: Domain[];
  technologies?: Technology[]; // flat list for backwards compat
};

// ─────────────────────────────────────────────────────────
// ACADEMY 1: DevOps & Platform Engineering
// ─────────────────────────────────────────────────────────
const devopsAcademy: Academy = {
  slug: "devops",
  title: "DevOps & Platform Engineering",
  subtitle: "Infrastructure · CI/CD · Containers · IaC",
  icon: "⚙️",
  color: "#3B82F6",
  description: "Master modern infrastructure from Linux fundamentals to Kubernetes at scale. CI/CD pipelines, IaC, GitOps, monitoring — everything a platform engineer needs.",
  domains: [
    {
      slug: "os-linux",
      name: "OS & Linux",
      icon: "🐧",
      description: "Operating system fundamentals for DevOps engineers",
      color: "#F59E0B",
      technologies: [
        { slug: "linux", name: "Linux", icon: "🐧", description: "Master Linux — the foundation of every server, container, and cloud instance", level: "Beginner", tags: ["OS", "Shell", "Admin"] },
        { slug: "networking", name: "Networking", icon: "🌐", description: "TCP/IP, DNS, VPNs, firewalls, and cloud networking fundamentals", level: "Beginner", tags: ["TCP/IP", "DNS", "Security"] },
        { slug: "shell-scripting", name: "Shell Scripting", icon: "💻", description: "Automate everything with Bash — the universal automation language of DevOps", level: "Intermediate", tags: ["Bash", "Automation"] },
      ],
    },
    {
      slug: "containers",
      name: "Containers & Orchestration",
      icon: "🐳",
      description: "Docker, Kubernetes, and the container ecosystem",
      color: "#06B6D4",
      technologies: [
        { slug: "docker", name: "Docker", icon: "🐳", description: "Containerisation, Docker Compose, multi-stage builds, and best practices", level: "Intermediate", tags: ["Containers", "OCI", "Images"] },
        { slug: "kubernetes", name: "Kubernetes", icon: "☸️", description: "Container orchestration — Pods, Deployments, Services, networking, and production ops", level: "Advanced", tags: ["Orchestration", "CNCF", "K8s"] },
        { slug: "helm", name: "Helm", icon: "⛵", description: "Kubernetes package manager — chart development, templates, and values management", level: "Advanced", tags: ["K8s", "Charts", "Packaging"] },
      ],
    },
    {
      slug: "cicd",
      name: "CI/CD & GitOps",
      icon: "🔄",
      description: "Automated pipelines and GitOps delivery",
      color: "#8B5CF6",
      technologies: [
        { slug: "git", name: "Git & GitHub", icon: "🔀", description: "Version control, branching strategies, PRs, and collaborative workflows", level: "Beginner", tags: ["VCS", "Branching", "Collaboration"] },
        { slug: "jenkins", name: "Jenkins", icon: "🤖", description: "CI/CD pipelines, declarative Jenkinsfiles, shared libraries, and Kubernetes agents", level: "Intermediate", tags: ["CI/CD", "Pipelines", "Automation"] },
        { slug: "argocd", name: "ArgoCD", icon: "🔄", description: "GitOps continuous delivery — App of Apps, sync waves, multi-cluster management", level: "Advanced", tags: ["GitOps", "CD", "Kubernetes"] },
      ],
    },
    {
      slug: "iac",
      name: "Infrastructure as Code",
      icon: "🏗️",
      description: "Provision and manage infrastructure with code",
      color: "#7C3AED",
      technologies: [
        { slug: "terraform", name: "Terraform", icon: "🏗️", description: "HashiCorp Terraform — modules, state, workspaces, and production patterns", level: "Intermediate", tags: ["IaC", "HashiCorp", "Provisioning"] },
        { slug: "ansible", name: "Ansible", icon: "🎭", description: "Agentless configuration management — playbooks, roles, vault, and rolling updates", level: "Intermediate", tags: ["Config Mgmt", "Automation", "Agentless"] },
      ],
    },
    {
      slug: "monitoring",
      name: "Monitoring & Observability",
      icon: "📊",
      description: "Metrics, logs, traces, and alerting",
      color: "#EC4899",
      technologies: [
        { slug: "prometheus", name: "Prometheus", icon: "🔥", description: "Metrics collection, PromQL, alerting rules, and recording rules", level: "Intermediate", tags: ["Metrics", "CNCF", "PromQL"] },
        { slug: "grafana", name: "Grafana", icon: "📊", description: "Dashboards, visualization, alerts, and unified observability", level: "Intermediate", tags: ["Dashboards", "Visualization", "Alerts"] },
        { slug: "elk-stack", name: "ELK Stack", icon: "🔍", description: "Elasticsearch, Logstash, Kibana — centralized log management and analytics", level: "Advanced", tags: ["Logging", "Search", "Kibana"] },
      ],
    },
    {
      slug: "automation",
      name: "Scripting & Automation",
      icon: "🐍",
      description: "Python and scripting for DevOps automation",
      color: "#10B981",
      technologies: [
        { slug: "python", name: "Python", icon: "🐍", description: "Python for DevOps — boto3, subprocess, click CLIs, Kubernetes client, automation", level: "Beginner", tags: ["Scripting", "boto3", "Automation"] },
        { slug: "nginx", name: "Nginx", icon: "⚡", description: "Web server, reverse proxy, load balancer — config, SSL termination, performance", level: "Intermediate", tags: ["Web Server", "Proxy", "Load Balancer"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 2: Cloud Platforms
// ─────────────────────────────────────────────────────────
const cloudAcademy: Academy = {
  slug: "cloud",
  title: "Cloud Platforms",
  subtitle: "AWS · Azure · GCP",
  icon: "☁️",
  color: "#F59E0B",
  description: "Deep-dive into AWS, Azure, and GCP. Learn every major service, architecture patterns, cost optimisation, security, and multi-cloud strategy.",
  domains: [
    {
      slug: "aws",
      name: "Amazon Web Services (AWS)",
      icon: "🟠",
      description: "The world's leading cloud platform — 200+ services",
      color: "#F59E0B",
      technologies: [
        { slug: "aws-iam", name: "IAM", icon: "🔐", description: "Identity and Access Management — users, roles, policies, OIDC, SCP", level: "Beginner", tags: ["Security", "Identity", "RBAC"] },
        { slug: "aws-ec2", name: "EC2", icon: "🖥️", description: "Virtual machines, auto-scaling, launch templates, spot instances", level: "Beginner", tags: ["Compute", "VMs", "Auto-Scaling"] },
        { slug: "aws-vpc", name: "VPC", icon: "🕸️", description: "Virtual Private Cloud — subnets, routing, NAT, security groups, endpoints", level: "Intermediate", tags: ["Networking", "Security", "Subnets"] },
        { slug: "aws-s3", name: "S3", icon: "🗄️", description: "Object storage — policies, versioning, lifecycle, events, CloudFront", level: "Beginner", tags: ["Storage", "Object Store", "CDN"] },
        { slug: "aws-rds", name: "RDS & Aurora", icon: "🗃️", description: "Managed relational databases — MySQL, PostgreSQL, Aurora Serverless", level: "Intermediate", tags: ["Database", "MySQL", "PostgreSQL"] },
        { slug: "aws-lambda", name: "Lambda", icon: "λ", description: "Serverless functions — triggers, SAM, cold starts, layers, power tuning", level: "Intermediate", tags: ["Serverless", "FaaS", "Event-driven"] },
        { slug: "aws-eks", name: "EKS", icon: "☸️", description: "Managed Kubernetes — node groups, Fargate, IRSA, ALB controller", level: "Advanced", tags: ["Kubernetes", "Managed", "IRSA"] },
        { slug: "cloudformation", name: "CloudFormation", icon: "📋", description: "AWS native IaC — stacks, templates, change sets, nested stacks", level: "Advanced", tags: ["IaC", "Templates", "CDK"] },
        { slug: "route53", name: "Route53", icon: "🌍", description: "DNS — routing policies, health checks, failover, latency routing", level: "Intermediate", tags: ["DNS", "Routing", "HA"] },
      ],
    },
    {
      slug: "azure",
      name: "Microsoft Azure",
      icon: "🔵",
      description: "Microsoft's enterprise cloud platform",
      color: "#3B82F6",
      technologies: [
        { slug: "azure-entra", name: "Entra ID", icon: "🛡️", description: "Azure AD — SSO, MFA, RBAC, conditional access, managed identity", level: "Intermediate", tags: ["Identity", "SSO", "RBAC"] },
        { slug: "azure-vms", name: "Virtual Machines", icon: "💻", description: "Azure VMs, scale sets, availability zones, spot VMs, Bastion", level: "Beginner", tags: ["Compute", "VMs", "Scale Sets"] },
        { slug: "azure-vnets", name: "VNets", icon: "🕸️", description: "Virtual Networks, peering, NSGs, private endpoints, ExpressRoute", level: "Intermediate", tags: ["Networking", "NSG", "Peering"] },
        { slug: "azure-aks", name: "AKS", icon: "☸️", description: "Azure Kubernetes Service — node pools, workload identity, upgrades", level: "Advanced", tags: ["Kubernetes", "Managed", "Workload Identity"] },
        { slug: "azure-devops", name: "Azure DevOps", icon: "🔄", description: "Pipelines, Boards, Repos, Artifacts, Test Plans — full CI/CD", level: "Intermediate", tags: ["CI/CD", "Pipelines", "Boards"] },
      ],
    },
    {
      slug: "gcp",
      name: "Google Cloud Platform (GCP)",
      icon: "🟢",
      description: "Google's cloud — best for data, ML, and Kubernetes",
      color: "#10B981",
      technologies: [
        { slug: "gke", name: "GKE", icon: "☸️", description: "Google Kubernetes Engine — Autopilot, node pools, workload identity", level: "Advanced", tags: ["Kubernetes", "Google", "Autopilot"] },
        { slug: "bigquery", name: "BigQuery", icon: "📊", description: "Serverless data warehouse — SQL at petabyte scale, ML integration", level: "Intermediate", tags: ["Data Warehouse", "Analytics", "SQL"] },
        { slug: "cloud-run", name: "Cloud Run", icon: "🚀", description: "Fully managed serverless containers — scale to zero, auto-scale", level: "Intermediate", tags: ["Serverless", "Containers", "FaaS"] },
      ],
    },
    {
      slug: "cloud-strategy",
      name: "Cloud Strategy & Architecture",
      icon: "🏛️",
      description: "Multi-cloud, FinOps, security, and enterprise architecture",
      color: "#6366F1",
      technologies: [
        { slug: "cloud-security", name: "Cloud Security", icon: "🔒", description: "CSPM, IAM best practices, encryption, compliance, guardrails", level: "Advanced", tags: ["Security", "CSPM", "Compliance"] },
        { slug: "cost-optimization", name: "Cost Optimization", icon: "💰", description: "FinOps — rightsizing, reservations, savings plans, spot, tagging", level: "Intermediate", tags: ["FinOps", "Cost", "Reserved"] },
        { slug: "landing-zones", name: "Landing Zones", icon: "🏢", description: "Enterprise foundations — multi-account, governance, account vending", level: "Advanced", tags: ["Enterprise", "Governance", "Multi-Account"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 3: Databases
// ─────────────────────────────────────────────────────────
const databasesAcademy: Academy = {
  slug: "databases",
  title: "Databases",
  subtitle: "Relational · NoSQL · Cache · Search",
  icon: "🗄️",
  color: "#8B5CF6",
  description: "Every database a modern engineer needs — from ACID-compliant relational databases to globally distributed NoSQL, in-memory caches, and search engines.",
  domains: [
    {
      slug: "relational",
      name: "Relational Databases",
      icon: "📋",
      description: "ACID-compliant structured data storage",
      color: "#3B82F6",
      technologies: [
        { slug: "postgresql", name: "PostgreSQL", icon: "🐘", description: "Advanced open-source RDBMS — MVCC, JSON, extensions, replication", level: "Intermediate", tags: ["SQL", "ACID", "MVCC"] },
        { slug: "mysql", name: "MySQL", icon: "🐬", description: "World's most popular open-source relational database — InnoDB, replication", level: "Beginner", tags: ["SQL", "InnoDB", "Replication"] },
        { slug: "sql", name: "SQL Mastery", icon: "📊", description: "SQL from basics to advanced — window functions, CTEs, query optimisation", level: "Beginner", tags: ["SQL", "Queries", "Analytics"] },
      ],
    },
    {
      slug: "nosql",
      name: "NoSQL Databases",
      icon: "🍃",
      description: "Flexible, scalable non-relational databases",
      color: "#10B981",
      technologies: [
        { slug: "mongodb", name: "MongoDB", icon: "🍃", description: "Document database — schema design, aggregation pipeline, Atlas, indexing", level: "Intermediate", tags: ["Document", "NoSQL", "Atlas"] },
        { slug: "cassandra", name: "Cassandra", icon: "👁️", description: "Wide-column distributed database — CQL, consistency levels, partitioning", level: "Advanced", tags: ["Wide-column", "Distributed", "CQL"] },
        { slug: "dynamodb", name: "DynamoDB", icon: "⚡", description: "AWS managed NoSQL — partition keys, GSI, streams, DAX caching", level: "Intermediate", tags: ["AWS", "Serverless", "NoSQL"] },
      ],
    },
    {
      slug: "cache",
      name: "In-Memory & Cache",
      icon: "⚡",
      description: "High-performance in-memory data stores",
      color: "#F59E0B",
      technologies: [
        { slug: "redis", name: "Redis", icon: "⚡", description: "In-memory store — caching, pub/sub, rate limiting, distributed locks, Cluster", level: "Intermediate", tags: ["Cache", "Pub/Sub", "In-memory"] },
      ],
    },
    {
      slug: "search",
      name: "Search & Analytics",
      icon: "🔍",
      description: "Full-text search and analytical databases",
      color: "#EC4899",
      technologies: [
        { slug: "elasticsearch", name: "Elasticsearch", icon: "🔍", description: "Distributed search — mappings, queries, aggregations, ELK integration", level: "Advanced", tags: ["Search", "Full-text", "ELK"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 4: AI & ML Engineering
// ─────────────────────────────────────────────────────────
const aiAcademy: Academy = {
  slug: "ai",
  title: "AI & ML Engineering",
  subtitle: "LLMs · RAG · Agents · MLOps",
  icon: "🤖",
  color: "#EC4899",
  description: "From AI fundamentals to production LLM systems. Master the complete AI engineering stack — LangChain, RAG, Agents, LLMOps, and beyond.",
  domains: [
    {
      slug: "foundations",
      name: "AI Foundations",
      icon: "🧠",
      description: "Core concepts every AI engineer must know",
      color: "#8B5CF6",
      technologies: [
        { slug: "ai-fundamentals", name: "AI Fundamentals", icon: "🧠", description: "ML concepts, neural networks, model types — from zero to AI-ready", level: "Beginner", tags: ["ML", "Neural Networks", "Concepts"] },
        { slug: "prompt-engineering", name: "Prompt Engineering", icon: "✍️", description: "Zero-shot, few-shot, CoT, ReAct, system prompts — master LLM communication", level: "Beginner", tags: ["Prompts", "LLMs", "Techniques"] },
      ],
    },
    {
      slug: "llm-apps",
      name: "LLM Application Development",
      icon: "⚡",
      description: "Build production LLM-powered applications",
      color: "#EC4899",
      technologies: [
        { slug: "langchain", name: "LangChain", icon: "🔗", description: "LLM framework — chains, LCEL, memory, tools, structured output", level: "Intermediate", tags: ["LLMs", "Framework", "LCEL"] },
        { slug: "rag", name: "RAG Systems", icon: "📚", description: "Retrieval Augmented Generation — chunking, embeddings, vector DBs, evaluation", level: "Intermediate", tags: ["RAG", "Embeddings", "Vector DB"] },
        { slug: "ai-agents", name: "AI Agents", icon: "🤖", description: "Autonomous agents — ReAct, tool use, multi-agent, memory systems, production", level: "Advanced", tags: ["Agents", "ReAct", "Tool Use"] },
      ],
    },
    {
      slug: "mlops",
      name: "MLOps & Production AI",
      icon: "🚀",
      description: "Deploy, monitor, and maintain AI systems",
      color: "#F59E0B",
      technologies: [
        { slug: "llmops", name: "LLMOps", icon: "⚙️", description: "Production LLM ops — prompt versioning, caching, evaluation, guardrails, cost", level: "Advanced", tags: ["LLMOps", "Production", "Monitoring"] },
        { slug: "openai", name: "OpenAI API", icon: "🌟", description: "GPT-4, DALL-E, Whisper, embeddings — building with OpenAI's platform", level: "Intermediate", tags: ["OpenAI", "GPT-4", "API"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 5: Data Analytics & BI
// ─────────────────────────────────────────────────────────
const dataAcademy: Academy = {
  slug: "data",
  title: "Data Analytics & BI",
  subtitle: "SQL · Python · BI · Engineering",
  icon: "📊",
  color: "#10B981",
  description: "Transform raw data into actionable insights. From Excel basics to advanced analytics, Power BI dashboards, and Python data engineering.",
  domains: [
    {
      slug: "analysis",
      name: "Data Analysis",
      icon: "📈",
      description: "Analyse and interpret data effectively",
      color: "#10B981",
      technologies: [
        { slug: "excel", name: "Excel & Advanced Excel", icon: "📗", description: "Excel from basics to advanced — VLOOKUP, pivot tables, Power Query, VBA", level: "Beginner", tags: ["Excel", "Pivot", "Power Query"] },
        { slug: "pandas", name: "Pandas & Python Analytics", icon: "🐼", description: "Data manipulation, cleaning, analysis, and visualisation with Python", level: "Intermediate", tags: ["Pandas", "Python", "EDA"] },
      ],
    },
    {
      slug: "bi",
      name: "Business Intelligence",
      icon: "📊",
      description: "BI tools, dashboards, and reporting",
      color: "#F59E0B",
      technologies: [
        { slug: "power-bi", name: "Power BI", icon: "📊", description: "Microsoft BI — DAX, data modelling, star schema, RLS, publish", level: "Intermediate", tags: ["Power BI", "DAX", "Dashboards"] },
        { slug: "tableau", name: "Tableau", icon: "🎨", description: "Tableau Desktop and Server — calculated fields, LOD expressions, dashboards", level: "Intermediate", tags: ["Tableau", "Viz", "Dashboards"] },
      ],
    },
    {
      slug: "engineering",
      name: "Data Engineering",
      icon: "🏗️",
      description: "Pipelines, warehouses, and big data",
      color: "#8B5CF6",
      technologies: [
        { slug: "sql", name: "SQL Mastery", icon: "💾", description: "SQL from SELECT to window functions, CTEs, performance tuning", level: "Beginner", tags: ["SQL", "Analytics", "Joins"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 6: Cybersecurity
// ─────────────────────────────────────────────────────────
const securityAcademy: Academy = {
  slug: "security",
  title: "Cybersecurity",
  subtitle: "SOC · Ethical Hacking · DevSecOps",
  icon: "🛡️",
  color: "#EF4444",
  description: "From security fundamentals to offensive and defensive operations. SOC analysis, penetration testing, SIEM mastery, and DevSecOps practices.",
  domains: [
    {
      slug: "fundamentals",
      name: "Security Fundamentals",
      icon: "🔐",
      description: "Core security concepts every engineer must know",
      color: "#EF4444",
      technologies: [
        { slug: "security-fundamentals", name: "Security Fundamentals", icon: "🔐", description: "CIA triad, threat modelling, STRIDE, defence in depth, cryptography", level: "Beginner", tags: ["CIA", "Threats", "Crypto"] },
        { slug: "network-security", name: "Network Security", icon: "🌐", description: "Firewalls, IDS/IPS, VPN, TLS, network segmentation, zero trust", level: "Intermediate", tags: ["Firewalls", "IDS", "TLS"] },
      ],
    },
    {
      slug: "offensive",
      name: "Offensive Security",
      icon: "⚔️",
      description: "Ethical hacking and penetration testing",
      color: "#F59E0B",
      technologies: [
        { slug: "ethical-hacking", name: "Ethical Hacking", icon: "🎯", description: "Recon, scanning, exploitation, privilege escalation, reporting — OSCP prep", level: "Advanced", tags: ["Pen Test", "OSCP", "Exploitation"] },
      ],
    },
    {
      slug: "defensive",
      name: "Defensive Security & SOC",
      icon: "🛡️",
      description: "SOC operations, SIEM, and incident response",
      color: "#8B5CF6",
      technologies: [
        { slug: "soc", name: "SOC Operations", icon: "👁️", description: "SOC tiers, MITRE ATT&CK, alert triage, incident response playbooks", level: "Intermediate", tags: ["SOC", "MITRE", "Incident Response"] },
        { slug: "siem", name: "SIEM", icon: "📡", description: "Splunk, Microsoft Sentinel — KQL, SIEM rules, threat hunting", level: "Intermediate", tags: ["SIEM", "Splunk", "Sentinel"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 7: Healthcare Coding
// ─────────────────────────────────────────────────────────
const healthcareAcademy: Academy = {
  slug: "healthcare",
  title: "Health & Hospitality",
  subtitle: "Medical Coding · Home Health · Hospitality",
  icon: "🏥",
  color: "#F43F5E",
  description: "Complete health and hospitality education — from professional medical coding and billing to home health care, patient management, and hospitality industry skills.",
  domains: [
    {
      slug: "medical-coding",
      name: "Medical Coding & Billing",
      icon: "🩺",
      description: "Professional medical coding — ICD-10, CPT, HCPCS, billing, compliance",
      color: "#F43F5E",
      technologies: [
        { slug: "icd-10-cm", name: "ICD-10-CM", icon: "📋", description: "International Classification of Diseases — structure, guidelines, sequencing, POA, HCC", level: "Beginner", tags: ["ICD-10", "Diagnosis", "CMS"] },
        { slug: "cpt", name: "CPT Codes", icon: "🔬", description: "Current Procedural Terminology — E/M, surgery, global package, modifiers, NCCI", level: "Intermediate", tags: ["CPT", "E/M", "Surgery"] },
        { slug: "hcpcs", name: "HCPCS Level II", icon: "💊", description: "HCPCS — DME, drugs, ambulance, ABN, coverage determinations, modifiers", level: "Intermediate", tags: ["HCPCS", "DME", "Medicare"] },
        { slug: "coding-guidelines", name: "Coding Guidelines", icon: "📖", description: "OGCR, inpatient vs outpatient, UHDDS, uncertain diagnoses, sequencing rules", level: "Intermediate", tags: ["Guidelines", "OGCR", "HCC"] },
        { slug: "mock-exams", name: "Mock Exams & CPC Prep", icon: "📝", description: "CPC, CCS, CCA exam practice — case studies, timed tests, detailed explanations", level: "Advanced", tags: ["CPC", "CCS", "Certification"] },
      ],
    },
    {
      slug: "home-health",
      name: "Home Health & Patient Care",
      icon: "🏠",
      description: "Home health coding, OASIS, patient care documentation",
      color: "#8B5CF6",
      technologies: [
        { slug: "home-health-coding", name: "Home Health Coding", icon: "🏠", description: "OASIS assessments, home health PPS, HIPPS codes, PDGM payment model", level: "Intermediate", tags: ["Home Health", "OASIS", "PDGM"] },
        { slug: "patient-documentation", name: "Patient Documentation", icon: "📄", description: "Clinical documentation improvement, CDI, query process, physician queries", level: "Intermediate", tags: ["CDI", "Documentation", "Queries"] },
      ],
    },
    {
      slug: "hospitality",
      name: "Hospitality & Healthcare Management",
      icon: "🤝",
      description: "Healthcare administration and hospitality management",
      color: "#10B981",
      technologies: [
        { slug: "healthcare-admin", name: "Healthcare Administration", icon: "🏢", description: "Revenue cycle management, denial management, AR follow-up, compliance basics", level: "Beginner", tags: ["Revenue Cycle", "RCM", "Compliance"] },
      ],
    },
  ],
  technologies: [],
};


// ─────────────────────────────────────────────────────────
// ACADEMY 8: Human Essentials
// ─────────────────────────────────────────────────────────
const essentialsAcademy: Academy = {
  slug: "essentials",
  title: "Human Essentials",
  subtitle: "Health · Wellness · Life Skills",
  icon: "🌱",
  color: "#10B981",
  description: "Essential knowledge every human needs — gut health, hygiene, nutrition, mental wellness, home health care, and life skills that schools never taught.",
  domains: [
    {
      slug: "health-wellness",
      name: "Health & Wellness",
      icon: "💚",
      description: "Gut health, nutrition, hygiene, and preventive care",
      color: "#10B981",
      technologies: [
        { slug: "gut-health", name: "Gut Health", icon: "🦠", description: "Microbiome, digestion, probiotics, gut-brain connection, and foods for a healthy gut", level: "Beginner", tags: ["Gut", "Microbiome", "Nutrition"] },
        { slug: "hygiene", name: "Hygiene & Sanitation", icon: "🧼", description: "Personal hygiene, sanitation practices, infection prevention, and daily health routines", level: "Beginner", tags: ["Hygiene", "Prevention", "Daily Health"] },
        { slug: "nutrition", name: "Nutrition Basics", icon: "🥗", description: "Macronutrients, micronutrients, meal planning, reading labels, and balanced diet fundamentals", level: "Beginner", tags: ["Nutrition", "Diet", "Wellness"] },
        { slug: "mental-health", name: "Mental Wellness", icon: "🧠", description: "Stress management, mindfulness, sleep health, and building emotional resilience", level: "Beginner", tags: ["Mental Health", "Mindfulness", "Sleep"] },
      ],
    },
    {
      slug: "life-skills",
      name: "Life Skills",
      icon: "🎯",
      description: "Practical skills for everyday life",
      color: "#3B82F6",
      technologies: [
        { slug: "personal-finance", name: "Personal Finance", icon: "💰", description: "Budgeting, saving, investing basics, credit scores, and financial planning for everyone", level: "Beginner", tags: ["Finance", "Budgeting", "Savings"] },
        { slug: "first-aid", name: "First Aid & Emergency", icon: "🚑", description: "CPR, first aid basics, emergency response, and home health management", level: "Beginner", tags: ["First Aid", "CPR", "Emergency"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// EXPORTED DATA
// ─────────────────────────────────────────────────────────
export const academies: Academy[] = [
  devopsAcademy,
  cloudAcademy,
  databasesAcademy,
  aiAcademy,
  dataAcademy,
  securityAcademy,
  healthcareAcademy,
  essentialsAcademy,
];

export function getAcademy(slug: string): Academy | undefined {
  return academies.find((a) => a.slug === slug);
}

export function getAllTechnologies(): Array<Technology & { academy: string; domain: string }> {
  return academies.flatMap((a) =>
    a.domains.flatMap((d) =>
      d.technologies.map((t) => ({ ...t, academy: a.slug, domain: d.slug }))
    )
  );
}

export function getTechnology(academySlug: string, techSlug: string) {
  const academy = getAcademy(academySlug);
  if (!academy) return undefined;
  for (const domain of academy.domains) {
    const tech = domain.technologies.find(t => t.slug === techSlug);
    if (tech) return { ...tech, academy, domain };
  }
  return undefined;
}
