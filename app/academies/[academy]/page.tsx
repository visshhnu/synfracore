export const runtime = "edge";
import Link from "next/link";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { getAcademy } from "@/lib/data/academies";
import { ArrowRight, CheckCircle, Clock, BookOpen, FlaskConical, Trophy } from "lucide-react";

type Props = { params: Promise<{ academy: string }> };

const academyMeta: Record<string, {
  desc: string;
  who: string[];
  prereqs: string[];
  outcomes: string[];
  path: { phase: string; topics: string[]; duration: string }[];
  jobs: string[];
  proofStats: { label: string; value: string }[];
}> = {
  devops: {
    desc: "Master the complete DevOps toolchain — from containers and orchestration to CI/CD pipelines, infrastructure as code, and production monitoring. Built for engineers who want to move fast without breaking things.",
    who: ["Software engineers moving into platform/infra roles", "Sysadmins modernising to cloud-native", "Backend devs wanting DevOps skills", "Students targeting DevOps interviews"],
    prereqs: ["Basic Linux command line", "Familiarity with any programming language", "Understanding of web applications"],
    outcomes: [
      "Deploy and manage containerised applications with Docker and Kubernetes",
      "Build CI/CD pipelines with Jenkins, GitHub Actions, and ArgoCD",
      "Provision infrastructure with Terraform and configure with Ansible",
      "Monitor production systems with Prometheus and Grafana",
      "Pass CKA, CKAD, and Terraform Associate certifications",
    ],
    path: [
      { phase: "Foundation", topics: ["Linux", "Shell Scripting", "Git", "Networking basics"], duration: "3–4 weeks" },
      { phase: "Containers", topics: ["Docker", "Docker Compose", "Container security"], duration: "2–3 weeks" },
      { phase: "Orchestration", topics: ["Kubernetes", "Helm", "ArgoCD", "GitOps"], duration: "4–6 weeks" },
      { phase: "CI/CD", topics: ["Jenkins", "GitHub Actions", "GitLab CI", "Tekton"], duration: "2–3 weeks" },
      { phase: "IaC", topics: ["Terraform", "Ansible", "Pulumi"], duration: "3–4 weeks" },
      { phase: "Monitoring", topics: ["Prometheus", "Grafana", "Loki", "Alertmanager"], duration: "2–3 weeks" },
    ],
    jobs: ["DevOps Engineer", "Platform Engineer", "SRE", "Cloud Engineer", "Infrastructure Engineer"],
    proofStats: [{ label: "Technologies", value: "25+" }, { label: "Interview Q&As", value: "200+" }, { label: "Certifications", value: "4" }],
  },
  cloud: {
    desc: "Become a cloud architect across AWS, Azure, and GCP. From core services to advanced patterns — VPCs, IAM, serverless, containers, cost optimisation, and multi-cloud strategy.",
    who: ["DevOps engineers expanding to cloud", "On-premise engineers migrating to cloud", "Solution architects seeking cloud expertise", "Anyone targeting cloud certifications"],
    prereqs: ["Basic networking concepts (TCP/IP, DNS, HTTP)", "Linux fundamentals", "Basic scripting"],
    outcomes: [
      "Design and deploy cloud architectures on AWS, Azure, and GCP",
      "Build secure, highly available, and cost-optimised cloud infrastructure",
      "Implement multi-cloud and hybrid strategies",
      "Pass AWS SAA, AZ-104, and GCP ACE certifications",
    ],
    path: [
      { phase: "Cloud Fundamentals", topics: ["What is cloud", "Shared responsibility", "Regions and AZs"], duration: "1 week" },
      { phase: "AWS Core", topics: ["EC2", "S3", "VPC", "IAM", "RDS", "Lambda"], duration: "4–6 weeks" },
      { phase: "Azure Core", topics: ["Azure VMs", "Azure AD", "AKS", "Azure DevOps"], duration: "3–4 weeks" },
      { phase: "GCP Core", topics: ["GCE", "GKE", "Cloud SQL", "Pub/Sub"], duration: "3–4 weeks" },
      { phase: "Advanced", topics: ["Multi-cloud", "FinOps", "Security", "DR/HA patterns"], duration: "3–4 weeks" },
    ],
    jobs: ["Cloud Architect", "Solutions Architect", "Cloud Engineer", "Cloud Consultant"],
    proofStats: [{ label: "Technologies", value: "15+" }, { label: "Certifications", value: "6" }, { label: "Architecture patterns", value: "30+" }],
  },
  ai: {
    desc: "Build production AI applications — from LLM fundamentals to RAG pipelines, AI agents, and LLMOps. Practical, engineering-focused, not just theory.",
    who: ["Software engineers building AI features", "Data scientists moving to ML engineering", "Backend devs integrating LLMs", "Anyone building AI-powered products"],
    prereqs: ["Python programming (intermediate)", "Basic understanding of APIs", "Familiarity with data structures"],
    outcomes: [
      "Build RAG pipelines with vector databases and embedding models",
      "Create autonomous AI agents with LangChain and LangGraph",
      "Deploy LLMs at scale with vLLM and model serving frameworks",
      "Implement LLMOps practices: evaluation, monitoring, and fine-tuning",
    ],
    path: [
      { phase: "LLM Fundamentals", topics: ["How LLMs work", "Prompt engineering", "OpenAI/Anthropic APIs"], duration: "1–2 weeks" },
      { phase: "RAG Systems", topics: ["Vector DBs", "Embeddings", "Retrieval strategies", "Chunking"], duration: "2–3 weeks" },
      { phase: "AI Agents", topics: ["ReAct agents", "Tool use", "LangChain", "LangGraph"], duration: "2–3 weeks" },
      { phase: "LLMOps", topics: ["Evaluation", "Monitoring", "Fine-tuning", "vLLM deployment"], duration: "2–3 weeks" },
    ],
    jobs: ["AI Engineer", "ML Engineer", "LLM Engineer", "AI Product Engineer"],
    proofStats: [{ label: "Interview Q&As", value: "80+" }, { label: "Projects", value: "10+" }, { label: "Topics", value: "40+" }],
  },
  security: {
    desc: "Comprehensive cybersecurity from ethical hacking to enterprise security operations. Build, break, and defend systems with real-world techniques.",
    who: ["Engineers wanting to specialise in security", "IT professionals moving to cybersecurity", "DevOps engineers adding security skills (DevSecOps)"],
    prereqs: ["Networking fundamentals", "Linux basics", "Basic programming knowledge"],
    outcomes: [
      "Perform penetration testing and vulnerability assessments",
      "Build and manage SIEM and SOC operations",
      "Implement DevSecOps practices in CI/CD pipelines",
      "Prepare for CEH, CISSP, and CompTIA Security+ certifications",
    ],
    path: [
      { phase: "Security Foundations", topics: ["CIA triad", "Threat modelling", "OWASP Top 10"], duration: "2 weeks" },
      { phase: "Network Security", topics: ["Firewalls", "IDS/IPS", "VPN", "Zero Trust"], duration: "2–3 weeks" },
      { phase: "AppSec", topics: ["SAST/DAST", "Secret scanning", "Container security"], duration: "2 weeks" },
      { phase: "Offensive", topics: ["Pen testing", "Ethical hacking", "Kali Linux"], duration: "3–4 weeks" },
      { phase: "Security Ops", topics: ["SIEM", "SOC", "Incident response"], duration: "2–3 weeks" },
    ],
    jobs: ["Security Engineer", "SOC Analyst", "Penetration Tester", "DevSecOps Engineer"],
    proofStats: [{ label: "Technologies", value: "20+" }, { label: "Certifications", value: "3" }, { label: "Lab scenarios", value: "50+" }],
  },
  healthcare: {
    desc: "Build a career in healthcare coding — ICD-10-CM, CPT, HCPCS, OASIS, PDGM, BCHHC certification, and healthcare administration.",
    who: ["Aspiring medical coders", "Healthcare admin professionals", "Clinical staff moving into coding", "Students targeting BCHHC, CPC, or RHIT certifications"],
    prereqs: ["Basic medical terminology (helpful but not required)", "Attention to detail"],
    outcomes: [
      "Code accurately using ICD-10-CM, CPT, and HCPCS code sets",
      "Understand PDGM and home health reimbursement models",
      "Prepare for BCHHC, CPC-H, and HCS-D certifications",
      "Work confidently with OASIS assessments and clinical documentation",
    ],
    path: [
      { phase: "Medical Coding Basics", topics: ["ICD-10-CM structure", "CPT fundamentals", "HCPCS Level II"], duration: "3–4 weeks" },
      { phase: "Home Health", topics: ["OASIS types", "PDGM factors", "Homebound criteria"], duration: "3–4 weeks" },
      { phase: "Specialised Coding", topics: ["Wound coding", "CVA sequela", "DM combos"], duration: "2–3 weeks" },
      { phase: "Certification Prep", topics: ["BCHHC mock exams", "Timed practice", "Weak area review"], duration: "2 weeks" },
    ],
    jobs: ["Medical Coder", "Home Health Coder", "HIM Professional", "CDI Specialist", "Medical Billing Specialist"],
    proofStats: [{ label: "Code sets", value: "3" }, { label: "Certifications", value: "5+" }, { label: "Practice cases", value: "50+" }],
  },
  essentials: {
    desc: "Practical life knowledge everyone needs — gut health, nutrition, mental wellness, personal finance, hygiene, and first aid.",
    who: ["Anyone who wants to live healthier", "Students building life skills", "Working professionals managing wellness", "Parents and caregivers"],
    prereqs: ["No prior knowledge required"],
    outcomes: [
      "Understand your gut microbiome and how nutrition affects your health",
      "Build sustainable mental health and stress management practices",
      "Apply first aid confidently in emergencies",
      "Take control of personal finance basics",
    ],
    path: [
      { phase: "Physical Health", topics: ["Gut health", "Nutrition", "Sleep"], duration: "2 weeks" },
      { phase: "Mental Wellness", topics: ["Stress management", "Mindfulness"], duration: "2 weeks" },
      { phase: "Safety", topics: ["CPR basics", "First aid", "Emergency response"], duration: "1 week" },
      { phase: "Finance", topics: ["Budgeting", "Saving", "Investment intro"], duration: "2 weeks" },
    ],
    jobs: [],
    proofStats: [{ label: "Topics", value: "20+" }, { label: "Evidence-based guides", value: "50+" }],
  },
  education: {
    desc: "Complete school and college preparation — CBSE/ICSE Class 6–12, core CS subjects, DSA, system design, and campus placement prep.",
    who: ["Class 6–12 students", "Engineering students", "Job seekers preparing for placements", "Anyone brushing up on CS fundamentals"],
    prereqs: ["No prior requirements for school topics", "Basic maths for CS subjects"],
    outcomes: [
      "Master Class 6–12 maths, science, and computer science",
      "Build strong DSA foundations for coding interviews",
      "Understand OS, DBMS, CN, and system design for GATE and placements",
      "Be placement-ready for campus drives",
    ],
    path: [
      { phase: "School Boards", topics: ["Maths", "Science", "Computer Science"], duration: "Ongoing" },
      { phase: "Core CS", topics: ["DSA", "OS", "DBMS", "Computer Networks"], duration: "8–12 weeks" },
      { phase: "Advanced", topics: ["System Design", "Java", "C++"], duration: "4–6 weeks" },
      { phase: "Placement Prep", topics: ["Aptitude", "Reasoning", "HR", "Coding rounds"], duration: "3–4 weeks" },
    ],
    jobs: ["Software Engineer", "Backend Developer", "Any campus placement role"],
    proofStats: [{ label: "Subjects", value: "15+" }, { label: "Practice problems", value: "500+" }],
  },
  exams: {
    desc: "Structured preparation for India's major competitive exams — JEE, NEET, GATE, Banking (SBI/IBPS), SSC CGL, RRB NTPC, UPSC, and Defence exams.",
    who: ["JEE/NEET aspirants", "GATE candidates", "Banking and government job seekers", "UPSC and defence exam aspirants"],
    prereqs: ["Class 10–12 level foundation for most exams"],
    outcomes: [
      "Crack JEE Main/Advanced with topic-wise mastery",
      "Qualify GATE CSE/ECE with structured subject preparation",
      "Clear banking exams with quantitative, reasoning, and awareness preparation",
      "Build UPSC foundation with GS, CSAT, and current affairs",
    ],
    path: [
      { phase: "Choose your exam", topics: ["JEE", "NEET", "GATE", "Banking", "UPSC", "SSC", "RRB"], duration: "Day 1" },
      { phase: "Subject mastery", topics: ["Topic-by-topic structured study"], duration: "3–6 months" },
      { phase: "Practice", topics: ["Previous year questions", "Mock tests", "Time management"], duration: "2–3 months" },
      { phase: "Revision", topics: ["Cheatsheets", "Formula lists", "Weak area focus"], duration: "Final month" },
    ],
    jobs: ["IIT/NIT seats", "MBBS seats", "M.Tech admissions", "Bank PO/Clerk", "Government officer"],
    proofStats: [{ label: "Exams covered", value: "10+" }, { label: "Practice questions", value: "1000+" }],
  },
};

