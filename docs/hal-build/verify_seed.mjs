import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const { data: paper, error: pErr } = await supabase
  .from("question_papers")
  .select("*")
  .eq("slug", "hal-eee-practice-1")
  .single();
if (pErr) throw pErr;
console.log("Paper:", paper.title, "| exam_type:", paper.exam_type, "| question_count:", paper.question_count, "| time_limit:", paper.time_limit_minutes, "| is_premium:", paper.is_premium);

const { count: qCount } = await supabase.from("questions").select("*", { count: "exact", head: true }).eq("paper_id", paper.id);
console.log("questions rows:", qCount);

const { data: qids } = await supabase.from("questions").select("id").eq("paper_id", paper.id);
const { count: oCount } = await supabase.from("question_options").select("*", { count: "exact", head: true }).in("question_id", qids.map((q) => q.id));
console.log("question_options rows:", oCount);

const { count: aCount } = await supabase.from("question_answers").select("*", { count: "exact", head: true }).in("question_id", qids.map((q) => q.id));
console.log("question_answers rows:", aCount);

// Referential integrity: every question has exactly 4 options and exactly 1 answer whose correct_option_id belongs to that question's options.
const { data: allOptions } = await supabase.from("question_options").select("id, question_id").in("question_id", qids.map((q) => q.id));
const { data: allAnswers } = await supabase.from("question_answers").select("question_id, correct_option_id, source_note").in("question_id", qids.map((q) => q.id));

const optionsByQ = new Map();
for (const o of allOptions) {
  if (!optionsByQ.has(o.question_id)) optionsByQ.set(o.question_id, []);
  optionsByQ.get(o.question_id).push(o.id);
}
let badOptionCount = 0;
for (const qid of qids.map((q) => q.id)) {
  const opts = optionsByQ.get(qid) || [];
  if (opts.length !== 4) { badOptionCount++; console.log("BAD option count for question", qid, ":", opts.length); }
}
console.log("Questions with != 4 options:", badOptionCount);

const answerByQ = new Map(allAnswers.map((a) => [a.question_id, a]));
let missingAnswer = 0, badCorrectRef = 0;
for (const qid of qids.map((q) => q.id)) {
  const ans = answerByQ.get(qid);
  if (!ans) { missingAnswer++; continue; }
  const opts = optionsByQ.get(qid) || [];
  if (!opts.includes(ans.correct_option_id)) badCorrectRef++;
}
console.log("Questions missing an answer row:", missingAnswer);
console.log("Answers whose correct_option_id isn't among that question's options:", badCorrectRef);

const sourceNotes = new Set(allAnswers.map((a) => a.source_note));
console.log("Distinct source_note values used:", sourceNotes.size);
for (const n of sourceNotes) console.log(" -", n);
