import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getAllSchemes } from "@/lib/supabase/governmentSchemes";
import SchemeNavigator from "@/components/schemes/SchemeNavigator";
import { pageMetadata } from "@/lib/seo/metadata";

// Standalone top-level route, deliberately not nested under /academies —
// this is a reference tool, not curriculum content, even though it backs
// the Entrepreneurship & Business Ventures academy's financing sections.
// Server-fetches the full (small, ~15-row) dataset once and hands it to
// the client component for in-browser filtering — see
// components/schemes/SchemeNavigator.tsx for why that's the right split
// at this data size.
export const metadata = pageMetadata({
  title: "Government Scheme Navigator",
  description: "A real, dated, individually-verified directory of current Indian government financing and subsidy schemes for EV, food processing, and renewable energy businesses — not a live feed, every entry links to its official source.",
  path: "/schemes",
  keywords: ["government schemes", "startup india", "PM E-DRIVE", "PMFME", "PM-KUSUM", "SIDBI", "NABARD", "business financing India"],
});

export default async function SchemesPage() {
  const supabase = createSupabaseServerClient();
  const schemes = await getAllSchemes(supabase);

  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "40px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <span style={{ color: "var(--text-2)" }}>Government Scheme Navigator</span>
      </nav>

      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, marginBottom: "10px", color: "var(--text-1)" }}>
        Government Scheme Navigator
      </h1>
      <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "680px", lineHeight: 1.7, marginBottom: "12px" }}>
        Real, current Indian government financing and subsidy schemes for EV, food processing, and renewable energy businesses — backing the <Link href="/academies/entrepreneurship" style={{ color: "#3B82F6", textDecoration: "none" }}>Entrepreneurship &amp; Business Ventures</Link> academy.
      </p>
      <p style={{ color: "var(--text-4)", fontSize: "13px", maxWidth: "680px", lineHeight: 1.7, marginBottom: "32px" }}>
        This is <strong>not</strong> a live integration with any government system — most of these schemes have no stable API, and source sites redesign without notice. Every entry below is a manually verified, dated snapshot with a direct link to its real official source. Schemes change fast — several entries here were found mid-transition during this Navigator&apos;s own research.
      </p>

      {schemes.length === 0 ? (
        <p style={{ color: "var(--text-4)", fontSize: "13px" }}>No schemes available yet — check back soon.</p>
      ) : (
        <SchemeNavigator schemes={schemes} />
      )}
    </div>
  );
}
