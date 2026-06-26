export const navigation = [
  { name: "Academies", href: "/academies" },
  { name: "Roadmaps", href: "/roadmaps" },
  { name: "Labs", href: "/labs" },
  { name: "Projects", href: "/projects" },
  { name: "Certifications", href: "/certifications" },
  { name: "Interview", href: "/interview" },
  { name: "Troubleshooting", href: "/troubleshooting" },
  { name: "AI Assistant", href: "/ai-assistant" },
  { name: "Career", href: "/career" },
];

export const techSections = [
  { slug: "overview", label: "Overview", icon: "📖", description: "What it is, why it matters, architecture and key concepts" },
  { slug: "fundamentals", label: "Fundamentals", icon: "🔤", description: "Core concepts and commands — hands-on from the start" },
  { slug: "intermediate", label: "Intermediate", icon: "⚡", description: "Real-world patterns, best practices, and deeper topics" },
  { slug: "advanced", label: "Advanced", icon: "🚀", description: "Production patterns, performance, security hardening" },
  { slug: "roadmap", label: "Roadmap", icon: "🗺️", description: "Step-by-step structured learning path from zero to expert" },
  { slug: "labs", label: "Labs", icon: "🧪", description: "Hands-on exercises with real environments and scenarios" },
  { slug: "projects", label: "Projects", icon: "🏗️", description: "Portfolio-ready projects to demonstrate your skills" },
  { slug: "interview", label: "Interview Q&A", icon: "💬", description: "Most asked interview questions with detailed answers" },
  { slug: "troubleshooting", label: "Troubleshooting", icon: "🔧", description: "Debug common issues with root cause analysis" },
  { slug: "certification", label: "Certification", icon: "🏆", description: "Exam guides, practice questions, and prep strategies" },
  { slug: "cheatsheets", label: "Cheatsheets", icon: "📋", description: "Quick reference — commands, syntax, and patterns" },
  { slug: "notes", label: "Notes", icon: "📝", description: "Key takeaways, tips, and important points to remember" },
  { slug: "real-world-scenarios", label: "Real World", icon: "🌍", description: "Production stories, incidents, and how experts solve them" },
  { slug: "faq", label: "FAQ", icon: "❓", description: "Frequently asked questions and clear answers" },
];

export const certifications = [
  { id: "aws-ccp", name: "AWS Cloud Practitioner", code: "CLF-C02", provider: "AWS", color: "#FF9900", level: "Foundational" },
  { id: "aws-saa", name: "AWS Solutions Architect Associate", code: "SAA-C03", provider: "AWS", color: "#FF9900", level: "Associate" },
  { id: "aws-sap", name: "AWS Solutions Architect Professional", code: "SAP-C02", provider: "AWS", color: "#FF9900", level: "Professional" },
  { id: "az-900", name: "Azure Fundamentals", code: "AZ-900", provider: "Azure", color: "#0078D4", level: "Foundational" },
  { id: "az-104", name: "Azure Administrator", code: "AZ-104", provider: "Azure", color: "#0078D4", level: "Associate" },
  { id: "az-305", name: "Azure Solutions Architect Expert", code: "AZ-305", provider: "Azure", color: "#0078D4", level: "Expert" },
  { id: "kcna", name: "Kubernetes and Cloud Native Associate", code: "KCNA", provider: "CNCF", color: "#326CE5", level: "Foundational" },
  { id: "cka", name: "Certified Kubernetes Administrator", code: "CKA", provider: "CNCF", color: "#326CE5", level: "Professional" },
  { id: "ckad", name: "Certified Kubernetes App Developer", code: "CKAD", provider: "CNCF", color: "#326CE5", level: "Professional" },
  { id: "cks", name: "Certified Kubernetes Security Specialist", code: "CKS", provider: "CNCF", color: "#326CE5", level: "Expert" },
  { id: "terraform-associate", name: "Terraform Associate", code: "003", provider: "HashiCorp", color: "#7B42BC", level: "Associate" },
  { id: "rhcsa", name: "Red Hat Certified System Administrator", code: "EX200", provider: "Red Hat", color: "#EE0000", level: "Professional" },
  { id: "rhce", name: "Red Hat Certified Engineer", code: "EX294", provider: "Red Hat", color: "#EE0000", level: "Expert" },
];

export const stats = [
  { label: "Content Files", value: "1,600+", icon: "📄" },
  { label: "Academies", value: "18", icon: "🎓" },
  { label: "Career Paths", value: "22", icon: "🗺️" },
  { label: "Free Forever", value: "100%", icon: "🆓" },
];

