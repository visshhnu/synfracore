import { academies, type Technology } from "./academies";
import { educationBoards } from "./education";
import { hasContent } from "@/lib/content";
import { hasLabsContent } from "@/lib/data/labs/existence";

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
  { slug: "overview", label: "Overview", icon: "📖", description: "What it is, why it matters, architecture and key concepts" },
  { slug: "prerequisites", label: "Prerequisites", icon: "✅", description: "What to know or set up before starting" },
  { slug: "installation", label: "Installation", icon: "⚙️", description: "Step-by-step setup and installation guide" },
  { slug: "fundamentals", label: "Fundamentals", icon: "🔤", description: "Core concepts and commands — hands-on from the start" },
  { slug: "intermediate", label: "Intermediate", icon: "⚡", description: "Real-world patterns, best practices, and deeper topics" },
  { slug: "advanced", label: "Advanced", icon: "🚀", description: "Production patterns, performance, security hardening" },
  { slug: "roadmap", label: "Roadmap", icon: "🗺️", description: "Step-by-step structured learning path from zero to expert" },
  { slug: "labs", label: "Labs", icon: "🧪", description: "Hands-on exercises with real environments and scenarios" },
  { slug: "projects", label: "Projects", icon: "🏗️", description: "Portfolio-ready projects to demonstrate your skills" },
  { slug: "interview", label: "Interview Q&A", icon: "💬", description: "Most asked interview questions with detailed answers" },
  { slug: "troubleshooting", label: "Troubleshooting", icon: "🔧", description: "Debug common issues with root cause analysis" },
  { slug: "certification", label: "Certification", icon: "🏆", description: "Exam guides, practice questions, and prep strategies" },
  { slug: "cheatsheets", label: "Cheatsheets", icon: "📋", description: "Quick reference — commands, syntax, and patterns" },
  { slug: "notes", label: "Notes", icon: "📝", description: "Key takeaways, tips, and important points to remember" },
  { slug: "pyq",                  label: "PYQ",       icon: "📝", description: "Previous Year Questions with detailed solutions" },
  { slug: "real-world-scenarios", label: "Real World", icon: "🌍", description: "Production stories, incidents, and how experts solve them" },
  { slug: "faq", label: "FAQ", icon: "❓", description: "Frequently asked questions and clear answers" },
];

// Maps "academySlug/technologySlug" to the question_papers.exam_type value
// (docs/question-bank-schema.sql: 'bchhc' | 'cpc' (future)) that technology's
// real practice exams are registered under. Drives the sidebar's conditional
// "Practice Exams" tab in app/academies/[academy]/[technology]/[section]/
// page.tsx — a technology only gets the tab if it has an entry here AND at
// least one matching row actually exists in question_papers (checked live,
// not assumed from this map alone). Extend this map, not the page component,
// when a new technology gets real question-bank papers (e.g. VLSI, AEE, CPC).
export const technologyExamTypeMap: Record<string, string> = {
  "healthcare/bchhc-prep": "bchhc",
  "healthcare/cpt": "cpt",
  "healthcare/ccs": "ccs",
  "devops/kubernetes": "kubernetes",
  "devops/terraform": "terraform",
  "devops/docker": "docker",
  "devops/ansible": "ansible",
  "central-exams/hal-trainee-prep": "hal-trainee",
  "exams/neet-biology": "neet",
  "exams/neet-physics": "neet",
  "exams/neet-chemistry": "neet",
  "exams/neet-mocktests": "neet",
  "exams/jee-main": "jee-main",
  "exams/jee-physics": "jee-main",
  "exams/jee-chemistry": "jee-main",
  "exams/jee-maths": "jee-main",
};

// Same existence-check pattern as technologyExamTypeMap above, but for the
// PYQ + model-answer bank (docs/pyq-bank-schema.sql, app/pyq-bank/) instead
// of the MCQ question bank — a completely separate content type/route tree,
// deliberately not merged into technologyExamTypeMap even though both are
// "does this technology have premium papers" checks, since conflating the
// two would make it easy to link an essay-format subject into the MCQ
// attempt flow (or vice versa) by mistake. Extend this map, not the page
// component, when a new optional subject gets real PYQ collections.
export const technologyPyqSubjectMap: Record<string, string> = {
  "exams/upsc-geography": "geography",
};

