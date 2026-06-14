"use client";
import Link from "next/link";
import { Terminal, Code2, Database, FlaskConical, BookOpen, ArrowRight, Zap } from "lucide-react";


const labCategories = [
  {
    academy: "devops", label: "DevOps Labs", icon: "⚙️", color: "#3B82F6",
    interface: "Terminal",
    description: "Real CLI commands for Linux, Docker, Kubernetes, Terraform, and more",
    topics: ["Linux & Shell", "Docker Containers", "Kubernetes", "Terraform IaC", "Ansible", "Jenkins CI/CD", "ArgoCD GitOps", "Prometheus/Grafana"],
    highlights: ["Simulated terminal execution", "Copy-paste ready commands", "Step-by-step guidance", "Real production patterns"],
  },
  {
    academy: "cloud", label: "Cloud Labs", icon: "☁️", color: "#F59E0B",
    interface: "Terminal",
    description: "AWS CLI, Azure CLI, and GCP commands for real cloud architectures",
    topics: ["AWS EC2, S3, VPC", "AWS EKS & Lambda", "Azure VMs & AKS", "GKE & BigQuery", "CloudFormation", "Cost Optimization"],
    highlights: ["AWS/Azure/GCP CLI examples", "Architecture patterns", "Production-grade configs", "Security best practices"],
  },
  {
    academy: "databases", label: "Database Labs", icon: "🗄️", color: "#10B981",
    interface: "SQL Console",
    description: "Write real SQL, practice NoSQL, and optimize queries in an interactive console",
    topics: ["PostgreSQL Advanced SQL", "MySQL Optimization", "MongoDB Aggregation", "Redis Caching", "Elasticsearch Search", "Cassandra CQL"],
    highlights: ["Live SQL console", "Table output rendering", "Query explanation", "Optimization patterns"],
  },
  {
    academy: "ai", label: "AI/ML Labs", icon: "🤖", color: "#8B5CF6",
    interface: "Code Editor",
    description: "Python code labs for LLM APIs, RAG systems, and autonomous agents",
    topics: ["Claude & OpenAI APIs", "Prompt Engineering", "LangChain RAG", "AI Agents with Tools", "LLMOps Evaluation", "Vector Databases"],
    highlights: ["Working Python code", "API patterns", "Cost tracking", "Production patterns"],
  },
  {
    academy: "data", label: "Data Analytics Labs", icon: "📊", color: "#06B6D4",
    interface: "Code Editor",
    description: "Pandas data analysis, Power BI DAX, and SQL analytics",
    topics: ["Pandas DataFrames", "Data Cleaning", "Aggregation & Pivot", "Time Series Analysis", "DAX Measures", "Tableau LOD"],
    highlights: ["Real datasets", "Step-by-step analysis", "Common patterns", "Interview Q&A"],
  },
  {
    academy: "security", label: "Security Labs", icon: "🛡️", color: "#EF4444",
    interface: "Terminal",
    description: "Security scanning, network analysis, and threat detection",
    topics: ["Trivy Vulnerability Scanning", "Gitleaks Secret Detection", "nmap Port Scanning", "TLS Certificate Analysis", "Log Analysis", "SIEM Queries"],
    highlights: ["Authorized practice only", "Real tool commands", "Detection patterns", "MITRE ATT&CK mapping"],
  },
];

const quizCategories = [
  { academy: "exams", label: "Competitive Exams", icon: "📝", color: "#F59E0B", topics: ["GATE CSE", "JEE Maths/Physics/Chemistry", "NEET Biology/Physics", "UPSC Prelims & Mains", "Banking (IBPS/SBI)", "SSC CGL", "RRB NTPC"] },
  { academy: "healthcare", label: "Medical Coding", icon: "🏥", color: "#10B981", topics: ["ICD-10-CM", "CPT Codes", "HCPCS Level II", "Coding Guidelines", "Home Health Coding", "Mock Exams"] },
  { academy: "essentials", label: "Life Essentials", icon: "💡", color: "#8B5CF6", topics: ["Nutrition", "Mental Health", "First Aid", "Personal Finance", "Hygiene", "Gut Health"] },
  { academy: "education", label: "CS Education", icon: "🎓", color: "#3B82F6", topics: ["Data Structures & Algorithms", "Operating Systems", "DBMS", "Computer Networks", "System Design", "Java & C++"] },
];

