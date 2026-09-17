import { pageMetadata } from "@/lib/seo/metadata";
import PyqsPageClient from "./PyqsPageClient";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real, substantive page. Split into this thin
// Server Component (for generateMetadata/metadata support) wrapping the
// original interactive content as a Client Component, same pattern as
// app/schemes/page.tsx + components/schemes/SchemeNavigator.tsx.
export const metadata = pageMetadata({
  title: "Previous Year Questions — JEE, NEET, GATE, UPSC, SSC, Banking & More",
  description: "Curated Previous Year Questions with detailed solutions across Engineering, Government exams, Law, Finance, Agriculture, and Telecom — organized by exam, with a study strategy for using PYQs effectively.",
  path: "/pyqs",
  keywords: ["previous year questions", "JEE PYQ", "NEET PYQ", "UPSC PYQ", "SSC PYQ", "banking exam PYQ", "SynfraCore"],
});

export default function PyqsPage() {
  return <PyqsPageClient />;
}
