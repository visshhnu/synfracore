"use client";
import Link from "next/link";
import { ArrowRight, Star, Clock, Layers } from "lucide-react";


const projectCategories = [
  {
    academy: "devops", label: "DevOps", color: "#3B82F6", icon: "⚙",
    description: "CI/CD pipelines, container orchestration, infrastructure automation",
    projects: [
      { name: "Zero-Downtime Kubernetes Deployment", level: "Intermediate", tech: ["Kubernetes","Helm","ArgoCD"], time: "3 days", link: "/academies/devops/kubernetes/projects" },
      { name: "Multi-Cloud IaC with Terraform", level: "Advanced", tech: ["Terraform","AWS","Azure"], time: "5 days", link: "/academies/devops/terraform/projects" },
      { name: "Jenkins CI/CD Pipeline", level: "Intermediate", tech: ["Jenkins","Docker","GitHub"], time: "2 days", link: "/academies/devops/jenkins/projects" },
      { name: "ELK Stack Monitoring Platform", level: "Advanced", tech: ["ELK","Prometheus","Grafana"], time: "4 days", link: "/academies/devops/elk-stack/projects" },
    ],
  },
  {
    academy: "cloud", label: "Cloud", color: "#F59E0B", icon: "☁",
    description: "Serverless applications, multi-region architectures, cost optimization",
    projects: [
      { name: "3-Tier AWS Architecture", level: "Beginner", tech: ["AWS","EC2","RDS","S3"], time: "2 days", link: "/academies/cloud/aws-ec2/projects" },
      { name: "Serverless REST API", level: "Intermediate", tech: ["Lambda","API Gateway","DynamoDB"], time: "3 days", link: "/academies/cloud/aws-lambda/projects" },
      { name: "Azure AKS Production Platform", level: "Advanced", tech: ["Azure","AKS","Terraform"], time: "5 days", link: "/academies/cloud/azure-aks/projects" },
      { name: "Multi-Cloud Landing Zone", level: "Advanced", tech: ["AWS","Azure","GCP","Terraform"], time: "1 week", link: "/academies/cloud/landing-zones/projects" },
    ],
  },
  {
    academy: "ai", label: "AI Engineering", color: "#8B5CF6", icon: "*",
    description: "LLM applications, RAG systems, autonomous agents",
    projects: [
      { name: "Domain Expert Chatbot", level: "Beginner", tech: ["Claude API","Python","Streamlit"], time: "2 days", link: "/academies/ai/ai-fundamentals/projects" },
      { name: "Document Q&A with RAG", level: "Intermediate", tech: ["LangChain","ChromaDB","OpenAI"], time: "3 days", link: "/academies/ai/rag/projects" },
      { name: "Autonomous DevOps Agent", level: "Advanced", tech: ["Claude","Tool Use","Python"], time: "5 days", link: "/academies/ai/ai-agents/projects" },
      { name: "LLM Evaluation Pipeline", level: "Advanced", tech: ["LLMOps","RAGAS","Python"], time: "4 days", link: "/academies/ai/llmops/projects" },
    ],
  },
  {
    academy: "databases", label: "Databases", color: "#10B981", icon: "*",
    description: "Schema design, query optimization, scalability patterns",
    projects: [
      { name: "E-Commerce PostgreSQL Schema", level: "Beginner", tech: ["PostgreSQL","SQL","Indexes"], time: "2 days", link: "/academies/databases/postgresql/projects" },
      { name: "Redis Caching Layer", level: "Intermediate", tech: ["Redis","Python","Cache-aside"], time: "2 days", link: "/academies/databases/redis/projects" },
      { name: "MongoDB Analytics Pipeline", level: "Intermediate", tech: ["MongoDB","Aggregation","Atlas"], time: "3 days", link: "/academies/databases/mongodb/projects" },
    ],
  },
  {
    academy: "security", label: "Security", color: "#EF4444", icon: "*",
    description: "Security scanning, CSPM, threat detection, hardening",
    projects: [
      { name: "Container Security Pipeline", level: "Intermediate", tech: ["Trivy","Gitleaks","GitHub Actions"], time: "2 days", link: "/academies/security/security-fundamentals/projects" },
      { name: "SOC Detection Rules", level: "Advanced", tech: ["Splunk","MITRE ATT&CK","KQL"], time: "4 days", link: "/academies/security/soc/projects" },
    ],
  },
  {
    academy: "data", label: "Data Analytics", color: "#06B6D4", icon: "*",
    description: "Dashboards, data pipelines, business intelligence",
    projects: [
      { name: "Sales Analytics Dashboard", level: "Beginner", tech: ["Power BI","DAX","Excel"], time: "2 days", link: "/academies/data/power-bi/projects" },
      { name: "Python Data Pipeline", level: "Intermediate", tech: ["Pandas","Python","Matplotlib"], time: "3 days", link: "/academies/data/pandas/projects" },
    ],
  },
];