// Same existence-check pattern as technologyExamTypeMap above, but keyed by
// certification id (app/certifications/[id]/page.tsx) instead of a
// technology tab — added 2026-08-30 to wire the question_papers that
// already exist (kubernetes/terraform/ansible exam_types) to the specific
// certification detail pages a learner would actually be studying for.
// One exam_type can map from several certification ids (the kubernetes
// papers aren't split by CKA vs CKAD vs KCNA vs CKS specifically — they're
// general Kubernetes practice questions relevant to all four). "docker"
// has real papers too but is deliberately NOT mapped here: there is no
// Docker Certified Associate (or any Docker cert) in the `certifications`
// list to map it to — extend `certifications` first if that's ever added,
// don't invent a mapping to a cert that doesn't exist on this page.
export const certificationExamTypeMap: Record<string, string> = {
  kcna: "kubernetes",
  cka: "kubernetes",
  ckad: "kubernetes",
  cks: "kubernetes",
  "terraform-associate": "terraform",
  rhce: "ansible",
  "aws-saa": "aws-saa",
  "comptia-sec-plus": "comptia-sec-plus",
};

// Presentation-only metadata for /question-bank's grouped catalog view
// (app/question-bank/page.tsx) — maps each exam_type to the academy-level
// group it belongs under and a human-readable label for its own
// sub-section within that group. Deliberately separate from the two maps
// above (which are existence-check gates for a specific page's sidebar/
// section, keyed by technology or certification id) — this one groups
// ALREADY-KNOWN-to-exist exam_types for display, keyed by exam_type
// itself. A new exam_type with real question_papers rows needs an entry
// here too, or it silently falls into the catch-all "Other" group added at
// render time in app/question-bank/page.tsx — extend this map, not the
// page component, when a new cert/technology ships real papers.
//
// One academy group can (and, per the roadmap tracker in
// docs/audit/12-practice-exam-coverage-rollout.md, will) hold multiple
// exam_types — Healthcare is planned to add CPT and CCS alongside BCHHC,
// the same pattern DevOps already uses for its four.
export const examTypeGroupMap: Record<string, { group: string; label: string }> = {
  bchhc: { group: "Healthcare", label: "BCHHC (Board Certified Home Health Coder)" },
  cpt: { group: "Healthcare", label: "CPT Coding Proficiency" },
  ccs: { group: "Healthcare", label: "CCS (Certified Coding Specialist, AHIMA)" },
  kubernetes: { group: "DevOps", label: "Kubernetes (CKA / CKAD / KCNA / CKS)" },
  terraform: { group: "DevOps", label: "Terraform (HashiCorp Certified)" },
  docker: { group: "DevOps", label: "Docker (DCA)" },
  ansible: { group: "DevOps", label: "Ansible (RHCE)" },
  "aws-saa": { group: "Cloud", label: "AWS Solutions Architect Associate" },
  "comptia-sec-plus": { group: "Security", label: "CompTIA Security+" },
  "hal-trainee": { group: "Central Govt Exams", label: "HAL Design/Management Trainee (DT/MT)" },
  neet: { group: "Competitive Exams", label: "NEET UG (Medical Entrance)" },
  "jee-main": { group: "Competitive Exams", label: "JEE Main (Engineering Entrance)" },
  "ssc-cgl": { group: "Competitive Exams", label: "SSC CGL (Combined Graduate Level)" },
  "ibps-po": { group: "Competitive Exams", label: "IBPS PO (Bank Probationary Officer)" },
};

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
  { id: "terraform-associate", name: "Terraform Associate", code: "004", provider: "HashiCorp", color: "#7B42BC", level: "Associate" },
  { id: "rhcsa", name: "Red Hat Certified System Administrator", code: "EX200", provider: "Red Hat", color: "#EE0000", level: "Professional" },
  { id: "rhce", name: "Red Hat Certified Engineer", code: "EX294", provider: "Red Hat", color: "#EE0000", level: "Expert" },
  { id: "aws-dop", name: "AWS DevOps Engineer Professional", code: "DOP-C02", provider: "AWS", color: "#FF9900", level: "Professional" },
  { id: "az-400", name: "Azure DevOps Engineer Expert", code: "AZ-400", provider: "Azure", color: "#0078D4", level: "Expert" },
  { id: "comptia-sec-plus", name: "CompTIA Security+", code: "SY0-701", provider: "CompTIA", color: "#EF4444", level: "Associate" },
  { id: "ceh", name: "Certified Ethical Hacker", code: "CEH", provider: "EC-Council", color: "#EF4444", level: "Professional" },
];

