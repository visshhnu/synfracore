import Link from "next/link";
import { BookOpen, Sparkles } from "lucide-react";
import type { QuestionPaper } from "@/lib/supabase/questionBank";

type Props = {
  paper: QuestionPaper;
  status?: { kind: "in_progress" } | { kind: "submitted"; score: number; total: number } | null;
};

// Presentational, no interactivity — a styled <Link> into the paper's
// landing page. Identical for signed-in/signed-out visitors (product
// decision: the catalog stays public); `status` (in-progress/submitted) is
// only ever passed for a signed-in caller, so it degrades to the plain
// "Start" state automatically when absent.
export default function PaperCard({ paper, status }: Props) {
  return (
    <Link href={`/question-bank/${paper.slug}`} style={{ textDecoration: "none" }}>
      <div className="card-hover" style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer", height: "100%" }}>
        <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", gap: "10px", marginBottom: "10px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
            <BookOpen size={18} color="var(--text-2)" />
            <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{paper.title}</span>
          </div>
          {paper.is_premium && (
            <span style={{ display: "flex", alignItems: "center", gap: "3px", fontSize: "10px", fontWeight: 700, padding: "3px 8px", borderRadius: "20px", background: "rgba(245,158,11,0.12)", color: "#F59E0B", whiteSpace: "nowrap" }}>
              <Sparkles size={10} /> Premium
            </span>
          )}
        </div>

        <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "12px" }}>
          {paper.focus_tags.slice(0, 4).map((tag) => (
            <span key={tag} style={{ fontSize: "11px", padding: "2px 8px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-4)" }}>{tag}</span>
          ))}
        </div>

        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", fontSize: "12px", color: "var(--text-4)" }}>
          <span>{paper.question_count} questions · {paper.difficulty}</span>
          {status?.kind === "in_progress" && <span style={{ color: "#3B82F6", fontWeight: 700 }}>Continue →</span>}
          {status?.kind === "submitted" && <span style={{ color: "#10B981", fontWeight: 700 }}>{status.score}/{status.total} →</span>}
        </div>
      </div>
    </Link>
  );
}
