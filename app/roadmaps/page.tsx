import Link from "next/link";
import { roadmaps } from "@/lib/data/navigation";
import { Clock, ArrowRight } from "lucide-react";

export const metadata = {
  title: "Roadmaps — SynfraCore",
  description: "Step-by-step career roadmaps for DevOps, Cloud, AI, Data, and Security engineers",
};

const salaries: Record<string, string> = {
  "devops-engineer": "₹8L – ₹35L",
  "cloud-architect": "₹15L – ₹60L",
  "platform-engineer": "₹20L – ₹80L",
  "ai-engineer": "₹18L – ₹80L",
  "data-analyst": "₹5L – ₹25L",
  "security-engineer": "₹10L – ₹45L",
};

export default function RoadmapsPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ marginBottom: "56px", textAlign: "center" }}>
        <div style={{ display: "inline-block", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "16px" }}>
          6 Career Paths
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Career Roadmaps
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "560px", margin: "0 auto", lineHeight: 1.6 }}>
          Step-by-step learning paths from beginner to job-ready. Follow a roadmap and go from zero to employable in 4–9 months.
        </p>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(440px, 1fr))", gap: "24px" }}>
        {roadmaps.map((roadmap) => (
          <Link key={roadmap.slug} href={`/roadmaps/${roadmap.slug}`} style={{ textDecoration: "none" }}>
            <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "20px", padding: "32px", height: "100%", transition: "all 0.2s", cursor: "pointer" }}
              onMouseEnter={e => { (e.currentTarget as HTMLDivElement).style.borderColor = "#3B82F6"; (e.currentTarget as HTMLDivElement).style.background = "var(--bg-1)"; }}
              onMouseLeave={e => { (e.currentTarget as HTMLDivElement).style.borderColor = "var(--border)"; (e.currentTarget as HTMLDivElement).style.background = "var(--bg-2)"; }}>
              
              <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", gap: "12px", marginBottom: "20px" }}>
                <div style={{ display: "flex", alignItems: "center", gap: "14px" }}>
                  <span style={{ fontSize: "36px" }}>{roadmap.icon}</span>
                  <div>
                    <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "20px", fontWeight: 700, marginBottom: "4px" }}>{roadmap.title}</h2>
                    <div style={{ display: "flex", gap: "8px", alignItems: "center", flexWrap: "wrap" }}>
                      <span style={{ display: "flex", alignItems: "center", gap: "4px", color: "var(--text-4)", fontSize: "13px" }}>
                        <Clock size={12}/> {roadmap.duration}
                      </span>
                      {salaries[roadmap.slug] && (
                        <span style={{ background: "#10B98120", color: "#10B981", padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 600 }}>
                          {salaries[roadmap.slug]}
                        </span>
                      )}
                    </div>
                  </div>
                </div>
                <ArrowRight size={18} color="var(--text-4)" style={{ flexShrink: 0, marginTop: "4px" }}/>
              </div>

              <div style={{ position: "relative", paddingLeft: "20px" }}>
                <div style={{ position: "absolute", left: "7px", top: "8px", bottom: "8px", width: "2px", background: "var(--border)" }}/>
                {roadmap.steps.map((step, i) => (
                  <div key={step} style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "10px", position: "relative" }}>
                    <div style={{ width: "14px", height: "14px", borderRadius: "50%", background: i === 0 ? "#3B82F6" : "var(--border)", border: "2px solid", borderColor: i === 0 ? "#3B82F6" : "var(--border)", flexShrink: 0, position: "absolute", left: "-20px" }}/>
                    <span style={{ fontSize: "13px", color: i === 0 ? "var(--text-1)" : "var(--text-4)", fontWeight: i === 0 ? 600 : 400 }}>{step}</span>
                  </div>
                ))}
              </div>

              <div style={{ marginTop: "20px", paddingTop: "20px", borderTop: "1px solid var(--border)", display: "flex", alignItems: "center", justifyContent: "space-between" }}>
                <span style={{ fontSize: "13px", color: "var(--text-4)" }}>{roadmap.steps.length} learning phases</span>
                <span style={{ background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", fontSize: "13px", fontWeight: 700 }}>View full roadmap →</span>
              </div>
            </div>
          </Link>
        ))}
      </div>

      {/* Bottom CTA */}
      <div style={{ marginTop: "64px", textAlign: "center", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "20px", padding: "48px 32px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "28px", fontWeight: 800, marginBottom: "12px" }}>
          Not sure which path to choose?
        </h2>
        <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "500px", margin: "0 auto 24px", lineHeight: 1.6 }}>
          Browse all 10 academies and 101 technologies. Start with any topic that interests you — the roadmap will show you how it connects to your career goal.
        </p>
        <Link href="/academies" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
          Browse All Academies <ArrowRight size={16}/>
        </Link>
      </div>
    </div>
  );
}
