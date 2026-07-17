"use client";

import { useEffect } from "react";

// Client-side half of app/not-found.tsx's diagnostic instrumentation — see
// that file's comment for the full context. Captures what the server-side
// headers() logging can't: the client's own navigation history (referrer,
// hard vs. soft navigation) at the exact moment the bug's symptom occurs.
export default function NotFoundDiagnosticsBeacon() {
  useEffect(() => {
    const nav = performance.getEntriesByType("navigation")[0] as PerformanceNavigationTiming | undefined;
    const payload = {
      url: window.location.href,
      referrer: document.referrer || null,
      navigationType: nav?.type ?? null, // "navigate" | "reload" | "back_forward" | "prerender"
      timestamp: new Date().toISOString(),
    };
    try {
      navigator.sendBeacon(
        "/api/diagnostics/not-found",
        new Blob([JSON.stringify(payload)], { type: "application/json" })
      );
    } catch {
      // Best-effort only — a failed diagnostic beacon must never affect the
      // actual not-found page a real visitor sees.
    }
  }, []);
  return null;
}
