import { NextRequest, NextResponse } from "next/server";

// Receives the client-side beacon from components/NotFoundDiagnosticsBeacon.tsx
// (fired by app/not-found.tsx). See that file's comment for full context —
// this is the client-navigation half; app/not-found.tsx's own server-side
// headers() logging is the request-header half. console.error so both halves
// are visible via `wrangler tail` today and correlatable by timestamp until
// D3 (Sentry re-activation) lands and they can be tied together by request ID.
export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const ray = req.headers.get("cf-ray");
    // The authoritative pathname for this occurrence — derived here from the
    // client's own window.location (body.url), not from a guess. Correlate
    // against app/not-found.tsx's [not-found] log via cfRay (exact match)
    // and timestamp (approximate — the two logs fire a few ms apart).
    const pathname = (() => {
      try {
        return new URL(body.url).pathname;
      } catch {
        return null;
      }
    })();
    console.error("[not-found-beacon]", JSON.stringify({
      ...body,
      pathname,
      receivedAt: new Date().toISOString(), // ms-precision; pairs with body.timestamp (client-sent)
      cfRay: ray,
      // See app/not-found.tsx's comment -- cf-ray doesn't always carry a
      // "-COLO" suffix in this environment, so only split when present.
      colo: ray && ray.includes("-") ? ray.split("-").pop() : null,
    }));
  } catch (err) {
    console.error("[not-found-beacon] failed to parse:", err);
  }
  // sendBeacon doesn't read the response, but Route Handlers must return one.
  return NextResponse.json({ ok: true });
}
