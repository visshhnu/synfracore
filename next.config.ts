import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Required for Cloudflare Pages
  experimental: {
    // allows next-on-pages to work
  },
};

export default nextConfig;
