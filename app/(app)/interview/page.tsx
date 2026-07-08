import Link from "next/link";
import { MessageSquare, ArrowRight, Star, Target, Zap } from "lucide-react";

export const metadata = {
  title: "Interview Preparation | SynfraCore",
  description: "1000+ DevOps, Cloud, Database and AI interview questions with detailed answers across 101 technologies.",
};

const interviewTracks = [
  {
    label: "DevOps & Platform", academy: "devops", color: "#3B82F6", icon: "⚙️",
    techs: [
      { name: "Linux", slug: "linux" }, { name: "Docker", slug: "docker" }, { name: "Kubernetes", slug: "kubernetes" },
      { name: "Terraform", slug: "terraform" }, { name: "Ansible", slug: "ansible" }, { name: "Jenkins", slug: "jenkins" },
      { name: "Git", slug: "git" }, { name: "ArgoCD", slug: "argocd" }, { name: "Prometheus", slug: "prometheus" },
      { name: "ELK Stack", slug: "elk-stack" }, { name: "Helm", slug: "helm" }, { name: "Nginx", slug: "nginx" },
    ],
  },
  {
    label: "Cloud (AWS/Azure/GCP)", academy: "cloud", color: "#F59E0B", icon: "☁️",
    techs: [
      { name: "AWS EC2", slug: "aws-ec2" }, { name: "AWS S3", slug: "aws-s3" }, { name: "AWS VPC", slug: "aws-vpc" },
      { name: "AWS IAM", slug: "aws-iam" }, { name: "AWS Lambda", slug: "aws-lambda" }, { name: "AWS EKS", slug: "aws-eks" },
      { name: "Azure VMs", slug: "azure-vms" }, { name: "Azure AKS", slug: "azure-aks" }, { name: "GKE", slug: "gke" },
      { name: "Cloud Security", slug: "cloud-security" }, { name: "CloudFormation", slug: "cloudformation" },
    ],
  },
  {
    label: "Databases", academy: "databases", color: "#10B981", icon: "🗄️",
    techs: [
      { name: "PostgreSQL", slug: "postgresql" }, { name: "MySQL", slug: "mysql" }, { name: "Redis", slug: "redis" },
      { name: "MongoDB", slug: "mongodb" }, { name: "Elasticsearch", slug: "elasticsearch" },
      { name: "Cassandra", slug: "cassandra" }, { name: "DynamoDB", slug: "dynamodb" }, { name: "SQL", slug: "sql" },
    ],
  },
  {
    label: "AI Engineering", academy: "ai", color: "#8B5CF6", icon: "🤖",
    techs: [
      { name: "AI Fundamentals", slug: "ai-fundamentals" }, { name: "Prompt Engineering", slug: "prompt-engineering" },
      { name: "LangChain", slug: "langchain" }, { name: "RAG Systems", slug: "rag" },
      { name: "AI Agents", slug: "ai-agents" }, { name: "LLMOps", slug: "llmops" },
    ],
  },
  {
    label: "Data Analytics", academy: "data", color: "#06B6D4", icon: "📊",
    techs: [
      { name: "SQL Analytics", slug: "sql" }, { name: "Pandas", slug: "pandas" },
      { name: "Power BI", slug: "power-bi" }, { name: "Tableau", slug: "tableau" },
    ],
  },
  {
    label: "Security", academy: "security", color: "#EF4444", icon: "🛡️",
    techs: [
      { name: "Security Fundamentals", slug: "security-fundamentals" },
      { name: "Network Security", slug: "network-security" },
      { name: "Ethical Hacking", slug: "ethical-hacking" },
      { name: "SOC", slug: "soc" }, { name: "SIEM", slug: "siem" },
    ],
  },
];

const tips = [
  { icon: "🎯", title: "STAR Method", desc: "Situation, Task, Action, Result — structure all behavioral answers" },
  { icon: "💡", title: "Think Out Loud", desc: "Interviewers want to hear your reasoning, not just the final answer" },
  { icon: "📐", title: "Draw It Out", desc: "Architecture questions: always sketch a diagram before explaining" },
  { icon: "❓", title: "Ask Clarifying Questions", desc: "Never assume — ask about scale, constraints, and use case" },
  { icon: "🔢", title: "Quantify Everything", desc: '"Reduced deploy time by 60%" beats "made deployments faster"' },
  { icon: "⚠️", title: "Know Your Trade-offs", desc: "Every answer should mention pros, cons, and when NOT to use it" },
];

