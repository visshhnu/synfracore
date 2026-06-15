export const runtime = "edge";
import Link from "next/link";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { getAcademy, getTechnology } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";
import SectionContent from "@/components/tech/SectionContent";
import LabsSection from "@/components/tech/LabsSection";

type Props = {
  params: Promise<{ academy: string; technology: string; section: string }>;
};

// Map slugs to clean display names for metadata
const techDisplayNames: Record<string, string> = {
  linux: "Linux", docker: "Docker", kubernetes: "Kubernetes", terraform: "Terraform",
  ansible: "Ansible", jenkins: "Jenkins", python: "Python", git: "Git",
  helm: "Helm", argocd: "ArgoCD", prometheus: "Prometheus", grafana: "Grafana",
  "elk-stack": "ELK Stack", nginx: "Nginx", networking: "Networking",
  "shell-scripting": "Shell Scripting", "aws-ec2": "AWS EC2", "aws-s3": "AWS S3",
  "aws-vpc": "AWS VPC", "aws-iam": "AWS IAM", "aws-rds": "AWS RDS",
  "aws-lambda": "AWS Lambda", "aws-eks": "AWS EKS", cloudformation: "CloudFormation",
  route53: "Route 53", "azure-entra": "Azure Entra ID", "azure-vms": "Azure VMs",
  "azure-vnets": "Azure VNets", "azure-aks": "Azure AKS", "azure-devops": "Azure DevOps",
  gke: "Google Kubernetes Engine", bigquery: "BigQuery", "cloud-run": "Cloud Run",
  "cloud-security": "Cloud Security", "cost-optimization": "Cost Optimization",
  "landing-zones": "Landing Zones", postgresql: "PostgreSQL", redis: "Redis",
  mongodb: "MongoDB", mysql: "MySQL", cassandra: "Cassandra", dynamodb: "DynamoDB",
  elasticsearch: "Elasticsearch", sql: "SQL", oracle: "Oracle",
  "ai-fundamentals": "AI Fundamentals", "prompt-engineering": "Prompt Engineering",
  langchain: "LangChain", rag: "RAG", "ai-agents": "AI Agents", llmops: "LLMOps",
  openai: "OpenAI API", excel: "Excel", pandas: "Pandas", "power-bi": "Power BI",
  tableau: "Tableau", "security-fundamentals": "Security Fundamentals",
  "network-security": "Network Security", "ethical-hacking": "Ethical Hacking",
  soc: "SOC", siem: "SIEM", "pen-testing": "Penetration Testing",
  "icd-10-cm": "ICD-10-CM Coding", cpt: "CPT Coding", hcpcs: "HCPCS Coding",
  "coding-guidelines": "Medical Coding Guidelines", "mock-exams": "Medical Coding Mock Exams",
  "home-health-coding": "Home Health Coding", "patient-documentation": "Patient Documentation",
  "healthcare-admin": "Healthcare Administration", "gut-health": "Gut Health",
  hygiene: "Hygiene", nutrition: "Nutrition", "mental-health": "Mental Health",
  "personal-finance": "Personal Finance", "first-aid": "First Aid",
  dsa: "Data Structures & Algorithms", "system-design": "System Design",
  os: "Operating Systems", dbms: "DBMS", cn: "Computer Networks",
  maths: "Mathematics", science: "Science", "cs-school": "Computer Science",
  "placement-prep": "Placement Preparation", java: "Java", "c-programming": "C Programming",
  cpp: "C++", "jee-maths": "JEE Mathematics", "jee-physics": "JEE Physics",
  "jee-chemistry": "JEE Chemistry", "neet-biology": "NEET Biology",
  "neet-physics": "NEET Physics", "neet-chemistry": "NEET Chemistry",
  "gate-cse": "GATE CSE", "gate-ece": "GATE ECE", "banking-exams": "Banking Exams",
  "ssc-cgl": "SSC CGL", "rrb-ntpc": "RRB NTPC", "upsc-prelims": "UPSC Prelims",
  "upsc-mains": "UPSC Mains",
};

