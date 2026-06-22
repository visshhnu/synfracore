export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { redirect } from "next/navigation";
import { ArrowRight, CheckCircle, Clock } from "lucide-react";

type Props = { params: Promise<{ role: string }> };

const roles: Record<string, {
  title: string; icon: string; color: string;
  tagline: string; salary: string; demand: string;
  description: string;
  skills: { name: string; level: string; link: string }[];
  path: { phase: string; duration: string; what: string[] }[];
  interviews: string[];
  certs: string[];
  companies: string[];
  resume: string[];
}> = {
  "platform-engineer": {
    title: "Platform Engineer", icon: "🏛️", color: "#8B5CF6",
    tagline: "Build the internal developer platform that makes teams 10x faster",
    salary: "₹20L – ₹90L", demand: "Extremely High",
    description: "Platform Engineers build and maintain the internal developer platform — the golden paths, self-service infrastructure, and tooling that lets application teams deploy, observe, and operate without deep infra expertise.",
    skills: [
      { name: "Kubernetes", level: "Advanced", link: "/academies/devops/kubernetes" },
      { name: "Terraform", level: "Advanced", link: "/academies/devops/terraform" },
      { name: "ArgoCD / GitOps", level: "Advanced", link: "/academies/devops/argocd" },
      { name: "Helm", level: "Intermediate", link: "/academies/devops/helm" },
      { name: "Prometheus + Grafana", level: "Intermediate", link: "/academies/devops/prometheus" },
      { name: "Linux + Shell", level: "Advanced", link: "/academies/devops/linux" },
    ],
    path: [
      { phase: "Foundation (3 months)", duration: "12–15 hrs/week", what: ["Linux mastery", "Docker + Kubernetes", "Git + GitOps", "Terraform basics"] },
      { phase: "Core Platform Skills (3 months)", duration: "12 hrs/week", what: ["Advanced K8s RBAC/Networking", "Helm chart authoring", "ArgoCD multi-cluster", "Prometheus alerting"] },
      { phase: "Platform Engineering (2 months)", duration: "10 hrs/week", what: ["Internal Developer Platform design", "Backstage.io", "Golden paths", "Self-service provisioning"] },
      { phase: "Enterprise Patterns (ongoing)", duration: "5–8 hrs/week", what: ["HA/DR design", "Multi-cluster management", "Cost optimisation", "Security baselines"] },
    ],
    interviews: [
      "Explain the difference between GitOps and traditional CI/CD push deployments",
      "How would you design a self-service Kubernetes namespace provisioning system?",
      "What is your approach to managing Kubernetes across 50+ teams?",
      "Describe a secrets management strategy using Vault and External Secrets Operator",
    ],
    certs: ["CKA (Certified Kubernetes Administrator)", "CKAD", "Terraform Associate", "AWS/Azure Solutions Architect"],
    companies: ["Razorpay", "Flipkart", "Ola", "Swiggy", "CRED", "Zepto", "ThoughtWorks", "Atlassian"],
    resume: [
      "Designed internal developer platform serving 50+ engineering teams using Backstage.io and Kubernetes",
      "Reduced average deployment time from 45 min to 8 min through GitOps adoption with ArgoCD",
      "Built self-service infra provisioning, cutting DevOps ticket volume by 70%",
    ],
  },
  "devops-engineer": {
    title: "DevOps Engineer", icon: "⚙️", color: "#F59E0B",
    tagline: "Bridge dev and ops — automate everything, deploy continuously",
    salary: "₹6L – ₹40L", demand: "Very High",
    description: "DevOps Engineers own CI/CD pipelines, deployment automation, and production reliability — sitting at the intersection of development and operations to ensure code reaches production reliably and frequently.",
    skills: [
      { name: "Docker", level: "Advanced", link: "/academies/devops/docker" },
      { name: "Kubernetes", level: "Intermediate", link: "/academies/devops/kubernetes" },
      { name: "Jenkins / GitHub Actions", level: "Advanced", link: "/academies/devops/jenkins" },
      { name: "Terraform", level: "Intermediate", link: "/academies/devops/terraform" },
      { name: "Ansible", level: "Intermediate", link: "/academies/devops/ansible" },
      { name: "Linux + Shell", level: "Advanced", link: "/academies/devops/linux" },
    ],
    path: [
      { phase: "Foundation (2 months)", duration: "10–12 hrs/week", what: ["Linux fundamentals", "Shell scripting", "Git", "Networking basics"] },
      { phase: "Containers & CI/CD (2 months)", duration: "12 hrs/week", what: ["Docker", "Jenkins pipelines", "GitHub Actions", "Container security"] },
      { phase: "Cloud + IaC (2 months)", duration: "10 hrs/week", what: ["AWS/Azure core services", "Terraform", "Ansible", "Cloud networking"] },
      { phase: "K8s + Monitoring (2 months)", duration: "10 hrs/week", what: ["Kubernetes deployments", "Helm", "Prometheus", "Grafana + Alertmanager"] },
    ],
    interviews: [
      "Walk me through a CI/CD pipeline you built from scratch",
      "How do you handle a production outage caused by a bad deployment?",
      "Explain blue-green vs canary deployments and when to use each",
      "How do you manage secrets securely across environments?",
    ],
    certs: ["CKA", "AWS DevOps Professional", "Terraform Associate", "Jenkins Certified Engineer"],
    companies: ["TCS", "Infosys", "Wipro", "Amazon", "Microsoft", "Thoughtworks", "Atlassian"],
    resume: [
      "Built CI/CD pipeline with Jenkins + Docker + Kubernetes, reducing deployment time from 2 hrs to 12 min",
      "Provisioned AWS infrastructure as code with Terraform, eliminating manual provisioning errors",
      "Reduced production incidents 60% by implementing monitoring with Prometheus and Grafana",
    ],
  },
  "sre-engineer": {
    title: "Site Reliability Engineer (SRE)", icon: "🔬", color: "#10B981",
    tagline: "Keep systems reliable at scale — SLOs, incident response, eliminating toil",
    salary: "₹20L – ₹90L", demand: "Extremely High",
    description: "SREs apply software engineering to operations — defining SLIs/SLOs, owning incident management, writing runbooks, eliminating toil through automation, and ensuring production reliability at scale.",
    skills: [
      { name: "Linux Performance", level: "Advanced", link: "/academies/devops/linux" },
      { name: "Kubernetes", level: "Advanced", link: "/academies/devops/kubernetes" },
      { name: "Prometheus + Grafana", level: "Advanced", link: "/academies/devops/prometheus" },
      { name: "Python / Go", level: "Advanced", link: "/academies/ai" },
      { name: "Incident Management", level: "Advanced", link: "/academies/devops" },
      { name: "Distributed Systems", level: "Intermediate", link: "/academies/devops" },
    ],
    path: [
      { phase: "SRE Foundations (3 months)", duration: "12 hrs/week", what: ["SLI/SLO/Error budgets", "Linux performance tuning", "Monitoring and observability", "Distributed systems basics"] },
      { phase: "Reliability Engineering (3 months)", duration: "12 hrs/week", what: ["Incident response process", "Chaos engineering", "Capacity planning", "Toil reduction automation"] },
      { phase: "Advanced SRE (ongoing)", duration: "8 hrs/week", what: ["Production architecture reviews", "Performance engineering", "Multi-region reliability", "DR planning"] },
    ],
    interviews: [
      "How do you define SLIs and SLOs for a new service?",
      "Walk me through how you'd handle a P0 production incident end to end",
      "Explain error budgets and how you'd use them to gate deployments",
      "How do you balance reliability work vs feature delivery?",
    ],
    certs: ["CKA", "Google SRE Course", "AWS SysOps Administrator", "ITIL Foundation"],
    companies: ["Google", "Amazon", "Microsoft", "Cloudflare", "Atlassian", "Grab", "Gojek"],
    resume: [
      "Improved service reliability from 99.5% to 99.95% through error budget management and systematic incident reduction",
      "Built automated incident response runbooks reducing MTTR from 45 min to 8 min",
      "Eliminated 30 hrs/week of operational toil through automation, freeing team for reliability work",
    ],
  },
  "cloud-architect": {
    title: "Cloud Architect", icon: "☁️", color: "#3B82F6",
    tagline: "Design scalable, secure, cost-efficient cloud infrastructure for the enterprise",
    salary: "₹15L – ₹80L", demand: "Very High",
    description: "Cloud Architects design cloud strategy — choosing services, defining networking, setting security posture, optimising costs, and ensuring HA/DR across AWS, Azure, and GCP.",
    skills: [
      { name: "AWS / Azure / GCP", level: "Advanced", link: "/academies/cloud" },
      { name: "Cloud Networking (VPC, BGP)", level: "Advanced", link: "/academies/devops/networking" },
      { name: "Terraform", level: "Advanced", link: "/academies/devops/terraform" },
      { name: "Cloud Security", level: "Advanced", link: "/academies/security" },
      { name: "Kubernetes (EKS/AKS/GKE)", level: "Intermediate", link: "/academies/devops/kubernetes" },
      { name: "FinOps / Cost Optimisation", level: "Advanced", link: "/academies/cloud" },
    ],
    path: [
      { phase: "Cloud Foundations (2 months)", duration: "10 hrs/week", what: ["One cloud platform deep-dive", "Networking fundamentals", "IAM and security", "Core services"] },
      { phase: "Architecture Patterns (3 months)", duration: "12 hrs/week", what: ["HA/DR design", "Microservices patterns", "Serverless architecture", "Multi-region deployment"] },
      { phase: "Enterprise Cloud (2 months)", duration: "10 hrs/week", what: ["Multi-cloud strategy", "Cost optimisation", "Landing zones", "Governance and compliance"] },
    ],
    interviews: [
      "Design a multi-region, highly available web application on AWS with RPO=15min, RTO=1hr",
      "How would you approach a large-scale cloud migration from on-premise?",
      "Walk me through your cloud cost optimisation approach",
      "How do you design for disaster recovery across regions?",
    ],
    certs: ["AWS Solutions Architect Professional (SAP-C02)", "Azure Solutions Architect Expert (AZ-305)", "Google Professional Cloud Architect", "Terraform Associate"],
    companies: ["Accenture", "Deloitte", "KPMG", "Amazon", "Microsoft", "Google", "Capgemini"],
    resume: [
      "Designed multi-region AWS architecture for 10M+ user platform achieving 99.99% uptime SLA",
      "Reduced cloud infrastructure costs by ₹2Cr annually through Reserved Instance strategy and right-sizing",
      "Led cloud migration of 200+ microservices from on-premise to AWS in 18 months with zero downtime",
    ],
  },
  "ai-engineer": {
    title: "AI Engineer", icon: "🤖", color: "#8B5CF6",
    tagline: "Build production AI — RAG pipelines, agents, LLMOps, AI-powered products",
    salary: "₹18L – ₹80L", demand: "Extremely High",
    description: "AI Engineers build systems that bring AI into production — RAG pipelines, AI agents, model serving, evaluation frameworks, and AI-powered features. The fastest-growing engineering role in 2025.",
    skills: [
      { name: "Python (Advanced)", level: "Advanced", link: "/academies/ai" },
      { name: "LLM APIs (OpenAI, Anthropic)", level: "Advanced", link: "/academies/ai" },
      { name: "RAG + Vector Databases", level: "Advanced", link: "/academies/ai" },
      { name: "LangChain / LangGraph", level: "Advanced", link: "/academies/ai" },
      { name: "Docker + Kubernetes", level: "Intermediate", link: "/academies/devops/docker" },
      { name: "MLOps", level: "Intermediate", link: "/academies/ai" },
    ],
    path: [
      { phase: "AI Fundamentals (1 month)", duration: "10 hrs/week", what: ["How LLMs work", "Prompt engineering", "OpenAI/Anthropic APIs", "Basic RAG"] },
      { phase: "Production RAG (2 months)", duration: "12 hrs/week", what: ["Vector DBs (Qdrant, Pinecone)", "Chunking strategies", "Retrieval evaluation", "Advanced RAG patterns"] },
      { phase: "AI Agents (2 months)", duration: "12 hrs/week", what: ["LangChain agents", "LangGraph stateful agents", "Tool use and function calling", "Multi-agent systems"] },
      { phase: "LLMOps (1 month)", duration: "10 hrs/week", what: ["Evaluation with RAGAS", "LLM monitoring", "Fine-tuning with LoRA/QLoRA", "vLLM deployment"] },
    ],
    interviews: [
      "What is RAG and why prefer it over fine-tuning for knowledge-intensive tasks?",
      "How do you evaluate the quality of a RAG pipeline end to end?",
      "Explain the ReAct agent pattern with a real example",
      "What are the main challenges in deploying LLMs at production scale?",
    ],
    certs: ["AWS Machine Learning Specialty", "Google Professional ML Engineer", "DeepLearning.AI specialisations"],
    companies: ["OpenAI", "Anthropic", "Microsoft", "Google", "Startups", "Product companies with AI features"],
    resume: [
      "Built RAG system over 500K documents achieving 94% answer relevance (RAGAS evaluation)",
      "Reduced customer support ticket volume 40% with LLM-powered auto-classification and resolution agent",
      "Deployed multi-agent research assistant (LangGraph) reducing analyst report time from 4 hrs to 20 min",
    ],
  },
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { role } = await params;
  const r = roles[role];
  if (!r) return { title: "Career | SynfraCore" };
  return {
    title: `${r.title} Career Path — Skills, Roadmap, Salary | SynfraCore`,
    description: `Complete ${r.title} guide: required skills, step-by-step roadmap, salary ${r.salary}, interview questions, certifications, and resume bullets.`,
    alternates: { canonical: `https://synfracore.com/careers/${role}` },
  };
}