export const roadmaps = [
  // ── TECH TRACKS ────────────────────────────────────────────────────────────
  { slug: "devops-engineer", title: "DevOps Engineer", icon: "⚙️", color: "#3B82F6", category: "tech", duration: "6 months",
    steps: ["Linux & Shell", "Git & Docker", "Kubernetes", "CI/CD Pipelines", "Cloud (AWS/Azure)", "Monitoring & IaC"] },
  { slug: "cloud-architect", title: "Cloud Architect", icon: "☁️", color: "#0EA5E9", category: "tech", duration: "8 months",
    steps: ["Cloud Fundamentals", "AWS Core Services", "Azure Core Services", "Networking & Security", "Architecture Patterns", "HA & DR", "Cost Optimization"] },
  { slug: "platform-engineer", title: "Platform Engineer", icon: "🏗️", color: "#6366F1", category: "tech", duration: "9 months",
    steps: ["Linux & Networking", "Kubernetes Advanced", "Terraform", "Helm", "ArgoCD / GitOps", "Service Mesh", "Observability"] },
  { slug: "ai-engineer", title: "AI Engineer", icon: "🤖", color: "#8B5CF6", category: "tech", duration: "6 months",
    steps: ["Python Foundations", "ML Fundamentals", "LLM Concepts", "Prompt Engineering", "LangChain & RAG", "AI Agents", "LLMOps"] },
  { slug: "data-analyst", title: "Data Analyst", icon: "📊", color: "#06B6D4", category: "tech", duration: "4 months",
    steps: ["Excel Advanced", "SQL Mastery", "Python & Pandas", "Data Visualization", "Power BI", "Tableau", "Dashboarding"] },
  { slug: "security-engineer", title: "Security Engineer", icon: "🛡️", color: "#EF4444", category: "tech", duration: "7 months",
    steps: ["Security Fundamentals", "Network Security", "Cloud Security", "SIEM & SOC", "Pen Testing", "Ethical Hacking", "Incident Response"] },
  { slug: "database-engineer", title: "Database Engineer", icon: "🗄️", color: "#10B981", category: "tech", duration: "6 months",
    steps: ["SQL Mastery", "PostgreSQL Advanced", "Redis & Caching", "MongoDB", "Database Design", "Performance Tuning", "Cloud Databases"] },
  { slug: "data-engineer", title: "Data Engineer", icon: "🔧", color: "#F59E0B", category: "tech", duration: "8 months",
    steps: ["Python & Pandas", "SQL Advanced", "Apache Kafka", "dbt", "Airflow", "Spark Basics", "Cloud Data Warehouses"] },
  { slug: "sre-engineer", title: "SRE / Reliability Engineer", icon: "📡", color: "#EC4899", category: "tech", duration: "7 months",
    steps: ["Linux Deep Dive", "Kubernetes Production", "Prometheus & SLOs", "Incident Management", "Chaos Engineering", "Capacity Planning", "Automation"] },
  { slug: "healthcare-coder", title: "Medical Coder (CPC/BCHHC)", icon: "🏥", color: "#14B8A6", category: "professional", duration: "6 months",
    steps: ["Medical Terminology", "ICD-10-CM Fundamentals", "CPT Procedure Codes", "HCPCS Level II", "Coding Guidelines", "OASIS & PDGM", "CPC Exam Prep"] },

  // ── LAW & LEGAL ────────────────────────────────────────────────────────────
  { slug: "advocate-career", title: "Advocate / Legal Career", icon: "⚖️", color: "#6366F1", category: "law", duration: "3–5 years",
    steps: ["LLB / LLB Hons Degree", "State Bar Council Enrollment", "AIBE Exam & Certificate", "Junior to Senior Advocate (2–4 yrs)", "Build Specialisation", "Independent Practice"] },
  { slug: "judiciary-civil-judge", title: "Judiciary — Civil Judge", icon: "🏛️", color: "#A855F7", category: "law", duration: "1–2 years prep",
    steps: ["LLB + Core Subjects", "Constitutional & Criminal Law", "Civil Law (CPC, Contract, TP)", "Prelims Practice (MCQ)", "Mains (Descriptive + Judgment Writing)", "Interview / Viva"] },

  // ── GOVERNMENT / PSC ───────────────────────────────────────────────────────
  { slug: "upsc-ias", title: "UPSC Civil Services (IAS/IPS)", icon: "🏛️", color: "#F59E0B", category: "government", duration: "2–4 years",
    steps: ["Foundation: History, Polity, Geography", "Economy & Environment", "Prelims (GS + CSAT)", "Mains: GS Papers 1–4", "Optional Subject (2 papers)", "Essay + Ethics (GS4)", "Interview / Personality Test"] },
  { slug: "banking-po", title: "Banking PO (SBI/IBPS)", icon: "🏦", color: "#10B981", category: "government", duration: "6–12 months",
    steps: ["Quantitative Aptitude", "Reasoning Ability", "English Language", "General/Banking Awareness", "Prelims Exam", "Mains Exam", "Interview"] },
  { slug: "state-psc-officer", title: "State PSC — Civil Services", icon: "🏛️", color: "#8B5CF6", category: "government", duration: "1–3 years",
    steps: ["State GK + Language", "Indian Polity & History", "Prelims (state-specific)", "Mains + State-specific papers", "Judgment / Essay Writing", "Interview"] },

  // ── FINANCE ────────────────────────────────────────────────────────────────
  { slug: "ca-journey", title: "Chartered Accountant (CA)", icon: "📒", color: "#F59E0B", category: "finance", duration: "4–5 years",
    steps: ["CA Foundation (4 papers)", "Register for Articleship", "CA Intermediate Group I (4 papers)", "CA Intermediate Group II (4 papers)", "3-Year Articleship + ICITSS", "CA Final Group I", "CA Final Group II + AICITSS"] },
  { slug: "banking-finance-analyst", title: "Banking & Finance Analyst", icon: "💹", color: "#14B8A6", category: "finance", duration: "1–2 years",
    steps: ["Accounting Basics", "Financial Markets (SEBI/NISM)", "Banking & RBI Framework", "Credit Analysis Fundamentals", "CA/MBA or NISM Certifications", "Role: Analyst / Relationship Manager"] },

  // ── AGRICULTURE ────────────────────────────────────────────────────────────
  { slug: "agricultural-officer", title: "Agricultural Officer (IBPS AFO / NABARD)", icon: "🌾", color: "#22C55E", category: "agriculture", duration: "1–2 years",
    steps: ["Agronomy & Soil Science", "Crop Science & Horticulture", "Plant Pathology & Entomology", "Agricultural Economics & Policy", "Current Agri Schemes (PM-KISAN, MSP)", "IBPS AFO / NABARD Grade A Exam"] },

  // ── TELECOM ────────────────────────────────────────────────────────────────
  { slug: "telecom-engineer", title: "Telecom Engineer / BSNL JTO", icon: "📡", color: "#0EA5E9", category: "telecom", duration: "1–2 years",
    steps: ["Electronics & Communication (ECE Basics)", "Transmission & Fiber Optics", "Mobile Networks (4G LTE / 5G NR)", "OSS/BSS & Network Management", "GATE ECE / BSNL JTO Exam", "Career: JTO, Network Engineer, RAN"] },

  // ── EDUCATION ──────────────────────────────────────────────────────────────
  { slug: "neet-medical", title: "NEET — Medical College Admission", icon: "🧬", color: "#F43F5E", category: "education", duration: "2 years",
    steps: ["Biology (Botany + Zoology)", "Physics (Mechanics, Modern, Optics)", "Chemistry (Organic, Inorganic, Physical)", "NCERT Mastery (all chapters)", "Previous Year Questions (10 years)", "Mock Tests + Revision"] },
  { slug: "jee-engineering", title: "JEE — Engineering Admission", icon: "🔬", color: "#3B82F6", category: "education", duration: "2 years",
    steps: ["Mathematics (Calculus, Algebra, Coordinate)", "Physics (Mechanics, E&M, Modern)", "Chemistry (Organic, Inorganic, Physical)", "JEE Main Exam (Jan + Apr)", "JEE Advanced (IIT shortlist)", "JOSAA Counselling"] },

  // ── WELLNESS ───────────────────────────────────────────────────────────────
  { slug: "personal-wellness", title: "Personal Wellness & Life Skills", icon: "🌿", color: "#22C55E", category: "wellness", duration: "Ongoing",
    steps: ["Morning Routine & Sleep", "Nutrition & Hydration", "Daily Movement", "Mental Health Practices", "Digital Safety & Privacy", "Personal Finance Basics", "First Aid & Emergency Preparedness"] },
];


