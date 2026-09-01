// Generic collision checker: node docs/hal-build/collision_check.mjs <n>
// Checks every UUID in docs/hal_seed_paper_<n>.sql against all live UUIDs
// currently in production (question_papers/questions/question_options) --
// which by construction includes every previously-seeded paper, HAL or not.
import { readFileSync } from "node:fs";
import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

const n = process.argv[2];
if (!n) { console.error("Usage: node docs/hal-build/collision_check.mjs <paper-number>"); process.exit(1); }

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const sql = readFileSync(`d:/synfracore/docs/hal_seed_paper_${n}.sql`, "utf8");
const newUuids = new Set(sql.match(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/g));
console.log(`New UUIDs in paper ${n}:`, newUuids.size);

async function getAllIds(table) {
  const ids = [];
  let from = 0;
  const pageSize = 1000;
  while (true) {
    const { data, error } = await supabase.from(table).select("id").range(from, from + pageSize - 1);
    if (error) throw error;
    if (!data || data.length === 0) break;
    ids.push(...data.map((r) => r.id));
    if (data.length < pageSize) break;
    from += pageSize;
  }
  return ids;
}

const tables = ["question_papers", "questions", "question_options"];
let liveIds = [];
for (const t of tables) {
  const ids = await getAllIds(t);
  console.log(`${t}: ${ids.length} live rows`);
  liveIds.push(...ids);
}
console.log("Total live UUIDs:", liveIds.length);

const liveSet = new Set(liveIds);
let collisions = 0;
for (const id of newUuids) {
  if (liveSet.has(id)) { collisions++; console.log("COLLISION:", id); }
}
console.log("Collisions found:", collisions);
