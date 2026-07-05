import { currentUser } from "@clerk/nextjs/server";
import { createSupabaseServerClient } from "./server";
import type { Profile } from "./queries";

// The guaranteed, always-on user sync — needs zero extra configuration
// (unlike app/api/webhooks/clerk/route.ts, which needs a service-role key +
// a Clerk dashboard webhook to be set up first). Call this from the
// dashboard's server component on every load: it's a cheap idempotent
// upsert, so calling it repeatedly is safe and correct, not wasteful.
// Relies on the "user inserts/updates own record" RLS policies
// (docs/rls-policies.sql) — writes with the caller's own JWT, never a
// service-role key.
export async function ensureUserRecord(): Promise<Profile | null> {
  const user = await currentUser();
  if (!user) return null;

  const supabase = createSupabaseServerClient();
  const { data, error } = await supabase
    .from("users")
    .upsert(
      {
        id: user.id,
        email: user.primaryEmailAddress?.emailAddress ?? "",
        full_name: `${user.firstName ?? ""} ${user.lastName ?? ""}`.trim() || user.username || "Learner",
        avatar_url: user.imageUrl,
        last_active_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      },
      { onConflict: "id" }
    )
    .select()
    .single();

  if (error) {
    console.error("ensureUserRecord failed (has docs/learner-platform-schema.sql been run against Supabase yet?):", error);
    return null;
  }
  return data as Profile;
}
