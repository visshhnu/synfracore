"use client";
import Link from "next/link";
import { Terminal, Code2, Database, FlaskConical, BookOpen, ArrowRight, Zap, Play } from "lucide-react";

const labCategories = [
  {
    academy: "devops", label: "DevOps Labs", icon: "⚙️", color: "#3B82F6",
    interface: "Terminal",
    description: "Real CLI commands for Linux, Docker, Kubernetes, Terraform, and more",
    labs: [
      { name: "Linux Administration", slug: "linux", count: 2 },
      { name: "Docker Containers", slug: "docker", count: 3 },
      { name: "Kubernetes", slug: "kubernetes", count: 3 },
      { name: "Terraform IaC", slug: "terraform", count: 2 },
      { name: "Ansible Automation", slug: "ansible", count: 1 },
      { name: "Jenkins CI/CD", slug: "jenkins", count: 1 },
      { name: "ArgoCD GitOps", slug: "argocd", count: 1 },
      { name: "Prometheus Monitoring", slug: "prometheus", count: 1 },
    ],
  },
  {
    academy: "cloud", label: "Cloud Labs", icon: "☁️", color: "#F59E0B",
    interface: "Terminal",
    description: "AWS CLI, Azure CLI, and GCP commands for real cloud architectures",
    labs: [
      { name: "AWS EC2 & VPC", slug: "aws-ec2", count: 1 },
      { name: "AWS S3 & IAM", slug: "aws-s3", count: 1 },
      { name: "AWS Lambda", slug: "aws-lambda", count: 1 },
      { name: "AWS EKS", slug: "aws-eks", count: 1 },
      { name: "Azure AKS", slug: "azure-aks", count: 1 },
      { name: "GKE Autopilot", slug: "gke", count: 1 },
    ],
  },
  {
    academy: "databases", label: "Database Labs", icon: "🗄️", color: "#10B981",
    interface: "SQL Console",
    description: "Interactive SQL console with table output, query optimization labs",
    labs: [
      { name: "PostgreSQL Advanced", slug: "postgresql", count: 1 },
      { name: "Redis Caching", slug: "redis", count: 1 },
      { name: "MongoDB Aggregation", slug: "mongodb", count: 1 },
      { name: "MySQL Optimization", slug: "mysql", count: 1 },
      { name: "Elasticsearch Search", slug: "elasticsearch", count: 1 },
      { name: "SQL Fundamentals", slug: "sql", count: 1 },
    ],
  },
  {
    academy: "ai", label: "AI/ML Labs", icon: "🤖", color: "#8B5CF6",
    interface: "Code Editor",
    description: "Python code labs for Claude API, RAG systems, and AI agents",
    labs: [
      { name: "Claude & OpenAI APIs", slug: "ai-fundamentals", count: 1 },
      { name: "Prompt Engineering", slug: "prompt-engineering", count: 1 },
      { name: "LangChain RAG", slug: "langchain", count: 1 },
      { name: "AI Agents with Tools", slug: "ai-agents", count: 1 },
    ],
  },
  {
    academy: "data", label: "Data Analytics Labs", icon: "📊", color: "#06B6D4",
    interface: "Code Editor",
    description: "Pandas data analysis, SQL analytics, Power BI DAX",
    labs: [
      { name: "Pandas DataFrames", slug: "pandas", count: 1 },
      { name: "SQL Analytics", slug: "sql", count: 1 },
    ],
  },
  {
    academy: "security", label: "Security Labs", icon: "🛡️", color: "#EF4444",
    interface: "Terminal",
    description: "Trivy scanning, nmap, TLS analysis, SIEM detection rules",
    labs: [
      { name: "Vulnerability Scanning", slug: "security-fundamentals", count: 1 },
      { name: "Network Security", slug: "network-security", count: 1 },
      { name: "SOC Operations", slug: "soc", count: 1 },
      { name: "SIEM Queries", slug: "siem", count: 1 },
    ],
  },
];

const quizCategories = [
  {
    academy: "exams", label: "Competitive Exams", icon: "📝", color: "#F59E0B",
    firstTech: "neet-biology",
    techs: ["GATE CSE", "JEE Maths/Physics", "NEET Bio/Physics", "UPSC", "Banking", "SSC", "RRB NTPC"],
  },
  {
    academy: "healthcare", label: "Medical Coding", icon: "🏥", color: "#10B981",
    firstTech: "icd-10-cm",
    techs: ["ICD-10-CM", "CPT Codes", "HCPCS Level II", "Coding Guidelines", "Home Health"],
  },
  {
    academy: "essentials", label: "Life Essentials", icon: "💡", color: "#8B5CF6",
    firstTech: "gut-health",
    techs: ["Nutrition", "Mental Health", "First Aid", "Personal Finance", "Hygiene"],
  },
  {
    academy: "education", label: "CS Education", icon: "🎓", color: "#3B82F6",
    firstTech: "dsa",
    techs: ["DSA", "OS", "DBMS", "Computer Networks", "System Design", "Java", "C++"],
  },
];

const interfaceIcons: Record<string, React.ReactNode> = {
  "Terminal": <Terminal size={13}/>,
  "SQL Console": <Database size={13}/>,
  "Code Editor": <Code2 size={13}/>,
};

