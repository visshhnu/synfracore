export const runtime = "edge";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getAcademy, getTechnology } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";
import SectionContent from "@/components/tech/SectionContent";

type Props = {
  params: Promise<{ academy: string; technology: string; section: string }>;
};

export async function generateMetadata({ params }: Props) {
  const { technology: tSlug, section } = await params;
  const sectionData = techSections.find((s) => s.slug === section);
  return {
    title: `${tSlug} ${sectionData?.label || section} — SynfraCore`,
  };
}

export default async function SectionPage({ params }: Props) {
  const { academy: aSlug, technology: tSlug, section } = await params;
  const academy = getAcademy(aSlug);
  const tech = getTechnology(aSlug, tSlug);
  if (!academy || !tech) redirect("/academies");

  const sectionData = techSections.find((s) => s.slug === section);
  const currentIndex = techSections.findIndex((s) => s.slug === section);
  const prevSection = currentIndex > 0 ? techSections[currentIndex - 1] : null;
  const nextSection = currentIndex < techSections.length - 1 ? techSections[currentIndex + 1] : null;

  return (
    <div style={{ display: "flex", gap: "0", minHeight: "80vh" }}>
      {/* Sidebar */}
      <aside
        style={{
          width: "260px",
          flexShrink: 0,
          borderRight: "1px solid #1E2D47",
          background: "var(--bg-1)",
          padding: "24px 16px",
          position: "sticky",
          top: "64px",
          height: "calc(100vh - 64px)",
          overflowY: "auto",
        }}
        className="sidebar-desktop"
      >
        <div style={{ marginBottom: "16px", paddingBottom: "16px", borderBottom: "1px solid var(--border)" }}>
          <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", fontSize: "12px", textDecoration: "none" }}>
            ← {academy.title}
          </Link>
          <div style={{ display: "flex", alignItems: "center", gap: "8px", marginTop: "10px" }}>
            <span style={{ fontSize: "20px" }}>{tech.icon}</span>
            <span style={{ fontWeight: 700, fontSize: "16px" }}>{tech.name}</span>
          </div>
        </div>

        <nav>
          {techSections.map((s) => (
            <Link
              key={s.slug}
              href={`/academies/${aSlug}/${tSlug}/${s.slug}`}
              style={{
                display: "flex",
                alignItems: "center",
                gap: "10px",
                padding: "9px 12px",
                borderRadius: "10px",
                textDecoration: "none",
                color: s.slug === section ? "#E8EDF5" : "#9BA8C0",
                fontSize: "13px",
                fontWeight: s.slug === section ? 700 : 500,
                marginBottom: "2px",
                background: s.slug === section ? "rgba(59,130,246,0.1)" : "transparent",
                border: s.slug === section ? "1px solid rgba(59,130,246,0.2)" : "1px solid transparent",
              }}
            >
              <span style={{ fontSize: "14px" }}>{s.icon}</span>
              {s.label}
            </Link>
          ))}
        </nav>
      </aside>

      {/* Content */}
      <div className="content-main" style={{ flex: 1, minWidth: 0, padding: "36px 40px", maxWidth: "860px", overflowX: "hidden" }}>
        {/* Breadcrumb */}
        <div style={{ fontSize: "13px", color: "var(--text-4)", marginBottom: "8px", display: "flex", gap: "6px", alignItems: "center", flexWrap: "wrap" }}>
          <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", textDecoration: "none"}}>{academy.title}</Link>
          <span>›</span>
          <Link href={`/academies/${aSlug}/${tSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{tech.name}</Link>
          <span>›</span>
          <span style={{ color: "var(--text-1)" }}>{sectionData?.label}</span>
        </div>

        <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "32px" }}>
          <span style={{ fontSize: "32px" }}>{sectionData?.icon}</span>
          <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(24px, 3vw, 36px)", fontWeight: 800, letterSpacing: "-0.02em" }}>
            {tech.name} — {sectionData?.label}
          </h1>
        </div>

        {/* Content component */}
        <SectionContent
          academy={aSlug}
          technology={tSlug}
          section={section}
          techName={tech.name}
          techIcon={tech.icon}
          sectionLabel={sectionData?.label || section}
          accentColor={academy.color}
        />

        {/* Prev/Next navigation */}
        <div
          style={{
            marginTop: "48px",
            paddingTop: "24px",
            borderTop: "1px solid var(--border)",
            display: "flex",
            justifyContent: "space-between",
            gap: "16px",
          }}
        >
          {prevSection ? (
            <Link
              href={`/academies/${aSlug}/${tSlug}/${prevSection.slug}`}
              style={{
                display: "flex",
                alignItems: "center",
                gap: "10px",
                padding: "14px 20px",
                background: "var(--bg-2)",
                border: "1px solid var(--border)",
                borderRadius: "12px",
                textDecoration: "none",
                flex: 1,
                maxWidth: "240px",
              }}
            >
              <span>←</span>
              <div>
                <div style={{ color: "var(--text-4)", fontSize: "11px", fontWeight: 600, letterSpacing: "0.08em", textTransform: "uppercase" }}>Previous</div>
                <div style={{ fontSize: "13px", fontWeight: 600 }}>{prevSection.label}</div>
              </div>
            </Link>
          ) : <div />}

          {nextSection ? (
            <Link
              href={`/academies/${aSlug}/${tSlug}/${nextSection.slug}`}
              style={{
                display: "flex",
                alignItems: "center",
                justifyContent: "flex-end",
                gap: "10px",
                padding: "14px 20px",
                background: "var(--bg-2)",
                border: "1px solid var(--border)",
                borderRadius: "12px",
                textDecoration: "none",
                flex: 1,
                maxWidth: "240px",
                textAlign: "right",
              }}
            >
              <div>
                <div style={{ color: "var(--text-4)", fontSize: "11px", fontWeight: 600, letterSpacing: "0.08em", textTransform: "uppercase" }}>Next</div>
                <div style={{ fontSize: "13px", fontWeight: 600 }}>{nextSection.label}</div>
              </div>
              <span>→</span>
            </Link>
          ) : <div />}
        </div>
      </div>
    </div>
  );
}
