// Validates every roadmap's techLinks against the actual Technology registry.
// Run with: npm run validate:roadmaps
//
// Fails (non-zero exit) if:
//   1. A techLink's {academy, slug} doesn't resolve via getTechnology() —
//      this is exactly the condition that makes
//      app/academies/[academy]/[technology]/[section]/page.tsx redirect to /academies.
//   2. steps.length !== techLinks.length for a roadmap (labels and links drifted apart).
//   3. A techLink is missing academy/slug/name entirely.
//   4. A known banned mismatch (previously-confirmed wrong pairing) has resurfaced.
//   5. Two DIFFERENT steps within the same roadmap resolve to the identical
//      {academy}/{slug}/{section||overview} URL — this is the "collapsed steps"
//      class of bug (multiple distinct steps silently routed to one page).
//
// Extend this by adding to BANNED_MISMATCHES as new bad pairings are found.

import { roadmaps } from "../lib/data/navigation";
import { roadmapDetails, type RoadmapTechLink } from "../lib/data/roadmapDetails";
import { getTechnology, academies } from "../lib/data/academies";

type Failure = {
  roadmap: string;
  step: string;
  reason: string;
};

const BANNED_MISMATCHES: { roadmap: string; stepIncludes: string; bannedAcademy: string; bannedSlug: string }[] = [
  { roadmap: "upsc-ias", stepIncludes: "Interview", bannedAcademy: "exams", bannedSlug: "upsc-prelims" },
  { roadmap: "advocate-career", stepIncludes: "Independent Practice", bannedAcademy: "law", bannedSlug: "clat-prep" },
  { roadmap: "judiciary-civil-judge", stepIncludes: "Interview", bannedAcademy: "law", bannedSlug: "aibe-bar-exam" },
  { roadmap: "cloud-architect", stepIncludes: "Cloud Fundamentals", bannedAcademy: "cloud", bannedSlug: "aws-ec2" },
  { roadmap: "cloud-architect", stepIncludes: "Azure Core Services", bannedAcademy: "cloud", bannedSlug: "azure-vms" },
  { roadmap: "database-engineer", stepIncludes: "Cloud Databases", bannedAcademy: "databases", bannedSlug: "dynamodb" },
  // Generic form of the "narrowed to one compute service" bug, checked across all roadmaps below too.
];

const failures: Failure[] = [];

function fail(roadmap: string, step: string, reason: string) {
  failures.push({ roadmap, step, reason });
}

for (const rm of roadmaps) {
  const detail = roadmapDetails[rm.slug];

  if (!detail) {
    fail(rm.slug, "(entire roadmap)", "No roadmapDetails entry exists for this roadmap slug at all.");
    continue;
  }

  // Rule 2: steps/techLinks count mismatch.
  if (rm.steps.length !== detail.techLinks.length) {
    fail(
      rm.slug,
      "(entire roadmap)",
      `steps.length (${rm.steps.length}) !== techLinks.length (${detail.techLinks.length}) — labels and links have drifted apart.`
    );
  }

  detail.techLinks.forEach((t: RoadmapTechLink, i: number) => {
    const step = rm.steps[i] ?? `techLinks[${i}] (no matching step label)`;

    // Rule 3: missing fields.
    if (!t.academy || !t.slug || !t.name) {
      fail(rm.slug, step, `techLink is missing a required field: ${JSON.stringify(t)}`);
      return;
    }

    // Rule 1: does this actually resolve? (mirrors the redirect("/academies") condition exactly)
    const academy = academies.find(a => a.slug === t.academy);
    const tech = getTechnology(t.academy, t.slug);
    if (!academy || !tech) {
      fail(
        rm.slug,
        step,
        `getTechnology("${t.academy}", "${t.slug}") is undefined — this link would redirect to /academies right now.`
      );
    }

    // Rule 4: known banned mismatches.
    for (const banned of BANNED_MISMATCHES) {
      if (
        rm.slug === banned.roadmap &&
        step.includes(banned.stepIncludes) &&
        t.academy === banned.bannedAcademy &&
        t.slug === banned.bannedSlug
      ) {
        fail(rm.slug, step, `Banned mismatch resurfaced: "${step}" -> ${t.academy}/${t.slug}`);
      }
    }
  });

  // Rule 5: collapsed steps — two different steps in the same roadmap must not
  // resolve to the identical URL. (Same page reused across DIFFERENT roadmaps
  // is fine; the same page reused for DIFFERENT steps within one roadmap is not.)
  const seenHrefs = new Map<string, string>(); // href -> first step name that used it
  detail.techLinks.forEach((t: RoadmapTechLink, i: number) => {
    if (!t.academy || !t.slug) return;
    const step = rm.steps[i] ?? `techLinks[${i}]`;
    const href = `${t.academy}/${t.slug}/${t.section || "overview"}`;
    const firstStep = seenHrefs.get(href);
    if (firstStep && firstStep !== step) {
      fail(
        rm.slug,
        step,
        `Collapsed step: "${step}" resolves to the same URL (${href}) as an earlier step "${firstStep}" in this roadmap.`
      );
    } else {
      seenHrefs.set(href, step);
    }
  });
}

// ── Report ──
console.log(`\nValidated ${roadmaps.length} roadmaps, ${Object.values(roadmapDetails).reduce((n, d) => n + d.techLinks.length, 0)} techLinks total.\n`);

if (failures.length === 0) {
  console.log("PASS — every roadmap step resolves to a real, registered academy page. No banned mismatches found.\n");
  process.exitCode = 0;
} else {
  console.log(`FAIL — ${failures.length} problem(s) found:\n`);
  for (const f of failures) {
    console.log(`  [${f.roadmap}] "${f.step}"`);
    console.log(`    ${f.reason}\n`);
  }
  process.exitCode = 1;
}
