import Link from "next/link";

export const metadata = { title: "Troubleshooting Hub — SynfraCore" };

const commonIssues = [
  { tech: "Kubernetes", icon: "☸️", issue: "CrashLoopBackOff", color: "#3B82F6" },
  { tech: "Jenkins", icon: "🤖", issue: "Build Pipeline Failure", color: "#F59E0B" },
  { tech: "Terraform", icon: "🏗️", issue: "State Lock Issues", color: "#8B5CF6" },
  { tech: "AWS IAM", icon: "🔐", issue: "Permission Denied Errors", color: "#F43F5E" },
  { tech: "Docker", icon: "🐳", issue: "Container Exit Codes", color: "#06B6D4" },
  { tech: "Nginx", icon: "⚡", issue: "502 Bad Gateway", color: "#10B981" },
  { tech: "Git", icon: "🔀", issue: "Merge Conflicts", color: "#F97316" },
  { tech: "Ansible", icon: "🎭", issue: "SSH Connection Failures", color: "#EAB308" },
  { tech: "ArgoCD", icon: "🔄", issue: "Sync Failed", color: "#EC4899" },
  { tech: "Prometheus", icon: "🔥", issue: "Targets Down", color: "#F43F5E" },
  { tech: "EKS", icon: "☸️", issue: "Node Not Ready", color: "#FF9900" },
  { tech: "Terraform", icon: "🏗️", issue: "Plan/Apply Drift", color: "#8B5CF6" },
];

const categories = [
  { name: "Common Errors", icon: "❌", desc: "Frequent error messages decoded" },
  { name: "Root Cause Analysis", icon: "🔍", desc: "Systematic investigation guides" },
  { name: "Fix Procedures", icon: "🔧", desc: "Step-by-step remediation" },
  { name: "Production Incidents", icon: "🚨", desc: "Real incident post-mortems" },
  { name: "Best Practices", icon: "✅", desc: "Prevent issues before they occur" },
];

export default function TroubleshootingPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      <div className="mb-16 text-center">
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Troubleshooting Hub
        </h1>
        <p style={{ color: "#6B7A99", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Fix real production issues with root cause analysis and step-by-step procedures
        </p>
      </div>

      {/* Categories */}
      <div className="grid gap-4 md:grid-cols-5 mb-16">
        {categories.map((cat) => (
          <div key={cat.name} style={{ background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "14px", padding: "20px", textAlign: "center" }}>
            <span style={{ fontSize: "28px", display: "block", marginBottom: "8px" }}>{cat.icon}</span>
            <h3 style={{ fontSize: "13px", fontWeight: 700, marginBottom: "4px" }}>{cat.name}</h3>
            <p style={{ color: "#6B7A99", fontSize: "11px" }}>{cat.desc}</p>
          </div>
        ))}
      </div>

      {/* Common issues */}
      <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "26px", fontWeight: 700, marginBottom: "24px" }}>
        Common Issues
      </h2>
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {commonIssues.map((item) => (
          <div
            key={`${item.tech}-${item.issue}`}
            style={{
              background: "#0F1A2E",
              border: "1px solid #1E2D47",
              borderRadius: "14px",
              padding: "20px",
              display: "flex",
              alignItems: "center",
              gap: "14px",
              cursor: "pointer",
              transition: "all 0.2s",
            }}
            className="hover:border-red-500/30"
          >
            <div
              style={{
                width: "44px",
                height: "44px",
                borderRadius: "12px",
                background: `${item.color}15`,
                border: `1px solid ${item.color}25`,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "20px",
                flexShrink: 0,
              }}
            >
              {item.icon}
            </div>
            <div>
              <div style={{ fontSize: "13px", fontWeight: 700, color: "#E8EDF5" }}>{item.issue}</div>
              <div style={{ color: item.color, fontSize: "11px", fontWeight: 600, marginTop: "2px" }}>{item.tech}</div>
            </div>
            <span style={{ marginLeft: "auto", color: "#6B7A99", fontSize: "18px" }}>→</span>
          </div>
        ))}
      </div>

      {/* CTA */}
      <div
        style={{
          marginTop: "48px",
          background: "rgba(244, 63, 94, 0.05)",
          border: "1px solid rgba(244, 63, 94, 0.15)",
          borderRadius: "16px",
          padding: "32px",
          textAlign: "center",
        }}
      >
        <h3 style={{ fontSize: "20px", fontWeight: 700, marginBottom: "8px" }}>
          Technology-Specific Troubleshooting
        </h3>
        <p style={{ color: "#6B7A99", marginBottom: "20px", fontSize: "14px" }}>
          Navigate to any technology to access its dedicated troubleshooting section
        </p>
        <Link
          href="/academies"
          style={{
            display: "inline-flex",
            alignItems: "center",
            gap: "8px",
            background: "rgba(244, 63, 94, 0.1)",
            border: "1px solid rgba(244, 63, 94, 0.2)",
            color: "#FB7185",
            padding: "10px 24px",
            borderRadius: "10px",
            fontSize: "13px",
            fontWeight: 600,
            textDecoration: "none",
          }}
        >
          Browse Technologies →
        </Link>
      </div>
    </div>
  );
}
