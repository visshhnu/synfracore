export const runtime = "edge";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getAcademy } from "@/lib/data/academies";
import { ArrowRight } from "lucide-react";

type Props = { params: Promise<{ academy: string }> };

export async function generateMetadata({ params }: Props) {
  const { academy: slug } = await params;
  const academy = getAcademy(slug);
  if (!academy) return {};
  return { title: `${academy.title} — SynfraCore`, description: academy.description };
}

const levelColors = {
  Beginner:     { bg: "rgba(16,185,129,0.1)",  border: "rgba(16,185,129,0.2)",  text: "#34D399" },
  Intermediate: { bg: "rgba(245,158,11,0.1)",  border: "rgba(245,158,11,0.2)",  text: "#FCD34D" },
  Advanced:     { bg: "rgba(244,63,94,0.1)",   border: "rgba(244,63,94,0.2)",   text: "#FB7185" },
};

export default async function AcademyPage({ params }: Props) {
  const { academy: slug } = await params;
  const academy = getAcademy(slug);
  if (!academy) notFound();

  return (
    <div style={{ background: "var(--bg)", minHeight: "100vh" }}>
      {/* Hero */}
      <div style={{ background: `linear-gradient(135deg, ${academy.color}10, transparent)`, borderBottom: "1px solid var(--border)", padding: "48px 0" }}>
        <div className="page-container">
          <Link href="/academies" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", marginBottom: "20px", display: "inline-flex", alignItems: "center", gap: "4px" }}>
            ← All Academies
          </Link>
          <div style={{ display: "flex", alignItems: "center", gap: "20px", marginTop: "12px", flexWrap: "wrap" }}>
            <div style={{ width: "72px", height: "72px", borderRadius: "18px", background: `${academy.color}18`, border: `1px solid ${academy.color}30`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "32px", flexShrink: 0 }}>
              {academy.icon}
            </div>
            <div>
              <h1 className="display-md">{academy.title}</h1>
              <div style={{ color: academy.color, fontSize: "12px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", marginTop: "4px" }}>
                {academy.subtitle} · {academy.domains.reduce((s, d) => s + d.technologies.length, 0)} Technologies
              </div>
            </div>
          </div>
          <p className="body-md" style={{ marginTop: "16px", maxWidth: "640px" }}>{academy.description}</p>
        </div>
      </div>

      {/* Domains */}
      <div className="page-container" style={{ padding: "48px 24px" }}>
        {academy.domains.map((domain) => (
          <div key={domain.slug} style={{ marginBottom: "48px" }}>
            {/* Domain header */}
            <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "20px", paddingBottom: "14px", borderBottom: "1px solid var(--border)" }}>
              <span style={{ fontSize: "20px" }}>{domain.icon}</span>
              <div>
                <div className="heading" style={{ fontSize: "17px" }}>{domain.name}</div>
                <div style={{ fontSize: "13px", color: "var(--text-4)", marginTop: "2px" }}>{domain.description}</div>
              </div>
            </div>

            {/* Technologies grid */}
            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "14px" }}>
              {domain.technologies.map((tech) => {
                const lc = levelColors[tech.level];
                return (
                  <Link key={tech.slug} href={`/academies/${academy.slug}/${tech.slug}`} style={{ textDecoration: "none" }}>
                    <div className="card card-interactive" style={{ padding: "20px" }}>
                      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "10px" }}>
                        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
                          <span style={{ fontSize: "24px" }}>{tech.icon}</span>
                          <span className="heading" style={{ fontSize: "14px" }}>{tech.name}</span>
                        </div>
                        <span style={{ background: lc.bg, border: `1px solid ${lc.border}`, color: lc.text, padding: "2px 8px", borderRadius: "100px", fontSize: "10px", fontWeight: 700, whiteSpace: "nowrap", flexShrink: 0 }}>
                          {tech.level}
                        </span>
                      </div>
                      <p style={{ fontSize: "12px", color: "var(--text-4)", lineHeight: 1.6, marginBottom: "12px" }}>{tech.description}</p>
                      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                        <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
                          {tech.tags.slice(0, 3).map((tag) => (
                            <span key={tag} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-4)", padding: "2px 7px", borderRadius: "5px", fontSize: "10px" }}>{tag}</span>
                          ))}
                        </div>
                        <span style={{ color: academy.color, fontSize: "11px", fontWeight: 600, display: "flex", alignItems: "center", gap: "3px" }}>
                          Start <ArrowRight size={11} />
                        </span>
                      </div>
                    </div>
                  </Link>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
