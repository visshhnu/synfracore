// Direct DB verification of per-section question counts for all 6 HAL papers.
// Buckets questions by question_answers.source_note (grouped into GA /
// English & Reasoning / Discipline based on the note's own text) and
// cross-checks against questions.sort_order ranges as an independent signal.
import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const slugs = [
  "hal-eee-practice-1",
  "hal-mech-practice-1",
  "hal-ece-practice-1",
  "hal-cse-practice-1",
  "hal-aero-practice-1",
  "hal-civil-practice-1",
];

function classify(note) {
  if (!note) return "MISSING_SOURCE_NOTE";
  if (note.startsWith("General Awareness")) return "General Awareness";
  if (note.startsWith("English & Reasoning")) return "English & Reasoning";
  if (note.startsWith("Discipline")) return "Discipline";
  return "UNRECOGNIZED: " + note.slice(0, 50);
}

for (const slug of slugs) {
  const { data: paper, error: pErr } = await supabase.from("question_papers").select("id, title, question_count").eq("slug", slug).single();
  if (pErr || !paper) {
    console.log(`\n=== ${slug} ===`);
    console.log("PAPER NOT FOUND:", pErr?.message);
    continue;
  }

  const { data: questions, error: qErr } = await supabase
    .from("questions")
    .select("id, sort_order")
    .eq("paper_id", paper.id)
    .order("sort_order", { ascending: true });
  if (qErr) throw qErr;

  const qIds = questions.map((q) => q.id);
  const { data: answers, error: aErr } = await supabase
    .from("question_answers")
    .select("question_id, source_note")
    .in("question_id", qIds);
  if (aErr) throw aErr;

  const noteByQ = new Map(answers.map((a) => [a.question_id, a.source_note]));

  const buckets = {};
  const sortOrdersByBucket = {};
  for (const q of questions) {
    const note = noteByQ.get(q.id);
    const bucket = classify(note);
    buckets[bucket] = (buckets[bucket] || 0) + 1;
    if (!sortOrdersByBucket[bucket]) sortOrdersByBucket[bucket] = [];
    sortOrdersByBucket[bucket].push(q.sort_order);
  }

  console.log(`\n=== ${slug} (${paper.title}) ===`);
  console.log(`  DB question_papers.question_count field: ${paper.question_count}`);
  console.log(`  Actual questions rows: ${questions.length}`);
  for (const [bucket, count] of Object.entries(buckets)) {
    const orders = sortOrdersByBucket[bucket].sort((a, b) => a - b);
    console.log(`  ${bucket}: ${count} questions (sort_order range ${orders[0]}-${orders[orders.length - 1]})`);
  }
}
