import Link from "next/link";
import { Wrench, ArrowRight } from "lucide-react";

const issues = [
  { tech: "Kubernetes", issue: "CrashLoopBackOff", icon: "☸️", color: "#3B82F6", severity: "High" },
  { tech: "Terraform", issue: "State Lock Error", icon: "🏗️", color: "#8B5CF6", severity: "Medium" },
  { tech: "Jenkins", issue: "Build Pipeline Failure", icon: "🤖", color: "#F59E0B", severity: "High" },
  { tech: "Docker", issue: "Container Exit Code 137", icon: "🐳", color: "#06B6D4", severity: "Medium" },
  { tech: "AWS IAM", issue: "Access Denied Exception", icon: "🔐", color: "#F43F5E", severity: "High" },
  { tech: "ArgoCD", issue: "App OutOfSync / Sync Failed", icon: "🔄", color: "#EC4899", severity: "Medium" },
];

const severityStyle = {
  High: { color: "#FB7185", bg: "rgba(244,63,94,0.1)", border: "rgba(244,63,94,0.2)" },
  Medium: { color: "#FCD34D", bg: "rgba(245,158,11,0.1)", border: "rgba(245,158,11,0.2)" },
  Low: { color: "#34D399", bg: "rgba(16,185,129,0.1)", border: "rgba(16,185,129,0.2)" },
};

export default function TroubleshootingPreview() {
  return (
    <section style={{ background: "#0C1524", borderTop: "1px solid #1E2D47", borderBottom: "1px solid #1E2D47" }}>
      <div className="mx-auto max-w-7xl px-6 py-20">
        <div className="flex items-end justify-between mb-14 flex-wrap gap-4">
          <div>
            <span style={{ display: "inline-flex", alignItems: "center", gap: "6px", background: "rgba(244,63,94,0.1)", border: "1px solid rgba(244,63,94,0.2)", color: "#FB7185", fontSize: "12px", fontWeight: 600, letterSpacing: "0.1em", textTransform: "uppercase", padding: "5px 14px", borderRadius: "100px", marginBottom: "16px" }}>
              <Wrench size={12} /> Production Ready
            </span>
            <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 3.5vw, 42px)", fontWeight: 800, letterSpacing: "-0.02em" }}>
              Troubleshooting Hub
            </h2>
            <p style={{ color: "var(--text-4)", fontSize: "16px", marginTop: "8px" }}>
              Root cause analysis and fix procedures for real production issues
            </p>
          </div>
          <Link href="/troubleshooting" style={{ display: "flex", alignItems: "center", gap: "6px", color: "#FB7185", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
            All Issues <ArrowRight size={16} />
          </Link>
        </div>

        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
          {issues.map((item) => {
            const ss = severityStyle[item.severity as keyof typeof severityStyle];
            return (
              <Link key={`${item.tech}-${item.issue}`} href="/troubleshooting" style={{ textDecoration: "none" }}>
                <div style={{ background: "var(--bg-2)", border: "1px solid #1E2D47", borderRadius: "14px", padding: "20px", transition: "all 0.2s", display: "flex", gap: "14px", alignItems: "flex-start" }} className="hover:border-red-500/30">
                  <div style={{ width: "44px", height: "44px", borderRadius: "12px", background: `${item.color}12`, border: `1px solid ${item.color}20`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "20px", flexShrink: 0 }}>
                    {item.icon}
                  </div>
                  <div style={{ flexGrow: 1 }}>
                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "6px" }}>
                      <h3 style={{ fontSize: "14px", fontWeight: 700, lineHeight: 1.3 }}>{item.issue}</h3>
                      <span style={{ background: ss.bg, border: `1px solid ${ss.border}`, color: ss.color, padding: "1px 7px", borderRadius: "100px", fontSize: "10px", fontWeight: 600, flexShrink: 0, marginLeft: "8px" }}>
                        {item.severity}
                      </span>
                    </div>
                    <p style={{ color: item.color, fontSize: "11px", fontWeight: 600 }}>{item.tech}</p>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </div>
    </section>
  );
}
