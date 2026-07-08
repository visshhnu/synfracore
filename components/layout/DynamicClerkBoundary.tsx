import { ClerkProvider } from "@clerk/nextjs";
import { Suspense } from "react";

// Wraps a specific route's children in a nested, explicitly-dynamic
// ClerkProvider — Clerk's own documented fix for mixing static and dynamic
// pages under one shared root ClerkProvider (see
// https://clerk.com/docs/guides/development/rendering-modes). The root
// layout's ClerkProvider (no `dynamic` prop) is what lets the 20 static
// pages from Phase 3.9 stay static; this nested one gives auth-critical
// routes their own fresh, per-request auth resolution instead of inheriting
// whatever build-time snapshot got baked into a static page's shared layout.
// Used by dashboard/admin/onboarding/sign-in/sign-up — the routes that
// showed stale-auth symptoms (flash-then-redirect, sign-in needing a
// manual refresh) after Phase 3.9 first shipped.
export function DynamicClerkBoundary({ children }: { children: React.ReactNode }) {
  return (
    <Suspense fallback={<div style={{ minHeight: "60vh" }} />}>
      <ClerkProvider dynamic>{children}</ClerkProvider>
    </Suspense>
  );
}
