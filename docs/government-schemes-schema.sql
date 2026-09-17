-- ============================================================
-- SynfraCore — Government Scheme Navigator schema
-- Backs /schemes, a standalone, filterable directory of real government
-- financing/subsidy schemes for the Entrepreneurship & Business Ventures
-- academy (and any future sector needing the same treatment).
--
-- ARCHITECTURAL DECISION (approved 2026-09-17, not a shortcut): this is
-- deliberately NOT a live integration with any government API or site --
-- most of these schemes have no stable API, and the source sites redesign
-- without notice (confirmed directly during this schema's own research:
-- FSSAI's license-tier thresholds were revised effective 1 April 2026,
-- PM E-DRIVE's two-wheeler subsidy lapsed and was re-extended at a
-- different rate within a six-week window, and PM-KUSUM is mid-transition
-- between its Phase 1 and Phase 2 as of this writing). Instead, every row
-- is a dated snapshot with a visible "verified as of" date, a mandatory
-- link to the real official source as the ultimate authority, and a
-- review cadence that flags when a row is due for re-checking -- the same
-- Volatile Core discipline CLAUDE.md's standing instructions already
-- apply to medical/regulatory content, applied here.
--
-- `status` is the field that matters most for honest presentation:
-- 'active'          -- currently open/available, per verified_date
-- 'closing-soon'    -- has a known, real end date approaching
-- 'expired'         -- confirmed no longer available
-- 'superseded'      -- replaced by a newer scheme (see superseded_by)
-- 'phase-transition' -- current phase winding down, successor
--                       announced/imminent but not yet formally live --
--                       PM-KUSUM's exact real situation right now, and
--                       genuinely different from a clean 'expired' or
--                       'active' status; forcing it into either would
--                       misrepresent the real, disclosed uncertainty.
-- ============================================================

CREATE TABLE IF NOT EXISTS government_schemes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  short_description TEXT NOT NULL,
  sector TEXT[] NOT NULL,
  scheme_type TEXT NOT NULL CHECK (scheme_type IN ('subsidy', 'tax-benefit', 'term-loan', 'grant', 'interest-subvention', 'equity-fund')),
  administering_body TEXT NOT NULL,
  benefit_summary TEXT NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('active', 'closing-soon', 'expired', 'superseded', 'phase-transition')),
  -- References another row's slug, not a strict FK -- avoids insert-order
  -- dependency (a scheme can be seeded before its successor exists yet),
  -- same tradeoff already accepted elsewhere in this codebase for
  -- similarly loose cross-references.
  superseded_by TEXT,
  official_source_url TEXT NOT NULL,
  verified_date DATE NOT NULL,
  review_frequency_days INTEGER NOT NULL DEFAULT 90,
  -- Computed, not manually set -- eliminates the entire class of bug where
  -- verified_date or review_frequency_days gets updated but next_review_date
  -- is forgotten and silently goes stale.
  next_review_date DATE GENERATED ALWAYS AS (verified_date + review_frequency_days) STORED,
  -- Mandatory disclosure field, not optional -- captures exactly the kind
  -- of genuine ambiguity found during this table's own research (the
  -- PMKSY irrigation-vs-food-processing naming collision) so it's recorded
  -- once, not silently rediscovered by a future reviewer or, worse, missed
  -- and left to confuse a real founder reading this table's data.
  notes_on_ambiguity TEXT,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_government_schemes_sector ON government_schemes USING GIN (sector);
CREATE INDEX IF NOT EXISTS idx_government_schemes_status ON government_schemes (status);

-- ---------- SERVICE-ROLE TABLE-LEVEL GRANTS (must run BEFORE RLS below) ----------
GRANT SELECT, INSERT, UPDATE, DELETE ON government_schemes TO service_role;

-- ---------- RLS ----------
-- Entirely public reference data -- no premium gate, no user-scoping. The
-- whole point of the Navigator is that anyone can check current scheme
-- status without an account.
ALTER TABLE government_schemes ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads government schemes" ON government_schemes;
CREATE POLICY "public reads government schemes" ON government_schemes FOR SELECT USING ( true );
