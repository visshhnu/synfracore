import Link from "next/link";
import type { Metadata } from "next";
import { currentUser } from "@clerk/nextjs/server";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getPaperCatalog, getLatestInProgressAttempt, getLatestSubmittedAttempt, type QuestionPaper } from "@/lib/supabase/questionBank";
import PaperCard from "@/components/question-bank/PaperCard";
import { examTypeGroupMap } from "@/lib/data/navigation";

type Props = { searchParams: Promise<{ examType?: string }> };

// Dynamic per the ?examType filter so a course-scoped link (e.g. shared to
// a Kubernetes learner) gets a matching page title, not the generic
// "Question Bank" one — same reasoning as app/question-bank/[paperSlug]/page.tsx
// having its own per-paper metadata rather than reusing this page's.
export async function generateMetadata({ searchParams }: Props): Promise<Metadata> {
  const { examType } = await searchParams;
  const meta = examType ? examTypeGroupMap[examType] : undefined;
  if (!meta) {
    return {
      title: "Question Bank",
      description: "Full-length practice exams with instant scoring and detailed explanations.",
      alternates: { canonical: "https://synfracore.com/question-bank" },
    };
  }
  return {
    title: `${meta.label} Practice Exams`,
    description: `Real practice exam papers for ${meta.label}, with instant scoring and detailed explanations for every answer.`,
    // No canonical override to a query-string URL — the canonical page for
    // this content is still the unfiltered catalog; the filter is a view,
    // not a distinct piece of content search engines should index separately.
    alternates: { canonical: "https://synfracore.com/question-bank" },
  };
}

// Public catalog — identical for signed-in and signed-out visitors (product
// decision: "all domains remain explorable" extends here; only STARTING an
// attempt requires sign-in, enforced in startAttemptAction). Per-paper
// in-progress/submitted status is fetched only when signed in.
//
// ?examType=<value> scopes the view to just that exam_type's own papers —
// linked from every course/cert page's "Practice Exams" entry point
// (technologyExamTypeMap- and certificationExamTypeMap-driven, see
// lib/data/navigation.ts) so a learner clicking through from, say, the
// Kubernetes page sees only Kubernetes' 4 papers, not the full 46-paper
// catalog. Visiting /question-bank directly (no param) still shows the
// full grouped view — the param is additive, not a replacement route.
// An unrecognized or empty-result examType falls back to the full
// unfiltered view rather than showing a broken/empty page — same
// never-throws-degrades-gracefully convention as the rest of this
// project's Supabase query functions.
export default async function QuestionBankPage({ searchParams }: Props) {
  const { examType } = await searchParams;
  const supabase = createSupabaseServerClient();
  const papers = await getPaperCatalog(supabase);
  const user = await currentUser().catch(() => null);

  const filterMeta = examType ? examTypeGroupMap[examType] : undefined;
  const filteredPapers = filterMeta ? papers.filter((p) => p.exam_type === examType) : [];
  const isFiltered = !!filterMeta && filteredPapers.length > 0;
  const visiblePapers = isFiltered ? filteredPapers : papers;

  const statusByPaperId = new Map<string, { kind: "in_progress" } | { kind: "submitted"; score: number; total: number }>();
  if (user) {
    await Promise.all(
      visiblePapers.map(async (paper) => {
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
        {isFiltered ? (
          <>
            <Link href="/question-bank" style={{ color: "var(--text-4)", textDecoration: "none" }}>Question Bank</Link>›
            <span style={{ color: "var(--text-2)" }}>{filterMeta!.label}</span>
          </>
        ) : (
          <span style={{ color: "var(--text-2)" }}>Question Bank</span>
        )}
      </nav>

      <div style={{ marginBottom: "36px" }}>
        {isFiltered ? (
          <>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "30px", fontWeight: 800, marginBottom: "10px" }}>{filterMeta!.label} Practice Exams</h1>
            <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "640px", lineHeight: 1.7, marginBottom: "10px" }}>
              {visiblePapers.length} full-length practice exam paper{visiblePapers.length === 1 ? "" : "s"}, with shuffled questions, instant scoring, and detailed explanations for every answer.
            </p>
            <Link href="/question-bank" prefetch={false} style={{ fontSize: "13px", color: "var(--accent)", textDecoration: "none", fontWeight: 600 }}>
              ← View all practice exams
            </Link>
          </>
        ) : (
          <>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "30px", fontWeight: 800, marginBottom: "10px" }}>Question Bank</h1>
            <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "640px", lineHeight: 1.7 }}>
              Full-length, 100-question practice exams with shuffled questions, instant scoring, and detailed explanations for every answer.
            </p>
          </>
        )}
      </div>

      {visiblePapers.length === 0 ? (
        <p style={{ color: "var(--text-4)", fontSize: "13px" }}>No practice papers are available yet — check back soon.</p>
      ) : isFiltered ? (
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "16px" }}>
          {visiblePapers.map((paper) => (
            <PaperCard key={paper.id} paper={paper} status={statusByPaperId.get(paper.id) ?? null} />
          ))}
        </div>
      ) : (
        <div style={{ display: "flex", flexDirection: "column", gap: "40px" }}>
          {groupPapers(visiblePapers).map(([groupName, subGroups]) => (
            <section key={groupName}>
              <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "20px", fontWeight: 800, marginBottom: "18px", paddingBottom: "8px", borderBottom: "1px solid var(--border)" }}>
                {groupName}
              </h2>
              <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
                {subGroups.map(([examLabel, groupPapersForExam]) => (
                  <div key={examLabel}>
                    <h3 style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-3)", marginBottom: "12px" }}>
                      {examLabel} <span style={{ color: "var(--text-4)", fontWeight: 500 }}>({groupPapersForExam.length} paper{groupPapersForExam.length === 1 ? "" : "s"})</span>
                    </h3>
                    <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "16px" }}>
                      {groupPapersForExam.map((paper) => (
                        <PaperCard key={paper.id} paper={paper} status={statusByPaperId.get(paper.id) ?? null} />
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </section>
          ))}
        </div>
      )}
    </div>
  );
}

// Groups the flat paper catalog into [academyGroup, [[examLabel, papers[]], ...]][]
// using examTypeGroupMap (lib/data/navigation.ts) for both levels. Any
// exam_type missing from that map falls into a catch-all "Other" group
// rather than being silently dropped — a real gap to fix in the map, not
// a reason to hide papers from the catalog. Group order is alphabetical
// (stable and needs no manual reordering as new groups/exam_types ship);
// sub-group order follows examTypeGroupMap's own key order.
function groupPapers(papers: QuestionPaper[]): [string, [string, QuestionPaper[]][]][] {
  const byGroup = new Map<string, Map<string, QuestionPaper[]>>();

  for (const paper of papers) {
    const meta = examTypeGroupMap[paper.exam_type] ?? { group: "Other", label: paper.exam_type };
    if (!byGroup.has(meta.group)) byGroup.set(meta.group, new Map());
    const bySubGroup = byGroup.get(meta.group)!;
    if (!bySubGroup.has(meta.label)) bySubGroup.set(meta.label, []);
    bySubGroup.get(meta.label)!.push(paper);
  }

  const examTypeOrder = Object.keys(examTypeGroupMap);
  const orderIndex = (label: string) => {
    const idx = examTypeOrder.findIndex((et) => examTypeGroupMap[et].label === label);
    return idx === -1 ? examTypeOrder.length : idx;
  };

  return [...byGroup.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([groupName, bySubGroup]) => [
      groupName,
      [...bySubGroup.entries()].sort(([a], [b]) => orderIndex(a) - orderIndex(b)),
    ]);
}
