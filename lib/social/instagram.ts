// Instagram Graph API — Business Login for Instagram flow (confirmed live,
// 2026-09-13, against Meta's current docs). Deliberately NOT the older
// Facebook Login for Business flow — that one requires linking a Facebook
// Page; Business Login connects the Instagram professional account
// directly. Also NOT the deprecated Instagram Basic Display API (sunset
// 2024-12-04) — this is the current Instagram Graph API.
//
// Standard Access, not Advanced Access: SynfraCore only ever posts to its
// own Instagram account (added as an Instagram Tester on the Meta app), so
// this never needs Meta App Review or Business Verification — those only
// gate apps publishing to accounts they don't own.

const IG_OAUTH_AUTHORIZE_URL = "https://www.instagram.com/oauth/authorize";
const IG_TOKEN_EXCHANGE_URL = "https://api.instagram.com/oauth/access_token";
const IG_GRAPH_BASE = "https://graph.instagram.com";

export type InstagramTokenResult =
  | { ok: true; accessToken: string; expiresAt: Date; igUserId: string; username: string }
  | { ok: false; error: string };

export function buildInstagramAuthorizeUrl(appId: string, redirectUri: string): string {
  const params = new URLSearchParams({
    client_id: appId,
    redirect_uri: redirectUri,
    response_type: "code",
    // instagram_business_basic: read the account's own identity (id/username).
    // instagram_business_content_publish: the actual publish permission.
    // Both scopes required under Standard Access for an own-account
    // integration — no additional Advanced Access scopes needed.
    scope: "instagram_business_basic,instagram_business_content_publish",
  });
  return `${IG_OAUTH_AUTHORIZE_URL}?${params.toString()}`;
}

// Runs the full 3-step exchange (auth code -> short-lived token -> 60-day
// long-lived token) plus one identity lookup, since the callback route
// needs all of it before it can insert a usable social_connections row.
export async function exchangeInstagramAuthCode(
  appId: string,
  appSecret: string,
  redirectUri: string,
  code: string
): Promise<InstagramTokenResult> {
  // Step 1: auth code -> short-lived token. Meta's token endpoint takes
  // form-encoded POST body, not JSON — confirmed against current docs.
  const shortLivedRes = await fetch(IG_TOKEN_EXCHANGE_URL, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      client_id: appId,
      client_secret: appSecret,
      grant_type: "authorization_code",
      redirect_uri: redirectUri,
      code,
    }),
  });
  const shortLivedBody = (await shortLivedRes.json()) as {
    access_token?: string;
    user_id?: string;
    error_message?: string;
  };
  if (!shortLivedRes.ok || !shortLivedBody.access_token) {
    return { ok: false, error: shortLivedBody.error_message ?? "Failed to exchange authorization code." };
  }

  // Step 2: short-lived -> long-lived (60-day) token.
  const longLivedParams = new URLSearchParams({
    grant_type: "ig_exchange_token",
    client_secret: appSecret,
    access_token: shortLivedBody.access_token,
  });
  const longLivedRes = await fetch(`${IG_GRAPH_BASE}/access_token?${longLivedParams.toString()}`);
  const longLivedBody = (await longLivedRes.json()) as {
    access_token?: string;
    expires_in?: number; // seconds, ~60 days
    error_message?: string;
  };
  if (!longLivedRes.ok || !longLivedBody.access_token || !longLivedBody.expires_in) {
    return { ok: false, error: longLivedBody.error_message ?? "Failed to obtain a long-lived token." };
  }

  // Step 3: identity lookup — the account's own id/username, for external_id
  // and display_name on the social_connections row.
  const meParams = new URLSearchParams({ fields: "id,username", access_token: longLivedBody.access_token });
  const meRes = await fetch(`${IG_GRAPH_BASE}/me?${meParams.toString()}`);
  const meBody = (await meRes.json()) as { id?: string; username?: string; error?: { message?: string } };
  if (!meRes.ok || !meBody.id) {
    return { ok: false, error: meBody.error?.message ?? "Failed to look up the connected Instagram account." };
  }

  return {
    ok: true,
    accessToken: longLivedBody.access_token,
    expiresAt: new Date(Date.now() + longLivedBody.expires_in * 1000),
    igUserId: meBody.id,
    username: meBody.username ?? meBody.id,
  };
}

// Refreshes a long-lived token before its 60-day expiry — must be at least
// 24h old, per Meta's own requirement (not enforced here; the dispatch job
// is expected to call this well before expiry, not right after issuing it).
export async function refreshInstagramToken(
  accessToken: string
): Promise<{ ok: true; accessToken: string; expiresAt: Date } | { ok: false; error: string }> {
  const params = new URLSearchParams({ grant_type: "ig_refresh_token", access_token: accessToken });
  const res = await fetch(`${IG_GRAPH_BASE}/refresh_access_token?${params.toString()}`);
  const body = (await res.json()) as { access_token?: string; expires_in?: number; error_message?: string };
  if (!res.ok || !body.access_token || !body.expires_in) {
    return { ok: false, error: body.error_message ?? "Failed to refresh Instagram token." };
  }
  return { ok: true, accessToken: body.access_token, expiresAt: new Date(Date.now() + body.expires_in * 1000) };
}
