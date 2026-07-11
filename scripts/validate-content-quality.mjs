// Guardrail against the contamination pattern discovered 2026-07-11: bulk
// content-generation commits (v108/v109, 2026-06-26 — predating this
// engagement) introduced ~49 files carrying scraped chatbot-widget UI chrome
// and, in at least one case, what appears to be a real person's personalized
// career-prep session data, alongside broken/empty code blocks and abrupt
// mid-sentence cutoffs. See docs/audit/06-roadmap.md's Phase 4 entry for the
// full incident writeup.
//
// Wired into `npm run predeploy` and .github/workflows/ci.yml — this must
// run and PASS before any deploy, the same way validate:roadmaps does.
// Exits non-zero (fails CI) on any HARD-FAIL marker. WARN markers are
// printed but do not fail the build — they're heuristics with real
// false-positive risk (see each marker's own comment) and are meant for
// human review, not automatic blocking.
//
// Run with: node scripts/validate-content-quality.mjs

import { readFileSync, readdirSync } from "node:fs";
import { join, relative } from "node:path";

const ROOT = process.cwd();
const CONTENT_ROOT = join(ROOT, "public/content");

function walk(dir, out = []) {
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) walk(full, out);
    else if (entry.name.endsWith(".md")) out.push(full);
  }
  return out;
}

// HARD FAIL — confirmed, zero known false positives against the actual
// incident (all traced directly to the real contaminated files found
// 2026-07-11). A single hit anywhere fails the build. Deliberately narrow:
// only markers that map exactly to the confirmed incident and nothing else
// site-wide — see docs/audit/06-roadmap.md's Phase 4 entry for the full
// writeup of why empty_code_block and abrupt_cutoff (below) were tested and
// explicitly NOT included here, despite being part of the original incident
// description — both turned out to be far broader than the incident itself
// (120 and 157 files respectively, mostly unrelated pre-existing content
// gaps), so hard-failing on them would block every future deploy on a large,
// separate backlog rather than catching a recurrence of this specific
// incident. They're kept as WARN below instead.
const HARD_FAIL_MARKERS = [
  { key: "prepared_for", label: 'Personalized-document header ("Prepared for:")', re: /Prepared for:/ },
  { key: "profile_glance", label: '"Your Profile at a Glance" personalized-profile section', re: /Your Profile.*at a Glance/ },
  { key: "chatbot_ask_topic", label: 'Chatbot widget UI chrome ("Ask anything about this topic")', re: /Ask anything about this topic/ },
  { key: "chatbot_greeting", label: 'Chatbot widget greeting ("Hi! I have read this page")', re: /Hi!\s*I have read this page/ },
  {
    key: "ui_chrome_dump",
    label: "Scraped page-UI chrome (tab labels or breadcrumb line dumped into markdown)",
    // Distinct, separately-discovered defect (2026-07-11, found via manual
    // sibling-tab review, not the original contamination scan): a page-chrome
    // scrape left literal tab-label text ("BeginnerEngineerProductionArchitect")
    // or a breadcrumb line ("Monitoring › ELK Stack") embedded in the
    // markdown body. Unlike empty_code_block/abrupt_cutoff below, this text
    // only ever appears from a scrape — no legitimate prose produces it — so
    // it hard-fails despite being a different defect from the original
    // incident. See docs/audit/06-roadmap.md for the tracked cleanup item.
    re: /BeginnerEngineerProductionArchitect|BeginnerIntermediateAdvanced|^[A-Za-z& ]+ › [A-Za-z& ]+$/m,
  },
];

// Known pre-existing ui_chrome_dump hits, found 2026-07-11, not yet rewritten
// (tracked as its own roadmap item, separate from the 45-file contamination
// incident). Exempted here so CI/predeploy stay green while that cleanup is
// pending — any NEW file matching this marker that isn't on this list still
// hard-fails immediately. Remove a path from this list as each file gets
// rewritten; the list should reach zero entries when the item is closed.
const UI_CHROME_DUMP_KNOWN_EXCEPTIONS = new Set([
  "devops/splunk/fundamentals.md",
  "essentials/human-essentials/fundamentals.md",
  "healthcare/medical-coding/fundamentals.md",
]);

