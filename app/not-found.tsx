import Link from "next/link";
import NotFoundDiagnosticsBeacon from "@/components/NotFoundDiagnosticsBeacon";

// The server-side headers() logging that used to live here was removed
// (2026-11-25): the root not-found boundary is part of EVERY route's tree,
// so calling headers() here forced the entire site into per-request
// rendering (every route showed as ƒ Dynamic in `next build`), which is what
// pushed the Worker over the free plan's 10 ms CPU limit 1,000+ times/day.
// NotFoundDiagnosticsBeacon (client side: URL, referrer, navigation timing)
// still reports every real 404 occurrence.
export default function NotFound() {
  return (
    <div style={{ minHeight: "60vh", display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center", padding: "40px 24px", textAlign: "center" }}>
      <NotFoundDiagnosticsBeacon />
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
