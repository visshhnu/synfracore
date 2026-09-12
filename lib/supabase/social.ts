import type { SupabaseClient } from "@supabase/supabase-js";

// Query/mutation functions for docs/social-integrations-schema.sql. Both
// tables have standard Clerk-JWT RLS ("user manages own rows") — these
// functions take the caller's normal authenticated client
// (lib/supabase/server.ts's createSupabaseServerClient()), never the
// service-role client, since ownership is enforced by RLS itself here, not
// application code (unlike the question-bank's service-role functions).

export type SocialConnection = {
  id: string;
  platform: "telegram";
  external_id: string;
  display_name: string | null;
  connected_at: string;
  status: "active" | "revoked";
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
