// Generic generator: node docs/hal-build/gen.mjs <n>
// Reads docs/hal-build/paper<n>-data.mjs, writes docs/hal_seed_paper_<n>.sql
// with {{TOKEN}} UUID placeholders. Run scripts/fill-seed-uuids.mjs on the
// output afterward. Same two-step process used for AWS SAA / Security+.
import { writeFileSync } from "node:fs";

const n = process.argv[2];
if (!n) { console.error("Usage: node docs/hal-build/gen.mjs <paper-number>"); process.exit(1); }

const { PAPER, SECTIONS, HEADER_LABEL } = await import(`./paper${n}-data.mjs`);

function esc(s) {
  return String(s).replace(/'/g, "''");
}

const lines = [];
lines.push(`-- ============================================================`);
lines.push(`-- HAL Design/Management Trainee -- ${HEADER_LABEL}`);
lines.push(`-- Full-Length Mock Paper ${n} (${PAPER.questionCount} questions, ${PAPER.timeLimitMinutes} minutes)`);
lines.push(`-- `);
lines.push(`-- SOURCE: informally shared study material (not an official/proprietary HAL`);
lines.push(`-- archive). Honest per-question source note via question_answers.source_note`);
lines.push(`-- (already rendered in the results-review UI) -- see each section below.`);
lines.push(`-- Run this AFTER docs/question-bank-schema.sql.`);
lines.push(`-- ============================================================`);
lines.push(``);

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
  lines.push(`-- ── Section: ${section.name} (${section.questions.length} questions) — ${section.sourceNote} ──`);
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

const outPath = `d:/synfracore/docs/hal_seed_paper_${n}.sql`;
writeFileSync(outPath, lines.join("\n"), "utf8");

const dupStems = allStems.filter((s, i) => allStems.indexOf(s) !== i);
console.log(`Total questions written: ${sortOrder} (expected ${PAPER.questionCount})`);
console.log(`Duplicate question stems: ${dupStems.length}`, dupStems);
for (const section of SECTIONS) {
  for (const q of section.questions) {
    if (q.options.length !== 4) console.log("BAD OPTION COUNT:", q.stem);
    if (q.correct < 0 || q.correct > 3) console.log("BAD CORRECT INDEX:", q.stem);
  }
}
console.log(`Done -> ${outPath}`);
