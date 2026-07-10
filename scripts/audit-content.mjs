// A1 (phase4-content-and-question-bank-plan.md): reports exactly which
// academy/technology/section combinations have real content on disk vs. an
// empty/missing tab, so content-filling work can be prioritized from real
// numbers instead of a guess. Read-only — writes nothing, safe to re-run.
//
// Checks disk directly (public/content/**/*.md), not the generated
// lib/content/index.ts registry, since that file only reflects reality as of
// whenever someone last ran `npm run generate:content-registry` and can
// drift — see that script's own header comment. "labs" is excluded from
// content-coverage counts: it's rendered by <LabsSection> (lib/data/labs/*),
// a separate system that never goes through hasContent()/fetchContent() —
// see app/academies/[academy]/[technology]/[section]/page.tsx.
//
// Run with: node scripts/audit-content.mjs

import { statSync, mkdtempSync, writeFileSync, rmSync } from "node:fs";
import { join } from "node:path";
import { tmpdir } from "node:os";
import { buildSync } from "esbuild";
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
const ROOT = process.cwd();
const CONTENT_ROOT = join(ROOT, "public/content");

function loadModule(entryPoint) {
  const tmpDir = mkdtempSync(join(tmpdir(), "synfracore-audit-"));
  const outFile = join(tmpDir, "mod.cjs");
  try {
    const result = buildSync({ entryPoints: [entryPoint], bundle: true, platform: "node", format: "cjs", write: false });
    writeFileSync(outFile, result.outputFiles[0].contents);
    return require(outFile);
  } finally {
    rmSync(tmpDir, { recursive: true, force: true });
  }
}

const { getAllTechnologies } = loadModule(join(ROOT, "lib/data/academies.ts"));
const { techSections, nonTechSections, nonTechAcademyIds } = loadModule(join(ROOT, "lib/data/navigation.ts"));

// Same legacy alias as scripts/generate-content-registry.mjs — devops
// content mostly still lives under a folder literally named "infrastructure".
const ALIAS_ROOTS = { devops: ["devops", "infrastructure"] };

function fileExists(relPath) {
  try {
    statSync(join(CONTENT_ROOT, `${relPath}.md`));
    return true;
  } catch {
    return false;
  }
}

function hasRealContent(academy, tech, section) {
  const roots = ALIAS_ROOTS[academy] || [academy];
  return roots.some((root) => fileExists(`${root}/${tech}/${section}`));
}

const technologies = getAllTechnologies();

// section slug -> label, content-bearing sections only (labs excluded)
const ALL_SECTION_META = new Map(
  [...techSections, ...nonTechSections].map((s) => [s.slug, s.label])
);

const perSectionCounts = new Map(); // slug -> { present, applicable }
const perTechRows = []; // { academy, tech, title, applicableSections, presentSections, missingSections }

for (const t of technologies) {
  const isNonTech = nonTechAcademyIds.includes(t.academy);
  const sections = (isNonTech ? nonTechSections : techSections).filter((s) => s.slug !== "labs");

  const present = [];
  const missing = [];
  for (const s of sections) {
    const ok = hasRealContent(t.academy, t.slug, s.slug);
    const counts = perSectionCounts.get(s.slug) || { present: 0, applicable: 0 };
    counts.applicable += 1;
    if (ok) counts.present += 1;
    perSectionCounts.set(s.slug, counts);
    (ok ? present : missing).push(s.slug);
  }

  perTechRows.push({
    academy: t.academy,
    tech: t.slug,
    title: t.title || t.slug,
    isNonTech,
    applicableSections: sections.map((s) => s.slug),
    present,
    missing,
  });
}

// ── Report ──────────────────────────────────────────────────────────────
const totalTechs = perTechRows.length;
console.log(`\n=== Content Audit (A1) — ${new Date().toISOString().slice(0, 10)} ===`);
console.log(`Academies scanned: ${new Set(perTechRows.map((r) => r.academy)).size}`);
console.log(`Technologies scanned: ${totalTechs}`);
console.log(`("labs" excluded — separate system, not markdown-content-backed)\n`);

console.log("--- Per-section coverage (across all technologies where that tab applies) ---");
const sectionOrder = [...techSections, ...nonTechSections.filter((s) => !techSections.some((ts) => ts.slug === s.slug))]
  .filter((s) => s.slug !== "labs")
  .map((s) => s.slug);
const seenSlugs = new Set();
for (const slug of sectionOrder) {
  if (seenSlugs.has(slug)) continue;
  seenSlugs.add(slug);
  const counts = perSectionCounts.get(slug);
  if (!counts) continue;
  const pct = ((counts.present / counts.applicable) * 100).toFixed(0);
  console.log(`  ${(ALL_SECTION_META.get(slug) || slug).padEnd(14)} ${String(counts.present).padStart(3)} / ${String(counts.applicable).padEnd(3)} (${pct}%)`);
}

// Overview-only = has overview, has nothing else applicable
const overviewOnly = perTechRows.filter((r) => r.present.includes("overview") && r.present.length === 1);
const noContentAtAll = perTechRows.filter((r) => r.present.length === 0);
const fullyComplete = perTechRows.filter((r) => r.missing.length === 0);

console.log(`\n--- Headline numbers ---`);
console.log(`  ${overviewOnly.length} of ${totalTechs} technologies have Overview only (nothing else).`);
console.log(`  ${noContentAtAll.length} of ${totalTechs} technologies have ZERO content (not even Overview).`);
console.log(`  ${fullyComplete.length} of ${totalTechs} technologies are fully complete (every applicable tab present).`);

// Distribution: how many technologies have exactly N of their applicable tabs filled
const distribution = new Map();
for (const r of perTechRows) {
  const n = r.present.length;
  distribution.set(n, (distribution.get(n) || 0) + 1);
}
console.log(`\n--- Distribution: technologies by tab-count filled ---`);
for (const n of [...distribution.keys()].sort((a, b) => a - b)) {
  console.log(`  ${n} tabs filled: ${distribution.get(n)} technologies`);
}

console.log(`\n--- Zero-content technologies (highest priority — nothing to show at all) ---`);
if (noContentAtAll.length === 0) {
  console.log("  (none)");
} else {
  for (const r of noContentAtAll) console.log(`  ${r.academy}/${r.tech}`);
}

console.log(`\n--- Overview-only technologies (${overviewOnly.length}) ---`);
for (const r of overviewOnly) console.log(`  ${r.academy}/${r.tech}`);

console.log("\nDone.\n");
