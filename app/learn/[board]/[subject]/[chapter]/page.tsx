export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { getBoard, getSubject, getChapter } from "@/lib/data/education";
import { redirect } from "next/navigation";
import SectionContent from "@/components/tech/SectionContent";

type Props = { params: Promise<{ board: string; subject: string; chapter: string }> };

const sections = [
  { slug: "overview",   label: "Overview",         icon: "📖" },
  { slug: "concepts",   label: "Core Concepts",    icon: "💡" },
  { slug: "examples",   label: "Solved Examples",  icon: "✏️"  },
  { slug: "pyqs",       label: "PYQ Practice",     icon: "📋" },
  { slug: "mcqs",       label: "MCQ Practice",     icon: "🧪" },
  { slug: "revision",   label: "Revision Notes",   icon: "🔄" },
  { slug: "faqs",       label: "FAQs",             icon: "❓" },
];

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { board: bSlug, subject: sSlug, chapter: cSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  const chapter = getChapter(bSlug, sSlug, cSlug);
  if (!board || !subject || !chapter) return { title: "Learn | SynfraCore" };
  return {
    title: `${chapter.title} — ${subject.name} | ${board.shortName}`,
    description: `${chapter.description}. Topics covered: ${chapter.topics.join(", ")}`,
    keywords: [chapter.title, subject.name, board.shortName, "CBSE", "Class 10", "SynfraCore"],
    alternates: { canonical: `https://synfracore.com/learn/${bSlug}/${sSlug}/${cSlug}` },
  };
}

export default async function ChapterPage({ params }: Props) {
  const { board: bSlug, subject: sSlug, chapter: cSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  const chapter = getChapter(bSlug, sSlug, cSlug);
  if (!board || !subject || !chapter) redirect(`/learn/${bSlug}/${sSlug}`);

  const chapters = subject.chapters;
  const idx = chapters.findIndex(c => c.slug === cSlug);
  const prev = idx > 0 ? chapters[idx - 1] : null;
  const next = idx < chapters.length - 1 ? chapters[idx + 1] : null;

  // Content key for registry: education/{board}/{subject}/{chapter}
  const contentKey = `${bSlug}/${sSlug}/${cSlug}`;

  return (
    <div style={{ display: "flex", gap: "0", minHeight: "80vh" }}>

      {/* Sidebar */}
      <aside className="sidebar-desktop" style={{ width: "230px", flexShrink: 0, borderRight: "1px solid var(--border)", background: "var(--bg-1)", padding: "18px 12px", position: "sticky", top: 0, height: "100vh", overflowY: "auto" }}>
        <div style={{ marginBottom: "12px", paddingBottom: "10px", borderBottom: "1px solid var(--border)" }}>
          <Link href={`/learn/${bSlug}/${sSlug}`} style={{ color: "var(--text-4)", fontSize: "11px", textDecoration: "none" }}>← {subject.name}</Link>
        </div>
        <div style={{ fontSize: "10px", color: "var(--text-4)", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.06em", marginBottom: "6px" }}>Chapters</div>
        {chapters.map((c, i) => (
          <Link key={c.slug} href={`/learn/${bSlug}/${sSlug}/${c.slug}`} style={{ textDecoration: "none" }}>
            <div style={{ display: "flex", gap: "6px", padding: "6px 8px", borderRadius: "6px", marginBottom: "2px", background: c.slug === cSlug ? "var(--bg-2)" : "transparent", color: c.slug === cSlug ? board.color : "var(--text-3)", fontWeight: c.slug === cSlug ? 600 : 400, fontSize: "12px" }}>
              <span style={{ opacity: 0.5, minWidth: "16px", fontSize: "11px" }}>{i + 1}.</span>
              <span>{c.title}</span>
            </div>
          </Link>
        ))}
      </aside>

      {/* Main content */}
      <main style={{ flex: 1, minWidth: 0, padding: "28px 24px" }}>

        {/* Breadcrumb */}
        <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "18px" }}>
          <Link href="/learn" style={{ color: "var(--text-4)", textDecoration: "none" }}>Learn</Link> {" / "}
          <Link href={`/learn/${bSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{board.shortName}</Link> {" / "}
          <Link href={`/learn/${bSlug}/${sSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{subject.name}</Link> {" / "}
          <span style={{ color: "var(--text-2)" }}>{chapter.title}</span>
        </nav>

        {/* Chapter header */}
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "26px", marginBottom: "8px", lineHeight: 1.2 }}>{chapter.title}</h1>
        <p style={{ color: "var(--text-3)", fontSize: "14px", marginBottom: "14px" }}>{chapter.description}</p>

        {/* Topics */}
        <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "20px" }}>
          {chapter.topics.map(t => (
            <span key={t} style={{ fontSize: "11px", padding: "3px 8px", borderRadius: "20px", background: board.color + "15", color: board.color, fontWeight: 600 }}>{t}</span>
          ))}
        </div>

        {/* PYQ badge */}
        {chapter.pyqYears && (
          <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", marginBottom: "24px", padding: "8px 14px", borderRadius: "8px", background: "rgba(16,185,129,0.08)", border: "1px solid rgba(16,185,129,0.2)" }}>
            <span style={{ color: "#10B981", fontWeight: 700, fontSize: "12px" }}>📋 PYQs:</span>
            {chapter.pyqYears.map(y => (
              <span key={y} style={{ fontSize: "11px", padding: "1px 6px", borderRadius: "4px", background: "rgba(16,185,129,0.15)", color: "#10B981", fontWeight: 600 }}>{y}</span>
            ))}
          </div>
        )}

        {/* Actual chapter content rendered from markdown */}
        <SectionContent
          academy={`education`}
          technology={`${bSlug}/${sSlug}`}
          section={cSlug}
          techName={chapter.title}
          techIcon={subject.icon}
          sectionLabel={chapter.title}
          accentColor={board.color}
        />

        {/* Prev / Next */}
        <div style={{ display: "flex", justifyContent: "space-between", marginTop: "48px", paddingTop: "20px", borderTop: "1px solid var(--border)" }}>
          {prev ? (
            <Link href={`/learn/${bSlug}/${sSlug}/${prev.slug}`} style={{ textDecoration: "none", color: "var(--text-3)", fontSize: "14px" }}>← {prev.title}</Link>
          ) : <div />}
          {next ? (
            <Link href={`/learn/${bSlug}/${sSlug}/${next.slug}`} style={{ textDecoration: "none", color: board.color, fontWeight: 600, fontSize: "14px" }}>{next.title} →</Link>
          ) : <div />}
        </div>

      </main>
    </div>
  );
}
