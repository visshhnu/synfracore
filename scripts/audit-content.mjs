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

import { statSync, mkdtempSync, writeFileSync, rmSync, readFileSync, mkdirSync, readdirSync } from "node:fs";
import { join } from "node:path";
import { tmpdir } from "node:os";
import { buildSync } from "esbuild";
import { createRequire } from "node:module";
import { fromMarkdown } from "mdast-util-from-markdown";
import { toString as mdastToString } from "mdast-util-to-string";

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

// ── Gap-detection pass (comprehensive-gaps.json) ───────────────────────────
//
// Goes deeper than file-existence: parses each technology's markdown files
// into an mdast tree and checks, per technology, whether each of 10
// content categories is present, "thin" (exists but is negligible), or
// missing outright. Read-only — writes only the JSON report below, never
// touches content/code files.
//
// Categories fall into two detection strategies:
//  - "file" categories map to a conventional dedicated filename (e.g.
//    pyq.md, faq.md). If that file doesn't exist, we still search every
//    other file belonging to the technology for a heading that matches —
//    some technologies embed e.g. FAQ content as a heading inside
//    overview.md/fundamentals.md instead of a dedicated file.
//  - "heading" categories (Architectural Diagrams, Code Implementations,
//    Quiz Blocks) have no dedicated-filename convention anywhere in this
//    content tree, so they're detected purely via heading match, with a
//    fenced-code-block fallback for Code Implementations (content teams
//    often write code without a heading that literally says "Implementation").
//
// "thin" means: the file/section exists but its word count falls below a
// threshold, or it contains an explicit placeholder phrase ("coming soon",
// "TBD", etc). "missing" means no dedicated file AND no matching heading
// (and, for Code Implementations, no fenced code blocks either) was found
// anywhere in the technology's markdown files.

const FILE_THIN_WORD_THRESHOLD = 80;
const HEADING_THIN_WORD_THRESHOLD = 50;
const CODE_PRESENT_THRESHOLD = 4;
const PLACEHOLDER_RE = /coming soon|to be added|not yet available|under construction|\btbd\b|\btodo\b|placeholder/i;

// `applicability: "techOnly"` mirrors lib/data/navigation.ts exactly:
// real-world-scenarios, prerequisites, and labs appear in techSections but
// NOT nonTechSections, so those tabs don't exist at all for non-tech
// academies — treating a missing file there as a "gap" would misprioritize
// content work for a tab the product never renders. pyq/faq/notes/interview
// appear in both lists ("all").
const FILE_CATEGORIES = [
  { key: "realWorld", label: "Real World", filename: "real-world-scenarios.md", headingRegex: /real[\s-]?world|case stud|use case/i, applicability: "techOnly" },
  { key: "pyq", label: "PYQ", filename: "pyq.md", headingRegex: /\bpyqs?\b|previous year|past paper/i, applicability: "all" },
  { key: "faq", label: "FAQ", filename: "faq.md", headingRegex: /\bfaqs?\b|frequently asked/i, applicability: "all" },
  { key: "notes", label: "Notes", filename: "notes.md", headingRegex: /revision notes|key takeaway|\bnotes\b/i, applicability: "all" },
  { key: "prerequisites", label: "Prerequisites", filename: "prerequisites.md", headingRegex: /prerequisite/i, applicability: "techOnly" },
  { key: "labScenarios", label: "Lab Scenarios", filename: "labs.md", headingRegex: /\blabs?\b|hands[\s-]?on/i, applicability: "techOnly" },
  { key: "interviewMatrices", label: "Interview Matrices", filename: "interview.md", headingRegex: /interview/i, applicability: "all" },
];

const HEADING_CATEGORIES = [
  { key: "architecturalDiagrams", label: "Architectural Diagrams", headingRegex: /architecture|diagram/i, codeBlockFallback: false },
  { key: "codeImplementations", label: "Code Implementations", headingRegex: /implementation|code example|code walkthrough|code snippet/i, codeBlockFallback: true },
  { key: "quizBlocks", label: "Quiz Blocks", headingRegex: /\bquiz(zes)?\b/i, codeBlockFallback: false },
];

