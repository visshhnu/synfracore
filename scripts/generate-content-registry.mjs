// Regenerates lib/content/index.ts from disk reality instead of hand-editing
// a 2000+ line Map literal. Fixes exactly the drift found in
// docs/audit/01-architecture.md Finding 2 (6 broken entries pointing at
// files that don't exist, 236 real files never registered) by construction:
// every future run reflects the actual filesystem, not human memory.
//
// What it does:
//   1. Parses the CURRENT registry's ["key","value"] pairs (preserves every
//      existing intentional alias, e.g. one technology's content reused for
//      another, or the legacy "infrastructure/" folder prefix for what's
//      now the "devops" academy) and drops any whose value file no longer
//      exists on disk.
//   2. For every real {academy, technology} pair (from
//      lib/data/academies.ts) x every valid section slug (from
//      lib/data/navigation.ts), adds a direct-convention entry
//      (academy/tech/section -> academy/tech/section) if that exact file
//      exists on disk and isn't already covered by step 1's aliases.
//   3. Writes the result back out, sorted, with the same hasContent/
//      fetchContent/getContent exports unchanged at the bottom.
//
// Run with: npm run generate:content-registry
// Re-run any time new content is added — safe to run repeatedly.

import { readFileSync, writeFileSync, readdirSync, statSync } from "node:fs";
import { join } from "node:path";
import { buildSync } from "esbuild";
import { createRequire } from "node:module";
import { mkdtempSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";

const require = createRequire(import.meta.url);
const ROOT = process.cwd();
const REGISTRY_PATH = join(ROOT, "lib/content/index.ts");
const CONTENT_ROOT = join(ROOT, "public/content");

// ── Step 0: load the real technology catalog + section vocab by actually
// executing the TS modules (bundled via esbuild), not guessing from regex —
// same pattern already used by scripts/run-validate-roadmaps.mjs. ────────
function loadModule(entryPoint) {
  const tmpDir = mkdtempSync(join(tmpdir(), "synfracore-gen-"));
  const outFile = join(tmpDir, "mod.cjs");
  try {
    const result = buildSync({ entryPoints: [entryPoint], bundle: true, platform: "node", format: "cjs", write: false });
    writeFileSync(outFile, result.outputFiles[0].contents);
    return require(outFile);
  } finally {
    rmSync(tmpDir, { recursive: true, force: true });
  }
}

const { getAllTechnologies } = loadModule(join(ROOT, "lib/data/academies.ts"));
const { techSections, nonTechSections, nonTechAcademyIds } = loadModule(join(ROOT, "lib/data/navigation.ts"));

// ── Step 1: parse existing registry entries, keep only those whose value
// file still exists on disk. ─────────────────────────────────────────────
const existingSrc = readFileSync(REGISTRY_PATH, "utf8");
const existingEntries = [...existingSrc.matchAll(/\["([^"]+)","([^"]+)"\]/g)].map((m) => [m[1], m[2]]);

function fileExists(relPath) {
  try {
    statSync(join(CONTENT_ROOT, `${relPath}.md`));
    return true;
  } catch {
    return false;
  }
}

// A preserved alias (value !== key, e.g. a legacy "infrastructure/"
// fallback) can silently shadow a real, direct file forever once one is
// later written at the exact key path -- confirmed live: this exact bug
// shadowed 5 rewritten devops/linux/* files behind their old
// infrastructure/linux/* equivalents, and a broader scan found the same
// pattern on ~78 keys across ~16 devops/* technologies plus a few
// elsewhere. Content quality on the "devops/*" side is a mixed bag
// site-wide (some technologies are more complete than their
// infrastructure/* counterpart, some are thinner) -- rolling the fix out
// everywhere at once would silently downgrade some pages. Scoped to
// devops/linux only for now (already reviewed and improved); the other
// affected keys need their own quality comparison pass before unshadowing.
// Extend STALE_ALIAS_FIX_KEYS (or replace with a broader rule) once that
// review happens elsewhere -- do not just widen this to "all keys" without
// checking devops/* vs infrastructure/* content quality per technology first.
const STALE_ALIAS_FIX_KEYS = new Set([
  ...["overview", "fundamentals", "intermediate", "cheatsheets", "interview", "installation"].map((s) => `devops/linux/${s}`),
  // Batch 1 of the phased devops/* audit (Docker, Kubernetes) -- both
  // reviewed and improved section by section; unshadowing only the tabs
  // that actually have real, checked devops/* content behind them.
  ...["overview", "fundamentals", "intermediate", "cheatsheets", "interview"].map((s) => `devops/docker/${s}`),
  ...["overview", "fundamentals", "intermediate", "advanced", "cheatsheets", "interview"].map((s) => `devops/kubernetes/${s}`),
  // Batch 2 (git, nginx). git only -- infrastructure/git/* turned out to be
  // GitHub Actions content entirely, not Git version-control content at
  // all (a genuine wrong-technology mismatch, confirmed live, same class
  // of bug as Docker's contaminated interview.md but at the alias level
  // instead of within a file). nginx deliberately NOT included here --
  // infrastructure/nginx/* is correctly-topical, more complete, and
  // better-quality than the new devops/nginx/* files written this batch;
  // the existing alias is the right choice and should stay as-is.
  ...["overview", "fundamentals", "interview"].map((s) => `devops/git/${s}`),
]);

const registry = new Map();
let droppedBroken = 0;
let droppedStaleAlias = 0;
for (const [key, value] of existingEntries) {
  if (!fileExists(value)) {
    droppedBroken++;
    console.log(`  dropped (target missing): ${key} -> ${value}.md`);
    continue;
  }
  if (value !== key && STALE_ALIAS_FIX_KEYS.has(key) && fileExists(key)) {
    droppedStaleAlias++;
    console.log(`  dropped (stale alias, direct file now exists): ${key} -> ${value}.md`);
    continue;
  }
  registry.set(key, value);
}

// ── Step 2: for every real academy/tech x every valid section, add an
// entry if the file exists and isn't already covered — tried under the
// academy's own name first, then any known legacy alias root. Derived from
// the existing registry itself (every academy's value-root-folder set was
// just its own name, except "devops" content which mostly still lives
// under a legacy "infrastructure/" folder) rather than hand-guessed. ─────
const ALIAS_ROOTS = {
  devops: ["devops", "infrastructure"],
};

let added = 0;
for (const t of getAllTechnologies()) {
  const sections = nonTechAcademyIds.includes(t.academy) ? nonTechSections : techSections;
  const roots = ALIAS_ROOTS[t.academy] || [t.academy];
  for (const s of sections) {
    const key = `${t.academy}/${t.slug}/${s.slug}`;
    if (registry.has(key)) continue;
    for (const root of roots) {
      const candidateValue = `${root}/${t.slug}/${s.slug}`;
      if (fileExists(candidateValue)) {
        registry.set(key, candidateValue);
        added++;
        console.log(`  added: ${key} -> ${candidateValue}.md`);
        break;
      }
    }
  }
}

// ── Step 3: write the regenerated file, sorted for a stable/readable diff. ─
const sortedKeys = [...registry.keys()].sort();
const lines = sortedKeys.map((k) => `  ["${k}","${registry.get(k)}"],`).join("\n");

const output = `// Generated by scripts/generate-content-registry.mjs — do not hand-edit.
// Run "npm run generate:content-registry" after adding new content files;
// it preserves existing intentional aliases (shared/renamed-folder content)
// and adds any new direct academy/technology/section matches found on disk.
const contentRegistry = new Map<string, string>([
${lines}
]);

export function hasContent(a: string, t: string, s: string): boolean {
  return contentRegistry.has(\`\${a}/\${t}/\${s}\`);
}
// Client-side only (relative fetch — the browser supplies the origin). Do
// NOT call this from a Server Component; see fetchContentEdge() below.
export async function fetchContent(a: string, t: string, s: string): Promise<string | null> {
  const filePath = contentRegistry.get(\`\${a}/\${t}/\${s}\`);
  if (!filePath) return null;
  try {
    const res = await fetch(\`/content/\${filePath}.md\`);
    if (!res.ok) return null;
    return await res.text();
  } catch (err) {
    console.error(\`fetchContent failed for \${a}/\${t}/\${s}:\`, err);
    return null;
  }
}
// Server-side only. A Worker fetching its own public hostname during request
// handling is unreliable under @opennextjs/cloudflare (proved intermittent
// under real traffic); reading the co-located ASSETS binding instead avoids
// the network round-trip entirely. See
// app/academies/[academy]/[technology]/[section]/page.tsx and
// app/learn/[board]/[subject]/[chapter]/page.tsx for call sites.
export async function fetchContentEdge(a: string, t: string, s: string): Promise<string | null> {
  const filePath = contentRegistry.get(\`\${a}/\${t}/\${s}\`);
  if (!filePath) return null;
  try {
    const { getCloudflareContext } = await import("@opennextjs/cloudflare");
    const { env } = getCloudflareContext();
    const res = await env.ASSETS.fetch(new Request(\`https://assets.local/content/\${filePath}.md\`));
    if (!res.ok) return null;
    return await res.text();
  } catch (err) {
    console.error(\`fetchContentEdge failed for \${a}/\${t}/\${s}:\`, err);
    return null;
  }
}
export function getContent(_a: string, _t: string, _s: string): string | null { return null; }
`;

writeFileSync(REGISTRY_PATH, output);

console.log(`\nDone. ${existingEntries.length} existing entries -> ${registry.size} final entries.`);
console.log(`  Dropped (broken): ${droppedBroken}`);
console.log(`  Dropped (stale alias, direct file now exists): ${droppedStaleAlias}`);
console.log(`  Added (new direct matches): ${added}`);
