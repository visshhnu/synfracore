import Link from "next/link";
import { redirect } from "next/navigation";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { getAttemptWithResponses, getAttemptResults, getPaperBySlug } from "@/lib/supabase/questionBank";
import ResultsSummary from "@/components/question-bank/ResultsSummary";

type Props = { params: Promise<{ paperSlug: string; attemptId: string }> };

// Auth-required (also covered by middleware.ts). This is the ONE screen in
// the whole feature that reads question_answers — via the service-role
// client, with an explicit attempt.user_id === userId ownership check inside
// getAttemptResults() (service-role bypasses RLS entirely, so that check is
// the only thing preventing one user from viewing another's graded results).
export default async function AttemptResultsPage({ params }: Props) {
  const { paperSlug, attemptId } = await params;

  const { userId } = await getAuthSafely();
  if (!userId) redirect(`/sign-in?redirect_url=${encodeURIComponent(`/question-bank/${paperSlug}/attempt/${attemptId}/results`)}`);

  const serviceClient = createServiceRoleClient();
  const results = await getAttemptResults(serviceClient, attemptId, userId);

  if (!results) {
    // Distinguish "not submitted yet" (send back to the attempt) from
    // "doesn't exist / not yours" (send to the paper landing page) using the
    // normal RLS-restricted authenticated client, which can never leak
    // another user's attempt regardless of what getAttemptResults decided.
    const supabase = createSupabaseServerClient();
    const ownAttempt = await getAttemptWithResponses(supabase, attemptId);
    if (ownAttempt && ownAttempt.attempt.submitted_at === null) {
      redirect(`/question-bank/${paperSlug}/attempt/${attemptId}`);
    }
    redirect(`/question-bank/${paperSlug}`);
  }

  // Fetched separately from `results` (AttemptResults doesn't carry
  // exam_type) purely to scope the "back to Question Bank" links to this
  // paper's own exam type, matching the same stay-in-context pattern the
  // paper landing page and the technology page's Practice Exams tab already
  // use — a signed-in RLS-restricted read, not the service-role client.
  const supabaseForPaper = createSupabaseServerClient();
  const paper = await getPaperBySlug(supabaseForPaper, paperSlug);
  const questionBankHref = paper ? `/question-bank?examType=${paper.exam_type}` : "/question-bank";

  return (
    <div style={{ maxWidth: "800px", margin: "0 auto", padding: "32px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <Link href={questionBankHref} style={{ color: "var(--text-4)", textDecoration: "none" }}>Question Bank</Link>›
        <Link href={`/question-bank/${paperSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>Paper</Link>›
        <span style={{ color: "var(--text-2)" }}>Results</span>
      </nav>

      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "24px", fontWeight: 800, marginBottom: "20px" }}>Results</h1>

      <ResultsSummary results={results} />

      <div style={{ textAlign: "center", marginTop: "32px", paddingTop: "24px", borderTop: "1px solid var(--border)" }}>
        <Link href={questionBankHref} className="btn-secondary">Back to Question Bank</Link>
      </div>
    </div>
  );
}
