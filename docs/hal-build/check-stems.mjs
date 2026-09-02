// Cross-paper stem registry + pre-write gate. Run BEFORE gen.mjs for any
// paper: node docs/hal-build/check-stems.mjs <n>
//
// Exists specifically because the same duplicate-stem mistake ("Choose the
// correctly spelled word:" reused verbatim for two different questions in
// the same paper) recurred independently in Papers 1, 2, and 3 -- each time
// caught only after the fact by gen.mjs's within-paper duplicate check.
// That check is real but reactive: it only sees one paper's stems at a
// time and only runs after the paper is already fully drafted. This script
// is the structural fix -- a persistent, cross-paper registry checked
// BEFORE a paper is considered final, so a known-bad pattern (a literal
// stem already used in ANY earlier paper, not just this one) is caught at
// authoring time instead of relying on catching it again per paper.
//
// On a clean run (no collisions), it appends the paper's stems to the
// registry -- so run this only once a paper's data file is in its
// final, intended state, not on every intermediate edit.
import { readFileSync, writeFileSync, existsSync } from "node:fs";

const n = process.argv[2];
if (!n) { console.error("Usage: node docs/hal-build/check-stems.mjs <paper-number>"); process.exit(1); }

const REGISTRY_PATH = "d:/synfracore/docs/hal-build/stem-registry.json";

const registry = existsSync(REGISTRY_PATH)
  ? JSON.parse(readFileSync(REGISTRY_PATH, "utf8"))
  : {};

const { SECTIONS } = await import(`./paper${n}-data.mjs`);

const thisPaperStems = [];
for (const section of SECTIONS) {
  for (const q of section.questions) thisPaperStems.push(q.stem);
}

// 1. Within-paper duplicates (same check gen.mjs does, run here too since
// this is meant to be the single pre-flight gate).
const withinDupes = thisPaperStems.filter((s, i) => thisPaperStems.indexOf(s) !== i);

// 2. Cross-paper collisions against every earlier paper's registered stems.
const crossDupes = [];
for (const stem of thisPaperStems) {
  for (const [paperNum, stems] of Object.entries(registry)) {
    if (paperNum === String(n)) continue;
    if (stems.includes(stem)) crossDupes.push({ stem, collidesWithPaper: paperNum });
  }
}

// 3. Known-risky generic templates -- stems that have caused this exact
// bug before. Flagged even on a single occurrence, as a reminder to use
// the rotating phrasing pool below instead of the lazy default.
const RISKY_GENERIC_TEMPLATES = [
  "Choose the correctly spelled word:",
];
const riskyHits = thisPaperStems.filter((s) => RISKY_GENERIC_TEMPLATES.includes(s));

console.log(`Paper ${n}: ${thisPaperStems.length} stems checked.`);
console.log(`Within-paper duplicates: ${withinDupes.length}`, withinDupes);
console.log(`Cross-paper collisions (vs. papers ${Object.keys(registry).filter((k) => k !== String(n)).join(", ") || "none registered yet"}): ${crossDupes.length}`, crossDupes);
console.log(`Risky generic template hits: ${riskyHits.length}`, riskyHits);

const clean = withinDupes.length === 0 && crossDupes.length === 0 && riskyHits.length === 0;

if (!clean) {
  console.log("\nFAIL -- fix the flagged stems in paper" + n + "-data.mjs and re-run this check before proceeding to gen.mjs.");
  console.log("Rotating phrasing pool for spelling questions (use a different one each time, never the same one twice within OR across papers):");
  console.log("  - 'Choose the correctly spelled word:'");
  console.log("  - 'Identify the correctly spelled word among the options:'");
  console.log("  - 'Select the correctly spelled word:'");
  console.log("  - 'Which of the following is spelled correctly?'");
  console.log("  - 'Pick the correctly spelled option:'");
  process.exit(1);
}

registry[n] = thisPaperStems;
writeFileSync(REGISTRY_PATH, JSON.stringify(registry, null, 2), "utf8");
console.log(`\nPASS -- paper ${n}'s ${thisPaperStems.length} stems registered. Registry now covers papers: ${Object.keys(registry).join(", ")}.`);
