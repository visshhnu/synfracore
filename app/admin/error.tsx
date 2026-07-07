"use client";
import { useEffect } from "react";
import Link from "next/link";
import * as Sentry from "@sentry/nextjs";

export default function AdminError({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error("Admin page error boundary caught:", error);
    Sentry.captureException(error);
  }, [error]);

  return (
    <div style={{ maxWidth: "560px", margin: "80px auto", padding: "0 24px", textAlign: "center" }}>
      <div style={{ fontSize: "40px", marginBottom: "16px" }}>⚠️</div>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "22px", fontWeight: 800, marginBottom: "10px" }}>
        Admin view hit a snag
      </h1>
      <p style={{ color: "var(--text-3)", fontSize: "14px", lineHeight: 1.6, marginBottom: "24px" }}>
        Usually a temporary database or sign-in hiccup. Learner-facing pages are unaffected.
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
        <Link href="/dashboard" style={{ padding: "10px 24px", borderRadius: "8px", fontSize: "14px", fontWeight: 600, background: "var(--bg-2)", border: "1px solid var(--border)", color: "var(--text-2)", textDecoration: "none" }}>
          Back to dashboard
        </Link>
      </div>
    </div>
  );
}
