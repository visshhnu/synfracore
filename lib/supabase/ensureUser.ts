import { currentUser } from "@clerk/nextjs/server";
import { createSupabaseServerClient } from "./server";
import type { Profile } from "./queries";

type ClerkUser = Awaited<ReturnType<typeof currentUser>>;

// The guaranteed, always-on user sync — needs zero extra configuration
// (unlike app/api/webhooks/clerk/route.ts, which needs a service-role key +
// a Clerk dashboard webhook to be set up first). Call this from the
// dashboard's server component on every load: it's a cheap idempotent
// upsert, so calling it repeatedly is safe and correct, not wasteful.
// Relies on the "user inserts/updates own record" RLS policies
// (docs/rls-policies.sql) — writes with the caller's own JWT, never a
// service-role key.
//
// Accepts an optional pre-fetched Clerk user so callers that already need
// currentUser() for their own purposes (e.g. the dashboard, which also
// reads clerkUser.imageUrl/fullName) don't make a second, redundant call to
// Clerk's backend API — Clerk's dev/test keys have strict rate limits, and
// two currentUser() calls per page load makes hitting that limit twice as
// likely. Falls back to fetching it itself if not passed.
export async function ensureUserRecord(preloadedUser?: ClerkUser): Promise<Profile | null> {
  // Everything below — the currentUser() fetch (a real network call to
  // Clerk, can fail/throw on rate limits or backend issues), client
  // construction (accessToken callback calls Clerk's auth().getToken(),
  // which can itself throw), and the actual Supabase network call — was
  // previously unguarded, unlike every read function in queries.ts. A throw
  // here happens before any page content renders, producing Next's generic
  // "Application error: a server-side exception has occurred" for the
  // whole /dashboard page. Wrap all of it.
  try {
    const user = preloadedUser !== undefined ? preloadedUser : await currentUser();
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
  } catch (err) {
    console.error("ensureUserRecord threw (not just a query error — check Clerk/Supabase client construction):", err);
    return null;
  }
}
