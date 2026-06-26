import Link from "next/link";
export const runtime = "edge";
export const metadata = {
  title: "Community — SynfraCore",
  description: "Join the SynfraCore community. Connect with DevOps engineers, cloud architects, and AI practitioners on Telegram, LinkedIn, and GitHub.",
};

const channels = [
  {
    icon: "✈", name: "Telegram", handle: "t.me/synfracore", color: "#0088CC",
    href: "https://t.me/synfracore",
    desc: "Daily tips, job alerts, Q&A, and quick help from the community",
    members: "Growing", cta: "Join Channel",
  },
  {
    icon: ">", name: "LinkedIn", handle: "linkedin.com/company/synfracore", color: "#0077B5",
    href: "https://linkedin.com/company/synfracore",
    desc: "Career updates, industry news, and professional networking",
    members: "Growing", cta: "Follow Page",
  },
  {
    icon: ">", name: "GitHub", handle: "github.com/synfracore", color: "#888",
    href: "https://github.com/synfracore",
    desc: "Open-source tools, code examples from the courses, and contributions",
    members: "Growing", cta: "Follow & Star",
  },
  {
    icon: "▶", name: "YouTube", handle: "@synfracore", color: "#FF0000",
    href: "https://youtube.com/@synfracore",
    desc: "Video walkthroughs, lab demos, and interview preparation sessions",
    members: "Growing", cta: "Subscribe",
  },
  {
    icon: ">", name: "Twitter / X", handle: "@synfracore", color: "#1DA1F2",
    href: "https://twitter.com/synfracore",
    desc: "Quick updates, one-liners, and industry commentary",
    members: "Growing", cta: "Follow",
  },
];

const discussions = [
  { emoji: "[Q]", topic: "I finally passed CKA after 3 attempts — here's what worked", replies: 24, tag: "Kubernetes" },
  { emoji: "[T]", topic: "Terraform state file got corrupted in production — solved", replies: 18, tag: "Terraform" },
  { emoji: ">", topic: "My AWS bill went from ₹80k to ₹12k/month — cost optimization tips", replies: 31, tag: "AWS" },
  { emoji: "*", topic: "Built a RAG system for our internal docs — lessons learned", replies: 15, tag: "AI" },
  { emoji: ">", topic: "Got promoted from L2 to L3 — how I prepared my portfolio", replies: 42, tag: "Career" },
  { emoji: "⚠", topic: "PostgreSQL OOM kill in production — RCA and fix", replies: 19, tag: "Databases" },
];

export default function CommunityPage() {
  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "64px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Join the Community
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "560px", margin: "0 auto", lineHeight: 1.7 }}>
          Connect with DevOps engineers, cloud architects, and AI practitioners. Share what you're building, get unstuck faster, and grow your career together.
        </p>
      </div>

      {/* Channels */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(310px, 1fr))", gap: "16px", marginBottom: "64px" }}>
        {channels.map(ch => (
          <a key={ch.name} href={ch.href} target="_blank" rel="noopener noreferrer"
            style={{ display: "flex", flexDirection: "column", gap: "12px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px", textDecoration: "none", color: "var(--text-1)" }}>
            <div style={{ display: "flex", alignItems: "center", gap: "12px" }}>
              <div style={{ width: "48px", height: "48px", borderRadius: "14px", background: `${ch.color}18`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "22px", flexShrink: 0 }}>{ch.icon}</div>
              <div>
                <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px" }}>{ch.name}</div>
                <div style={{ fontSize: "12px", color: ch.color }}>{ch.handle}</div>
              </div>
            </div>
            <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.6, margin: 0 }}>{ch.desc}</p>
            <div style={{ display: "inline-flex", alignItems: "center", gap: "6px", background: `${ch.color}18`, color: ch.color, padding: "8px 16px", borderRadius: "8px", fontSize: "13px", fontWeight: 700, alignSelf: "flex-start", marginTop: "auto" }}>
              {ch.cta} →
            </div>
          </a>
        ))}
      </div>

      {/* Recent discussions preview */}
      <div style={{ marginBottom: "48px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "22px", marginBottom: "8px" }}>
          What People Are Discussing
        </h2>
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "24px" }}>
          Join the conversation on Telegram — these are the kinds of topics our community discusses daily.
        </p>
        <div style={{ display: "flex", flexDirection: "column", gap: "10px" }}>
          {discussions.map(d => (
            <a key={d.topic} href="https://t.me/synfracore" target="_blank" rel="noopener noreferrer"
              style={{ display: "flex", alignItems: "center", gap: "16px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "16px 20px", textDecoration: "none", color: "var(--text-1)" }}>
              <span style={{ fontSize: "20px", flexShrink: 0 }}>{d.emoji}</span>
              <span style={{ flex: 1, fontSize: "14px", fontWeight: 500 }}>{d.topic}</span>
              <div style={{ display: "flex", alignItems: "center", gap: "8px", flexShrink: 0 }}>
                <span style={{ background: "rgba(59,130,246,0.1)", color: "#3B82F6", padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 600 }}>{d.tag}</span>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{d.replies} replies</span>
              </div>
            </a>
          ))}
        </div>
      </div>

      {/* CTA */}
      <div style={{ textAlign: "center", background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "48px 32px" }}>
        <div style={{ fontSize: "36px", marginBottom: "16px" }}>✈</div>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "26px", marginBottom: "12px" }}>Start with Telegram</h2>
        <p style={{ color: "var(--text-4)", fontSize: "15px", maxWidth: "440px", margin: "0 auto 24px", lineHeight: 1.7 }}>
          The most active community channel. Get daily DevOps tips, ask questions, and share what you're building.
        </p>
        <a href="https://t.me/synfracore" target="_blank" rel="noopener noreferrer"
          style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "#0088CC", color: "#fff", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
          Join Telegram Community →
        </a>
      </div>
    </div>
  );
}
