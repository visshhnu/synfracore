export const runtime = "edge";
import type { Metadata } from "next";

import "./globals.css";
import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";
import { ThemeProvider } from "@/components/ThemeProvider";
import { CopyProtection } from "@/components/CopyProtection";
import { WebSiteJsonLd, OrganizationJsonLd } from "@/components/seo/JsonLd";

export const metadata: Metadata = {
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
      { url: "/logo-ac-mark-512.png", sizes: "512x512", type: "image/png" },
    ],
    apple: [{ url: "/apple-touch-icon.png", sizes: "180x180" }],
    shortcut: "/favicon.ico",
  },
  manifest: "/site.webmanifest",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        {/* Self-hosted fonts — eliminates Google DNS lookup + render blocking */}
        <style dangerouslySetInnerHTML={{ __html: `
          @font-face{font-family:'Inter';src:url('/fonts/inter-400.woff2') format('woff2');font-weight:400;font-display:swap;}
          @font-face{font-family:'Inter';src:url('/fonts/inter-500.woff2') format('woff2');font-weight:500;font-display:swap;}
          @font-face{font-family:'Inter';src:url('/fonts/inter-600.woff2') format('woff2');font-weight:600;font-display:swap;}
          @font-face{font-family:'Plus Jakarta Sans';src:url('/fonts/pjs-600.woff2') format('woff2');font-weight:600;font-display:swap;}
          @font-face{font-family:'Plus Jakarta Sans';src:url('/fonts/pjs-700.woff2') format('woff2');font-weight:700;font-display:swap;}
          @font-face{font-family:'Plus Jakarta Sans';src:url('/fonts/pjs-800.woff2') format('woff2');font-weight:800;font-display:swap;}
          @font-face{font-family:'JetBrains Mono';src:url('/fonts/jbm-400.woff2') format('woff2');font-weight:400;font-display:swap;}
          @font-face{font-family:'JetBrains Mono';src:url('/fonts/jbm-500.woff2') format('woff2');font-weight:500;font-display:swap;}
        ` }} />
        <link rel="preload" href="/fonts/inter-400.woff2" as="font" type="font/woff2" crossOrigin="anonymous" />
        <link rel="preload" href="/fonts/pjs-700.woff2" as="font" type="font/woff2" crossOrigin="anonymous" />
        <script dangerouslySetInnerHTML={{ __html: `try{var t=localStorage.getItem('theme');if(t==='light')document.documentElement.classList.add('light');}catch(e){}` }} />
        <style>{`.goog-te-banner-frame,.skiptranslate{display:none!important}body{top:0!important}`}</style>
        <WebSiteJsonLd />
        <OrganizationJsonLd />

        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "Organization",
              "name": "SynfraCore",
              "url": "https://synfracore.com",
              "description": "Practitioner-built learning platform for DevOps, Cloud, AI, Security, and career readiness. Expert content, hands-on labs, interview prep, and certification guides.",
              "sameAs": ["https://t.me/synfracore"],
              "knowsAbout": ["DevOps", "Kubernetes", "Cloud Computing", "AWS", "Azure", "Terraform", "Ansible", "Platform Engineering", "AI Engineering"],
            })
          }}
        />
      </head>
      <body suppressHydrationWarning style={{ margin: 0, minHeight: "100vh", display: "flex", flexDirection: "column", background: "var(--bg)", color: "var(--text-2)" }}>
        <ThemeProvider>
          <CopyProtection />
          <Navbar />
          <main style={{ flex: 1, paddingTop: "64px" }}>{children}</main>
          <Footer />
        </ThemeProvider>
      </body>
    </html>
  );
}