export default function LabsPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "64px" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "20px" }}>
          <FlaskConical size={14}/> Interactive Practice Environments
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Hands-On Labs
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "580px", margin: "0 auto 32px", lineHeight: 1.7 }}>
          Click any lab to start immediately — terminal simulation, SQL console, code editor, and MCQ quizzes. No account setup needed.
        </p>
        <div style={{ display: "flex", gap: "12px", justifyContent: "center", flexWrap: "wrap" }}>
          {[
            { icon: <Terminal size={14}/>, label: "Terminal Simulation" },
            { icon: <Code2 size={14}/>, label: "Code Editor (Python/Java)" },
            { icon: <Database size={14}/>, label: "SQL Console" },
            { icon: <BookOpen size={14}/>, label: "MCQ + Flashcards" },
          ].map(item => (
            <div key={item.label} style={{ display: "flex", alignItems: "center", gap: "6px", background: "var(--bg-1)", border: "1px solid var(--border)", padding: "8px 16px", borderRadius: "8px", fontSize: "13px" }}>
              {item.icon} {item.label}
            </div>
          ))}
        </div>
      </div>

      {/* Terminal/Code/SQL Labs */}
      <div style={{ marginBottom: "64px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "22px", marginBottom: "24px", display: "flex", alignItems: "center", gap: "10px" }}>
          <Terminal size={20}/> Interactive Lab Environments
        </h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 300px), 1fr))", gap: "20px" }}>
          {labCategories.map(cat => (
            <div key={cat.academy} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
              {/* Header */}
              <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "14px" }}>
                <span style={{ fontSize: "28px" }}>{cat.icon}</span>
                <div>
                  <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px" }}>{cat.label}</div>
                  <div style={{ display: "inline-flex", alignItems: "center", gap: "4px", background: `${cat.color}22`, color: cat.color, padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 600, marginTop: "2px" }}>
                    {interfaceIcons[cat.interface]} {cat.interface}
                  </div>
                </div>
              </div>
              <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "16px", lineHeight: 1.6 }}>{cat.description}</p>

              {/* Direct lab links */}
              <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
                {cat.labs.slice(0, 5).map(lab => (
                  <Link key={lab.slug} href={`/academies/${cat.academy}/${lab.slug}/labs`}
                    style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "9px 14px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "8px", textDecoration: "none", color: "var(--text-2)", fontSize: "13px", transition: "all 0.15s" }}
                    onMouseEnter={e => { e.currentTarget.style.borderColor = cat.color; e.currentTarget.style.color = cat.color; }}
                    onMouseLeave={e => { e.currentTarget.style.borderColor = "var(--border)"; e.currentTarget.style.color = "var(--text-2)"; }}>
                    <span style={{ display: "flex", alignItems: "center", gap: "8px" }}>
                      <Play size={11}/> {lab.name}
                    </span>
                    <span style={{ fontSize: "11px", color: "var(--text-4)" }}>{lab.count} lab{lab.count > 1 ? "s" : ""} →</span>
                  </Link>
                ))}
                {cat.labs.length > 5 && (
                  <Link href={`/academies/${cat.academy}`}
                    style={{ padding: "9px 14px", textAlign: "center", background: "transparent", border: `1px dashed ${cat.color}44`, borderRadius: "8px", textDecoration: "none", color: cat.color, fontSize: "12px", fontWeight: 600 }}>
                    +{cat.labs.length - 5} more labs in {cat.label} →
                  </Link>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Quiz/Flashcard section */}
      <div>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "22px", marginBottom: "8px", display: "flex", alignItems: "center", gap: "10px" }}>
          <Zap size={20}/> Quiz & Flashcard Practice
        </h2>
        <p style={{ color: "var(--text-4)", marginBottom: "24px", fontSize: "15px" }}>
          Click any topic to start MCQ practice or flashcard revision immediately
        </p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "16px" }}>
          {quizCategories.map(cat => (
            <div key={cat.academy} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px" }}>
              <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "14px" }}>
                <span style={{ fontSize: "24px" }}>{cat.icon}</span>
                <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px" }}>{cat.label}</h3>
              </div>
              <div style={{ display: "flex", flex: "column", gap: "6px", flexDirection: "column" }}>
                {cat.techs.map((tech, i) => {
                  const techSlug = tech.toLowerCase().replace(/[^a-z0-9]/g, "-").replace(/-+/g, "-");
                  const slugMap: Record<string, string> = {
                    "gate-cse": "gate-cse", "jee-maths-physics": "jee-maths", "neet-bio-physics": "neet-biology",
                    "upsc": "upsc-prelims", "banking": "banking-exams", "ssc": "ssc-cgl", "rrb-ntpc": "rrb-ntpc",
                    "icd-10-cm": "icd-10-cm", "cpt-codes": "cpt", "hcpcs-level-ii": "hcpcs",
                    "coding-guidelines": "coding-guidelines", "home-health": "home-health-coding",
                    "nutrition": "nutrition", "mental-health": "mental-health", "first-aid": "first-aid",
                    "personal-finance": "personal-finance", "hygiene": "hygiene",
                    "dsa": "dsa", "os": "os", "dbms": "dbms", "computer-networks": "cn",
                    "system-design": "system-design", "java": "java", "c--": "cpp",
                  };
                  const slug = slugMap[techSlug] || (i === 0 ? cat.firstTech : cat.firstTech);
                  return (
                    <Link key={tech} href={`/academies/${cat.academy}/${slug}/labs`}
                      style={{ display: "flex", alignItems: "center", gap: "8px", padding: "7px 12px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "7px", textDecoration: "none", color: "var(--text-3)", fontSize: "12px" }}
                      onMouseEnter={e => { e.currentTarget.style.color = cat.color; e.currentTarget.style.borderColor = cat.color; }}
                      onMouseLeave={e => { e.currentTarget.style.color = "var(--text-3)"; e.currentTarget.style.borderColor = "var(--border)"; }}>
                      <BookOpen size={10}/> {tech}
                    </Link>
                  );
                })}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
