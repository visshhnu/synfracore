import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  async redirects() {
    return [
      {
        source: "/academies/infrastructure/:path*",
        destination: "/academies/devops/:path*",
        permanent: true,
      },
      {
        // NF-12: 2025 salary post superseded by the 2026 one (more current
        // data, more cities, better structured) -- redirect rather than a
        // silent 404, and stops the two competing for the same search intent.
        source: "/blog/devops-salary-india-2025",
        destination: "/blog/devops-salary-india-2026",
        permanent: true,
      },
    ];
  },
  // Real finding (2026-09-13 perf audit): despite this config declaring
  // formats/deviceSizes/imageSizes below, NONE of it was actually taking
  // effect in production — confirmed live by requesting the same image at
  // w=64, w=256, and w=1920 through /_next/image and getting back the
  // identical, full-original byte count every time. Root cause: Next.js's
  // built-in image optimization route targets Vercel's infrastructure;
  // @opennextjs/cloudflare needs either a Cloudflare Images binding (a
  // real, ongoing paid product beyond its free tier — not adopted here
  // without that being a deliberate call, same bar as every other
  // Cloudflare product decision this project has made) or
  // `unoptimized: true`, per OpenNext's own docs. Every image on the site
  // was silently being served at full original size through a wasted
  // proxy round-trip this whole time. `unoptimized: true` is the honest,
  // zero-new-cost fix — it stops pretending to resize/reformat and just
  // serves the source file directly (one less hop, too). The actual size
  // problem this masked (a 2339x1857px PNG logo displayed at 56px tall)
  // is fixed separately, at the source file itself — see
  // components/layout/Navbar.tsx and Footer.tsx.
  images: {
    unoptimized: true,
    // Clerk avatar URLs (currentUser().imageUrl / profile.avatar_url) are
    // remote — kept even under unoptimized:true. Whether this list is
    // still enforced in that mode is unconfirmed (conflicting signals on
    // this specific Next.js behavior), but leaving it is harmless either
    // way and documents the real remote hosts this app actually uses.
    remotePatterns: [
      { protocol: "https", hostname: "img.clerk.com" },
      { protocol: "https", hostname: "images.clerk.dev" },
    ],
  },
  // Target modern browsers — eliminates legacy JS polyfills
  experimental: {
    optimizePackageImports: ["lucide-react"],
  },
  // Compress output
  compress: true,
  // Power headers for caching
  async headers() {
    return [
      {
        source: "/fonts/(.*)",
        headers: [
          { key: "Cache-Control", value: "public, max-age=31536000, immutable" },
        ],
      },
      {
        source: "/_next/static/(.*)",
        headers: [
          { key: "Cache-Control", value: "public, max-age=31536000, immutable" },
        ],
      },
      {
        source: "/(.*\\.webp)",
        headers: [
          { key: "Cache-Control", value: "public, max-age=31536000, immutable" },
        ],
      },
      {
        // Lesson content (public/content/**/*.md) is fetched client-side on
        // every content-page visit (components/tech/SectionContent.tsx) and
        // had no explicit cache policy at all before this — the one asset
        // type in that hot path with the least caching of any static asset
        // category here. Not "immutable" like the hashed /_next/static/
        // assets above: content can change without its URL changing, so a
        // moderate max-age with revalidation is the safer choice.
        source: "/content/(.*)\\.md",
        headers: [
          { key: "Cache-Control", value: "public, max-age=3600, stale-while-revalidate=86400" },
        ],
      },
      // /privacy and /terms Cache-Control is set in middleware.ts, not here —
      // Cloudflare Pages' _headers mechanism (what next-on-pages compiles
      // this headers() config into) doesn't apply to Function-rendered
      // (dynamic) routes, only genuinely static assets, so a rule here would
      // silently no-op in production despite working in local `next dev`.
    ];
  },
};

export default nextConfig;

// Lets `next dev` see Cloudflare bindings (BLOG_KV) locally, the same way
// they're available in the deployed Worker — without this, local dev's
// getCloudflareContext() calls (lib/rateLimit.ts) would silently return no
// bindings, masking a real config issue until it's actually deployed.
import { initOpenNextCloudflareForDev } from "@opennextjs/cloudflare";
initOpenNextCloudflareForDev();
