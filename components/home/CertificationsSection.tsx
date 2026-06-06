import Link from "next/link";
import { certifications } from "@/lib/data/navigation";
import { Trophy, ArrowRight } from "lucide-react";

export default function CertificationsSection() {
  const providerGroups = certifications.reduce((acc, cert) => {
    if (!acc[cert.provider]) acc[cert.provider] = [];
    acc[cert.provider].push(cert);
    return acc;
  }, {} as Record<string, typeof certifications>);

  return (
    <section className="mx-auto max-w-7xl px-6 py-20">
      <div className="flex items-end justify-between mb-14 flex-wrap gap-4">
        <div>
          <span
            style={{
              display: "inline-block",
              background: "rgba(245, 158, 11, 0.1)",
              border: "1px solid rgba(245, 158, 11, 0.2)",
              color: "#FCD34D",
              fontSize: "12px",
              fontWeight: 600,
              letterSpacing: "0.12em",
              textTransform: "uppercase",
              padding: "5px 14px",
              borderRadius: "100px",
              marginBottom: "16px",
            }}
          >
            13 Certifications
          </span>
          <h2
            style={{
              fontFamily: "'Syne', sans-serif",
              fontSize: "clamp(28px, 3.5vw, 42px)",
              fontWeight: 800,
              letterSpacing: "-0.02em",
            }}
          >
            Certification Hub
          </h2>
          <p style={{ color: "var(--text-4)", fontSize: "16px", marginTop: "8px" }}>
            Comprehensive prep for the industry&apos;s most in-demand certifications
          </p>
        </div>
        <Link
          href="/certifications"
          style={{ display: "flex", alignItems: "center", gap: "6px", color: "#FCD34D", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}
        >
          All Certifications <ArrowRight size={16} />
        </Link>
      </div>

      <div className="grid gap-8 lg:grid-cols-2">
        {Object.entries(providerGroups).map(([provider, certs]) => (
          <div
            key={provider}
            style={{
              background: "var(--bg-2)",
              border: "1px solid #1E2D47",
              borderRadius: "16px",
              padding: "24px",
            }}
          >
            <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "18px" }}>
              <Trophy size={18} style={{ color: certs[0].color }} />
              <h3 style={{ fontSize: "16px", fontWeight: 700 }}>{provider}</h3>
              <span
                style={{
                  marginLeft: "auto",
                  background: `${certs[0].color}15`,
                  border: `1px solid ${certs[0].color}25`,
                  color: certs[0].color,
                  padding: "2px 10px",
                  borderRadius: "100px",
                  fontSize: "11px",
                  fontWeight: 600,
                }}
              >
                {certs.length} exams
              </span>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {certs.map((cert) => (
                <Link
                  key={cert.id}
                  href={`/certifications/${cert.id}`}
                  style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    padding: "10px 14px",
                    background: "rgba(255,255,255,0.02)",
                    border: "1px solid #1E2D47",
                    borderRadius: "10px",
                    textDecoration: "none",
                    transition: "background 0.2s",
                  }}
                  className="hover:bg-white/5"
                >
                  <div>
                    <span style={{ color: "var(--text-1)", fontSize: "13px", fontWeight: 600, display: "block" }}>
                      {cert.name}
                    </span>
                    <span style={{ color: "var(--text-4)", fontSize: "11px" }}>{cert.code}</span>
                  </div>
                  <span
                    style={{
                      background: cert.level === "Expert" ? "rgba(244, 63, 94, 0.1)" : cert.level === "Professional" ? "rgba(245, 158, 11, 0.1)" : "rgba(16, 185, 129, 0.1)",
                      color: cert.level === "Expert" ? "#FB7185" : cert.level === "Professional" ? "#FCD34D" : "#34D399",
                      border: `1px solid ${cert.level === "Expert" ? "rgba(244, 63, 94, 0.2)" : cert.level === "Professional" ? "rgba(245, 158, 11, 0.2)" : "rgba(16, 185, 129, 0.2)"}`,
                      padding: "2px 8px",
                      borderRadius: "100px",
                      fontSize: "10px",
                      fontWeight: 600,
                    }}
                  >
                    {cert.level}
                  </span>
                </Link>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
