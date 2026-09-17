import { pageMetadata } from "@/lib/seo/metadata";
import CareerPageClient from "./CareerPageClient";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real, substantive page. Split into this thin
// Server Component (for generateMetadata/metadata support) wrapping the
// original interactive content as a Client Component, same pattern as
// app/schemes/page.tsx + components/schemes/SchemeNavigator.tsx.
export const metadata = pageMetadata({
  title: "Career Guide — 8 Career Clusters Across Every Domain",
  description: "Salary ranges, demand levels, required skills, and entry paths for careers in Tech, Law, Government, Finance, Healthcare, Agriculture, Telecom, and Education — with a direct link to each one's learning roadmap.",
  path: "/career",
  keywords: ["career guide India", "DevOps salary", "UPSC career", "CA career path", "tech career roadmap", "SynfraCore"],
});

export default function CareerPage() {
  return <CareerPageClient />;
}
