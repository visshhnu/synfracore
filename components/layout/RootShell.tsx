import { ThemeProvider } from "@/components/ThemeProvider";
import { CopyProtection } from "@/components/CopyProtection";
import { WebSiteJsonLd, OrganizationJsonLd } from "@/components/seo/JsonLd";

// Shared <html>/<head>/<body> shell for every root layout (Phase 3.7 —
// app/(app)/layout.tsx and app/(marketing)/layout.tsx both use this instead
// of each hand-duplicating the same fonts/theme-script/JsonLd markup, which
// would otherwise be exactly the kind of two-copies-that-must-stay-in-sync
// drift risk this whole engagement has repeatedly found and fixed elsewhere
// (roadmap steps/techLinks, content registry, search index, sitemap).
export function RootShell({ children }: { children: React.ReactNode }) {
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
    </head>
    <body suppressHydrationWarning style={{ margin: 0, minHeight: "100vh", display: "flex", flexDirection: "column", background: "var(--bg)", color: "var(--text-2)" }}>
      <ThemeProvider>
        <CopyProtection />
        {children}
      </ThemeProvider>
    </body>
    </html>
  );
}
