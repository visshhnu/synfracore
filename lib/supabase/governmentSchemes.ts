import type { SupabaseClient } from "@supabase/supabase-js";

// Query functions for the Government Scheme Navigator
// (docs/government-schemes-schema.sql). Entirely public reference data —
// no premium gate, no auth required to read. Same never-throws,
// safe-empty-return convention as lib/supabase/pyqBank.ts.

export type SchemeStatus = "active" | "closing-soon" | "expired" | "superseded" | "phase-transition";
export type SchemeType = "subsidy" | "tax-benefit" | "term-loan" | "grant" | "interest-subvention" | "equity-fund";

export type GovernmentScheme = {
  id: string;
  slug: string;
  name: string;
  short_description: string;
  sector: string[];
  scheme_type: SchemeType;
  administering_body: string;
  benefit_summary: string;
  status: SchemeStatus;
  superseded_by: string | null;
  official_source_url: string;
  verified_date: string; // ISO date string, e.g. "2026-09-17"
  review_frequency_days: number;
  next_review_date: string; // generated column, ISO date string
  notes_on_ambiguity: string | null;
  sort_order: number;
};

export async function getAllSchemes(supabase: SupabaseClient): Promise<GovernmentScheme[]> {
  try {
    const { data, error } = await supabase
      .from("government_schemes")
      .select("id, slug, name, short_description, sector, scheme_type, administering_body, benefit_summary, status, superseded_by, official_source_url, verified_date, review_frequency_days, next_review_date, notes_on_ambiguity, sort_order")
      .order("sort_order", { ascending: true });
    if (error) throw error;
    return (data ?? []) as GovernmentScheme[];
  } catch (err) {
    console.error("getAllSchemes failed:", err);
    return [];
  }
}

// Freshness state driving the "Verified as of [date]" badge — computed
// from today's date against verified_date/next_review_date/status, not
// stored, so it's always correct without needing a background job to
// keep a stored field in sync.
export type FreshnessState = "fresh" | "due-for-review" | "stale";

export function getFreshnessState(scheme: Pick<GovernmentScheme, "status" | "next_review_date">): FreshnessState {
  if (scheme.status === "expired" || scheme.status === "superseded") return "stale";
  const today = new Date();
  const nextReview = new Date(scheme.next_review_date);
  if (Number.isNaN(nextReview.getTime())) return "due-for-review";
  return today > nextReview ? "due-for-review" : "fresh";
}

export const SECTOR_LABELS: Record<string, string> = {
  ev: "EV",
  "food-processing": "Food Processing",
  "renewable-energy": "Renewable Energy",
  "general-msme": "General MSME",
  agri: "Agri (General)",
};

export const STATUS_LABELS: Record<SchemeStatus, string> = {
  active: "Active",
  "closing-soon": "Closing Soon",
  expired: "Expired",
  superseded: "Superseded",
  "phase-transition": "Phase Transition",
};
