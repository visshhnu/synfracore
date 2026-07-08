"use client";
import { useState, useEffect, useMemo } from "react";
import Link from "next/link";
import { Search } from "lucide-react";
import { academies, getAllTechnologies } from "@/lib/data/academies";
import { certifications, techSections, nonTechSections, nonTechAcademyIds } from "@/lib/data/navigation";
import { educationBoards } from "@/lib/data/education";
import { hasContent } from "@/lib/content";

interface Result {
  title: string;
  url: string;
  category: string;
  tags: string[];
  color: string;
}

// Career role pages (app/careers/[role]/page.tsx) hold their data as a
// local, unexported const — same shape of gap blog posts had before
// lib/data/blogPosts.ts was split out. Preserved here by hand for now
// rather than silently dropped; extracting it the same way blog was
// extracted is a reasonable follow-up, not done in this pass.
const careerEntries: Result[] = [
  { title: "Platform Engineer Career Path", url: "/careers/platform-engineer", category: "Career", tags: ["platform engineer","career","salary","roadmap"], color: "#8B5CF6" },
  { title: "DevOps Engineer Career Path", url: "/careers/devops-engineer", category: "Career", tags: ["devops engineer","career","salary","roadmap"], color: "#F59E0B" },
  { title: "SRE Career Path", url: "/careers/sre-engineer", category: "Career", tags: ["sre","site reliability","career","salary"], color: "#10B981" },
  { title: "Cloud Architect Career Path", url: "/careers/cloud-architect", category: "Career", tags: ["cloud architect","aws","azure","career","salary"], color: "#3B82F6" },
  { title: "AI Engineer Career Path", url: "/careers/ai-engineer", category: "Career", tags: ["ai engineer","ml","llm","career","salary"], color: "#8B5CF6" },
];

// Generated from the real catalog instead of a hand-picked ~30-entry list
// (which had already drifted far from the real ~200-technology catalog —
// see docs/audit/04-data-scalability.md Finding 3/4). Technology-level
// granularity (one entry per technology, not per section) is a deliberate
// bundle-size trade-off: the real catalog has 1,850 registered sections,
// and shipping all of them to this client-rendered page's bundle wasn't
// judged worth it for search — see docs/audit/06-roadmap.md. Going to
// section-level later is additive (loop one level deeper using the same
// data sources), not a rework of this.
function buildSearchIndex(): Result[] {
  const index: Result[] = [];
  const academyBySlug = new Map(academies.map((a) => [a.slug, a]));

  for (const t of getAllTechnologies()) {
    const academy = academyBySlug.get(t.academy);
    if (!academy) continue;
    const sections = nonTechAcademyIds.includes(t.academy) ? nonTechSections : techSections;
    const firstRegistered = sections.find((s) => hasContent(t.academy, t.slug, s.slug));
    if (!firstRegistered) continue; // no registered content at all for this technology
    index.push({
      title: t.name,
      url: `/academies/${t.academy}/${t.slug}/${firstRegistered.slug}`,
      category: academy.title,
      tags: (t.tags || []).map((x) => x.toLowerCase()),
      color: academy.color,
    });
  }

  for (const c of certifications) {
    index.push({
      title: c.name,
      url: `/certifications/${c.id}`,
      category: "Certifications",
      tags: [c.provider.toLowerCase(), c.level.toLowerCase(), c.code.toLowerCase()],
      color: c.color,
    });
  }

  for (const b of educationBoards) {
    index.push({
      title: b.name,
      url: `/learn/${b.slug}`,
      category: "Education",
      tags: [b.shortName.toLowerCase()],
      color: b.color,
    });
  }

  return [...index, ...careerEntries];
}

const searchIndex: Result[] = buildSearchIndex();