const ALL_GAP_CATEGORY_KEYS = [...FILE_CATEGORIES, ...HEADING_CATEGORIES].map((c) => c.key);

function wordCount(str) {
  const t = str.trim();
  return t ? t.split(/\s+/).length : 0;
}

// Collects each heading in a file's mdast tree along with the word/code
// count of the body that follows it, up to (but not including) the next
// heading of equal-or-shallower depth. mdast headings are flat siblings of
// the content that follows them, not containers, so this walk is required
// to know where each heading's "section" ends.
function extractHeadingSections(tree) {
  const children = tree.children;
  const sections = [];
  children.forEach((node, idx) => {
    if (node.type !== "heading") return;
    let end = children.length;
    for (let j = idx + 1; j < children.length; j++) {
      if (children[j].type === "heading" && children[j].depth <= node.depth) {
        end = j;
        break;
      }
    }
    const bodyNodes = children.slice(idx + 1, end);
    const bodyText = bodyNodes.map((n) => mdastToString(n)).join(" ");
    sections.push({
      text: mdastToString(node),
      depth: node.depth,
      line: node.position?.start?.line ?? null,
      wordCount: wordCount(bodyText),
      codeCount: bodyNodes.filter((n) => n.type === "code").length,
    });
  });
  return sections;
}

// Every markdown file that actually exists on disk for one technology,
// keyed by filename (e.g. "overview.md"), each parsed into an mdast tree.
// Reads directly off disk (not the ALL_SECTION_META slug list above) so
// non-conventional filenames are also picked up.
function listTechFiles(academy, tech) {
  const roots = ALIAS_ROOTS[academy] || [academy];
  const files = new Map();
  for (const root of roots) {
    const dir = join(CONTENT_ROOT, root, tech);
    let names;
    try {
      names = readdirSync(dir);
    } catch {
      continue;
    }
    for (const name of names) {
      if (!name.endsWith(".md") || files.has(name)) continue;
      const relPath = `public/content/${root}/${tech}/${name}`;
      const content = readFileSync(join(dir, name), "utf8");
      files.set(name, {
        relPath,
        content,
        lineCount: content.split("\n").length,
        tree: fromMarkdown(content),
      });
    }
  }
  return files;
}

// IMPORTANT: status here must match what the live site actually renders for
// this tab (hasContent()/fetchContent() in
// app/academies/[academy]/[technology]/[section]/page.tsx checks for the
// dedicated file's existence, nothing else). A heading that merely *mentions*
// this category inside some other tab's file (e.g. a "Revision Notes"
// wrap-up section inside interview.md) does NOT make the Notes tab render
// content — so it must never promote status past "missing". Those mentions
// are still surfaced under `relatedMentionsElsewhere` as raw material a
// content writer can draw from, but they are explicitly NOT evidence of
// presence. (This distinction is the fix for the Part 6 vs. first-draft
// gap-report discrepancy — see docs/audit/07-roadmap-final.md Part 6.)
function evaluateFileCategory(cat, files, isNonTech) {
  if (cat.applicability === "techOnly" && isNonTech) {
    return {
      status: "not-applicable",
      structure: "not-applicable",
      evidence: [{ file: null, note: `${cat.label} is not an applicable tab for non-technical academies (absent from nonTechSections in lib/data/navigation.ts) — excluded from gap counts to match product reality` }],
    };
  }

  const relatedMentionsElsewhere = [];
  for (const [name, file] of files) {
    if (name === cat.filename) continue;
    for (const h of extractHeadingSections(file.tree)) {
      if (cat.headingRegex.test(h.text)) {
        relatedMentionsElsewhere.push({ file: file.relPath, line: h.line, heading: h.text, wordCount: h.wordCount });
      }
    }
  }

  const dedicated = files.get(cat.filename);
  if (dedicated) {
    const words = wordCount(mdastToString(dedicated.tree));
    const placeholder = PLACEHOLDER_RE.test(dedicated.content);
    const status = placeholder || words < FILE_THIN_WORD_THRESHOLD ? "thin" : "present";
    return {
      status,
      structure: "dedicated-file",
      evidence: [
        {
          file: dedicated.relPath,
          line: 1,
          lineCount: dedicated.lineCount,
          wordCount: words,
          note: placeholder
            ? "dedicated file exists but contains a placeholder phrase (e.g. 'coming soon'/'TBD')"
            : status === "thin"
              ? `dedicated file exists but word count (${words}) is below the thin threshold (${FILE_THIN_WORD_THRESHOLD})`
              : "dedicated file exists with substantive content",
        },
      ],
      ...(relatedMentionsElsewhere.length ? { relatedMentionsElsewhere } : {}),
    };
  }

  return {
    status: "missing",
    structure: "none",
    evidence: [{ file: null, note: `no ${cat.filename} file for this technology — the site's ${cat.label} tab renders empty regardless of mentions elsewhere` }],
    ...(relatedMentionsElsewhere.length
      ? { relatedMentionsElsewhere, note: `no dedicated ${cat.filename}, but related content exists in other tabs (see relatedMentionsElsewhere) that a content writer could draw from` }
      : {}),
  };
}

