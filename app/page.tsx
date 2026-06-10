export const runtime = "edge";
import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { certifications, roadmaps, stats } from "@/lib/data/navigation";
import { ArrowRight, BookOpen, FlaskConical, Code2, Trophy, Wrench, Bot, Clock, CheckCircle } from "lucide-react";

const journey = [
  { step: "01", title: "Learn", desc: "Structured knowledge base with expert-written content", icon: "📖" },
  { step: "02", title: "Practice", desc: "Hands-on labs from beginner to production-grade", icon: "🧪" },
  { step: "03", title: "Build", desc: "Real projects that go straight to your portfolio", icon: "🏗️" },
  { step: "04", title: "Troubleshoot", desc: "Fix real production issues with root cause analysis", icon: "🔧" },
  { step: "05", title: "Get Certified", desc: "Structured prep for 13 industry certifications", icon: "🏆" },
  { step: "06", title: "Get Hired", desc: "Interview prep, resume builder, career roadmaps", icon: "💼" },
];

export default function Home() {
  return (
    <div style={{ background: "var(--bg)" }}>

      {/* ══════════════════ HERO ══════════════════ */}
      <section className="line-grid" style={{ position: "relative", overflow: "hidden", padding: "100px 24px 96px" }}>
        {/* Glow orbs */}
        <div style={{ position: "absolute", top: "-120px", left: "-120px", width: "500px", height: "500px", background: "radial-gradient(circle, rgba(37,99,235,0.14) 0%, transparent 65%)", borderRadius: "50%", pointerEvents: "none" }} />
        <div style={{ position: "absolute", bottom: "-80px", right: "-80px", width: "400px", height: "400px", background: "radial-gradient(circle, rgba(124,58,237,0.10) 0%, transparent 65%)", borderRadius: "50%", pointerEvents: "none" }} />

        <div style={{ maxWidth: "1200px", margin: "0 auto", position: "relative" }}>
          {/* Eyebrow */}
          <div className="badge badge-blue" style={{ marginBottom: "28px" }}>
            <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: "#34D399", display: "inline-block", animation: "pulse-dot 2s infinite" }} />
            The Complete Tech Learning Ecosystem
          </div>

          {/* Headline */}
          <h1 className="display-xl" style={{ marginBottom: "28px", maxWidth: "820px" }}>
            Master{" "}
            <span className="grad-blue">DevOps,</span>
            <br />
            Cloud &{" "}
            <span className="grad-blue">AI</span>{" "}
            <span style={{ color: "var(--text-1)" }}>Engineering</span>
          </h1>

          <p className="body-lg" style={{ maxWidth: "560px", marginBottom: "44px" }}>
            6 Academies. 50+ Technologies. Structured roadmaps, hands-on labs,
            real projects, and certification prep — all in one place.
          </p>

          {/* CTAs */}
          <div style={{ display: "flex", gap: "14px", flexWrap: "wrap", marginBottom: "72px" }}>
            <Link href="/academies" className="btn-primary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              Explore Academies <ArrowRight size={17} />
            </Link>
            <Link href="/roadmaps" className="btn-secondary" style={{ fontSize: "15px", padding: "14px 32px" }}>
              View Roadmaps
            </Link>
          </div>

          {/* Stats row */}
          <div style={{ display: "flex", gap: "0", flexWrap: "wrap", borderTop: "1px solid var(--border)", paddingTop: "40px" }}>
            {stats.map((s, i) => (
              <div key={s.label} style={{ paddingRight: "48px", marginRight: "48px", borderRight: i < stats.length - 1 ? "1px solid #0F1E30" : "none" }}>
                <div style={{
                  fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "40px", fontWeight: 800,
                  background: ["linear-gradient(135deg,#60A5FA,#818CF8)", "linear-gradient(135deg,#34D399,#06B6D4)", "linear-gradient(135deg,#A78BFA,#EC4899)", "linear-gradient(135deg,#FCD34D,#FB923C)"][i],
                  WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text", lineHeight: 1,
                }}>{s.value}</div>
                <div style={{ color: "var(--text-4)", fontSize: "13px", fontWeight: 500, marginTop: "6px", letterSpacing: "0.04em" }}>{s.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ JOURNEY ══════════════════ */}
      <section style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", borderBottom: "1px solid var(--border)", padding: "80px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "56px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>Your Path</div>
            <h2 className="display-md" style={{ color: "var(--text-1)" }}>From Zero to Job-Ready</h2>
            <p className="body-md" style={{ marginTop: "12px", maxWidth: "480px", margin: "12px auto 0" }}>
              A complete, proven system used by engineers worldwide
            </p>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(180px, 1fr))", gap: "16px" }}>
            {journey.map((j, i) => (
              <div key={j.step} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px 20px", position: "relative", overflow: "hidden" }}>
                <div style={{ position: "absolute", top: "16px", right: "16px", fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "36px", fontWeight: 800, color: "#0F1E30", lineHeight: 1 }}>{j.step}</div>
                <div style={{ fontSize: "28px", marginBottom: "14px" }}>{j.icon}</div>
                <div className="heading" style={{ color: "var(--text-1)", marginBottom: "8px", fontSize: "16px" }}>{j.title}</div>
                <div style={{ fontSize: "13px", color: "var(--text-4)", lineHeight: 1.6 }}>{j.desc}</div>
                {i < journey.length - 1 && (
                  <div style={{ position: "absolute", right: "-8px", top: "50%", transform: "translateY(-50%)", color: "#1E3A5F", zIndex: 1, fontSize: "18px" }} className="hide-mobile">→</div>
                )}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ ACADEMIES ══════════════════ */}
      <section style={{ padding: "96px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "56px", flexWrap: "wrap", gap: "20px" }}>
            <div>
              <div className="badge badge-blue" style={{ marginBottom: "16px" }}>6 Academies</div>
              <h2 className="display-md" style={{ color: "var(--text-1)" }}>Choose Your Academy</h2>
              <p className="body-md" style={{ marginTop: "10px" }}>Structured paths across every major technology domain</p>
            </div>
            <Link href="/academies" style={{ display: "flex", alignItems: "center", gap: "6px", color: "#60A5FA", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
              View All <ArrowRight size={15} />
            </Link>
          </div>

          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(340px, 1fr))", gap: "20px" }}>
            {academies.map((a) => (
              <Link key={a.slug} href={`/academies/${a.slug}`} style={{ textDecoration: "none" }}>
                <div className="card card-interactive" style={{ padding: "28px", height: "100%", display: "flex", flexDirection: "column" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "18px" }}>
                    <div style={{ width: "48px", height: "48px", borderRadius: "13px", background: `${a.color}18`, border: `1px solid ${a.color}28`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "22px", flexShrink: 0 }}>{a.icon}</div>
                    <div>
                      <div className="heading" style={{ color: "var(--text-1)", fontSize: "16px" }}>{a.title}</div>
                      <div style={{ color: a.color, fontSize: "11px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", marginTop: "2px" }}>{a.subtitle}</div>
                    </div>
                  </div>
                  <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.65, marginBottom: "20px", flexGrow: 1 }}>{a.description}</p>
                  <div style={{ display: "flex", flexWrap: "wrap", gap: "5px", marginBottom: "18px" }}>
                    {a.domains.flatMap(d=>d.technologies).slice(0, 5).map((t) => (
                      <span key={t.slug} style={{ background: `${a.color}10`, border: `1px solid ${a.color}1E`, color: a.color, padding: "3px 9px", borderRadius: "6px", fontSize: "11px", fontWeight: 600 }}>{t.name}</span>
                    ))}
                    {a.domains.flatMap(d=>d.technologies).length > 5 && <span style={{ color: "var(--text-4)", fontSize: "11px", padding: "3px" }}>+{a.domains.flatMap(d=>d.technologies).length - 5} more</span>}
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", paddingTop: "16px", borderTop: "1px solid var(--border)" }}>
                    <span style={{ color: "var(--text-4)", fontSize: "12px" }}>{a.domains.flatMap(d=>d.technologies).length} technologies</span>
                    <span style={{ display: "flex", alignItems: "center", gap: "4px", color: a.color, fontSize: "12px", fontWeight: 600 }}>Enter Academy <ArrowRight size={12} /></span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ ROADMAPS ══════════════════ */}
      <section style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", borderBottom: "1px solid var(--border)", padding: "96px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "52px", flexWrap: "wrap", gap: "20px" }}>
            <div>
              <div className="badge badge-purple" style={{ marginBottom: "16px" }}>Career Paths</div>
              <h2 className="display-md" style={{ color: "var(--text-1)" }}>Learning Roadmaps</h2>
              <p className="body-md" style={{ marginTop: "10px" }}>Step-by-step paths from beginner to job-ready</p>
            </div>
            <Link href="/roadmaps" style={{ display: "flex", alignItems: "center", gap: "6px", color: "#A78BFA", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
              All Roadmaps <ArrowRight size={15} />
            </Link>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "16px" }}>
            {roadmaps.map((r) => (
              <Link key={r.slug} href={`/roadmaps/${r.slug}`} style={{ textDecoration: "none" }}>
                <div className="card card-interactive" style={{ padding: "22px" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "16px" }}>
                    <span style={{ fontSize: "26px" }}>{r.icon}</span>
                    <div>
                      <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{r.title}</div>
                      <div style={{ display: "flex", alignItems: "center", gap: "4px", color: "var(--text-4)", fontSize: "12px", marginTop: "3px" }}><Clock size={11} />{r.duration}</div>
                    </div>
                  </div>
                  <div style={{ display: "flex", flexWrap: "wrap", gap: "5px" }}>
                    {r.steps.map((s, i) => (
                      <span key={s} style={{ background: "rgba(124,58,237,0.08)", border: "1px solid rgba(124,58,237,0.14)", color: "#C4B5FD", padding: "3px 9px", borderRadius: "6px", fontSize: "11px", fontWeight: 500 }}>{i + 1}. {s}</span>
                    ))}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ CERTIFICATIONS ══════════════════ */}
      <section style={{ padding: "96px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "52px", flexWrap: "wrap", gap: "20px" }}>
            <div>
              <div className="badge badge-amber" style={{ marginBottom: "16px" }}>13 Certifications</div>
              <h2 className="display-md" style={{ color: "var(--text-1)" }}>Certification Hub</h2>
              <p className="body-md" style={{ marginTop: "10px" }}>Industry-recognized credentials with structured prep</p>
            </div>
            <Link href="/certifications" style={{ display: "flex", alignItems: "center", gap: "6px", color: "#FCD34D", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
              All Certs <ArrowRight size={15} />
            </Link>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "10px" }}>
            {certifications.map((c) => (
              <Link key={c.id} href={`/certifications/${c.id}`} style={{ textDecoration: "none" }}>
                <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px", padding: "16px 18px", display: "flex", alignItems: "center", justifyContent: "space-between", transition: "border-color 0.2s" }}>
                  <div>
                    <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)", marginBottom: "3px" }}>{c.name}</div>
                    <div style={{ fontSize: "11px", color: c.color, fontWeight: 600 }}>{c.provider} · {c.code}</div>
                  </div>
                  <span style={{
                    flexShrink: 0, marginLeft: "12px", padding: "2px 8px", borderRadius: "100px", fontSize: "10px", fontWeight: 700, letterSpacing: "0.04em",
                    background: c.level === "Expert" ? "rgba(244,63,94,0.1)" : c.level === "Professional" ? "rgba(245,158,11,0.1)" : "rgba(16,185,129,0.1)",
                    color: c.level === "Expert" ? "#FB7185" : c.level === "Professional" ? "#FCD34D" : "#34D399",
                  }}>{c.level}</span>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ PLATFORM FEATURES ══════════════════ */}
      <section style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", borderBottom: "1px solid var(--border)", padding: "96px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{ textAlign: "center", marginBottom: "56px" }}>
            <div className="label" style={{ marginBottom: "12px" }}>Everything Included</div>
            <h2 className="display-md" style={{ color: "var(--text-1)" }}>Built for Real Engineers</h2>
            <p className="body-md" style={{ marginTop: "12px", maxWidth: "460px", margin: "12px auto 0" }}>
              Not just theory. Every section is built around what you need on the job.
            </p>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))", gap: "16px" }}>
            {[
              { icon: <FlaskConical size={22} />, title: "Hands-on Labs", desc: "Step-by-step guided exercises from beginner to production-level", href: "/labs", color: "#10B981", badge: "500+ Labs" },
              { icon: <Code2 size={22} />, title: "Real Projects", desc: "Build actual systems that go straight into your portfolio", href: "/projects", color: "#3B82F6", badge: "3 Levels" },
              { icon: <BookOpen size={22} />, title: "Interview Prep", desc: "MCQs, scenario questions, mock interviews for all levels", href: "/interview", color: "#8B5CF6", badge: "All Levels" },
              { icon: <Wrench size={22} />, title: "Troubleshooting", desc: "Root cause analysis and fix guides for real production issues", href: "/troubleshooting", color: "#F43F5E", badge: "Production" },
              { icon: <Bot size={22} />, title: "AI Assistant", desc: "Expert AI answering DevOps, Cloud, and engineering questions", href: "/ai-assistant", color: "#EC4899", badge: "AI-Powered" },
              { icon: <Trophy size={22} />, title: "Career Hub", desc: "Resume builder, interview tracker, job prep, freelancing guide", href: "/career", color: "#F59E0B", badge: "Coming Soon" },
            ].map((f) => (
              <Link key={f.title} href={f.href} style={{ textDecoration: "none" }}>
                <div className="card card-interactive" style={{ padding: "28px", height: "100%" }}>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "16px" }}>
                    <div style={{ width: "44px", height: "44px", borderRadius: "12px", background: `${f.color}14`, border: `1px solid ${f.color}22`, display: "flex", alignItems: "center", justifyContent: "center", color: f.color }}>{f.icon}</div>
                    <span style={{ background: `${f.color}12`, border: `1px solid ${f.color}20`, color: f.color, padding: "2px 8px", borderRadius: "100px", fontSize: "10px", fontWeight: 700 }}>{f.badge}</span>
                  </div>
                  <div className="heading" style={{ color: "var(--text-1)", fontSize: "15px", marginBottom: "8px" }}>{f.title}</div>
                  <div style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6 }}>{f.desc}</div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ══════════════════ WHY SYNFRACORE ══════════════════ */}
      <section style={{ padding: "96px 24px" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div className="why-grid" style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "80px", alignItems: "center" }}>
            <div>
              <div className="label" style={{ marginBottom: "12px" }}>Why SynfraCore</div>
              <h2 className="display-md" style={{ color: "var(--text-1)", marginBottom: "20px" }}>
                Not just a course.<br />
                <span className="grad-blue">A complete ecosystem.</span>
              </h2>
              <p className="body-lg" style={{ marginBottom: "32px" }}>
                Most platforms give you videos. We give you the full journey — structured knowledge, real practice, a community, and a clear path to employment.
              </p>
              <div style={{ display: "flex", flexDirection: "column", gap: "14px" }}>
                {[
                  "Content written by practitioners, not content farms",
                  "Every technology has 14 structured sections",
                  "Labs that mirror real production environments",
                  "Interview prep at every level including architect",
                  "Certifications across AWS, Azure, K8s, HashiCorp, Red Hat",
                  "AI Assistant trained on DevOps and Cloud expertise",
                ].map((point) => (
                  <div key={point} style={{ display: "flex", alignItems: "flex-start", gap: "10px" }}>
                    <CheckCircle size={16} style={{ color: "#34D399", flexShrink: 0, marginTop: "2px" }} />
                    <span style={{ color: "var(--text-3)", fontSize: "14px", lineHeight: 1.6 }}>{point}</span>
                  </div>
                ))}
              </div>
            </div>
            <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "12px" }}>
              {[
                { num: "50+", label: "Technologies", color: "#3B82F6" },
                { num: "6", label: "Academies", color: "#8B5CF6" },
                { num: "13", label: "Certifications", color: "#F59E0B" },
                { num: "14", label: "Sections per Tech", color: "#10B981" },
                { num: "3", label: "Lab Levels", color: "#EC4899" },
                { num: "∞", label: "Career Potential", color: "#06B6D4" },
              ].map((s) => (
                <div key={s.label} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px", textAlign: "center" }}>
                  <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "32px", fontWeight: 800, color: s.color, lineHeight: 1 }}>{s.num}</div>
                  <div style={{ color: "var(--text-4)", fontSize: "12px", fontWeight: 500, marginTop: "8px" }}>{s.label}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ══════════════════ CTA ══════════════════ */}
      <section style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", padding: "96px 24px" }}>
        <div style={{ maxWidth: "760px", margin: "0 auto", textAlign: "center" }}>
          <div className="badge badge-green" style={{ marginBottom: "24px", justifyContent: "center" }}>
            Free to Start
          </div>
          <h2 className="display-md" style={{ color: "var(--text-1)", marginBottom: "20px" }}>
            Ready to start your journey?
          </h2>
          <p className="body-lg" style={{ marginBottom: "40px" }}>
            Join engineers mastering DevOps, Cloud, and AI. No credit card required.
            Start learning today.
          </p>
          <div style={{ display: "flex", gap: "14px", justifyContent: "center", flexWrap: "wrap" }}>
            <Link href="/academies" className="btn-primary" style={{ fontSize: "15px", padding: "15px 36px" }}>
              Start Learning Free <ArrowRight size={17} />
            </Link>
            <Link href="/roadmaps" className="btn-secondary" style={{ fontSize: "15px", padding: "15px 36px" }}>
              View Roadmaps
            </Link>
          </div>
          <p style={{ color: "var(--text-4)", fontSize: "12px", marginTop: "24px" }}>
            Learn → Practice → Build → Troubleshoot → Get Certified → Get Hired
          </p>
        </div>
      </section>

    </div>
  );
}
