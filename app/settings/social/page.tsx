import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getUserConnections, getUserScheduledPosts } from "@/lib/supabase/social";
import { SocialSettingsClient } from "@/components/settings/SocialSettingsClient";

export const metadata = { title: "Social Integrations" };

export default async function SocialSettingsPage() {
  // Page-level safety net, same pattern as app/dashboard/page.tsx — a
  // client-construction failure or query error must degrade to an empty
  // state, not crash the whole page. getUserConnections/getUserScheduledPosts
  // already catch their own errors and return [].
  let connections: Awaited<ReturnType<typeof getUserConnections>> = [];
  let scheduledPosts: Awaited<ReturnType<typeof getUserScheduledPosts>> = [];
  try {
    const supabase = createSupabaseServerClient();
    [connections, scheduledPosts] = await Promise.all([
      getUserConnections(supabase),
      getUserScheduledPosts(supabase),
    ]);
  } catch (err) {
    console.error("SocialSettingsPage: failed to load data:", err);
  }

  return (
    <div style={{ maxWidth: "720px", margin: "0 auto", padding: "40px 24px 64px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "24px", fontWeight: 800, marginBottom: "6px" }}>
        Social Integrations
      </h1>
      <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "28px" }}>
        Connect Telegram and schedule posts — more platforms coming later.
      </p>
      <SocialSettingsClient initialConnections={connections} initialScheduledPosts={scheduledPosts} />
    </div>
  );
}
