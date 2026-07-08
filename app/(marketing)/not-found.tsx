// Duplicate of app/(app)/not-found.tsx, not a shared import — Next.js
// requires a not-found.tsx to exist per root layout once there's more than
// one (a single top-level app/not-found.tsx errors with "doesn't have a
// root layout" the moment any route in either group calls notFound(),
// confirmed via a real dev-server hit on /dashboard while unauthenticated —
// Clerk's auth.protect() calls notFound() internally by default). No
// `export const runtime = "edge"` here, matching this group's own layout,
// which is deliberately edge-runtime-free so its pages can stay static.
import Link from "next/link";

export default function NotFound() {
  return (
    <div style={{ minHeight: "60vh", display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center", padding: "40px 24px", textAlign: "center" }}>
      <div style={{ fontSize: "72px", marginBottom: "20px" }}>🔍</div>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, color: "var(--text-1)", marginBottom: "12px" }}>Page Not Found</h1>
      <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "400px", marginBottom: "28px", lineHeight: 1.65 }}>
        This content is being prepared. Our experts are writing it now.
      </p>
      <div style={{ display: "flex", gap: "12px", flexWrap: "wrap", justifyContent: "center" }}>
        <Link href="/academies" style={{ padding: "10px 24px", background: "#2563EB", color: "#fff", borderRadius: "8px", textDecoration: "none", fontWeight: 600, fontSize: "14px" }}>Browse Academies</Link>
        <Link href="/" style={{ padding: "10px 24px", background: "var(--bg-2)", color: "var(--text-2)", border: "1px solid var(--border)", borderRadius: "8px", textDecoration: "none", fontWeight: 600, fontSize: "14px" }}>Go Home</Link>
      </div>
    </div>
  );
}