export const roadmaps = [
  // ── TECH TRACKS ────────────────────────────────────────────────────────────
  { slug: "full-stack-developer", title: "Full-Stack Developer", icon: "🌐", color: "#0EA5E9", category: "tech", duration: "5-7 months",
    steps: ["HTML & Semantic Markup", "CSS & Modern Layout", "JavaScript", "TypeScript", "React", "Next.js", "Node.js", "Express.js", "REST API Design", "Authentication & Authorization", "Full-Stack Integration & Deployment"] },
  { slug: "devops-engineer", title: "DevOps Engineer", icon: "⚙️", color: "#3B82F6", category: "tech", duration: "6 months",
    // 9 steps, not the previous 10 — "CI/CD Pipelines" is now a genuine
    // fork (GitHub Actions/Jenkins/GitLab CI) at one step position instead
    // of a generic placeholder, and "Cloud — AWS"/"Cloud — Azure" (formerly
    // two separate sequential steps) are now one fork step with two
    // branches, since they're a genuine either/or choice, not two things to
    // learn in sequence. See docs/audit/14-roadmap-tree-redesign.md for the
    // full branch-point rationale (2026-09-03 pilot).
    steps: ["Linux", "Shell Scripting", "Git", "Docker", "Kubernetes", "CI/CD Tooling", "Cloud Platform", "Monitoring", "IaC with Terraform"] },
  { slug: "cloud-architect", title: "Cloud Architect", icon: "☁️", color: "#0EA5E9", category: "tech", duration: "8 months",
    // 6 steps, not the previous 7 — AWS/Azure merged into one "Cloud
    // Platform" fork step. See roadmapDetails.ts's matching comment.
    steps: ["Cloud Fundamentals", "Cloud Platform", "Networking & Security", "Architecture Patterns", "HA & DR", "Cost Optimization"] },
  { slug: "platform-engineer", title: "Platform Engineer", icon: "🏗️", color: "#6366F1", category: "tech", duration: "9 months",
    steps: ["Linux", "Networking", "Kubernetes Advanced", "Terraform", "Helm", "ArgoCD / GitOps", "Service Mesh", "Observability"] },
  { slug: "ai-engineer", title: "AI Engineer", icon: "🤖", color: "#8B5CF6", category: "tech", duration: "6 months",
    steps: ["Python Foundations", "ML Fundamentals", "LLM Concepts", "Prompt Engineering", "LangChain & RAG", "AI Agents", "LLMOps"] },
  { slug: "data-analyst", title: "Data Analyst", icon: "📊", color: "#06B6D4", category: "tech", duration: "4 months",
    // 6 steps, not the previous 7 — Power BI/Tableau merged into one
    // "BI Tool" fork step. See roadmapDetails.ts's matching comment.
    steps: ["Excel Advanced", "SQL Mastery", "Python & Pandas", "Data Visualization", "BI Tool", "Dashboarding"] },
  { slug: "security-engineer", title: "Security Engineer", icon: "🛡️", color: "#EF4444", category: "tech", duration: "7 months",
    steps: ["Security Fundamentals", "Network Security", "Cloud Security", "SIEM & SOC", "Pen Testing", "Ethical Hacking", "Incident Response"] },
  { slug: "database-engineer", title: "Database Engineer", icon: "🗄️", color: "#10B981", category: "tech", duration: "6 months",
    steps: ["SQL Mastery", "PostgreSQL Advanced", "Redis & Caching", "MongoDB", "Database Design", "Performance Tuning", "Cloud Databases"] },
  { slug: "data-engineer", title: "Data Engineer", icon: "🔧", color: "#F59E0B", category: "tech", duration: "8 months",
    steps: ["Python & Pandas", "SQL Advanced", "Apache Kafka", "dbt", "Airflow", "Spark Basics", "Cloud Data Warehouses"] },
  { slug: "sre-engineer", title: "SRE / Reliability Engineer", icon: "📡", color: "#EC4899", category: "tech", duration: "7 months",
    steps: ["Linux Deep Dive", "Kubernetes Production", "Prometheus & SLOs", "Incident Management", "Chaos Engineering", "Capacity Planning", "Automation"] },
  { slug: "healthcare-coder", title: "Medical Coder (CPC/BCHHC)", icon: "🏥", color: "#14B8A6", category: "professional", duration: "6 months",
    // 8 steps, not the previous 9 — CPC/BCHHC merged into one
    // "Certification Track" fork step. See roadmapDetails.ts's comment.
    steps: ["Anatomy & Physiology", "Medical Terminology", "ICD-10-CM Fundamentals", "CPT Procedure Codes", "HCPCS Level II", "Coding Guidelines", "OASIS & PDGM", "Certification Track"] },
  { slug: "professional-certifications", title: "Professional Certifications (PMP/ITIL/Scrum/Six Sigma)", icon: "🏅", color: "#14B8A6", category: "professional", duration: "Varies by cert",
    steps: ["PMP — Overview", "PMP — Fundamentals", "Scrum & Agile — Overview", "Scrum & Agile — Fundamentals", "ITIL 4 — Overview", "ITIL 4 — Fundamentals", "Six Sigma — Overview", "Six Sigma — Fundamentals"] },
  { slug: "aerospace-engineer", title: "Aerospace Engineer", icon: "🚀", color: "#1D4ED8", category: "tech", duration: "9 months",
    steps: ["Aerospace Foundations", "Aerodynamics", "Propulsion Systems", "Flight Mechanics & Structures", "Orbital Mechanics", "Spacecraft Systems", "Careers & Exam Prep"] },
  { slug: "vlsi-design-engineer", title: "VLSI Design Engineer", icon: "🔬", color: "#64748B", category: "tech", duration: "9 months",
    steps: ["Digital Logic Fundamentals", "HDL — Verilog & VHDL", "RTL Design", "Functional Verification", "Physical Design & Fabrication", "Analog & Mixed-Signal", "Careers & Exam Prep"] },

  // ── LAW & LEGAL ────────────────────────────────────────────────────────────
  { slug: "advocate-career", title: "Advocate / Legal Career", icon: "⚖️", color: "#6366F1", category: "law", duration: "3–5 years",
    steps: ["LLB / LLB Hons Degree", "State Bar Council Enrollment", "AIBE Exam & Certificate", "Junior to Senior Advocate (2–4 yrs)", "Build Specialisation", "Independent Practice"] },
  { slug: "judiciary-civil-judge", title: "Judiciary — Civil Judge", icon: "🏛️", color: "#A855F7", category: "law", duration: "1–2 years prep",
    steps: ["LLB + Core Subjects", "Constitutional & Criminal Law", "Civil Law (CPC, Contract, TP)", "Prelims Practice (MCQ)", "Mains (Descriptive + Judgment Writing)", "Interview / Viva"] },

  // ── GOVERNMENT / PSC ───────────────────────────────────────────────────────
  { slug: "upsc-ias", title: "UPSC Civil Services (IAS/IPS)", icon: "🏛️", color: "#F59E0B", category: "government", duration: "2–4 years",
    steps: ["Foundation: History, Polity, Geography", "Economy & Environment", "Prelims (GS + CSAT)", "Mains: GS Papers 1–4", "Optional Subject (2 papers)", "Essay + Ethics (GS4)", "Interview / Personality Test"] },
  { slug: "banking-po", title: "Banking PO (SBI/IBPS)", icon: "🏦", color: "#10B981", category: "government", duration: "6–12 months",
    steps: ["Quantitative Aptitude", "Reasoning Ability", "English Language", "General/Banking Awareness", "Prelims Exam", "Mains Exam", "Interview"] },
  { slug: "state-psc-officer", title: "State PSC — Civil Services", icon: "🏛️", color: "#8B5CF6", category: "government", duration: "1–3 years",
    steps: ["State GK + Language", "Indian Polity & History", "Prelims (state-specific)", "Mains + State-specific papers", "Mains — Essay & Answer Writing", "Interview"] },

  // ── FINANCE ────────────────────────────────────────────────────────────────
  { slug: "ca-journey", title: "Chartered Accountant (CA)", icon: "📒", color: "#F59E0B", category: "finance", duration: "4–5 years",
    steps: ["CA Foundation (4 papers)", "Register for Articleship", "CA Intermediate Group I (4 papers)", "CA Intermediate Group II (4 papers)", "3-Year Articleship + ICITSS", "CA Final Group I", "CA Final Group II + AICITSS"] },
  { slug: "banking-finance-analyst", title: "Banking & Finance Analyst", icon: "💹", color: "#14B8A6", category: "finance", duration: "1–2 years",
    // "CA/MBA or NISM Certifications" -> "Credentialing Path", now a real
    // fork (CA/CS/CMA vs. Banking Exams). See roadmapDetails.ts's matching comment.
    steps: ["Accounting Basics", "Financial Markets (SEBI/NISM)", "Banking & RBI Framework", "Credit Analysis Fundamentals", "Credentialing Path", "Role: Analyst / Relationship Manager"] },
  { slug: "economics-analyst", title: "Economist / Policy Analyst", icon: "📊", color: "#F97316", category: "finance", duration: "1–3 years",
    steps: ["Microeconomics", "Macroeconomics", "Indian Economy", "Union Budget & Economic Survey", "RBI & Monetary Policy", "International Trade"] },

  // ── AGRICULTURE ────────────────────────────────────────────────────────────
  { slug: "agricultural-officer", title: "Agricultural Officer (IBPS AFO / NABARD)", icon: "🌾", color: "#22C55E", category: "agriculture", duration: "1–2 years",
    steps: ["Agronomy & Soil Science", "Crop Science & Horticulture", "Plant Pathology & Entomology", "Agricultural Economics & Policy", "Current Agri Schemes (PM-KISAN, MSP)", "IBPS AFO / NABARD Grade A Exam"] },

  // ── TELECOM ────────────────────────────────────────────────────────────────
  { slug: "telecom-engineer", title: "Telecom Engineer / BSNL JTO", icon: "📡", color: "#0EA5E9", category: "telecom", duration: "1–2 years",
    // "GATE ECE / BSNL JTO Exam" -> "Exam Path", now a real fork (BSNL JTO
    // vs GATE ECE). See roadmapDetails.ts's matching comment.
    steps: ["Electronics & Communication (ECE Basics)", "Transmission & Fiber Optics", "Mobile Networks (4G LTE / 5G NR)", "OSS/BSS & Network Management", "Exam Path", "Career: JTO, Network Engineer, RAN"] },

  // ── EDUCATION ──────────────────────────────────────────────────────────────
  { slug: "neet-medical", title: "NEET — Medical College Admission", icon: "🧬", color: "#F43F5E", category: "education", duration: "2 years",
    steps: ["Biology (Botany + Zoology)", "Physics (Mechanics, Modern, Optics)", "Chemistry (Organic, Inorganic, Physical)", "NCERT Mastery (all chapters)", "Previous Year Questions (10 years)", "Mock Tests + Revision"] },
  { slug: "jee-engineering", title: "JEE — Engineering Admission", icon: "🔬", color: "#3B82F6", category: "education", duration: "2 years",
    steps: ["Mathematics (Calculus, Algebra, Coordinate)", "Physics (Mechanics, E&M, Modern)", "Chemistry (Organic, Inorganic, Physical)", "JEE Main Exam (Jan + Apr)", "JEE Advanced (IIT shortlist)", "JOSAA Counselling"] },

  // ── WELLNESS ───────────────────────────────────────────────────────────────
  { slug: "personal-wellness", title: "Personal Wellness & Life Skills", icon: "🌿", color: "#22C55E", category: "wellness", duration: "Ongoing",
    steps: ["Morning Routine & Sleep", "Nutrition & Hydration", "Daily Movement", "Mental Health Practices", "Digital Safety & Privacy", "Personal Finance Basics", "First Aid & Emergency Preparedness"] },
];


