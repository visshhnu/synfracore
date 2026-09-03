// Generic generator: node docs/neet-build/gen.mjs <key>
// Reads docs/neet-build/<key>-data.mjs, writes docs/<key>_seed.sql with
// {{TOKEN}} UUID placeholders. Run scripts/fill-seed-uuids.mjs on the output
// afterward. Same process used for HAL/AWS SAA/Security+/CCS/CPT, extended
// here to also write subject/topic per question and the paper's
// positive_marks/negative_marks (NEET is the first paper set to use a
// non-default marking scheme, per docs/add-question-subject-marking.sql).
// <key> examples: "neet1", "neet2", ... "neet5".
import { writeFileSync } from "node:fs";

const key = process.argv[2];
if (!key) { console.error("Usage: node docs/neet-build/gen.mjs <key>"); process.exit(1); }

const { PAPER, SECTIONS, HEADER_LABEL } = await import(`./${key}-data.mjs`);

function esc(s) {
  return String(s).replace(/'/g, "''");
}

const lines = [];
lines.push(`-- ============================================================`);
lines.push(`-- ${HEADER_LABEL}`);
lines.push(`-- Full-Length Practice Paper (${PAPER.questionCount} questions, ${PAPER.timeLimitMinutes} minutes)`);
lines.push(`-- Marking: +${PAPER.positiveMarks} correct / -${PAPER.negativeMarks} incorrect (official NEET UG scheme)`);
lines.push(`-- Run this AFTER docs/add-question-subject-marking.sql.`);
lines.push(`-- ============================================================`);
lines.push(``);

const paperId = "{{PAPER}}";
lines.push(`-- ---------- Paper ----------`);
lines.push(
  `INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)`
);
lines.push(
  `VALUES ('${paperId}', '${PAPER.slug}', '${esc(PAPER.title)}', '${PAPER.examType}', ARRAY[${PAPER.focusTags.map((t) => `'${esc(t)}'`).join(", ")}]::TEXT[], ${PAPER.questionCount}, '${PAPER.difficulty}', true, ${PAPER.sortOrder}, ${PAPER.timeLimitMinutes}, ${PAPER.positiveMarks}, ${PAPER.negativeMarks});`
);
lines.push(``);

let sortOrder = 0;
const allStems = [];
const distractorFlags = [];
const RISKY_PHRASES = /\bcannot\b|\bnever\b|\bis not possible\b|\bno such\b|\bimpossible\b|\bunder no circumstances\b/i;

for (const section of SECTIONS) {
  lines.push(`-- ── Section: ${section.name} (${section.questions.length} questions) — ${section.sourceNote} ──`);
  lines.push(``);
  for (const q of section.questions) {
    sortOrder += 1;
    allStems.push(q.stem);
    const correctText = q.options[q.correct];
    if (RISKY_PHRASES.test(correctText)) {
      distractorFlags.push({ sortOrder, stem: q.stem, correctText });
    }
    const qId = `{{Q${sortOrder}}}`;
    const subjectVal = section.subject ? `'${esc(section.subject)}'` : "NULL";
    const topicVal = q.topic ? `'${esc(q.topic)}'` : "NULL";
    lines.push(`INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)`);
    lines.push(`VALUES ('${qId}', '${paperId}', ${sortOrder}, '${esc(q.stem)}', ${subjectVal}, ${topicVal});`);
    const optionIds = q.options.map((_, i) => `{{Q${sortOrder}_OPT${i}}}`);
    q.options.forEach((opt, i) => {
      lines.push(
        `INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('${optionIds[i]}', '${qId}', ${i}, '${esc(opt)}');`
      );
    });
    lines.push(`INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)`);
    lines.push(
      `VALUES ('${qId}', '${optionIds[q.correct]}', '${esc(q.explanation)}', '${esc(section.sourceNote)}');`
    );
    lines.push(``);
  }
}

const outPath = `d:/synfracore/docs/${key}_seed.sql`;
writeFileSync(outPath, lines.join("\n"), "utf8");

const dupStems = allStems.filter((s, i) => allStems.indexOf(s) !== i);
console.log(`Total questions written: ${sortOrder} (expected ${PAPER.questionCount})`);
console.log(`Duplicate question stems (within paper): ${dupStems.length}`, dupStems);
for (const section of SECTIONS) {
  if (!section.subject) console.log("MISSING SECTION SUBJECT:", section.name);
  for (const q of section.questions) {
    if (q.options.length !== 4) console.log("BAD OPTION COUNT:", q.stem);
    if (q.correct < 0 || q.correct > 3) console.log("BAD CORRECT INDEX:", q.stem);
    if (!q.topic) console.log("MISSING TOPIC:", q.stem);
  }
}
console.log(`Distractor-language sanity-scan flags on the CORRECT answer (manually verify each, don't auto-fix): ${distractorFlags.length}`);
for (const f of distractorFlags) console.log("  FLAG Q" + f.sortOrder + ":", f.stem, "-> correct:", f.correctText);

// Quote-balance check: every '' -stripped line in the written SQL (excluding
// comment lines, which seed.mjs's stripComments() removes before parsing and
// so can never break a string literal) should have an even number of raw
// single quotes (odd means an unescaped quote slipped through esc()).
const written = lines.join("\n");
let quoteIssues = 0;
written.split("\n").forEach((line, i) => {
  if (line.trim().startsWith("--")) return;
  const stripped = line.replace(/''/g, "");
  const count = (stripped.match(/'/g) || []).length;
  if (count % 2 !== 0) { quoteIssues++; console.log(`QUOTE IMBALANCE at generated line ${i + 1}:`, line); }
});
console.log(`Quote-balance issues: ${quoteIssues}`);

const subjectCounts = {};
for (const section of SECTIONS) subjectCounts[section.subject] = (subjectCounts[section.subject] || 0) + section.questions.length;
console.log("Subject counts:", subjectCounts);

console.log(`Done -> ${outPath}`);