// Sections shown for non-technical knowledge domains (law, exams, education, etc.)
export const nonTechSections = [
  { slug: "overview",       label: "Overview",     icon: "📖", description: "What it covers, why it matters, and how to use this guide" },
  { slug: "fundamentals",   label: "Fundamentals", icon: "🔤", description: "Core concepts, definitions, and foundational knowledge" },
  { slug: "intermediate",   label: "Intermediate", icon: "⚡", description: "Applied knowledge, case studies, and worked examples" },
  { slug: "advanced",       label: "Advanced",     icon: "🚀", description: "In-depth analysis, higher-order topics, and expert-level content" },
  { slug: "notes",          label: "Notes",        icon: "📝", description: "Key takeaways, mnemonics, and revision points" },
  { slug: "cheatsheets",    label: "Quick Ref",    icon: "📋", description: "At-a-glance summaries, tables, and quick reference cards" },
  { slug: "interview",      label: "Practice Q&A", icon: "💬", description: "Practice questions, past paper patterns, and model answers" },
  { slug: "faq",            label: "FAQ",          icon: "❓", description: "Frequently asked questions with clear, concise answers" },
];

// Academies that use nonTechSections instead of techSections
export const nonTechAcademyIds = [
  "law", "exams", "education", "state-psc", "central-exams",
  "finance", "economics", "agriculture", "essentials", "healthcare",
  "telecom", "professional-certs",
];