// Derived from the actual data at import time, not hand-maintained — this is
// the 5th instance of the hand-maintained-vs-source-of-truth drift pattern
// (registry, sitemap, search index, steps/techLinks, now marketing stats —
// see docs/audit/07-roadmap-final.md NF-6). Confirmed live 2026-07-16: the
// real counts were 18 academies (not 11), 201 technologies (not 890+), 17
// certifications (not 13) — every one of these was wrong by a wide margin.
const totalTechnologies = academies.reduce(
  (sum, a) => sum + a.domains.reduce((dSum, d) => dSum + d.technologies.length, 0),
  0
);
const totalChapters = educationBoards.reduce(
  (sum, b) => sum + b.subjects.reduce((sSum, s) => sSum + s.chapters.length, 0),
  0
);

export const stats = [
  { value: `${totalChapters}+`, label: "Chapters" },
  { value: `${academies.length}`, label: "Academies" },
  { value: `${totalTechnologies}+`, label: "Tech Topics" },
  { value: `${certifications.length}`, label: "Certifications" },
];

// Sections for non-technical knowledge domains
export const nonTechSections = [
  { slug: "overview",     label: "Overview",     icon: "📖", description: "What it covers and why it matters" },
  { slug: "fundamentals", label: "Fundamentals", icon: "🔤", description: "Core concepts and foundational knowledge" },
  { slug: "intermediate", label: "Intermediate", icon: "⚡", description: "Applied knowledge and worked examples" },
  { slug: "advanced",     label: "Advanced",     icon: "🚀", description: "Expert-level topics and analysis" },
  { slug: "roadmap",      label: "Roadmap",      icon: "🗺️", description: "Step-by-step structured learning path from zero to expert" },
  { slug: "labs",         label: "Labs",         icon: "🧪", description: "Hands-on exercises with real environments and scenarios" },
  { slug: "projects",     label: "Projects",     icon: "🏗️", description: "Portfolio-ready projects to demonstrate your skills" },
  { slug: "interview",    label: "Practice Q&A", icon: "💬", description: "Practice questions and model answers" },
  { slug: "certification",label: "Certification",icon: "🏆", description: "Exam guides, practice questions, and prep strategies" },
  { slug: "cheatsheets",  label: "Quick Ref",    icon: "📋", description: "At-a-glance summaries and tables" },
  { slug: "notes",        label: "Notes",        icon: "📝", description: "Key takeaways and revision points" },
  { slug: "pyq",          label: "PYQ",          icon: "📝", description: "Previous Year Questions with detailed solutions" },
  { slug: "faq",          label: "FAQ",          icon: "❓", description: "Frequently asked questions" },
];

