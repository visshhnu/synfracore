// Guardrail against NF-6 (docs/audit/07-roadmap-final.md): marketing pages
// once hardcoded stat literals (890+ technologies, 11 academies, 13
// certifications) that drifted out of sync with the real data — the actual
// counts were 201/18/17. The fix (2026-07-16/18) made every stat display
// compute its value dynamically from the real source data instead
// (lib/data/navigation.ts's `stats`, app/page.tsx's own totals, app/about/
// page.tsx's own totals) — this script exists so a future edit can't
// silently reintroduce one of the exact old wrong values next to a stats
// label, since that's precisely how the original drift happened (a stat
// was hardcoded once, correctly, and never updated as content grew).
//
// Deliberately narrow (checks for the specific historical wrong values,
// not "any number near a stats word") — a general check would need real
// JSX parsing to avoid false positives on unrelated numbers, which isn't
// worth building for a guardrail against one specific incident. If the
// real counts change again and someone hardcodes the NEW correct number,
// this won't catch it — that's a real gap, not a false sense of safety.
//
// Wired into `npm run predeploy` — see validate-content-quality.mjs's own
// comment for why guardrail scripts fail the build here.
//
// Run with: node scripts/validate-no-hardcoded-stats.mjs

import { readFileSync, readdirSync } from "node:fs";
import { join, relative } from "node:path";

const ROOT = process.cwd();
const SCAN_DIRS = ["app", "components"];

const KNOWN_WRONG_PATTERNS = [
  { re: /890\+?\s*(Tech|technolog)/i, label: '"890+ Technologies" (real count is dynamic, was ~201 when this drift was found)' },
  { re: /\b11\s*Academ/i, label: '"11 Academies" (real count is dynamic, was 18 when this drift was found)' },
  { re: /\b13\s*Certif/i, label: '"13 Certifications" (real count is dynamic, was 17 when this drift was found)' },
];

function walk(dir, out = []) {
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) {
      if (entry.name === "node_modules" || entry.name.startsWith(".")) continue;
      walk(full, out);
    } else if (entry.isFile() && (entry.name.endsWith(".tsx") || entry.name.endsWith(".ts"))) {
      out.push(full);
    }
  }
  return out;
}

let failures = [];
for (const dir of SCAN_DIRS) {
  const dirPath = join(ROOT, dir);
  let files;
  try {
    files = walk(dirPath);
  } catch {
    continue;
  }
  for (const file of files) {
    const content = readFileSync(file, "utf8");
    for (const { re, label } of KNOWN_WRONG_PATTERNS) {
      if (re.test(content)) {
        failures.push({ file: relative(ROOT, file), label });
      }
    }
  }
}

if (failures.length > 0) {
  console.error("HARD-FAIL: hardcoded stat literal(s) matching a known-wrong NF-6 value found:\n");
  for (const f of failures) {
    console.error(`  ${f.file} — ${f.label}`);
  }
  console.error("\nUse the dynamic stats source (lib/data/navigation.ts's `stats`, or a live-computed total) instead of a literal.");
  process.exit(1);
}

console.log("No hardcoded NF-6 stat literals found.");
