"use client";
import { useState } from "react";
import Link from "next/link";
import { ArrowRight } from "lucide-react";
import type { Academy } from "@/lib/data/academies";

export function AcademyExplorer({ academies }: { academies: Academy[] }) {
  const [selected, setSelected] = useState(0);
  const active = academies[selected];

  return (
    <div className="academy-explorer">
      <div className="academy-list">
        {academies.map((a, i) => {
          const isActive = i === selected;
          return (
            <button
              key={a.slug}
              onClick={() => setSelected(i)}
              className="academy-list-item"
              style={{
                border: `1px solid ${isActive ? a.color + "50" : "var(--border)"}`,
                background: isActive ? a.color + "10" : "var(--bg-1)",
              }}
            >
              <span style={{ fontSize: "20px", flexShrink: 0 }}>{a.icon}</span>
              <span style={{ fontSize: "14px", fontWeight: 600, color: isActive ? a.color : "var(--text-1)" }}>{a.title}</span>
            </button>
          );
        })}
      </div>

      <div className="academy-preview" style={{ border: "1px solid var(--border)", background: "var(--bg-1)" }}>
        <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", gap: "12px", marginBottom: "16px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "14px" }}>
            <span style={{ fontSize: "40px" }}>{active.icon}</span>
            <div>
              <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "20px", color: "var(--text-1)", marginBottom: "2px" }}>{active.title}</h3>
              <div style={{ color: "var(--text-4)", fontSize: "13px" }}>{active.subtitle}</div>
            </div>
          </div>
          <span style={{ background: active.color + "20", color: active.color, fontSize: "11px", fontWeight: 700, padding: "3px 8px", borderRadius: "6px", whiteSpace: "nowrap" }}>
            {active.domains.length} Domains
          </span>
        </div>
        <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.7, marginBottom: "24px" }}>{active.description}</p>
        <Link href={`/academies/${active.slug}`} className="btn-primary" style={{ background: `linear-gradient(135deg, ${active.color}, ${active.color}CC)` }}>
          View Academy <ArrowRight size={16} />
        </Link>
      </div>
    </div>
  );
}
