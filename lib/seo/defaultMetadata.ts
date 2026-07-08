import type { Metadata } from "next";

// Shared root-layout metadata defaults (Phase 3.7) — both
// app/(app)/layout.tsx and app/(marketing)/layout.tsx export this as their
// `metadata`, so the two root layouts can't silently drift on site-wide
// defaults (title template, OG image, icons, etc.). Individual pages still
// override title/description via their own metadata export as before.
export const defaultMetadata: Metadata = {
  title: { default: "SynfraCore — Learn DevOps, Cloud & AI", template: "%s | SynfraCore" },
  description: "Master DevOps, Cloud, AI, Databases, Security and more with interactive labs, real projects, and interview prep. 101 technologies, 10 learning tracks.",
  keywords: ["DevOps", "Kubernetes", "Docker", "AWS", "Terraform", "Python", "AI", "LLM", "Cloud", "learn devops online", "devops course india"],
  authors: [{ name: "SynfraCore" }],
  creator: "SynfraCore",
  publisher: "SynfraCore",
  metadataBase: new URL("https://synfracore.com"),
  alternates: { canonical: "/" },
  openGraph: {
    type: "website",
    locale: "en_IN",
    url: "https://synfracore.com",
    siteName: "SynfraCore",
    title: "SynfraCore — Learn DevOps, Cloud & AI",
    description: "Master DevOps, Cloud, AI, Databases, and Security with interactive labs and real projects. India's most comprehensive tech learning platform.",
    images: [{ url: "/og-image.svg", width: 1200, height: 630, alt: "SynfraCore Learning Platform" }],
  },
  twitter: {
    card: "summary_large_image",
    title: "SynfraCore — Learn DevOps, Cloud & AI",
    description: "Master DevOps, Cloud, AI, and Security with interactive labs and real projects.",
    images: ["/og-image.svg"],
  },
  robots: { index: true, follow: true, googleBot: { index: true, follow: true } },
  icons: {
    icon: [
      { url: "/favicon.ico", sizes: "any" },
      { url: "/favicon-32x32.png", sizes: "32x32", type: "image/png" },
      { url: "/favicon-16x16.png", sizes: "16x16", type: "image/png" },
      { url: "/android-chrome-192x192.png", sizes: "192x192", type: "image/png" },
      { url: "/android-chrome-512x512.png", sizes: "512x512", type: "image/png" },
    ],
    apple: [{ url: "/apple-touch-icon.png", sizes: "180x180" }],
    shortcut: "/favicon.ico",
  },
  manifest: "/site.webmanifest",
};
