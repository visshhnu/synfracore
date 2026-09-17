import { pageMetadata } from "@/lib/seo/metadata";
import SearchPageClient from "./SearchPageClient";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real page. Split into this thin Server
// Component (for generateMetadata/metadata support) wrapping the original
// interactive content as a Client Component, same pattern as
// app/schemes/page.tsx + components/schemes/SchemeNavigator.tsx.
export const metadata = pageMetadata({
  title: "Search SynfraCore",
  description: "Search across every tech academy, education board, career path, and certification on SynfraCore — one search bar for the whole catalog.",
  path: "/search",
  keywords: ["search SynfraCore", "site search"],
});

export default function SearchPage() {
  return <SearchPageClient />;
}
