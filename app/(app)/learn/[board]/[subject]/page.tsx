export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { getBoard, getSubject } from "@/lib/data/education";
import { redirect } from "next/navigation";

type Props = { params: Promise<{ board: string; subject: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { board: bSlug, subject: sSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  if (!board || !subject) return { title: "Learn | SynfraCore" };
  return {
    title: `${subject.name} — ${board.shortName}`,
    description: subject.description,
    alternates: { canonical: `https://synfracore.com/learn/${bSlug}/${sSlug}` },
  };
}

export default async function SubjectPage({ params }: Props) {
  const { board: bSlug, subject: sSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  if (!board || !subject) redirect(`/learn/${bSlug}`);

  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "40px 24px" }}>

      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link> {" / "}
        <Link href="/learn" style={{ color: "var(--text-4)", textDecoration: "none" }}>Learn</Link> {" / "}
        <Link href={`/learn/${bSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{board.shortName}</Link> {" / "}
        <span style={{ color: "var(--text-2)" }}>{subject.name}</span>
      </nav>

      {/* Header */}
      <div style={{ marginBottom: "36px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "10px" }}>
          <span style={{ fontSize: "36px" }}>{subject.icon}</span>
          <div>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "28px", margin: 0 }}>{subject.name}</h1>
            <span style={{ color: board.color, fontWeight: 600, fontSize: "13px" }}>{board.name}</span>
          </div>
        </div>
        <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "640px", lineHeight: 1.7 }}>{subject.description}</p>
      </div>

      {/* Chapter List */}
      <div>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "16px" }}>
          {subject.chapters.length} Chapters
        </h2>
        <div style={{ display: "flex", flexDirection: "column", gap: "10px" }}>
          {subject.chapters.map((chapter, idx) => (
            <Link key={chapter.slug} href={`/learn/${bSlug}/${sSlug}/${chapter.slug}`} style={{ textDecoration: "none" }}>
              <div style={{ display: "flex", alignItems: "flex-start", gap: "16px", padding: "18px 20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }} className="card-hover">
                <span style={{ fontFamily: "'JetBrains Mono', monospace", fontSize: "12px", color: board.color, fontWeight: 700, minWidth: "28px", paddingTop: "2px" }}>
                  {String(idx + 1).padStart(2, "0")}
                </span>
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "4px" }}>{chapter.title}</div>
                  <div style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "8px" }}>{chapter.description}</div>
                  <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                    {chapter.topics.slice(0, 4).map(t => (
                      <span key={t} style={{ fontSize: "11px", padding: "2px 6px", borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-4)" }}>{t}</span>
                    ))}
                    {chapter.topics.length > 4 && (
                      <span style={{ fontSize: "11px", color: "var(--text-4)" }}>+{chapter.topics.length - 4} more</span>
                    )}
                  </div>
                </div>
                <div style={{ textAlign: "right", flexShrink: 0 }}>
                  {chapter.pyqYears && (
                    <div style={{ fontSize: "11px", color: "#10B981", fontWeight: 600 }}>PYQs Available</div>
                  )}
                  <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "2px" }}>{chapter.topics.length} topics</div>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

    </div>
  );
}
