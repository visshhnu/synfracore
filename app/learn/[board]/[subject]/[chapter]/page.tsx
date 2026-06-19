export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { getBoard, getSubject, getChapter } from "@/lib/data/education";
import { redirect } from "next/navigation";

type Props = { params: Promise<{ board: string; subject: string; chapter: string }> };

const sections = [
  { slug: "overview",      label: "Overview",          icon: "📖", desc: "Introduction and why this chapter matters" },
  { slug: "concepts",      label: "Core Concepts",     icon: "💡", desc: "All key concepts explained with examples" },
  { slug: "examples",      label: "Solved Examples",   icon: "✏️",  desc: "Step-by-step solved problems" },
  { slug: "pyqs",          label: "Previous Year Qs",  icon: "📋", desc: "PYQ analysis with concept mapping" },
  { slug: "mcqs",          label: "MCQ Practice",      icon: "🧪", desc: "Easy → Medium → Hard practice questions" },
  { slug: "revision",      label: "Revision Notes",    icon: "🔄", desc: "Quick revision — formulas, key points, mind map" },
  { slug: "faqs",          label: "FAQs",              icon: "❓", desc: "Commonly asked doubts answered" },
];

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { board: bSlug, subject: sSlug, chapter: cSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  const chapter = getChapter(bSlug, sSlug, cSlug);
  if (!board || !subject || !chapter) return { title: "Learn | SynfraCore" };
  return {
    title: `${chapter.title} — ${subject.name} | ${board.shortName}`,
    description: `${chapter.description}. Topics: ${chapter.topics.join(", ")}`,
    alternates: { canonical: `https://synfracore.com/learn/${bSlug}/${sSlug}/${cSlug}` },
  };
}

