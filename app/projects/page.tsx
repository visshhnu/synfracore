import { pageMetadata } from "@/lib/seo/metadata";
import ProjectsPageClient from "./ProjectsPageClient";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real, substantive page. Split into this thin
// Server Component (for generateMetadata/metadata support) wrapping the
// original interactive content as a Client Component, same pattern as
// app/schemes/page.tsx + components/schemes/SchemeNavigator.tsx.
export const metadata = pageMetadata({
  title: "Portfolio Projects — Real-World Builds Across Every Domain",
  description: "300+ guided, portfolio-ready projects across DevOps, Cloud, AI, Databases, Security, and Data Analytics — beginner to advanced, each with step-by-step guidance and a GitHub repo structure.",
  path: "/projects",
  keywords: ["portfolio projects", "DevOps projects", "cloud projects", "AI projects", "GitHub portfolio", "SynfraCore"],
});

export default function ProjectsPage() {
  return <ProjectsPageClient />;
}
