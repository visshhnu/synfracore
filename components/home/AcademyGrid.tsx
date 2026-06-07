import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { ArrowRight } from "lucide-react";

export default function AcademyGrid() {
  return (
    <section className="mx-auto max-w-7xl px-6 py-20">
      <div className="mb-14 text-center">
        <span
          style={{
            display: "inline-block",
            background: "rgba(59, 130, 246, 0.1)",
            border: "1px solid rgba(59, 130, 246, 0.2)",
            color: "#60A5FA",
            fontSize: "12px",
            fontWeight: 600,
            letterSpacing: "0.12em",
            textTransform: "uppercase",
            padding: "5px 14px",
            borderRadius: "100px",
            marginBottom: "16px",
          }}
        >
          6 Academies
        </span>
        <h2
          style={{
            fontFamily: "'Plus Jakarta Sans', sans-serif",
            fontSize: "clamp(32px, 4vw, 48px)",
            fontWeight: 800,
            letterSpacing: "-0.02em",
          }}
        >
          Choose Your Academy
        </h2>
        <p style={{ color: "var(--text-4)", fontSize: "17px", marginTop: "12px", maxWidth: "500px", margin: "12px auto 0" }}>
          Structured learning paths across every major technology domain
        </p>
      </div>

      <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        {academies.map((academy, i) => (
          <Link
            key={academy.slug}
            href={`/academies/${academy.slug}`}
            style={{ textDecoration: "none" }}
          >
            <div
              className="card"
              style={{
                padding: "28px",
                height: "100%",
                display: "flex",
                flexDirection: "column",
              }}
            >
              {/* Icon */}
              <div
                style={{
                  width: "52px",
                  height: "52px",
                  borderRadius: "14px",
                  background: `linear-gradient(135deg, ${academy.color}22, ${academy.color}11)`,
                  border: `1px solid ${academy.color}33`,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  fontSize: "24px",
                  marginBottom: "18px",
                }}
              >
                {academy.icon}
              </div>

              <h3
                style={{
                  fontFamily: "'Plus Jakarta Sans', sans-serif",
                  fontSize: "20px",
                  fontWeight: 700,
                  marginBottom: "6px",
                }}
              >
                {academy.title}
              </h3>

              <p
                style={{
                  color: academy.color,
                  fontSize: "12px",
                  fontWeight: 600,
                  letterSpacing: "0.08em",
                  textTransform: "uppercase",
                  marginBottom: "12px",
                }}
              >
                {academy.subtitle}
              </p>

              <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.6, marginBottom: "20px", flexGrow: 1 }}>
                {academy.description}
              </p>

              <div style={{ display: "flex", flexWrap: "wrap", gap: "6px", marginBottom: "20px" }}>
                {academy.domains.flatMap(d=>d.technologies).slice(0, 4).map((tech) => (
                  <span
                    key={tech.slug}
                    style={{
                      background: `${academy.color}15`,
                      border: `1px solid ${academy.color}25`,
                      color: academy.color,
                      padding: "3px 10px",
                      borderRadius: "100px",
                      fontSize: "11px",
                      fontWeight: 600,
                    }}
                  >
                    {tech.name}
                  </span>
                ))}
                {academy.domains.flatMap(d=>d.technologies).length > 4 && (
                  <span style={{ color: "var(--text-4)", fontSize: "11px", padding: "3px 6px" }}>
                    +{academy.domains.flatMap(d=>d.technologies).length - 4} more
                  </span>
                )}
              </div>

              <div
                style={{
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "space-between",
                  paddingTop: "16px",
                  borderTop: "1px solid #1E2D47",
                }}
              >
                <span style={{ color: "var(--text-4)", fontSize: "13px" }}>
                  {academy.domains.flatMap(d=>d.technologies).length} technologies
                </span>
                <span
                  style={{
                    display: "flex",
                    alignItems: "center",
                    gap: "4px",
                    color: academy.color,
                    fontSize: "13px",
                    fontWeight: 600,
                  }}
                >
                  Explore <ArrowRight size={14} />
                </span>
              </div>
            </div>
          </Link>
        ))}
      </div>
    </section>
  );
}
