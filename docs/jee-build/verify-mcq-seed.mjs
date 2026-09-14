import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";
config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const slug = process.argv[2];
if (!slug) { console.error("Usage: node verify-mcq-seed.mjs <paper-slug>"); process.exit(1); }

const { data: paper, error: e1 } = await supabase.from("question_papers").select("*").eq("slug", slug).single();
console.log("Paper:", JSON.stringify(paper, null, 2));
if (e1) { console.error("Paper error:", e1); process.exit(1); }

const { data: qs, error: e2 } = await supabase.from("questions").select("id, sort_order").eq("paper_id", paper.id).order("sort_order");
console.log("Questions count:", qs?.length);
if (e2) console.error("Questions error:", e2);

const qIds = qs.map((q) => q.id);
const { data: opts, error: e3 } = await supabase.from("question_options").select("id, question_id").in("question_id", qIds);
console.log("Options count:", opts?.length, "(expect", qIds.length * 4, ")");
if (e3) console.error("Options error:", e3);

const { data: ans, error: e4 } = await supabase.from("question_answers").select("question_id, correct_option_id").in("question_id", qIds);
console.log("Answers count:", ans?.length);
if (e4) console.error("Answers error:", e4);

const ansByQ = new Set(ans.map((a) => a.question_id));
const missingAns = qIds.filter((id) => !ansByQ.has(id));
console.log("Questions missing an answer:", missingAns.length);

const optCountByQ = {};
for (const o of opts) optCountByQ[o.question_id] = (optCountByQ[o.question_id] || 0) + 1;
const wrongOptCount = qIds.filter((id) => (optCountByQ[id] || 0) !== 4);
console.log("Questions without exactly 4 options:", wrongOptCount.length);

const validOptionIds = new Set(opts.map((o) => o.id));
const badCorrectRef = ans.filter((a) => !validOptionIds.has(a.correct_option_id));
console.log("Answers pointing at a non-existent option:", badCorrectRef.length);
