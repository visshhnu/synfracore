export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { getBoard } from "@/lib/data/education";
import { redirect } from "next/navigation";

type Props = { params: Promise<{ board: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { board: slug } = await params;
  const board = getBoard(slug);
  if (!board) return { title: "Learn | SynfraCore" };
  return {
    title: `${board.name} Preparation`,
    description: board.description,
    alternates: { canonical: `https://synfracore.com/learn/${slug}` },
  };
}

export default async function BoardPage({ params }: Props) {
  const { board: slug } = await params;
  const board = getBoard(slug);
  if (!board) redirect("/learn");

  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "40px 24px" }}>

      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link> {" / "}
        <Link href="/learn" style={{ color: "var(--text-4)", textDecoration: "none" }}>Learn</Link> {" / "}
        <span style={{ color: "var(--text-2)" }}>{board.shortName}</span>
      </nav>

      {/* Header */}
      <div style={{ marginBottom: "40px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "12px" }}>
          <span style={{ fontSize: "44px" }}>{board.icon}</span>
          <div>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "30px", marginBottom: "4px" }}>{board.name}</h1>
            <span style={{ background: board.color + "20", color: board.color, fontSize: "13px", fontWeight: 600, padding: "3px 10px", borderRadius: "6px" }}>{board.tagline}</span>
          </div>
        </div>
        <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "680px", lineHeight: 1.7 }}>{board.description}</p>

        {/* Study Phases */}
        <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginTop: "16px" }}>
          {board.phases.map((p, i) => (
            <span key={p} style={{ display: "flex", alignItems: "center", gap: "6px", fontSize: "12px", padding: "5px 12px", borderRadius: "20px", background: "var(--bg-2)", color: "var(--text-3)", border: "1px solid var(--border)" }}>
              <span style={{ color: board.color, fontWeight: 700 }}>{i + 1}.</span> {p}
            </span>
          ))}
        </div>
      </div>

      {/* Subjects */}
      <div>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "16px" }}>Subjects</h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "14px" }}>
          {board.subjects.map(subject => (
            <Link key={subject.slug} href={`/learn/${slug}/${subject.slug}`} style={{ textDecoration: "none" }}>
              <div style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }} className="card-hover">
                <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
                  <span style={{ fontSize: "26px" }}>{subject.icon}</span>
                  <span style={{ fontWeight: 700, fontSize: "15px" }}>{subject.name}</span>
                </div>
                <p style={{ color: "var(--text-4)", fontSize: "13px", margin: "0 0 10px", lineHeight: 1.5 }}>{subject.description}</p>
                <div style={{ fontSize: "12px", color: "var(--text-4)" }}>
                  {subject.chapters.length} chapters
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

    </div>
  );
}
