export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { ArrowRight } from "lucide-react";

export const metadata: Metadata = {
  title: "Tech Academies — DevOps, Cloud, AI, Security | SynfraCore",
  description: "8 deep-dive academies: DevOps, Cloud, AI, Databases, Security, Healthcare, Platform Engineering, and Essentials. Structured paths from beginner to architect.",
  alternates: { canonical: "https://synfracore.com/academies" },
};

const quickPaths = [
  { title: "Land a DevOps job", path: "Linux → Docker → K8s → CI/CD → Cloud", href: "/academies/devops", color: "#F59E0B" },
  { title: "Get AWS certified", path: "Cloud fundamentals → EC2/S3/VPC → Solutions Architect → Practice", href: "/academies/cloud", color: "#FF9900" },
  { title: "Learn AI Engineering", path: "Python → ML basics → LLMs → RAG → Agents → Deployment", href: "/academies/ai", color: "#8B5CF6" },
  { title: "Become an SRE", path: "K8s → Prometheus → Grafana → Alerting → Incident response", href: "/academies/devops", color: "#10B981" },
];

export default function AcademiesPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>

      {/* Header */}
      <div style={{ marginBottom: "56px" }}>
        <div className="badge badge-blue" style={{ marginBottom: "20px" }}>8 Tech Academies</div>
        <h1 className="display-lg" style={{ marginBottom: "16px" }}>
          Deep-Dive Learning Paths
        </h1>
        <p className="body-lg" style={{ maxWidth: "580px", marginBottom: "32px" }}>
          Each academy is a complete learning ecosystem — structured domains, guided paths,
          hands-on labs, interview prep, and expert content from beginner to architect level.
        </p>

        {/* Quick paths */}
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(240px, 1fr))", gap: "12px", marginBottom: "8px" }}>
          {quickPaths.map(p => (
            <Link key={p.title} href={p.href} style={{ textDecoration: "none" }}>
              <div className="card-hover" style={{ padding: "16px 18px", borderRadius: "10px", border: `1px solid ${p.color}25`, background: p.color + "06" }}>
                <div style={{ fontWeight: 700, fontSize: "13px", color: "var(--text-1)", marginBottom: "6px" }}>{p.title}</div>
                <div style={{ fontSize: "11px", color: p.color, fontWeight: 600, lineHeight: 1.5 }}>{p.path}</div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Academy cards */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(340px, 1fr))", gap: "20px" }}>
        {academies.map(a => (
          <Link key={a.slug} href={`/academies/${a.slug}`} style={{ textDecoration: "none" }}>
            <div className="card-hover" style={{
              padding: "28px", borderRadius: "16px",
              border: "1px solid var(--border)", background: "var(--bg-1)",
              cursor: "pointer", height: "100%",
              borderTop: `3px solid ${a.color}`
            }}>
              <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "16px" }}>
                <span style={{ fontSize: "40px" }}>{a.icon}</span>
                <span style={{ background: a.color + "20", color: a.color, fontSize: "11px", fontWeight: 700, padding: "4px 10px", borderRadius: "6px" }}>
                  {a.domains.length} Domains
                </span>
              </div>
              <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "18px", marginBottom: "6px", color: "var(--text-1)" }}>
                {a.title}
              </h2>
              <p style={{ color: a.color, fontSize: "12px", fontWeight: 600, marginBottom: "10px" }}>{a.subtitle}</p>
              <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6, marginBottom: "16px" }}>
                {a.description.slice(0, 120)}...
              </p>

              {/* Domain tags */}
              <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "16px" }}>
                {a.domains.slice(0, 4).map(d => (
                  <span key={d.slug} style={{ fontSize: "10px", padding: "2px 8px", borderRadius: "4px", background: a.color + "12", color: a.color, fontWeight: 600 }}>
                    {d.name}
                  </span>
                ))}
                {a.domains.length > 4 && (
                  <span style={{ fontSize: "10px", color: "var(--text-4)", padding: "2px 4px" }}>+{a.domains.length - 4} more</span>
                )}
              </div>

              <div style={{ display: "flex", alignItems: "center", gap: "6px", color: a.color, fontSize: "13px", fontWeight: 700 }}>
                Start Learning <ArrowRight size={14} />
              </div>
            </div>
          </Link>
        ))}
      </div>

      {/* Education bridge */}
      <div style={{ marginTop: "48px", padding: "28px 32px", borderRadius: "16px", background: "linear-gradient(135deg,rgba(236,72,153,0.06),rgba(139,92,246,0.06))", border: "1px solid rgba(236,72,153,0.15)", display: "flex", alignItems: "center", justifyContent: "space-between", flexWrap: "wrap", gap: "20px" }}>
        <div>
          <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "18px", marginBottom: "6px" }}>
            📚 Also preparing for exams?
          </div>
          <div style={{ color: "var(--text-3)", fontSize: "14px" }}>
            JEE · NEET · GATE · Banking · UPSC · SSC · Defence · Class 10 · Class 12
          </div>
        </div>
        <Link href="/learn" className="btn-primary" style={{ background: "linear-gradient(135deg,#EC4899,#8B5CF6)", whiteSpace: "nowrap" }}>
          Go to Academy →
        </Link>
      </div>

    </div>
  );
}
