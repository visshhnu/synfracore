export const runtime = "edge";

import { auth } from "@clerk/nextjs/server";

// Locked to the site's own origin — this endpoint is never meant to be
// called cross-origin. (Note: CORS headers only govern whether a *browser*
// lets cross-origin JS read the response; they don't stop a direct
// server-to-server/script call. The auth check below is what actually closes
// that door — this header is defense-in-depth on top of it, not instead of it.)
const ALLOWED_ORIGIN = "https://synfracore.com";

// Pinned server-side — the client's own model/max_tokens choices are never
// honored, regardless of what a caller sends. This is what actually bounds
// cost per request; without it, a direct caller (bypassing SectionContent.tsx
// entirely) could request any model/token count the account allows.
const AI_MODEL = "claude-sonnet-4-6";
const AI_MAX_TOKENS = 1000;

function corsHeaders() {
  return {
    "Access-Control-Allow-Origin": ALLOWED_ORIGIN,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type",
  };
}

export async function POST(request: Request) {
  // Auth check lives here, in the route itself, rather than relying solely on
  // middleware.ts's isProtectedRoute — middleware currently fails OPEN (passes
  // every request through unchecked) if Clerk's env keys are ever missing at
  // runtime (see audit Finding 4). Checking here means this endpoint stays
  // closed even in that failure state, since a missing/misconfigured Clerk
  // setup also means auth() can't produce a userId.
  let userId: string | null = null;
  try {
    userId = (await auth()).userId;
  } catch (err) {
    console.error("auth() failed in /api/ai:", err);
  }
  if (!userId) {
    return Response.json(
      { error: "Sign in required to use the AI assistant." },
      { status: 401, headers: corsHeaders() }
    );
  }

  // Zero-cost stopgap: while the real SynfraAI tutor (per-user metering,
  // academy-scoped prompts, content boundaries) is being built, this flag
  // keeps the endpoint fully closed — no Anthropic call happens at all below
  // this point, so there is no cost and nothing to abuse, even from a signed-in
  // account.
  if (process.env.AI_ASSISTANT_ENABLED !== "true") {
    return Response.json(
      { status: "coming_soon", message: "SynfraCore AI Assistant launching soon" },
      { status: 200, headers: corsHeaders() }
    );
  }

  try {
    const body = await request.json();

    const response = await fetch("https://api.anthropic.com/v1/messages", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "anthropic-version": "2023-06-01",
        ...(process.env.ANTHROPIC_API_KEY
          ? { "x-api-key": process.env.ANTHROPIC_API_KEY }
          : {}),
      },
      // Client-supplied system/messages are still forwarded (SectionContent's
      // buildPrompt() constructs these from a fixed per-section template, not
      // free user text) — only model/max_tokens are overridden, since those
      // are what actually control cost per request.
      body: JSON.stringify({ ...body, model: AI_MODEL, max_tokens: AI_MAX_TOKENS }),
    });

    const data = await response.json();

    return Response.json(data, { status: response.status, headers: corsHeaders() });
  } catch (error) {
    return Response.json(
      { error: { message: "API proxy error" } },
      { status: 500, headers: corsHeaders() }
    );
  }
}

export async function OPTIONS() {
  return new Response(null, { headers: corsHeaders() });
}
