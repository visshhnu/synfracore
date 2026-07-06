// One-off analysis: groups every roadmap's techLinks by resolved href and
// prints every case where 2+ DIFFERENT steps within the same roadmap share
// a target. Cross-roadmap sharing (two different roadmaps pointing at the
// same academy page) is normal and intentionally excluded — this is only
// about intra-roadmap collisions, which is what Rule 5 in validate-roadmaps
// also checks.

import { roadmaps } from "../lib/data/navigation";
import { roadmapDetails, type RoadmapTechLink } from "../lib/data/roadmapDetails";
import { getTechnology } from "../lib/data/academies";

const sectionLabels: Record<string, string> = {
  overview: "Overview", fundamentals: "Fundamentals", intermediate: "Intermediate",
  advanced: "Advanced", interview: "Interview", cheatsheets: "Cheatsheets",
  pyq: "PYQ", notes: "Notes", faq: "FAQ", labs: "Labs", roadmap: "Roadmap",
  projects: "Projects", certification: "Certification",
};

type Case = {
  roadmap: string;
  href: string;
  steps: string[];
  targetTitle: string;
};

const cases: Case[] = [];

for (const rm of roadmaps) {
  const detail = roadmapDetails[rm.slug];
  if (!detail) continue;

  const groups = new Map<string, string[]>();
  detail.techLinks.forEach((t: RoadmapTechLink, i: number) => {
    if (!t.academy || !t.slug) return;
    const step = rm.steps[i] ?? `techLinks[${i}]`;
    const href = `/academies/${t.academy}/${t.slug}/${t.section || "overview"}`;
    if (!groups.has(href)) groups.set(href, []);
    groups.get(href)!.push(step);
  });

  for (const [href, steps] of groups) {
    if (steps.length < 2) continue;
    const parts = href.split("/"); // "", academies, academy, slug, section
    const academy = parts[2], slug = parts[3], section = parts[4];
    const tech = getTechnology(academy, slug);
    const title = tech ? `${tech.name} — ${sectionLabels[section] || section}` : "(UNRESOLVED)";
    cases.push({ roadmap: rm.slug, href, steps, targetTitle: title });
  }
}

console.log(`\nFound ${cases.length} shared-target case(s) across ${roadmaps.length} roadmaps.\n`);
let currentRoadmap = "";
for (const c of cases) {
  if (c.roadmap !== currentRoadmap) {
    currentRoadmap = c.roadmap;
    console.log(`\n=== ${c.roadmap} ===`);
  }
  console.log(`  href: ${c.href}`);
  console.log(`  title: ${c.targetTitle}`);
  console.log(`  steps: ${c.steps.map(s => `"${s}"`).join(", ")}`);
  console.log("");
}
