import { roadmaps } from "@/lib/data/navigation";
import { roadmapDetails } from "@/lib/data/roadmapDetails";
import { notFound } from "next/navigation";
import Link from "next/link";
import { Clock, BookOpen, Target, TrendingUp, Users, Briefcase } from "lucide-react";
import { pageMetadata } from "@/lib/seo/metadata";
import RoadmapTree from "@/components/roadmap/RoadmapTree";

type Props = { params: Promise<{ slug: string }> };


export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const rm = roadmaps.find(r => r.slug === slug);
  if (!rm) return pageMetadata({ title: "Roadmap", description: "Career roadmap not found.", path: `/roadmaps/${slug}` });
  const detail = roadmapDetails[slug];
  return pageMetadata({
    title: `${rm.title} Roadmap`,
    description: detail?.description || `Complete learning roadmap for ${rm.title}`,
    path: `/roadmaps/${slug}`,
  });
}

export default async function RoadmapDetailPage({ params }: Props) {
  const { slug } = await params;
  const rm = roadmaps.find(r => r.slug === slug);
  if (!rm) notFound();
  const detail = roadmapDetails[slug];
  if (!detail) notFound();
  const color = detail.color;

  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "48px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "28px", display: "flex", gap: "6px", alignItems: "center" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>
        <span>›</span>
        <Link href="/roadmaps" style={{ color: "var(--text-4)", textDecoration: "none" }}>Roadmaps</Link>
        <span>›</span>
        <span style={{ color: "var(--text-2)" }}>{rm.title}</span>
      </nav>

      {/* Hero */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "20px", padding: "40px", marginBottom: "32px", borderTop: `4px solid ${color}` }}>
        <div style={{ display: "flex", gap: "20px", alignItems: "flex-start", flexWrap: "wrap" }}>
          <span style={{ fontSize: "52px" }}>{rm.icon}</span>
          <div style={{ flex: 1, minWidth: "260px" }}>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "clamp(22px,4vw,34px)", fontWeight: 800, marginBottom: "10px" }}>{rm.title}</h1>
            <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.6, marginBottom: "16px" }}>{detail.description}</p>
            <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
              <span style={{ background: color + "18", color, padding: "5px 14px", borderRadius: "10px", fontSize: "13px", fontWeight: 700 }}>
                {rm.duration}
              </span>
              <span style={{ background: "#10B98118", color: "#10B981", padding: "5px 14px", borderRadius: "10px", fontSize: "13px", fontWeight: 700 }}>
                {detail.salaryRange}
              </span>
            </div>
          </div>
        </div>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "20px", marginBottom: "28px" }}>
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "10px", color }}>Why this path</div>
          <p style={{ color: "var(--text-3)", fontSize: "13px", lineHeight: 1.6, margin: 0 }}>{detail.whyChoose}</p>
        </div>
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "10px", color }}>Job titles</div>
          <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
            {detail.jobTitles.slice(0, 4).map(t => (
              <div key={t} style={{ fontSize: "13px", color: "var(--text-3)", display: "flex", alignItems: "center", gap: "7px" }}>
                <div style={{ width: "5px", height: "5px", borderRadius: "50%", background: color, flexShrink: 0 }} />
                {t}
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Step-by-step roadmap — each step IS the link into its content page
          (via s.techLink), rather than a separate static list duplicated by
          a second "Start learning" card grid immediately below it (that
          redundant section existed only because these rows used to be
          plain, non-interactive text — fixed 2026-09-01). Deliberately
          keeps the shorter step `label` as the display text rather than
          switching to techLink.name — roughly 15% of steps across all 26
          roadmaps have a label that reads better as a sequential narrative
          step than the fuller content-page title it links to (e.g. step
          "Monitoring" links to the page titled "Monitoring — Prometheus"),
          confirmed by diffing every step's label against its techLink.name
          before this change. */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px", marginBottom: "24px" }}>
        <div style={{ fontWeight: 700, fontSize: "16px", marginBottom: "24px", color }}>Step-by-step roadmap</div>
        <RoadmapTree steps={detail.steps} color={color} />
      </div>

      {/* Employers + Timeline */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "16px" }}>
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px" }}>
          <div style={{ fontWeight: 700, fontSize: "13px", marginBottom: "10px", color }}>Top employers</div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
            {detail.topEmployers.map(e => (
              <span key={e} style={{ fontSize: "11px", padding: "3px 9px", borderRadius: "12px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-3)" }}>{e}</span>
            ))}
          </div>
        </div>
        <div style={{ background: color + "08", border: `1px solid ${color}30`, borderRadius: "14px", padding: "20px" }}>
          <div style={{ fontWeight: 700, fontSize: "13px", marginBottom: "8px", color }}>Timeline reality check</div>
          <p style={{ fontSize: "12px", color: "var(--text-3)", lineHeight: 1.6, margin: 0 }}>{detail.timelineNote}</p>
        </div>
      </div>

      <div style={{ marginTop: "24px", textAlign: "center" }}>
        <Link href="/roadmaps" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none" }}>
          ← All roadmaps
        </Link>
      </div>
    </div>
  );
}