function evaluateHeadingCategory(cat, files) {
  const hits = [];
  for (const [, file] of files) {
    for (const h of extractHeadingSections(file.tree)) {
      if (cat.headingRegex.test(h.text)) {
        hits.push({ file: file.relPath, line: h.line, heading: h.text, wordCount: h.wordCount, codeCount: h.codeCount });
      }
    }
  }

  if (hits.length > 0) {
    const totalWords = hits.reduce((s, h) => s + h.wordCount, 0);
    const totalCode = hits.reduce((s, h) => s + h.codeCount, 0);
    const thin = cat.key === "codeImplementations" ? totalCode === 0 || totalWords < HEADING_THIN_WORD_THRESHOLD : totalWords < HEADING_THIN_WORD_THRESHOLD;
    return {
      status: thin ? "thin" : "present",
      structure: "heading-match",
      evidence: hits.map((h) => ({
        file: h.file,
        line: h.line,
        heading: h.heading,
        wordCount: h.wordCount,
        ...(cat.key === "codeImplementations" ? { codeBlockCount: h.codeCount } : {}),
      })),
    };
  }

  if (cat.codeBlockFallback) {
    let totalCode = 0;
    const perFile = [];
    for (const [, file] of files) {
      const count = file.tree.children.filter((n) => n.type === "code" && n.lang).length;
      if (count > 0) {
        perFile.push({ file: file.relPath, line: null, codeBlockCount: count });
        totalCode += count;
      }
    }
    if (totalCode > 0) {
      return {
        status: totalCode >= CODE_PRESENT_THRESHOLD ? "present" : "thin",
        structure: "code-block-fallback",
        evidence: perFile.map((p) => ({ ...p, note: "no heading matched this category; counted via fenced code blocks with a language tag in this file instead" })),
      };
    }
  }

  return {
    status: "missing",
    structure: "none",
    evidence: [{ file: null, note: "no heading matching this category (and, where applicable, no fenced code blocks) found in any existing file for this technology" }],
  };
}

const gapAcademies = new Map();
const gapTotals = Object.fromEntries(ALL_GAP_CATEGORY_KEYS.map((k) => [k, { present: 0, thin: 0, missing: 0, notApplicable: 0 }]));

for (const t of perTechRows) {
  const files = listTechFiles(t.academy, t.tech);
  const gaps = {};
  for (const cat of FILE_CATEGORIES) gaps[cat.key] = evaluateFileCategory(cat, files, t.isNonTech);
  for (const cat of HEADING_CATEGORIES) gaps[cat.key] = evaluateHeadingCategory(cat, files);

  for (const key of ALL_GAP_CATEGORY_KEYS) {
    const status = gaps[key].status;
    gapTotals[key][status === "not-applicable" ? "notApplicable" : status] += 1;
  }

  const gapKeys = Object.keys(gaps).filter((k) => gaps[k].status === "missing" || gaps[k].status === "thin");
  const techEntry = {
    slug: t.tech,
    title: t.title,
    isNonTech: t.isNonTech,
    filesFound: [...files.keys()].sort(),
    gapSummary: {
      missing: Object.keys(gaps).filter((k) => gaps[k].status === "missing"),
      thin: Object.keys(gaps).filter((k) => gaps[k].status === "thin"),
    },
    hasGaps: gapKeys.length > 0,
    categories: gaps,
  };

  if (!gapAcademies.has(t.academy)) gapAcademies.set(t.academy, []);
  gapAcademies.get(t.academy).push(techEntry);
}

