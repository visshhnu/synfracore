import { callTelegramApi } from "./telegram";

export type TelegramVerifyResult =
  | { ok: true; chatId: string; title: string }
  | { ok: false; error: string };

// Ownership proof for the connect flow: only someone who actually controls
// a Telegram channel/group can have added our bot to it as an admin, so
// confirming admin status IS confirming ownership — no OAuth needed (see
// docs/social-integrations-schema.sql's own header comment for the full
// reasoning). getMe() finds the bot's own numeric id (needed for
// getChatMember, which takes a user_id, not the bot's own token) — the
// chat_id the caller supplies is never trusted to already be an admin
// relationship, it's independently verified here every time.
export async function verifyTelegramChannelAdmin(
  botToken: string,
  chatIdentifier: string
): Promise<TelegramVerifyResult> {
  const me = await callTelegramApi<{ id: number }>(botToken, "getMe", {});
  if (!me.ok) {
    return { ok: false, error: "Telegram bot isn't configured correctly — contact support." };
  }

  const chat = await callTelegramApi<{ id: number; title?: string; username?: string }>(
    botToken,
    "getChat",
    { chat_id: chatIdentifier }
  );
  if (!chat.ok) {
    return {
      ok: false,
      error: chat.description ?? "Couldn't find that channel/group — make sure the bot has been added to it first.",
    };
  }

  const member = await callTelegramApi<{ status: string }>(botToken, "getChatMember", {
    chat_id: chat.id,
    user_id: me.id,
  });
  if (!member.ok) {
    return { ok: false, error: "Couldn't verify the bot's role in that chat — try again." };
  }
  if (member.status !== "administrator" && member.status !== "creator") {
    return { ok: false, error: "The bot needs to be an admin of that channel/group, not just a member." };
  }

  return { ok: true, chatId: String(chat.id), title: chat.title ?? chat.username ?? chatIdentifier };
}
