export const runtime = "edge";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getAcademy, getTechnology } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";

type Props = { params: Promise<{ academy: string; technology: string }> };

export async function generateMetadata({ params }: Props) {
  const { academy: aSlug, technology: tSlug } = await params;
  const tech = getTechnology(aSlug, tSlug);
  if (!tech) return {};
  return { title: `${tech.name} — SynfraCore`, description: tech.description };
}

export default async function TechnologyPage({ params }: Props) {
  const { academy: aSlug, technology: tSlug } = await params;
  const academy = getAcademy(aSlug);
  const tech = getTechnology(aSlug, tSlug);
  if (!academy || !tech) notFound();

  const levelColors = {
    Beginner: { bg: "rgba(16,185,129,0.1)", border: "rgba(16,185,129,0.2)", text: "#34D399" },
    Intermediate: { bg: "rgba(245,158,11,0.1)", border: "rgba(245,158,11,0.2)", text: "#FCD34D" },
    Advanced: { bg: "rgba(244,63,94,0.1)", border: "rgba(244,63,94,0.2)", text: "#FB7185" },
  };
  const lc = levelColors[tech.level];

  return (
    <div style={{ display: "flex", gap: "0", minHeight: "80vh" }}>
      {/* Sidebar */}
      <aside
        style={{
          width: "260px",
          flexShrink: 0,
          borderRight: "1px solid #1E2D47",
          background: "#0C1524",
          padding: "24px 16px",
          position: "sticky",
          top: "65px",
          height: "calc(100vh - 65px)",
          overflowY: "auto",
        }}
        className="hidden lg:block"
      >
        <div style={{ marginBottom: "16px", paddingBottom: "16px", borderBottom: "1px solid #1E2D47" }}>
          <Link href={`/academies/${aSlug}`} style={{ color: "#6B7A99", fontSize: "12px", textDecoration: "none" }}>
            ← {academy.title}
          </Link>
          <div style={{ display: "flex", alignItems: "center", gap: "8px", marginTop: "10px" }}>
            <span style={{ fontSize: "20px" }}>{tech.icon}</span>
            <span style={{ fontWeight: 700, fontSize: "16px" }}>{tech.name}</span>
          </div>
          <span
            style={{
              display: "inline-block",
              marginTop: "8px",
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

        <nav>
          {techSections.map((section) => (
            <Link
              key={section.slug}
              href={`/academies/${aSlug}/${tSlug}/${section.slug}`}
              style={{
                display: "flex",
                alignItems: "center",
                gap: "10px",
                padding: "9px 12px",
                borderRadius: "10px",
                textDecoration: "none",
                color: "#9BA8C0",
                fontSize: "13px",
                fontWeight: 500,
                marginBottom: "2px",
                transition: "all 0.15s",
              }}
              className="hover:bg-white/5 hover:text-white"
            >
              <span style={{ fontSize: "14px" }}>{section.icon}</span>
              {section.label}
            </Link>
          ))}
        </nav>
      </aside>

      {/* Main content */}
      <div style={{ flexGrow: 1, padding: "40px 48px" }}>
        <div style={{ marginBottom: "8px" }}>
          <Link href={`/academies/${aSlug}`} style={{ color: "#6B7A99", fontSize: "13px", textDecoration: "none" }}>
            {academy.title}
          </Link>
          <span style={{ color: "#6B7A99", margin: "0 6px" }}>›</span>
          <span style={{ color: "#E8EDF5", fontSize: "13px" }}>{tech.name}</span>
        </div>

        <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "16px" }}>
          <span style={{ fontSize: "40px" }}>{tech.icon}</span>
          <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 4vw, 42px)", fontWeight: 800, letterSpacing: "-0.02em" }}>
            {tech.name}
          </h1>
          <span
            style={{
              background: lc.bg,
              border: `1px solid ${lc.border}`,
              color: lc.text,
              padding: "4px 12px",
              borderRadius: "100px",
              fontSize: "12px",
              fontWeight: 600,
            }}
          >
            {tech.level}
          </span>
        </div>

        <p style={{ color: "#6B7A99", fontSize: "16px", maxWidth: "600px", marginBottom: "36px", lineHeight: 1.7 }}>
          {tech.description}
        </p>

        <div style={{ display: "flex", flexWrap: "wrap", gap: "6px", marginBottom: "40px" }}>
          {tech.tags.map((tag) => (
            <span
              key={tag}
              style={{
                background: `${academy.color}12`,
                border: `1px solid ${academy.color}25`,
                color: academy.color,
                padding: "4px 12px",
                borderRadius: "100px",
                fontSize: "12px",
                fontWeight: 500,
              }}
            >
              {tag}
            </span>
          ))}
        </div>

        {/* Section grid */}
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "20px", fontWeight: 700, marginBottom: "20px" }}>
          Learning Sections
        </h2>
        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
          {techSections.map((section) => (
            <Link
              key={section.slug}
              href={`/academies/${aSlug}/${tSlug}/${section.slug}`}
              style={{ textDecoration: "none" }}
            >
              <div
                style={{
                  background: "#0F1A2E",
                  border: "1px solid #1E2D47",
                  borderRadius: "14px",
                  padding: "20px",
                  transition: "all 0.2s",
                  display: "flex",
                  alignItems: "center",
                  gap: "14px",
                }}
                className="hover:border-blue-500/30 hover:bg-blue-500/5"
              >
                <span style={{ fontSize: "22px", flexShrink: 0 }}>{section.icon}</span>
                <div>
                  <div style={{ fontSize: "14px", fontWeight: 600 }}>{section.label}</div>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