const levelColors: Record<string, string> = { Beginner: "#10B981", Intermediate: "#3B82F6", Advanced: "#8B5CF6" };

export default function ProjectsPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ textAlign: "center", marginBottom: "64px" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "20px" }}>
          Portfolio Projects
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Build Your Portfolio
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "580px", margin: "0 auto", lineHeight: 1.7 }}>
          Real-world projects that demonstrate your skills to employers. Each project includes step-by-step guidance and a GitHub repo structure.
        </p>
      </div>

      {/* Stats */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 280px), 1fr))", gap: "16px", marginBottom: "64px" }}>
        {[
          { value: "300+", label: "Guided Projects", icon: "[P]" },
          { value: "Beginner → Advanced", label: "All Skill Levels", icon: ">" },
          { value: "GitHub Ready", label: "Portfolio-worthy", icon: "⭐" },
        ].map(stat => (
          <div key={stat.label} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px", textAlign: "center" }}>
            <div style={{ fontSize: "28px", marginBottom: "8px" }}>{stat.icon}</div>
            <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "20px", fontWeight: 700, marginBottom: "4px" }}>{stat.value}</div>
            <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{stat.label}</div>
          </div>
        ))}
      </div>

      {projectCategories.map(cat => (
        <div key={cat.academy} style={{ marginBottom: "48px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "20px" }}>
            <span style={{ fontSize: "28px" }}>{cat.icon}</span>
            <div>
              <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "22px" }}>{cat.label}</h2>
              <p style={{ color: "var(--text-4)", fontSize: "13px" }}>{cat.description}</p>
            </div>
            <Link href={`/academies/${cat.academy}`} style={{ marginLeft: "auto", background: `${cat.color}15`, color: cat.color, border: `1px solid ${cat.color}33`, padding: "6px 16px", borderRadius: "8px", textDecoration: "none", fontSize: "13px", fontWeight: 600 }}>
              All {cat.label} →
            </Link>
          </div>

          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 260px), 1fr))", gap: "14px" }}>
            {cat.projects.map(proj => (
              <Link key={proj.name} href={proj.link} style={{ textDecoration: "none" }}>
                <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px", height: "100%", display: "flex", flexDirection: "column", gap: "12px", transition: "border-color 0.2s" }}
                  onMouseEnter={e => (e.currentTarget.style.borderColor = cat.color)}
                  onMouseLeave={e => (e.currentTarget.style.borderColor = "var(--border)")}>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                    <span style={{ background: `${levelColors[proj.level]}22`, color: levelColors[proj.level], padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 700 }}>{proj.level}</span>
                    <span style={{ display: "flex", alignItems: "center", gap: "4px", fontSize: "12px", color: "var(--text-4)" }}><Clock size={11}/> {proj.time}</span>
                  </div>
                  <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", lineHeight: 1.4 }}>{proj.name}</h3>
                  <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginTop: "auto" }}>
                    {proj.tech.map(t => (
                      <span key={t} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "2px 7px", borderRadius: "4px", fontSize: "11px", color: "var(--text-4)", fontFamily: "monospace" }}>{t}</span>
                    ))}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
