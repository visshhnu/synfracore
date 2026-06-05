import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { certifications, roadmaps, stats } from "@/lib/data/navigation";
import { ArrowRight, BookOpen, FlaskConical, Code2, Trophy, Wrench, Bot, Clock } from "lucide-react";

export const runtime = "edge";

export default function Home() {
  return (
    <div style={{ background: "#050A14", minHeight: "100vh" }}>

      {/* ── HERO ── */}
      <section style={{
        background: "linear-gradient(135deg, #050A14 0%, #0C1524 100%)",
        borderBottom: "1px solid #1E2D47",
        padding: "80px 24px",
      }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
          <div style={{
            display: "inline-flex", alignItems: "center", gap: "8px",
            background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.3)",
            borderRadius: "100px", padding: "6px 16px", marginBottom: "32px",
            fontSize: "13px", fontWeight: 600, color: "#60A5FA",
          }}>
            <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: "#34D399", display: "inline-block" }} />
            The Complete Tech Learning Ecosystem
          </div>

          <h1 style={{
            fontFamily: "'Syne', sans-serif",
            fontSize: "clamp(42px, 7vw, 80px)",
            fontWeight: 800, lineHeight: 1.05,
            letterSpacing: "-0.03em", marginBottom: "24px",
            color: "#E8EDF5",
          }}>
            Master{" "}
            <span style={{ background: "linear-gradient(135deg, #60A5FA, #A78BFA)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text" }}>DevOps,</span>
            <br />
            Cloud &{" "}
            <span style={{ background: "linear-gradient(135deg, #A78BFA, #34D399)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text" }}>AI</span>
            <br />
            Engineering
          </h1>

          <p style={{ color: "#9BA8C0", fontSize: "18px", lineHeight: 1.7, maxWidth: "560px", marginBottom: "40px" }}>
            6 Academies. 50+ Technologies. Structured roadmaps, hands-on labs,
            real projects, and certification prep — all in one platform.
          </p>

          <div style={{ display: "flex", gap: "16px", flexWrap: "wrap", marginBottom: "56px" }}>
            <Link href="/academies" style={{
              display: "inline-flex", alignItems: "center", gap: "8px",
              background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
              color: "#fff", padding: "14px 32px", borderRadius: "12px",
              fontSize: "15px", fontWeight: 600, textDecoration: "none",
              boxShadow: "0 8px 32px rgba(59,130,246,0.3)",
            }}>
              Explore Academies <ArrowRight size={18} />
            </Link>
            <Link href="/roadmaps" style={{
              display: "inline-flex", alignItems: "center", gap: "8px",
              background: "transparent", color: "#E8EDF5",
              padding: "14px 32px", borderRadius: "12px",
              fontSize: "15px", fontWeight: 600, textDecoration: "none",
              border: "1px solid #2A3F5E",
            }}>
              View Roadmaps
            </Link>
          </div>

          {/* Stats */}
          <div style={{ display: "flex", gap: "48px", flexWrap: "wrap" }}>
            {stats.map((s, i) => (
              <div key={s.label}>
                <div style={{
                  fontFamily: "'Syne', sans-serif", fontSize: "36px", fontWeight: 800,
                  background: ["linear-gradient(135deg,#60A5FA,#818CF8)", "linear-gradient(135deg,#34D399,#06B6D4)", "linear-gradient(135deg,#A78BFA,#F472B6)", "linear-gradient(135deg,#FCD34D,#FB923C)"][i],
                  WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text",
                }}>{s.value}</div>
                <div style={{ color: "#6B7A99", fontSize: "13px", fontWeight: 500, marginTop: "4px" }}>{s.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── ACADEMIES ── */}
      <section style={{ maxWidth: "1200px", margin: "0 auto", padding: "80px 24px" }}>
        <div style={{ textAlign: "center", marginBottom: "56px" }}>
          <span style={{
            display: "inline-block", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)",
            color: "#60A5FA", fontSize: "12px", fontWeight: 600, letterSpacing: "0.1em",
            textTransform: "uppercase", padding: "5px 14px", borderRadius: "100px", marginBottom: "16px",
          }}>6 Academies</span>
          <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, color: "#E8EDF5", letterSpacing: "-0.02em" }}>
            Choose Your Academy
          </h2>
          <p style={{ color: "#6B7A99", fontSize: "16px", marginTop: "12px" }}>
            Structured learning paths across every major technology domain
          </p>
        </div>

        <div style={{ display: "grid", gap: "20px", gridTemplateColumns: "repeat(auto-fit, minmax(320px, 1fr))" }}>
          {academies.map((academy) => (
            <Link key={academy.slug} href={`/academies/${academy.slug}`} style={{ textDecoration: "none" }}>
              <div style={{
                background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "16px",
                padding: "28px", height: "100%", display: "flex", flexDirection: "column",
                transition: "border-color 0.2s",
              }}>
                <div style={{
                  width: "52px", height: "52px", borderRadius: "14px",
                  background: `${academy.color}20`, border: `1px solid ${academy.color}30`,
                  display: "flex", alignItems: "center", justifyContent: "center",
                  fontSize: "24px", marginBottom: "18px",
                }}>{academy.icon}</div>
                <h3 style={{ fontFamily: "'Syne', sans-serif", fontSize: "19px", fontWeight: 700, color: "#E8EDF5", marginBottom: "4px" }}>{academy.title}</h3>
                <p style={{ color: academy.color, fontSize: "12px", fontWeight: 600, letterSpacing: "0.06em", textTransform: "uppercase", marginBottom: "12px" }}>{academy.subtitle}</p>
                <p style={{ color: "#6B7A99", fontSize: "13px", lineHeight: 1.6, marginBottom: "20px", flexGrow: 1 }}>{academy.description}</p>
                <div style={{ display: "flex", flexWrap: "wrap", gap: "6px", marginBottom: "16px" }}>
                  {academy.technologies.slice(0, 5).map((tech) => (
                    <span key={tech.slug} style={{
                      background: `${academy.color}12`, border: `1px solid ${academy.color}20`,
                      color: academy.color, padding: "3px 9px", borderRadius: "100px", fontSize: "11px", fontWeight: 600,
                    }}>{tech.name}</span>
                  ))}
                  {academy.technologies.length > 5 && <span style={{ color: "#6B7A99", fontSize: "11px", padding: "3px 6px" }}>+{academy.technologies.length - 5}</span>}
                </div>
                <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", paddingTop: "14px", borderTop: "1px solid #1E2D47" }}>
                  <span style={{ color: "#6B7A99", fontSize: "12px" }}>{academy.technologies.length} technologies</span>
                  <span style={{ display: "flex", alignItems: "center", gap: "4px", color: academy.color, fontSize: "12px", fontWeight: 600 }}>Explore <ArrowRight size={13} /></span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </section>

      {/* ── ROADMAPS ── */}
      <section style={{ background: "#0C1524", borderTop: "1px solid #1E2D47", borderBottom: "1px solid #1E2D47" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "80px 24px" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "48px", flexWrap: "wrap", gap: "16px" }}>
            <div>
              <span style={{ display: "inline-block", background: "rgba(139,92,246,0.1)", border: "1px solid rgba(139,92,246,0.2)", color: "#A78BFA", fontSize: "12px", fontWeight: 600, letterSpacing: "0.1em", textTransform: "uppercase", padding: "5px 14px", borderRadius: "100px", marginBottom: "14px" }}>Career Paths</span>
              <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(26px, 3.5vw, 38px)", fontWeight: 800, color: "#E8EDF5" }}>Learning Roadmaps</h2>
            </div>
            <Link href="/roadmaps" style={{ color: "#A78BFA", fontSize: "14px", fontWeight: 600, textDecoration: "none", display: "flex", alignItems: "center", gap: "4px" }}>All Roadmaps <ArrowRight size={15} /></Link>
          </div>
          <div style={{ display: "grid", gap: "16px", gridTemplateColumns: "repeat(auto-fit, minmax(280px, 1fr))" }}>
            {roadmaps.map((r) => (
              <Link key={r.slug} href={`/roadmaps/${r.slug}`} style={{ textDecoration: "none" }}>
                <div style={{ background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "14px", padding: "22px" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "14px" }}>
                    <span style={{ fontSize: "28px" }}>{r.icon}</span>
                    <div>
                      <div style={{ fontWeight: 700, fontSize: "15px", color: "#E8EDF5" }}>{r.title}</div>
                      <div style={{ display: "flex", alignItems: "center", gap: "4px", color: "#6B7A99", fontSize: "12px", marginTop: "2px" }}><Clock size={11} />{r.duration}</div>
                    </div>
                  </div>
                  <div style={{ display: "flex", flexWrap: "wrap", gap: "5px" }}>
                    {r.steps.map((step, i) => (
                      <span key={step} style={{ background: "rgba(139,92,246,0.08)", border: "1px solid rgba(139,92,246,0.15)", color: "#C4B5FD", padding: "3px 9px", borderRadius: "100px", fontSize: "11px" }}>{i + 1}. {step}</span>
                    ))}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ── CERTIFICATIONS ── */}
      <section style={{ maxWidth: "1200px", margin: "0 auto", padding: "80px 24px" }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-end", marginBottom: "48px", flexWrap: "wrap", gap: "16px" }}>
          <div>
            <span style={{ display: "inline-block", background: "rgba(245,158,11,0.1)", border: "1px solid rgba(245,158,11,0.2)", color: "#FCD34D", fontSize: "12px", fontWeight: 600, letterSpacing: "0.1em", textTransform: "uppercase", padding: "5px 14px", borderRadius: "100px", marginBottom: "14px" }}>13 Certifications</span>
            <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(26px, 3.5vw, 38px)", fontWeight: 800, color: "#E8EDF5" }}>Certification Hub</h2>
            <p style={{ color: "#6B7A99", fontSize: "15px", marginTop: "8px" }}>Comprehensive prep for industry&apos;s most in-demand certifications</p>
          </div>
          <Link href="/certifications" style={{ color: "#FCD34D", fontSize: "14px", fontWeight: 600, textDecoration: "none", display: "flex", alignItems: "center", gap: "4px" }}>All Certs <ArrowRight size={15} /></Link>
        </div>
        <div style={{ display: "grid", gap: "10px", gridTemplateColumns: "repeat(auto-fill, minmax(240px, 1fr))" }}>
          {certifications.map((cert) => (
            <Link key={cert.id} href={`/certifications/${cert.id}`} style={{ textDecoration: "none" }}>
              <div style={{ background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "12px", padding: "16px 20px", display: "flex", alignItems: "center", justifyContent: "space-between" }}>
                <div>
                  <div style={{ fontSize: "13px", fontWeight: 700, color: "#E8EDF5", marginBottom: "2px" }}>{cert.name}</div>
                  <div style={{ fontSize: "11px", color: cert.color, fontWeight: 600 }}>{cert.provider} · {cert.code}</div>
                </div>
                <span style={{
                  background: cert.level === "Expert" ? "rgba(244,63,94,0.1)" : cert.level === "Professional" ? "rgba(245,158,11,0.1)" : "rgba(16,185,129,0.1)",
                  color: cert.level === "Expert" ? "#FB7185" : cert.level === "Professional" ? "#FCD34D" : "#34D399",
                  padding: "2px 8px", borderRadius: "100px", fontSize: "10px", fontWeight: 600, flexShrink: 0, marginLeft: "12px",
                }}>{cert.level}</span>
              </div>
            </Link>
          ))}
        </div>
      </section>

      {/* ── QUICK LINKS ── */}
      <section style={{ background: "#0C1524", borderTop: "1px solid #1E2D47" }}>
        <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "80px 24px" }}>
          <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(26px, 3.5vw, 38px)", fontWeight: 800, color: "#E8EDF5", marginBottom: "40px", textAlign: "center" }}>
            Everything You Need to Get Hired
          </h2>
          <div style={{ display: "grid", gap: "16px", gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))" }}>
            {[
              { icon: <FlaskConical size={22} />, title: "Hands-on Labs", desc: "Beginner to production-level", href: "/labs", color: "#10B981" },
              { icon: <Code2 size={22} />, title: "Real Projects", desc: "Build portfolio projects", href: "/projects", color: "#3B82F6" },
              { icon: <BookOpen size={22} />, title: "Interview Prep", desc: "All levels, all formats", href: "/interview", color: "#8B5CF6" },
              { icon: <Wrench size={22} />, title: "Troubleshooting", desc: "Fix production issues", href: "/troubleshooting", color: "#F43F5E" },
              { icon: <Bot size={22} />, title: "AI Assistant", desc: "Expert tech answers", href: "/ai-assistant", color: "#EC4899" },
              { icon: <Trophy size={22} />, title: "Career Hub", desc: "Resume to job offer", href: "/career", color: "#F59E0B" },
            ].map((item) => (
              <Link key={item.title} href={item.href} style={{ textDecoration: "none" }}>
                <div style={{ background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "14px", padding: "24px", textAlign: "center" }}>
                  <div style={{ color: item.color, display: "flex", justifyContent: "center", marginBottom: "12px" }}>{item.icon}</div>
                  <div style={{ fontWeight: 700, fontSize: "15px", color: "#E8EDF5", marginBottom: "4px" }}>{item.title}</div>
                  <div style={{ color: "#6B7A99", fontSize: "12px" }}>{item.desc}</div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ── CTA ── */}
      <section style={{ maxWidth: "1200px", margin: "0 auto", padding: "80px 24px" }}>
        <div style={{ background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "60px 40px", textAlign: "center" }}>
          <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, color: "#E8EDF5", marginBottom: "16px" }}>
            Learn → Practice → Build → Get Hired
          </h2>
          <p style={{ color: "#9BA8C0", fontSize: "16px", marginBottom: "32px", maxWidth: "500px", margin: "0 auto 32px" }}>
            Join engineers mastering DevOps, Cloud, and AI skills on SynfraCore
          </p>
          <Link href="/academies" style={{
            display: "inline-flex", alignItems: "center", gap: "8px",
            background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
            color: "#fff", padding: "14px 36px", borderRadius: "12px",
            fontSize: "15px", fontWeight: 600, textDecoration: "none",
            boxShadow: "0 8px 32px rgba(59,130,246,0.3)",
          }}>
            Start Learning Free <ArrowRight size={18} />
          </Link>
        </div>
      </section>

    </div>
  );
}
