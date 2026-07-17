import { verifyWebhook } from "@clerk/nextjs/webhooks";
import { NextRequest, NextResponse } from "next/server";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";

// Real-time Clerk -> Supabase user sync. Unlike every other Supabase write in
// this codebase, a webhook has no end-user session/JWT to satisfy the
// "(select auth.jwt()->>'sub') = id" RLS policies — so this route needs the
// Supabase service-role key (bypasses RLS; server-only, never NEXT_PUBLIC_,
// never sent to the browser). See lib/supabase/serviceRole.ts for the shared
// client and its other consumer (the question-bank grading Server Actions).
//
// Setup (both required, or this route just never gets called — harmless):
//   1. Add SUPABASE_SERVICE_ROLE_KEY (from Supabase dashboard -> Settings ->
//      API -> service_role key) as a server-only secret.
//   2. Add CLERK_WEBHOOK_SIGNING_SECRET (from Clerk dashboard -> Webhooks ->
//      your endpoint -> Signing Secret) after creating an endpoint pointing
//      at https://synfracore.com/api/webhooks/clerk, subscribed to
//      user.created / user.updated / user.deleted.
//
// This is the "instant sync" layer. lib/supabase/ensureUser.ts's
// ensureUserRecord() is the always-on guaranteed fallback that needs no
// extra setup — the dashboard works correctly even before this is configured.

type ClerkEmailAddress = { id: string; email_address: string };
type ClerkUserPayload = {
  id: string;
  email_addresses?: ClerkEmailAddress[];
  primary_email_address_id?: string | null;
  first_name?: string | null;
  last_name?: string | null;
  username?: string | null;
  image_url?: string | null;
};

export async function POST(req: NextRequest) {
  if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
    return NextResponse.json({ error: "SUPABASE_SERVICE_ROLE_KEY not configured" }, { status: 501 });
  }

  let evt;
  try {
    evt = await verifyWebhook(req);
  } catch {
    return NextResponse.json({ error: "Invalid webhook signature" }, { status: 400 });
  }

  const supabase = createServiceRoleClient();

  if (evt.type === "user.created" || evt.type === "user.updated") {
    const u = evt.data as ClerkUserPayload;
    const email =
      u.email_addresses?.find(e => e.id === u.primary_email_address_id)?.email_address ??
      u.email_addresses?.[0]?.email_address ??
      "";
    const fullName = `${u.first_name ?? ""} ${u.last_name ?? ""}`.trim() || u.username || "Learner";

    const { error } = await supabase.from("users").upsert(
      {
        id: u.id,
        email,
        full_name: fullName,
        avatar_url: u.image_url,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "id" }
    );
    if (error) {
      console.error("Clerk webhook -> Supabase upsert failed:", error);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }
  }

  if (evt.type === "user.deleted") {
    const u = evt.data as { id?: string };
    if (u.id) {
      await supabase.from("users").delete().eq("id", u.id);
    }
  }

  return NextResponse.json({ received: true });
}
