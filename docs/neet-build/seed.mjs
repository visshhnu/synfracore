// Generic production seeder: node docs/neet-build/seed.mjs <key>
// Parses docs/<key>_seed.sql and writes it via the Supabase service-role
// client, in FK-safe order. Extended from docs/healthcare-build/seed.mjs to
// also parse questions.subject/topic and question_papers.positive_marks/
// negative_marks.
import { readFileSync } from "node:fs";
import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

const key = process.argv[2];
if (!key) { console.error("Usage: node docs/neet-build/seed.mjs <key>"); process.exit(1); }

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
  let cur = "", inStr = false, depth = 0;
  for (let i = 0; i < rest.length; i++) {
    const c = rest[i], next = rest[i + 1];
    if (c === "'") {
      if (inStr && next === "'") { cur += "'"; i++; continue; }
      inStr = !inStr;
      continue;
    }
    if (!inStr && c === "[") { depth++; cur += c; continue; }
    if (!inStr && c === "]") { depth--; cur += c; continue; }
    if (!inStr && c === "," && depth === 0) { fields.push(cur.trim()); cur = ""; continue; }
    cur += c;
  }
  if (cur.trim().length) fields.push(cur.trim());
  return fields;
}

function parseArrayLiteral(raw) {
  const inner = raw.slice(raw.indexOf("[") + 1, raw.indexOf("]"));
  return inner.split(",").map((s) => s.trim());
}

function nullableStr(raw) {
  return raw === "NULL" ? null : raw;
}

const statements = splitStatements(sql).filter((s) => s.startsWith("INSERT"));
console.log("Total INSERT statements to run:", statements.length);

const papers = [], questions = [], options = [], answers = [];

for (const stmt of statements) {
  const fields = parseValues(stmt);
  if (stmt.includes("question_papers")) {
    papers.push({
      id: fields[0], slug: fields[1], title: fields[2], exam_type: fields[3],
      focus_tags: parseArrayLiteral(fields[4]),
      question_count: Number(fields[5]), difficulty: fields[6],
      is_premium: fields[7] === "true", sort_order: Number(fields[8]),
      time_limit_minutes: Number(fields[9]),
      positive_marks: Number(fields[10]), negative_marks: Number(fields[11]),
    });
  } else if (stmt.startsWith("INSERT INTO questions")) {
    questions.push({
      id: fields[0], paper_id: fields[1], sort_order: Number(fields[2]), question_text: fields[3],
      subject: nullableStr(fields[4]), topic: nullableStr(fields[5]),
    });
  } else if (stmt.includes("question_options")) {
    options.push({ id: fields[0], question_id: fields[1], sort_order: Number(fields[2]), option_text: fields[3] });
  } else if (stmt.includes("question_answers")) {
    answers.push({ question_id: fields[0], correct_option_id: fields[1], explanation: fields[2], source_note: fields[3] });
  }
}

console.log(`Parsed: ${papers.length} paper(s), ${questions.length} questions, ${options.length} options, ${answers.length} answers`);

async function bulkInsert(table, rows, chunkSize = 200) {
  for (let i = 0; i < rows.length; i += chunkSize) {
    const chunk = rows.slice(i, i + chunkSize);
    const { error } = await supabase.from(table).insert(chunk);
    if (error) throw new Error(`${table} insert failed at offset ${i}: ${error.message}`);
  }
  console.log(`Inserted ${rows.length} rows into ${table}`);
}

await bulkInsert("question_papers", papers, 10);
await bulkInsert("questions", questions);
await bulkInsert("question_options", options);
await bulkInsert("question_answers", answers);

console.log("Seed complete.");
