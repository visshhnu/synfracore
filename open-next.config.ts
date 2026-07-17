import { defineCloudflareConfig } from "@opennextjs/cloudflare";

// No incrementalCache override (e.g. an R2-backed one) configured — every
// route in this app runs dynamic today (no ISR/generateStaticParams caching
// in use), so there's nothing for it to cache yet. Revisit when D2 (static
// rendering) actually lands; see docs/audit/07-roadmap-final.md's D1 entry
// for the explicit test of what happens with zero R2 config.
export default defineCloudflareConfig();
