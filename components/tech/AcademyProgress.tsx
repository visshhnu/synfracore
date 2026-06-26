"use client";
import { useState, useEffect } from "react";

interface Topic {
  slug: string;
  name: string;
}

interface Props {
  academy: string;
  topics: Topic[];
  sections: string[];
  accentColor?: string;
}

export default function AcademyProgress({ academy, topics, sections, accentColor = "#3B82F6" }: Props) {
  const [progress, setProgress] = useState<Record<string, number>>({});
  const [mounted, setMounted] = useState(false);
  const [expanded, setExpanded] = useState(false);

  useEffect(() => {
    setMounted(true);
    try {
      const p: Record<string, number> = {};
      for (const topic of topics) {
        const done = sections.filter(sec =>
          localStorage.getItem(`synfra_progress_${academy}_${topic.slug}_${sec}`) === "1"
        ).length;
        p[topic.slug] = Math.round((done / sections.length) * 100);
      }
      setProgress(p);
    } catch {}
  }, [academy, topics, sections]);

  if (!mounted) return null;

  const completed = topics.filter(t => (progress[t.slug] ?? 0) === 100).length;
  const inProgress = topics.filter(t => (progress[t.slug] ?? 0) > 0 && (progress[t.slug] ?? 0) < 100).length;
  const totalProgress = topics.length > 0
    ? Math.round(topics.reduce((sum, t) => sum + (progress[t.slug] ?? 0), 0) / topics.length)
    : 0;

  if (totalProgress === 0 && !expanded) return (
    <button
      onClick={() => setExpanded(true)}
      style={{ fontSize: "12px", color: "var(--text-4)", background: "none", border: "1px dashed var(--border)", padding: "6px 14px", borderRadius: "8px", cursor: "pointer", marginBottom: "20px" }}
    >
      * Track your progress in this academy
    </button>
  );

  return (
    <div style={{
      background: "var(--bg-2)", borderRadius: "12px", padding: "16px 20px",
      border: "1px solid var(--border)", marginBottom: "24px",
    }}>
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: "10px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
          <span style={{ fontSize: "16px" }}>*</span>
          <span style={{ fontWeight: 700, fontSize: "14px", color: "var(--text-1)" }}>Your Progress</span>
        </div>
        <span style={{ fontSize: "22px", fontWeight: 800, color: accentColor }}>{totalProgress}%</span>
      </div>

      {/* Overall bar */}
      <div style={{ height: "6px", borderRadius: "3px", background: "var(--border)", marginBottom: "12px" }}>
        <div style={{
          height: "100%", borderRadius: "3px", background: accentColor,
          width: `${totalProgress}%`, transition: "width 0.4s ease",
        }} />
      </div>

      <div style={{ display: "flex", gap: "16px", fontSize: "12px", color: "var(--text-4)", marginBottom: expanded ? "16px" : "0" }}>
        <span>✅ {completed} complete</span>
        <span>~ {inProgress} in progress</span>
        <span>⬜ {topics.length - completed - inProgress} not started</span>
        <button onClick={() => setExpanded(!expanded)} style={{ marginLeft: "auto", background: "none", border: "none", color: "var(--text-4)", cursor: "pointer", fontSize: "11px" }}>
          {expanded ? "▲ collapse" : "▼ details"}
        </button>
      </div>

      {expanded && (
        <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
          {topics.map(topic => {
            const pct = progress[topic.slug] ?? 0;
            return (
              <div key={topic.slug} style={{ display: "flex", alignItems: "center", gap: "10px" }}>
                <span style={{ fontSize: "11px", color: "var(--text-3)", width: "160px", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap", flexShrink: 0 }}>
                  {topic.name}
                </span>
                <div style={{ flex: 1, height: "4px", borderRadius: "2px", background: "var(--border)" }}>
                  <div style={{ height: "100%", borderRadius: "2px", background: pct === 100 ? "#10B981" : accentColor, width: `${pct}%`, transition: "width 0.3s" }} />
                </div>
                <span style={{ fontSize: "10px", color: pct === 100 ? "#10B981" : "var(--text-4)", fontWeight: 600, width: "30px", textAlign: "right" }}>
                  {pct === 100 ? "✓" : `${pct}%`}
                </span>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
