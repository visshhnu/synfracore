import { MetadataRoute } from "next";
import { academies, getAllTechnologies } from "@/lib/data/academies";
import { roadmaps, certifications, techSections, nonTechSections, nonTechAcademyIds } from "@/lib/data/navigation";
import { hasContent } from "@/lib/content";
import { articles as blogArticles } from "@/lib/data/blogPosts";

const BASE = "https://synfracore.com";

// Generated from the same source-of-truth data every route actually reads
// (lib/data/academies.ts, lib/data/navigation.ts, the content registry, and
// the blog's own articles map) instead of a separately hand-maintained slug
// list — that list had already drifted (68 real technology slugs missing,
// confirmed in docs/audit/03-performance-seo-a11y.md Finding 3), which this
// structurally prevents from happening again: a technology/roadmap/cert/post
// added to its real data source is automatically in the sitemap.

// ── Static, non-catalog pages — these have no underlying data source to
// derive from, so they stay as an explicit list. ──────────────────────────
const staticPages = [
  { url: "/",              priority: 1.0, freq: "daily"   },
  { url: "/academies",     priority: 0.9, freq: "weekly"  },
  { url: "/roadmaps",      priority: 0.9, freq: "weekly"  },
  { url: "/certifications",priority: 0.8, freq: "weekly"  },
  { url: "/interview",     priority: 0.8, freq: "weekly"  },
  { url: "/pyqs",          priority: 0.8, freq: "weekly"  },
  { url: "/blog",          priority: 0.8, freq: "daily"   },
  { url: "/labs",          priority: 0.7, freq: "weekly"  },
  { url: "/projects",      priority: 0.7, freq: "weekly"  },
  { url: "/career",        priority: 0.7, freq: "weekly"  },
  { url: "/learn",         priority: 0.8, freq: "weekly"  },
  { url: "/search",        priority: 0.5, freq: "monthly" },
  { url: "/about",         priority: 0.5, freq: "monthly" },
  { url: "/contact",       priority: 0.4, freq: "monthly" },
] as const;

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date();
  const entries: MetadataRoute.Sitemap = [];

  // 1. Static pages
  staticPages.forEach(({ url, priority, freq }) => {
    entries.push({
      url: `${BASE}${url}`,
      lastModified: now,
      changeFrequency: freq as MetadataRoute.Sitemap[0]["changeFrequency"],
      priority,
    });
  });

  // 2. Every real roadmap detail page
  roadmaps.forEach((r) => {
    entries.push({ url: `${BASE}/roadmaps/${r.slug}`, lastModified: now, changeFrequency: "monthly", priority: 0.8 });
  });

  // 3. Every real certification detail page
  certifications.forEach((c) => {
    entries.push({ url: `${BASE}/certifications/${c.id}`, lastModified: now, changeFrequency: "monthly", priority: 0.75 });
  });

  // 4. Every real academy hub page
  academies.forEach((a) => {
    entries.push({ url: `${BASE}/academies/${a.slug}`, lastModified: now, changeFrequency: "weekly", priority: 0.8 });
  });

  // 5. Every real technology hub page + every section that actually has
  // registered content (checked via hasContent(), the same registry the
  // page itself uses) — this deliberately excludes sections that would only
  // show the "coming soon / generate AI content" placeholder, since
  // submitting thin/duplicate-shaped placeholder pages to search engines is
  // worse for SEO than not listing them at all.
  const seenTechPages = new Set<string>();
  getAllTechnologies().forEach((t) => {
    const techKey = `${t.academy}/${t.slug}`;
    if (!seenTechPages.has(techKey)) {
      seenTechPages.add(techKey);
      entries.push({ url: `${BASE}/academies/${t.academy}/${t.slug}`, lastModified: now, changeFrequency: "weekly", priority: 0.75 });
    }

    const sections = nonTechAcademyIds.includes(t.academy) ? nonTechSections : techSections;
    sections.forEach((s) => {
      if (hasContent(t.academy, t.slug, s.slug)) {
        entries.push({
          url: `${BASE}/academies/${t.academy}/${t.slug}/${s.slug}`,
          lastModified: now,
          changeFrequency: "monthly",
          priority: 0.65,
        });
      }
    });
  });

  // 6. Every real blog post
  Object.keys(blogArticles).forEach((slug) => {
    entries.push({ url: `${BASE}/blog/${slug}`, lastModified: now, changeFrequency: "monthly", priority: 0.7 });
  });

  return entries;
}
