export const runtime = "edge";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getAcademy } from "@/lib/data/academies";
import { ArrowRight, BookOpen, FlaskConical, Code2, Trophy, MessageCircle, Wrench } from "lucide-react";

type Props = { params: Promise<{ academy: string }> };

export async function generateMetadata({ params }: Props) {
  const { academy: slug } = await params;
  const academy = getAcademy(slug);
  if (!academy) return {};
  return {
    title: `${academy.title} — SynfraCore`,
    description: academy.description,
  };
}

export default async function AcademyPage({ params }: Props) {
  const { academy: slug } = await params;
  const academy = getAcademy(slug);
  if (!academy) notFound();

  const levelColors = {
    Beginner: { bg: "rgba(16,185,129,0.1)", border: "rgba(16,185,129,0.2)", text: "#34D399" },
    Intermediate: { bg: "rgba(245,158,11,0.1)", border: "rgba(245,158,11,0.2)", text: "#FCD34D" },
    Advanced: { bg: "rgba(244,63,94,0.1)", border: "rgba(244,63,94,0.2)", text: "#FB7185" },
  };

  return (
    <div>
      {/* Hero */}
      <div
        style={{
          background: `linear-gradient(135deg, ${academy.color}12, transparent)`,
          borderBottom: "1px solid var(--border)",
          padding: "48px 0",
        }}
      >
        <div className="mx-auto max-w-7xl px-6">
          <Link href="/academies" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", marginBottom: "16px", display: "inline-block" }}>
            ← All Academies
          </Link>

          <div style={{ display: "flex", alignItems: "center", gap: "20px" }}>
            <div
              style={{
                width: "72px",
                height: "72px",
                borderRadius: "18px",
                background: `linear-gradient(135deg, ${academy.color}30, ${academy.color}15)`,
                border: `1px solid ${academy.color}40`,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "34px",
              }}
            >
              {academy.icon}
            </div>
            <div>
              <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em" }}>
                {academy.title}
              </h1>
              <p style={{ color: academy.color, fontSize: "14px", fontWeight: 600, letterSpacing: "0.06em", marginTop: "4px" }}>
                {academy.subtitle} · {academy.technologies.length} Technologies
              </p>
            </div>
          </div>

          <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "600px", marginTop: "16px", lineHeight: 1.7 }}>
            {academy.description}
          </p>
        </div>
      </div>

      {/* Technologies grid */}
      <div className="mx-auto max-w-7xl px-6 py-16">
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "26px", fontWeight: 700, marginBottom: "24px" }}>
          Technologies
        </h2>

        <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
          {academy.technologies.map((tech) => {
            const lc = levelColors[tech.level];
            return (
              <Link
                key={tech.slug}
                href={`/academies/${academy.slug}/${tech.slug}`}
                style={{ textDecoration: "none" }}
              >
                <div
                  className="card"
                  style={{ padding: "22px" }}
                >
                  <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "12px" }}>
                    <span style={{ fontSize: "26px" }}>{tech.icon}</span>
                    <span
                      style={{
                        background: lc.bg,
                        border: `1px solid ${lc.border}`,
                        color: lc.text,
                        padding: "2px 8px",
                        borderRadius: "100px",
                        fontSize: "10px",
                        fontWeight: 600,
                      }}
                    >
                      {tech.level}
                    </span>
                  </div>

                  <h3 style={{ fontSize: "15px", fontWeight: 700, marginBottom: "6px" }}>{tech.name}</h3>
                  <p style={{ color: "var(--text-4)", fontSize: "12px", lineHeight: 1.5, marginBottom: "14px" }}>
                    {tech.description}
                  </p>

                  <div style={{ display: "flex", flexWrap: "wrap", gap: "4px" }}>
                    {tech.tags.map((tag) => (
                      <span
                        key={tag}
                        style={{
                          background: `${academy.color}10`,
                          border: `1px solid ${academy.color}20`,
                          color: academy.color,
                          padding: "2px 7px",
                          borderRadius: "6px",
                          fontSize: "10px",
                          fontWeight: 500,
                        }}
                      >
                        {tag}
                      </span>
                    ))}
                  </div>

                  <div
                    style={{
                      display: "flex",
                      alignItems: "center",
                      gap: "4px",
                      marginTop: "14px",
                      paddingTop: "12px",
                      borderTop: "1px solid var(--border)",
                      color: academy.color,
                      fontSize: "12px",
                      fontWeight: 600,
                    }}
                  >
                    Start Learning <ArrowRight size={12} />
                  </div>
                </div>
              </Link>
            );
          })}
        </div>

        {/* Quick links */}
        <div
          style={{
            marginTop: "48px",
            display: "grid",
            gap: "12px",
            gridTemplateColumns: "repeat(auto-fit, minmax(180px, 1fr))",
          }}
        >
          {[
            { icon: <BookOpen size={18} />, label: "Labs", href: "/labs", desc: "Hands-on exercises" },
            { icon: <Code2 size={18} />, label: "Projects", href: "/projects", desc: "Build real systems" },
            { icon: <Trophy size={18} />, label: "Certifications", href: "/certifications", desc: "Get certified" },
            { icon: <MessageCircle size={18} />, label: "Interview", href: "/interview", desc: "Ace interviews" },
            { icon: <Wrench size={18} />, label: "Troubleshooting", href: "/troubleshooting", desc: "Fix issues fast" },
          ].map((link) => (
            <Link
              key={link.label}
              href={link.href}
              style={{
                display: "flex",
                alignItems: "center",
                gap: "12px",
                padding: "16px",
                background: "var(--bg-2)",
                border: "1px solid var(--border)",
                borderRadius: "12px",
                textDecoration: "none",
                transition: "all 0.2s",
              }}
              className="hover:border-blue-500/30"
            >
              <span style={{ color: "#3B82F6" }}>{link.icon}</span>
              <div>
                <div style={{ fontSize: "14px", fontWeight: 600 }}>{link.label}</div>
                <div style={{ color: "var(--text-4)", fontSize: "11px" }}>{link.desc}</div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
