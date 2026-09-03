import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const { data: paper } = await supabase.from("question_papers").select("id").eq("slug", "hal-civil-practice-1").single();
const { data: questions } = await supabase
  .from("questions")
  .select("sort_order, question_text")
  .eq("paper_id", paper.id)
  .gte("sort_order", 21)
  .lte("sort_order", 60)
  .order("sort_order", { ascending: true });

console.log(`Paper 6 (Civil Engineering) — English & Reasoning section, sort_order 21-60, from the live DB:\n`);
for (const q of questions) {
  console.log(`  [${q.sort_order}] ${q.question_text.slice(0, 90)}${q.question_text.length > 90 ? "..." : ""}`);
}
console.log(`\nTotal rows returned: ${questions.length}`);
