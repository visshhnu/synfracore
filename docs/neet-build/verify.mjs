// Generic post-seed verifier: node docs/neet-build/verify.mjs <paper-slug>
import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

const slug = process.argv[2];
if (!slug) { console.error("Usage: node docs/neet-build/verify.mjs <paper-slug>"); process.exit(1); }

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const { data: paper, error: pErr } = await supabase.from("question_papers").select("*").eq("slug", slug).single();
if (pErr) throw pErr;
console.log("Paper:", paper.title, "| exam_type:", paper.exam_type, "| question_count:", paper.question_count, "| time_limit:", paper.time_limit_minutes, "| is_premium:", paper.is_premium, "| marks:", `+${paper.positive_marks}/-${paper.negative_marks}`);

const { count: qCount } = await supabase.from("questions").select("*", { count: "exact", head: true }).eq("paper_id", paper.id);
console.log("questions rows:", qCount);

const { data: qids } = await supabase.from("questions").select("id, subject, topic").eq("paper_id", paper.id);
const ids = qids.map((q) => q.id);

const { count: oCount } = await supabase.from("question_options").select("*", { count: "exact", head: true }).in("question_id", ids);
console.log("question_options rows:", oCount);

const { count: aCount } = await supabase.from("question_answers").select("*", { count: "exact", head: true }).in("question_id", ids);
console.log("question_answers rows:", aCount);

const { data: allOptions } = await supabase.from("question_options").select("id, question_id").in("question_id", ids);
const { data: allAnswers } = await supabase.from("question_answers").select("question_id, correct_option_id, source_note").in("question_id", ids);

const optionsByQ = new Map();
for (const o of allOptions) {
  if (!optionsByQ.has(o.question_id)) optionsByQ.set(o.question_id, []);
  optionsByQ.get(o.question_id).push(o.id);
}
let badOptionCount = 0;
for (const qid of ids) {
  const opts = optionsByQ.get(qid) || [];
  if (opts.length !== 4) { badOptionCount++; console.log("BAD option count for question", qid, ":", opts.length); }
}
console.log("Questions with != 4 options:", badOptionCount);

const answerByQ = new Map(allAnswers.map((a) => [a.question_id, a]));
let missingAnswer = 0, badCorrectRef = 0;
for (const qid of ids) {
  const ans = answerByQ.get(qid);
  if (!ans) { missingAnswer++; continue; }
  const opts = optionsByQ.get(qid) || [];
  if (!opts.includes(ans.correct_option_id)) badCorrectRef++;
}
console.log("Questions missing an answer row:", missingAnswer);
console.log("Answers whose correct_option_id isn't among that question's options:", badCorrectRef);

const missingSubject = qids.filter((q) => !q.subject).length;
const missingTopic = qids.filter((q) => !q.topic).length;
console.log("Questions missing subject:", missingSubject, "| missing topic:", missingTopic);

const subjectCounts = {};
for (const q of qids) subjectCounts[q.subject] = (subjectCounts[q.subject] || 0) + 1;
console.log("Subject distribution:", subjectCounts);

const sourceNotes = new Set(allAnswers.map((a) => a.source_note));
console.log("Distinct source_note values used:", sourceNotes.size);
for (const nt of sourceNotes) console.log(" -", nt);
