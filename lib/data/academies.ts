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
    {
      slug: "openshift",
      name: "OpenShift & Enterprise K8s",
      icon: "🔴",
      description: "Red Hat OpenShift — enterprise Kubernetes with SCCs, Routes, Operators, and built-in monitoring",
      color: "#EE0000",
      technologies: [
        { slug: "openshift", name: "OpenShift (OCP)", icon: "🔴", description: "Enterprise Kubernetes — SCCs, Routes, Operators, OLM, KubeVirt, Tekton, live migration, and GitOps at scale", level: "Advanced", tags: ["OCP", "Enterprise K8s", "Red Hat", "Telecom"] },
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
        { slug: "oracle", name: "Oracle Database", icon: "🔴", description: "Oracle DB — PL/SQL, performance tuning, RAC, Data Guard, enterprise features", level: "Advanced", tags: ["Oracle", "PL/SQL", "Enterprise"] },
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
        { slug: "home-health-coding", name: "Home Health Coding", icon: "🏠", description: "OASIS assessments, PDGM payment model, HIPPS codes, primary diagnosis selection for home health", level: "Intermediate", tags: ["Home Health", "OASIS", "PDGM"] },
        { slug: "patient-documentation", name: "Patient Documentation", icon: "📄", description: "Clinical documentation improvement, CDI, physician query process, SOAP notes, medical record compliance", level: "Intermediate", tags: ["CDI", "Documentation", "Queries"] },
        { slug: "bchhc-prep", name: "BCHHC Certification Prep", icon: "🏆", description: "Board Certified Home Health Coder exam prep — OASIS, PDGM, ICD-10-CM coding scenarios, timed mock exams", level: "Advanced", tags: ["BCHHC", "Certification", "Home Health", "OASIS", "PDGM"] },
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
// ACADEMY 9: School & College (Phase 2 - Placeholder)
// ─────────────────────────────────────────────────────────
const educationAcademy: Academy = {
  slug: "education",
  title: "School & College",
  subtitle: "Class 6-12 · Engineering · Placement",
  icon: "🎓",
  color: "#3B82F6",
  description: "School and competitive exam preparation has moved to the Academy section. Visit /learn for structured chapter-wise content with PYQs and MCQs.",
  domains: [
    {
      slug: "school",
      name: "School (Class 6–12)",
      icon: "🏫",
      description: "CBSE, ICSE and State Board curriculum",
      color: "#10B981",
      technologies: [
        { slug: "maths", name: "Mathematics", icon: "📐", description: "Algebra, geometry, calculus, statistics — from basics to board exam level", level: "Beginner", tags: ["CBSE", "ICSE", "Maths"] },
        { slug: "science", name: "Science", icon: "🔬", description: "Physics, Chemistry, Biology — concepts, experiments, and numerical problems", level: "Beginner", tags: ["Physics", "Chemistry", "Biology"] },
        { slug: "cs-school", name: "Computer Science", icon: "💻", description: "Python basics, data structures intro, web fundamentals for school students", level: "Beginner", tags: ["Python", "CS", "Coding"] },
      ],
    },
    {
      slug: "college",
      name: "College & Engineering",
      icon: "🏛️",
      description: "Core CS subjects and engineering fundamentals",
      color: "#3B82F6",
      technologies: [
        { slug: "dsa", name: "Data Structures & Algorithms", icon: "🌲", description: "Arrays, linked lists, trees, graphs, sorting, dynamic programming — placement ready", level: "Intermediate", tags: ["DSA", "Placement", "LeetCode"] },
        { slug: "os", name: "Operating Systems", icon: "⚙️", description: "Processes, memory management, file systems, synchronization — GATE and placement prep", level: "Intermediate", tags: ["OS", "GATE", "Processes"] },
        { slug: "dbms", name: "DBMS", icon: "🗄️", description: "Relational algebra, SQL, normalization, transactions, GATE questions", level: "Intermediate", tags: ["DBMS", "SQL", "GATE"] },
        { slug: "cn", name: "Computer Networks", icon: "🌐", description: "OSI model, TCP/IP, routing, protocols, network security — GATE and interview prep", level: "Intermediate", tags: ["Networks", "GATE", "Protocols"] },
        { slug: "system-design", name: "System Design", icon: "🏗️", description: "LLD and HLD for tech interviews — design patterns, scalability, real systems", level: "Advanced", tags: ["System Design", "Interviews", "LLD/HLD"] },
        { slug: "placement-prep", name: "Placement Preparation", icon: "💼", description: "Aptitude, reasoning, coding rounds, HR interviews — campus placement complete prep", level: "Beginner", tags: ["Placement", "Aptitude", "HR"] },
        { slug: "java", name: "Java Programming", icon: "☕", description: "Java from scratch to advanced — OOP, collections, multithreading, Spring Boot, DSA in Java", level: "Intermediate", tags: ["Java", "OOP", "Spring"] },
        { slug: "c-programming", name: "C Programming", icon: "🔧", description: "C language fundamentals — pointers, memory management, data structures, system programming", level: "Beginner", tags: ["C", "Pointers", "Systems"] },
        { slug: "cpp", name: "C++ Programming", icon: "⚡", description: "Modern C++ — STL, OOP, templates, memory management, competitive programming", level: "Intermediate", tags: ["C++", "STL", "OOP"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// ACADEMY 10: Competitive Exams
// ─────────────────────────────────────────────────────────
const examsAcademy: Academy = {
  slug: "exams",
  title: "Competitive Exams",
  subtitle: "GATE · JEE · NEET · Banking · UPSC",
  icon: "📝",
  color: "#8B5CF6",
  description: "JEE, NEET, GATE, Banking and competitive exam preparation has moved to the Academy section. Visit /learn for structured chapter-wise content.",
  domains: [
    {
      slug: "engineering-exams",
      name: "Engineering Entrance",
      icon: "⚗️",
      description: "JEE Main & Advanced, BITSAT, and state engineering exams",
      color: "#F59E0B",
      technologies: [
        { slug: "neet-biology", name: "NEET Biology", icon: "🧬", description: "Botany and Zoology — cell biology, genetics, ecology, human physiology for NEET", level: "Advanced", tags: ["NEET", "Biology", "Medical"] },
        { slug: "neet-physics", name: "NEET Physics", icon: "⚡", description: "Physics for NEET — mechanics, thermodynamics, optics, modern physics with NCERT focus", level: "Advanced", tags: ["NEET", "Physics", "Medical"] },
        { slug: "neet-chemistry", name: "NEET Chemistry", icon: "🧪", description: "NEET Chemistry — organic, inorganic, physical with NCERT-based questions", level: "Advanced", tags: ["NEET", "Chemistry", "Medical"] },
        { slug: "jee-maths", name: "JEE Mathematics", icon: "📐", description: "Calculus, algebra, coordinate geometry, probability — JEE Main and Advanced", level: "Advanced", tags: ["JEE", "Maths", "IIT"] },
        { slug: "jee-physics", name: "JEE Physics", icon: "⚡", description: "Mechanics, electrostatics, optics, modern physics — JEE complete coverage", level: "Advanced", tags: ["JEE", "Physics", "IIT"] },
        { slug: "jee-chemistry", name: "JEE Chemistry", icon: "🧪", description: "Organic, inorganic, physical chemistry for JEE Main and Advanced", level: "Advanced", tags: ["JEE", "Chemistry", "IIT"] },
      ],
    },
    {
      slug: "gate",
      name: "GATE",
      icon: "🎯",
      description: "Graduate Aptitude Test in Engineering",
      color: "#8B5CF6",
      technologies: [
        { slug: "gate-cse", name: "GATE CSE", icon: "💻", description: "DSA, OS, DBMS, CN, Algorithms, Compiler Design, Theory of Computation", level: "Advanced", tags: ["GATE", "CSE", "M.Tech"] },
        { slug: "gate-ece", name: "GATE ECE", icon: "📡", description: "Signals, Networks, Electronics, Communications, Electromagnetics", level: "Advanced", tags: ["GATE", "ECE", "M.Tech"] },
      ],
    },
    {
      slug: "banking-ssc",
      name: "Banking & SSC",
      icon: "🏦",
      description: "SBI PO, IBPS, SSC CGL, RRB, and insurance exams",
      color: "#10B981",
      technologies: [
        { slug: "banking-exams", name: "Banking Exams (SBI/IBPS)", icon: "🏦", description: "Quantitative aptitude, reasoning, English, banking awareness for SBI PO, IBPS PO/Clerk", level: "Beginner", tags: ["Banking", "SBI", "IBPS"] },
        { slug: "ssc-cgl", name: "SSC CGL", icon: "📋", description: "Tier I & II — Quant, English, GK, Reasoning for SSC CGL and CHSL", level: "Beginner", tags: ["SSC", "CGL", "Government"] },
        { slug: "rrb-ntpc", name: "RRB NTPC", icon: "🚂", description: "Mathematics, GI & Reasoning, General Awareness for Railway exams", level: "Beginner", tags: ["Railway", "RRB", "Government"] },
      ],
    },
    {
      slug: "civil-services",
      name: "UPSC & Civil Services",
      icon: "🏛️",
      description: "IAS, IPS, IFS and State PSC exams",
      color: "#F43F5E",
      technologies: [
        { slug: "upsc-prelims", name: "UPSC Prelims", icon: "🏛️", description: "GS Paper I & II (CSAT) — History, Geography, Polity, Economy, Science, Current Affairs", level: "Advanced", tags: ["UPSC", "IAS", "CSE"] },
        { slug: "upsc-mains", name: "UPSC Mains", icon: "✍️", description: "Essay, GS Papers I-IV, Optional subject strategy and answer writing", level: "Advanced", tags: ["UPSC", "IAS", "Mains"] },
      ],
    },
  ],
  technologies: [],
};

// ─────────────────────────────────────────────────────────
// EXPORTED DATA
// ─────────────────────────────────────────────────────────

// ── NEW PHASE 3 ACADEMIES ──────────────────────────────
const lawAcademy: Academy = {
  slug: "law", title: "Law & Legal Studies", subtitle: "CLAT · Judiciary · Legal Reasoning · Constitution",
  icon: "⚖️", color: "#6366F1",
  description: "Legal fundamentals, Indian Constitution, IPC, contract law, CLAT preparation, and judiciary exam prep.",
  domains: [{ slug: "legal-studies", name: "Legal Studies", icon: "📜", description: "Core law subjects", color: "#6366F1",
    technologies: [
      { slug: "legal-fundamentals", name: "Legal Fundamentals", icon: "📜", description: "Indian legal system, sources of law, court hierarchy, key acts", level: "Beginner", tags: ["Law", "IPC", "Constitution"] },
      { slug: "constitutional-law", name: "Constitutional Law", icon: "🏛️", description: "Preamble, Fundamental Rights, DPSP, Amendment, federalism", level: "Intermediate", tags: ["Constitution", "FRs", "UPSC"] },
      { slug: "clat-prep", name: "CLAT Preparation", icon: "🎯", description: "Legal reasoning, logical reasoning, English, GK for CLAT/AILET", level: "Intermediate", tags: ["CLAT", "AILET", "NLU"] },
      { slug: "consumer-protection", name: "Consumer Protection", icon: "🛡️", description: "Consumer Protection Act 2019, COPRA, consumer forums, e-commerce", level: "Beginner", tags: ["Consumer Law", "COPRA"] },
    ]
  }],
  technologies: [],
};

const agricultureAcademy: Academy = {
  slug: "agriculture", title: "Agriculture & Organic Farming", subtitle: "Farming · Soil Science · Organic · Agri-Business",
  icon: "🌾", color: "#22C55E",
  description: "Organic farming principles, soil science, horticulture, agri-business, and ICAR/IBPS AFO/NABARD exam preparation.",
  domains: [{ slug: "farming", name: "Farming & Agriculture", icon: "🌱", description: "Core agriculture subjects", color: "#22C55E",
    technologies: [
      { slug: "organic-farming", name: "Organic Farming", icon: "🌿", description: "Organic principles, certification (PGS, India Organic), natural inputs, soil biology", level: "Beginner", tags: ["Organic", "Sustainable", "Certification"] },
      { slug: "soil-science", name: "Soil Science", icon: "🌍", description: "Soil types, texture, structure, pH, nutrients, conservation, land management", level: "Intermediate", tags: ["Soil", "Fertility", "Conservation"] },
      { slug: "horticulture", name: "Horticulture", icon: "🍎", description: "Fruit crops, vegetable crops, floriculture, post-harvest management", level: "Intermediate", tags: ["Horticulture", "Crops", "Post-Harvest"] },
      { slug: "agri-business", name: "Agri-Business", icon: "📊", description: "Farm economics, APMC, agri-marketing, FPOs, NABARD schemes, food processing", level: "Advanced", tags: ["Agri-Business", "NABARD", "FPO"] },
    ]
  }],
  technologies: [],
};

const financeAcademy: Academy = {
  slug: "finance", title: "Finance & Commerce", subtitle: "CA/CS/CMA · GST · Taxation · Accounting · Investments",
  icon: "💹", color: "#F59E0B",
  description: "Financial accounting, GST, direct taxation, financial markets, and CA/CS/CMA foundation preparation.",
  domains: [{ slug: "finance-core", name: "Finance & Accounting", icon: "💰", description: "Core finance subjects", color: "#F59E0B",
    technologies: [
      { slug: "accounting-basics", name: "Financial Accounting", icon: "📒", description: "Journal entries, ledger, trial balance, final accounts, ratio analysis", level: "Beginner", tags: ["Accounting", "CA Foundation", "B.Com"] },
      { slug: "gst-taxation", name: "GST & Indirect Tax", icon: "🧾", description: "GST framework, GSTR filing, ITC, composition scheme, place of supply", level: "Intermediate", tags: ["GST", "Tax", "GSTR"] },
      { slug: "direct-tax", name: "Direct Tax & Income Tax", icon: "💳", description: "Income tax heads, deductions, TDS, ITR filing, advance tax", level: "Intermediate", tags: ["Income Tax", "TDS", "ITR"] },
      { slug: "financial-markets", name: "Financial Markets", icon: "📈", description: "Equity, debt, mutual funds, SEBI regulations, derivatives basics", level: "Advanced", tags: ["SEBI", "Stocks", "Mutual Funds"] },
      { slug: "ca-cs-foundation", name: "CA/CS/CMA Foundation", icon: "🏅", description: "ICAI/ICSI/ICMAI foundation syllabus — accounts, law, maths, economics", level: "Beginner", tags: ["CA", "CS", "CMA"] },
    ]
  }],
  technologies: [],
};

const telecomAcademy: Academy = {
  slug: "telecom", title: "Telecom & 5G", subtitle: "5G · Networking · Fiber Optics · Wireless · JTO/JE",
  icon: "📡", color: "#0EA5E9",
  description: "Telecom fundamentals, 5G architecture, fiber optics, wireless technologies, and BSNL JTO/JE exam preparation.",
  domains: [{ slug: "telecom-tech", name: "Telecom Technology", icon: "📶", description: "Core telecom technologies", color: "#0EA5E9",
    technologies: [
      { slug: "telecom-fundamentals", name: "Telecom Fundamentals", icon: "📡", description: "Telecom history, GSM/CDMA, spectrum, switching, signaling protocols", level: "Beginner", tags: ["Telecom", "GSM", "Spectrum"] },
      { slug: "wireless-tech", name: "4G/5G & Wireless", icon: "📶", description: "4G LTE architecture, 5G NR, OFDM, beamforming, NR bands, use cases", level: "Intermediate", tags: ["5G", "LTE", "NR"] },
      { slug: "fiber-optics", name: "Fiber Optics", icon: "💡", description: "Fiber types, DWDM, splicing, FTTH/FTTX, optical network design", level: "Intermediate", tags: ["Fiber", "FTTH", "DWDM"] },
      { slug: "networking-protocols", name: "Telecom Networking", icon: "🌐", description: "TCP/IP for telecom, SIP, VoIP, MPLS, SD-WAN, IMS architecture", level: "Advanced", tags: ["SIP", "VoIP", "MPLS"] },
    ]
  }],
  technologies: [],
};

const statePscAcademy: Academy = {
  slug: "state-psc", title: "State PSC Exams", subtitle: "TNPSC · KPSC · MPSC · APPSC · TSPSC",
  icon: "🏛️", color: "#8B5CF6",
  description: "Comprehensive preparation for all major state public service commission exams — Group I, II, III, and IV posts.",
  domains: [{ slug: "state-civil-services", name: "State Civil Services", icon: "🏛️", description: "State PSC exam preparation", color: "#8B5CF6",
    technologies: [
      { slug: "tnpsc", name: "TNPSC Prep", icon: "🏛️", description: "Tamil Nadu PSC — Samacheer Kalvi, Tamil language, state-specific GK, Group I-IV", level: "Beginner", tags: ["TNPSC", "Tamil Nadu", "State PSC"] },
      { slug: "kpsc", name: "KPSC Prep", icon: "🏛️", description: "Karnataka PSC — Kannada language, state history/geography/economy, FDA/SDA/KAS", level: "Beginner", tags: ["KPSC", "Karnataka", "KAS"] },
      { slug: "mpsc", name: "MPSC Prep", icon: "🏛️", description: "Maharashtra PSC — Marathi language, state-specific content, Group A/B posts", level: "Beginner", tags: ["MPSC", "Maharashtra", "MCS"] },
      { slug: "appsc", name: "APPSC Prep", icon: "🏛️", description: "Andhra Pradesh PSC — Telugu medium, AP history/economy, Group I/II/III/IV", level: "Beginner", tags: ["APPSC", "Andhra Pradesh"] },
      { slug: "tspsc", name: "TSPSC Prep", icon: "🏛️", description: "Telangana PSC — Telugu medium, Telangana movement, TS economy, Group I/II/III/IV", level: "Beginner", tags: ["TSPSC", "Telangana"] },
    ]
  }],
  technologies: [],
};

const centralExamsAcademy: Academy = {
  slug: "central-exams", title: "Central Govt Exams", subtitle: "CTET · TET · PSU Technical · NDA · CDS",
  icon: "📋", color: "#EC4899",
  description: "CTET, TET teaching exams, PSU technical recruitment (BHEL, NTPC, ONGC), NDA, and other central government examinations.",
  domains: [{ slug: "central-recruitment", name: "Central Recruitment", icon: "📋", description: "Central government examination preparation", color: "#EC4899",
    technologies: [
      { slug: "ctet-paper1", name: "CTET Paper I", icon: "👶", description: "Primary level (Class I-V) — Child Development, Pedagogy, Language I & II, Maths, EVS", level: "Beginner", tags: ["CTET", "TET", "Teaching"] },
      { slug: "ctet-paper2", name: "CTET Paper II", icon: "📚", description: "Elementary level (Class VI-VIII) — CDP, Languages, Science/Social Studies/Maths", level: "Intermediate", tags: ["CTET", "Elementary", "Teaching"] },
      { slug: "psu-technical", name: "PSU Technical Exams", icon: "🏭", description: "BHEL, NTPC, ONGC, BEL, GAIL — technical + aptitude + HR rounds", level: "Intermediate", tags: ["PSU", "BHEL", "NTPC", "ONGC"] },
      { slug: "nda-prep", name: "NDA Preparation", icon: "🎖️", description: "NDA Maths + GAT — detailed topic-wise preparation with PYQs", level: "Intermediate", tags: ["NDA", "Defence", "UPSC"] },
    ]
  }],
  technologies: [],
};

const professionalCertsAcademy: Academy = {
  slug: "professional-certs", title: "Professional Certifications", subtitle: "PMP · ITIL · Scrum · Six Sigma · HR",
  icon: "🏅", color: "#14B8A6",
  description: "Non-tech professional certifications — PMP, ITIL 4, Scrum Master, Six Sigma, SHRM HR, PRINCE2 project management.",
  domains: [{ slug: "professional-development", name: "Professional Development", icon: "🏅", description: "Industry certifications", color: "#14B8A6",
    technologies: [
      { slug: "pmp", name: "PMP Certification", icon: "📊", description: "Project Management Professional — PMBOK 7, predictive/agile/hybrid, 180-question exam", level: "Advanced", tags: ["PMP", "PMI", "Project Management"] },
      { slug: "itil", name: "ITIL 4 Foundation", icon: "⚙️", description: "IT service management — ITIL 4 SVS, four dimensions, practices, 40-MCQ exam", level: "Beginner", tags: ["ITIL", "ITSM", "Service Management"] },
      { slug: "scrum", name: "Scrum & Agile", icon: "🔄", description: "CSM, PSM I, SAFe — Scrum framework, sprints, roles, ceremonies, Agile manifesto", level: "Beginner", tags: ["Scrum", "Agile", "CSM", "PSM"] },
      { slug: "six-sigma", name: "Six Sigma", icon: "📉", description: "DMAIC methodology, Green Belt, Black Belt — quality management and process improvement", level: "Intermediate", tags: ["Six Sigma", "DMAIC", "Quality"] },
    ]
  }],
  technologies: [],
};

const economicsAcademy: Academy = {
  slug: "economics", title: "Economics", subtitle: "Micro · Macro · Indian Economy · RBI Policy · Budget",
  icon: "📊", color: "#F97316",
  description: "Microeconomics, macroeconomics, Indian economy, RBI monetary policy, budget analysis, and international trade for UPSC, banking exams, and MBA.",
  domains: [{ slug: "economics-core", name: "Economics", icon: "📊", description: "Core economics subjects", color: "#F97316",
    technologies: [
      { slug: "micro-economics", name: "Microeconomics", icon: "🔍", description: "Demand/supply, elasticity, market structures, consumer theory, production", level: "Beginner", tags: ["Microeconomics", "Demand", "Supply"] },
      { slug: "macro-economics", name: "Macroeconomics", icon: "🌐", description: "National income, GDP, inflation, unemployment, fiscal policy, monetary policy", level: "Intermediate", tags: ["Macroeconomics", "GDP", "Inflation"] },
      { slug: "indian-economy", name: "Indian Economy", icon: "📈", description: "Planning, economic reforms 1991, sectors, poverty, inequality, budget, schemes", level: "Intermediate", tags: ["Indian Economy", "Reforms", "Budget"] },
      { slug: "international-trade", name: "International Trade", icon: "🌍", description: "BoP, forex, WTO, trade policy, globalisation, FDI/FII in India", level: "Advanced", tags: ["Trade", "WTO", "BoP", "Forex"] },
    ]
  }],
  technologies: [],
};

export const academies: Academy[] = [
  devopsAcademy,
  cloudAcademy,
  databasesAcademy,
  aiAcademy,
  dataAcademy,
  securityAcademy,
  healthcareAcademy,
  essentialsAcademy,
  educationAcademy,
  examsAcademy,
  // Phase 3 new academies
  lawAcademy,
  agricultureAcademy,
  financeAcademy,
  telecomAcademy,
  statePscAcademy,
  centralExamsAcademy,
  professionalCertsAcademy,
  economicsAcademy,
];

// Kept only for any external backward-compat imports — education/exams are in main academies array
export const legacyAcademies: Academy[] = [];

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
