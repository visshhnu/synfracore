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
  // Optimize images
  images: {
    formats: ["image/webp", "image/avif"],
    minimumCacheTTL: 31536000, // 1 year cache
    deviceSizes: [640, 750, 828, 1080, 1200, 1920],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
    // Clerk avatar URLs (currentUser().imageUrl / profile.avatar_url) are
    // remote — next/image throws at render time for any hostname not
    // whitelisted here, which was crashing /dashboard for every signed-in
    // user (Clerk auto-generates an avatar even for email/OTP sign-in).
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