export default function InterviewPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ marginBottom: "64px", textAlign: "center" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "20px" }}>
          <MessageSquare size={14}/> Interview Preparation
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Interview Hub
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "560px", margin: "0 auto", lineHeight: 1.7 }}>
          1000+ curated interview questions across 101 technologies. Every topic has Beginner, Intermediate, and Advanced Q&amp;A.
        </p>
      </div>

      {/* Stats */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))", gap: "16px", marginBottom: "64px" }}>
        {[
          { value: "1000+", label: "Questions", icon: "❓" },
          { value: "101", label: "Technologies", icon: "🛠️" },
          { value: "3 Levels", label: "Beginner to Architect", icon: "📈" },
          { value: "Real Answers", label: "Not just questions", icon: "✅" },
        ].map(stat => (
          <div key={stat.label} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px", textAlign: "center" }}>
            <div style={{ fontSize: "24px", marginBottom: "6px" }}>{stat.icon}</div>
            <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "20px", fontWeight: 800, color: "#3B82F6", marginBottom: "4px" }}>{stat.value}</div>
            <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{stat.label}</div>
          </div>
        ))}
      </div>

      {/* Interview Tracks */}
      {interviewTracks.map(track => (
        <div key={track.academy} style={{ marginBottom: "48px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "20px" }}>
            <span style={{ fontSize: "24px" }}>{track.icon}</span>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", flex: 1 }}>{track.label}</h2>
            <Link href={`/academies/${track.academy}`}
              style={{ background: `${track.color}15`, color: track.color, border: `1px solid ${track.color}33`, padding: "7px 14px", borderRadius: "8px", textDecoration: "none", fontSize: "13px", fontWeight: 600, flexShrink: 0 }}>
              All topics →
            </Link>
          </div>

          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))", gap: "10px" }}>
            {track.techs.map(tech => (
              <Link key={tech.slug} href={`/academies/${track.academy}/${tech.slug}/interview`}
                className="hover-link"
                style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "12px 16px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "10px", textDecoration: "none", color: "var(--text-2)", fontSize: "14px", fontWeight: 500 }}>
                {tech.name}
                <ArrowRight size={13} color="var(--text-4)"/>
              </Link>
            ))}
          </div>
        </div>
      ))}

      {/* Interview Tips */}
      <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "20px", padding: "40px", marginBottom: "48px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "22px", marginBottom: "8px", display: "flex", alignItems: "center", gap: "8px" }}>
          <Star size={20} color="#F59E0B"/> Interview Tips That Actually Work
        </h2>
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "28px" }}>From 1000+ mock interviews — what separates candidates who get offers</p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {tips.map(tip => (
            <div key={tip.title} style={{ display: "flex", gap: "14px" }}>
              <span style={{ fontSize: "20px", flexShrink: 0 }}>{tip.icon}</span>
              <div>
                <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "14px", marginBottom: "4px" }}>{tip.title}</div>
                <div style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6 }}>{tip.desc}</div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* AI Mock Interview CTA */}
      <div style={{ textAlign: "center", background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "48px 32px" }}>
        <Target size={36} style={{ margin: "0 auto 16px", color: "#3B82F6" }}/>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "26px", fontWeight: 800, marginBottom: "12px" }}>
          Practice with AI Mock Interviews
        </h2>
        <p style={{ color: "var(--text-4)", fontSize: "15px", maxWidth: "480px", margin: "0 auto 24px", lineHeight: 1.7 }}>
          Ask our AI to quiz you on any technology. It asks follow-up questions and gives feedback — just like a real interview.
        </p>
        <Link href="/ai-assistant" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
          <Zap size={16}/> Start AI Mock Interview
        </Link>
      </div>
    </div>
  );
}
