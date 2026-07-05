export const runtime = "edge";

import { ensureUserRecord } from "@/lib/supabase/ensureUser";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getDomainPreferences } from "@/lib/supabase/queries";
import { auth } from "@clerk/nextjs/server";
import OnboardingForm from "./OnboardingForm";

export const metadata = { title: "Get started | SynfraCore" };

type Props = { searchParams: Promise<{ error?: string }> };

export default async function OnboardingPage({ searchParams }: Props) {
  const { profile } = await ensureUserRecord();
  const { userId } = await auth();
  const { error } = await searchParams;

  let existingDomains: string[] = [];
  if (userId) {
    const supabase = createSupabaseServerClient();
    existingDomains = await getDomainPreferences(supabase, userId);
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
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px" }}>
        <OnboardingForm existingDomains={existingDomains} />
      </div>
    </div>
  );
}
