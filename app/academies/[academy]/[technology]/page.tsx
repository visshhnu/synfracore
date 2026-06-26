export const runtime = "edge";
import Link from "next/link";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { getAcademy } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";
import { ArrowRight, Clock, Target, BookOpen } from "lucide-react";

type Props = { params: Promise<{ academy: string; technology: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { academy: aSlug, technology: tSlug } = await params;
  const academy = getAcademy(aSlug);
  const tech = academy?.domains.flatMap(d => d.technologies).find(t => t.slug === tSlug);
  if (!academy || !tech) return { title: "SynfraCore" };
  return {
    title: `${tech.name} — Complete Guide | ${academy.title} | SynfraCore`,
    description: `Learn ${tech.name} from scratch to production. Overview, fundamentals, intermediate patterns, advanced topics, hands-on labs, real projects, interview prep, and certification guide.`,
    keywords: [tech.name, `learn ${tech.name}`, `${tech.name} tutorial`, `${tech.name} interview questions`, `${tech.name} certification`, "SynfraCore"],
    alternates: { canonical: `https://synfracore.com/academies/${aSlug}/${tSlug}` },
    openGraph: {
      title: `${tech.name} — Complete Guide | SynfraCore`,
      description: tech.description,
    },
  };
}

export default async function TechnologyPage({ params }: Props) {
  const { academy: aSlug, technology: tSlug } = await params;
  const academy = getAcademy(aSlug);
  if (!academy) redirect("/academies");

  const tech = academy.domains.flatMap(d => d.technologies).find(t => t.slug === tSlug);
  if (!tech) redirect(`/academies/${aSlug}`);

  const domain = academy.domains.find(d => d.technologies.some(t => t.slug === tSlug));

  // Academy type determines card content
  const isTech = ["devops", "cloud", "databases", "ai", "data", "security"].includes(aSlug);
  const isHealth = ["healthcare", "essentials"].includes(aSlug);
  const isExam = ["exams", "education"].includes(aSlug);

  // Section metadata — context-aware by academy type
  const sectionInfo: Record<string, { icon: string; label: string; time: string; desc: string; what: string[] }> = {
    overview:    { icon: "[R]", label: "Overview",       time: "10 min",  desc: "What it is, why it matters, and where it fits",
      what: isTech ? ["Core concept", "Architecture", "Key use cases", "When to use it"]
          : isHealth ? ["What it covers", "Why it matters", "Key topics", "Who this is for"]
          : ["Exam overview", "Syllabus", "Pattern", "Scoring"] },
    fundamentals:{ icon: "[F]", label: "Fundamentals",   time: "2–3 hrs", desc: "Core concepts from the ground up",
      what: isTech ? ["Installation", "Core commands", "Basic concepts", "First project"]
          : isHealth ? ["Core concepts", "Key definitions", "Essential facts", "Foundations"]
          : ["Core topics", "Key concepts", "Formula lists", "Basic problems"] },
    intermediate:{ icon: "⚡", label: "Intermediate",   time: "4–6 hrs", desc: "Real-world patterns and deeper understanding",
      what: isTech ? ["Production patterns", "Best practices", "Common pitfalls", "Real examples"]
          : isHealth ? ["Applied concepts", "Case studies", "Common scenarios", "Deeper understanding"]
          : ["Moderate problems", "Previous year questions", "Topic-wise practice", "Strategy"] },
    advanced:    { icon: "[^]", label: "Advanced",       time: "6–8 hrs", desc: "Expert-level mastery",
      what: isTech ? ["Scale challenges", "Security", "Performance", "Enterprise patterns"]
          : isHealth ? ["Advanced scenarios", "Complex cases", "Expert knowledge", "Certification prep"]
          : ["Hard problems", "Advanced topics", "Exam strategy", "Time management"] },
    labs:        { icon: "[L]", label: "Hands-on Labs",  time: "3–5 hrs", desc: "Practical exercises and scenarios",
      what: isTech ? ["Setup lab", "Step-by-step tasks", "Troubleshooting", "Validation"]
          : isHealth ? ["Practice scenarios", "Case-based exercises", "Apply knowledge", "Self-assessment"]
          : ["Practice sets", "Mock tests", "Timed exercises", "Answer analysis"] },
    projects:    { icon: "[P]", label: "Projects",       time: "5–10 hrs", desc: "Portfolio-ready projects and case studies",
      what: isTech ? ["Project spec", "Architecture", "Step-by-step build", "Portfolio tips"]
          : isHealth ? ["Case studies", "Real scenarios", "Coding exercises", "Portfolio work"]
          : ["Full mock test", "Topic project", "Study plan", "Progress tracker"] },
    interview:   { icon: "[Q]", label: "Interview Q&A",  time: "2–3 hrs", desc: "Most-asked questions with detailed answers",
      what: isTech ? ["Core concepts", "Scenario questions", "Architecture Qs", "Gotchas"]
          : isHealth ? ["Certification Q&A", "Exam-style questions", "Key definitions", "Quick review"]
          : ["Frequently asked", "Short answer", "Key topics", "Viva prep"] },
    troubleshooting:{ icon: "[T]", label: "Troubleshooting", time: "2 hrs", desc: "Debug issues and fix common mistakes",
      what: isTech ? ["Common errors", "Debug workflow", "RCA examples", "Fix patterns"]
          : isHealth ? ["Common mistakes", "Misconceptions", "Tricky topics", "Clarifications"]
          : ["Common mistakes", "Error analysis", "Weak areas", "Correction guide"] },
    certification:{ icon: "[C]", label: "Certification", time: "4–6 hrs", desc: "Exam guide and preparation strategies",
      what: ["Exam objectives", "Study plan", "Practice questions", "Readiness check"] },
    cheatsheets: { icon: "[S]", label: "Cheatsheet",     time: "15 min",  desc: "Quick reference for revision and review",
      what: isTech ? ["Key commands", "Syntax reference", "Common patterns", "Quick lookups"]
          : isHealth ? ["Key formulas", "Quick definitions", "Code lists", "At-a-glance guide"]
          : ["Formula sheet", "Key facts", "Topic summary", "Quick revision"] },
    roadmap:     { icon: "[M]", label: "Roadmap",        time: "5 min",   desc: "Structured learning path from start to mastery",
      what: isTech ? ["Phase 1: Basics", "Phase 2: Practice", "Phase 3: Production", "Phase 4: Expert"]
          : isHealth ? ["Week 1–2: Foundation", "Week 3–4: Core", "Week 5–6: Advanced", "Week 7–8: Exam prep"]
          : ["Month 1: Basics", "Month 2: Practice", "Month 3: Mock tests", "Month 4: Final prep"] },
  };

  const availableSections = techSections.filter(s =>
    ["overview","fundamentals","intermediate","advanced","labs","projects","interview","troubleshooting","certification","cheatsheets"].includes(s.slug)
  );

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "40px 24px" }}>

      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px", flexWrap: "wrap" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <Link href="/academies" style={{ color: "var(--text-4)", textDecoration: "none" }}>Academies</Link>›
        <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{academy.title}</Link>›
        <span style={{ color: "var(--text-2)" }}>{tech.name}</span>
      </nav>

      {/* Header */}
      <div style={{ marginBottom: "36px" }}>
        <div style={{ display: "flex", alignItems: "flex-start", gap: "16px", marginBottom: "14px" }}>
          <span style={{ fontSize: "44px" }}>{tech.icon}</span>
          <div>
            <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "6px" }}>
              <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "28px", margin: 0 }}>{tech.name}</h1>
              <span style={{ padding: "3px 10px", borderRadius: "6px", fontSize: "11px", fontWeight: 700, background: academy.color + "20", color: academy.color }}>{tech.level}</span>
            </div>
            <p style={{ color: "var(--text-3)", fontSize: "15px", margin: 0 }}>{tech.description}</p>
          </div>
        </div>

        {/* Quick info row */}
        <div style={{ display: "flex", gap: "16px", flexWrap: "wrap", fontSize: "13px", color: "var(--text-4)" }}>
          <span style={{ display: "flex", alignItems: "center", gap: "5px" }}><BookOpen size={13} /> {domain?.name}</span>
          <span style={{ display: "flex", alignItems: "center", gap: "5px" }}>{tech.level} level</span>
          {tech.tags?.slice(0, 4).map(t => (
            <span key={t} style={{ padding: "2px 8px", borderRadius: "10px", background: "var(--bg-2)", fontWeight: 500 }}>{t}</span>
          ))}
        </div>
      </div>

      {/* Learning module grid — THE KEY STRUCTURE */}
      <div style={{ marginBottom: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "6px" }}>
          Complete Learning Modules
        </h2>
        <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "20px" }}>
          Follow the sequence below or jump to what you need. Each module builds on the previous.
        </p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "12px" }}>
          {availableSections.map((section, i) => {
            const info = sectionInfo[section.slug];
            const isCore = ["overview","fundamentals","intermediate","advanced"].includes(section.slug);
            return (
              <Link key={section.slug} href={`/academies/${aSlug}/${tSlug}/${section.slug}`} style={{ textDecoration: "none" }}>
                <div className="card-hover" style={{
                  padding: "20px", borderRadius: "12px",
                  border: isCore ? `1px solid ${academy.color}30` : "1px solid var(--border)",
                  background: isCore ? academy.color + "05" : "var(--bg-1)",
                  cursor: "pointer", position: "relative"
                }}>
                  {i === 0 && (
                    <span style={{ position: "absolute", top: "10px", right: "10px", fontSize: "10px", background: "#10B981", color: "white", padding: "2px 6px", borderRadius: "4px", fontWeight: 700 }}>START</span>
                  )}
                  <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "8px" }}>
                    <span style={{ fontSize: "20px" }}>{info?.icon || section.icon}</span>
                    <span style={{ fontWeight: 700, fontSize: "14px", color: "var(--text-1)" }}>{info?.label || section.label}</span>
                  </div>
                  <p style={{ fontSize: "12px", color: "var(--text-3)", lineHeight: 1.5, margin: "0 0 10px" }}>{info?.desc || section.description}</p>
                  {info?.what && (
                    <div style={{ display: "flex", flexDirection: "column", gap: "3px" }}>
                      {info.what.map(w => (
                        <span key={w} style={{ fontSize: "11px", color: "var(--text-4)" }}>· {w}</span>
                      ))}
                    </div>
                  )}
                  <div style={{ marginTop: "10px", display: "flex", alignItems: "center", gap: "6px", fontSize: "11px", color: "var(--text-4)" }}>
                    <Clock size={10} /> {info?.time || "1–2 hrs"}
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </div>

      {/* Suggested path */}
      <div style={{ padding: "20px 24px", borderRadius: "12px", background: "linear-gradient(135deg,rgba(59,130,246,0.05),rgba(16,185,129,0.05))", border: "1px solid rgba(59,130,246,0.15)", marginBottom: "32px" }}>
        <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "12px" }}>+ Suggested learning sequence</div>
        <div style={{ display: "flex", gap: "6px", alignItems: "center", flexWrap: "wrap", fontSize: "12px" }}>
          {["Overview", "Fundamentals", "Intermediate", "Labs", "Advanced", "Projects", "Interview Q&A", "Certification"].map((s, i, arr) => (
            <span key={s} style={{ display: "flex", alignItems: "center", gap: "6px" }}>
              <span style={{ padding: "4px 12px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-2)", fontWeight: 600 }}>{s}</span>
              {i < arr.length - 1 && <ArrowRight size={10} color="var(--text-4)" />}
            </span>
          ))}
        </div>
      </div>

      {/* Related technologies */}
      {domain && domain.technologies.filter(t => t.slug !== tSlug).length > 0 && (
        <div>
          <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "14px" }}>
            Also in {domain.name}
          </h3>
          <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
            {domain.technologies.filter(t => t.slug !== tSlug).slice(0, 6).map(t => (
              <Link key={t.slug} href={`/academies/${aSlug}/${t.slug}`} style={{ textDecoration: "none" }}>
                <div style={{ display: "flex", alignItems: "center", gap: "8px", padding: "8px 14px", borderRadius: "8px", border: "1px solid var(--border)", background: "var(--bg-1)", fontSize: "13px", fontWeight: 600, color: "var(--text-2)" }} className="card-hover">
                  <span>{t.icon}</span> {t.name}
                </div>
              </Link>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
