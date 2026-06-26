"use client";
import { useState, useEffect } from "react";
import { CheckCircle, Circle, Trophy } from "lucide-react";

interface Props {
  academy: string;
  technology: string;
  section: string;
  techName: string;
  accentColor?: string;
}

function getKey(academy: string, technology: string, section: string) {
  return `synfra_progress_${academy}_${technology}_${section}`;
}

export default function ProgressTracker({ academy, technology, section, techName, accentColor = "#3B82F6" }: Props) {
  const [completed, setCompleted] = useState(false);
  const [justDone, setJustDone] = useState(false);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    try {
      const val = localStorage.getItem(getKey(academy, technology, section));
      setCompleted(val === "1");
    } catch {}
  }, [academy, technology, section]);

  function toggle() {
    const next = !completed;
    try {
      if (next) {
        localStorage.setItem(getKey(academy, technology, section), "1");
        setJustDone(true);
        setTimeout(() => setJustDone(false), 2000);
      } else {
        localStorage.removeItem(getKey(academy, technology, section));
      }
      setCompleted(next);
    } catch {}
  }

  if (!mounted) return null;

  return (
    <div style={{
      display: "flex", alignItems: "center", justifyContent: "space-between",
      padding: "12px 16px", borderRadius: "10px", marginBottom: "24px",
      background: completed ? `${accentColor}10` : "var(--bg-2)",
      border: `1px solid ${completed ? accentColor + "40" : "var(--border)"}`,
      transition: "all 0.2s",
    }}>
      <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
        {completed
          ? <CheckCircle size={18} style={{ color: accentColor, flexShrink: 0 }} />
          : <Circle size={18} style={{ color: "var(--text-4)", flexShrink: 0 }} />
        }
        <span style={{ fontSize: "13px", color: completed ? accentColor : "var(--text-3)", fontWeight: completed ? 600 : 400 }}>
          {justDone ? `✨ ${techName} — this section complete!` : completed ? "Section completed" : "Mark this section as complete"}
        </span>
      </div>
      <button
        onClick={toggle}
        style={{
          padding: "5px 14px", borderRadius: "7px", fontSize: "12px", fontWeight: 600,
          border: `1px solid ${accentColor}`,
          background: completed ? accentColor : "transparent",
          color: completed ? "white" : accentColor,
          cursor: "pointer", transition: "all 0.15s", flexShrink: 0,
        }}
        onMouseEnter={e => { if (!completed) (e.currentTarget as HTMLElement).style.background = `${accentColor}15`; }}
        onMouseLeave={e => { if (!completed) (e.currentTarget as HTMLElement).style.background = "transparent"; }}
      >
        {completed ? "✓ Done" : "Mark Complete"}
      </button>
    </div>
  );
}
