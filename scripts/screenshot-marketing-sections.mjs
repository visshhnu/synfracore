// Generates the 3 static screenshots used by the homepage's "See it in action"
// section (app/page.tsx) -- a lesson page (diagram + callout + code), a live
// quiz mid-interaction, and the signed-in dashboard. Run this whenever the
// featured lesson/quiz content changes, or before a deploy if you want the
// screenshots refreshed to match current content.
//
// The dashboard has no automatable path to a real authenticated session
// (Clerk OTP sign-in can't be scripted, and no test account exists in this
// environment) -- so its screenshot is rendered from a static local mock
// fixture (scripts/fixtures/dashboard-mock.html) that mirrors the real
// dashboard's layout/styling with curated placeholder data, instead of a
// live account. This is also the more maintainable choice for a marketing
// screenshot: a real account's data changes over time and could end up
// looking sparse or odd; a curated mock stays stable and never exposes a
// real person's actual learning history in public marketing material.
//
// Run with: node scripts/screenshot-marketing-sections.mjs
// Optional: BASE_URL=http://localhost:3000 node scripts/screenshot-marketing-sections.mjs

import { chromium } from "playwright";
import { mkdirSync } from "fs";
import { fileURLToPath } from "url";
import { dirname, join } from "path";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = join(__dirname, "..");
const OUT_DIR = join(root, "public/images/screenshots");
mkdirSync(OUT_DIR, { recursive: true });

const BASE_URL = process.env.BASE_URL || "https://synfracore.com";

async function setDarkTheme(page) {
  await page.evaluate(() => {
    try { localStorage.setItem("theme", "dark"); } catch {}
  });
}

async function shootLesson(browser) {
  const page = await browser.newPage({ viewport: { width: 1200, height: 1400 } });
  await page.goto(`${BASE_URL}/academies/ai/ai-fundamentals/overview`, { waitUntil: "networkidle" });
  await setDarkTheme(page);
  await page.reload({ waitUntil: "networkidle" });
  await page.waitForTimeout(400);

  // Find the largest <svg> inside <main> -- that's the content diagram, not
  // a small nav/icon svg. Clip a region starting just above it so the shot
  // shows diagram + surrounding prose (callout, code) in one frame.
  const svgBox = await page.evaluate(() => {
    const svgs = Array.from(document.querySelectorAll("main svg"));
    let best = null;
    for (const svg of svgs) {
      const r = svg.getBoundingClientRect();
      if (r.width > 150 && (!best || r.width > best.width)) best = r;
    }
    return best ? { top: best.top + window.scrollY, left: best.left + window.scrollX, width: best.width, height: best.height } : null;
  });

  if (svgBox) {
    const clipTop = Math.max(0, svgBox.top - 100);
    await page.mouse.wheel(0, clipTop);
    await page.waitForTimeout(300);
  }

  await page.screenshot({ path: join(OUT_DIR, "lesson.png"), clip: { x: 0, y: 0, width: 1200, height: 720 } });
  await page.close();
}

async function shootQuiz(browser) {
  const page = await browser.newPage({ viewport: { width: 1200, height: 1400 } });
  await page.goto(`${BASE_URL}/academies/devops/docker/overview`, { waitUntil: "networkidle" });
  await setDarkTheme(page);
  await page.reload({ waitUntil: "networkidle" });
  await page.waitForTimeout(400);

  // SectionQuiz.tsx renders "Check your understanding — {techName}" as its
  // heading. Answer every question correctly (submit is disabled until all
  // are answered) then submit, so the screenshot shows the real
  // correct/incorrect coloring + explanation state, not a blank quiz.
  const quizHeading = page.getByText(/check your understanding/i).first();
  const found = await quizHeading.count();
  if (found > 0) {
    await quizHeading.scrollIntoViewIfNeeded();
    await page.waitForTimeout(300);

    // Click the first option in every question (a div whose direct children
    // are all <button>s uniquely identifies an options-wrapper in
    // SectionQuiz.tsx's markup), then submit -- native .click() dispatches a
    // real event React's delegated listeners pick up.
    const answeredCount = await page.evaluate(() => {
      const heading = [...document.querySelectorAll("*")].find(el =>
        el.children.length === 0 && /check your understanding/i.test(el.textContent || "")
      );
      const container = heading?.closest("div[style*='border-radius']") || heading?.parentElement?.parentElement;
      if (!container) return 0;
      const optionWrappers = [...container.querySelectorAll("div")].filter(
        div => div.children.length > 0 && [...div.children].every(c => c.tagName === "BUTTON")
      );
      for (const wrapper of optionWrappers) {
        wrapper.querySelector("button")?.click();
      }
      return optionWrappers.length;
    });
    await page.waitForTimeout(200);

    if (answeredCount > 0) {
      const submitBtn = page.getByText("Submit answers");
      if (await submitBtn.count() > 0) {
        await submitBtn.click().catch(() => {});
        await page.waitForTimeout(400);
      }
    }

    const finalBox = await quizHeading.boundingBox();
    const top = finalBox ? Math.max(0, finalBox.y - 24) : 0;
    await page.screenshot({ path: join(OUT_DIR, "quiz.png"), clip: { x: 0, y: top, width: 1200, height: 620 } });
  } else {
    console.warn("[screenshot-marketing-sections] No quiz found on the fallback page -- writing a full-viewport shot instead. Check DB seed / page choice.");
    await page.screenshot({ path: join(OUT_DIR, "quiz.png") });
  }
  await page.close();
}

async function shootDashboard(browser) {
  const page = await browser.newPage({ viewport: { width: 1200, height: 1400 } });
  const fixturePath = join(__dirname, "fixtures/dashboard-mock.html");
  await page.goto(`file://${fixturePath}`, { waitUntil: "networkidle" });
  await page.waitForTimeout(300);
  await page.screenshot({ path: join(OUT_DIR, "dashboard.png"), clip: { x: 0, y: 0, width: 1200, height: 720 } });
  await page.close();
}

const browser = await chromium.launch();
try {
  await shootLesson(browser);
  console.log("✓ lesson.png");
  await shootQuiz(browser);
  console.log("✓ quiz.png");
  await shootDashboard(browser);
  console.log("✓ dashboard.png");
} finally {
  await browser.close();
}
console.log(`Screenshots written to ${OUT_DIR}`);
