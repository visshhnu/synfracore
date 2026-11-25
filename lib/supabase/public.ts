import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import { getFirstPaperByExamType, type QuestionPaper } from "@/lib/supabase/questionBank";
import { getCollectionsBySubject, type PyqCollection } from "@/lib/supabase/pyqBank";

// Anonymous (no Clerk token) Supabase client for PUBLIC catalog reads only —
// question_papers and pyq_collections both have a `FOR SELECT USING (true)`
// RLS policy (docs/question-bank-schema.sql, docs/pyq-bank-schema.sql), so
// the anon key returns exactly what a signed-in user would see for them.
//
// Why this exists (2026-11-25): createSupabaseServerClient() attaches the
// Clerk JWT via auth(), which reads request headers — that alone forced every
// academy technology/section page into per-request rendering on the Worker
// (Cloudflare free plan: 10 ms CPU per request, exceeded 1,000+ times/day).
// With no request-bound API in the path, those pages can now be prerendered
// at build time. NEVER use this client for user-owned tables (attempts,
// profiles, preferences) — those need createSupabaseServerClient().
let publicClient: SupabaseClient | null = null;

export function createSupabasePublicClient(): SupabaseClient {
  if (!publicClient) {
    publicClient = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      { auth: { persistSession: false, autoRefreshToken: false } }
    );
  }
  return publicClient;
}

// Memoized per process — prerendering ~2,000 pages at build time would
// otherwise repeat the same handful of lookups thousands of times (there are
// only a few dozen distinct exam types / PYQ subjects).
const paperCache = new Map<string, Promise<QuestionPaper | null>>();
const pyqCache = new Map<string, Promise<PyqCollection[]>>();

export function getFirstPublicPaperByExamType(examType: string): Promise<QuestionPaper | null> {
  let hit = paperCache.get(examType);
  if (!hit) {
    hit = getFirstPaperByExamType(createSupabasePublicClient(), examType);
    paperCache.set(examType, hit);
  }
  return hit;
}

export function getPublicCollectionsBySubject(subject: string): Promise<PyqCollection[]> {
  let hit = pyqCache.get(subject);
  if (!hit) {
    hit = getCollectionsBySubject(createSupabasePublicClient(), subject);
    pyqCache.set(subject, hit);
  }
  return hit;
}
