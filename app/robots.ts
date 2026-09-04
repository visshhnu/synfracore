import { MetadataRoute } from "next";
export default function robots(): MetadataRoute.Robots {
  return {
    // Merged from public/robots.txt (removed — it silently conflicted with
    // this dynamic route; Next.js treats that as a hard error in dev mode,
    // "conflicting public file and page file", discovered while verifying
    // this exact file's disallow-list change). /search?q= was that static
    // file's own prior rule, preserved here rather than dropped during the
    // merge. /privacy and /terms were also carried over from it but had no
    // real reason to be blocked (both are normal, real, indexable pages) —
    // dropped 2026-09-04.
    rules: [{ userAgent: "*", allow: "/", disallow: ["/api/", "/_next/", "/dashboard/", "/admin/", "/onboarding/", "/search?q="] }],
    sitemap: "https://synfracore.com/sitemap.xml",
    host: "https://synfracore.com",
  };
}
