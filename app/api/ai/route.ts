import { auth } from "@clerk/nextjs/server";
import { getCloudflareContext } from "@opennextjs/cloudflare";
import { getBlogKv, isRateLimited } from "@/lib/rateLimit";

// Locked to the site's own origin — this endpoint is never meant to be
// called cross-origin. (Note: CORS headers only govern whether a *browser*
// lets cross-origin JS read the response; they don't stop a direct
// server-to-server/script call. The auth check below is what actually closes
// that door — this header is defense-in-depth on top of it, not instead of it.)
const ALLOWED_ORIGIN = "https://synfracore.com";

// Cloudflare Workers AI, not Anthropic — chosen because it runs as a native
// Workers binding (no separate API key, no per-token billing account) and its
// 10,000-Neuron/day allowance is genuinely free on the plain Workers Free
// plan. Model/max_tokens are pinned server-side regardless of what a caller
// sends, same as before — this is what actually bounds cost per request.
//
// NOT "@cf/meta/llama-3.1-8b-instruct" — confirmed live (2026-09-11) that
// model is deprecated server-side (error 5028) despite still being listed on
// Cloudflare's own pricing page; the docs are stale here, not just training
// data. This -fp8-fast variant is the current working replacement, and is
// actually cheaper per the live pricing page (4,119 / 34,868 neurons per M
// input/output tokens vs. the deprecated model's 25,608 / 75,147).
const AI_MODEL = "@cf/meta/llama-3.1-8b-instruct-fp8-fast";
const AI_MAX_TOKENS = 500;

// Sitewide (not per-user) daily cap. At ~500 input + 500 output tokens/message
// on this model, one message costs ~19.5 Neurons (2 input + 17.4 output), so
// 10,000 Neurons/day supports ~500 such messages. Capped well under that
// (300) as a buffer for longer prompts on denser technology sections and to
// leave margin before a mid-day hard failure from Cloudflare once the pool is
// actually exhausted. This is a *sitewide* limit, not per-user — the point is
// staying inside the free allowance, not fair-use policing of individual
// accounts.
//
// By design, this never auto-upgrades to the Workers Paid plan once hit —
// the feature is meant to degrade to "come back tomorrow", permanently, not
// silently start costing money.
const DAILY_MESSAGE_LIMIT = 300;

function corsHeaders() {
  return {
    "Access-Control-Allow-Origin": ALLOWED_ORIGIN,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type",
  };
}

// Date-scoped key (UTC) rather than a rolling TTL window — the counter
// naturally resets at UTC midnight because the key itself changes, so there's
// no clock-skew risk from relying on an exact 24h expirationTtl.
function todaysQuotaKey(): string {
  return `ai-daily-quota:${new Date().toISOString().slice(0, 10)}`;
}

type AiRunResult = { response?: string };
type AiBinding = { run(model: string, input: Record<string, unknown>): Promise<AiRunResult> };

function getAiBinding(): AiBinding | undefined {
  try {
    return (getCloudflareContext().env as { AI?: AiBinding }).AI;
  } catch {
    return undefined;
  }
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
  // academy-scoped prompts, content boundaries) is being verified end-to-end,
  // this flag keeps the endpoint fully closed — no Workers AI call happens at
  // all below this point, so there is no cost and nothing to abuse, even from
  // a signed-in account.
  if (process.env.AI_ASSISTANT_ENABLED !== "true") {
    return Response.json(
      { status: "coming_soon", message: "SynfraCore AI Assistant launching soon" },
      { status: 200, headers: corsHeaders() }
    );
  }

  // Sitewide daily-quota gate — reuses the same KV namespace and rate-limit
  // primitive already used for blog-comment abuse deterrence
  // (lib/rateLimit.ts), just keyed by UTC date instead of by IP. Fails open
  // (allows the request) if KV isn't configured, matching every other KV
  // access in this app — see lib/rateLimit.ts's own reasoning.
  const kv = getBlogKv();
  const quotaExceeded = await isRateLimited(kv, todaysQuotaKey(), DAILY_MESSAGE_LIMIT, 90000);
  if (quotaExceeded) {
    return Response.json(
      {
        status: "quota_exceeded",
        message: "SynfraCore AI has hit today's free usage cap — please try again tomorrow.",
      },
      { status: 200, headers: corsHeaders() }
    );
  }

  try {
    const body = await request.json();

    const ai = getAiBinding();
    if (!ai) {
      return Response.json(
        { error: { message: "AI binding unavailable" } },
        { status: 500, headers: corsHeaders() }
      );
    }

    // Client sends Anthropic-shaped { system, messages } (SectionContent's
    // buildPrompt() constructs these from a fixed per-section template, not
    // free user text) — Workers AI takes a single messages array with an
    // optional leading system entry instead of a separate `system` field.
    const messages = body.system
      ? [{ role: "system", content: body.system }, ...(body.messages ?? [])]
      : (body.messages ?? []);

    const result = await ai.run(AI_MODEL, { messages, max_tokens: AI_MAX_TOKENS });

    // Workers AI's native non-streaming shape is { response: string } — not
    // Anthropic's { content: [{ type: "text", text }] }. Returned as-is;
    // SectionContent.tsx reads `data.response` directly rather than this
    // route translating it back into Anthropic's shape.
    return Response.json({ response: result.response ?? "" }, { status: 200, headers: corsHeaders() });
  } catch (error) {
    console.error("Workers AI call failed in /api/ai:", error);
    return Response.json(
      { error: { message: "AI proxy error" } },
      { status: 500, headers: corsHeaders() }
    );
  }
}

export async function OPTIONS() {
  return new Response(null, { headers: corsHeaders() });
}
