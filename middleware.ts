import { clerkMiddleware, createRouteMatcher } from "@clerk/nextjs/server";
import { NextResponse, type NextRequest } from "next/server";

// clerkMiddleware() throws synchronously on every request if its keys aren't
// configured in the deployment environment (confirmed against @clerk/nextjs
// source — see throwMissingPublishableKeyError). Since middleware runs before
// any page renders, that throw takes down the entire site, not just auth
// pages. Guard it: fall back to a no-op pass-through until the real Clerk
// keys are set in the hosting platform's environment variables (they only
// ever existed in the gitignored .env.local, which never gets deployed).
const hasClerkKeys = Boolean(
  process.env.NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY && process.env.CLERK_SECRET_KEY
);

// Routes that require sign-in AND get their signed-out handling enforced
// here, at the middleware level, via auth.protect(). Every academy/roadmap/
// marketing page stays public by design — "all domains remain explorable" is
// a product decision, not just a UI default. /admin is NOT in this list —
// see the comment above its own definition below for why.
const isProtectedRoute = createRouteMatcher([
  "/dashboard(.*)",
  "/onboarding(.*)",
  "/profile(.*)",
  "/question-bank/[^/]+/attempt(.*)",
]);

// Product decision (2026-07-10, resolves 3.7's open question): /dashboard and
// /onboarding redirect a signed-out visitor to /sign-in explicitly — there's
// nothing sensitive about confirming these pages exist, and that's normal UX
// for any app. /question-bank/[paperSlug]/attempt(.*) joins this list for the
// same reason (2026-07-13): the practice/results screens are meaningless
// without a signed-in attempt owner, so there's nothing to hide by confirming
// the URL shape exists — unlike /admin below. Note this is defense-in-depth
// only: the actual "can't start a paper" enforcement lives in
// startAttemptAction (app/question-bank/actions.ts), since the Start button's
// request is a Server Action POST against the (public) paper landing page
// URL, not a navigation to /attempt/... — middleware never sees that URL
// until after the action has already decided to redirect there. The catalog
// (/question-bank) and a paper's landing page (/question-bank/[paperSlug])
// deliberately stay OUT of this matcher — both remain publicly browsable.
const isRedirectOnSignedOut = createRouteMatcher([
  "/dashboard(.*)",
  "/onboarding(.*)",
  "/question-bank/[^/]+/attempt(.*)",
]);

// /admin deliberately does NOT go through auth.protect() here at all — this
// is a second, distinct fix (2026-07-11), not just "leave it as the other
// branch of the above decision". auth.protect()'s default (no explicit
// redirect) signed-out behavior calls notFound() from *middleware*, which
// Clerk implements as an internal NextResponse.rewrite() to a deliberately
// nonexistent path (`/clerk_<timestamp>`) — relying on Next.js's normal
// "no matching route" handling to render our custom not-found.tsx. Confirmed
// live (2026-07-11) that this specific rewrite-to-a-fake-path pattern doesn't
// work correctly on @cloudflare/next-on-pages: multiple independent, already-
// filed issues against the adapter (cloudflare/next-on-pages#177, #283, #546)
// document exactly this — a rewrite to a path that isn't a real route falls
// through to default/home-page handling instead of the intended not-found
// page. Live testing confirmed the exact symptom: a signed-out visit to
// /admin briefly flashed the real 404, then fell through to the homepage —
// on both a cold fresh visit and right after sign-out, ruling out the
// separate, already-documented afterSignOutUrl quirk (Phase 4) as the cause.
// This means /admin's "hide via 404" design intent likely never worked
// reliably in production on this adapter — not a regression from any of
// today's or yesterday's changes (confirmed via git diff that this exact
// auth.protect() call was byte-identical before and after the 3.7 fix).
//
// The fix: don't rely on middleware's notFound()-via-fake-rewrite mechanism
// at all for /admin. clerkMiddleware() below still runs for every request
// (it's not scoped to isProtectedRoute — see the matcher config at the
// bottom), so Clerk's auth context is still correctly established for
// /admin; admin/page.tsx's own Server Component calls notFound() directly
// (already did, for the signed-in-but-not-admin role check) — a native,
// officially-supported use of notFound() that doesn't go through this
// broken middleware rewrite path, and correctly renders a stable 404.

// /privacy and /terms render dynamically on every request (Cloudflare
// compiles them into a Function, like nearly every route here), which means
// next.config.ts's headers() rule for them never applies — Cloudflare Pages'
// _headers mechanism (what next-on-pages compiles headers() into) explicitly
// does not apply to Function-rendered routes, only genuinely static assets.
// Confirmed via a live check: the header showed in local `next dev` but was
// absent on production. Setting it here instead works because middleware
// runs on every request, Function-rendered or not, and can mutate the
// outgoing response directly.
const CACHEABLE_PATHS = new Set(["/privacy", "/terms"]);

function withCacheHeaders(req: NextRequest, res: NextResponse) {
  if (CACHEABLE_PATHS.has(new URL(req.url).pathname)) {
    res.headers.set("Cache-Control", "public, max-age=3600, s-maxage=86400, stale-while-revalidate=86400");
  }
  return res;
}

// Stage 2 F4: this exact "no Clerk keys" state already caused one production
// incident (missing CLERK_SECRET_KEY on Cloudflare Pages — the onboarding
// page showed a raw Clerk internal error to real visitors). At the time, no
// unauthorized data was exposed only because currentUser()/auth() calls
// inside dashboard/admin/onboarding also fail without Clerk configured, and
// those pages' own null-profile / notFound() checks happened to catch it —
// an accidental second layer, not a designed one. Keep the no-crash
// pass-through for public routes (clerkMiddleware() itself throws
// synchronously without keys, which would otherwise take down the whole
// site), but protected routes must fail closed on their own, not rely on
// downstream pages continuing to compensate correctly forever.
function fallbackMiddleware(req: NextRequest) {
  if (isProtectedRoute(req)) {
    return NextResponse.redirect(new URL("/sign-in", req.url));
  }
  return withCacheHeaders(req, NextResponse.next());
}

export default hasClerkKeys
  ? clerkMiddleware(async (auth, req) => {
      if (isProtectedRoute(req)) {
        if (isRedirectOnSignedOut(req)) {
          await auth.protect({ unauthenticatedUrl: new URL("/sign-in", req.url).toString() });
        } else {
          await auth.protect();
        }
      }
      return withCacheHeaders(req, NextResponse.next());
    })
  : fallbackMiddleware;

export const config = {
  matcher: [
    "/((?!_next|.*\\.(?:html?|css|js|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest|md)).*)",
    "/(api|trpc)(.*)",
  ],
};
