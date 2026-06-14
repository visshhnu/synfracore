import Link from "next/link";
import { ArrowRight, Mail } from "lucide-react";
export const runtime = "edge";
export const metadata = { title: "Careers | SynfraCore", description: "Join SynfraCore and help build the future of tech education in India." };
const openRoles = [
  { title: "Senior Content Engineer — DevOps", type: "Contract", location: "Remote (India)", skills: ["Kubernetes", "Terraform", "CI/CD", "Technical Writing"] },
  { title: "AI/ML Content Engineer", type: "Contract", location: "Remote (India)", skills: ["LLMs", "Python", "RAG", "LangChain"] },
  { title: "Full Stack Developer (Next.js)", type: "Full-time", location: "Remote (India)", skills: ["Next.js", "TypeScript", "React", "PostgreSQL"] },
];
export default function CareersPage() {
  return (
    <div style={{ maxWidth: "860px", margin: "0 auto", padding: "56px 24px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,4vw,44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "16px" }}>Work at SynfraCore</h1>
      <p style={{ color: "var(--text-4)", fontSize: "17px", lineHeight: 1.7, marginBottom: "48px" }}>Help us build the most comprehensive tech learning platform in India. We believe learning should be practical, accessible, and career-focused.</p>
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "20px" }}>Open Positions</h2>
      <div style={{ display: "flex", flexDirection: "column", gap: "16px", marginBottom: "48px" }}>
        {openRoles.map(role => (
          <div key={role.title} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", flexWrap: "wrap", gap: "12px", marginBottom: "12px" }}>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px" }}>{role.title}</h3>
              <div style={{ display: "flex", gap: "8px" }}>
                <span style={{ background: "rgba(59,130,246,0.1)", color: "#3B82F6", padding: "3px 10px", borderRadius: "6px", fontSize: "12px", fontWeight: 600 }}>{role.type}</span>
                <span style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "3px 10px", borderRadius: "6px", fontSize: "12px", color: "var(--text-4)" }}>{role.location}</span>
              </div>
            </div>
            <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
              {role.skills.map(s => <span key={s} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "2px 8px", borderRadius: "4px", fontSize: "11px", color: "var(--text-4)" }}>{s}</span>)}
            </div>
          </div>
        ))}
      </div>
      <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "32px", textAlign: "center" }}>
        <Mail size={28} style={{ margin: "0 auto 14px", color: "#3B82F6" }}/>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "8px" }}>Apply or Send Your CV</h3>
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "20px" }}>Send your resume and a note on why you want to join to:</p>
        <a href="mailto:careers@synfracore.com" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "12px 24px", borderRadius: "10px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
          careers@synfracore.com <ArrowRight size={15}/>
        </a>
      </div>
    </div>
  );
}