const comprehensiveGapsReport = {
  generatedAt: new Date().toISOString(),
  readOnly: true,
  categoriesChecked: [...FILE_CATEGORIES, ...HEADING_CATEGORIES].map((c) => ({ key: c.key, label: c.label })),
  statusDefinitions: {
    present: "For file categories (Real World, PYQ, FAQ, Notes, Prerequisites, Lab Scenarios, Interview Matrices): the dedicated file that the live site's tab actually reads (hasContent()/fetchContent()) exists with substantive content. For heading-only categories (Architectural Diagrams, Code Implementations, Quiz Blocks), there is no dedicated file/tab in the product today, so 'present' means a matching heading (or, for Code Implementations, enough fenced code blocks) was found.",
    thin: "Same source as 'present' (dedicated file, or matching heading/code-block evidence) but below the word/code thresholds below, or containing an explicit placeholder phrase ('coming soon'/'TBD'/etc) — treat as needing expansion, not ground-zero creation.",
    missing: "For file categories: no dedicated file exists, so the live site's tab renders empty — this is true even if related content happens to be mentioned inside a *different* tab's file (see relatedMentionsElsewhere on each entry, which is supplementary raw material only, never counted toward 'present'). For heading-only categories: no matching heading (and, where applicable, no fenced code blocks) found anywhere in the technology's files.",
    "not-applicable": "Only used for Real World, Prerequisites, and Lab Scenarios on non-technical academies — those tabs don't exist in the product's navigation for non-tech content (see nonTechSections in lib/data/navigation.ts), so absence isn't a content gap and is excluded from missing/thin counts.",
  },
  thresholds: {
    fileThinWordCount: FILE_THIN_WORD_THRESHOLD,
    headingSectionThinWordCount: HEADING_THIN_WORD_THRESHOLD,
    codeBlockPresentCount: CODE_PRESENT_THRESHOLD,
    placeholderPattern: PLACEHOLDER_RE.source,
  },
  totals: {
    technologiesScanned: perTechRows.length,
    byCategory: gapTotals,
  },
  academies: Object.fromEntries([...gapAcademies.entries()].sort(([a], [b]) => a.localeCompare(b)).map(([academy, techs]) => [academy, { technologies: techs }])),
};

const auditDir = join(ROOT, "docs/audit");
mkdirSync(auditDir, { recursive: true });
const gapsOutPath = join(auditDir, "comprehensive-gaps.json");
writeFileSync(gapsOutPath, JSON.stringify(comprehensiveGapsReport, null, 2));

console.log(`\n--- Comprehensive gap-detection pass ---`);
console.log(`  Written: docs/audit/comprehensive-gaps.json`);
console.log(`  ("present %" below = present / (present+thin+missing), i.e. excluding not-applicable — cross-check against docs/audit/07-roadmap-final.md Part 6)`);
for (const key of ALL_GAP_CATEGORY_KEYS) {
  const { present, thin, missing, notApplicable } = gapTotals[key];
  const applicable = present + thin + missing;
  const pct = applicable ? ((present / applicable) * 100).toFixed(0) : "n/a";
  const label = [...FILE_CATEGORIES, ...HEADING_CATEGORIES].find((c) => c.key === key).label;
  console.log(`  ${label.padEnd(24)} present ${String(present).padStart(3)}  thin ${String(thin).padStart(3)}  missing ${String(missing).padStart(3)}  n/a ${String(notApplicable).padStart(3)}  (${pct}% present of ${applicable} applicable)`);
}

console.log("\nDone.\n");
