// Shared low-level Telegram Bot API helper — used by both the connect-flow
// verification (lib/social/telegramConnect.ts) and the scheduled dispatch
// job (lib/social/telegramDispatch.ts), so the fetch/error-shape handling
// exists in exactly one place.

export const TELEGRAM_API_BASE = "https://api.telegram.org";

export type TelegramResult<T> = ({ ok: true } & T) | { ok: false; description?: string };

export async function callTelegramApi<T extends Record<string, unknown>>(
  botToken: string,
  method: string,
  body: Record<string, unknown>
): Promise<TelegramResult<T>> {
  const res = await fetch(`${TELEGRAM_API_BASE}/bot${botToken}/${method}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  const data = (await res.json()) as { ok: boolean; result?: T; description?: string };
  if (!res.ok || !data.ok || data.result === undefined) {
    return { ok: false, description: data.description };
  }
  return { ok: true, ...data.result };
}
