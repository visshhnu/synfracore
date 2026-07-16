import type { Metadata } from "next";

type PageMetadataInput = {
  title: string;
  description: string;
  /** Path only, e.g. "/learn" or `/blog/${slug}` — absolute URL is built from this. */
  path: string;
  /** Extra keywords beyond the page's own title/description. */
  keywords?: string[];
  /** Forwarded to /api/og — omit entirely to just use `title` as the OG image's headline. */
  ogImageParams?: { academy?: string; title?: string; section?: string; subtitle?: string };
};

// Every page's generateMetadata should build its Metadata object through
// this helper, not by hand. Before this existed, most pages defined `title`/
// `description` but no `openGraph`/`twitter` at all — Next.js metadata
// resolution inherits whichever of those top-level keys a page doesn't
// define from the parent layout, so those pages silently leaked the
// homepage's og:title/og:url (NF-3). Even pages that DID define their own
// `openGraph` still leaked the homepage's twitter:title/description, since
// `twitter` is a separate top-level key Next.js doesn't derive from
// `openGraph` — every page needs to set both explicitly, every time, or the
// leak comes back. Centralizing that here means a new page can't reintroduce
// this bug by omission.
//
// The image comes from /api/og (a next/og ImageResponse route already in
// this codebase) instead of the old static /og-image.svg — Facebook/X/
// LinkedIn/WhatsApp crawlers don't render SVG for link previews at all.
export function pageMetadata({ title, description, path, keywords, ogImageParams }: PageMetadataInput): Metadata {
  const url = `https://synfracore.com${path}`;
  const ogImageQuery = new URLSearchParams(
    Object.entries(ogImageParams ?? { title }).filter((entry): entry is [string, string] => Boolean(entry[1]))
  ).toString();
  const ogImageUrl = `https://synfracore.com/api/og?${ogImageQuery}`;

  return {
    title,
    description,
    ...(keywords ? { keywords } : {}),
    alternates: { canonical: url },
    openGraph: {
      title,
      description,
      url,
      type: "website",
      siteName: "SynfraCore",
      images: [{ url: ogImageUrl, width: 1200, height: 630, alt: title }],
    },
    twitter: {
      card: "summary_large_image",
      title,
      description,
      images: [ogImageUrl],
    },
  };
}
