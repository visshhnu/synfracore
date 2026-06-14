export const runtime = "edge";
import { roadmaps } from "@/lib/data/navigation";
import { notFound } from "next/navigation";
import Link from "next/link";
import { Clock, ArrowRight, CheckCircle, BookOpen, Target, Award } from "lucide-react";

type Props = { params: Promise<{ slug: string }> };

const roadmapDetails: Record<string, {
  description: string;
  skills: string[];
  techLinks: { name: string; academy: string; slug: string }[];
  salaryRange: string;
  jobTitles: string[];
}> = {
  "devops-engineer": {
    description: "Master the tools and practices that modern engineering teams use to ship software fast and reliably. DevOps engineers are among the most in-demand and highest-paid roles in tech.",
    skills: ["Linux administration", "Docker & Kubernetes", "CI/CD pipelines", "Cloud (AWS/Azure/GCP)", "Infrastructure as Code", "Monitoring & Observability"],
    techLinks: [
      { name: "Linux", academy: "devops", slug: "linux" },
      { name: "Git", academy: "devops", slug: "git" },
      { name: "Shell Scripting", academy: "devops", slug: "shell-scripting" },
      { name: "Docker", academy: "devops", slug: "docker" },
      { name: "Kubernetes", academy: "devops", slug: "kubernetes" },
      { name: "Terraform", academy: "devops", slug: "terraform" },
      { name: "Ansible", academy: "devops", slug: "ansible" },
      { name: "Jenkins / CI/CD", academy: "devops", slug: "jenkins" },
      { name: "Prometheus", academy: "devops", slug: "prometheus" },
      { name: "AWS", academy: "cloud", slug: "aws-ec2" },
    ],
    salaryRange: "₹8L – ₹35L (India) | $90K – $160K (US)",
    jobTitles: ["DevOps Engineer", "Platform Engineer", "Site Reliability Engineer", "Infrastructure Engineer"],
  },
  "cloud-architect": {
    description: "Design and build scalable, secure, and cost-effective cloud infrastructure. Cloud architects own the big picture — how all the pieces fit together across AWS, Azure, or GCP.",
    skills: ["Multi-cloud architecture", "Networking & security", "High availability design", "Cost optimization", "Migration strategy", "Compliance & governance"],
    techLinks: [
      { name: "AWS EC2", academy: "cloud", slug: "aws-ec2" },
      { name: "AWS VPC", academy: "cloud", slug: "aws-vpc" },
      { name: "AWS IAM", academy: "cloud", slug: "aws-iam" },
      { name: "AWS EKS", academy: "cloud", slug: "aws-eks" },
      { name: "Azure VMs", academy: "cloud", slug: "azure-vms" },
      { name: "Azure AKS", academy: "cloud", slug: "azure-aks" },
      { name: "GKE", academy: "cloud", slug: "gke" },
      { name: "Terraform", academy: "devops", slug: "terraform" },
      { name: "Cost Optimization", academy: "cloud", slug: "cost-optimization" },
      { name: "Cloud Security", academy: "cloud", slug: "cloud-security" },
    ],
    salaryRange: "₹15L – ₹60L (India) | $130K – $200K (US)",
    jobTitles: ["Cloud Architect", "Solutions Architect", "Cloud Engineer", "Principal Engineer"],
  },
  "platform-engineer": {
    description: "Build the internal developer platform that other engineers build on. Platform engineers create the golden path — making it easy to do the right thing in production.",
    skills: ["Kubernetes advanced", "GitOps", "Service mesh", "Developer tooling", "Observability", "Self-service platforms"],
    techLinks: [
      { name: "Kubernetes", academy: "devops", slug: "kubernetes" },
      { name: "Helm", academy: "devops", slug: "helm" },
      { name: "ArgoCD", academy: "devops", slug: "argocd" },
      { name: "Terraform", academy: "devops", slug: "terraform" },
      { name: "Prometheus", academy: "devops", slug: "prometheus" },
      { name: "Grafana", academy: "devops", slug: "grafana" },
      { name: "ELK Stack", academy: "devops", slug: "elk-stack" },
      { name: "Nginx", academy: "devops", slug: "nginx" },
    ],
    salaryRange: "₹20L – ₹80L (India) | $140K – $220K (US)",
    jobTitles: ["Platform Engineer", "Senior DevOps Engineer", "Infrastructure Lead", "Staff Engineer"],
  },
  "ai-engineer": {
    description: "Build AI-powered applications using large language models, RAG systems, and autonomous agents. The fastest-growing engineering role of the decade.",
    skills: ["LLM APIs (Claude, GPT-4)", "Prompt engineering", "RAG & vector databases", "AI agents & tools", "LLMOps & evaluation", "Python ML ecosystem"],
    techLinks: [
      { name: "AI Fundamentals", academy: "ai", slug: "ai-fundamentals" },
      { name: "Prompt Engineering", academy: "ai", slug: "prompt-engineering" },
      { name: "LangChain", academy: "ai", slug: "langchain" },
      { name: "RAG Systems", academy: "ai", slug: "rag" },
      { name: "AI Agents", academy: "ai", slug: "ai-agents" },
      { name: "OpenAI / Claude API", academy: "ai", slug: "openai" },
      { name: "LLMOps", academy: "ai", slug: "llmops" },
      { name: "Python", academy: "devops", slug: "python" },
    ],
    salaryRange: "₹18L – ₹80L (India) | $150K – $300K (US)",
    jobTitles: ["AI Engineer", "ML Engineer", "LLM Engineer", "AI Product Engineer"],
  },
  "data-analyst": {
    description: "Turn raw data into business insights that drive decisions. Data analysts are essential in every company — from startups to enterprises.",
    skills: ["SQL (advanced)", "Python & Pandas", "Excel & Power Query", "Data visualization", "Power BI / Tableau", "Statistical analysis"],
    techLinks: [
      { name: "Excel", academy: "data", slug: "excel" },
      { name: "SQL Mastery", academy: "databases", slug: "sql" },
      { name: "Python & Pandas", academy: "data", slug: "pandas" },
      { name: "Power BI", academy: "data", slug: "power-bi" },
      { name: "Tableau", academy: "data", slug: "tableau" },
      { name: "PostgreSQL", academy: "databases", slug: "postgresql" },
    ],
    salaryRange: "₹5L – ₹25L (India) | $60K – $120K (US)",
    jobTitles: ["Data Analyst", "Business Analyst", "BI Developer", "Analytics Engineer"],
  },
  "database-engineer": {
    description: "Design, build, and maintain the databases that power modern applications. Database engineers are essential at every company — from early-stage startups to banks processing millions of transactions per second.",
    skills: ["Relational databases (PostgreSQL, MySQL)", "NoSQL (MongoDB, Redis, Cassandra)", "Database design & normalization", "Query optimization & indexing", "Replication & high availability", "Cloud databases (RDS, Aurora, Cosmos DB)"],
    techLinks: [
      { name: "PostgreSQL", academy: "databases", slug: "postgresql" },
      { name: "MySQL", academy: "databases", slug: "mysql" },
      { name: "Redis", academy: "databases", slug: "redis" },
      { name: "MongoDB", academy: "databases", slug: "mongodb" },
      { name: "Cassandra", academy: "databases", slug: "cassandra" },
      { name: "Elasticsearch", academy: "databases", slug: "elasticsearch" },
      { name: "DynamoDB", academy: "databases", slug: "dynamodb" },
      { name: "SQL Mastery", academy: "databases", slug: "sql" },
    ],
    salaryRange: "₹8L – ₹35L (India) | $100K – $170K (US)",
    jobTitles: ["Database Engineer", "Database Administrator", "Data Infrastructure Engineer", "Backend Engineer (Data)"],
  },
  "data-engineer": {
    description: "Build the pipelines, warehouses, and infrastructure that move and transform data at scale. Data engineers are the plumbers of the data world — without them, data scientists have no data to work with.",
    skills: ["Python & Pandas", "SQL (advanced analytics)", "Apache Kafka (streaming)", "Airflow (orchestration)", "dbt (transformation)", "Cloud data warehouses (Redshift, BigQuery, Snowflake)", "Spark basics"],
    techLinks: [
      { name: "Python & Pandas", academy: "data", slug: "pandas" },
      { name: "SQL Analytics", academy: "databases", slug: "sql" },
      { name: "PostgreSQL", academy: "databases", slug: "postgresql" },
      { name: "Kafka", academy: "devops", slug: "elk-stack" },
      { name: "Elasticsearch", academy: "databases", slug: "elasticsearch" },
      { name: "BigQuery", academy: "cloud", slug: "bigquery" },
      { name: "Power BI", academy: "data", slug: "power-bi" },
      { name: "MongoDB", academy: "databases", slug: "mongodb" },
    ],
    salaryRange: "₹10L – ₹40L (India) | $110K – $180K (US)",
    jobTitles: ["Data Engineer", "Analytics Engineer", "Data Platform Engineer", "ETL Developer"],
  },
  "healthcare-coder": {
    description: "Medical coding converts patient diagnoses and procedures into standardized codes used for billing and insurance. Certified coders are in high demand across hospitals, clinics, and remote coding companies worldwide.",
    skills: ["ICD-10-CM diagnosis coding", "CPT procedure coding", "HCPCS Level II codes", "Medical terminology & anatomy", "Coding conventions & guidelines", "Home health OASIS & PDGM", "Compliance & audit defense"],
    techLinks: [
      { name: "ICD-10-CM", academy: "healthcare", slug: "icd-10-cm" },
      { name: "CPT Codes", academy: "healthcare", slug: "cpt" },
      { name: "HCPCS Level II", academy: "healthcare", slug: "hcpcs" },
      { name: "Coding Guidelines", academy: "healthcare", slug: "coding-guidelines" },
      { name: "Mock Exams (CPC)", academy: "healthcare", slug: "mock-exams" },
      { name: "Home Health Coding", academy: "healthcare", slug: "home-health-coding" },
      { name: "Patient Documentation", academy: "healthcare", slug: "patient-documentation" },
      { name: "Healthcare Admin", academy: "healthcare", slug: "healthcare-admin" },
    ],
    salaryRange: "₹3L – ₹12L (India) | $45K – $75K (US) | Remote-friendly",
    jobTitles: ["Medical Coder", "Certified Professional Coder (CPC)", "Home Health Coder", "Medical Billing Specialist"],
  },
  "sre-engineer": {
    description: "Site Reliability Engineers bridge software engineering and operations — ensuring production systems are fast, reliable, and self-healing. SREs are among the highest-paid engineers at top tech companies.",
    skills: ["SLOs, SLIs & error budgets", "On-call incident management", "Kubernetes production operations", "Observability (metrics, logs, traces)", "Chaos engineering & resilience testing", "Automation & toil reduction", "Capacity planning & cost optimization"],
    techLinks: [
      { name: "Linux", academy: "devops", slug: "linux" },
      { name: "Kubernetes", academy: "devops", slug: "kubernetes" },
      { name: "Prometheus", academy: "devops", slug: "prometheus" },
      { name: "Grafana", academy: "devops", slug: "grafana" },
      { name: "ELK Stack", academy: "devops", slug: "elk-stack" },
      { name: "Datadog", academy: "devops", slug: "datadog" },
      { name: "Python Automation", academy: "devops", slug: "python" },
      { name: "Terraform", academy: "devops", slug: "terraform" },
    ],
    salaryRange: "₹20L – ₹90L (India) | $150K – $250K (US)",
    jobTitles: ["Site Reliability Engineer", "SRE", "Production Engineer", "Infrastructure Engineer", "Platform SRE"],
  },
  "security-engineer": {
    description: "Protect systems and data from threats. Security engineers design defenses, detect attacks, and respond to incidents. Demand is extremely high and growing.",
    skills: ["Network security", "Cloud security posture", "SIEM & threat detection", "Penetration testing", "Identity & access management", "Incident response"],
    techLinks: [
      { name: "Security Fundamentals", academy: "security", slug: "security-fundamentals" },
      { name: "Network Security", academy: "security", slug: "network-security" },
      { name: "Cloud Security", academy: "cloud", slug: "cloud-security" },
      { name: "SIEM", academy: "security", slug: "siem" },
      { name: "SOC Operations", academy: "security", slug: "soc" },
      { name: "Ethical Hacking", academy: "security", slug: "ethical-hacking" },
    ],
    salaryRange: "₹10L – ₹45L (India) | $100K – $180K (US)",
    jobTitles: ["Security Engineer", "Cloud Security Engineer", "SOC Analyst", "Penetration Tester"],
  },
};

