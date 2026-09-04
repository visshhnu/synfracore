"use client";
import { useEffect } from "react";
import Link from "next/link";
import { logClientError } from "@/lib/errorLog";

// Next.js's route-segment error boundary — catches ANY unhandled exception
// thrown while rendering /dashboard (and anything nested under it), no
// matter the cause, including ones not yet discovered. Without this file,
// Next falls back to its generic "Application error: a server-side
// exception has occurred" page. This is the permanent structural fix layered
// on top of the specific bugs already patched (avatar image domain,
// ensureUserRecord, accessToken callback, duplicate currentUser() calls) —
// those fixes stop the known causes; this stops the *next* one from ever
// being visible as a raw crash again.
export default function DashboardError({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error("Dashboard error boundary caught:", error);
    logClientError({ message: error.message, stack: error.stack, source: "client-boundary", digest: error.digest });
  }, [error]);

  return (
    <div style={{ maxWidth: "560px", margin: "80px auto", padding: "0 24px", textAlign: "center" }}>
      <div style={{ fontSize: "40px", marginBottom: "16px" }}>⚠️</div>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "22px", fontWeight: 800, marginBottom: "10px" }}>
        Your dashboard hit a snag
      </h1>
      <p style={{ color: "var(--text-3)", fontSize: "14px", lineHeight: 1.6, marginBottom: "24px" }}>
        This is usually temporary — a database or sign-in hiccup, not something wrong with your account. Try again, and if it keeps happening, the rest of the site is unaffected either way.
      </p>
      {error.digest && (
        <p style={{ color: "var(--text-4)", fontSize: "11px", marginBottom: "24px", fontFamily: "monospace" }}>
          Error reference: {error.digest}
        </p>
      )}
      <div style={{ display: "flex", gap: "12px", justifyContent: "center" }}>
        <button onClick={() => reset()} className="btn-primary" style={{ padding: "10px 24px", borderRadius: "8px", fontSize: "14px", fontWeight: 700, border: "none", cursor: "pointer" }}>
          Try again
        </button>
        <Link href="/academies" style={{ padding: "10px 24px", borderRadius: "8px", fontSize: "14px", fontWeight: 600, background: "var(--bg-2)", border: "1px solid var(--border)", color: "var(--text-2)", textDecoration: "none" }}>
          Browse academies
        </Link>
      </div>
    </div>
  );
}