export const nonTechAcademyIds = [
  "law", "exams", "education", "state-psc", "central-exams",
  "finance", "economics", "agriculture", "essentials", "healthcare",
  "telecom", "professional-certs",
];

// Sections that don't apply to a Technology.contentScope === "guide" page
// (a narrow overview/PYQ/strategy page, not a full curriculum track — see
// the contentScope doc comment on the Technology type in academies.ts).
// Deliberately just these three, not the full long-tail (prerequisites,
// installation, notes, pyq, real-world-scenarios, faq, troubleshooting) —
// those are a separate, unrelated content-completeness gap that applies
// across "full"-scope technologies too and isn't what this field is for.
export const GUIDE_EXCLUDED_SECTIONS = ["roadmap", "projects", "certification"];

// Single source of truth for "which sections does this technology show" —
// replaces three independent copies of the same
// `isNonTech ? nonTechSections : techSections` ternary that used to live
// separately in the section-route sidebar, the tech-overview module grid,
// and WhatNext.tsx (the same hand-maintained-vs-source-of-truth drift
// pattern flagged elsewhere as NF-6 in docs/audit/07-roadmap-final.md, just
// a smaller instance of it). Every consumer of the section list — sidebar,
// module grid, WhatNext, MobileSectionNav — should call this instead of
// inlining the ternary.
//
// Each returned section now also carries `hasContent: boolean` — whether
// real content actually exists for this academy/technology/section, not
// just whether the section is conceptually part of this technology's
// shape. Consumers use this to gray out / label unwritten sections rather
// than hiding them outright (a technology with no Labs content still
// shows a "Labs" entry, just visually marked as not-yet-written) — see
// the section-route sidebar, module grid, WhatNext, and MobileSectionNav
// for the actual rendering. "labs" is checked against the separate
// lib/data/labs/existence.ts index (Labs content isn't in the markdown
// content registry at all — it's a different data source entirely, see
// components/tech/LabsSection.tsx), not hasContent().
export type SectionWithStatus = (typeof techSections)[number] & { hasContent: boolean };

export function getSectionsForTechnology(
  tech: Pick<Technology, "contentScope">,
  isNonTech: boolean,
  academySlug: string,
  technologySlug: string
): SectionWithStatus[] {
  const base = isNonTech ? nonTechSections : techSections;
  const scoped = tech.contentScope === "guide"
    ? base.filter((s) => !GUIDE_EXCLUDED_SECTIONS.includes(s.slug))
    : base;
  return scoped.map((s) => ({
    ...s,
    hasContent: s.slug === "labs"
      ? hasLabsContent(academySlug, technologySlug)
      : hasContent(academySlug, technologySlug, s.slug),
  }));
}
