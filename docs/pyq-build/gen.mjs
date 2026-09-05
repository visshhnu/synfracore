// Generic generator for the PYQ + model-answer bank (docs/pyq-bank-schema.sql):
// node docs/pyq-build/gen.mjs <key>
// Reads docs/pyq-build/<key>-data.mjs, writes docs/<key>_seed.sql with
// {{TOKEN}} UUID placeholders -- run scripts/fill-seed-uuids.mjs on the
// output afterward, same two-step process as docs/jee-build/gen.mjs.
//
// Data file shape:
//   export const COLLECTION = { slug, subject, title, examPaper: "paper-1"|"paper-2", year, questionCount, sortOrder };
//   export const QUESTIONS = [{ section, questionNumber, marks, wordLimit, questionText, modelAnswer, examinerNotes, sourceNote }];
//
// Every question MUST have a real, verifiable sourceNote citing the exact
// UPSC exam year/paper/question number it was actually asked in -- this
// script does not and cannot verify that itself, it only assembles what's
// given. Do not run this over a data file containing an invented "PYQ-style"
// question with no real source -- exclude it from the data file instead.
import { writeFileSync } from "node:fs";

const key = process.argv[2];
if (!key) { console.error("Usage: node docs/pyq-build/gen.mjs <key>"); process.exit(1); }

const { COLLECTION, QUESTIONS } = await import(`./${key}-data.mjs`);

function esc(s) { return String(s).replace(/'/g, "''"); }

if (QUESTIONS.length !== COLLECTION.questionCount) {
  console.error(`FAIL -- COLLECTION.questionCount (${COLLECTION.questionCount}) !== QUESTIONS.length (${QUESTIONS.length})`);
  process.exit(1);
}
for (const q of QUESTIONS) {
  if (!q.sourceNote || q.sourceNote.trim().length === 0) {
    console.error(`FAIL -- question ${q.questionNumber} has no sourceNote. Every row must cite a real, verifiable UPSC exam year/paper. Exclude the question instead of leaving this blank.`);
    process.exit(1);
  }
}

const lines = [];
lines.push(`-- ============================================================`);
lines.push(`-- ${COLLECTION.title}`);
lines.push(`-- PYQ + Model Answer collection (${QUESTIONS.length} questions)`);
lines.push(`-- ============================================================`);
lines.push(``);

const collectionId = "{{COLLECTION}}";
lines.push(`-- ---------- Collection ----------`);
lines.push(`INSERT INTO pyq_collections (id, slug, subject, title, exam_paper, year, is_premium, question_count, sort_order)`);
lines.push(`VALUES ('${collectionId}', '${esc(COLLECTION.slug)}', '${esc(COLLECTION.subject)}', '${esc(COLLECTION.title)}', '${COLLECTION.examPaper}', ${COLLECTION.year}, true, ${QUESTIONS.length}, ${COLLECTION.sortOrder});`);
lines.push(``);

let sortOrder = 0;
for (const q of QUESTIONS) {
  sortOrder += 1;
  const qId = `{{Q${sortOrder}}}`;
  const sectionVal = q.section ? `'${esc(q.section)}'` : "NULL";
  const wordLimitVal = q.wordLimit != null ? q.wordLimit : "NULL";
  lines.push(`INSERT INTO pyq_questions (id, collection_id, sort_order, section, question_number, marks, word_limit, question_text)`);
  lines.push(`VALUES ('${qId}', '${collectionId}', ${sortOrder}, ${sectionVal}, '${esc(q.questionNumber)}', ${q.marks}, ${wordLimitVal}, '${esc(q.questionText)}');`);
  const examinerNotesVal = q.examinerNotes ? `'${esc(q.examinerNotes)}'` : "NULL";
  lines.push(`INSERT INTO pyq_model_answers (question_id, model_answer, examiner_notes, source_note)`);
  lines.push(`VALUES ('${qId}', '${esc(q.modelAnswer)}', ${examinerNotesVal}, '${esc(q.sourceNote)}');`);
  lines.push(``);
}

writeFileSync(`d:/synfracore/docs/${key}_seed.sql`, lines.join("\n"));
console.log(`Done -- ${QUESTIONS.length} questions written -> d:/synfracore/docs/${key}_seed.sql`);
