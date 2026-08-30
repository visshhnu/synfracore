import { TelegramBanner } from "@/components/growth/TelegramBanner";
import { NewsletterSignup } from "@/components/growth/NewsletterSignup";
import { AcademyExplorer } from "@/components/home/AcademyExplorer";
import Link from "next/link";
import Image from "next/image";
import { academies } from "@/lib/data/academies";
import { certifications, stats, roadmaps } from "@/lib/data/navigation";
import { educationBoards } from "@/lib/data/education";
import {
  ArrowRight, BookOpen, FlaskConical, Code2, Trophy, Wrench, Bot, CheckCircle, Target, Zap,
  Sprout, Briefcase, Construction, NotebookPen, Landmark, PiggyBank, Scale, Ruler, Dna,
  Home as HomeIcon, Database, BarChart3, Wallet, Microscope, Network, Cloud, Lock,
  FileText, GraduationCap, Map, MessageSquare,
} from "lucide-react";

// Role-based paths
const roles = [
  {
    icon: Sprout,
    title: "Absolute Beginner",
    desc: "No prior experience. Start from zero.",
    path: "Linux basics → Shell scripting → Git → Docker → Cloud fundamentals",
    cta: "/roadmaps",
    color: "#10B981",
  },
  {
    icon: Briefcase,
    title: "Job Seeker",
    desc: "Preparing for interviews and placements.",
    path: "Interview Q&A → Resume tips → Mock scenarios → Certification prep",
    cta: "/interview",
    color: "#3B82F6",
  },
  {
    icon: Zap,
    title: "Working Engineer",
    desc: "Level up your current skills.",
    path: "Advanced K8s → Terraform → CI/CD → Monitoring → Platform Engineering",
    cta: "/academies",
    color: "#8B5CF6",
  },
  {
    icon: Construction,
    title: "Architect / Lead",
    desc: "Design production systems.",
    path: "HA/DR design → Multi-cloud → Security → Cost optimisation → Team leadership",
    cta: "/roadmaps",
    color: "#F59E0B",
  },
  {
    icon: BookOpen,
    title: "Exam Preparer",
    desc: "JEE, NEET, GATE, Banking, UPSC.",
    path: "Chapter-wise notes → PYQs → MCQ practice → Revision notes",
    cta: "/learn",
    color: "#EC4899",
  },
  {
    icon: Target,
    title: "Certification Seeker",
    desc: "AWS, Azure, GCP, CKA, CKAD.",
    path: "Domain study → Practice questions → Exam tips → Mock tests",
    cta: "/certifications",
    color: "#14B8A6",
  },
];

// What you'll learn journey
const journey = [
  { step: "01", title: "Learn", desc: "Expert-written chapter-by-chapter content with real examples", icon: NotebookPen },
  { step: "02", title: "Practice", desc: "Hands-on labs from beginner to production-grade scenarios", icon: FlaskConical },
  { step: "03", title: "Build", desc: "Real projects that go straight to your portfolio", icon: Construction },
  { step: "04", title: "Test Yourself", desc: "MCQs, PYQs, and scenario-based questions", icon: CheckCircle },
  { step: "05", title: "Get Certified", desc: "Structured prep for 13 industry certifications", icon: Trophy },
  { step: "06", title: "Get Hired", desc: "Interview Q&A, resume tips, and career roadmaps", icon: Briefcase },
];

// Product screenshots — regenerate via `node scripts/screenshot-marketing-sections.mjs`
const productShots = [
  { title: "Real lessons, not stubs", desc: "Diagrams, callouts, and working code in every technology page.", image: "/images/screenshots/lesson.png", height: 720, alt: "SynfraCore lesson page showing an AI inference diagram, a cost-estimation callout, and a Python code example" },
  { title: "Quizzes that check understanding", desc: "Instant right/wrong feedback with a real explanation, not just a score.", image: "/images/screenshots/quiz.png", height: 620, alt: "SynfraCore quiz on Docker fundamentals showing a correct and an incorrect answer with an inline explanation" },
  { title: "Progress that's actually tracked", desc: "Domain-by-domain completion, quiz history, and saved topics in one dashboard.", image: "/images/screenshots/dashboard.png", height: 720, alt: "SynfraCore dashboard showing progress bars across DevOps, Cloud, and Databases, quiz performance, and recent activity" },
];

