export const runtime = "edge";
import { roadmaps } from "@/lib/data/navigation";
import { roadmapDetails } from "@/lib/data/roadmapDetails";
import { notFound } from "next/navigation";
import Link from "next/link";
import { Clock, ArrowRight, BookOpen, Target, TrendingUp, Users, Briefcase } from "lucide-react";

type Props = { params: Promise<{ slug: string }> };


export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const rm = roadmaps.find(r => r.slug === slug);
  if (!rm) return { title: "Roadmap | SynfraCore" };
  const detail = roadmapDetails[slug];
  return {
    title: `${rm.title} Roadmap | SynfraCore`,
    description: detail?.description || `Complete learning roadmap for ${rm.title}`,
  };
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

      {/* Steps */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px", marginBottom: "24px" }}>
        <div style={{ fontWeight: 700, fontSize: "16px", marginBottom: "24px", color }}>Step-by-step roadmap</div>
        <div style={{ display: "flex", flexDirection: "column", gap: "0" }}>
          {detail.steps.map((s, i) => (
            <div key={s.label} style={{ display: "flex", gap: "16px" }}>
              <div style={{ display: "flex", flexDirection: "column", alignItems: "center", flexShrink: 0, width: "32px" }}>
                <div style={{ width: "32px", height: "32px", borderRadius: "50%", background: i === 0 ? color : "var(--bg-1)", border: `2px solid ${i === 0 ? color : "var(--border)"}`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "12px", fontWeight: 700, color: i === 0 ? "white" : "var(--text-4)", flexShrink: 0 }}>
                  {i + 1}
                </div>
                {i < detail.steps.length - 1 && <div style={{ width: "2px", flex: 1, background: "var(--border)", minHeight: "20px" }} />}
              </div>
              <div style={{ paddingBottom: "20px", flex: 1 }}>
                <div style={{ fontWeight: i === 0 ? 700 : 500, fontSize: "14px", color: i === 0 ? "var(--text-1)" : "var(--text-2)", paddingTop: "6px" }}>
                  {s.label}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Content links */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px", marginBottom: "24px" }}>
        <div style={{ fontWeight: 700, fontSize: "16px", marginBottom: "18px", color }}>Start learning — content pages</div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(180px, 1fr))", gap: "8px" }}>
          {detail.steps.map(s => s.techLink).map(t => (
            <Link key={`${t.academy}-${t.slug}-${t.name}`} href={`/academies/${t.academy}/${t.slug}/${t.section || "overview"}`} style={{ textDecoration: "none" }}>
              <div style={{ padding: "10px 14px", borderRadius: "8px", border: "1px solid var(--border)", fontSize: "13px", color: "var(--text-2)", fontWeight: 500, display: "flex", alignItems: "center", justifyContent: "space-between", gap: "6px" }}>
                {t.name} <ArrowRight size={12} />
              </div>
            </Link>
          ))}
        </div>
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
