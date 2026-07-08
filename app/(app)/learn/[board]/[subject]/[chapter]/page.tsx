export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { getBoard, getSubject, getChapter } from "@/lib/data/education";
import { redirect } from "next/navigation";
import SectionContent from "@/components/tech/SectionContent";

type Props = { params: Promise<{ board: string; subject: string; chapter: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { board: bSlug, subject: sSlug, chapter: cSlug } = await params;
  const board = getBoard(bSlug);
  const subject = getSubject(bSlug, sSlug);
  const chapter = getChapter(bSlug, sSlug, cSlug);
  if (!board || !subject || !chapter) return { title: "Learn | SynfraCore" };
  return {
    title: `${chapter.title} — ${subject.name} | ${board.shortName} | SynfraCore`,
    description: `${chapter.description}. Topics: ${chapter.topics.join(", ")}. Free study material with PYQs, MCQs, and revision notes.`,
    keywords: [chapter.title, subject.name, board.shortName, "CBSE", "Class 10", "JEE", "GATE", "SynfraCore"],
    alternates: { canonical: `https://synfracore.com/learn/${bSlug}/${sSlug}/${cSlug}` },
    openGraph: {
      title: `${chapter.title} — ${board.shortName} | SynfraCore`,
      description: chapter.description,
      url: `https://synfracore.com/learn/${bSlug}/${sSlug}/${cSlug}`,
    },
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

  return (
    <div style={{ display: "flex", minHeight: "80vh" }}>

      {/* Sidebar — chapter list (desktop only) */}
      <aside className="sidebar-desktop" style={{
        width: "220px", flexShrink: 0,
        borderRight: "1px solid var(--border)",
        background: "var(--bg-1)",
        padding: "16px 10px",
        top: "60px", height: "calc(100vh - 60px)",
      }}>
        <div style={{ marginBottom: "10px", paddingBottom: "10px", borderBottom: "1px solid var(--border)" }}>
          <Link href={`/learn/${bSlug}/${sSlug}`} style={{ color: "var(--text-4)", fontSize: "11px", textDecoration: "none", display: "flex", alignItems: "center", gap: "4px" }}>
            ← {subject.name}
          </Link>
        </div>
        <div style={{ fontSize: "10px", color: "var(--text-4)", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.06em", marginBottom: "6px" }}>
          {subject.chapters.length} Chapters
        </div>
        {chapters.map((c, i) => (
          <Link key={c.slug} href={`/learn/${bSlug}/${sSlug}/${c.slug}`} style={{ textDecoration: "none" }}>
            <div style={{
              display: "flex", gap: "6px", alignItems: "flex-start",
              padding: "6px 8px", borderRadius: "6px", marginBottom: "1px",
              background: c.slug === cSlug ? board.color + "15" : "transparent",
              borderLeft: c.slug === cSlug ? `2px solid ${board.color}` : "2px solid transparent",
              color: c.slug === cSlug ? board.color : "var(--text-3)",
              fontWeight: c.slug === cSlug ? 600 : 400,
              fontSize: "12px", lineHeight: 1.4,
            }}>
              <span style={{ opacity: 0.5, minWidth: "16px", fontSize: "10px", paddingTop: "1px" }}>{i + 1}</span>
              <span>{c.title}</span>
            </div>
          </Link>
        ))}
      </aside>

      {/* Main content */}
      <main className="learn-chapter-main" style={{ flex: 1, minWidth: 0, padding: "24px 28px", maxWidth: "860px" }}>

        {/* Breadcrumb */}
        <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "16px", display: "flex", flexWrap: "wrap", gap: "4px", alignItems: "center" }}>
          <Link href="/learn" style={{ color: "var(--text-4)", textDecoration: "none" }}>Learn</Link>
          <span>›</span>
          <Link href={`/learn/${bSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{board.shortName}</Link>
          <span>›</span>
          <Link href={`/learn/${bSlug}/${sSlug}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>{subject.name}</Link>
          <span>›</span>
          <span style={{ color: "var(--text-2)" }}>{chapter.title}</span>
        </nav>

        {/* Chapter header */}
        <h1 style={{
          fontFamily: "'Plus Jakarta Sans', sans-serif",
          fontWeight: 800, fontSize: "28px",
          marginBottom: "8px", lineHeight: 1.2, color: "var(--text-1)"
        }}>{chapter.title}</h1>
        <p style={{ color: "var(--text-3)", fontSize: "15px", marginBottom: "14px", lineHeight: 1.6 }}>
          {chapter.description}
        </p>

        {/* Topic tags */}
        <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "16px" }}>
          {chapter.topics.map(t => (
            <span key={t} style={{
              fontSize: "11px", padding: "3px 10px", borderRadius: "20px",
              background: board.color + "15", color: board.color,
              fontWeight: 600, border: `1px solid ${board.color}25`
            }}>{t}</span>
          ))}
        </div>

        {/* PYQ badge */}
        {chapter.pyqYears && chapter.pyqYears.length > 0 && (
          <div style={{
            display: "inline-flex", alignItems: "center", gap: "8px",
            marginBottom: "24px", padding: "8px 14px", borderRadius: "8px",
            background: "rgba(16,185,129,0.08)", border: "1px solid rgba(16,185,129,0.2)"
          }}>
            <span style={{ color: "#10B981", fontWeight: 700, fontSize: "12px" }}>📋 PYQs Available:</span>
            <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
              {chapter.pyqYears.map(y => (
                <span key={y} style={{
                  fontSize: "11px", padding: "1px 6px", borderRadius: "4px",
                  background: "rgba(16,185,129,0.15)", color: "#10B981", fontWeight: 600
                }}>{y}</span>
              ))}
            </div>
          </div>
        )}

        {/* Mobile chapter navigation */}
        <div className="mobile-chapter-nav" style={{ marginBottom: "20px", display: "none" }}>
          <details style={{ border: "1px solid var(--border)", borderRadius: "10px", padding: "10px 14px" }}>
            <summary style={{ cursor: "pointer", fontSize: "13px", fontWeight: 600, color: "var(--text-2)", userSelect: "none" }}>
              📚 All chapters in {subject.name} ({chapters.length})
            </summary>
            <div style={{ marginTop: "10px", display: "flex", flexDirection: "column", gap: "2px" }}>
              {chapters.map((c, i) => (
                <Link key={c.slug} href={`/learn/${bSlug}/${sSlug}/${c.slug}`} style={{ textDecoration: "none" }}>
                  <div style={{
                    padding: "6px 10px", borderRadius: "6px", fontSize: "13px",
                    background: c.slug === cSlug ? board.color + "15" : "transparent",
                    color: c.slug === cSlug ? board.color : "var(--text-3)",
                    fontWeight: c.slug === cSlug ? 600 : 400,
                  }}>
                    {i + 1}. {c.title}
                  </div>
                </Link>
              ))}
            </div>
          </details>
        </div>

        <style>{`.mobile-chapter-nav { display: none; } @media(max-width:768px){.mobile-chapter-nav{display:block!important;}}`}</style>

        {/* Chapter content — rendered from pre-written markdown */}
        <SectionContent
          academy="education"
          technology={`${bSlug}/${sSlug}`}
          section={cSlug}
          techName={chapter.title}
          techIcon={subject.icon}
          sectionLabel={chapter.title}
          accentColor={board.color}
        />

        {/* Prev / Next navigation */}
        <div style={{
          display: "flex", justifyContent: "space-between",
          marginTop: "48px", paddingTop: "20px",
          borderTop: "1px solid var(--border)"
        }}>
          {prev ? (
            <Link href={`/learn/${bSlug}/${sSlug}/${prev.slug}`} style={{
              textDecoration: "none", color: "var(--text-3)", fontSize: "14px",
              display: "flex", alignItems: "center", gap: "6px"
            }}>← {prev.title}</Link>
          ) : <div />}
          {next ? (
            <Link href={`/learn/${bSlug}/${sSlug}/${next.slug}`} style={{
              textDecoration: "none", color: board.color,
              fontWeight: 600, fontSize: "14px",
              display: "flex", alignItems: "center", gap: "6px"
            }}>{next.title} →</Link>
          ) : <div />}
        </div>

      </main>
    </div>
  );
}
