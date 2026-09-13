import { ensureUserRecord } from "@/lib/supabase/ensureUser";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { exchangeInstagramAuthCode } from "@/lib/social/instagram";

// Must exactly match the redirect_uri registered on the Meta app AND the
// one sent in the authorize request — Meta rejects on any mismatch,
// including a trailing-slash difference. Hardcoded rather than derived from
// the incoming request's Host header (unlike lib/clerk/authFallback.ts's
// URL-building) specifically because of that strict-match requirement: a
// dynamic value risks producing something that doesn't byte-match what's
// registered, whereas the production URL never changes.
const REDIRECT_URI = "https://synfracore.com/settings/social/instagram/callback";
const SETTINGS_URL = "https://synfracore.com/settings/social";

function backToSettings(param: string, value: string): Response {
  return Response.redirect(`${SETTINGS_URL}?${param}=${encodeURIComponent(value)}`);
}

// GET, not a Server Action — Instagram redirects the browser here directly
// with ?code=... after the user approves access on instagram.com. Regular
// Route Handlers don't have the Clerk auth()/currentUser() Server-Action
// context bug (see lib/clerk/authFallback.ts) — app/api/ai/route.ts already
// uses plain auth() successfully here — so ensureUserRecord() is safe to
// call directly, unlike in app/settings/social/actions.ts.
export async function GET(request: Request) {
  const { profile } = await ensureUserRecord();
  if (!profile || profile.role !== "admin") {
    return new Response("Not found", { status: 404 });
  }

  const url = new URL(request.url);
  const code = url.searchParams.get("code");
  const oauthError = url.searchParams.get("error_description") ?? url.searchParams.get("error");

  if (oauthError) return backToSettings("instagram_error", oauthError);
  if (!code) return backToSettings("instagram_error", "missing_code");

  const appId = process.env.INSTAGRAM_APP_ID;
  const appSecret = process.env.INSTAGRAM_APP_SECRET;
  if (!appId || !appSecret) {
    // Same "not configured yet" posture as Telegram's missing bot token —
    // a real, temporary state before the Meta app is set up, not a bug.
    return backToSettings("instagram_error", "not_configured");
  }

  const result = await exchangeInstagramAuthCode(appId, appSecret, REDIRECT_URI, code);
  if (!result.ok) {
    console.error("Instagram OAuth callback: token exchange failed:", result.error);
    return backToSettings("instagram_error", result.error);
  }

  try {
    const supabase = createSupabaseServerClient();
    const { error } = await supabase.from("social_connections").insert({
      user_id: profile.id,
      platform: "instagram",
      external_id: result.igUserId,
      display_name: result.username,
      access_token: result.accessToken,
      token_expires_at: result.expiresAt.toISOString(),
    });
    if (error) {
      console.error("Instagram OAuth callback: insert failed:", error);
      return backToSettings("instagram_error", error.code === "23505" ? "already_connected" : "save_failed");
    }
  } catch (err) {
    console.error("Instagram OAuth callback: unexpected failure:", err);
    return backToSettings("instagram_error", "save_failed");
  }

  return backToSettings("instagram_connected", "1");
}