// Tech domains
const domains = [
  { name: "DevOps", icon: Wrench, topics: ["Docker","Kubernetes","Helm","Jenkins","ArgoCD","GitOps"], href: "/academies/devops", color: "#F59E0B" },
  { name: "Cloud", icon: Cloud, topics: ["AWS","Azure","GCP","Multi-cloud","Cost Opt"], href: "/academies/cloud", color: "#3B82F6" },
  { name: "AI & Data", icon: Bot, topics: ["LLMs","RAG","MLOps","LangChain","Agents"], href: "/academies/ai", color: "#8B5CF6" },
  { name: "Security", icon: Lock, topics: ["DevSecOps","Zero Trust","RBAC","Vault","SAST"], href: "/academies/security", color: "#EF4444" },
  { name: "Platform Eng", icon: Landmark, topics: ["IDP","Backstage","Golden Paths","SRE"], href: "/academies/devops", color: "#10B981" },
  { name: "Academy (Edu)", icon: BookOpen, topics: ["JEE","NEET","GATE","Banking","UPSC"], href: "/learn", color: "#EC4899" },
];

// Proof points — chapters/tech topics/certifications/roadmaps derived from
// real data (was a third independent hardcoded stats source disagreeing with
// both the main stats row above and app/about/page.tsx, see NF-6/B1). Labs &
// projects and Interview Q&As are left as-is — no reliable per-item count
// source exists for those yet.
const totalChapters = educationBoards.reduce((sum, b) => sum + b.subjects.reduce((s, sub) => s + sub.chapters.length, 0), 0);
const totalTechTopics = academies.reduce((sum, a) => sum + a.domains.reduce((s, d) => s + d.technologies.length, 0), 0);

const proofPoints = [
  { icon: FileText, stat: `${totalChapters}+`, label: "Education chapters", sub: "Class 10 to UPSC — expert-written" },
  { icon: Code2, stat: `${totalTechTopics}+`, label: "Tech topics", sub: "Docker to Kubernetes to Platform Eng" },
  { icon: GraduationCap, stat: `${certifications.length}`, label: "Certifications", sub: "AWS, Azure, GCP, CKA, CKAD and more" },
  { icon: Map, stat: `${roadmaps.length}+`, label: "Career roadmaps", sub: "From beginner to architect" },
  { icon: FlaskConical, stat: "500+", label: "Labs & projects", sub: "Hands-on practice scenarios" },
  { icon: MessageSquare, stat: "100+", label: "Interview Q&As", sub: "Real questions with detailed answers" },
];

