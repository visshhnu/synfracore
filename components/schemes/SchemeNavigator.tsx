"use client";
import { useMemo, useState } from "react";
import { ExternalLink, CheckCircle2, AlertTriangle, XCircle } from "lucide-react";
import type { GovernmentScheme, FreshnessState } from "@/lib/supabase/governmentSchemes";
import { getFreshnessState, SECTOR_LABELS, STATUS_LABELS } from "@/lib/supabase/governmentSchemes";

// Client component: all filtering happens in-browser over the full
// (small, ~15-row) dataset fetched once server-side — no per-filter
// round trip needed at this data size, and it keeps the whole page
// working with JS disabled for the initial unfiltered list (the parent
// server component renders the same data as a fallback — see
// app/schemes/page.tsx).

const FRESHNESS_STYLE: Record<FreshnessState, { bg: string; color: string; border: string; Icon: typeof CheckCircle2; label: (date: string) => string }> = {
  fresh: { bg: "rgba(16,185,129,0.1)", color: "#10B981", border: "rgba(16,185,129,0.3)", Icon: CheckCircle2, label: (d) => `Verified as of ${d}` },
  "due-for-review": { bg: "rgba(245,158,11,0.1)", color: "#F59E0B", border: "rgba(245,158,11,0.3)", Icon: AlertTriangle, label: (d) => `Verified ${d} — due for re-check` },
  stale: { bg: "rgba(239,68,68,0.1)", color: "#EF4444", border: "rgba(239,68,68,0.3)", Icon: XCircle, label: (d) => `Verified ${d} — status changed, see notes` },
};

function FreshnessBadge({ scheme }: { scheme: GovernmentScheme }) {
  const state = getFreshnessState(scheme);
  const style = FRESHNESS_STYLE[state];
  const strikethrough = scheme.status === "expired" || scheme.status === "superseded";
  return (
    <span style={{
      display: "inline-flex", alignItems: "center", gap: "5px", fontSize: "11px", fontWeight: 700,
      padding: "4px 10px", borderRadius: "20px", background: style.bg, color: style.color, border: `1px solid ${style.border}`,
      textDecoration: strikethrough ? "line-through" : "none", whiteSpace: "nowrap",
    }}>
      <style.Icon size={12} />
      {style.label(scheme.verified_date)}
    </span>
  );
}

function StatusPill({ status }: { status: GovernmentScheme["status"] }) {
  const colorMap: Record<GovernmentScheme["status"], string> = {
    active: "#10B981", "closing-soon": "#F59E0B", expired: "#64748B", superseded: "#64748B", "phase-transition": "#F59E0B",
  };
  const color = colorMap[status];
  return (
    <span style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.04em", textTransform: "uppercase", padding: "3px 8px", borderRadius: "6px", background: `${color}18`, color, border: `1px solid ${color}35` }}>
      {STATUS_LABELS[status]}
    </span>
  );
}

export default function SchemeNavigator({ schemes }: { schemes: GovernmentScheme[] }) {
  const [sectorFilter, setSectorFilter] = useState<string>("all");
  const [statusFilter, setStatusFilter] = useState<string>("all");

  const sectors = useMemo(() => {
    const set = new Set<string>();
    for (const s of schemes) for (const sec of s.sector) set.add(sec);
    return [...set].sort();
  }, [schemes]);

  const filtered = schemes.filter((s) => {
    if (sectorFilter !== "all" && !s.sector.includes(sectorFilter)) return false;
    if (statusFilter !== "all" && s.status !== statusFilter) return false;
    return true;
  });

  return (
    <div>
      <div style={{ display: "flex", gap: "10px", flexWrap: "wrap", marginBottom: "24px" }}>
        <select value={sectorFilter} onChange={(e) => setSectorFilter(e.target.value)}
          style={{ padding: "8px 12px", borderRadius: "8px", border: "1px solid var(--border)", background: "var(--bg-1)", color: "var(--text-1)", fontSize: "13px", fontFamily: "inherit", cursor: "pointer" }}>
          <option value="all">All sectors</option>
          {sectors.map((sec) => <option key={sec} value={sec}>{SECTOR_LABELS[sec] ?? sec}</option>)}
        </select>
        <select value={statusFilter} onChange={(e) => setStatusFilter(e.target.value)}
          style={{ padding: "8px 12px", borderRadius: "8px", border: "1px solid var(--border)", background: "var(--bg-1)", color: "var(--text-1)", fontSize: "13px", fontFamily: "inherit", cursor: "pointer" }}>
          <option value="all">All statuses</option>
          {Object.entries(STATUS_LABELS).map(([val, label]) => <option key={val} value={val}>{label}</option>)}
        </select>
        <span style={{ display: "flex", alignItems: "center", fontSize: "12px", color: "var(--text-4)" }}>
          {filtered.length} of {schemes.length} schemes
        </span>
      </div>

      {filtered.length === 0 ? (
        <p style={{ color: "var(--text-4)", fontSize: "13px", padding: "24px 0" }}>No schemes match these filters.</p>
      ) : (
        <div style={{ display: "flex", flexDirection: "column", gap: "14px" }}>
          {filtered.map((s) => (
            <div key={s.id} style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", gap: "12px", flexWrap: "wrap", marginBottom: "8px" }}>
                <h3 style={{ fontSize: "16px", fontWeight: 700, color: "var(--text-1)", margin: 0 }}>{s.name}</h3>
                <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", alignItems: "center" }}>
                  <StatusPill status={s.status} />
                  <FreshnessBadge scheme={s} />
                </div>
              </div>
              <p style={{ fontSize: "13px", color: "var(--text-3)", lineHeight: 1.6, marginBottom: "10px" }}>{s.short_description}</p>
              <p style={{ fontSize: "13px", color: "var(--text-2)", lineHeight: 1.7, marginBottom: "10px" }}>{s.benefit_summary}</p>
              {s.notes_on_ambiguity && (
                <div style={{ fontSize: "12px", color: "#F59E0B", background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.25)", borderRadius: "8px", padding: "10px 12px", lineHeight: 1.6, marginBottom: "10px" }}>
                  <strong>Note:</strong> {s.notes_on_ambiguity}
                </div>
              )}
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", flexWrap: "wrap", gap: "8px", marginTop: "12px", paddingTop: "12px", borderTop: "1px solid var(--border)" }}>
                <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                  {s.sector.map((sec) => (
                    <span key={sec} style={{ fontSize: "10px", fontWeight: 600, padding: "2px 8px", borderRadius: "12px", background: "var(--bg-2)", color: "var(--text-3)" }}>
                      {SECTOR_LABELS[sec] ?? sec}
                    </span>
                  ))}
                  <span style={{ fontSize: "10px", fontWeight: 600, color: "var(--text-4)" }}>{s.administering_body}</span>
                </div>
                <a href={s.official_source_url} target="_blank" rel="noopener noreferrer"
                  style={{ display: "flex", alignItems: "center", gap: "4px", fontSize: "12px", fontWeight: 700, color: "#3B82F6", textDecoration: "none", whiteSpace: "nowrap" }}>
                  Official source <ExternalLink size={12} />
                </a>
              </div>
            </div>
          ))}
        </div>
      )}

      <p style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "24px", lineHeight: 1.6 }}>
        Every entry here is a manually verified, dated snapshot — not a live feed from any government system. Treat the linked official source as the ultimate authority, especially for any entry marked &ldquo;due for re-check&rdquo; or &ldquo;Phase Transition.&rdquo;
      </p>
    </div>
  );
}
