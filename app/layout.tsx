export const runtime = "edge";
import type { Metadata } from "next";
import "./globals.css";
import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";
import { ThemeProvider } from "@/components/ThemeProvider";
import { CopyProtection } from "@/components/CopyProtection";
import { GoogleTranslate } from "@/components/GoogleTranslate";

export const metadata: Metadata = {
  title: { default: "SynfraCore — Learn DevOps, Cloud & AI", template: "%s — SynfraCore" },
  description: "The world's most comprehensive technology learning ecosystem. Master DevOps, Cloud, AI, Data, Security, and more.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" crossOrigin="anonymous" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@600;700;800&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
        {/* Set theme class BEFORE first paint — eliminates light/dark flash */}
        <script dangerouslySetInnerHTML={{ __html: `try{var t=localStorage.getItem('theme');if(t==='light')document.documentElement.classList.add('light');}catch(e){}` }} />
        {/* Hide Google Translate toolbar */}
        <style>{`.goog-te-banner-frame,.skiptranslate{display:none!important}body{top:0!important}`}</style>
      </head>
      <body suppressHydrationWarning style={{ margin: 0, minHeight: "100vh", display: "flex", flexDirection: "column", background: "var(--bg)", color: "var(--text-2)" }}>
        <ThemeProvider>
          <CopyProtection />
          {/* GoogleTranslate is client-only — prevents React #418 hydration error */}
          <GoogleTranslate />
          <Navbar />
          {/* Padding compensates for fixed navbar height */}
          <main style={{ flex: 1, paddingTop: "64px" }}>{children}</main>
          <Footer />
        </ThemeProvider>
      </body>
    </html>
  );
}
