// Production seeder for the PYQ + model-answer bank (docs/pyq-bank-schema.sql):
// node docs/pyq-build/seed.mjs <key>
// Parses docs/<key>_seed.sql and writes it via the Supabase service-role
// client, in FK-safe order. Same parsing approach as docs/jee-build/seed.mjs,
// adapted for this schema's 3 tables (no options/answer-shape branching --
// this schema has no correct-option concept at all).
import { readFileSync } from "node:fs";
import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

const key = process.argv[2];
if (!key) { console.error("Usage: node docs/pyq-build/seed.mjs <key>"); process.exit(1); }

config({ path: "d:/synfracore/.env.local" });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const sql = readFileSync(`d:/synfracore/docs/${key}_seed.sql`, "utf8");

function stripComments(text) {
  return text.split("\n").map((line) => (line.trim().startsWith("--") ? "" : line)).join("\n");
}

function splitStatements(text) {
  const clean = stripComments(text);
  let inString = false;
  let stmt = "";
  const out = [];
  for (let i = 0; i < clean.length; i++) {
    const c = clean[i], next = clean[i + 1];
    if (c === "'") {
      if (inString && next === "'") { stmt += "''"; i++; continue; }
      inString = !inString;
      stmt += c;
      continue;
    }
    if (c === ";" && !inString) {
      stmt += c;
      const t = stmt.trim();
      if (t.length > 0) out.push(t);
      stmt = "";
      continue;
    }
    stmt += c;
  }
  return out;
}

function parseValues(stmt) {
  const valuesIdx = stmt.indexOf("VALUES");
  let rest = stmt.slice(valuesIdx + "VALUES".length).trim();
  rest = rest.slice(1, rest.lastIndexOf(")"));
  const fields = [];
  let cur = "", inStr = false;
  for (let i = 0; i < rest.length; i++) {
    const c = rest[i], next = rest[i + 1];
    if (c === "'") {
      if (inStr && next === "'") { cur += "'"; i++; continue; }
      inStr = !inStr;
      continue;
    }
    if (!inStr && c === "," ) { fields.push(cur.trim()); cur = ""; continue; }
    cur += c;
  }
  if (cur.trim().length) fields.push(cur.trim());
  return fields;
}

function nullableStr(raw) {
  return raw === "NULL" ? null : raw;
}
function nullableNum(raw) {
  return raw === "NULL" ? null : Number(raw);
}

const statements = splitStatements(sql).filter((s) => s.startsWith("INSERT"));
console.log("Total INSERT statements to run:", statements.length);

const collections = [], questions = [], modelAnswers = [];

for (const stmt of statements) {
  const fields = parseValues(stmt);
  if (stmt.includes("pyq_collections")) {
    collections.push({
      id: fields[0], slug: fields[1], subject: fields[2], title: fields[3],
      exam_paper: fields[4], year: Number(fields[5]), is_premium: fields[6] === "true",
      question_count: Number(fields[7]), sort_order: Number(fields[8]),
    });
  } else if (stmt.includes("pyq_questions")) {
    questions.push({
      id: fields[0], collection_id: fields[1], sort_order: Number(fields[2]),
      section: nullableStr(fields[3]), question_number: fields[4],
      marks: Number(fields[5]), word_limit: nullableNum(fields[6]), question_text: fields[7],
    });
  } else if (stmt.includes("pyq_model_answers")) {
    modelAnswers.push({
      question_id: fields[0], model_answer: fields[1],
      examiner_notes: nullableStr(fields[2]), source_note: fields[3],
    });
  }
}

console.log(`Parsed: ${collections.length} collection(s), ${questions.length} questions, ${modelAnswers.length} model answers`);

async function bulkInsert(table, rows, chunkSize = 50) {
  for (let i = 0; i < rows.length; i += chunkSize) {
    const chunk = rows.slice(i, i + chunkSize);
    const { error } = await supabase.from(table).insert(chunk);
    if (error) throw new Error(`${table} insert failed at offset ${i}: ${error.message}`);
  }
  console.log(`Inserted ${rows.length} rows into ${table}`);
}

await bulkInsert("pyq_collections", collections, 10);
await bulkInsert("pyq_questions", questions);
await bulkInsert("pyq_model_answers", modelAnswers, 20);

console.log("Seed complete.");
