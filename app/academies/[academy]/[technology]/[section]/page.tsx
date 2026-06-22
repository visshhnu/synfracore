export const runtime = "edge";
import Link from "next/link";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { getAcademy, getTechnology } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";
import SectionContent from "@/components/tech/SectionContent";
import LabsSection from "@/components/tech/LabsSection";
import AuthorBadge from "@/components/tech/AuthorBadge";
import WhatNext from "@/components/tech/WhatNext";
import QuickQuiz from "@/components/tech/QuickQuiz";

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
  const isInterview = section === "interview";
  const isOverview = section === "overview";

  // Quiz questions for key sections
  const quizData: Record<string, { q: string; opts: string[]; ans: number; exp: string }[]> = {
    fundamentals: [
      { q: `What is the primary purpose of ${tech.name}?`, opts: ["Version control", "The correct answer depends on the technology — check the overview", "Database management", "Network routing"], ans: 1, exp: `${tech.name} is a specialized tool — its primary purpose is explained in the Overview section above.` },
      { q: "Which command is used to get help/documentation for most CLI tools?", opts: ["--help or -h flag", "man <command>", "info <command>", "All of the above"], ans: 3, exp: "Most Unix tools support --help/-h for quick help, man pages for detailed docs, and info for GNU tools. Always try --help first." },
    ],
    interview: [
      { q: `What is the most important concept to understand about ${tech.name} for interviews?`, opts: ["Its version history", "Core architecture and how components interact", "Exact syntax of every command", "Its license type"], ans: 1, exp: "Interviewers primarily test whether you understand how the system works architecturally — not syntax memorization. Explain the 'why' behind design decisions." },
      { q: "How should you answer a scenario question you're unsure about?", opts: ["Say you don't know and stop", "Think aloud: state your reasoning, what you'd check, and how you'd approach it", "Guess confidently", "Ask the interviewer for the answer"], ans: 1, exp: "Thinking aloud demonstrates problem-solving ability. Interviewers value your reasoning process as much as the correct answer. State assumptions, describe your approach, and ask clarifying questions." },
      { q: "Which best describes a production issue you've faced?", opts: ["Only mention successes", "Describe the problem, your diagnosis process, fix, and what you learned", "Avoid the question", "Give a very brief answer to avoid mistakes"], ans: 1, exp: "Interviewers love concrete examples. Use the STAR format (Situation, Task, Action, Result) and focus on your specific contribution and what you learned." },
    ],
    advanced: [
      { q: "What is the first step when optimizing a production system?", opts: ["Apply all optimizations immediately", "Measure first — identify the actual bottleneck with profiling/metrics", "Increase hardware resources", "Rewrite the system"], ans: 1, exp: "Premature optimization is a common mistake. Always measure to identify the actual bottleneck before making changes. Use metrics, profiling tools, and benchmarks to validate your findings." },
    ],
  };

  const currentQuiz = quizData[section] || null;

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

        {/* Author badge */}
        <AuthorBadge techName={tech.name} section={section} accentColor="#6366F1" />

        {/* Main content */}
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

        {/* Quick Quiz */}
        {currentQuiz && currentQuiz.length > 0 && (
          <div style={{ marginTop: "40px" }}>
            <QuickQuiz questions={currentQuiz} techName={tech.name} accentColor="#6366F1" />
          </div>
        )}

        {/* What's next */}
        <WhatNext
          academy={aSlug}
          technology={tSlug}
          currentSection={section}
          techName={tech.name}
          accentColor="#6366F1"
        />

        {/* Prev / Next navigation (simplified, WhatNext handles primary) */}
        <div style={{ display: "flex", justifyContent: "space-between", marginTop: "24px", paddingTop: "24px", borderTop: "1px solid var(--border)" }}>
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
