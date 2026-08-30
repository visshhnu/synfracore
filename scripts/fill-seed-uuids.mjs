// Replaces every {{TOKEN}} placeholder in a seed SQL file with a fresh,
// real UUID — the same token always gets the same UUID everywhere it
// appears in the file, so a question's own {{Q5}} placeholder and every
// {{Q5}} reference in its options/answer row all resolve consistently.
//
// Exists specifically to eliminate the UUID-collision bug class that hit
// three earlier seed papers (AWS SAA Papers 1 and 3, manual tracking
// errors across a long file) — a script generating and substituting IDs
// mechanically cannot make that kind of copy-paste mistake the way manual
// bookkeeping did twice.
//
// Run with: node scripts/fill-seed-uuids.mjs <path-to-seed-file.sql>
// Overwrites the file in place. Run scripts/check-seed-uuid-integrity.mjs
// (if present) or a manual review after, same as every other seed file.

import { randomUUID } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";

const path = process.argv[2];
if (!path) {
  console.error("Usage: node scripts/fill-seed-uuids.mjs <path-to-seed-file.sql>");
  process.exit(1);
}

let content = readFileSync(path, "utf8");
const tokenPattern = /\{\{([A-Za-z0-9_]+)\}\}/g;
const seen = new Map();

content = content.replace(tokenPattern, (_match, token) => {
  if (!seen.has(token)) {
    seen.set(token, randomUUID());
  }
  return seen.get(token);
});

writeFileSync(path, content);
console.log(`Replaced ${seen.size} distinct placeholder tokens with fresh UUIDs in ${path}.`);
