export const runtime = "edge";
import type { Metadata } from "next";
import "./globals.css";
import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";

export const metadata: Metadata = {
  title: { default: "SynfraCore — Learn DevOps, Cloud & AI", template: "%s — SynfraCore" },
  description: "The world's most comprehensive technology learning ecosystem. Master DevOps, Cloud, AI Engineering, Data Analytics, Healthcare Coding, and Cybersecurity.",
  keywords: ["DevOps", "Kubernetes", "AWS", "Azure", "Terraform", "Docker", "AI Engineering", "Cloud", "Platform Engineering"],
  openGraph: {
    title: "SynfraCore — Learn DevOps, Cloud & AI",
    description: "6 Academies. 50+ Technologies. Learn → Practice → Build → Get Hired.",
    url: "https://synfracore.com",
    siteName: "SynfraCore",
    type: "website",
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" crossOrigin="anonymous" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Syne:wght@600;700;800&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </head>
      <body style={{ margin: 0, minHeight: "100vh", display: "flex", flexDirection: "column", background: "#04080F", color: "#E2E8F4" }}>
        <Navbar />
        <main style={{ flex: 1 }}>{children}</main>
        <Footer />
      </body>
    </html>
  );
}
