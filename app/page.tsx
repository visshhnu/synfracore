export const runtime = "edge";
import { TelegramBanner } from "@/components/growth/TelegramBanner";
import { NewsletterSignup } from "@/components/growth/NewsletterSignup";
import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { certifications, stats } from "@/lib/data/navigation";
import { ArrowRight, BookOpen, FlaskConical, Code2, Trophy, Wrench, Bot, CheckCircle, Users, Target, Zap } from "lucide-react";

// Role-based paths
const roles = [
  {
    icon: "🌱",
    title: "Absolute Beginner",
    desc: "No prior experience. Start from zero.",
    path: "Linux basics → Shell scripting → Git → Docker → Cloud fundamentals",
    cta: "/roadmaps",
    color: "#10B981",
  },
  {
    icon: "💼",
    title: "Job Seeker",
    desc: "Preparing for interviews and placements.",
    path: "Interview Q&A → Resume tips → Mock scenarios → Certification prep",
    cta: "/interview",
    color: "#3B82F6",
  },
  {
    icon: "⚡",
    title: "Working Engineer",
    desc: "Level up your current skills.",
    path: "Advanced K8s → Terraform → CI/CD → Monitoring → Platform Engineering",
    cta: "/academies",
    color: "#8B5CF6",
  },
  {
    icon: "🏗️",
    title: "Architect / Lead",
    desc: "Design production systems.",
    path: "HA/DR design → Multi-cloud → Security → Cost optimisation → Team leadership",
    cta: "/roadmaps",
    color: "#F59E0B",
  },
  {
    icon: "📚",
    title: "Exam Preparer",
    desc: "JEE, NEET, GATE, Banking, UPSC.",
    path: "Chapter-wise notes → PYQs → MCQ practice → Revision notes",
    cta: "/learn",
    color: "#EC4899",
  },
  {
    icon: "🎯",
    title: "Certification Seeker",
    desc: "AWS, Azure, GCP, CKA, CKAD.",
    path: "Domain study → Practice questions → Exam tips → Mock tests",
    cta: "/certifications",
    color: "#14B8A6",
  },
];

// What you'll learn journey
const journey = [
  { step: "01", title: "Learn", desc: "Expert-written chapter-by-chapter content with real examples", icon: "📖" },
  { step: "02", title: "Practice", desc: "Hands-on labs from beginner to production-grade scenarios", icon: "🧪" },
  { step: "03", title: "Build", desc: "Real projects that go straight to your portfolio", icon: "🏗️" },
  { step: "04", title: "Test Yourself", desc: "MCQs, PYQs, and scenario-based questions", icon: "✅" },
  { step: "05", title: "Get Certified", desc: "Structured prep for 13 industry certifications", icon: "🏆" },
  { step: "06", title: "Get Hired", desc: "Interview Q&A, resume tips, and career roadmaps", icon: "💼" },
];

// Tech domains
const domains = [
  { name: "DevOps", icon: "⚙️", topics: ["Docker","Kubernetes","Helm","Jenkins","ArgoCD","GitOps"], href: "/academies/devops", color: "#F59E0B" },
  { name: "Cloud", icon: "☁️", topics: ["AWS","Azure","GCP","Multi-cloud","Cost Opt"], href: "/academies/cloud", color: "#3B82F6" },
  { name: "AI & Data", icon: "🤖", topics: ["LLMs","RAG","MLOps","LangChain","Agents"], href: "/academies/ai", color: "#8B5CF6" },
  { name: "Security", icon: "🔒", topics: ["DevSecOps","Zero Trust","RBAC","Vault","SAST"], href: "/academies/security", color: "#EF4444" },
  { name: "Platform Eng", icon: "🏛️", topics: ["IDP","Backstage","Golden Paths","SRE"], href: "/academies/devops", color: "#10B981" },
  { name: "Academy (Edu)", icon: "📚", topics: ["JEE","NEET","GATE","Banking","UPSC"], href: "/learn", color: "#EC4899" },
];

// Proof points
const proofPoints = [
  { icon: "📝", stat: "284+", label: "Education chapters", sub: "Class 10 to UPSC — expert-written" },
  { icon: "💻", stat: "890+", label: "Tech topics", sub: "Docker to Kubernetes to Platform Eng" },
  { icon: "🎓", stat: "13", label: "Certifications", sub: "AWS, Azure, GCP, CKA, CKAD and more" },
  { icon: "🗺️", stat: "8+", label: "Career roadmaps", sub: "From beginner to architect" },
  { icon: "🧪", stat: "500+", label: "Labs & projects", sub: "Hands-on practice scenarios" },
  { icon: "💬", stat: "100+", label: "Interview Q&As", sub: "Real questions with detailed answers" },
];

