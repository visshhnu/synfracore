// Cross-platform runner for validate-roadmaps.ts — bundles it with esbuild,
// requires the result, then cleans up. Exit code mirrors the validation result
// (process.exitCode set inside validate-roadmaps.ts), so this is safe to wire
// into CI as a build-failing check.
import { buildSync } from "esbuild";
import { createRequire } from "node:module";
import { mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

const require = createRequire(import.meta.url);

const tmpDir = mkdtempSync(join(tmpdir(), "synfracore-validate-"));
const outFile = join(tmpDir, "validate-roadmaps.cjs");

try {
  const result = buildSync({
    entryPoints: [join(process.cwd(), "scripts/validate-roadmaps.ts")],
    bundle: true,
    platform: "node",
    format: "cjs",
    write: false,
  });
  writeFileSync(outFile, result.outputFiles[0].contents);
  require(outFile);
} finally {
  rmSync(tmpDir, { recursive: true, force: true });
}
