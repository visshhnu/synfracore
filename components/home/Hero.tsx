import Link from "next/link";
import { ArrowRight, BookOpen, FlaskConical, Code2, Trophy } from "lucide-react";

const features = [
  { icon: <BookOpen size={16} />, text: "50+ Technologies" },
  { icon: <FlaskConical size={16} />, text: "Hands-on Labs" },
  { icon: <Code2 size={16} />, text: "Real Projects" },
  { icon: <Trophy size={16} />, text: "Cert Preparation" },
];

const techBadges = [
  "Linux", "Docker", "Kubernetes", "Terraform", "AWS", "Azure",
  "Python", "Ansible", "ArgoCD", "Helm", "Jenkins", "Prometheus",
  "LangChain", "RAG", "K8s", "GitOps",
];

export default function Hero() {
  return (
    <section
      className="grid-bg relative overflow-hidden"
      style={{ minHeight: "92vh", display: "flex", alignItems: "center" }}
    >
      {/* Glow blobs */}
      <div
        style={{
          position: "absolute",
          top: "-200px",
          left: "-200px",
          width: "600px",
          height: "600px",
          background: "radial-gradient(circle, rgba(59,130,246,0.12) 0%, transparent 70%)",
          borderRadius: "50%",
          pointerEvents: "none",
        }}
      />
      <div
        style={{
          position: "absolute",
          bottom: "-200px",
          right: "-100px",
          width: "500px",
          height: "500px",
          background: "radial-gradient(circle, rgba(139,92,246,0.10) 0%, transparent 70%)",
          borderRadius: "50%",
          pointerEvents: "none",
        }}
      />

      <div className="mx-auto max-w-7xl px-6 py-24 w-full">
        <div className="grid lg:grid-cols-2 gap-16 items-center">
          {/* Left */}
          <div>
            <div
              
              style={{
                display: "inline-flex",
                alignItems: "center",
                gap: "8px",
                background: "rgba(59, 130, 246, 0.1)",
                border: "1px solid rgba(59, 130, 246, 0.3)",
                borderRadius: "100px",
                padding: "6px 16px",
                marginBottom: "28px",
                fontSize: "13px",
                fontWeight: 600,
                color: "#60A5FA",
              }}
            >
              <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: "#34D399", display: "inline-block" }} />
              The Complete Tech Learning Ecosystem
            </div>

            <h1
              
              style={{
                fontFamily: "'Syne', sans-serif",
                fontSize: "clamp(42px, 6vw, 72px)",
                fontWeight: 800,
                lineHeight: 1.05,
                letterSpacing: "-0.03em",
                marginBottom: "24px",
                opacity: 1,
              }}
            >
              Master{" "}
              <span className="gradient-text">DevOps,</span>
              <br />
              Cloud &{" "}
              <span className="gradient-text">AI</span>
              <br />
              Engineering
            </h1>

            <p
              
              style={{
                color: "var(--text-3)",
                fontSize: "18px",
                lineHeight: 1.7,
                maxWidth: "480px",
                marginBottom: "36px",
                opacity: 1,
              }}
            >
              6 Academies. 50+ Technologies. Structured roadmaps, hands-on labs,
              real projects, and certification prep — all in one platform.
            </p>

            <div
              
              style={{ display: "flex", gap: "12px", flexWrap: "wrap", marginBottom: "40px", opacity: 1 }}
            >
              {features.map(({ icon, text }) => (
                <div
                  key={text}
                  style={{
                    display: "flex",
                    alignItems: "center",
                    gap: "6px",
                    background: "var(--bg-2)",
                    border: "1px solid #1E2D47",
                    borderRadius: "8px",
                    padding: "8px 14px",
                    fontSize: "13px",
                    fontWeight: 500,
                    color: "var(--text-3)",
                  }}
                >
                  <span style={{ color: "#3B82F6" }}>{icon}</span>
                  {text}
                </div>
              ))}
            </div>

            <div
              
              style={{ display: "flex", gap: "14px", flexWrap: "wrap", opacity: 1 }}
            >
              <Link
                href="/academies"
                style={{
                  display: "inline-flex",
                  alignItems: "center",
                  gap: "8px",
                  background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
                  color: "#fff",
                  padding: "14px 28px",
                  borderRadius: "12px",
                  fontSize: "15px",
                  fontWeight: 600,
                  textDecoration: "none",
                  transition: "opacity 0.2s, transform 0.2s",
                  boxShadow: "0 8px 32px rgba(59, 130, 246, 0.3)",
                }}
                className="hover:opacity-90"
              >
                Explore Academies <ArrowRight size={18} />
              </Link>
              <Link
                href="/roadmaps"
                style={{
                  display: "inline-flex",
                  alignItems: "center",
                  gap: "8px",
                  background: "transparent",
                  color: "var(--text-1)",
                  padding: "14px 28px",
                  borderRadius: "12px",
                  fontSize: "15px",
                  fontWeight: 600,
                  textDecoration: "none",
                  border: "1px solid #2A3F5E",
                  transition: "background 0.2s",
                }}
                className="hover:bg-white/5"
              >
                View Roadmaps
              </Link>
            </div>
          </div>

          {/* Right — Tech badge cloud */}
          <div
            
            style={{ opacity: 1 }}
          >
            <div
              style={{
                background: "var(--bg-2)",
                border: "1px solid #1E2D47",
                borderRadius: "24px",
                padding: "40px",
                position: "relative",
              }}
              className="glow-blue"
            >
              <div style={{ textAlign: "center", marginBottom: "28px" }}>
                <div
                  style={{
                    fontFamily: "'Syne', sans-serif",
                    fontSize: "56px",
                    fontWeight: 800,
                    background: "linear-gradient(135deg, #3B82F6, #8B5CF6, #10B981)",
                    WebkitBackgroundClip: "text",
                    WebkitTextFillColor: "transparent",
                    backgroundClip: "text",
                    lineHeight: 1,
                  }}
                >
                  ∞
                </div>
                <p style={{ color: "var(--text-4)", fontSize: "13px", marginTop: "8px", fontWeight: 500, letterSpacing: "0.08em", textTransform: "uppercase" }}>
                  Technologies Covered
                </p>
              </div>

              <div style={{ display: "flex", flexWrap: "wrap", gap: "8px", justifyContent: "center" }}>
                {techBadges.map((tech, i) => (
                  <span
                    key={tech}
                    style={{
                      background: `rgba(${[59,16,139,245,244,59,16,59,245,16,59,245,139,59,59,16][i % 16]}, ${[130,185,92,158,63,130,185,130,158,185,130,158,92,130,130,185][i % 16]}, ${[246,129,246,11,94,246,129,246,11,129,246,11,246,246,246,129][i % 16]}, 0.12)`,
                      border: `1px solid rgba(${[59,16,139,245,244,59,16,59,245,16,59,245,139,59,59,16][i % 16]}, ${[130,185,92,158,63,130,185,130,158,185,130,158,92,130,130,185][i % 16]}, ${[246,129,246,11,94,246,129,246,11,129,246,11,246,246,246,129][i % 16]}, 0.25)`,
                      color: `rgba(${[147,52,167,251,251,147,52,147,251,52,147,251,167,147,147,52][i % 16]}, ${[197,211,139,191,113,197,211,197,191,211,197,191,139,197,197,211][i % 16]}, ${[253,153,253,73,33,253,153,253,73,153,253,73,253,253,253,153][i % 16]}, 1)`,
                      padding: "5px 12px",
                      borderRadius: "100px",
                      fontSize: "12px",
                      fontWeight: 600,
                    }}
                  >
                    {tech}
                  </span>
                ))}
              </div>

              <div
                style={{
                  marginTop: "28px",
                  padding: "16px",
                  background: "rgba(59, 130, 246, 0.05)",
                  border: "1px solid rgba(59, 130, 246, 0.1)",
                  borderRadius: "12px",
                  textAlign: "center",
                }}
              >
                <p style={{ color: "var(--text-4)", fontSize: "12px", fontWeight: 500, letterSpacing: "0.06em" }}>
                  LEARN → PRACTICE → BUILD → TROUBLESHOOT → CERTIFY → GET HIRED
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
