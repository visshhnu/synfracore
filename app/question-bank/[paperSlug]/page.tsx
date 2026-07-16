export const runtime = "edge";

import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { currentUser } from "@clerk/nextjs/server";
import { Sparkles } from "lucide-react";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getPaperBySlug, getLatestInProgressAttempt, getLatestSubmittedAttempt } from "@/lib/supabase/questionBank";
import AttemptStatusButtons from "@/components/question-bank/AttemptStatusButtons";

type Props = { params: Promise<{ paperSlug: string }>; searchParams: Promise<{ error?: string; locked?: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { paperSlug } = await params;
  const supabase = createSupabaseServerClient();
  const paper = await getPaperBySlug(supabase, paperSlug);
  if (!paper) return { title: "Practice Paper | SynfraCore" };
  return {
    title: `${paper.title} | SynfraCore`,
    description: `${paper.question_count}-question practice exam — ${paper.focus_tags.join(", ")}.`,
    alternates: { canonical: `https://synfracore.com/question-bank/${paperSlug}` },
  };
}

// Public landing page — full description visible and the "Start" control
// clickable regardless of auth state (no separate signed-out branch here);
// StartButton's own /api/question-bank/start call handles the sign-in
// redirect if needed. Shows "Continue attempt" / "View last results" for a
// signed-in user who already has attempt history for this paper.
export default async function PaperLandingPage({ params, searchParams }: Props) {
  const { paperSlug } = await params;
  const { error, locked } = await searchParams;

  const supabase = createSupabaseServerClient();
  const paper = await getPaperBySlug(supabase, paperSlug);
  if (!paper) notFound();

  const user = await currentUser().catch(() => null);
  const [inProgress, lastSubmitted] = user
    ? await Promise.all([
        getLatestInProgressAttempt(supabase, user.id, paper.id),
        getLatestSubmittedAttempt(supabase, user.id, paper.id),
      ])
    : [null, null];

  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "40px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <Link href="/question-bank" style={{ color: "var(--text-4)", textDecoration: "none" }}>Question Bank</Link>›
        <span style={{ color: "var(--text-2)" }}>{paper.title}</span>
      </nav>

      <div style={{ padding: "32px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
        <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", gap: "12px", marginBottom: "14px" }}>
          <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "24px", fontWeight: 800 }}>{paper.title}</h1>
          {paper.is_premium && (
            <span style={{ display: "flex", alignItems: "center", gap: "3px", fontSize: "11px", fontWeight: 700, padding: "4px 10px", borderRadius: "20px", background: "rgba(245,158,11,0.12)", color: "#F59E0B", whiteSpace: "nowrap" }}>
              <Sparkles size={11} /> Premium
            </span>
          )}
        </div>

        <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "16px" }}>
          {paper.focus_tags.map((tag) => (
            <span key={tag} style={{ fontSize: "11px", padding: "3px 10px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-4)" }}>{tag}</span>
          ))}
        </div>

        <p style={{ color: "var(--text-3)", fontSize: "14px", marginBottom: "24px" }}>
          {paper.question_count} questions · {paper.difficulty} difficulty · questions and options are shuffled per attempt.
        </p>

        {error === "1" && (
          <p style={{ fontSize: "13px", color: "#F87171", marginBottom: "16px" }}>⚠️ Something went wrong starting your attempt — please try again.</p>
        )}
        {locked === "1" && (
          <p style={{ fontSize: "13px", color: "#F59E0B", marginBottom: "16px" }}>This paper requires premium access.</p>
        )}

        <div style={{ display: "flex", gap: "12px", flexWrap: "wrap", alignItems: "center" }}>
          <AttemptStatusButtons paperSlug={paperSlug} initial={{ inProgress, lastSubmitted }} />
        </div>
      </div>
    </div>
  );
}
