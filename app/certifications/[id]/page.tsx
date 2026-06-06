export const runtime = "edge";
import { certifications } from "@/lib/data/navigation";
import { notFound } from "next/navigation";
import Link from "next/link";
import { Trophy } from "lucide-react";

type Props = { params: Promise<{ id: string }> };

export async function generateMetadata({ params }: Props) {
  const { id } = await params;
  const cert = certifications.find((c) => c.id === id);
  if (!cert) return {};
  return { title: `${cert.name} — SynfraCore` };
}

export default async function CertificationDetailPage({ params }: Props) {
  const { id } = await params;
  const cert = certifications.find((c) => c.id === id);
  if (!cert) notFound();

  const sections = [
    { icon: "📋", title: "Exam Overview", desc: "Domains, format, and what to expect" },
    { icon: "📅", title: "Study Plan", desc: "8-12 week structured preparation" },
    { icon: "📚", title: "Resources", desc: "Free and paid study materials" },
    { icon: "🔥", title: "Practice Questions", desc: "Domain-by-domain question banks" },
    { icon: "💡", title: "Exam Tips", desc: "Strategies for exam day success" },
    { icon: "🎯", title: "After Certification", desc: "Career paths and next steps" },
  ];

  return (
    <div className="mx-auto max-w-5xl px-6 py-16">
      <Link href="/certifications" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", marginBottom: "24px", display: "inline-block" }}>
        ← All Certifications
      </Link>

      <div
        style={{
          background: `linear-gradient(135deg, ${cert.color}12, transparent)`,
          border: `1px solid ${cert.color}25`,
          borderRadius: "20px",
          padding: "40px",
          marginBottom: "40px",
        }}
      >
        <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "16px" }}>
          <div style={{ width: "60px", height: "60px", borderRadius: "16px", background: `${cert.color}20`, border: `1px solid ${cert.color}30`, display: "flex", alignItems: "center", justifyContent: "center" }}>
            <Trophy size={28} style={{ color: cert.color }} />
          </div>
          <div>
            <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "28px", fontWeight: 800, letterSpacing: "-0.02em" }}>
              {cert.name}
            </h1>
            <div style={{ display: "flex", gap: "10px", marginTop: "6px" }}>
              <span style={{ background: `${cert.color}15`, border: `1px solid ${cert.color}25`, color: cert.color, padding: "3px 10px", borderRadius: "100px", fontSize: "12px", fontWeight: 600 }}>
                {cert.provider}
              </span>
              <span style={{ background: "rgba(255,255,255,0.05)", border: "1px solid var(--border)", color: "var(--text-3)", padding: "3px 10px", borderRadius: "100px", fontSize: "12px", fontWeight: 600 }}>
                {cert.code}
              </span>
              <span style={{ background: cert.level === "Expert" ? "rgba(244, 63, 94, 0.1)" : cert.level === "Professional" ? "rgba(245, 158, 11, 0.1)" : "rgba(16, 185, 129, 0.1)", color: cert.level === "Expert" ? "#FB7185" : cert.level === "Professional" ? "#FCD34D" : "#34D399", padding: "3px 10px", borderRadius: "100px", fontSize: "12px", fontWeight: 600 }}>
                {cert.level}
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* Sections */}
      <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
        {sections.map((sec) => (
          <div
            key={sec.title}
            style={{
              background: "var(--bg-2)",
              border: "1px solid var(--border)",
              borderRadius: "14px",
              padding: "22px",
              cursor: "pointer",
              transition: "all 0.2s",
            }}
            className="hover:border-blue-500/30"
          >
            <span style={{ fontSize: "28px", display: "block", marginBottom: "10px" }}>{sec.icon}</span>
            <h3 style={{ fontSize: "15px", fontWeight: 700, marginBottom: "4px" }}>{sec.title}</h3>
            <p style={{ color: "var(--text-4)", fontSize: "12px" }}>{sec.desc}</p>
          </div>
        ))}
      </div>

      <div
        style={{
          marginTop: "32px",
          background: "rgba(59, 130, 246, 0.05)",
          border: "1px solid rgba(59, 130, 246, 0.15)",
          borderRadius: "14px",
          padding: "24px",
          textAlign: "center",
        }}
      >
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "12px" }}>
          Navigate to the technology pages for AI-generated certification study guides
        </p>
        <Link
          href="/academies"
          style={{
            display: "inline-flex",
            alignItems: "center",
            gap: "6px",
            background: "rgba(59, 130, 246, 0.1)",
            border: "1px solid rgba(59, 130, 246, 0.2)",
            color: "#60A5FA",
            padding: "8px 20px",
            borderRadius: "10px",
            fontSize: "13px",
            fontWeight: 600,
            textDecoration: "none",
          }}
        >
          Browse Academies →
        </Link>
      </div>
    </div>
  );
}
