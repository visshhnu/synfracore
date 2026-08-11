import type { Metadata } from "next";
import { ClerkProvider } from "@clerk/nextjs";

import "./globals.css";
import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";
import { ThemeProvider } from "@/components/ThemeProvider";
import { CopyProtection } from "@/components/CopyProtection";
import { WebSiteJsonLd, OrganizationJsonLd } from "@/components/seo/JsonLd";
import AuthStateSync from "@/components/auth/AuthStateSync";

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
    images: [{ url: "https://synfracore.com/og/default.png", width: 1200, height: 630, alt: "SynfraCore Learning Platform" }],
  },
  twitter: {
    card: "summary_large_image",
    title: "SynfraCore — Learn DevOps, Cloud & AI",
    description: "Master DevOps, Cloud, AI, and Security with interactive labs and real projects.",
    images: ["https://synfracore.com/og/default.png"],
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

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <ClerkProvider afterSignOutUrl="/">
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

          /* Fallback-metric overrides — the actual CLS fix (2026-08-11).
             font-display:swap alone means text first paints in the browser's
             system sans-serif, then reflows once each custom font loads,
             because the fallback and the custom font have different glyph
             widths/heights. These "* Fallback" faces are local system fonts
             (Arial, which every OS ships or has an equivalent for) resized
             via ascent/descent/line-gap/size-adjust to match each real
             font's actual metrics — computed from the real .woff2 files in
             /public/fonts via fontkit, matched against @capsizecss/metrics'
             verified Arial metrics (regular for weight<700, bold for >=700).
             Referencing '<Family> Fallback' before the generic sans-serif in
             each font stack (see globals.css) means the fallback now occupies
             the same box the real font will occupy, so the swap-in causes
             little to no reflow instead of a visible shift. */
          @font-face{font-family:'Inter Fallback';src:local('Arial'),local('ArialMT');font-weight:400;font-display:swap;ascent-override:70.7575%;descent-override:17.618%;line-gap-override:0%;size-adjust:136.9113%;}
          @font-face{font-family:'Inter Fallback';src:local('Arial'),local('ArialMT');font-weight:500;font-display:swap;ascent-override:69.9738%;descent-override:17.4229%;line-gap-override:0%;size-adjust:138.4447%;}
          @font-face{font-family:'Inter Fallback';src:local('Arial'),local('ArialMT');font-weight:600;font-display:swap;ascent-override:69.2615%;descent-override:17.2455%;line-gap-override:0%;size-adjust:139.8686%;}
          @font-face{font-family:'Plus Jakarta Sans Fallback';src:local('Arial'),local('ArialMT');font-weight:600;font-display:swap;ascent-override:81.7564%;descent-override:17.4855%;line-gap-override:0%;size-adjust:126.9625%;}
          @font-face{font-family:'Plus Jakarta Sans Fallback';src:local('Arial Bold'),local('Arial-BoldMT');font-weight:700;font-display:swap;ascent-override:86.6469%;descent-override:18.5314%;line-gap-override:0%;size-adjust:119.7965%;}
          @font-face{font-family:'Plus Jakarta Sans Fallback';src:local('Arial Bold'),local('Arial-BoldMT');font-weight:800;font-display:swap;ascent-override:85.3116%;descent-override:18.2458%;line-gap-override:0%;size-adjust:121.6716%;}
          @font-face{font-family:'JetBrains Mono Fallback';src:local('Arial'),local('ArialMT');font-weight:400;font-display:swap;ascent-override:75.7861%;descent-override:22.29%;line-gap-override:0%;size-adjust:134.5893%;}
          @font-face{font-family:'JetBrains Mono Fallback';src:local('Arial'),local('ArialMT');font-weight:500;font-display:swap;ascent-override:75.7861%;descent-override:22.29%;line-gap-override:0%;size-adjust:134.5893%;}
        ` }} />
        <link rel="preload" href="/fonts/inter-400.woff2" as="font" type="font/woff2" crossOrigin="anonymous" />
        <link rel="preload" href="/fonts/pjs-700.woff2" as="font" type="font/woff2" crossOrigin="anonymous" />
        {/* pjs-800 was missing here despite being the actual LCP element's
            font on the homepage (.display-xl, the H1, is weight 800) — it
            was being discovered late (after CSSOM build, no preload
            priority), adding a full font-fetch round trip onto LCP.
            Confirmed via CWV audit 2026-08-11. */}
        <link rel="preload" href="/fonts/pjs-800.woff2" as="font" type="font/woff2" crossOrigin="anonymous" />
        <script dangerouslySetInnerHTML={{ __html: `try{var t=localStorage.getItem('theme');if(t==='light')document.documentElement.classList.add('light');}catch(e){}` }} />
        <style>{`.goog-te-banner-frame,.skiptranslate{display:none!important}body{top:0!important}`}</style>
        <WebSiteJsonLd />
        <OrganizationJsonLd />
        {/* Cloudflare Web Analytics — no cookies, no persistent client
            identifiers, data stays in Cloudflare's own dashboard (Analytics
            & Logs → Web Analytics). The beacon token is not a secret (it's
            embedded in this public HTML either way) but is still only
            rendered when set, so local/preview builds without it don't
            report traffic under the production site's token. */}
        {process.env.NEXT_PUBLIC_CF_BEACON_TOKEN && (
          <script
            defer
            src="https://static.cloudflareinsights.com/beacon.min.js"
            data-cf-beacon={`{"token": "${process.env.NEXT_PUBLIC_CF_BEACON_TOKEN}"}`}
          />
        )}
      </head>
      <body suppressHydrationWarning style={{ margin: 0, minHeight: "100vh", display: "flex", flexDirection: "column", background: "var(--bg)", color: "var(--text-2)" }}>
        <ThemeProvider>
          <AuthStateSync />
          <CopyProtection />
          <Navbar />
          <main style={{ flex: 1, paddingTop: "64px" }}>{children}</main>
          <Footer />
        </ThemeProvider>
      </body>
      </html>
    </ClerkProvider>
  );
}
