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

// Cloudflare's html.light toggle is a client-side class on <html>, not
// colorScheme-media-query-driven, so Playwright's colorScheme context option
// won't trigger it -- toggle it directly via the same mechanism the app uses.
async function setTheme(page, theme) {
  await page.evaluate((t) => {
    document.documentElement.classList.toggle("light", t === "light");
  }, theme);
}

let failures = 0;

const browser = await chromium.launch();
const page = await browser.newPage({ viewport: { width: 1280, height: 900 } });

for (const path of pages) {
  const url = `${baseUrl}${path}`;
  await page.goto(url, { waitUntil: "load", timeout: 30000 });

  const flowBox = page.locator('[data-diagram-box]').first();
  const hasFlow = await flowBox.count() > 0;
  if (!hasFlow) {
    console.log(`❌ ${path}: no FlowDiagram/ConceptBoxGrid box found on the page`);
    failures++;
    continue;
  }

  await setTheme(page, "dark");
  await page.waitForTimeout(150);
  const darkBg = await flowBox.evaluate((el) => getComputedStyle(el).backgroundColor);
  const darkBorder = await flowBox.evaluate((el) => getComputedStyle(el).borderColor);

  await setTheme(page, "light");
  await page.waitForTimeout(150);
  const lightBg = await flowBox.evaluate((el) => getComputedStyle(el).backgroundColor);
  const lightBorder = await flowBox.evaluate((el) => getComputedStyle(el).borderColor);

  const dir = "screenshots-diagram-theming";
  await import("node:fs/promises").then((fs) => fs.mkdir(dir, { recursive: true }));
  const slug = path.replace(/\//g, "_");
  await setTheme(page, "dark");
  await page.waitForTimeout(150);
  await page.screenshot({ path: `${dir}/${slug}__dark.png` });
  await setTheme(page, "light");
  await page.waitForTimeout(150);
  await page.screenshot({ path: `${dir}/${slug}__light.png` });

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
