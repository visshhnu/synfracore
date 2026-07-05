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
export type EnsureUserResult = { profile: Profile | null; errorMessage: string | null };

// Returns the raw error message alongside the profile — NOT just logged
// server-side — specifically so it can be surfaced directly on the
// dashboard page. console.error() alone goes to Cloudflare's function logs,
// which aren't visible from a browser and weren't being checked; we've been
// guessing at root causes for several rounds now without this. Showing the
// literal Postgres/Supabase error on-screen ends the guessing immediately.
export async function ensureUserRecord(preloadedUser?: ClerkUser): Promise<EnsureUserResult> {
  try {
    const user = preloadedUser !== undefined ? preloadedUser : await currentUser();
    if (!user) return { profile: null, errorMessage: null };

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
      console.error("ensureUserRecord failed:", error);
      return { profile: null, errorMessage: `[${error.code ?? "?"}] ${error.message}${error.hint ? ` — hint: ${error.hint}` : ""}` };
    }
    return { profile: data as Profile, errorMessage: null };
  } catch (err) {
    console.error("ensureUserRecord threw:", err);
    const message = err instanceof Error ? err.message : String(err);
    return { profile: null, errorMessage: `Threw (not a query error): ${message}` };
  }
}
