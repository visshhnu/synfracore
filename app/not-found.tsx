export const runtime = "edge";
import Link from "next/link";

export default function NotFound() {
  return (
    <div style={{ minHeight: "70vh", display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center", textAlign: "center", padding: "40px 24px", background: "#04080F" }}>
      <div style={{ fontFamily: "'Syne', sans-serif", fontSize: "96px", fontWeight: 800, background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text", lineHeight: 1, marginBottom: "16px" }}>
        404
      </div>
      <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "28px", fontWeight: 700, marginBottom: "12px", color: "#E2E8F4" }}>Page not found</h1>
      <p style={{ color: "#64748B", fontSize: "16px", maxWidth: "400px", marginBottom: "32px" }}>
        This page doesn&apos;t exist yet. Try browsing our academies.
      </p>
      <div style={{ display: "flex", gap: "12px", flexWrap: "wrap", justifyContent: "center" }}>
        <Link href="/" style={{ background: "linear-gradient(135deg, #2563EB, #7C3AED)", color: "#fff", padding: "11px 24px", borderRadius: "10px", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
          Go Home
        </Link>
        <Link href="/academies" style={{ background: "#0D1526", border: "1px solid #162035", color: "#E2E8F4", padding: "11px 24px", borderRadius: "10px", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
          Browse Academies
        </Link>
      </div>
    </div>
  );
}
