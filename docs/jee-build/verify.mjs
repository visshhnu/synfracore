// Generic post-seed verifier: node docs/jee-build/verify.mjs <paper-slug>
// Extended from docs/neet-build/verify.mjs to check BOTH question shapes:
// MCQ questions need exactly 4 options + a valid correct_option_id;
// numeric questions need exactly 0 options + a non-null correct_numeric_answer.
import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

const slug = process.argv[2];
if (!slug) { console.error("Usage: node docs/jee-build/verify.mjs <paper-slug>"); process.exit(1); }

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const { data: paper, error: pErr } = await supabase.from("question_papers").select("*").eq("slug", slug).single();
if (pErr) throw pErr;
console.log("Paper:", paper.title, "| exam_type:", paper.exam_type, "| question_count:", paper.question_count, "| time_limit:", paper.time_limit_minutes, "| is_premium:", paper.is_premium, "| marks:", `+${paper.positive_marks}/-${paper.negative_marks}`);

const { data: questions, error: qErr } = await supabase.from("questions").select("id, subject, topic, answer_type").eq("paper_id", paper.id);
if (qErr) throw qErr;
console.log("questions rows:", questions.length);

const ids = questions.map((q) => q.id);
const mcqIds = questions.filter((q) => q.answer_type === "mcq").map((q) => q.id);
const numericIds = questions.filter((q) => q.answer_type === "numeric").map((q) => q.id);
console.log(`answer_type split: mcq=${mcqIds.length}, numeric=${numericIds.length}`);

const { data: allOptions } = await supabase.from("question_options").select("id, question_id").in("question_id", ids);
const { data: allAnswers } = await supabase.from("question_answers").select("question_id, correct_option_id, correct_numeric_answer, source_note").in("question_id", ids);

console.log("question_options rows:", allOptions.length);
console.log("question_answers rows:", allAnswers.length);

const optionsByQ = new Map();
for (const o of allOptions) {
  if (!optionsByQ.has(o.question_id)) optionsByQ.set(o.question_id, []);
  optionsByQ.get(o.question_id).push(o.id);
}
const answerByQ = new Map(allAnswers.map((a) => [a.question_id, a]));

let badMcqOptionCount = 0, badMcqCorrectRef = 0, mcqMissingAnswer = 0;
for (const qid of mcqIds) {
  const opts = optionsByQ.get(qid) || [];
  if (opts.length !== 4) { badMcqOptionCount++; console.log("BAD option count for MCQ question", qid, ":", opts.length); }
  const ans = answerByQ.get(qid);
  if (!ans) { mcqMissingAnswer++; continue; }
  if (ans.correct_option_id == null || !opts.includes(ans.correct_option_id)) badMcqCorrectRef++;
}
console.log("MCQ questions with != 4 options:", badMcqOptionCount);
console.log("MCQ questions missing an answer row:", mcqMissingAnswer);
console.log("MCQ answers whose correct_option_id isn't among that question's options:", badMcqCorrectRef);

let badNumericOptionCount = 0, numericMissingAnswer = 0, badNumericAnswerValue = 0;
for (const qid of numericIds) {
  const opts = optionsByQ.get(qid) || [];
  if (opts.length !== 0) { badNumericOptionCount++; console.log("NUMERIC question unexpectedly has options:", qid, ":", opts.length); }
  const ans = answerByQ.get(qid);
  if (!ans) { numericMissingAnswer++; continue; }
  if (ans.correct_numeric_answer == null || !Number.isFinite(Number(ans.correct_numeric_answer))) badNumericAnswerValue++;
}
console.log("Numeric questions with unexpected options rows:", badNumericOptionCount);
console.log("Numeric questions missing an answer row:", numericMissingAnswer);
console.log("Numeric answers with a missing/invalid correct_numeric_answer:", badNumericAnswerValue);

const missingSubject = questions.filter((q) => !q.subject).length;
const missingTopic = questions.filter((q) => !q.topic).length;
console.log("Questions missing subject:", missingSubject, "| missing topic:", missingTopic);

const subjectCounts = {};
for (const q of questions) subjectCounts[q.subject] = (subjectCounts[q.subject] || 0) + 1;
console.log("Subject distribution:", subjectCounts);

const sourceNotes = new Set(allAnswers.map((a) => a.source_note));
console.log("Distinct source_note values used:", sourceNotes.size);
for (const nt of sourceNotes) console.log(" -", nt);