export default function Home() {
  return (
    <div style={{ background: "var(--bg)" }}>

      {/* ══════════════════ HERO ══════════════════ */}
      <section className="line-grid" style={{ position: "relative", overflow: "hidden", padding: "100px 24px 96px" }}>
        <div style={{ position: "absolute", top: "-120px", left: "-120px", width: "500px", height: "500px", background: "radial-gradient(circle, rgba(37,99,235,0.14) 0%, transparent 65%)", borderRadius: "50%", pointerEvents: "none" }} />
        <div style={{ position: "absolute", bottom: "-80px", right: "-80px", width: "400px", height: "400px", background: "radial-gradient(circle, rgba(124,58,237,0.10) 0%, transparent 65%)", borderRadius: "50%", pointerEvents: "none" }} />

        <div style={{ maxWidth: "1200px", margin: "0 auto", position: "relative" }}>
          <div className="badge badge-blue" style={{ marginBottom: "28px" }}>
            <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: "#34D399", display: "inline-block", animation: "pulse-dot 2s infinite" }} />
            Learn Anything. Crack Every Exam. Get Hired.
          </div>

          <h1 className="display-xl" style={{ marginBottom: "24px", maxWidth: "860px" }}>
            From{" "}<span className="grad-blue">Beginner</span>{" "}to{" "}
            <span className="grad-blue">Job-Ready</span>
            <br />
            <span style={{ color: "var(--text-2)", fontWeight: 700 }}>
              Tech · Exams · Certifications
            </span>
          </h1>

          <p className="body-lg" style={{ maxWidth: "600px", marginBottom: "16px" }}>
            Expert-written content for DevOps, Cloud, AI, and Platform Engineering —
            plus structured chapter-wise prep for JEE, NEET, GATE, Banking, UPSC, and SSC.
          </p>
          <p style={{ color: "var(--text-4)", fontSize: "15px", maxWidth: "560px", marginBottom: "44px" }}>
            Hands-on labs · Real interview Q&As · PYQs · MCQ practice · Certification prep — all in one place.
          </p>

          <div style={{ display: "flex", gap: "14px", flexWrap: "wrap", marginBottom: "64px" }}>
            <Link href="/academies" className="btn-primary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              Explore Tech Academies <ArrowRight size={17} />
            </Link>
            <Link href="/learn" className="btn-secondary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              📚 Browse Education
            </Link>
            <Link href="/roadmaps" className="btn-secondary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              View Roadmaps
            </Link>
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

      {/* ══════════════════ WHO IS THIS FOR ══════════════════ */}
      <section style={{ padding: "80px 24px", background: "var(--bg-1)", borderTop: "1px solid var(--border)" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "48px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>Start Here</div>
            <h2 className="display-md" style={{ marginBottom: "12px" }}>Who Are You?</h2>
            <p style={{ color: "var(--text-3)", fontSize: "16px", maxWidth: "500px", margin: "0 auto" }}>
              Pick your path — we'll take you from where you are to where you want to be.
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
                    <span style={{ fontSize: "28px" }}>{r.icon}</span>
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
                <div style={{ fontSize: "32px", marginBottom: "8px" }}>{p.icon}</div>
                <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, color: "var(--text-1)", marginBottom: "4px" }}>{p.stat}</div>
                <div style={{ fontWeight: 600, fontSize: "13px", color: "var(--text-2)", marginBottom: "4px" }}>{p.label}</div>
                <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{p.sub}</div>
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
                    <span style={{ fontSize: "24px" }}>{d.icon}</span>
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
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(180px, 1fr))", gap: "2px" }}>
            {journey.map((j, i) => (
              <div key={j.step} style={{
                padding: "28px 24px", background: "var(--bg-1)",
                borderTop: "3px solid",
                borderImage: `linear-gradient(135deg, ${["#3B82F6","#8B5CF6","#10B981","#F59E0B","#EC4899","#06B6D4"][i]}, ${["#8B5CF6","#10B981","#F59E0B","#EC4899","#06B6D4","#3B82F6"][i]}) 1`,
              }}>
                <div style={{ fontFamily: "'JetBrains Mono',monospace", fontSize: "11px", color: "var(--text-4)", fontWeight: 700, marginBottom: "12px" }}>{j.step}</div>
                <div style={{ fontSize: "28px", marginBottom: "10px" }}>{j.icon}</div>
                <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", color: "var(--text-1)", marginBottom: "6px" }}>{j.title}</div>
                <div style={{ color: "var(--text-3)", fontSize: "13px", lineHeight: 1.6 }}>{j.desc}</div>
              </div>
            ))}
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
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
            {academies.slice(0, 6).map(a => (
              <Link key={a.slug} href={`/academies/${a.slug}`} style={{ textDecoration: "none" }}>
                <div className="card-hover" style={{ padding: "24px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }}>
                  <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "12px" }}>
                    <span style={{ fontSize: "36px" }}>{a.icon}</span>
                    <span style={{ background: a.color + "20", color: a.color, fontSize: "11px", fontWeight: 700, padding: "3px 8px", borderRadius: "6px" }}>
                      {a.domains.length} Domains
                    </span>
                  </div>
                  <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "6px", color: "var(--text-1)" }}>{a.title}</h3>
                  <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.5, margin: 0 }}>{a.description.slice(0, 90)}...</p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ CERTIFICATIONS ══════════════════ */}
      <section style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", padding: "80px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "36px", flexWrap: "wrap", gap: "16px" }}>
            <div>
              <div className="label" style={{ marginBottom: "10px" }}>Certification Prep</div>
              <h2 className="display-md">13 Certifications Covered</h2>
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
                    <div style={{ fontSize: "10px", color: "var(--text-4)" }}>{c.level}</div>
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
          <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "24px" }}>

            {/* Education card */}
            <div style={{ padding: "36px", borderRadius: "20px", background: "linear-gradient(135deg,rgba(236,72,153,0.08),rgba(139,92,246,0.08))", border: "1px solid rgba(236,72,153,0.2)" }}>
              <div style={{ fontSize: "40px", marginBottom: "12px" }}>📚</div>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "22px", marginBottom: "10px" }}>Education Academy</h3>
              <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.7, marginBottom: "20px" }}>
                284+ chapters across Class 10, Class 12, JEE, NEET, GATE, Banking, UPSC, SSC, Defence, Career, and Finance. With PYQs, MCQs, and revision notes.
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
              <div style={{ fontSize: "40px", marginBottom: "12px" }}>💬</div>
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
