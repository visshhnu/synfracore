import Link from "next/link";
import { roadmaps } from "@/lib/data/navigation";
import { Clock, ArrowRight } from "lucide-react";

export default function LearningPaths() {
  return (
    <section style={{ background: "#0C1524", borderTop: "1px solid #1E2D47", borderBottom: "1px solid #1E2D47" }}>
      <div className="mx-auto max-w-7xl px-6 py-20">
        <div className="flex items-end justify-between mb-14 flex-wrap gap-4">
          <div>
            <span
              style={{
                display: "inline-block",
                background: "rgba(139, 92, 246, 0.1)",
                border: "1px solid rgba(139, 92, 246, 0.2)",
                color: "#A78BFA",
                fontSize: "12px",
                fontWeight: 600,
                letterSpacing: "0.12em",
                textTransform: "uppercase",
                padding: "5px 14px",
                borderRadius: "100px",
                marginBottom: "16px",
              }}
            >
              Structured Paths
            </span>
            <h2
              style={{
                fontFamily: "'Plus Jakarta Sans', sans-serif",
                fontSize: "clamp(28px, 3.5vw, 42px)",
                fontWeight: 800,
                letterSpacing: "-0.02em",
              }}
            >
              Career Roadmaps
            </h2>
          </div>
          <Link
            href="/roadmaps"
            style={{
              display: "flex",
              alignItems: "center",
              gap: "6px",
              color: "#A78BFA",
              fontSize: "14px",
              fontWeight: 600,
              textDecoration: "none",
            }}
          >
            All Roadmaps <ArrowRight size={16} />
          </Link>
        </div>

        <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
          {roadmaps.map((roadmap) => (
            <Link
              key={roadmap.slug}
              href={`/roadmaps/${roadmap.slug}`}
              style={{ textDecoration: "none" }}
            >
              <div
                className="card"
                style={{ padding: "24px" }}
              >
                <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "14px" }}>
                  <span style={{ fontSize: "28px" }}>{roadmap.icon}</span>
                  <div>
                    <h3 style={{ fontSize: "16px", fontWeight: 700, marginBottom: "2px" }}>{roadmap.title}</h3>
                    <div style={{ display: "flex", alignItems: "center", gap: "4px", color: "var(--text-4)", fontSize: "12px" }}>
                      <Clock size={12} />
                      {roadmap.duration}
                    </div>
                  </div>
                </div>

                <div style={{ display: "flex", flexWrap: "wrap", gap: "5px" }}>
                  {roadmap.steps.map((step, i) => (
                    <span
                      key={step}
                      style={{
                        background: "rgba(139, 92, 246, 0.08)",
                        border: "1px solid rgba(139, 92, 246, 0.15)",
                        color: "#C4B5FD",
                        padding: "3px 9px",
                        borderRadius: "100px",
                        fontSize: "11px",
                        fontWeight: 500,
                      }}
                    >
                      {i + 1}. {step}
                    </span>
                  ))}
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
