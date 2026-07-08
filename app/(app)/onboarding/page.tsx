export const runtime = "edge";

import { ensureUserRecord } from "@/lib/supabase/ensureUser";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getDomainPreferences } from "@/lib/supabase/queries";
import { auth } from "@clerk/nextjs/server";
import OnboardingForm from "./OnboardingForm";

export const metadata = { title: "Get started | SynfraCore" };

type Props = { searchParams: Promise<{ error?: string }> };

export default async function OnboardingPage({ searchParams }: Props) {
  // auth() itself was called unguarded here before — same class of bug as
  // dashboard/page.tsx's old currentUser() call. Wrap it rather than assume
  // it can't fail.
  let userId: string | null = null;
  try {
    userId = (await auth()).userId;
  } catch (err) {
    console.error("auth() failed in onboarding:", err);
  }

  const { profile, errorMessage: syncError } = await ensureUserRecord();
  const { error } = await searchParams;

  // Same fix as dashboard/page.tsx: createSupabaseServerClient() + the query
  // were previously called directly, unguarded — if client construction
  // threw, nothing here caught it, crashing the whole page instead of
  // falling back to "no existing preferences yet".
  let existingDomains: string[] = [];
  if (userId) {
    try {
      const supabase = createSupabaseServerClient();
      existingDomains = await getDomainPreferences(supabase, userId);
    } catch (err) {
      console.error("Failed to load existing domain preferences — continuing with an empty list:", err);
    }
  }

  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "48px 24px" }}>
      <div style={{ marginBottom: "32px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, marginBottom: "8px" }}>
          {profile?.full_name ? `Welcome, ${profile.full_name.split(" ")[0]}` : "Welcome"} — let's personalize your dashboard
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "14px", lineHeight: 1.6 }}>
          This takes under a minute and only affects your recommendations — nothing here restricts what you can access. You can change any of this later from your dashboard.
        </p>
      </div>
      {error && (
        <div style={{ background: "rgba(239,68,68,0.08)", border: "1px solid rgba(239,68,68,0.25)", borderRadius: "12px", padding: "14px 18px", marginBottom: "20px", fontSize: "13px", color: "#F87171" }}>
          Couldn't save that — please try again. If it keeps happening, the database may not be fully set up yet.
        </div>
      )}
      {/* Full error text is logged server-side by ensureUserRecord() (visible
          in Cloudflare's Functions logs) — never rendered here. Rendering
          the raw Clerk/Postgres error was a temporary diagnostic measure;
          it exposed internal auth/integration details to end users. */}
      {syncError && (
        <div style={{ background: "rgba(239,68,68,0.08)", border: "1px solid rgba(239,68,68,0.3)", borderRadius: "12px", padding: "14px 18px", marginBottom: "20px" }}>
          <div style={{ fontWeight: 700, fontSize: "13px", color: "#F87171" }}>⚠️ We couldn't sync your profile just now</div>
          <div style={{ fontSize: "12px", color: "var(--text-3)", marginTop: "4px" }}>Your account is signed in — this only affects a few personalised fields. Try refreshing in a moment.</div>
        </div>
      )}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px" }}>
        <OnboardingForm existingDomains={existingDomains} />
      </div>
    </div>
  );
}
