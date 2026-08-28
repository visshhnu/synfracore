// Verifies FlowDiagram/ConceptBoxGrid actually adapt between dark and light
// mode -- not just "renders without error" but that computed colors genuinely
// differ, which is the real bug this replaces (hand-authored SVGs used fixed
// hex colors that didn't change with the theme). Run against a live server:
//   node scripts/verify-diagram-theming.mjs [baseUrl]
// Defaults to http://127.0.0.1:3000 (local dev). Pass a production URL to
// re-verify after deploy.
import { chromium } from "playwright";

const baseUrl = process.argv[2] || "http://127.0.0.1:3000";

const pages = [
  "/academies/ai/ai-fundamentals/overview",
  "/academies/cloud/aws-vpc/overview",
  "/academies/devops/docker/overview",
  "/academies/devops/kubernetes/overview",
  "/academies/devops/networking/overview",
];

// ThemeProvider.tsx applies the `light` class inside a useEffect that runs
// once on mount (reading localStorage/system preference) -- directly poking
// classList (the old approach here) races that effect and is flaky: it can
// get silently overwritten depending on exactly when the effect fires
// relative to the poke. Click the real toggle button instead (same
// aria-label="Toggle theme" element ThemeToggle.tsx renders) so verification
// goes through the exact same code path a real user triggers -- no race,
// confirmed stable across repeated runs where raw classList poking wasn't.
let failures = 0;

const browser = await chromium.launch();
const page = await browser.newPage({ viewport: { width: 1280, height: 900 } });

for (const path of pages) {
  const url = `${baseUrl}${path}`;
  await page.goto(url, { waitUntil: "load", timeout: 30000 });

  const toggleBtn = page.locator('button[aria-label="Toggle theme"]').first();
  await toggleBtn.waitFor({ state: "visible", timeout: 10000 });

  const flowBox = page.locator('[data-diagram-box]').first();
  const hasFlow = await flowBox.count() > 0;
  if (!hasFlow) {
    console.log(`❌ ${path}: no FlowDiagram/ConceptBoxGrid box found on the page`);
    failures++;
    continue;
  }

  const bg1 = await flowBox.evaluate((el) => getComputedStyle(el).backgroundColor);
  const border1 = await flowBox.evaluate((el) => getComputedStyle(el).borderColor);

  const dir = "screenshots-diagram-theming";
  await import("node:fs/promises").then((fs) => fs.mkdir(dir, { recursive: true }));
  const slug = path.replace(/\//g, "_");
  await page.screenshot({ path: `${dir}/${slug}__before-toggle.png` });

  await toggleBtn.click();
  await page.waitForTimeout(300);

  const bg2 = await flowBox.evaluate((el) => getComputedStyle(el).backgroundColor);
  const border2 = await flowBox.evaluate((el) => getComputedStyle(el).borderColor);
  await page.screenshot({ path: `${dir}/${slug}__after-toggle.png` });

  const darkBg = bg1, lightBg = bg2, darkBorder = border1, lightBorder = border2;

  // The real assertion: computed colors must actually differ between themes.
  // Equal values here would mean the theme toggle isn't reaching this
  // element at all -- exactly the bug class the hardcoded-hex SVGs had.
  const bgChanged = darkBg !== lightBg;
  const borderChanged = darkBorder !== lightBorder;

  if (bgChanged && borderChanged) {
    console.log(`✅ ${path}: colors differ between themes (bg ${darkBg} → ${lightBg})`);
  } else {
    console.log(`❌ ${path}: colors did NOT differ (bg dark=${darkBg} light=${lightBg}, border dark=${darkBorder} light=${lightBorder})`);
    failures++;
  }
}

await browser.close();

if (failures > 0) {
  console.log(`\n${failures} page(s) failed theming verification.`);
  process.exit(1);
} else {
  console.log(`\nAll ${pages.length} pages: FlowDiagram/ConceptBoxGrid colors verified to differ correctly between dark and light mode.`);
}