const sectionDescriptions: Record<string, (tech: string) => string> = {
  overview: (t) => `What is ${t}? Architecture, core concepts, and why it matters in 2025. Complete overview for beginners and experienced engineers.`,
  fundamentals: (t) => `${t} fundamentals — core concepts, commands, and hands-on examples. Learn ${t} from scratch with real-world practice.`,
  intermediate: (t) => `Intermediate ${t} — real-world patterns, best practices, and deeper topics. Take your ${t} skills to the next level.`,
  advanced: (t) => `Advanced ${t} — production patterns, performance tuning, and security hardening. Expert-level ${t} for senior engineers.`,
  labs: (t) => `Hands-on ${t} labs — practice with real scenarios and environments. Build practical ${t} skills through doing.`,
  projects: (t) => `${t} projects for your portfolio — build real-world applications and demonstrate your ${t} expertise to employers.`,
  interview: (t) => `Top ${t} interview questions and answers — prepare for DevOps interviews with real questions asked at top companies.`,
  certification: (t) => `${t} certification guide — exam prep, practice questions, and study strategies to pass your ${t} certification.`,
  cheatsheets: (t) => `${t} cheatsheet — quick reference for commands, syntax, and patterns. Keep this open during your ${t} work.`,
  troubleshooting: (t) => `${t} troubleshooting guide — debug common issues with root cause analysis and production-tested fixes.`,
  roadmap: (t) => `${t} learning roadmap — structured step-by-step path from beginner to expert. Know exactly what to learn and in what order.`,
};

