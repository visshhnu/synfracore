export const runtime = "edge";
import { roadmaps } from "@/lib/data/navigation";
import { notFound } from "next/navigation";
import Link from "next/link";
import { Clock, CheckCircle } from "lucide-react";

type Props = { params: Promise<{ slug: string }> };

export default async function RoadmapDetailPage({ params }: Props) {
  const { slug } = await params;
  const roadmap = roadmaps.find((r) => r.slug === slug);
  if (!roadmap) notFound();

  return (
    <div className="mx-auto max-w-4xl px-6 py-16">
      <Link href="/roadmaps" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", marginBottom: "24px", display: "inline-block" }}>
        ← All Roadmaps
      </Link>

      <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "12px" }}>
        <span style={{ fontSize: "48px" }}>{roadmap.icon}</span>
        <div>
          <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em" }}>
            {roadmap.title} Roadmap
          </h1>
          <div style={{ display: "flex", alignItems: "center", gap: "6px", color: "var(--text-4)", fontSize: "14px", marginTop: "6px" }}>
            <Clock size={14} /> Estimated: {roadmap.duration}
          </div>
        </div>
      </div>

      <div style={{ marginTop: "48px" }}>
        {roadmap.steps.map((step, i) => (
          <div
            key={step}
            style={{
              display: "flex",
              gap: "20px",
              marginBottom: "8px",
              position: "relative",
            }}
          >
            {/* Line */}
            {i < roadmap.steps.length - 1 && (
              <div style={{
                position: "absolute",
                left: "19px",
                top: "44px",
                bottom: "-8px",
                width: "2px",
                background: "#1E2D47",
              }} />
            )}

            {/* Number */}
            <div
              style={{
                width: "40px",
                height: "40px",
                borderRadius: "50%",
                background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "14px",
                fontWeight: 700,
                color: "#fff",
                flexShrink: 0,
                zIndex: 1,
              }}
            >
              {i + 1}
            </div>

            {/* Content */}
            <div
              style={{
                background: "var(--bg-2)",
                border: "1px solid var(--border)",
                borderRadius: "14px",
                padding: "20px 24px",
                flexGrow: 1,
                marginBottom: "8px",
              }}
            >
              <h3 style={{ fontSize: "16px", fontWeight: 700 }}>{step}</h3>
              <p style={{ color: "var(--text-4)", fontSize: "13px", marginTop: "4px" }}>
                Phase {i + 1} of {roadmap.steps.length}
              </p>
            </div>
          </div>
        ))}
      </div>

      <div
        style={{
          marginTop: "48px",
          background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))",
          border: "1px solid rgba(59,130,246,0.2)",
          borderRadius: "16px",
          padding: "32px",
          textAlign: "center",
        }}
      >
        <CheckCircle size={32} style={{ color: "#34D399", margin: "0 auto 12px" }} />
        <h3 style={{ fontSize: "20px", fontWeight: 700, marginBottom: "8px" }}>Ready to start?</h3>
        <p style={{ color: "var(--text-4)", marginBottom: "20px", fontSize: "14px" }}>
          Begin with the first topic and work your way through the roadmap
        </p>
        <Link
          href="/academies"
          style={{
            display: "inline-flex",
            alignItems: "center",
            gap: "8px",
            background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
            color: "#fff",
            padding: "12px 28px",
            borderRadius: "10px",
            fontSize: "14px",
            fontWeight: 600,
            textDecoration: "none",
          }}
        >
          Start Learning →
        </Link>
      </div>
    </div>
  );
}
