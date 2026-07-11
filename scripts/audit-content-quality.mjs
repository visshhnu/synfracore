// Phase 4 roadmap item ("Templated, low-quality Overview pages exist across
// the site — needs a dedicated audit, not ad hoc fixes"): greps
// public/content/**/*.md for known bad-content markers found by hand in 4
// confirmed instances (Kubernetes, Spark, Airflow, dbt) and reports the full
// scope before any rewrite work starts. Read-only, safe to re-run.
//
// Markers, each found in at least one confirmed-bad file:
//   1. "Add your answer here" — unfilled interview-question placeholder text
//   2. "Quick Reference — " + "Key Points for Revision" — the generic
//      boilerplate block found stamped onto cheatsheets/FAQ pages
//      (already removed from 2 law-academy FAQs this session)
//   3. Promotional/marketing copy markers ("Course Content", "Champion",
//      "WhatsApp group") — found in Kubernetes' fundamentals.md
//   4. The generic "This page covers the fundamentals of X... / The
//      complete X curriculum covers:" template, paired with a "# Install
//      <lowercased-tech-name>" quick-start block — found in Spark, Airflow,
//      and dbt's overview.md, two of three with a wrong pip package name
//
// Run with: node scripts/audit-content-quality.mjs

import { readFileSync } from "node:fs";
import { globSync } from "node:fs";
import { join, relative } from "node:path";
import fg from "node:fs";

const ROOT = process.cwd();
const CONTENT_ROOT = join(ROOT, "public/content");

// Node's fs has no built-in recursive glob before v20-ish `fs.glob` (behind
// experimental flags in older runtimes) — walk manually instead, same as
// existing scripts in this repo do for the content tree.
function walk(dir, out = []) {
  for (const entry of fg.readdirSync(dir, { withFileTypes: true })) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) walk(full, out);
    else if (entry.name.endsWith(".md")) out.push(full);
  }
  return out;
}

const files = walk(CONTENT_ROOT);

const MARKERS = [
  { key: "placeholder_answer", label: "Unfilled 'Add your answer here' placeholder", re: /Add your answer here/ },
  { key: "boilerplate_quickref", label: "Generic 'Quick Reference — X' + 'Key Points for Revision' boilerplate block", re: /Key Points for Revision/ },
  { key: "promo_course", label: "Promotional 'Course Content' copy", re: /Course Content/ },
  { key: "promo_champion", label: "Promotional '...Champion' copy", re: /Champion/ },
  { key: "promo_whatsapp", label: "Promotional 'WhatsApp group' copy", re: /WhatsApp group/ },
  { key: "generic_curriculum_template", label: "Generic 'This page covers the fundamentals of X / complete curriculum covers' template", re: /The complete .+ curriculum covers/ },
  { key: "generic_quickstart_install", label: "Generic '# Install <tech>' quick-start block (often paired with a wrong package name)", re: /^# Install [a-z][a-z0-9_-]*$/m },
];

const perMarkerFiles = new Map(MARKERS.map((m) => [m.key, []]));
const perFileMarkers = new Map(); // relPath -> [marker keys]

// Strip fenced code blocks before matching — otherwise a bash comment like
// "# Install kube-prometheus-stack" inside a ```bash block false-positives
// against the "generic quick-start heading" marker, which is meant to catch
// an actual markdown H1 (Spark/Airflow/dbt's real, bad pattern), not a shell
// comment inside an otherwise-legitimate, well-written code sample.
function stripCodeFences(text) {
  return text.replace(/```[\s\S]*?```/g, "");
}

for (const file of files) {
  const rawContent = readFileSync(file, "utf8");
  const content = stripCodeFences(rawContent);
  const relPath = relative(CONTENT_ROOT, file).replace(/\\/g, "/");
  const hitKeys = [];
  for (const m of MARKERS) {
    if (m.re.test(content)) {
      perMarkerFiles.get(m.key).push(relPath);
      hitKeys.push(m.key);
    }
  }
  if (hitKeys.length > 0) perFileMarkers.set(relPath, hitKeys);
}

console.log(`\n=== Content Quality Audit — templated/placeholder/boilerplate content — ${new Date().toISOString().slice(0, 10)} ===`);
console.log(`Total .md files scanned: ${files.length}\n`);

console.log("--- Per-marker counts ---");
for (const m of MARKERS) {
  console.log(`  ${String(perMarkerFiles.get(m.key).length).padStart(4)}  ${m.label}`);
}

const totalUniqueAffected = perFileMarkers.size;
console.log(`\n--- Headline number ---`);
console.log(`  ${totalUniqueAffected} unique files affected by at least one marker (out of ${files.length} total, ${((totalUniqueAffected / files.length) * 100).toFixed(1)}%)`);

// Files matching 2+ markers are the highest-confidence "genuinely bad, not a
// false positive" cases — a single marker (e.g. "Champion" as part of an
// unrelated word) is more likely a coincidental match worth spot-checking.
const multiMarkerFiles = [...perFileMarkers.entries()].filter(([, keys]) => keys.length >= 2);
console.log(`  ${multiMarkerFiles.length} files match 2+ markers (highest-confidence genuine hits)\n`);

console.log("--- Files matching 2+ markers (review these first) ---");
for (const [file, keys] of multiMarkerFiles.sort()) {
  console.log(`  ${file}  [${keys.join(", ")}]`);
}

console.log("\n--- Breakdown by academy (files matching at least one marker) ---");
const byAcademy = new Map();
for (const file of perFileMarkers.keys()) {
  const academy = file.split("/")[0];
  byAcademy.set(academy, (byAcademy.get(academy) || 0) + 1);
}
for (const [academy, count] of [...byAcademy.entries()].sort((a, b) => b[1] - a[1])) {
  console.log(`  ${String(count).padStart(4)}  ${academy}`);
}

console.log("\n--- Single-marker-only files (lower confidence — spot-check before assuming bad) ---");
const singleMarkerFiles = [...perFileMarkers.entries()].filter(([, keys]) => keys.length === 1);
console.log(`  ${singleMarkerFiles.length} files — grouped by which single marker:`);
for (const m of MARKERS) {
  const only = singleMarkerFiles.filter(([, keys]) => keys[0] === m.key);
  if (only.length > 0) console.log(`    ${String(only.length).padStart(4)}  ${m.label}`);
}

console.log("\nDone.\n");
