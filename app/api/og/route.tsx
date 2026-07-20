import { NextResponse } from "next/server";

// This used to dynamically render an OG image per request via next/og's
// ImageResponse (Satori/resvg). That proved unreliable under OpenNext's
// Workers isolate reuse -- it worked once on a fresh isolate, then failed
// on nearly every subsequent request on the same warm instance (confirmed
// via repeated live testing). Replaced by static, build-time-generated
// images under public/og/{academy}.png (see scripts/generate-og-images.mjs
// and lib/seo/metadata.ts, which no longer reference this route at all).
//
// Kept as a redirect, not deleted outright, so any stale cached links or
// old social-share references to /api/og?... still resolve to a real
// image instead of a 404/500.
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const academy = searchParams.get("academy");
  const target = academy ? `/og/${academy}.png` : "/og/default.png";
  return NextResponse.redirect(new URL(target, request.url), { status: 308 });
}
