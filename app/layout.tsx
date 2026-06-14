export const runtime = "edge";
import type { Metadata } from "next";
import "./globals.css";
import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";
import { ThemeProvider } from "@/components/ThemeProvider";
import { CopyProtection } from "@/components/CopyProtection";

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
    images: [{ url: "/og-image.png", width: 1200, height: 630, alt: "SynfraCore Learning Platform" }],
  },
  twitter: {
    card: "summary_large_image",
    title: "SynfraCore — Learn DevOps, Cloud & AI",
    description: "Master DevOps, Cloud, AI, and Security with interactive labs and real projects.",
    images: ["/og-image.png"],
  },
  robots: { index: true, follow: true, googleBot: { index: true, follow: true } },
  icons: {
    icon: [
      { url: "/favicon.ico" },
      { url: "/icon-32.png", sizes: "32x32", type: "image/png" },
      { url: "/icon-16.png", sizes: "16x16", type: "image/png" },
    ],
    apple: [{ url: "/apple-touch-icon.png", sizes: "180x180" }],
    shortcut: "/favicon.ico",
  },
  manifest: "/manifest.json",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" crossOrigin="anonymous" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@600;700;800&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet" />
        <script dangerouslySetInnerHTML={{ __html: `try{var t=localStorage.getItem('theme');if(t==='light')document.documentElement.classList.add('light');}catch(e){}` }} />
        <style>{`.goog-te-banner-frame,.skiptranslate{display:none!important}body{top:0!important}`}</style>
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
