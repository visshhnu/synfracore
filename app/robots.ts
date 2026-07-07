import { MetadataRoute } from "next";
export default function robots(): MetadataRoute.Robots {
  return {
    // Merged from public/robots.txt (removed — it silently conflicted with
    // this dynamic route; Next.js treats that as a hard error in dev mode,
    // "conflicting public file and page file", discovered while verifying
    // this exact file's disallow-list change). /search?q=, /privacy, /terms
    // were that static file's own prior rules, preserved here rather than
    // dropped during the merge.
    rules: [{ userAgent: "*", allow: "/", disallow: ["/api/", "/_next/", "/dashboard/", "/admin/", "/onboarding/", "/search?q=", "/privacy", "/terms"] }],
    sitemap: "https://synfracore.com/sitemap.xml",
    host: "https://synfracore.com",
  };
}
