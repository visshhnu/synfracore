import { ClerkProvider } from "@clerk/nextjs";
import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";
import { RootShell } from "@/components/layout/RootShell";

// Shared Navbar/Footer/ClerkProvider wiring for every root layout (Phase
// 3.7). Confirmed via a real build (2026-07-08) that regular <ClerkProvider>
// (no `dynamic` prop) does NOT force dynamic rendering by itself — Clerk's
// own docs are explicit about this, and the app/(app) vs app/(marketing)
// split's actual static/dynamic difference comes entirely from
// app/(app)/layout.tsx's own `export const runtime = "edge"`, not from
// Navbar or ClerkProvider. So both root layouts can safely share the exact
// same Navbar/Footer/ClerkProvider wiring — no static-safe Navbar variant
// needed.
export function AppChrome({ children }: { children: React.ReactNode }) {
  return (
    <ClerkProvider>
      <RootShell>
        <Navbar />
        <main style={{ flex: 1, paddingTop: "64px" }}>{children}</main>
        <Footer />
      </RootShell>
    </ClerkProvider>
  );
}