export default function LabsPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "64px" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "20px" }}>
          <FlaskConical size={14}/> Interactive Practice
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Hands-On Labs
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "580px", margin: "0 auto 32px", lineHeight: 1.7 }}>
          Practice with interactive environments — terminal simulation, SQL console, code editor, and MCQ quizzes. No setup required.
        </p>
        <div style={{ display: "flex", gap: "12px", justifyContent: "center", flexWrap: "wrap" }}>
          {[
            { icon: <Terminal size={14}/>, label: "Terminal Labs" },
            { icon: <Code2 size={14}/>, label: "Code Editor" },
            { icon: <Database size={14}/>, label: "SQL Console" },
            { icon: <BookOpen size={14}/>, label: "MCQ Quizzes" },
          ].map(item => (
            <div key={item.label} style={{ display: "flex", alignItems: "center", gap: "6px", background: "var(--bg-1)", border: "1px solid var(--border)", padding: "8px 16px", borderRadius: "8px", fontSize: "13px" }}>
              {item.icon} {item.label}
            </div>
          ))}
        </div>
      </div>

      {/* Terminal/Code/SQL Labs */}
      <div style={{ marginBottom: "64px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "8px", display: "flex", alignItems: "center", gap: "10px" }}>
          <Terminal size={22}/> Interactive Lab Environments
        </h2>
        <p style={{ color: "var(--text-4)", marginBottom: "24px", fontSize: "15px" }}>
          Simulate real commands, write and run code, execute SQL — all in the browser with guided step-by-step labs
        </p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(360px, 1fr))", gap: "20px" }}>
          {labCategories.map(cat => (
            <div key={cat.academy} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "16px" }}>
                <div style={{ display: "flex", gap: "12px", alignItems: "center" }}>
                  <span style={{ fontSize: "28px" }}>{cat.icon}</span>
                  <div>
                    <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "2px" }}>{cat.label}</h3>
                    <span style={{ background: `${cat.color}22`, color: cat.color, padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 600 }}>{cat.interface}</span>
                  </div>
                </div>
              </div>
              <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "16px", lineHeight: 1.6 }}>{cat.description}</p>
              <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "16px" }}>
                {cat.topics.slice(0, 4).map(t => (
                  <span key={t} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "2px 8px", borderRadius: "4px", fontSize: "11px", color: "var(--text-4)" }}>{t}</span>
                ))}
                {cat.topics.length > 4 && <span style={{ fontSize: "11px", color: "var(--text-4)", padding: "2px 4px" }}>+{cat.topics.length - 4} more</span>}
              </div>
              <Link href={`/academies/${cat.academy}`} style={{ display: "flex", alignItems: "center", gap: "6px", color: cat.color, textDecoration: "none", fontSize: "13px", fontWeight: 600 }}>
                Open Labs <ArrowRight size={13}/>
              </Link>
            </div>
          ))}
        </div>
      </div>

      {/* Quiz/Flashcard section */}
      <div>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "8px", display: "flex", alignItems: "center", gap: "10px" }}>
          <Zap size={22}/> Quiz & Flashcard Practice
        </h2>
        <p style={{ color: "var(--text-4)", marginBottom: "24px", fontSize: "15px" }}>
          MCQ quizzes and flashcard sets for exam preparation, medical coding, and knowledge testing
        </p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {quizCategories.map(cat => (
            <Link key={cat.academy} href={`/academies/${cat.academy}`} style={{ textDecoration: "none" }}>
              <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px", height: "100%", transition: "border-color 0.2s" }}
                onMouseEnter={e => (e.currentTarget.style.borderColor = cat.color)}
                onMouseLeave={e => (e.currentTarget.style.borderColor = "var(--border)")}>
                <div style={{ fontSize: "28px", marginBottom: "12px" }}>{cat.icon}</div>
                <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "12px" }}>{cat.label}</h3>
                <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                  {cat.topics.map(t => (
                    <span key={t} style={{ background: `${cat.color}15`, color: cat.color, padding: "2px 7px", borderRadius: "4px", fontSize: "10px", fontWeight: 600 }}>{t}</span>
                  ))}
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
