"use client";
import { useEffect } from "react";

// The last line of defense — catches exceptions in the ROOT layout itself
// (ClerkProvider, etc.), which route-level error.tsx files (dashboard,
// admin, onboarding) can't do since they render *inside* that layout. Must
// render its own <html>/<body> since it fully replaces the root layout when
// active. This should be rare in practice — the route-level boundaries
// handle the common cases — but without this, a root-layout failure would
// still show Next's raw unstyled crash page site-wide.
export default function GlobalError({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error("Global error boundary caught (root layout failure):", error);
  }, [error]);

  return (
    <html lang="en">
      <body style={{ margin: 0, minHeight: "100vh", display: "flex", alignItems: "center", justifyContent: "center", fontFamily: "system-ui, sans-serif", background: "#0a0f1a", color: "#e5e7eb" }}>
        <div style={{ maxWidth: "480px", padding: "24px", textAlign: "center" }}>
          <div style={{ fontSize: "40px", marginBottom: "16px" }}>⚠️</div>
          <h1 style={{ fontSize: "20px", fontWeight: 800, marginBottom: "10px" }}>Something went wrong</h1>
          <p style={{ color: "#9CA3AF", fontSize: "14px", lineHeight: 1.6, marginBottom: "24px" }}>
            A site-wide issue occurred loading this page. Please try again.
          </p>
          {error.digest && (
            <p style={{ color: "#6B7280", fontSize: "11px", marginBottom: "24px", fontFamily: "monospace" }}>
              Error reference: {error.digest}
            </p>
          )}
          <button onClick={() => reset()} style={{ padding: "10px 24px", borderRadius: "8px", fontSize: "14px", fontWeight: 700, border: "none", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", cursor: "pointer" }}>
            Try again
          </button>
        </div>
      </body>
    </html>
  );
}
