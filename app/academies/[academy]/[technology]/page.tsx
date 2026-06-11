export const runtime = "edge";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getAcademy, getTechnology } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";

type Props = { params: Promise<{ academy: string; technology: string }> };

export async function generateMetadata({ params }: Props) {
  const { academy: aSlug, technology: tSlug } = await params;
  const tech = getTechnology(aSlug, tSlug);
  if (!tech) return {};
  return { title: `${tech.name} — SynfraCore`, description: tech.description };
}

const levelColors = {
  Beginner:     { bg: "rgba(16,185,129,0.1)",  border: "rgba(16,185,129,0.25)",  text: "#34D399" },
  Intermediate: { bg: "rgba(245,158,11,0.1)",  border: "rgba(245,158,11,0.25)",  text: "#FCD34D" },
  Advanced:     { bg: "rgba(244,63,94,0.1)",   border: "rgba(244,63,94,0.25)",   text: "#FB7185" },
};

export default async function TechnologyPage({ params }: Props) {
  const { academy: aSlug, technology: tSlug } = await params;
  const academy = getAcademy(aSlug);
  const tech = getTechnology(aSlug, tSlug);
  if (!academy || !tech) redirect("/academies");
  const lc = levelColors[tech.level];

  return (
    <>
      {/* Tech layout: sidebar + content */}
      <div style={{ display: "flex", minHeight: "calc(100vh - 64px)" }}>

        {/* ── STICKY SIDEBAR ── */}
        <aside style={{
          width: "252px",
          flexShrink: 0,
          borderRight: "1px solid var(--border)",
          background: "var(--bg-1)",
          position: "sticky",
          top: 0,
          height: "100vh",
          overflowY: "auto",
          display: "flex",
          flexDirection: "column",
        }} className="sidebar-desktop">

          {/* Back + tech header */}
          <div style={{ padding: "20px 16px 16px", borderBottom: "1px solid var(--border)" }}>
            <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", fontSize: "12px", textDecoration: "none", display: "flex", alignItems: "center", gap: "4px", marginBottom: "14px" }}>
              ← {academy.title}
            </Link>
            <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "10px" }}>
              <span style={{ fontSize: "24px" }}>{tech.icon}</span>
              <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{tech.name}</span>
            </div>
            <span style={{ background: lc.bg, border: `1px solid ${lc.border}`, color: lc.text, padding: "2px 10px", borderRadius: "100px", fontSize: "10px", fontWeight: 700 }}>
              {tech.level}
            </span>
          </div>

          {/* Navigation */}
          <nav style={{ padding: "12px 10px", flex: 1 }}>
            {techSections.map((section) => (
              <Link key={section.slug}
                href={`/academies/${aSlug}/${tSlug}/${section.slug}`}
                style={{
                  display: "flex", alignItems: "center", gap: "10px",
                  padding: "9px 12px", borderRadius: "9px",
                  textDecoration: "none", color: "var(--text-3)",
                  fontSize: "13px", fontWeight: 500, marginBottom: "1px",
                  transition: "all 0.15s",
                }}
                className="sidebar-link"
              >
                <span style={{ fontSize: "15px", width: "20px", textAlign: "center" }}>{section.icon}</span>
                {section.label}
              </Link>
            ))}
          </nav>

          {/* Related technologies */}
          {academy.domains.flatMap(d => d.technologies).filter(t => t.slug !== tSlug).length > 0 && (
            <div style={{ padding: "12px 16px 20px", borderTop: "1px solid var(--border)" }}>
              <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", color: "var(--text-4)", textTransform: "uppercase", marginBottom: "8px" }}>More in Academy</p>
              {academy.domains.flatMap(d => d.technologies).filter(t => t.slug !== tSlug).slice(0, 5).map(t => (
                <Link key={t.slug} href={`/academies/${aSlug}/${t.slug}`}
                  style={{ display: "flex", alignItems: "center", gap: "8px", padding: "6px 8px", borderRadius: "7px", textDecoration: "none", color: "var(--text-4)", fontSize: "12px", marginBottom: "1px" }}
                  className="sidebar-link">
                  <span style={{ fontSize: "13px" }}>{t.icon}</span> {t.name}
                </Link>
              ))}
            </div>
          )}
        </aside>

        {/* ── MAIN CONTENT ── */}
        <div style={{ flex: 1, minWidth: 0, padding: "36px 40px", maxWidth: "calc(100% - 252px)" }}
          className="content-main">

          {/* Breadcrumb */}
          <div style={{ display: "flex", alignItems: "center", gap: "6px", fontSize: "12px", color: "var(--text-4)", marginBottom: "20px", flexWrap: "wrap" }}>
            <Link href="/academies" style={{ color: "var(--text-4)", textDecoration: "none" }}>Academies</Link>
            <span>›</span>
            <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{academy.title}</Link>
            <span>›</span>
            <span style={{ color: "var(--text-1)", fontWeight: 600 }}>{tech.name}</span>
          </div>

          {/* Tech header */}
          <div style={{ marginBottom: "32px" }}>
            <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "10px", flexWrap: "wrap" }}>
              <span style={{ fontSize: "36px" }}>{tech.icon}</span>
              <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, color: "var(--text-1)", margin: 0 }}>{tech.name}</h1>
              <span style={{ background: lc.bg, border: `1px solid ${lc.border}`, color: lc.text, padding: "3px 10px", borderRadius: "100px", fontSize: "11px", fontWeight: 700 }}>{tech.level}</span>
            </div>
            <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.65, maxWidth: "600px", margin: "0 0 16px" }}>{tech.description}</p>
            <div style={{ display: "flex", gap: "5px", flexWrap: "wrap" }}>
              {tech.tags.map(tag => (
                <span key={tag} style={{ background: `${academy.color}10`, border: `1px solid ${academy.color}25`, color: academy.color, padding: "3px 9px", borderRadius: "6px", fontSize: "11px", fontWeight: 600 }}>{tag}</span>
              ))}
            </div>
          </div>

          {/* Section grid */}
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(220px, 1fr))", gap: "12px" }}>
            {techSections.map((section) => (
              <Link key={section.slug} href={`/academies/${aSlug}/${tSlug}/${section.slug}`}
                style={{ textDecoration: "none", padding: "18px 20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-2)", display: "flex", flexDirection: "column", gap: "8px", transition: "all 0.15s" }}
                className="section-card">
                <span style={{ fontSize: "22px" }}>{section.icon}</span>
                <div style={{ fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>{section.label}</div>
                <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{section.description}</div>
              </Link>
            ))}
          </div>
        </div>
      </div>

      <style>{`
        .sidebar-link:hover { background: var(--bg-2) !important; color: var(--text-1) !important; }
        .section-card:hover { border-color: rgba(100,130,255,0.4) !important; background: rgba(100,130,255,0.04) !important; transform: translateY(-1px); }
        .section-card { transition: all 0.15s; }
        @media (max-width: 768px) {
          .sidebar-desktop { display: none !important; }
          .content-main { padding: 20px 16px !important; max-width: 100% !important; }
        }
      `}</style>
    </>
  );
}
