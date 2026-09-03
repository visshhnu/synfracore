// Cross-paper stem registry + pre-write gate. Run BEFORE gen.mjs for any
// paper: node docs/jee-build/check-stems.mjs <key>
// Registry file: jee-stem-registry.json. Stem-based, so this is agnostic
// to question shape (MCQ vs numeric) — no change needed for the second
// question shape.
import { readFileSync, writeFileSync, existsSync } from "node:fs";

const key = process.argv[2];
if (!key) { console.error("Usage: node docs/jee-build/check-stems.mjs <key>"); process.exit(1); }

const REGISTRY_PATH = `d:/synfracore/docs/jee-build/jee-stem-registry.json`;

const registry = existsSync(REGISTRY_PATH)
  ? JSON.parse(readFileSync(REGISTRY_PATH, "utf8"))
  : {};

const { SECTIONS } = await import(`./${key}-data.mjs`);

const thisPaperStems = [];
for (const section of SECTIONS) {
  for (const q of section.questions) thisPaperStems.push(q.stem);
}

const withinDupes = thisPaperStems.filter((s, i) => thisPaperStems.indexOf(s) !== i);

const crossDupes = [];
for (const stem of thisPaperStems) {
  for (const [otherKey, stems] of Object.entries(registry)) {
    if (otherKey === key) continue;
    if (stems.includes(stem)) crossDupes.push({ stem, collidesWithPaper: otherKey });
  }
}

console.log(`${key}: ${thisPaperStems.length} stems checked.`);
console.log(`Within-paper duplicates: ${withinDupes.length}`, withinDupes);
console.log(`Cross-paper collisions (vs. ${Object.keys(registry).filter((k) => k !== key).join(", ") || "none registered yet"}): ${crossDupes.length}`, crossDupes);

const clean = withinDupes.length === 0 && crossDupes.length === 0;

if (!clean) {
  console.log(`\nFAIL -- fix the flagged stems in ${key}-data.mjs and re-run this check before proceeding to gen.mjs.`);
  process.exit(1);
}

registry[key] = thisPaperStems;
writeFileSync(REGISTRY_PATH, JSON.stringify(registry, null, 2), "utf8");
console.log(`\nPASS -- ${key}'s ${thisPaperStems.length} stems registered. Registry now covers: ${Object.keys(registry).join(", ")}.`);
