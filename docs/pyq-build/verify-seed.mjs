import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";
config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const slug = process.argv[2];
if (!slug) { console.error("Usage: node verify-seed.mjs <collection-slug>"); process.exit(1); }

const { data: coll, error: e1 } = await supabase.from("pyq_collections").select("*").eq("slug", slug).single();
console.log("Collection:", JSON.stringify(coll, null, 2));
if (e1) console.error("Collection error:", e1);

const { data: qs, error: e2 } = await supabase.from("pyq_questions").select("id, sort_order, question_number, marks, word_limit").eq("collection_id", coll.id).order("sort_order");
console.log("Questions count:", qs?.length);
if (e2) console.error("Questions error:", e2);

const qIds = qs.map((q) => q.id);
const { data: answers, error: e3 } = await supabase.from("pyq_model_answers").select("question_id, source_note").in("question_id", qIds);
console.log("Model answers count:", answers?.length);
if (e3) console.error("Answers error:", e3);

const answerIds = new Set(answers.map((a) => a.question_id));
const missing = qIds.filter((id) => !answerIds.has(id));
console.log("Questions missing an answer:", missing.length);

const emptySource = answers.filter((a) => !a.source_note || a.source_note.trim().length === 0);
console.log("Answers with empty source_note:", emptySource.length);
