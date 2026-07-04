import { currentUser } from "@clerk/nextjs/server";
import { createSupabaseServerClient } from "./server";

// Upserts the signed-in Clerk user into the `users` table. Relies on the
// "user inserts/updates own record" RLS policies (docs/rls-policies.sql) —
// it writes with the caller's own JWT, never a service-role key.
// Call this once per session from a server component on a protected route
// (e.g. a dashboard layout) — not from public marketing pages.
export async function ensureUserRecord() {
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
      },
      { onConflict: "id" }
    )
    .select()
    .single();

  if (error) throw error;
  return data;
}
