export const runtime = "edge";

import { NextRequest, NextResponse } from "next/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getPaperBySlug, getLatestInProgressAttempt, getLatestSubmittedAttempt } from "@/lib/supabase/questionBank";

// Backs AttemptStatusButtons.tsx's client-side refetch. Exists because the
// paper landing page (app/question-bank/[paperSlug]/page.tsx) is a Server
// Component that reads currentUser() once at request time — a client-only
// Clerk auth transition (sign in/out via the Navbar's modal, no navigation)
// never re-runs that server render, so the "Continue attempt"/"View last
// results" buttons kept showing stale pre-transition state until a manual
// refresh. This endpoint lets the client re-derive that state itself
// whenever useAuth() reports isSignedIn changed.
export async function GET(req: NextRequest) {
  const paperSlug = req.nextUrl.searchParams.get("paperSlug");
  if (!paperSlug) {
    return NextResponse.json({ error: "paperSlug required" }, { status: 400 });
  }

  const { userId } = await getAuthSafely();
  if (!userId) {
    return NextResponse.json({ inProgress: null, lastSubmitted: null });
  }

  const supabase = createSupabaseServerClient();
  const paper = await getPaperBySlug(supabase, paperSlug);
  if (!paper) {
    return NextResponse.json({ inProgress: null, lastSubmitted: null });
  }

  const [inProgress, lastSubmitted] = await Promise.all([
    getLatestInProgressAttempt(supabase, userId, paper.id),
    getLatestSubmittedAttempt(supabase, userId, paper.id),
  ]);

  return NextResponse.json({ inProgress, lastSubmitted });
}
