import type { NextConfig } from "next";
import { withSentryConfig } from "@sentry/nextjs";

const nextConfig: NextConfig = {
  async redirects() {
    return [
      {
        source: "/academies/infrastructure/:path*",
        destination: "/academies/devops/:path*",
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
    ];
  },
};

// withSentryConfig's sourcemap-upload step needs SENTRY_ORG/SENTRY_PROJECT/
// SENTRY_AUTH_TOKEN to actually upload anything — it degrades to a no-op
// (skips upload, logs a notice) rather than failing the build when those
// aren't set, so this is safe to ship before a Sentry project exists yet.
export default withSentryConfig(nextConfig, {
  silent: true,
  widenClientFileUpload: true,
  disableLogger: true,
  automaticVercelMonitors: false, // deployed on Cloudflare Pages, not Vercel
});
