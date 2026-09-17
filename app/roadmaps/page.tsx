import { pageMetadata } from "@/lib/seo/metadata";
import RoadmapsPageClient from "./RoadmapsPageClient";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real, substantive page. Split into this thin
// Server Component (for generateMetadata/metadata support) wrapping the
// original interactive content as a Client Component, same pattern as
// app/schemes/page.tsx + components/schemes/SchemeNavigator.tsx.
export const metadata = pageMetadata({
  title: "Learning Roadmaps — Step-by-Step Paths to Job-Ready",
  description: "Structured, phase-by-phase learning roadmaps from beginner to job-ready across Tech, Law, Government, Finance, Agriculture, Telecom, and Education — pick a path and follow it.",
  path: "/roadmaps",
  keywords: ["learning roadmap", "DevOps roadmap", "career roadmap India", "UPSC roadmap", "cloud architect roadmap", "SynfraCore"],
});

export default function RoadmapsPage() {
  return <RoadmapsPageClient />;
}
