import { clerkMiddleware } from "@clerk/nextjs/server";
import { NextResponse } from "next/server";

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

export default hasClerkKeys ? clerkMiddleware() : () => NextResponse.next();

export const config = {
  matcher: [
    "/((?!_next|.*\\.(?:html?|css|js|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)",
    "/(api|trpc)(.*)",
  ],
};
