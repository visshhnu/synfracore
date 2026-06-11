export const metadata = { title: "Career Hub — SynfraCore" };

const features = [
  { icon: "📄", name: "Resume Builder", desc: "DevOps and cloud-optimized resume templates with ATS tips", status: "Coming Soon" },
  { icon: "🎯", name: "Interview Tracker", desc: "Track applications, interview rounds, and outcomes", status: "Coming Soon" },
  { icon: "💼", name: "Job Preparation", desc: "Company-specific prep, salary negotiation, offer evaluation", status: "Coming Soon" },
  { icon: "🌐", name: "Freelancing Guide", desc: "Build a consulting practice as a cloud/DevOps engineer", status: "Coming Soon" },
  { icon: "🗺️", name: "Career Roadmaps", desc: "From junior to staff engineer — title-by-title progression", status: "Coming Soon" },
  { icon: "💡", name: "Job Board", desc: "Curated DevOps, Cloud, and Platform Engineering roles", status: "Phase 5" },
];

const roles = [
  { title: "DevOps Engineer", salary: "$90K–$150K", icon: "⚙️" },
  { title: "Cloud Architect", salary: "$130K–$200K", icon: "☁️" },
  { title: "Platform Engineer", salary: "$120K–$180K", icon: "🏗️" },
  { title: "Site Reliability Engineer", salary: "$120K–$190K", icon: "🔧" },
  { title: "AI/ML Engineer", salary: "$130K–$210K", icon: "🤖" },
  { title: "Cloud Security Engineer", salary: "$110K–$180K", icon: "🛡️" },
];

export default function CareerPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ marginBottom: "56px", textAlign: "center" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Career Hub
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          From first job to senior engineer — your complete career acceleration platform
        </p>
      </div>

      {/* Salary ranges */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "24px", fontWeight: 700, marginBottom: "20px" }}>
        Career Paths & Compensation
      </h2>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px", marginBottom: "56px" }}>
        {roles.map((role) => (
          <div key={role.title} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px", display: "flex", alignItems: "center", gap: "14px" }}>
            <span style={{ fontSize: "28px" }}>{role.icon}</span>
            <div>
              <div style={{ fontSize: "14px", fontWeight: 700 }}>{role.title}</div>
              <div style={{ color: "#34D399", fontSize: "13px", fontWeight: 600, marginTop: "2px" }}>{role.salary}</div>
            </div>
          </div>
        ))}
      </div>

      {/* Features */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "24px", fontWeight: 700, marginBottom: "20px" }}>
        Career Tools
      </h2>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "20px" }}>
        {features.map((f) => (
          <div
            key={f.name}
            style={{
              background: "var(--bg-2)",
              border: "1px solid var(--border)",
              borderRadius: "16px",
              padding: "24px",
              opacity: 0.75,
            }}
          >
            <span style={{ fontSize: "32px", display: "block", marginBottom: "12px" }}>{f.icon}</span>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
              <h3 style={{ fontSize: "16px", fontWeight: 700 }}>{f.name}</h3>
              <span style={{ background: "rgba(16,185,129,0.1)", border: "1px solid rgba(16,185,129,0.2)", color: "#34D399", padding: "2px 8px", borderRadius: "100px", fontSize: "10px", fontWeight: 600 }}>
                {f.status}
              </span>
            </div>
            <p style={{ color: "var(--text-4)", fontSize: "13px", marginTop: "8px" }}>{f.desc}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