export default async function RoadmapDetailPage({ params }: Props) {
  const { slug } = await params;
  const roadmap = roadmaps.find((r) => r.slug === slug);
  if (!roadmap) notFound();
  const details = roadmapDetails[slug];

  const stepColors = ["#3B82F6","#8B5CF6","#EC4899","#F59E0B","#10B981","#06B6D4","#EF4444","#84CC16"];

  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "40px 24px" }}>
      {/* Back */}
      <Link href="/roadmaps" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", display: "inline-flex", alignItems: "center", gap: "4px", marginBottom: "32px" }}>
        ← All Roadmaps
      </Link>

      {/* Header */}
      <div style={{ marginBottom: "40px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "16px", flexWrap: "wrap" }}>
          <span style={{ fontSize: "52px" }}>{roadmap.icon}</span>
          <div>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "6px" }}>
              {roadmap.title} Roadmap
            </h1>
            <div style={{ display: "flex", gap: "12px", alignItems: "center", flexWrap: "wrap" }}>
              <span style={{ display: "flex", alignItems: "center", gap: "5px", color: "var(--text-4)", fontSize: "14px" }}>
                <Clock size={14}/> {roadmap.duration} to complete
              </span>
              {details?.salaryRange && (
                <span style={{ background: "#10B98122", color: "#10B981", padding: "3px 10px", borderRadius: "6px", fontSize: "12px", fontWeight: 600 }}>
                  💰 {details.salaryRange}
                </span>
              )}
            </div>
          </div>
        </div>
        {details?.description && (
          <p style={{ color: "var(--text-3)", fontSize: "16px", lineHeight: 1.7, maxWidth: "720px" }}>{details.description}</p>
        )}
      </div>

      <div style={{ display: "grid", gridTemplateColumns: details ? "1fr 320px" : "1fr", gap: "32px", alignItems: "start" }}>
        {/* Main: Steps */}
        <div>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "24px" }}>
            Learning Path
          </h2>
          <div>
            {roadmap.steps.map((step, i) => (
              <div key={step} style={{ display: "flex", gap: "20px", marginBottom: "8px", position: "relative" }}>
                {i < roadmap.steps.length - 1 && (
                  <div style={{ position: "absolute", left: "19px", top: "48px", bottom: "-8px", width: "2px", background: "var(--border)", zIndex: 0 }}/>
                )}
                <div style={{ width: "40px", height: "40px", borderRadius: "50%", background: stepColors[i % stepColors.length], display: "flex", alignItems: "center", justifyContent: "center", fontSize: "14px", fontWeight: 700, color: "#fff", flexShrink: 0, zIndex: 1, marginTop: "8px" }}>
                  {i + 1}
                </div>
                <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "16px 20px", flexGrow: 1, marginBottom: "8px" }}>
                  <h3 style={{ fontSize: "16px", fontWeight: 700, marginBottom: "4px" }}>{step}</h3>
                  <p style={{ color: "var(--text-4)", fontSize: "13px" }}>Phase {i + 1} of {roadmap.steps.length}</p>
                </div>
              </div>
            ))}
          </div>

          {/* Skills you'll build */}
          {details?.skills && (
            <div style={{ marginTop: "32px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "16px", display: "flex", alignItems: "center", gap: "8px" }}>
                <Target size={18}/> Skills You'll Build
              </h3>
              <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))", gap: "10px" }}>
                {details.skills.map(skill => (
                  <div key={skill} style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "14px", color: "var(--text-3)" }}>
                    <CheckCircle size={14} color="#10B981" style={{ flexShrink: 0 }}/>{skill}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Job titles */}
          {details?.jobTitles && (
            <div style={{ marginTop: "20px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "16px", display: "flex", alignItems: "center", gap: "8px" }}>
                <Award size={18}/> Job Titles You Can Target
              </h3>
              <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
                {details.jobTitles.map(title => (
                  <span key={title} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "6px 16px", borderRadius: "20px", fontSize: "13px", fontWeight: 600 }}>{title}</span>
                ))}
              </div>
            </div>
          )}
        </div>

        {/* Sidebar: Tech links */}
        {details?.techLinks && (
          <div style={{ position: "sticky", top: "80px" }}>
            <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px", marginBottom: "20px" }}>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "16px", display: "flex", alignItems: "center", gap: "8px" }}>
                <BookOpen size={16}/> Start Learning
              </h3>
              <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
                {details.techLinks.map((tech, i) => (
                  <Link key={tech.slug} href={`/academies/${tech.academy}/${tech.slug}/overview`}
                    style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "10px 14px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", textDecoration: "none", color: "var(--text-2)", fontSize: "14px", fontWeight: 500, transition: "all 0.15s" }}>
                    <span style={{ display: "flex", alignItems: "center", gap: "10px" }}>
                      <span style={{ width: "22px", height: "22px", borderRadius: "50%", background: stepColors[i % stepColors.length] + "33", color: stepColors[i % stepColors.length], display: "flex", alignItems: "center", justifyContent: "center", fontSize: "11px", fontWeight: 700, flexShrink: 0 }}>{i + 1}</span>
                      {tech.name}
                    </span>
                    <ArrowRight size={13} color="var(--text-4)"/>
                  </Link>
                ))}
              </div>
            </div>

            {/* CTA */}
            <div style={{ background: "linear-gradient(135deg, rgba(59,130,246,0.15), rgba(139,92,246,0.15))", border: "1px solid rgba(59,130,246,0.25)", borderRadius: "16px", padding: "24px", textAlign: "center" }}>
              <div style={{ fontSize: "32px", marginBottom: "12px" }}>🚀</div>
              <h4 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "8px" }}>Ready to start?</h4>
              <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "16px", lineHeight: 1.6 }}>
                Begin with step 1. Consistent practice beats cramming every time.
              </p>
              <Link href={`/academies/${details.techLinks[0]?.academy}/${details.techLinks[0]?.slug}/overview`}
                style={{ display: "inline-flex", alignItems: "center", gap: "6px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "10px 20px", borderRadius: "10px", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
                Begin Step 1 <ArrowRight size={14}/>
              </Link>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
