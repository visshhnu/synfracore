import Link from "next/link";
import type { Metadata } from "next";
import { Sparkles, FileText } from "lucide-react";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getCollectionsBySubject } from "@/lib/supabase/pyqBank";

type Props = { searchParams: Promise<{ subject?: string }> };

// New top-level namespace, deliberately not nested under /question-bank —
// that route tree (start/attempt/results) is built around the MCQ-attempt
// lifecycle (timer, scoring, grading) which this content type has none of.
// Kept minimal (no cross-subject grouping UI yet) since Geography is the
// first subject this feature has any content for — see
// docs/OPERATIONAL-GUIDE.md's UPSC-IAS section for the fuller design.
export async function generateMetadata({ searchParams }: Props): Promise<Metadata> {
  const { subject } = await searchParams;
  return {
    title: subject ? `${subject} PYQ + Model Answers` : "PYQ Bank",
    description: "Real past-year questions with full written model answers, for descriptive/essay-format exams.",
    alternates: { canonical: "https://synfracore.com/pyq-bank" },
  };
}

export default async function PyqBankPage({ searchParams }: Props) {
  const { subject } = await searchParams;
  const supabase = createSupabaseServerClient();
  const collections = subject ? await getCollectionsBySubject(supabase, subject) : [];

  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "40px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <span style={{ color: "var(--text-2)" }}>PYQ Bank</span>
      </nav>

      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, marginBottom: "10px" }}>PYQ Bank</h1>
      <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "620px", lineHeight: 1.7, marginBottom: "32px" }}>
        Real past-year questions with full written model answers — for descriptive, essay-format exams where there&apos;s no single &ldquo;correct option&rdquo; to auto-grade. A reading resource, not a timed attempt.
      </p>

      {collections.length === 0 ? (
        <p style={{ color: "var(--text-4)", fontSize: "13px" }}>No PYQ collections available for this subject yet — check back soon.</p>
      ) : (
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {collections.map((c) => (
            <Link key={c.id} href={`/pyq-bank/${c.slug}`} style={{ textDecoration: "none" }}>
              <div className="card-hover" style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer", height: "100%" }}>
                <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", gap: "10px", marginBottom: "10px" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
                    <FileText size={18} color="var(--text-2)" />
                    <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{c.title}</span>
                  </div>
                  {c.is_premium && (
                    <span style={{ display: "flex", alignItems: "center", gap: "3px", fontSize: "10px", fontWeight: 700, padding: "3px 8px", borderRadius: "20px", background: "rgba(245,158,11,0.12)", color: "#F59E0B", whiteSpace: "nowrap" }}>
                      <Sparkles size={10} /> Premium
                    </span>
                  )}
                </div>
                <div style={{ fontSize: "12px", color: "var(--text-4)" }}>
                  {c.exam_paper === "paper-1" ? "Paper I" : "Paper II"} · {c.year} · {c.question_count} questions
                </div>
              </div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