export default function SearchPage() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<Result[]>([]);
  const [activeCategory, setActiveCategory] = useState("All");

  // Derived from the actual generated index rather than a hand-picked
  // subset — stays correct as academies are added/renamed instead of
  // silently missing new categories.
  const categories = useMemo(() => ["All", ...new Set(searchIndex.map((r) => r.category))], []);

  useEffect(() => {
    if (!query.trim() && activeCategory === "All") {
      setResults(searchIndex.slice(0, 12));
      return;
    }
    const q = query.toLowerCase();
    const filtered = searchIndex.filter(r => {
      const matchCat = activeCategory === "All" || r.category === activeCategory;
      // Also match the category name itself (e.g. "agriculture" typed as a
      // query correctly finds every Agriculture-academy entry even though
      // none of those technologies' own names/tags contain that word —
      // caught during manual verification of this exact change).
      const matchQuery = !q || r.title.toLowerCase().includes(q) || r.tags.some(t => t.includes(q)) || r.category.toLowerCase().includes(q);
      return matchCat && matchQuery;
    });
    setResults(filtered);
  }, [query, activeCategory]);

  return (
    <div style={{ maxWidth: "800px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ textAlign: "center", marginBottom: "40px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "36px", marginBottom: "12px" }}>
          Search SynfraCore
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "16px" }}>
          Find content across tech academies, education boards, career paths, and certifications
        </p>
      </div>

      {/* Search input */}
      <div style={{ position: "relative", marginBottom: "24px" }}>
        <Search size={18} style={{ position: "absolute", left: "16px", top: "50%", transform: "translateY(-50%)", color: "var(--text-4)" }} />
        <input
          autoFocus
          value={query}
          onChange={e => setQuery(e.target.value)}
          placeholder="Search topics, exams, tools, careers..."
          style={{
            width: "100%", padding: "16px 16px 16px 48px", borderRadius: "12px",
            border: "2px solid var(--border)", background: "var(--bg-1)",
            fontSize: "16px", color: "var(--text-1)", outline: "none",
            boxSizing: "border-box",
          }}
        />
      </div>

      {/* Category filters */}
      <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "32px" }}>
        {categories.map(cat => (
          <button key={cat} onClick={() => setActiveCategory(cat)} style={{
            padding: "6px 16px", borderRadius: "20px", fontSize: "13px", fontWeight: 600,
            border: "1px solid var(--border)", cursor: "pointer",
            background: activeCategory === cat ? "var(--accent)" : "var(--bg-2)",
            color: activeCategory === cat ? "white" : "var(--text-3)",
          }}>
            {cat}
          </button>
        ))}
      </div>

      {/* Results */}
      <div style={{ display: "flex", flexDirection: "column", gap: "10px" }}>
        {results.length === 0 && (
          <div style={{ textAlign: "center", padding: "48px", color: "var(--text-4)" }}>
            No results for &quot;{query}&quot; — try different keywords
          </div>
        )}
        {results.map(r => (
          <Link key={r.url} href={r.url} style={{ textDecoration: "none" }}>
            <div className="card-hover" style={{ padding: "16px 20px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", display: "flex", alignItems: "center", gap: "14px", cursor: "pointer" }}>
              <div style={{ width: "4px", height: "40px", borderRadius: "2px", background: r.color, flexShrink: 0 }} />
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "4px", flexWrap: "wrap" }}>
                  <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{r.title}</span>
                  <span style={{ fontSize: "10px", padding: "2px 8px", borderRadius: "20px", background: r.color + "15", color: r.color, fontWeight: 700, flexShrink: 0 }}>{r.category}</span>
                </div>
                <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
                  {r.tags.slice(0, 4).map(t => (
                    <span key={t} style={{ fontSize: "11px", padding: "1px 6px", borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-4)" }}>{t}</span>
                  ))}
                </div>
              </div>
              <span style={{ color: "var(--text-4)", fontSize: "16px", flexShrink: 0 }}>→</span>
            </div>
          </Link>
        ))}
      </div>

      {!query && activeCategory === "All" && (
        <p style={{ textAlign: "center", color: "var(--text-4)", fontSize: "13px", marginTop: "24px" }}>
          Showing popular content · Type to search all {searchIndex.length} topics
        </p>
      )}
    </div>
  );
}
