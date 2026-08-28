// Guardrail against an unbalanced code-fence edit shipping to production.
// Found twice during the Phase 3 visual-depth rollout (2026-08-27):
// inserting a new ```flow/```conceptgrid block in the middle of an existing
// multi-section ```bash block (to add a diagram next to code that continues
// below it) accidentally closed the earlier block early, leaving the
// remainder of that section as unfenced plain text on the live page. Both
// occurrences (infrastructure/terraform/overview.md, devops/harbor/
// overview.md) were caught by a manual `grep -c '^```'` parity check before
// commit -- this script automates that check instead of relying on
// remembering to run it by hand, since manual vigilance alone didn't
// prevent the second occurrence after the first was already known.
//
// Checks every .md file under public/content/ for an even number of lines
// that are exactly ``` or start a fence with a language tag (```bash,
// ```flow, etc.) -- an odd count means a fence was opened without a
// matching close somewhere in the file. Deliberately simple (line-prefix
// counting, not a real markdown parser) since a real unbalanced-fence bug
// always shows up as an odd total either way, and a false positive would be
// immediately obvious in the parity count printed for a failing file.
//
// Wired into `npm run predeploy` — see validate-content-quality.mjs's own
// comment for why guardrail scripts fail the build here.
//
// Run with: node scripts/validate-content-fences.mjs

import { readFileSync, readdirSync } from "node:fs";
import { join, relative } from "node:path";

const ROOT = process.cwd();
const CONTENT_DIR = join(ROOT, "public", "content");
const FENCE_RE = /^```/;

function walk(dir, out = []) {
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) {
      walk(full, out);
    } else if (entry.isFile() && entry.name.endsWith(".md")) {
      out.push(full);
    }
  }
  return out;
}

let files;
try {
  files = walk(CONTENT_DIR);
} catch (e) {
  console.error(`Could not scan ${relative(ROOT, CONTENT_DIR)}: ${e.message}`);
  process.exit(1);
}

const failures = [];
for (const file of files) {
  const lines = readFileSync(file, "utf8").split("\n");
  const fenceCount = lines.filter((l) => FENCE_RE.test(l)).length;
  if (fenceCount % 2 !== 0) {
    failures.push({ file: relative(ROOT, file), fenceCount });
  }
}

if (failures.length > 0) {
  console.error(`HARD-FAIL: ${failures.length} content file(s) have an unbalanced number of \`\`\` fences (odd count = a block was opened without a matching close):\n`);
  for (const f of failures) {
    console.error(`  ${f.file} — ${f.fenceCount} fence markers`);
  }
  console.error("\nA fence left open swallows everything after it into one giant code block (or,\nif closed too early, dumps the rest of that section as unfenced plain text on\nthe live page) — read the file and fix the mismatched ``` before deploying.");
  process.exit(1);
}

console.log(`All ${files.length} content files have balanced code fences.`);
