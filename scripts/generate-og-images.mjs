// Generates one static, academy-branded OG image per academy at BUILD TIME
// (plain Node.js, not the Workers runtime) -- writes PNGs to public/og/.
//
// Why static instead of the old dynamic /api/og (next/og ImageResponse)
// route: that route's Satori/resvg WASM renderer proved unreliable under
// OpenNext's Workers isolate reuse -- it succeeded on a fresh isolate but
// failed on nearly every subsequent request on the same warm instance
// (confirmed via repeated live testing, see docs/audit/07-roadmap-final.md).
// Generating images once at build time, in a fresh Node process each run,
// sidesteps that instability entirely -- no per-request WASM rendering in
// production at all.
//
// Run with: node scripts/generate-og-images.mjs

import satori from "satori";
import { Resvg } from "@resvg/resvg-js";
import { readFileSync, writeFileSync, mkdirSync } from "fs";
import { fileURLToPath } from "url";
import { dirname, join } from "path";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = join(__dirname, "..");

const fontRegular = readFileSync(
  join(root, "node_modules/@fontsource/inter/files/inter-latin-400-normal.woff")
);
const fontBold = readFileSync(
  join(root, "node_modules/@fontsource/inter/files/inter-latin-800-normal.woff")
);

// Same academy list/colors as the old dynamic route (app/api/og/route.tsx) --
// kept here rather than importing lib/data/academies.ts directly, since this
// script runs standalone via plain node, outside the Next.js/TS build
// pipeline.
const academies = [
  { slug: "devops", title: "DevOps & Platform Engineering", subtitle: "Infrastructure · CI/CD · Containers · IaC", color: "#3B82F6" },
  { slug: "cloud", title: "Cloud Platforms", subtitle: "AWS · Azure · GCP", color: "#0EA5E9" },
  { slug: "databases", title: "Databases", subtitle: "Relational · NoSQL · Cache · Search", color: "#10B981" },
  { slug: "ai", title: "AI & ML Engineering", subtitle: "LLMs · RAG · Agents · MLOps", color: "#8B5CF6" },
  { slug: "data", title: "Data Analytics & BI", subtitle: "SQL · Python · BI · Engineering", color: "#06B6D4" },
  { slug: "security", title: "Cybersecurity", subtitle: "SOC · Ethical Hacking · DevSecOps", color: "#EF4444" },
  { slug: "healthcare", title: "Health & Hospitality", subtitle: "Medical Coding · Home Health · Hospitality", color: "#F43F5E" },
  { slug: "essentials", title: "Human Essentials", subtitle: "Health · Wellness · Life Skills", color: "#EC4899" },
  { slug: "education", title: "School & College", subtitle: "Class 6-12 · Engineering · Placement", color: "#F59E0B" },
  { slug: "exams", title: "Competitive Exams", subtitle: "GATE · JEE · NEET · Banking · UPSC", color: "#F97316" },
  { slug: "law", title: "Law & Legal Studies", subtitle: "CLAT · Judiciary · Legal Reasoning · Constitution", color: "#A855F7" },
  { slug: "agriculture", title: "Agriculture & Organic Farming", subtitle: "Farming · Soil Science · Organic · Agri-Business", color: "#22C55E" },
  { slug: "finance", title: "Finance & Commerce", subtitle: "CA/CS/CMA · GST · Taxation · Accounting · Investments", color: "#14B8A6" },
  { slug: "telecom", title: "Telecom & 5G", subtitle: "5G · Networking · Fiber Optics · Wireless · JTO/JE", color: "#6366F1" },
  { slug: "state-psc", title: "State PSC Exams", subtitle: "TNPSC · KPSC · MPSC · APPSC · TSPSC", color: "#8B5CF6" },
  { slug: "central-exams", title: "Central Govt Exams", subtitle: "CTET · TET · PSU Technical · NDA · CDS", color: "#FBBF24" },
  { slug: "professional-certs", title: "Professional Certifications", subtitle: "PMP · ITIL · Scrum · Six Sigma · HR", color: "#84CC16" },
  { slug: "economics", title: "Economics", subtitle: "Micro · Macro · Indian Economy · RBI Policy · Budget", color: "#64748B" },
];

function buildTree(academy) {
  const { title, subtitle, color, slug } = academy;
  return {
    type: "div",
    props: {
      style: {
        width: "1200px", height: "630px",
        background: "#0F172A",
        display: "flex", flexDirection: "column",
        justifyContent: "center", alignItems: "flex-start",
        padding: "80px",
        fontFamily: "Inter",
        position: "relative",
      },
      children: [
        {
          type: "div",
          props: { style: { position: "absolute", top: 0, left: 0, right: 0, height: "6px", background: color } },
        },
        {
          type: "div",
          props: {
            style: { fontSize: "22px", color: "#64748B", marginBottom: "32px", letterSpacing: "2px" },
            children: "SYNFRACORE.COM",
          },
        },
        {
          type: "div",
          props: {
            style: {
              fontSize: "14px", fontWeight: 700, letterSpacing: "3px", textTransform: "uppercase",
              color, background: color + "20", padding: "6px 16px", borderRadius: "4px",
              marginBottom: "24px", display: "flex",
            },
            children: `${slug.toUpperCase()} ACADEMY`,
          },
        },
        {
          type: "div",
          props: {
            style: { fontSize: "56px", fontWeight: 800, color: "#F1F5F9", lineHeight: 1.15, marginBottom: "20px", maxWidth: "1000px", display: "flex" },
            children: title,
          },
        },
        {
          type: "div",
          props: {
            style: { fontSize: "22px", color: "#94A3B8", maxWidth: "900px", display: "flex" },
            children: subtitle,
          },
        },
        {
          type: "div",
          props: {
            style: { position: "absolute", bottom: "80px", right: "80px", display: "flex", gap: "10px" },
            children: ["Free", "No Login", "Production-Grade"].map((t) => ({
              type: "div",
              props: {
                style: {
                  fontSize: "13px", color, background: color + "15", padding: "5px 14px",
                  borderRadius: "20px", border: `1px solid ${color}40`, display: "flex",
                },
                children: t,
              },
            })),
          },
        },
      ],
    },
  };
}

async function main() {
  const outDir = join(root, "public/og");
  mkdirSync(outDir, { recursive: true });

  for (const academy of academies) {
    const svg = await satori(buildTree(academy), {
      width: 1200,
      height: 630,
      fonts: [
        { name: "Inter", data: fontRegular, weight: 400, style: "normal" },
        { name: "Inter", data: fontBold, weight: 800, style: "normal" },
      ],
    });
    const resvg = new Resvg(svg, { fitTo: { mode: "width", value: 1200 } });
    const png = resvg.render().asPng();
    const outPath = join(outDir, `${academy.slug}.png`);
    writeFileSync(outPath, png);
    console.log(`Generated ${academy.slug}.png (${png.length} bytes)`);
  }

  // Generic fallback for pages with no specific academy (e.g. homepage).
  const generic = await satori(
    buildTree({ slug: "synfracore", title: "SynfraCore", subtitle: "Learn · Build · Get Hired", color: "#3B82F6" }),
    {
      width: 1200,
      height: 630,
      fonts: [
        { name: "Inter", data: fontRegular, weight: 400, style: "normal" },
        { name: "Inter", data: fontBold, weight: 800, style: "normal" },
      ],
    }
  );
  const resvgGeneric = new Resvg(generic, { fitTo: { mode: "width", value: 1200 } });
  writeFileSync(join(outDir, "default.png"), resvgGeneric.render().asPng());
  console.log(`Generated default.png`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
