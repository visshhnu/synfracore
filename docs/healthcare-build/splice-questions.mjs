// Splices question objects from an additions file into a paper-data.mjs
// file's SECTIONS, right before the closing "]," of the section whose name
// contains --before, or at the very end of the SECTIONS array if --before
// is "END". Additions file format: `export default [ {stem:...}, ... ];`
// with each entry on its own line (same format gen.mjs/check-stems.mjs read).
// Usage: node docs/healthcare-build/splice-questions.mjs <targetFile> <additionsFile> <beforeSectionNameSubstring|END>
import { readFileSync, writeFileSync, unlinkSync } from "node:fs";

const [targetPath, addPath, before] = process.argv.slice(2);
if (!targetPath || !addPath || !before) {
  console.error("Usage: node splice-questions.mjs <targetFile> <additionsFile> <beforeSectionNameSubstring|END>");
  process.exit(1);
}

const addRaw = readFileSync(addPath, "utf8").split("\n");
const addLines = addRaw.slice(1, -2).map((l) => l.replace(/^  /, "      "));

const target = readFileSync(targetPath, "utf8").split("\n");

let closingIdx;
if (before === "END") {
  // Last "]," before the final "];" that closes SECTIONS itself.
  const lastSectionsClose = target.lastIndexOf("];");
  closingIdx = target.lastIndexOf("    ],", lastSectionsClose);
} else {
  const sectionIdx = target.findIndex((l) => l.trim().startsWith("name:") && l.includes(before));
  if (sectionIdx === -1) throw new Error(`No section header found containing "${before}"`);
  closingIdx = sectionIdx - 3;
}

if (target[closingIdx].trim() !== "],") {
  throw new Error(`Unexpected line at computed splice point (index ${closingIdx}): "${target[closingIdx]}"`);
}

const spliced = [...target.slice(0, closingIdx), ...addLines, ...target.slice(closingIdx)];
writeFileSync(targetPath, spliced.join("\n"), "utf8");
unlinkSync(addPath);
console.log(`Spliced ${addLines.length} question(s) into ${targetPath} before "${before}". New line count: ${spliced.length}`);
