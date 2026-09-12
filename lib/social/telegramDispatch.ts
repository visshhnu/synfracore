import type { SupabaseClient } from "@supabase/supabase-js";

// Service-role dispatch logic for scheduled_posts (docs/social-integrations-schema.sql).
// Called from custom-worker.ts's scheduled() handler — a Cron Trigger has no
// end-user session, same reasoning as the Clerk webhook and question-bank
// grading (see lib/supabase/serviceRole.ts), so the caller MUST pass a
// createServiceRoleClient() instance. This function does no ownership
// checking of its own beyond the query itself, because there is no per-user
// context here to check against — a cron dispatch job processes every due
// row for every user by design.

type DueScheduledPost = {
  id: string;
  content: string;
  social_connections: { external_id: string } | null;
};

const TELEGRAM_API_BASE = "https://api.telegram.org";
// Real cap on rows processed per invocation — not a correctness requirement
// (the query itself is already narrowed to due rows), but a deliberate bound
// on how much work one 2-minute-interval Cron Trigger invocation takes on,
// so a sudden backlog can't turn one invocation into an unbounded loop of
// outbound Telegram calls. Any rows beyond this batch are simply picked up
// by the next invocation, 2 minutes later.
const DISPATCH_BATCH_SIZE = 20;

export async function dispatchDueTelegramPosts(
  supabase: SupabaseClient,
  botToken: string
): Promise<{ processed: number; sent: number; failed: number }> {
  const { data: due, error: queryError } = await supabase
    .from("scheduled_posts")
    .select("id, content, social_connections(external_id)")
    .eq("status", "pending")
    .lte("scheduled_at", new Date().toISOString())
    .limit(DISPATCH_BATCH_SIZE)
    .returns<DueScheduledPost[]>();

  if (queryError) {
    console.error("dispatchDueTelegramPosts: query failed:", queryError);
    return { processed: 0, sent: 0, failed: 0 };
  }
  if (!due || due.length === 0) {
    return { processed: 0, sent: 0, failed: 0 };
  }

  let sent = 0;
  let failed = 0;

  for (const post of due) {
    const chatId = post.social_connections?.external_id;
    if (!chatId) {
      // Connection was deleted/revoked out from under a still-pending post —
      // fail it explicitly rather than leaving it stuck 'pending' forever,
      // silently retried every 2 minutes with no way to ever succeed.
      await supabase
        .from("scheduled_posts")
        .update({ status: "failed", error: "Connection no longer exists" })
        .eq("id", post.id);
      failed++;
      continue;
    }

    try {
      const res = await fetch(`${TELEGRAM_API_BASE}/bot${botToken}/sendMessage`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ chat_id: chatId, text: post.content }),
      });
      const body = (await res.json()) as { ok: boolean; description?: string };

      if (res.ok && body.ok) {
        await supabase
          .from("scheduled_posts")
          .update({ status: "sent", sent_at: new Date().toISOString() })
          .eq("id", post.id);
        sent++;
      } else {
        await supabase
          .from("scheduled_posts")
          .update({ status: "failed", error: body.description ?? `Telegram API error (HTTP ${res.status})` })
          .eq("id", post.id);
        failed++;
      }
    } catch (err) {
      await supabase
        .from("scheduled_posts")
        .update({ status: "failed", error: err instanceof Error ? err.message : "Unknown dispatch error" })
        .eq("id", post.id);
      failed++;
    }
  }

  return { processed: due.length, sent, failed };
}
