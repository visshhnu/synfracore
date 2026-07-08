// One-shot test script for the Phase 3.8 OpenNext investigation — NOT part
// of the normal build/deploy pipeline, only invoked by the temporary CI
// workflow .github/workflows/test-opennext-server-action.yml.
//
// Question this answers: does @opennextjs/cloudflare avoid the confirmed
// @cloudflare/next-on-pages limitation where a Next.js Server Action POST
// to a page without `runtime = "edge"` returns 405? (See
// docs/audit/06-roadmap.md's consolidated 3.7/3.8/3.9 finding for the full
// context — Clerk's own SDK fires exactly this kind of Server Action
// globally on sign-in.)
//
// Finds the real Server Action ID for Clerk's invalidateCacheAction from
// Next.js's own build manifest (not a guessed/fabricated ID), then sends a
// real Next.js Server Action POST request — matching the actual over-the-
// wire protocol (Next-Action header, Accept: text/x-component) — to a page
// confirmed to have no `runtime = "edge"` export, against a running
// `wrangler dev` instance (Cloudflare's local Workers simulator, built from
// the real OpenNext output).

import { readFileSync, readdirSync } from "node:fs";
import { join } from "node:path";

const BASE_URL = process.env.TEST_BASE_URL || "http://127.0.0.1:8787";
const MANIFEST_PATH = ".next/server/server-reference-manifest.json";

function findInvalidateCacheActionId() {
  const raw = readFileSync(MANIFEST_PATH, "utf8");
  const manifest = JSON.parse(raw);
  // server-reference-manifest.json shape: { node: { "<actionId>": { workers: {...}, layer: {...} } }, edge: {...} }
  // We don't know the action's file path in advance from the manifest keys
  // alone (they're hashes), so instead grep the manifest's raw text for
  // proximity to "server-actions" (the module path) and Clerk's package name
  // to find candidate IDs, then verify by cross-referencing the actual
  // compiled chunk contents.
  const candidateIds = Object.keys(manifest.node || {});
  console.log(`Found ${candidateIds.length} total Server Action IDs in the manifest.`);

  for (const id of candidateIds) {
    const entry = manifest.node[id];
    const files = [...(entry.workers ? Object.values(entry.workers) : [])];
    for (const file of files) {
      const chunkPath = join(".next/server", typeof file === "string" ? file : file?.moduleId || "");
      try {
        const chunkSrc = readFileSync(chunkPath, "utf8");
        if (chunkSrc.includes("invalidateCacheAction") || chunkSrc.includes("__clerk_invalidate_cache_cookie")) {
          return { id, chunkPath };
        }
      } catch {
        // file may not exist at that exact path shape; skip
      }
    }
  }
  return null;
}

async function main() {
  console.log("=== Locating Clerk's invalidateCacheAction Server Action ID ===");
  let found;
  try {
    found = findInvalidateCacheActionId();
  } catch (err) {
    console.error("Could not read/parse server-reference-manifest.json:", err.message);
    process.exit(2);
  }

  if (!found) {
    console.error("Could not locate invalidateCacheAction's Server Action ID in the manifest.");
    console.error("Falling back to a manifest dump for manual inspection:");
    try {
      console.error(readFileSync(MANIFEST_PATH, "utf8").slice(0, 2000));
    } catch {}
    process.exit(2);
  }

  console.log(`Found action ID: ${found.id} (in ${found.chunkPath})`);

  // /about has no `export const runtime = "edge"` on this branch (confirmed
  // via the Phase 3.9 investigation's file list) — a real static-eligible
  // page, exactly the scenario Clerk's global sign-in Server Action would
  // hit if the user happens to be on it.
  const targetUrl = `${BASE_URL}/about`;
  console.log(`\n=== Sending real Next.js Server Action POST to ${targetUrl} ===`);

  const res = await fetch(targetUrl, {
    method: "POST",
    headers: {
      "Next-Action": found.id,
      "Accept": "text/x-component",
      "Content-Type": "text/plain;charset=UTF-8",
    },
    body: "[]", // invalidateCacheAction takes no arguments
  });

  const bodyText = await res.text();
  console.log(`\nResponse status: ${res.status}`);
  console.log(`Response body (first 500 chars): ${bodyText.slice(0, 500)}`);

  console.log("\n=== Verdict ===");
  if (res.status === 405) {
    console.log("405 Method Not Allowed — OpenNext has the SAME limitation as next-on-pages. Does NOT unblock static rendering.");
    process.exit(1);
  } else if (res.status >= 200 && res.status < 300) {
    console.log("Success status — OpenNext correctly handled the Server Action on a non-edge page. This DOES unblock static rendering.");
    process.exit(0);
  } else {
    console.log(`Unexpected status ${res.status} — inconclusive, needs manual review of the response body above.`);
    process.exit(3);
  }
}

main().catch(err => {
  console.error("Test script threw:", err);
  process.exit(2);
});
