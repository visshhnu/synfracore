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
  { slug: "overview", label: "Overview", icon: "📖" },
  { slug: "fundamentals", label: "Fundamentals", icon: "🔤" },
  { slug: "intermediate", label: "Intermediate", icon: "⚡" },
  { slug: "advanced", label: "Advanced", icon: "🚀" },
  { slug: "roadmap", label: "Roadmap", icon: "🗺️" },
  { slug: "labs", label: "Labs", icon: "🧪" },
  { slug: "projects", label: "Projects", icon: "🏗️" },
  { slug: "interview", label: "Interview Q&A", icon: "💬" },
  { slug: "troubleshooting", label: "Troubleshooting", icon: "🔧" },
  { slug: "certification", label: "Certification", icon: "🏆" },
  { slug: "cheatsheets", label: "Cheatsheets", icon: "📋" },
  { slug: "notes", label: "Notes", icon: "📝" },
  { slug: "real-world-scenarios", label: "Real World", icon: "🌍" },
  { slug: "faq", label: "FAQ", icon: "❓" },
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

export const roadmaps = [
  { slug: "devops-engineer", title: "DevOps Engineer", icon: "⚙️", duration: "6 months", steps: ["Linux", "Git & Shell", "Docker", "Kubernetes", "CI/CD", "Cloud (AWS/Azure)", "Monitoring", "IaC (Terraform)"] },
  { slug: "cloud-architect", title: "Cloud Architect", icon: "☁️", duration: "8 months", steps: ["Cloud Fundamentals", "AWS Core Services", "Azure Core Services", "Networking & Security", "Architecture Patterns", "HA & DR", "Cost Optimization"] },
  { slug: "platform-engineer", title: "Platform Engineer", icon: "🏗️", duration: "9 months", steps: ["Linux & Networking", "Kubernetes Advanced", "Terraform", "Helm", "ArgoCD / GitOps", "Service Mesh", "Observability"] },
  { slug: "ai-engineer", title: "AI Engineer", icon: "🤖", duration: "6 months", steps: ["Python", "ML Fundamentals", "LLM Concepts", "Prompt Engineering", "LangChain", "RAG & Vector DBs", "AI Agents", "LLMOps"] },
  { slug: "data-analyst", title: "Data Analyst", icon: "📊", duration: "4 months", steps: ["Excel Advanced", "SQL", "Python & Pandas", "Data Visualization", "Power BI", "Tableau", "Dashboarding"] },
  { slug: "security-engineer", title: "Security Engineer", icon: "🛡️", duration: "7 months", steps: ["Security Fundamentals", "Network Security", "Cloud Security", "SIEM & SOC", "Pen Testing", "Ethical Hacking", "Incident Response"] },
];

export const stats = [
  { value: "50+", label: "Technologies" },
  { value: "6", label: "Academies" },
  { value: "500+", label: "Labs & Projects" },
  { value: "13", label: "Certifications" },
];
