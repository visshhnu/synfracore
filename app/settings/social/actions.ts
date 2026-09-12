"use server";

import { revalidatePath } from "next/cache";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { verifyTelegramChannelAdmin } from "@/lib/social/telegramConnect";

export type ActionResult = { success: true } | { success: false; error: string };

export async function connectTelegram(formData: FormData): Promise<ActionResult> {
  const { userId } = await getAuthSafely();
  if (!userId) return { success: false, error: "Sign in required." };

  const chatIdentifier = String(formData.get("chatIdentifier") ?? "").trim();
  if (!chatIdentifier) return { success: false, error: "Enter a channel username or ID." };

  // Same-shape secret as CLERK_SECRET_KEY — server-only, never in
  // wrangler.jsonc's plain vars. Unset means no bot has been created via
  // BotFather yet; a real, temporary "not ready" state, not a bug.
  const botToken = process.env.TELEGRAM_BOT_TOKEN;
  if (!botToken) return { success: false, error: "Telegram isn't configured yet — check back soon." };

  const verified = await verifyTelegramChannelAdmin(botToken, chatIdentifier);
  if (!verified.ok) return { success: false, error: verified.error };

  try {
    const supabase = createSupabaseServerClient();
    const { error } = await supabase.from("social_connections").insert({
      user_id: userId,
      platform: "telegram",
      external_id: verified.chatId,
      display_name: verified.title,
    });
    if (error) {
      // 23505 = unique_violation on (user_id, platform, external_id) —
      // already connected, not a real failure worth a generic error.
      const message = error.code === "23505" ? "This channel is already connected." : "Failed to save the connection.";
      console.error("connectTelegram: insert failed:", error);
      return { success: false, error: message };
    }
  } catch (err) {
    console.error("connectTelegram: unexpected failure:", err);
    return { success: false, error: "Failed to save the connection." };
  }

  revalidatePath("/settings/social");
  return { success: true };
}

export async function createScheduledPost(formData: FormData): Promise<ActionResult> {
  const { userId } = await getAuthSafely();
  if (!userId) return { success: false, error: "Sign in required." };

  const connectionId = String(formData.get("connectionId") ?? "");
  const content = String(formData.get("content") ?? "").trim();
  const scheduledAtLocal = String(formData.get("scheduledAt") ?? "");

  if (!connectionId) return { success: false, error: "Choose a connection to post to." };
  if (!content) return { success: false, error: "Write something to post." };
  if (!scheduledAtLocal) return { success: false, error: "Pick a date and time." };

  // datetime-local has no timezone — it's the browser's own local time, so
  // `new Date(...)` interprets it in the server's local timezone too, which
  // is wrong whenever server and browser timezones differ. Read the
  // browser's own UTC offset (sent alongside the field) so the conversion is
  // correct regardless of where either side actually runs.
  const offsetMinutes = Number(formData.get("scheduledAtOffsetMinutes") ?? "0");
  const localMs = new Date(scheduledAtLocal).getTime();
  if (Number.isNaN(localMs)) return { success: false, error: "Invalid date/time." };
  const scheduledAt = new Date(localMs + offsetMinutes * 60000);

  if (scheduledAt.getTime() < Date.now()) {
    return { success: false, error: "Pick a time in the future." };
  }

  try {
    const supabase = createSupabaseServerClient();
    const { error } = await supabase.from("scheduled_posts").insert({
      user_id: userId,
      connection_id: connectionId,
      content,
      scheduled_at: scheduledAt.toISOString(),
    });
    if (error) {
      console.error("createScheduledPost: insert failed:", error);
      return { success: false, error: "Failed to schedule the post." };
    }
  } catch (err) {
    console.error("createScheduledPost: unexpected failure:", err);
    return { success: false, error: "Failed to schedule the post." };
  }

  revalidatePath("/settings/social");
  return { success: true };
}
