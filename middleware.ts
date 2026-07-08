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

// Only these routes require sign-in. Every academy/roadmap/marketing page
// stays public by design — "all domains remain explorable" is a product
// decision, not just a UI default.
const isProtectedRoute = createRouteMatcher([
  "/dashboard(.*)",
  "/onboarding(.*)",
  "/admin(.*)",
  "/profile(.*)",
]);

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
        await auth.protect();
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