// WARN only — real signal, but with real false-positive risk and/or a scope
// far broader than the confirmed incident (see comment above). Printed for
// human review; does not fail the build.
const WARN_MARKERS = [
  {
    key: "first_person_employer",
    label: 'Possible first-person real-employer narrative ("At <Company>, we/I ...")',
    // Deliberately narrow: requires "At <Capitalized word/acronym>," directly
    // followed by we/I — matches "At HPE, we replaced..." without matching
    // generic technical prose like "At AWS, IAM policies control...".
    re: /\bAt [A-Z][A-Za-z]{1,20},\s+(we|I)\b/,
  },
  {
    key: "empty_code_block",
    label: "Empty fenced code block (``` immediately followed by ```, nothing inside)",
    // Confirmed 2026-07-11: matches 120 files site-wide, most with zero
    // overlap with the confirmed contamination — a real, separate,
    // pre-existing content-completeness gap, not a reliable contamination
    // signal on its own. WARN so it stays visible without blocking deploys.
    re: /```[a-z]*\n\s*\n```/,
  },
  {
    key: "abrupt_cutoff",
    label: "File does not end with normal terminating punctuation/structure (possible mid-sentence cutoff)",
    // Heuristic only: flags a file whose last non-blank line doesn't end in
    // ., !, ?, a closing code fence, a table row, or a list item — real
    // technical docs legitimately end in code blocks, tables, etc., so this
    // has real false-positive risk (157 files matched, clearly mostly false
    // positives on a spot check) and is advisory only.
    check: (content) => {
      const lines = content.trimEnd().split("\n");
      const last = lines[lines.length - 1]?.trim() ?? "";
      if (last === "") return false;
      const looksTerminated =
        /[.!?:)]$/.test(last) ||
        last === "```" ||
        last.startsWith("|") ||
        /^[-*]\s/.test(last) ||
        /^\d+\.\s/.test(last) ||
        last.startsWith("#");
      return !looksTerminated;
    },
  },
];

const files = walk(CONTENT_ROOT);
let hardFailCount = 0;
const hardFailFiles = [];
const warnFiles = [];

for (const file of files) {
  const content = readFileSync(file, "utf8");
  const relPath = relative(CONTENT_ROOT, file).replace(/\\/g, "/");

  const hardHits = HARD_FAIL_MARKERS.filter((m) => {
    if (!m.re.test(content)) return false;
    if (m.key === "ui_chrome_dump" && UI_CHROME_DUMP_KNOWN_EXCEPTIONS.has(relPath)) return false;
    return true;
  });
  if (hardHits.length > 0) {
    hardFailFiles.push({ file: relPath, markers: hardHits.map((m) => m.key) });
    hardFailCount++;
  }

  const warnHits = [];
  for (const m of WARN_MARKERS) {
    const matched = m.check ? m.check(content) : m.re.test(content);
    if (matched) warnHits.push(m.key);
  }
  if (warnHits.length > 0) warnFiles.push({ file: relPath, markers: warnHits });
}

console.log(`\n=== Content Quality Guardrail — ${new Date().toISOString().slice(0, 10)} ===`);
console.log(`Scanned ${files.length} files under public/content/\n`);

if (hardFailFiles.length > 0) {
  console.error(`FAIL: ${hardFailFiles.length} file(s) matched a hard-fail contamination marker:\n`);
  for (const { file, markers } of hardFailFiles) {
    console.error(`  [${markers.join(", ")}] ${file}`);
  }
  console.error("\nSee docs/audit/06-roadmap.md's Phase 4 entry for what these markers mean and why they're hard-blocked.");
} else {
  console.log("PASS: no hard-fail contamination markers found.");
}

if (warnFiles.length > 0) {
  console.log(`\nWARN: ${warnFiles.length} file(s) matched an advisory-only marker (not blocking, human review recommended):\n`);
  for (const { file, markers } of warnFiles) {
    console.log(`  [${markers.join(", ")}] ${file}`);
  }
}

console.log("");
process.exit(hardFailCount > 0 ? 1 : 0);
