// Generates docs/hal_seed_paper_1.sql (with {{TOKEN}} UUID placeholders) from
// docs/hal-build/paper1-data.mjs. Run scripts/fill-seed-uuids.mjs on the
// output afterward to fill in real UUIDs — same two-step process used for
// the AWS SAA / Security+ papers. Mirrors docs/aws_saa_seed_paper_1.sql's
// final format otherwise (one INSERT per row).
import { writeFileSync } from "node:fs";
import { PAPER, SECTIONS } from "./paper1-data.mjs";

function esc(s) {
  return String(s).replace(/'/g, "''");
}

const lines = [];
lines.push(`-- ============================================================`);
lines.push(`-- HAL Design/Management Trainee -- Electrical & Electronics Engineering`);
lines.push(`-- Full-Length Mock Paper 1 (${PAPER.questionCount} questions, ${PAPER.timeLimitMinutes} minutes)`);
lines.push(`-- `);
lines.push(`-- SOURCE: informally shared study material (not an official/proprietary HAL`);
lines.push(`-- archive). Honest per-question source note via question_answers.source_note`);
lines.push(`-- (already rendered in the results-review UI):`);
lines.push(`--   Section A (General Awareness, Q1-20): written to match HAL's real GA`);
lines.push(`--     scope, not taken from an official HAL paper.`);
lines.push(`--   Section B (English & Reasoning, Q21-60): general competitive-exam style`);
lines.push(`--     practice content, not an official HAL paper.`);
lines.push(`--   Section C (Electrical & Electronics discipline, Q61-160): technical`);
lines.push(`--     difficulty based on GATE-pattern questions, not an official HAL paper.`);
lines.push(`--     All 160 answers independently checked/derived, not copied from source.`);
lines.push(`-- Run this AFTER docs/question-bank-schema.sql.`);
lines.push(`-- ============================================================`);
lines.push(``);

// Emits {{TOKEN}} placeholders (not real UUIDs directly) — filled by
// scripts/fill-seed-uuids.mjs afterward, same two-step process used for
// the AWS SAA / Security+ papers, per explicit instruction for this paper.
const paperId = "{{PAPER}}";
lines.push(`-- ---------- Paper ----------`);
lines.push(
  `INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)`
);
lines.push(
  `VALUES ('${paperId}', '${PAPER.slug}', '${esc(PAPER.title)}', '${PAPER.examType}', ARRAY[${PAPER.focusTags.map((t) => `'${esc(t)}'`).join(", ")}]::TEXT[], ${PAPER.questionCount}, '${PAPER.difficulty}', true, ${PAPER.sortOrder}, ${PAPER.timeLimitMinutes});`
);
lines.push(``);

let sortOrder = 0;
const allStems = [];
for (const section of SECTIONS) {
  lines.push(`-- ── Section: ${section.name} (${section.questions.length} questions) ──`);
  lines.push(``);
  for (const q of section.questions) {
    sortOrder += 1;
    allStems.push(q.stem);
    const qId = `{{Q${sortOrder}}}`;
    lines.push(`INSERT INTO questions (id, paper_id, sort_order, question_text)`);
    lines.push(`VALUES ('${qId}', '${paperId}', ${sortOrder}, '${esc(q.stem)}');`);
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

writeFileSync("d:/synfracore/docs/hal_seed_paper_1.sql", lines.join("\n"), "utf8");

// ---- integrity checks ----
const dupStems = allStems.filter((s, i) => allStems.indexOf(s) !== i);
console.log(`Total questions written: ${sortOrder} (expected ${PAPER.questionCount})`);
console.log(`Duplicate question stems: ${dupStems.length}`, dupStems);
for (const section of SECTIONS) {
  for (const q of section.questions) {
    if (q.options.length !== 4) console.log("BAD OPTION COUNT:", q.stem);
    if (q.correct < 0 || q.correct > 3) console.log("BAD CORRECT INDEX:", q.stem);
  }
}
console.log("Done -> docs/hal_seed_paper_1.sql");
