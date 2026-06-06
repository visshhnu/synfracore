import Link from "next/link";
import { ArrowRight } from "lucide-react";

const steps = [
  { icon: "📖", label: "Learn", desc: "Structured knowledge base" },
  { icon: "🧪", label: "Practice", desc: "Hands-on labs" },
  { icon: "🏗️", label: "Build", desc: "Real projects" },
  { icon: "🔧", label: "Troubleshoot", desc: "Fix real issues" },
  { icon: "🏆", label: "Certify", desc: "Get certified" },
  { icon: "💼", label: "Get Hired", desc: "Career ready" },
];

export default function JourneySection() {
  return (
    <section
      style={{
        background: "#0C1524",
        borderTop: "1px solid #1E2D47",
        borderBottom: "1px solid #1E2D47",
      }}
    >
      <div className="mx-auto max-w-7xl px-6 py-20">
        <div className="text-center mb-16">
          <h2
            style={{
              fontFamily: "'Syne', sans-serif",
              fontSize: "clamp(28px, 4vw, 44px)",
              fontWeight: 800,
              letterSpacing: "-0.02em",
              marginBottom: "12px",
            }}
          >
            Your Learning Journey
          </h2>
          <p style={{ color: "var(--text-4)", fontSize: "16px" }}>
            A complete path from beginner to career-ready professional
          </p>
        </div>

        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit, minmax(140px, 1fr))",
            gap: "16px",
            marginBottom: "48px",
          }}
        >
          {steps.map((step, i) => (
            <div key={step.label} style={{ position: "relative" }}>
              <div
                style={{
                  background: "var(--bg-2)",
                  border: "1px solid #1E2D47",
                  borderRadius: "14px",
                  padding: "20px 16px",
                  textAlign: "center",
                }}
              >
                <span style={{ fontSize: "28px", display: "block", marginBottom: "8px" }}>{step.icon}</span>
                <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "4px" }}>{step.label}</div>
                <div style={{ color: "var(--text-4)", fontSize: "12px" }}>{step.desc}</div>
                <div
                  style={{
                    position: "absolute",
                    top: "-12px",
                    left: "50%",
                    transform: "translateX(-50%)",
                    background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
                    color: "#fff",
                    width: "24px",
                    height: "24px",
                    borderRadius: "50%",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    fontSize: "11px",
                    fontWeight: 700,
                  }}
                >
                  {i + 1}
                </div>
              </div>
            </div>
          ))}
        </div>

        <div
          style={{
            background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))",
            border: "1px solid rgba(59, 130, 246, 0.2)",
            borderRadius: "20px",
            padding: "40px",
            textAlign: "center",
          }}
        >
          <h3
            style={{
              fontFamily: "'Syne', sans-serif",
              fontSize: "28px",
              fontWeight: 700,
              marginBottom: "12px",
            }}
          >
            Ready to start your journey?
          </h3>
          <p style={{ color: "var(--text-4)", marginBottom: "28px", fontSize: "16px" }}>
            Join thousands of engineers mastering modern tech skills
          </p>
          <div style={{ display: "flex", gap: "16px", justifyContent: "center", flexWrap: "wrap" }}>
            <Link
              href="/academies"
              style={{
                display: "inline-flex",
                alignItems: "center",
                gap: "8px",
                background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
                color: "#fff",
                padding: "14px 32px",
                borderRadius: "12px",
                fontSize: "15px",
                fontWeight: 600,
                textDecoration: "none",
                boxShadow: "0 8px 32px rgba(59, 130, 246, 0.3)",
              }}
            >
              Browse Academies <ArrowRight size={18} />
            </Link>
            <Link
              href="/roadmaps"
              style={{
                display: "inline-flex",
                alignItems: "center",
                gap: "8px",
                background: "transparent",
                color: "var(--text-1)",
                padding: "14px 32px",
                borderRadius: "12px",
                fontSize: "15px",
                fontWeight: 600,
                textDecoration: "none",
                border: "1px solid #2A3F5E",
              }}
            >
              View Roadmaps
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
}
