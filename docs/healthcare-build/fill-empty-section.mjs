// Fills an empty "questions: []," section with questions from an additions
// file (export default [ {...}, ... ];). Usage:
// node fill-empty-section.mjs <targetFile> <additionsFile> <sectionNameExact>
import { readFileSync, writeFileSync, unlinkSync } from "node:fs";

const [targetPath, addPath, sectionName] = process.argv.slice(2);
if (!targetPath || !addPath || !sectionName) {
  console.error("Usage: node fill-empty-section.mjs <targetFile> <additionsFile> <sectionNameExact>");
  process.exit(1);
}

const addRaw = readFileSync(addPath, "utf8").split("\n");
const qLines = addRaw.slice(1, -2).map((l) => l.replace(/^  /, "      "));

const target = readFileSync(targetPath, "utf8").split("\n");
const headerIdx = target.findIndex((l) => l.trim() === `name: "${sectionName}",`);
if (headerIdx === -1) throw new Error(`No exact section header found for "${sectionName}"`);
const arrIdx = headerIdx + 2;
if (target[arrIdx].trim() !== "questions: [],") {
  throw new Error(`Expected empty "questions: []," at index ${arrIdx}, found: "${target[arrIdx]}"`);
}
target[arrIdx] = "    questions: [";
const spliced = [...target.slice(0, arrIdx + 1), ...qLines, "    ],", ...target.slice(arrIdx + 1)];
writeFileSync(targetPath, spliced.join("\n"), "utf8");
unlinkSync(addPath);
console.log(`Filled ${qLines.length} question(s) into "${sectionName}". New line count: ${spliced.length}`);
