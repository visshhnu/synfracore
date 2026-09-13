import type { SupabaseClient } from "@supabase/supabase-js";

// Query/mutation functions for docs/social-integrations-schema.sql. Both
// tables are admin-only RLS (is_admin() — see the schema file's own
// SECURITY MODEL note, revised 2026-09-12) — these functions take the
// caller's normal authenticated client (lib/supabase/server.ts's
// createSupabaseServerClient()), never the service-role client, since
// is_admin() enforcement happens in RLS itself here, not application code
// (unlike the question-bank's service-role functions).

export type SocialConnection = {
  id: string;
  platform: "telegram" | "instagram";
  external_id: string;
  display_name: string | null;
  connected_at: string;
  status: "active" | "revoked";
  // access_token/token_expires_at (Instagram only) are deliberately never
  // selected here — this type/query feeds the UI's connection list, which
  // has no reason to ever see a live OAuth credential. The dispatch job
  // (lib/social/instagram.ts's eventual consumer) reads those columns
  // itself, directly, when it actually needs them.
};

export type ScheduledPost = {
  id: string;
  connection_id: string;
  content: string;
  scheduled_at: string;
  status: "pending" | "sent" | "failed";
  sent_at: string | null;
  error: string | null;
  created_at: string;
};

export async function getUserConnections(supabase: SupabaseClient): Promise<SocialConnection[]> {
  const { data, error } = await supabase
    .from("social_connections")
    .select("id, platform, external_id, display_name, connected_at, status")
    .eq("status", "active")
    .order("connected_at", { ascending: false });
  if (error) {
    console.error("getUserConnections failed:", error);
    return [];
  }
  return data ?? [];
}

export async function getUserScheduledPosts(supabase: SupabaseClient): Promise<ScheduledPost[]> {
  const { data, error } = await supabase
    .from("scheduled_posts")
    .select("id, connection_id, content, scheduled_at, status, sent_at, error, created_at")
    .order("scheduled_at", { ascending: false })
    .limit(50);
  if (error) {
    console.error("getUserScheduledPosts failed:", error);
    return [];
  }
  return data ?? [];
}
