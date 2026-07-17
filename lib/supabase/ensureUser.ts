import { currentUser, clerkClient } from "@clerk/nextjs/server";
import { createSupabaseServerClient } from "./server";
import { createServiceRoleClient } from "./serviceRole";
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
    const email = user.primaryEmailAddress?.emailAddress ?? "";
    const { data, error } = await supabase
      .from("users")
      .upsert(
        {
          id: user.id,
          email,
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
      // Postgres 23505 on users_email_key means a row for this email
      // already exists under a DIFFERENT id — almost always a Clerk
      // test-mode -> live-mode migration (dev/test and live keys are
      // separate user pools, so a fresh live sign-in gets a brand-new Clerk
      // id that collides with the old test-mode row's still-unique email).
      // Self-heal by re-pointing the existing row — and everything that
      // references it — to the new id, via a service-role-only RPC. This
      // can't be done under the caller's own JWT/RLS, since by definition
      // the row isn't "owned" by the new id yet. See
      // docs/audit/06-roadmap.md for the incident this was built from
      // (found and fixed manually for one account via raw SQL, then
      // generalized here so it never needs a manual fix again) and
      // docs/relink-user-id-fix.sql for the one-time schema migration this
      // depends on.
      if (error.code === "23505" && email) {
        const relinked = await tryRelinkByEmail(email, user.id);
        if (relinked) return relinked;
      }
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

async function tryRelinkByEmail(email: string, newId: string): Promise<EnsureUserResult | null> {
  try {
    const serviceClient = createServiceRoleClient();
    const { data: existing, error: lookupError } = await serviceClient
      .from("users")
      .select("id")
      .eq("email", email)
      .neq("id", newId)
      .maybeSingle();
    if (lookupError || !existing) return null;

    const { error: relinkError } = await serviceClient.rpc("relink_user_id", {
      old_id: existing.id,
      new_id: newId,
    });
    if (relinkError) {
      console.error("relink_user_id RPC failed:", relinkError);
      return null;
    }

    const { data: profile, error: refetchError } = await serviceClient
      .from("users")
      .select()
      .eq("id", newId)
      .single();
    if (refetchError || !profile) return null;
    return { profile: profile as Profile, errorMessage: null };
  } catch (err) {
    console.error("tryRelinkByEmail threw:", err);
    return null;
  }
}

// Question-bank's Route Handlers (start/save-answer/submit) already resolve
// userId via getAuthSafely() — never currentUser()/auth() directly — because
// this adapter's AsyncLocalStorage context reliably fails to reach Route
// Handlers/Server Actions (see lib/clerk/authFallback.ts). ensureUserRecord()
// above calls currentUser() internally, so it can't safely be reused here —
// it would silently no-op if that same broken context applies. This fetches
// the Clerk user directly BY ID via clerkClient().users.getUser(), which
// hits Clerk's backend API directly and doesn't depend on request-scoped
// context propagation at all, then guarantees a users row exists for that
// id — inserting a fresh one, or self-healing via relink_user_id if this is
// an existing Clerk-test-mode account signing in fresh for the first time
// under live keys (same 23505-on-email signature as ensureUserRecord()'s own
// self-heal path). Entirely via the service-role client — no dependency on
// the caller's own session/JWT being usable for a users-table write.
//
// Deliberately fire-and-forget-safe: any failure here is logged and
// swallowed, never thrown — the caller already has a valid userId from
// getAuthSafely() and should proceed with its own attempt/answer logic
// regardless; if the users row still doesn't exist afterward, that write
// will fail on its own foreign key with a clear error, not a silent hang.
export async function ensureUserRowExists(userId: string): Promise<void> {
  try {
    const serviceClient = createServiceRoleClient();

    const { data: existingById } = await serviceClient.from("users").select("id").eq("id", userId).maybeSingle();
    if (existingById) return;

    const client = await clerkClient();
    const clerkUser = await client.users.getUser(userId);
    const email = clerkUser.primaryEmailAddress?.emailAddress ?? clerkUser.emailAddresses[0]?.emailAddress ?? "";
    if (!email) return;

    const { error: insertError } = await serviceClient.from("users").insert({
      id: userId,
      email,
      full_name: `${clerkUser.firstName ?? ""} ${clerkUser.lastName ?? ""}`.trim() || clerkUser.username || "Learner",
      avatar_url: clerkUser.imageUrl,
      last_active_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    });
    if (!insertError) return;

    if (insertError.code === "23505") {
      const { data: existingByEmail } = await serviceClient
        .from("users")
        .select("id")
        .eq("email", email)
        .neq("id", userId)
        .maybeSingle();
      if (existingByEmail) {
        const { error: relinkError } = await serviceClient.rpc("relink_user_id", {
          old_id: existingByEmail.id,
          new_id: userId,
        });
        if (relinkError) console.error("ensureUserRowExists: relink_user_id RPC failed:", relinkError);
        return;
      }
    }
    console.error("ensureUserRowExists: insert failed:", insertError);
  } catch (err) {
    console.error("ensureUserRowExists threw:", err);
  }
}