export default async function RolePage({ params }: Props) {
  const { role } = await params;
  const r = roles[role];
  if (!r) redirect("/career");

  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "48px 24px" }}>

      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <Link href="/career" style={{ color: "var(--text-4)", textDecoration: "none" }}>Careers</Link>›
        <span style={{ color: "var(--text-2)" }}>{r.title}</span>
      </nav>

      {/* Hero */}
      <div style={{ marginBottom: "40px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "14px" }}>
          <span style={{ fontSize: "44px" }}>{r.icon}</span>
          <div>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "30px", marginBottom: "4px" }}>{r.title}</h1>
            <p style={{ color: r.color, fontSize: "14px", fontWeight: 600 }}>{r.tagline}</p>
          </div>
        </div>
        <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.7, maxWidth: "720px", marginBottom: "20px" }}>{r.description}</p>
        <div style={{ display: "flex", gap: "16px", flexWrap: "wrap" }}>
          <div style={{ padding: "10px 20px", borderRadius: "10px", background: r.color + "12", border: `1px solid ${r.color}25` }}>
            <div style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 600 }}>SALARY RANGE</div>
            <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "18px", color: r.color }}>{r.salary}</div>
          </div>
          <div style={{ padding: "10px 20px", borderRadius: "10px", background: "rgba(16,185,129,0.08)", border: "1px solid rgba(16,185,129,0.2)" }}>
            <div style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 600 }}>DEMAND</div>
            <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "18px", color: "#10B981" }}>{r.demand}</div>
          </div>
        </div>
      </div>

      {/* Skills */}
      <section style={{ marginBottom: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "16px" }}>🛠️ Required Skills</h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(220px, 1fr))", gap: "10px" }}>
          {r.skills.map(s => (
            <Link key={s.name} href={s.link} style={{ textDecoration: "none" }}>
              <div className="card-hover" style={{ padding: "14px 16px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <span style={{ fontWeight: 600, fontSize: "14px", color: "var(--text-1)" }}>{s.name}</span>
                <span style={{ fontSize: "10px", padding: "2px 8px", borderRadius: "20px", background: s.level === "Advanced" ? r.color + "20" : "var(--bg-2)", color: s.level === "Advanced" ? r.color : "var(--text-4)", fontWeight: 700 }}>{s.level}</span>
              </div>
            </Link>
          ))}
        </div>
      </section>

      {/* Learning path */}
      <section style={{ marginBottom: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "16px" }}>🗺️ Step-by-Step Learning Path</h2>
        <div style={{ display: "flex", flexDirection: "column" }}>
          {r.path.map((phase, i) => (
            <div key={i} style={{ display: "flex", alignItems: "flex-start" }}>
              <div style={{ display: "flex", flexDirection: "column", alignItems: "center", marginRight: "16px" }}>
                <div style={{ width: "32px", height: "32px", borderRadius: "50%", background: r.color, color: "white", display: "flex", alignItems: "center", justifyContent: "center", fontSize: "13px", fontWeight: 700, flexShrink: 0 }}>{i + 1}</div>
                {i < r.path.length - 1 && <div style={{ width: "2px", background: "var(--border)", flex: 1, minHeight: "24px" }} />}
              </div>
              <div style={{ paddingBottom: "24px", flex: 1 }}>
                <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px", flexWrap: "wrap" }}>
                  <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{phase.phase}</span>
                  <span style={{ fontSize: "11px", color: "var(--text-4)", background: "var(--bg-2)", padding: "2px 8px", borderRadius: "20px", display: "flex", alignItems: "center", gap: "4px" }}>
                    <Clock size={10} /> {phase.duration}
                  </span>
                </div>
                <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                  {phase.what.map(w => (
                    <span key={w} style={{ fontSize: "12px", padding: "3px 10px", borderRadius: "20px", background: r.color + "12", color: r.color, fontWeight: 600 }}>{w}</span>
                  ))}
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* Interview questions */}
      <section style={{ marginBottom: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "16px" }}>💬 Key Interview Questions</h2>
        <div style={{ display: "flex", flexDirection: "column", gap: "10px" }}>
          {r.interviews.map((q, i) => (
            <div key={i} style={{ padding: "16px 18px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", display: "flex", gap: "12px", alignItems: "flex-start" }}>
              <span style={{ width: "24px", height: "24px", borderRadius: "50%", background: r.color + "20", color: r.color, fontWeight: 700, fontSize: "12px", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0, marginTop: "1px" }}>{i + 1}</span>
              <span style={{ fontSize: "14px", color: "var(--text-2)", lineHeight: 1.6 }}>{q}</span>
            </div>
          ))}
        </div>
        <div style={{ marginTop: "14px" }}>
          <Link href="/interview" style={{ color: r.color, fontSize: "13px", fontWeight: 700, textDecoration: "none" }}>
            → Full interview Q&A bank with detailed answers
          </Link>
        </div>
      </section>

      {/* Certs + Companies */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "20px", marginBottom: "40px" }}>
        <section style={{ padding: "24px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "14px" }}>🏆 Target Certifications</h2>
          {r.certs.map((c, i) => (
            <div key={i} style={{ display: "flex", gap: "8px", marginBottom: "8px", fontSize: "13px", color: "var(--text-2)" }}>
              <CheckCircle size={14} color="#10B981" style={{ marginTop: "2px", flexShrink: 0 }} />
              <span>{c}</span>
            </div>
          ))}
          <div style={{ marginTop: "14px" }}>
            <Link href="/certifications" style={{ color: r.color, fontSize: "12px", fontWeight: 700, textDecoration: "none" }}>View cert guides →</Link>
          </div>
        </section>
        <section style={{ padding: "24px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "14px" }}>🏢 Companies Hiring</h2>
          <div style={{ display: "flex", gap: "8px", flexWrap: "wrap" }}>
            {[...new Set(r.companies)].slice(0, 8).map(c => (
              <span key={c} style={{ fontSize: "12px", padding: "4px 10px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-3)", fontWeight: 600 }}>{c}</span>
            ))}
          </div>
        </section>
      </div>

      {/* Resume bullets */}
      <section style={{ padding: "24px", borderRadius: "12px", background: "linear-gradient(135deg,rgba(59,130,246,0.05),rgba(139,92,246,0.05))", border: "1px solid rgba(59,130,246,0.15)", marginBottom: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "8px" }}>📄 Sample Resume Bullets</h2>
        <p style={{ color: "var(--text-4)", fontSize: "12px", marginBottom: "14px" }}>Adapt these — always quantify results from your real experience.</p>
        {r.resume.map((b, i) => (
          <div key={i} style={{ display: "flex", gap: "10px", marginBottom: "10px", fontSize: "13px", color: "var(--text-2)", lineHeight: 1.6 }}>
            <span style={{ color: r.color, fontWeight: 700, flexShrink: 0 }}>•</span>
            <span>{b}</span>
          </div>
        ))}
      </section>

      {/* CTA */}
      <div style={{ textAlign: "center", padding: "32px 24px", borderRadius: "16px", background: "var(--bg-1)", border: "1px solid var(--border)" }}>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "10px" }}>
          Ready to become a {r.title}?
        </h3>
        <p style={{ color: "var(--text-3)", fontSize: "14px", marginBottom: "20px" }}>
          Follow the learning path above and build every skill through our structured academies.
        </p>
        <div style={{ display: "flex", gap: "12px", justifyContent: "center", flexWrap: "wrap" }}>
          <Link href="/roadmaps" className="btn-primary" style={{ background: r.color }}>
            View Full Roadmap <ArrowRight size={15} />
          </Link>
          <Link href="/academies" className="btn-secondary">Browse Academies</Link>
        </div>
      </div>
    </div>
  );
}
