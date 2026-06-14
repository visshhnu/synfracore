"use client";
import { useState, useMemo } from "react";
import Link from "next/link";
import { Search, ArrowRight } from "lucide-react";
import { academies } from "@/lib/data/academies";

const SECTIONS = ["overview","fundamentals","intermediate","advanced","labs","projects","interview","certification","cheatsheets","roadmap"];

type Result = { academy: string; tech: string; techName: string; section: string; url: string };

function buildIndex(): Result[] {
  const results: Result[] = [];
  for (const academy of academies) {
    for (const tech of (academy.technologies || [])) {
      for (const section of SECTIONS) {
        results.push({
          academy: academy.slug,
          tech: tech.slug,
          techName: tech.name,
          section,
          url: `/academies/${academy.slug}/${tech.slug}/${section}`,
        });
      }
    }
  }
  return results;
}

const ALL_RESULTS = buildIndex();

const SECTION_LABELS: Record<string, string> = {
  overview: "Overview", fundamentals: "Fundamentals", intermediate: "Intermediate",
  advanced: "Advanced", labs: "Labs", projects: "Projects",
  interview: "Interview Q&A", certification: "Certification", cheatsheets: "Cheatsheet", roadmap: "Roadmap",
};

const ACADEMY_COLORS: Record<string, string> = {
  devops: "#3B82F6", cloud: "#F59E0B", databases: "#10B981",
  ai: "#8B5CF6", data: "#06B6D4", security: "#EF4444",
  healthcare: "#F97316", essentials: "#84CC16", education: "#EC4899", exams: "#A855F7",
};

export default function SearchPage() {
  const [query, setQuery] = useState("");

  const results = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (q.length < 2) return [];
    return ALL_RESULTS.filter(r =>
      r.techName.toLowerCase().includes(q) ||
      r.tech.toLowerCase().includes(q) ||
      r.section.toLowerCase().includes(q) ||
      r.academy.toLowerCase().includes(q)
    ).slice(0, 30);
  }, [query]);

  // Group by tech
  const grouped = useMemo(() => {
    const g: Record<string, Result[]> = {};
    for (const r of results) {
      const key = `${r.academy}/${r.tech}`;
      if (!g[key]) g[key] = [];
      g[key].push(r);
    }
    return g;
  }, [results]);

  const totalTechs = useMemo(() => new Set(ALL_RESULTS.map(r => r.tech)).size, []);

  return (
    <div style={{ maxWidth: "800px", margin: "0 auto", padding: "56px 24px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,4vw,44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "8px" }}>
        Search
      </h1>
      <p style={{ color: "var(--text-4)", fontSize: "15px", marginBottom: "32px" }}>
        Search across {totalTechs} technologies and all learning sections
      </p>

      {/* Search input */}
      <div style={{ position: "relative", marginBottom: "32px" }}>
        <Search size={18} style={{ position: "absolute", left: "16px", top: "50%", transform: "translateY(-50%)", color: "var(--text-4)" }}/>
        <input
          autoFocus
          type="text"
          placeholder="Search technologies, topics, sections…"
          value={query}
          onChange={e => setQuery(e.target.value)}
          style={{
            width: "100%", boxSizing: "border-box",
            padding: "16px 16px 16px 48px",
            fontSize: "16px", background: "var(--bg-1)",
            border: "2px solid var(--border)", borderRadius: "14px",
            color: "var(--text-1)", outline: "none",
            fontFamily: "inherit",
          }}
        />
      </div>

      {/* Results */}
      {query.length >= 2 && results.length === 0 && (
        <div style={{ textAlign: "center", padding: "48px", color: "var(--text-4)" }}>
          <div style={{ fontSize: "40px", marginBottom: "12px" }}>🔍</div>
          <p>No results for &ldquo;{query}&rdquo;</p>
          <p style={{ fontSize: "13px", marginTop: "8px" }}>Try: docker, kubernetes, aws, sql, python</p>
        </div>
      )}

      {Object.entries(grouped).map(([key, items]) => {
        const first = items[0];
        const color = ACADEMY_COLORS[first.academy] || "#3B82F6";
        return (
          <div key={key} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px", marginBottom: "12px" }}>
            {/* Tech header */}
            <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "14px" }}>
              <span style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px" }}>{first.techName}</span>
              <span style={{ background: `${color}18`, color, padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 700 }}>{first.academy}</span>
            </div>
            {/* Section links */}
            <div style={{ display: "flex", flexWrap: "wrap", gap: "8px" }}>
              {items.map(r => (
                <Link key={r.section} href={r.url}
                  style={{ display: "inline-flex", alignItems: "center", gap: "5px", background: "var(--bg-2)", border: "1px solid var(--border)", padding: "6px 12px", borderRadius: "6px", textDecoration: "none", color: "var(--text-3)", fontSize: "13px" }}>
                  {SECTION_LABELS[r.section] || r.section}
                  <ArrowRight size={11}/>
                </Link>
              ))}
            </div>
          </div>
        );
      })}

      {/* Empty state */}
      {query.length < 2 && (
        <div>
          <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "20px" }}>Popular searches:</p>
          <div style={{ display: "flex", flexWrap: "wrap", gap: "8px" }}>
            {["kubernetes","docker","terraform","aws","python","postgresql","ai","linux","jenkins","redis"].map(t => (
              <button key={t} onClick={() => setQuery(t)}
                style={{ background: "var(--bg-1)", border: "1px solid var(--border)", padding: "8px 16px", borderRadius: "8px", color: "var(--text-2)", fontSize: "14px", cursor: "pointer", fontFamily: "inherit" }}>
                {t}
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
