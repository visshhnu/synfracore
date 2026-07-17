import Link from "next/link";
import { headers } from "next/headers";
import NotFoundDiagnosticsBeacon from "@/components/NotFoundDiagnosticsBeacon";

// Server-side half of the diagnostic instrumentation for the still-
// unresolved, unreproducible client-side hydrate-then-404 bug found during
// the D1 (OpenNext) migration's Step 3 verification
// (docs/audit/07-roadmap-final.md) — a page that server-renders correctly
// can still have Next's client router swap to this component after a
// subsequent Flight/RSC request 404s, for reasons not yet identified despite
// 74+ targeted reproduction attempts. Since it can't be reproduced on
// demand, this logs every time the bug's outward symptom actually happens
// anywhere in the app — and critically, not-found.tsx is itself rendered
// server-side as part of resolving THE EXACT REQUEST that 404d, so
// headers() here reflects that real failing request, not a reconstruction
// after the fact. Pairs with NotFoundDiagnosticsBeacon (client-side: URL,
// referrer, navigation timing) for the full picture asked for in the
// investigation write-up. console.error so it's visible via `wrangler tail`
// today and flows into Sentry once D3 (Sentry re-activation) lands.
export default async function NotFound() {
  try {
    const hdrs = await headers();
    const cfRay = hdrs.get("cf-ray");
    console.error("[not-found]", JSON.stringify({
      // Correlation fields — match these against [not-found-beacon]'s same
      // three fields (cfRay exactly; pathname/timestamp approximately, since
      // they're captured a few ms apart on server vs. client) to join the
      // two halves of a single occurrence.
      cfRay,
      // Next.js doesn't hand not-found.tsx the requested pathname directly
      // (no params, no matched route). next-url is the closest proxy
      // available from headers() but is really "the pathname a client-side
      // RSC navigation was targeting," which usually IS the 404'd path but
      // isn't guaranteed to be. Treat as best-effort; the beacon's `url`
      // field (components/NotFoundDiagnosticsBeacon.tsx) is the source of
      // truth for the actual pathname, derived from window.location.
      pathnameGuess: hdrs.get("next-url"),
      timestamp: new Date().toISOString(), // ISO 8601 is already ms-precision
      accept: hdrs.get("accept"),
      rsc: hdrs.get("rsc"),
      nextRouterStateTreeLength: hdrs.get("next-router-state-tree")?.length ?? null,
      nextRouterPrefetch: hdrs.get("next-router-prefetch"),
      purpose: hdrs.get("purpose"),
      priority: hdrs.get("priority"),
      // The colo (edge datacenter) is usually embedded as the suffix of
      // cf-ray (e.g. "7a1b2c3d4e5f6789-SIN") -- but confirmed live
      // 2026-07-17 that this preview environment's cf-ray sometimes has no
      // "-SUFFIX" at all (e.g. "a1c93b5cae3fce31"), so only extract it when
      // a hyphen is actually present rather than silently duplicating the
      // full ray ID into this field.
      colo: cfRay && cfRay.includes("-") ? cfRay.split("-").pop() ?? null : null,
      userAgent: hdrs.get("user-agent"),
    }));
  } catch (err) {
    console.error("[not-found] header logging failed:", err);
  }

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
