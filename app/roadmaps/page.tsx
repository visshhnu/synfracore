import Link from "next/link";
import { roadmaps } from "@/lib/data/navigation";
import { Clock, ArrowRight } from "lucide-react";

export const metadata = {
  title: "Roadmaps — SynfraCore",
  description: "Structured career roadmaps for DevOps, Cloud, AI, Data, and Security engineers",
};

export default function RoadmapsPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      <div className="mb-16 text-center">
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Career Roadmaps
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Step-by-step paths from beginner to job-ready professional
        </p>
      </div>

      <div className="grid gap-8 lg:grid-cols-2">
        {roadmaps.map((roadmap) => (
          <div
            key={roadmap.slug}
            style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "20px", padding: "32px" }}
          >
            <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "20px" }}>
              <span style={{ fontSize: "36px" }}>{roadmap.icon}</span>
              <div>
                <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "22px", fontWeight: 700 }}>{roadmap.title}</h2>
                <div style={{ display: "flex", alignItems: "center", gap: "6px", color: "var(--text-4)", fontSize: "13px", marginTop: "4px" }}>
                  <Clock size={13} /> {roadmap.duration} to complete
                </div>
              </div>
            </div>

            <div style={{ position: "relative", paddingLeft: "20px" }}>
              <div style={{ position: "absolute", left: "7px", top: "8px", bottom: "8px", width: "2px", background: "#1E2D47" }} />
              {roadmap.steps.map((step, i) => (
                <div key={step} style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "10px", position: "relative" }}>
                  <div
                    style={{
                      position: "absolute",
                      left: "-20px",
                      width: "16px",
                      height: "16px",
                      borderRadius: "50%",
                      background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
                      display: "flex",
                      alignItems: "center",
                      justifyContent: "center",
                      fontSize: "9px",
                      fontWeight: 700,
                      color: "#fff",
                      flexShrink: 0,
                    }}
                  >
                    {i + 1}
                  </div>
                  <span style={{ fontSize: "14px", fontWeight: 500 }}>{step}</span>
                </div>
              ))}
            </div>

            <Link
              href={`/roadmaps/${roadmap.slug}`}
              style={{
                display: "inline-flex",
                alignItems: "center",
                gap: "8px",
                marginTop: "20px",
                background: "rgba(59, 130, 246, 0.1)",
                border: "1px solid rgba(59, 130, 246, 0.2)",
                color: "#60A5FA",
                padding: "10px 20px",
                borderRadius: "10px",
                fontSize: "13px",
                fontWeight: 600,
                textDecoration: "none",
              }}
            >
              View Full Roadmap <ArrowRight size={14} />
            </Link>
          </div>
        ))}
      </div>
    </div>
  );
}