export default async function ChapterPage({ params }: Props) {
  const { board: bSlug, subject: sSlug, chapter: cSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  const chapter = getChapter(bSlug, sSlug, cSlug);
  if (!board || !subject || !chapter) redirect(`/learn/${bSlug}/${sSlug}`);

  // Find prev/next chapters
  const chapters = subject.chapters;
  const idx = chapters.findIndex(c => c.slug === cSlug);
  const prev = idx > 0 ? chapters[idx - 1] : null;
  const next = idx < chapters.length - 1 ? chapters[idx + 1] : null;

  return (
    <div style={{ display: "flex", gap: "0", minHeight: "80vh" }}>

      {/* Sidebar — chapter list */}
      <aside className="sidebar-desktop" style={{ width: "240px", flexShrink: 0, borderRight: "1px solid var(--border)", background: "var(--bg-1)", padding: "20px 14px", position: "sticky", top: 0, height: "100vh", overflowY: "auto" }}>
        <div style={{ marginBottom: "14px", paddingBottom: "12px", borderBottom: "1px solid var(--border)" }}>
          <Link href={`/learn/${bSlug}/${sSlug}`} style={{ color: "var(--text-4)", fontSize: "11px", textDecoration: "none" }}>← {subject.name}</Link>
        </div>
        <div style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.06em", marginBottom: "8px" }}>Chapters</div>
        {chapters.map((c, i) => (
          <Link key={c.slug} href={`/learn/${bSlug}/${sSlug}/${c.slug}`} style={{ textDecoration: "none" }}>
            <div style={{ display: "flex", gap: "8px", padding: "7px 8px", borderRadius: "6px", marginBottom: "2px", background: c.slug === cSlug ? "var(--bg-2)" : "transparent", color: c.slug === cSlug ? board.color : "var(--text-3)", fontWeight: c.slug === cSlug ? 600 : 400, fontSize: "13px" }}>
              <span style={{ opacity: 0.5, minWidth: "18px" }}>{i + 1}.</span>
              <span>{c.title}</span>
            </div>
          </Link>
        ))}
      </aside>

      {/* Main content */}
      <main style={{ flex: 1, minWidth: 0, padding: "32px 28px" }}>

        {/* Breadcrumb */}
        <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "20px" }}>
          <Link href="/learn" style={{ color: "var(--text-4)", textDecoration: "none" }}>Learn</Link> {" / "}
          <Link href={`/learn/${bSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{board.shortName}</Link> {" / "}
          <Link href={`/learn/${bSlug}/${sSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{subject.name}</Link> {" / "}
          <span style={{ color: "var(--text-2)" }}>{chapter.title}</span>
        </nav>

        {/* Chapter header */}
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "28px", marginBottom: "8px", lineHeight: 1.2 }}>{chapter.title}</h1>
        <p style={{ color: "var(--text-3)", fontSize: "15px", marginBottom: "16px" }}>{chapter.description}</p>

        {/* Topics tags */}
        <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "28px" }}>
          {chapter.topics.map(t => (
            <span key={t} style={{ fontSize: "12px", padding: "3px 10px", borderRadius: "20px", background: board.color + "15", color: board.color, fontWeight: 600, border: `1px solid ${board.color}30` }}>
              {t}
            </span>
          ))}
        </div>

        {/* PYQ years badge */}
        {chapter.pyqYears && (
          <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "32px", padding: "12px 16px", borderRadius: "10px", background: "rgba(16,185,129,0.08)", border: "1px solid rgba(16,185,129,0.2)" }}>
            <span style={{ color: "#10B981", fontWeight: 700, fontSize: "13px" }}>📋 PYQs Available:</span>
            <div style={{ display: "flex", gap: "6px" }}>
              {chapter.pyqYears.map(y => (
                <span key={y} style={{ fontSize: "12px", padding: "1px 8px", borderRadius: "4px", background: "rgba(16,185,129,0.15)", color: "#10B981", fontWeight: 600 }}>{y}</span>
              ))}
            </div>
          </div>
        )}

        {/* Section cards — what's inside this chapter */}
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "16px" }}>What you will study</h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(240px, 1fr))", gap: "12px", marginBottom: "40px" }}>
          {sections.map(sec => (
            <div key={sec.slug} style={{ padding: "16px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
              <div style={{ fontSize: "22px", marginBottom: "8px" }}>{sec.icon}</div>
              <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "4px" }}>{sec.label}</div>
              <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{sec.desc}</div>
            </div>
          ))}
        </div>

        {/* Content placeholder — will fill with actual content */}
        <div style={{ background: "linear-gradient(135deg,rgba(59,130,246,0.06),rgba(139,92,246,0.06))", border: "1px dashed var(--border)", borderRadius: "14px", padding: "40px", textAlign: "center", marginBottom: "40px" }}>
          <div style={{ fontSize: "36px", marginBottom: "12px" }}>📖</div>
          <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "8px" }}>
            Content Being Prepared
          </h3>
          <p style={{ color: "var(--text-4)", fontSize: "14px", margin: "0 0 16px", maxWidth: "400px", marginLeft: "auto", marginRight: "auto" }}>
            Full chapter content for <strong>{chapter.title}</strong> is being written — concepts, examples, PYQs, MCQs, and revision notes.
          </p>
          <span style={{ display: "inline-block", background: board.color + "20", color: board.color, fontSize: "12px", fontWeight: 600, padding: "4px 12px", borderRadius: "6px" }}>
            Coming Soon
          </span>
        </div>

        {/* Prev / Next */}
        <div style={{ display: "flex", justifyContent: "space-between", paddingTop: "24px", borderTop: "1px solid var(--border)" }}>
          {prev ? (
            <Link href={`/learn/${bSlug}/${sSlug}/${prev.slug}`} style={{ textDecoration: "none", color: "var(--text-3)", fontSize: "14px" }}>
              ← {prev.title}
            </Link>
          ) : <div />}
          {next ? (
            <Link href={`/learn/${bSlug}/${sSlug}/${next.slug}`} style={{ textDecoration: "none", color: board.color, fontWeight: 600, fontSize: "14px" }}>
              {next.title} →
            </Link>
          ) : <div />}
        </div>

      </main>
    </div>
  );
}
