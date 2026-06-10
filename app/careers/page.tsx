export const runtime = "edge";
import Link from "next/link";

export const metadata = { title: "Careers — SynfraCore", description: "Join the SynfraCore team and help build the future of tech education." };

export default function Page() {
  return (
    <div style={{ maxWidth: "800px", margin: "0 auto", padding: "64px 24px" }}>
      <Link href="/" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", display: "inline-flex", alignItems: "center", gap: "6px", marginBottom: "32px" }}>
        ← Back to Home
      </Link>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "36px", fontWeight: 800, color: "var(--text-1)", marginBottom: "16px" }}>Careers</h1>
      <p style={{ color: "var(--text-3)", fontSize: "16px", lineHeight: 1.7, marginBottom: "24px" }}>Join the SynfraCore team and help build the future of tech education.</p>
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "32px", textAlign: "center" }}>
        <div style={{ fontSize: "48px", marginBottom: "16px" }}>🚧</div>
        <p style={{ color: "var(--text-3)", fontSize: "15px" }}>This page is being built. Meanwhile, reach us at <a href="mailto:hello@synfracore.com" style={{ color: "#3B82F6" }}>hello@synfracore.com</a></p>
      </div>
    </div>
  );
}