const defaultMeta = {
  desc: "Structured learning with practice questions, guides, and preparation material.",
  who: ["Students and learners at all levels", "Working professionals upskilling", "Anyone motivated to learn"],
  prereqs: ["Basic familiarity with the subject", "Motivation to learn"],
  outcomes: ["Build strong foundational knowledge", "Apply learning through practice", "Prepare for assessments"],
  path: [],
  jobs: [],
  proofStats: [{ label: "Topics", value: "50+" }, { label: "Practice Q&As", value: "50+" }],
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { academy: aSlug } = await params;
  const academy = getAcademy(aSlug);
  if (!academy) return { title: "Academy | SynfraCore" };
  const m = academyMeta[aSlug] || defaultMeta;
  return {
    title: `${academy.title} Academy — Structured Learning Path | SynfraCore`,
    description: m.desc,
    alternates: { canonical: `https://synfracore.com/academies/${aSlug}` },
  };
}

export default async function AcademyPage({ params }: Props) {
  const { academy: aSlug } = await params;
  const academy = getAcademy(aSlug);
  if (!academy) redirect("/academies");
  const m = academyMeta[aSlug] || defaultMeta;

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "40px 24px" }}>

      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <Link href="/academies" style={{ color: "var(--text-4)", textDecoration: "none" }}>Academies</Link>›
        <span style={{ color: "var(--text-2)" }}>{academy.title}</span>
      </nav>

      {/* Hero */}
      <div style={{ marginBottom: "40px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "14px" }}>
          <span style={{ fontSize: "44px" }}>{academy.icon}</span>
          <div>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "32px", fontWeight: 800, marginBottom: "4px" }}>
              {academy.title} Academy
            </h1>
            <p style={{ color: academy.color, fontSize: "14px", fontWeight: 600 }}>{academy.subtitle}</p>
          </div>
        </div>
        <p style={{ color: "var(--text-3)", fontSize: "16px", maxWidth: "720px", lineHeight: 1.7, marginBottom: "24px" }}>{m.desc}</p>

        {/* Proof stats */}
        <div style={{ display: "flex", gap: "24px", flexWrap: "wrap" }}>
          {m.proofStats.map(s => (
            <div key={s.label} style={{ textAlign: "center", padding: "12px 20px", background: academy.color + "10", borderRadius: "10px", border: `1px solid ${academy.color}25` }}>
              <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "22px", fontWeight: 800, color: academy.color }}>{s.value}</div>
              <div style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 600 }}>{s.label}</div>
            </div>
          ))}
        </div>
      </div>

      {/* Two-column: Who + Prerequisites + Outcomes */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "20px", marginBottom: "40px" }}>

        {/* Who this is for */}
        <div style={{ padding: "24px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "14px", display: "flex", alignItems: "center", gap: "8px" }}>
            👤 Who This Is For
          </h2>
          {m.who.map((w, i) => (
            <div key={i} style={{ display: "flex", gap: "8px", marginBottom: "8px", fontSize: "13px", color: "var(--text-3)" }}>
              <span style={{ color: academy.color, fontWeight: 700, flexShrink: 0 }}>✓</span>{w}
            </div>
          ))}
        </div>

        {/* Prerequisites */}
        <div style={{ padding: "24px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "14px" }}>
            📋 Prerequisites
          </h2>
          {m.prereqs.map((p, i) => (
            <div key={i} style={{ display: "flex", gap: "8px", marginBottom: "8px", fontSize: "13px", color: "var(--text-3)" }}>
              <span style={{ color: "var(--text-4)", flexShrink: 0 }}>•</span>{p}
            </div>
          ))}
          {["devops","cloud","databases","ai","data","security"].includes(aSlug) && (
            <div style={{ marginTop: "14px", padding: "10px", background: "rgba(16,185,129,0.06)", borderRadius: "8px", fontSize: "12px", color: "#10B981" }}>
              💡 No prior experience? Start with <Link href="/academies/devops/linux" style={{ color: "#10B981", fontWeight: 700 }}>Linux Fundamentals</Link>
            </div>
          )}
        </div>
      </div>

      {/* What you'll be able to do */}
      <div style={{ padding: "24px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", marginBottom: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "16px" }}>
          🎯 What You'll Be Able to Do
        </h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))", gap: "10px" }}>
          {m.outcomes.map((o, i) => (
            <div key={i} style={{ display: "flex", gap: "10px", fontSize: "14px", color: "var(--text-2)", alignItems: "flex-start" }}>
              <CheckCircle size={15} color="#10B981" style={{ marginTop: "2px", flexShrink: 0 }} />
              <span>{o}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Learning path */}
      {m.path.length > 0 && (
        <div style={{ marginBottom: "40px" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "20px" }}>
            🗺️ Recommended Learning Path
          </h2>
          <div style={{ display: "flex", flexDirection: "column", gap: "0" }}>
            {m.path.map((phase, i) => (
              <div key={i} style={{ display: "flex", gap: "0", alignItems: "flex-start" }}>
                {/* Timeline */}
                <div style={{ display: "flex", flexDirection: "column", alignItems: "center", marginRight: "16px" }}>
                  <div style={{ width: "32px", height: "32px", borderRadius: "50%", background: academy.color, color: "white", display: "flex", alignItems: "center", justifyContent: "center", fontSize: "13px", fontWeight: 700, flexShrink: 0 }}>{i + 1}</div>
                  {i < m.path.length - 1 && <div style={{ width: "2px", background: "var(--border)", flex: 1, minHeight: "24px" }} />}
                </div>
                {/* Content */}
                <div style={{ paddingBottom: "24px", flex: 1 }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
                    <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{phase.phase}</span>
                    <span style={{ fontSize: "11px", color: "var(--text-4)", background: "var(--bg-2)", padding: "2px 8px", borderRadius: "20px", display: "flex", alignItems: "center", gap: "4px" }}>
                      <Clock size={10} /> {phase.duration}
                    </span>
                  </div>
                  <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                    {phase.topics.map(t => (
                      <span key={t} style={{ fontSize: "12px", padding: "3px 10px", borderRadius: "20px", background: academy.color + "12", color: academy.color, fontWeight: 600 }}>{t}</span>
                    ))}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Job roles */}
      {m.jobs.length > 0 && (
        <div style={{ padding: "20px 24px", borderRadius: "12px", background: "linear-gradient(135deg,rgba(59,130,246,0.06),rgba(139,92,246,0.06))", border: "1px solid rgba(59,130,246,0.15)", marginBottom: "40px", display: "flex", alignItems: "center", gap: "16px", flexWrap: "wrap" }}>
          <div style={{ fontWeight: 700, fontSize: "14px", color: "var(--text-1)", whiteSpace: "nowrap" }}>💼 Jobs you can target:</div>
          <div style={{ display: "flex", gap: "8px", flexWrap: "wrap" }}>
            {m.jobs.map(j => (
              <span key={j} style={{ fontSize: "12px", padding: "4px 12px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-2)", fontWeight: 600, border: "1px solid var(--border)" }}>{j}</span>
            ))}
          </div>
          <Link href="/career" style={{ marginLeft: "auto", color: "#3B82F6", fontSize: "13px", fontWeight: 700, textDecoration: "none", whiteSpace: "nowrap" }}>
            Salary guide →
          </Link>
        </div>
      )}

      {/* Domain grid */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "20px" }}>
        📚 Explore Topics
      </h2>
      {academy.domains.map((domain) => (
        <div key={domain.slug} style={{ marginBottom: "36px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "14px", paddingBottom: "10px", borderBottom: "1px solid var(--border)" }}>
            <span style={{ fontSize: "20px" }}>{domain.icon}</span>
            <div>
              <h3 style={{ fontSize: "16px", fontWeight: 700, margin: 0 }}>{domain.name}</h3>
              <p style={{ fontSize: "12px", color: "var(--text-4)", margin: 0 }}>{domain.description}</p>
            </div>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(240px, 1fr))", gap: "10px" }}>
            {domain.technologies.map((tech) => (
              <Link key={tech.slug} href={`/academies/${aSlug}/${tech.slug}`} style={{ textDecoration: "none" }}>
                <div className="card-hover" style={{ padding: "16px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "6px" }}>
                    <span style={{ fontSize: "20px" }}>{tech.icon}</span>
                    <span style={{ fontWeight: 600, fontSize: "13px" }}>{tech.name}</span>
                    <span style={{ marginLeft: "auto", fontSize: "10px", padding: "2px 6px", borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-4)" }}>{tech.level}</span>
                  </div>
                  <p style={{ fontSize: "12px", color: "var(--text-4)", lineHeight: 1.5, margin: 0 }}>{tech.description}</p>
                  {tech.tags && (
                    <div style={{ display: "flex", gap: "4px", flexWrap: "wrap", marginTop: "8px" }}>
                      {tech.tags.slice(0, 3).map((tag: string) => (
                        <span key={tag} style={{ fontSize: "10px", padding: "2px 6px", borderRadius: "10px", background: "var(--bg-2)", color: "var(--text-4)" }}>{tag}</span>
                      ))}
                    </div>
                  )}
                </div>
              </Link>
            ))}
          </div>
        </div>
      ))}

      {/* CTA */}
      <div style={{ textAlign: "center", padding: "40px 24px", borderTop: "1px solid var(--border)", marginTop: "20px" }}>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "10px" }}>Ready to start?</h3>
        <p style={{ color: "var(--text-3)", marginBottom: "20px" }}>Pick any topic above and begin learning today.</p>
        <div style={{ display: "flex", gap: "12px", justifyContent: "center", flexWrap: "wrap" }}>
          <Link href="/roadmaps" className="btn-primary">View Roadmap <ArrowRight size={15} /></Link>
          <Link href="/interview" className="btn-secondary">Interview Prep</Link>
        </div>
      </div>

    </div>
  );
}
