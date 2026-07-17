export const runtime = "edge";

import { NextResponse } from "next/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { ensureUserRowExists } from "@/lib/supabase/ensureUser";

// Shared Route Handler for any CLIENT component that writes directly to a
// table with a `REFERENCES users(id)` foreign key via RLS (e.g.
// SectionQuiz.tsx inserting into quiz_attempts). Those writes go straight
// from the browser through Supabase's RLS, never through a server route --
// so unlike the dashboard (ensureUserRecord) or question-bank's Start route
// (ensureUserRowExists called server-side), there was previously nothing
// guaranteeing a users row exists first. Call this once before any such
// client-side write. See lib/supabase/ensureUser.ts for what this actually
// does (insert-or-self-heal-via-relink).
export async function POST() {
  const { userId } = await getAuthSafely();
  if (!userId) return NextResponse.json({ ok: false }, { status: 401 });
  await ensureUserRowExists(userId);
  return NextResponse.json({ ok: true });
}
