export const runtime = "edge";

import Link from "next/link";
import type { Metadata } from "next";
import { currentUser } from "@clerk/nextjs/server";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getPaperCatalog, getLatestInProgressAttempt, getLatestSubmittedAttempt } from "@/lib/supabase/questionBank";
import PaperCard from "@/components/question-bank/PaperCard";

export const metadata: Metadata = {
  title: "Question Bank",
  description: "Full-length practice exams with instant scoring and detailed explanations.",
  alternates: { canonical: "https://synfracore.com/question-bank" },
};

// Public catalog — identical for signed-in and signed-out visitors (product
// decision: "all domains remain explorable" extends here; only STARTING an
// attempt requires sign-in, enforced in startAttemptAction). Per-paper
// in-progress/submitted status is fetched only when signed in.
export default async function QuestionBankPage() {
  const supabase = createSupabaseServerClient();
  const papers = await getPaperCatalog(supabase);
  const user = await currentUser().catch(() => null);

  const statusByPaperId = new Map<string, { kind: "in_progress" } | { kind: "submitted"; score: number; total: number }>();
  if (user) {
    await Promise.all(
      papers.map(async (paper) => {
        const submitted = await getLatestSubmittedAttempt(supabase, user.id, paper.id);
        if (submitted && submitted.score !== null && submitted.total !== null) {
          statusByPaperId.set(paper.id, { kind: "submitted", score: submitted.score, total: submitted.total });
          return;
        }
        const inProgress = await getLatestInProgressAttempt(supabase, user.id, paper.id);
        if (inProgress) statusByPaperId.set(paper.id, { kind: "in_progress" });
      })
    );
  }

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "40px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <span style={{ color: "var(--text-2)" }}>Question Bank</span>
      </nav>

      <div style={{ marginBottom: "36px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "30px", fontWeight: 800, marginBottom: "10px" }}>Question Bank</h1>
        <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "640px", lineHeight: 1.7 }}>
          Full-length, 100-question practice exams with shuffled questions, instant scoring, and detailed explanations for every answer.
        </p>
      </div>

      {papers.length === 0 ? (
        <p style={{ color: "var(--text-4)", fontSize: "13px" }}>No practice papers are available yet — check back soon.</p>
      ) : (
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "16px" }}>
          {papers.map((paper) => (
            <PaperCard key={paper.id} paper={paper} status={statusByPaperId.get(paper.id) ?? null} />
          ))}
        </div>
      )}
    </div>
  );
}
