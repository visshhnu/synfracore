import Link from "next/link";

export default function NotFound() {
  return (
    <div style={{ minHeight: "70vh", display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center", textAlign: "center", padding: "40px 24px" }}>
      <div style={{ fontFamily: "'Syne', sans-serif", fontSize: "96px", fontWeight: 800, background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", backgroundClip: "text", lineHeight: 1, marginBottom: "16px" }}>
        404
      </div>
      <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "28px", fontWeight: 700, marginBottom: "12px" }}>Page not found</h1>
      <p style={{ color: "#6B7A99", fontSize: "16px", maxWidth: "400px", marginBottom: "32px" }}>
        This page doesn&apos;t exist yet, or it may have moved. Try browsing our academies.
      </p>
      <div style={{ display: "flex", gap: "12px", flexWrap: "wrap", justifyContent: "center" }}>
        <Link href="/" style={{ background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "11px 24px", borderRadius: "10px", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
          Go Home
        </Link>
        <Link href="/academies" style={{ background: "#0F1A2E", border: "1px solid #1E2D47", color: "#E8EDF5", padding: "11px 24px", borderRadius: "10px", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
          Browse Academies
        </Link>
      </div>
    </div>
  );
}
