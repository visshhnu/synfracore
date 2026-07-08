// Deliberately NO `export const runtime = "edge"` here — that's the one
// difference from app/(app)/layout.tsx, and it's the entire reason pages in
// this group can be genuinely statically generated (confirmed via a real
// build, see docs/audit/06-roadmap.md 3.7): Next.js disables static
// generation for any page under an edge-runtime layout, regardless of
// ClerkProvider/Navbar. This group is for pages with no per-request
// personalization needs — start with /privacy and /terms.
import "../globals.css";
import { AppChrome } from "@/components/layout/AppChrome";
import { defaultMetadata } from "@/lib/seo/defaultMetadata";

export const metadata = defaultMetadata;

export default function MarketingLayout({ children }: { children: React.ReactNode }) {
  return <AppChrome>{children}</AppChrome>;
}
