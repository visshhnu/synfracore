export const runtime = "edge";
import Link from "next/link";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { getAcademy, getTechnology } from "@/lib/data/academies";
import { techSections } from "@/lib/data/navigation";

type Props = {
  params: Promise<{ academy: string; technology: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { academy: aSlug, technology: tSlug } = await params;
  const academy = getAcademy(aSlug);
  const tech = getTechnology(aSlug, tSlug);
  if (!academy || !tech) return { title: "Technology | SynfraCore" };

  const canonicalUrl = `https://synfracore.com/academies/${aSlug}/${tSlug}`;
  const description = `${tech.name} complete learning path — fundamentals, labs, interview prep, and certification guide. ${tech.description}`;

  return {
    title: `Learn ${tech.name}`,
    description,
    keywords: [tech.name, `${tech.name} tutorial`, `${tech.name} course`, `learn ${tech.name}`, `${tech.name} for beginners`, "SynfraCore", ...(tech.tags || [])],
    alternates: { canonical: canonicalUrl },
    openGraph: {
      title: `Learn ${tech.name} | SynfraCore`,
      description,
      url: canonicalUrl,
      type: "website",
      siteName: "SynfraCore",
    },
    twitter: {
      card: "summary",
      title: `Learn ${tech.name} | SynfraCore`,
      description,
    },
  };
}

export default async function TechnologyPage({ params }: Props) {
  const { academy: aSlug, technology: tSlug } = await params;
  const academy = getAcademy(aSlug);
  const tech = getTechnology(aSlug, tSlug);
  if (!academy || !tech) redirect("/academies");

  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "40px 24px" }}>
      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>
        {" / "}
        <Link href="/academies" style={{ color: "var(--text-4)", textDecoration: "none" }}>Academies</Link>
        {" / "}
        <Link href={`/academies/${aSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{academy.title}</Link>
        {" / "}
        <span style={{ color: "var(--text-2)" }}>{tech.name}</span>
      </nav>

      {/* Header */}
      <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "12px" }}>
        <span style={{ fontSize: "48px" }}>{tech.icon}</span>
        <div>
          <h1 style={{ fontSize: "32px", fontWeight: 700, marginBottom: "4px" }}>{tech.name}</h1>
          <span style={{ fontSize: "12px", padding: "2px 8px", borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-3)" }}>
            {tech.level}
          </span>
        </div>
      </div>

      <p style={{ color: "var(--text-3)", fontSize: "16px", marginBottom: "32px", lineHeight: "1.7" }}>
        {tech.description}
      </p>

      {/* Tags */}
      {tech.tags && (
        <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "40px" }}>
          {tech.tags.map((tag: string) => (
            <span key={tag} style={{ fontSize: "12px", padding: "4px 10px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-3)", border: "1px solid var(--border)" }}>
              {tag}
            </span>
          ))}
        </div>
      )}

      {/* Sections grid */}
      <h2 style={{ fontSize: "18px", fontWeight: 600, marginBottom: "16px" }}>Choose where to start</h2>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "12px" }}>
        {techSections.map((s) => (
          <Link
            key={s.slug}
            href={`/academies/${aSlug}/${tSlug}/${s.slug}`}
            style={{ textDecoration: "none" }}
          >
            <div
              style={{
                padding: "16px",
                borderRadius: "10px",
                border: "1px solid var(--border)",
                background: "var(--bg-1)",
                transition: "border-color 0.2s",
                cursor: "pointer",
              }}
              className="card-hover"
            >
              <div style={{ fontSize: "20px", marginBottom: "8px" }}>{s.icon}</div>
              <div style={{ fontWeight: 600, fontSize: "14px", marginBottom: "4px" }}>{s.label}</div>
              <div style={{ fontSize: "12px", color: "var(--text-4)", lineHeight: "1.5" }}>{s.description}</div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
