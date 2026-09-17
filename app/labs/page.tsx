import { pageMetadata } from "@/lib/seo/metadata";
import LabsPageClient from "./LabsPageClient";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real, substantive page. Split into this thin
// Server Component (for generateMetadata/metadata support) wrapping the
// original interactive content as a Client Component, same pattern as
// app/schemes/page.tsx + components/schemes/SchemeNavigator.tsx.
export const metadata = pageMetadata({
  title: "Hands-On Labs — Interactive Practice Environments",
  description: "Terminal simulations, SQL consoles, code editors, and MCQ quizzes across DevOps, Cloud, Databases, AI, Data, and Security — no account setup needed, click any lab to start immediately.",
  path: "/labs",
  keywords: ["hands-on labs", "interactive coding practice", "terminal simulator", "SQL console", "DevOps labs", "SynfraCore"],
});

export default function LabsPage() {
  return <LabsPageClient />;
}
