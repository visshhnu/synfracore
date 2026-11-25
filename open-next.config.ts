import { defineCloudflareConfig } from "@opennextjs/cloudflare";
import staticAssetsIncrementalCache from "@opennextjs/cloudflare/overrides/incremental-cache/static-assets-incremental-cache";

// 2026-11-25 — CPU-limit fix. Until now every route rendered dynamically on
// every request (root cause: app/not-found.tsx called headers(), which made
// the whole tree dynamic), so each page view / crawler hit cost a full React
// render on the Worker and regularly exceeded the free plan's 10 ms CPU
// limit. Public pages are now prerendered at build time (generateStaticParams)
// and served from the deployed static assets:
//
// - staticAssetsIncrementalCache: read-only cache backed by the Worker's
//   ASSETS binding — free, no R2/KV needed. Suits this site because content
//   only changes on deploy (no ISR/revalidate in use). If ISR is ever added,
//   switch to the R2 incremental cache instead.
// - enableCacheInterception: serves prerendered pages before the Next server
//   is even loaded, which is where most of the CPU saving comes from.
export default defineCloudflareConfig({
  incrementalCache: staticAssetsIncrementalCache,
  enableCacheInterception: true,
});
