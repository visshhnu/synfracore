export const metadata = { title: "Community Hub — SynfraCore" };

const features = [
  { icon: "💬", name: "Discussion Boards", desc: "Ask questions, share knowledge, help others", status: "Coming Soon" },
  { icon: "👥", name: "Learning Groups", desc: "Study with peers working on the same tech", status: "Coming Soon" },
  { icon: "🙋", name: "Q&A Forum", desc: "Get answers from experienced practitioners", status: "Coming Soon" },
  { icon: "🧑‍🏫", name: "Mentorship", desc: "Connect with senior engineers for guidance", status: "Coming Soon" },
  { icon: "🏆", name: "Challenges", desc: "Weekly coding and infrastructure challenges", status: "Coming Soon" },
  { icon: "📢", name: "Announcements", desc: "Platform updates and new content alerts", status: "Coming Soon" },
];

export default function CommunityPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      <div className="mb-16 text-center">
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Community Hub
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Learn together. Grow together. A community for infrastructure and cloud engineers.
        </p>
      </div>

      <div
        style={{
          background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))",
          border: "1px solid rgba(59,130,246,0.2)",
          borderRadius: "20px",
          padding: "48px",
          textAlign: "center",
          marginBottom: "48px",
        }}
      >
        <span style={{ fontSize: "56px", display: "block", marginBottom: "16px" }}>🚀</span>
        <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "28px", fontWeight: 700, marginBottom: "12px" }}>
          Community Features Coming in Phase 3
        </h2>
        <p style={{ color: "var(--text-4)", maxWidth: "500px", margin: "0 auto", fontSize: "16px", lineHeight: 1.7 }}>
          We&apos;re building something great. The SynfraCore community will launch with discussion boards, learning groups, mentorship, and live challenges.
        </p>
      </div>

      <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
        {features.map((f) => (
          <div
            key={f.name}
            style={{
              background: "var(--bg-2)",
              border: "1px solid var(--border)",
              borderRadius: "16px",
              padding: "24px",
              opacity: 0.7,
            }}
          >
            <span style={{ fontSize: "32px", display: "block", marginBottom: "12px" }}>{f.icon}</span>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
              <h3 style={{ fontSize: "16px", fontWeight: 700 }}>{f.name}</h3>
              <span style={{ background: "rgba(139,92,246,0.1)", border: "1px solid rgba(139,92,246,0.2)", color: "#A78BFA", padding: "2px 8px", borderRadius: "100px", fontSize: "10px", fontWeight: 600 }}>
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