const sectionTitles: Record<string, string> = {
  overview: "Overview",
  fundamentals: "Fundamentals",
  intermediate: "Intermediate",
  advanced: "Advanced",
  labs: "Labs",
  projects: "Projects",
  interview: "Interview Q&A",
  certification: "Certification Guide",
  cheatsheets: "Cheatsheet",
  troubleshooting: "Troubleshooting",
  roadmap: "Learning Roadmap",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { academy: aSlug, technology: tSlug, section } = await params;
  const tech = getTechnology(aSlug, tSlug);
  const techName = tech?.name || techDisplayNames[tSlug] || tSlug.replace(/-/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
  const sectionLabel = sectionTitles[section] || section.replace(/-/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
  const descFn = sectionDescriptions[section];
  const description = descFn ? descFn(techName) : `${techName} ${sectionLabel} — learn ${techName} with real examples and hands-on practice at SynfraCore.`;

  const title = `${techName} ${sectionLabel}`;
  const canonicalUrl = `https://synfracore.com/academies/${aSlug}/${tSlug}/${section}`;

  return {
    title,
    description,
    keywords: [techName, sectionLabel, `learn ${techName}`, `${techName} tutorial`, `${techName} course`, "DevOps", "SynfraCore"],
    alternates: { canonical: canonicalUrl },
    openGraph: {
      title: `${techName} ${sectionLabel} | SynfraCore`,
      description,
      url: canonicalUrl,
      type: "article",
      siteName: "SynfraCore",
    },
    twitter: {
      card: "summary",
      title: `${techName} ${sectionLabel} | SynfraCore`,
      description,
    },
  };
}

export default async function SectionPage({ params }: Props) {
  const { academy: aSlug, technology: tSlug, section } = await params;
  const academy = getAcademy(aSlug);
  const tech = getTechnology(aSlug, tSlug);
  if (!academy || !tech) redirect("/academies");

  const sectionData = techSections.find((s) => s.slug === section);
  const currentIndex = techSections.findIndex((s) => s.slug === section);
  const prevSection = currentIndex > 0 ? techSections[currentIndex - 1] : null;
  const nextSection = currentIndex < techSections.length - 1 ? techSections[currentIndex + 1] : null;

  const isLabs = section === "labs";

  return (
    <div style={{ display: "flex", gap: "0", minHeight: "80vh" }}>
      {/* Sidebar */}
      <aside
        style={{
          width: "260px",
          flexShrink: 0,
          borderRight: "1px solid #1E2D47",
          background: "var(--bg-1)",
          padding: "24px 16px",
          position: "sticky",
          top: 0,
          height: "100vh",
          overflowY: "auto",
        }}
        className="sidebar-desktop"
      >
        <div style={{ marginBottom: "16px", paddingBottom: "16px", borderBottom: "1px solid var(--border)" }}>
          <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", fontSize: "12px", textDecoration: "none" }}>
            ← {academy.title}
          </Link>
          <div style={{ display: "flex", alignItems: "center", gap: "8px", marginTop: "10px" }}>
            <span style={{ fontSize: "20px" }}>{tech.icon}</span>
            <span style={{ fontWeight: 700, fontSize: "16px" }}>{tech.name}</span>
          </div>
        </div>
        <nav>
          {techSections.map((s) => (
            <Link
              key={s.slug}
              href={`/academies/${aSlug}/${tSlug}/${s.slug}`}
              style={{
                display: "flex",
                alignItems: "center",
                gap: "8px",
                padding: "8px 10px",
                borderRadius: "6px",
                marginBottom: "2px",
                textDecoration: "none",
                fontSize: "13px",
                fontWeight: s.slug === section ? 600 : 400,
                color: s.slug === section ? "var(--accent)" : "var(--text-3)",
                background: s.slug === section ? "var(--bg-2)" : "transparent",
              }}
            >
              <span style={{ fontSize: "14px" }}>{s.icon}</span>
              {s.label}
            </Link>
          ))}
        </nav>
      </aside>

      {/* Main content */}
      <main style={{ flex: 1, minWidth: 0, padding: "32px 24px" }}>
        {/* Breadcrumb */}
        <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "16px" }}>
          <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>
          {" / "}
          <Link href="/academies" style={{ color: "var(--text-4)", textDecoration: "none" }}>Academies</Link>
          {" / "}
          <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{academy.title}</Link>
          {" / "}
          <Link href={`/academies/${aSlug}/${tSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{tech.name}</Link>
          {" / "}
          <span style={{ color: "var(--text-2)" }}>{sectionData?.label || section}</span>
        </nav>

        <h1 style={{ fontSize: "28px", fontWeight: 700, marginBottom: "8px" }}>
          {tech.name} — {sectionData?.label || section}
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "14px", marginBottom: "28px" }}>
          {sectionData?.description}
        </p>

        {isLabs ? (
          <LabsSection academy={aSlug} technology={tSlug} techName={tech.name} accentColor={"#6366F1"} />
        ) : (
          <SectionContent
                academy={aSlug}
                technology={tSlug}
                section={section}
                techName={tech.name}
                techIcon={tech.icon}
                sectionLabel={sectionData?.label || section}
                accentColor="#6366F1"
              />
        )}

        {/* Prev / Next navigation */}
        <div style={{ display: "flex", justifyContent: "space-between", marginTop: "48px", paddingTop: "24px", borderTop: "1px solid var(--border)" }}>
          {prevSection ? (
            <Link href={`/academies/${aSlug}/${tSlug}/${prevSection.slug}`} style={{ display: "flex", alignItems: "center", gap: "6px", textDecoration: "none", color: "var(--text-3)", fontSize: "13px" }}>
              ← {prevSection.label}
            </Link>
          ) : <div />}
          {nextSection ? (
            <Link href={`/academies/${aSlug}/${tSlug}/${nextSection.slug}`} style={{ display: "flex", alignItems: "center", gap: "6px", textDecoration: "none", color: "var(--accent)", fontSize: "13px", fontWeight: 600 }}>
              {nextSection.label} →
            </Link>
          ) : <div />}
        </div>
      </main>
    </div>
  );
}