export default function Home() {
  return (
    <div style={{ background: "var(--bg)" }}>

      {/* ══════════════════ HERO ══════════════════ */}
      <section className="line-grid" style={{ position: "relative", overflow: "hidden", padding: "clamp(60px, 10vw, 100px) clamp(16px, 4vw, 24px) clamp(60px, 10vw, 96px)" }}>
        <div style={{ position: "absolute", top: "-120px", left: "-120px", width: "500px", height: "500px", background: "radial-gradient(circle, rgba(37,99,235,0.14) 0%, transparent 65%)", borderRadius: "50%", pointerEvents: "none" }} />
        <div style={{ position: "absolute", bottom: "-80px", right: "-80px", width: "400px", height: "400px", background: "radial-gradient(circle, rgba(124,58,237,0.10) 0%, transparent 65%)", borderRadius: "50%", pointerEvents: "none" }} />

        <div style={{ maxWidth: "1200px", margin: "0 auto", position: "relative" }}>
          <h1 className="display-xl" style={{ marginBottom: "16px", maxWidth: "900px" }}>
            Learn Anything.{" "}<span className="grad-blue">Crack Every Exam.</span>{" "}Get Hired
          </h1>

          <p className="body-lg" style={{ maxWidth: "620px", marginBottom: "8px", fontWeight: 600, color: "var(--text-2)", fontSize: "20px" }}>
            From Beginner to Job-Ready — Tech · Exams · Certifications
          </p>

          <p style={{ color: "var(--text-4)", fontSize: "15px", maxWidth: "620px", marginBottom: "40px" }}>
            Expert-written content for DevOps, Cloud, AI · JEE, NEET, GATE, Banking, UPSC, SSC · Hands-on labs · Interview Q&As · PYQs · Certification prep — all free.
          </p>

          <div style={{ display: "flex", gap: "14px", flexWrap: "wrap", marginBottom: "40px" }}>
            <Link href="/roadmaps" className="btn-primary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              Browse Roadmaps <ArrowRight size={17} />
            </Link>
            <Link href="/academies" className="btn-secondary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              Explore Academies
            </Link>
          </div>

          {/* Roadmap quick tiles */}
          <div style={{ marginBottom: "48px" }}>
            <div style={{ fontSize: "12px", fontWeight: 700, color: "var(--text-4)", letterSpacing: "0.08em", textTransform: "uppercase", marginBottom: "14px" }}>
              Popular Learning Paths
            </div>
            <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
              {[
                { icon: Wrench, label: "DevOps Engineer",      slug: "devops-engineer",     color: "#3B82F6" },
                { icon: Cloud, label: "Cloud Architect",       slug: "cloud-architect",      color: "#0EA5E9" },
                { icon: Bot, label: "AI Engineer",           slug: "ai-engineer",          color: "#8B5CF6" },
                { icon: Landmark, label: "UPSC Civil Services",   slug: "upsc-ias",             color: "#F59E0B" },
                { icon: PiggyBank, label: "Banking PO",            slug: "banking-po",           color: "#10B981" },
                { icon: Scale, label: "Advocate / LLB",        slug: "advocate-career",      color: "#6366F1" },
              ].map(rm => (
                <a key={rm.slug} href={`/roadmaps/${rm.slug}`}
                  style={{ display: "flex", alignItems: "center", gap: "8px", minHeight: "44px", padding: "8px 16px", borderRadius: "10px", background: "var(--bg-2)", border: `1px solid ${rm.color}30`, textDecoration: "none", transition: "border-color 0.15s" }}>
                  <rm.icon size={16} color={rm.color} />
                  <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-2)", whiteSpace: "nowrap" }}>{rm.label}</span>
                  <span style={{ color: rm.color, fontSize: "12px", fontWeight: 700 }}>→</span>
                </a>
              ))}
            </div>
          </div>

          {/* Stats row */}
          <div style={{ display: "flex", gap: "0", flexWrap: "wrap", borderTop: "1px solid var(--border)", paddingTop: "40px" }}>
            {stats.map((s, i) => (
              <div key={s.label} style={{ paddingRight: "48px", marginRight: "48px", borderRight: i < stats.length - 1 ? "1px solid #0F1E30" : "none", marginBottom: "16px" }}>
                <div style={{
                  fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "38px", fontWeight: 800,
                  background: ["linear-gradient(135deg,#60A5FA,#818CF8)", "linear-gradient(135deg,#34D399,#06B6D4)", "linear-gradient(135deg,#A78BFA,#EC4899)", "linear-gradient(135deg,#FCD34D,#FB923C)"][i],
                  WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text", lineHeight: 1,
                }}>{s.value}</div>
                <div style={{ color: "var(--text-4)", fontSize: "13px", fontWeight: 500, marginTop: "6px", letterSpacing: "0.04em" }}>{s.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ PRODUCT SCREENSHOTS ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg-1)", borderTop: "1px solid var(--border)", borderBottom: "1px solid var(--border)" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "48px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>See It In Action</div>
            <h2 className="display-md" style={{ marginBottom: "12px" }}>This Is What You Actually Get</h2>
            <p style={{ color: "var(--text-3)", fontSize: "16px", maxWidth: "520px", margin: "0 auto" }}>
              Real lessons, real quizzes, real progress tracking — not mockups.
            </p>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(320px, 1fr))", gap: "24px" }}>
            {productShots.map(shot => (
              <div key={shot.title}>
                <div className="browser-frame">
                  <div className="browser-frame-bar">
                    <span style={{ background: "#EF4444" }} />
                    <span style={{ background: "#F59E0B" }} />
                    <span style={{ background: "#10B981" }} />
                  </div>
                  <div className="browser-frame-body">
                    <Image src={shot.image} alt={shot.alt} width={1200} height={shot.height} style={{ width: "100%", height: "auto", display: "block" }} />
                  </div>
                </div>
                <div style={{ marginTop: "14px" }}>
                  <div style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)", marginBottom: "4px" }}>{shot.title}</div>
                  <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{shot.desc}</div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ DOMAIN AUTO-SLIDER ══════════════════ */}
      <section style={{ padding: "40px 0", background: "var(--bg-1)", borderTop: "1px solid var(--border)", borderBottom: "1px solid var(--border)", overflow: "hidden" }}>
        <div style={{ textAlign: "center", marginBottom: "24px", padding: "0 24px" }}>
          <div className="label" style={{ marginBottom: "8px" }}>What We Teach</div>
          <p style={{ color: "var(--text-3)", fontSize: "15px" }}>
            A-to-Z learning — from cloud infrastructure to competitive exams, medical coding to life essentials
          </p>
        </div>
        {/* Sliding domain cards — infinite loop */}
        <div className="domain-slider-wrap">
          <div className="domain-slider-track">
            {[
              { icon: "🐳", name: "Docker", color: "#2496ED" },
              { icon: "☸️", name: "Kubernetes", color: "#326CE5" },
              { icon: "🌩️", name: "AWS", color: "#FF9900" },
              { icon: Cloud, name: "Azure", color: "#0078D4" },
              { icon: Bot, name: "AI & LLMs", color: "#8B5CF6" },
              { icon: Ruler, name: "JEE Maths", color: "#EC4899" },
              { icon: Dna, name: "NEET Biology", color: "#10B981" },
              { icon: PiggyBank, name: "Banking Exams", color: "#F59E0B" },
              { icon: HomeIcon, name: "Home Health Coding", color: "#14B8A6" },
              { icon: Lock, name: "Cybersecurity", color: "#EF4444" },
              { icon: Database, name: "PostgreSQL", color: "#336791" },
              { icon: BarChart3, name: "Power BI", color: "#F2C811" },
              { icon: "🐧", name: "Linux", color: "#FCC624" },
              { icon: Wrench, name: "Terraform", color: "#7B42BC" },
              { icon: Target, name: "UPSC Prep", color: "#3B82F6" },
              { icon: FlaskConical, name: "GATE CSE", color: "#6366F1" },
              { icon: Sprout, name: "Gut Health", color: "#22C55E" },
              { icon: Wallet, name: "Personal Finance", color: "#F59E0B" },
              { icon: Microscope, name: "NEET Chemistry", color: "#06B6D4" },
              { icon: Network, name: "Networking", color: "#8B5CF6" },
              // Duplicate for seamless loop
              { icon: "🐳", name: "Docker", color: "#2496ED" },
              { icon: "☸️", name: "Kubernetes", color: "#326CE5" },
              { icon: "🌩️", name: "AWS", color: "#FF9900" },
              { icon: Cloud, name: "Azure", color: "#0078D4" },
              { icon: Bot, name: "AI & LLMs", color: "#8B5CF6" },
              { icon: Ruler, name: "JEE Maths", color: "#EC4899" },
              { icon: Dna, name: "NEET Biology", color: "#10B981" },
              { icon: PiggyBank, name: "Banking Exams", color: "#F59E0B" },
              { icon: HomeIcon, name: "Home Health Coding", color: "#14B8A6" },
              { icon: Lock, name: "Cybersecurity", color: "#EF4444" },
              { icon: Database, name: "PostgreSQL", color: "#336791" },
              { icon: BarChart3, name: "Power BI", color: "#F2C811" },
              { icon: "🐧", name: "Linux", color: "#FCC624" },
              { icon: Wrench, name: "Terraform", color: "#7B42BC" },
              { icon: Target, name: "UPSC Prep", color: "#3B82F6" },
              { icon: FlaskConical, name: "GATE CSE", color: "#6366F1" },
              { icon: Sprout, name: "Gut Health", color: "#22C55E" },
              { icon: Wallet, name: "Personal Finance", color: "#F59E0B" },
              { icon: Microscope, name: "NEET Chemistry", color: "#06B6D4" },
              { icon: Network, name: "Networking", color: "#8B5CF6" },
            ].map((d, i) => (
              <div key={i} style={{
                display: "flex", alignItems: "center", gap: "8px",
                padding: "8px 16px", borderRadius: "40px",
                background: `${d.color}12`, border: `1px solid ${d.color}30`,
                whiteSpace: "nowrap", flexShrink: 0,
              }}>
                {typeof d.icon === "string" ? <span style={{ fontSize: "18px" }}>{d.icon}</span> : <d.icon size={18} color={d.color} />}
                <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-2)" }}>{d.name}</span>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ WHO IS THIS FOR ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg-1)", borderTop: "1px solid var(--border)" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "48px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>Start Here</div>
            <h2 className="display-md" style={{ marginBottom: "12px" }}>Who Are You?</h2>
            <p style={{ color: "var(--text-3)", fontSize: "16px", maxWidth: "500px", margin: "0 auto" }}>
              Pick your path — we&apos;ll take you from where you are to where you want to be.
            </p>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "16px" }}>
            {roles.map(r => (
              <Link key={r.title} href={r.cta} style={{ textDecoration: "none" }}>
                <div className="card-hover" style={{
                  padding: "24px", borderRadius: "14px",
                  border: `1px solid ${r.color}25`,
                  background: `${r.color}06`,
                  height: "100%", cursor: "pointer"
                }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "10px" }}>
                    <r.icon size={28} color={r.color} />
                    <div>
                      <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", color: "var(--text-1)" }}>{r.title}</div>
                      <div style={{ color: "var(--text-4)", fontSize: "12px" }}>{r.desc}</div>
                    </div>
                  </div>
                  <div style={{ fontSize: "12px", color: r.color, fontWeight: 600, lineHeight: 1.6, borderTop: `1px solid ${r.color}20`, paddingTop: "10px" }}>
                    {r.path}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ PROOF POINTS ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg)" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "48px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>What You Get</div>
            <h2 className="display-md" style={{ marginBottom: "12px" }}>Everything in One Place</h2>
            <p style={{ color: "var(--text-3)", fontSize: "16px", maxWidth: "480px", margin: "0 auto" }}>
              No scattered resources. A complete, structured system from day one to job offer.
            </p>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(220px, 1fr))", gap: "16px" }}>
            {proofPoints.map(p => (
              <div key={p.label} style={{ padding: "24px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", textAlign: "center" }}>
                <div style={{ marginBottom: "8px" }}><p.icon size={32} /></div>
                <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, color: "var(--text-1)", marginBottom: "4px" }}>{p.stat}</div>
                <div style={{ fontWeight: 600, fontSize: "13px", color: "var(--text-2)", marginBottom: "4px" }}>{p.label}</div>
                <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{p.sub}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ DOMAINS ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg-1)", borderTop: "1px solid var(--border)" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "48px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>Domains</div>
            <h2 className="display-md" style={{ marginBottom: "12px" }}>What You Can Learn</h2>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "16px" }}>
            {domains.map(d => (
              <Link key={d.name} href={d.href} style={{ textDecoration: "none" }}>
                <div className="card-hover" style={{ padding: "22px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg)", cursor: "pointer" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "12px" }}>
                    <d.icon size={24} color={d.color} />
                    <span style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", color: "var(--text-1)" }}>{d.name}</span>
                  </div>
                  <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                    {d.topics.map(t => (
                      <span key={t} style={{ fontSize: "11px", padding: "2px 8px", borderRadius: "20px", background: d.color + "15", color: d.color, fontWeight: 600 }}>{t}</span>
                    ))}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ JOURNEY ══════════════════ */}
      <section style={{ background: "var(--bg)", borderTop: "1px solid var(--border)", borderBottom: "1px solid var(--border)", padding: "80px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "56px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>Your Path</div>
            <h2 className="display-md" style={{ marginBottom: "12px" }}>The SynfraCore Method</h2>
            <p style={{ color: "var(--text-3)", fontSize: "16px", maxWidth: "480px", margin: "0 auto" }}>
              A proven 6-step system that takes you from concept to career-ready.
            </p>
          </div>
          <div className="journey-timeline">
            <div className="journey-line" />
            {journey.map((j, i) => {
              const color = ["#3B82F6","#8B5CF6","#10B981","#F59E0B","#EC4899","#06B6D4"][i];
              return (
                <div key={j.step} className="journey-node">
                  <div className="journey-dot" style={{ borderColor: color, color }}>
                    <j.icon size={18} />
                  </div>
                  <div className="journey-node-body">
                    <div style={{ fontFamily: "'JetBrains Mono',monospace", fontSize: "11px", color: "var(--text-4)", fontWeight: 700, marginBottom: "6px" }}>{j.step}</div>
                    <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", color: "var(--text-1)", marginBottom: "6px" }}>{j.title}</div>
                    <div style={{ color: "var(--text-3)", fontSize: "13px", lineHeight: 1.6 }}>{j.desc}</div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* ══════════════════ ACADEMIES ══════════════════ */}
      <section style={{ padding: "80px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "36px", flexWrap: "wrap", gap: "16px" }}>
            <div>
              <div className="label" style={{ marginBottom: "10px" }}>Tech Academies</div>
              <h2 className="display-md">Deep-Dive Learning Paths</h2>
            </div>
            <Link href="/academies" style={{ color: "var(--accent)", fontSize: "14px", fontWeight: 600, textDecoration: "none", display: "flex", alignItems: "center", gap: "6px" }}>
              All Academies <ArrowRight size={14} />
            </Link>
          </div>
          {/* Explicit flagship-slug selection, not a positional slice — a
              plain academies.slice(0,6) used to work only because the
              array happened to list the core tech academies first; once
              academies.ts was reordered alphabetically (2026-08-30 mobile
              UX audit), that same slice would have started featuring
              Aerospace/Agriculture/Central-Govt-Exams here instead of the
              intended flagship 6. */}
          <AcademyExplorer academies={["devops", "cloud", "databases", "ai", "data", "security"].map(slug => academies.find(a => a.slug === slug)!).filter(Boolean)} />
        </div>
      </section>

      {/* ══════════════════ CERTIFICATIONS ══════════════════ */}
      <section style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", padding: "80px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "36px", flexWrap: "wrap", gap: "16px" }}>
            <div>
              <div className="label" style={{ marginBottom: "10px" }}>Certification Prep</div>
              <h2 className="display-md">{certifications.length} Certifications Covered</h2>
              <p style={{ color: "var(--text-3)", fontSize: "15px", marginTop: "8px" }}>
                Structured study guides, practice questions, and exam tips.
              </p>
            </div>
            <Link href="/certifications" style={{ color: "var(--accent)", fontSize: "14px", fontWeight: 600, textDecoration: "none", display: "flex", alignItems: "center", gap: "6px" }}>
              All Certs <ArrowRight size={14} />
            </Link>
          </div>
          <div style={{ display: "flex", gap: "8px", flexWrap: "wrap" }}>
            {certifications.map(c => (
              <Link key={c.id} href={`/certifications/${c.id}`} style={{ textDecoration: "none" }}>
                <div style={{
                  padding: "10px 16px", borderRadius: "10px", border: `1px solid ${c.color}30`,
                  background: c.color + "0A", cursor: "pointer",
                  display: "flex", alignItems: "center", gap: "8px"
                }}>
                  <span style={{ width: "8px", height: "8px", borderRadius: "50%", background: c.color, flexShrink: 0 }} />
                  <div>
                    <div style={{ fontSize: "12px", fontWeight: 700, color: "var(--text-1)" }}>{c.code}</div>
                    <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{c.level}</div>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ EDUCATION CTA ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg)" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(min(100%, 440px), 1fr))", gap: "24px" }}>

            {/* Education card */}
            <div style={{ padding: "36px", borderRadius: "20px", background: "linear-gradient(135deg,rgba(236,72,153,0.08),rgba(139,92,246,0.08))", border: "1px solid rgba(236,72,153,0.2)" }}>
              <div style={{ marginBottom: "12px" }}><BookOpen size={40} color="#EC4899" /></div>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "22px", marginBottom: "10px" }}>Education Academy</h3>
              <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.7, marginBottom: "20px" }}>
                {totalChapters}+ chapters across Class 10, Class 12, JEE, NEET, GATE, Banking, UPSC, SSC, Defence, Career, and Finance. With PYQs, MCQs, and revision notes.
              </p>
              <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "24px" }}>
                {["Class 10","Class 12","JEE","NEET","GATE","Banking","UPSC","SSC","Defence"].map(b => (
                  <span key={b} style={{ fontSize: "11px", padding: "3px 10px", borderRadius: "20px", background: "rgba(236,72,153,0.12)", color: "#EC4899", fontWeight: 600 }}>{b}</span>
                ))}
              </div>
              <Link href="/learn" className="btn-primary" style={{ background: "linear-gradient(135deg,#EC4899,#8B5CF6)" }}>
                Browse All Courses <ArrowRight size={16} />
              </Link>
            </div>

            {/* Interview card */}
            <div style={{ padding: "36px", borderRadius: "20px", background: "linear-gradient(135deg,rgba(59,130,246,0.08),rgba(16,185,129,0.08))", border: "1px solid rgba(59,130,246,0.2)" }}>
              <div style={{ marginBottom: "12px" }}><MessageSquare size={40} color="#3B82F6" /></div>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "22px", marginBottom: "10px" }}>Interview Preparation</h3>
              <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.7, marginBottom: "20px" }}>
                100+ real interview questions with detailed answers for Kubernetes, Terraform, Ansible, Docker, Jenkins, Helm, Prometheus, Linux, and more.
              </p>
              <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "24px" }}>
                {["Kubernetes","Terraform","Ansible","Docker","Jenkins","Helm","Prometheus","Linux"].map(t => (
                  <span key={t} style={{ fontSize: "11px", padding: "3px 10px", borderRadius: "20px", background: "rgba(59,130,246,0.12)", color: "#3B82F6", fontWeight: 600 }}>{t}</span>
                ))}
              </div>
              <Link href="/interview" className="btn-primary" style={{ background: "linear-gradient(135deg,#3B82F6,#10B981)" }}>
                Prep for Interview <ArrowRight size={16} />
              </Link>
            </div>

          </div>
        </div>
      </section>

      {/* ══════════════════ COMMUNITY ══════════════════ */}
      <TelegramBanner variant="banner" />

      {/* ══════════════════ NEWSLETTER ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg-1)", borderTop: "1px solid var(--border)" }}>
        <div style={{ maxWidth: "560px", margin: "0 auto", textAlign: "center" }}>
          <div className="label" style={{ marginBottom: "16px" }}>Stay Updated</div>
          <h2 className="display-md" style={{ marginBottom: "16px" }}>Weekly Tech Digest</h2>
          <p style={{ color: "var(--text-3)", marginBottom: "32px" }}>
            New chapters, roadmap updates, interview tips, and real-world engineering insights. No spam.
          </p>
          <NewsletterSignup />
        </div>
      </section>

    </div>
  );
}
