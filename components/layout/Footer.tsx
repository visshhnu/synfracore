"use client";
import { NewsletterSignup } from "@/components/growth/NewsletterSignup";
import Link from "next/link";
import Image from "next/image";
import { useTheme } from "@/components/ThemeProvider";
import { Mail } from "lucide-react";
import { socialLinks } from "@/lib/data/socialLinks";

// Truncated to the 8 most prominent academies (the four with real, live
// premium practice-exam content — DevOps, Cloud, Cybersecurity, Healthcare
// Coding — plus the platform's other core tech categories and its largest
// non-tech audience) with a "View all academies →" link to /academies for
// the rest, specifically to fix a real visual-imbalance problem: all 20
// academies in one column made it dramatically taller than the Platform
// (9 links) and Company (6 links) columns beside it. Grouping (reusing
// Navbar.tsx's GROUPS) was considered and rejected for this specific
// problem — it adds 4 subheadings on top of still listing all 20 links,
// making the column taller, not shorter; it solves an organization
// problem this footer doesn't have, not the height problem it does.
// Full, ungrouped list with every academy lives at academies.ts and is
// what /academies itself renders — this is deliberately a curated subset,
// not a sync target, so it does NOT need updating every time a new
// academy ships (unlike the pre-fix flat list this replaced).
const academyLinks = [
  { name: "DevOps", href: "/academies/devops" },
  { name: "Cloud", href: "/academies/cloud" },
  { name: "Cybersecurity", href: "/academies/security" },
  { name: "Healthcare Coding", href: "/academies/healthcare" },
  { name: "AI Engineering", href: "/academies/ai" },
  { name: "Data Analytics", href: "/academies/data" },
  { name: "Databases", href: "/academies/databases" },
  { name: "Competitive Exams", href: "/academies/exams" },
];

const platformLinks = [
  { name: "Labs", href: "/labs" },
  { name: "Projects", href: "/projects" },
  { name: "Roadmaps", href: "/roadmaps" },
  { name: "Certifications", href: "/certifications" },
  { name: "Practice Exams", href: "/question-bank" },
  { name: "Interview Hub", href: "/interview" },
  { name: "Troubleshooting", href: "/troubleshooting" },
  { name: "AI Assistant", href: "/ai-assistant" },
  { name: "Community", href: "/community" },
];

const companyLinks = [
  { name: "About", href: "/about" },
  { name: "Blog", href: "/blog" },
  { name: "Careers", href: "/careers" },
  { name: "Contact", href: "/contact" },
  { name: "Privacy", href: "/privacy" },
  { name: "Terms", href: "/terms" },
];

export default function Footer() {
  const { theme } = useTheme();
  const logoSrc = theme === "light" ? "/logo-light-full.png" : "/logo-dark-full.png";
  return (
    <footer style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)" }}>
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 16px 0" }}>

        {/* Main footer grid */}
        <div style={{ display: "grid", gridTemplateColumns: "1.8fr 1fr 1fr 1fr", gap: "48px", marginBottom: "48px" }}>

          {/* Brand column */}
          <div>
            <Link href="/" prefetch={false} style={{ display: "inline-flex", alignItems: "center", textDecoration: "none", marginBottom: "16px" }}>
              {/* Both source files already have their 4 outer corners keyed
                  transparent, so only the rounded card renders — no square
                  artifact against the footer background. width/height
                  378x300 match the real files (resized 2026-09-13 perf
                  audit — see Navbar.tsx's identical logo for the full
                  story; these render even smaller, 44-56px tall). */}
              <Image src={logoSrc} alt="SynfraCore" width={378} height={300} className="footer-logo-desktop" style={{ height: "56px", width: "auto" }} />
              <Image src={logoSrc} alt="SynfraCore" width={378} height={300} className="footer-logo-mobile" style={{ height: "44px", width: "auto" }} />
            </Link>
            <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.75, maxWidth: "260px", marginBottom: "20px" }}>
              The world&apos;s most comprehensive tech learning ecosystem. Built for practitioners, by practitioners. Education should be free.
            </p>
            {/* Newsletter signup */}
            <div style={{ marginTop: "18px" }}>
              <p style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 700, letterSpacing: "0.07em", textTransform: "uppercase", marginBottom: "8px" }}>Weekly Digest</p>
              <NewsletterSignup variant="compact" context="footer" />
            </div>

            {/* Social icons — resting color is each platform's real brand
                color (matches TopUtilityBar.tsx), not the previous
                monochrome var(--text-4) with color-on-hover only.
                X/GitHub's marks are themselves theme-dependent (black on
                light backgrounds, white on dark) — `theme` is already in
                scope here via useTheme(), same source as logoSrc below,
                so picking lightColor vs color is a plain JS branch rather
                than TopUtilityBar's CSS-variable approach (that component
                has no theme hook, being a Server Component). */}
            <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
              {socialLinks.map(s => {
                const restColor = theme === "light" ? (s.lightColor ?? s.color) : s.color;
                return (
                  <a key={s.name} href={s.href} target="_blank" rel="noopener noreferrer"
                    title={s.name}
                    style={{
                      width: "44px", height: "44px", borderRadius: "10px",
                      background: "var(--bg-2)", border: "1px solid var(--border)",
                      display: "flex", alignItems: "center", justifyContent: "center",
                      color: restColor, textDecoration: "none",
                      transition: "border-color 0.2s, background 0.2s",
                    }}
                    onMouseEnter={e => {
                      (e.currentTarget as HTMLElement).style.borderColor = s.color + "44";
                      (e.currentTarget as HTMLElement).style.background = s.color + "10";
                    }}
                    onMouseLeave={e => {
                      (e.currentTarget as HTMLElement).style.borderColor = "var(--border)";
                      (e.currentTarget as HTMLElement).style.background = "var(--bg-2)";
                    }}
                  >
                    {s.icon}
                  </a>
                );
              })}
            </div>

            {/* Contact */}
            <div style={{ marginTop: "20px" }}>
              <a href="mailto:hello@synfracore.com" style={{ fontSize: "13px", color: "var(--text-4)", textDecoration: "none", display: "flex", alignItems: "center", gap: "6px" }}>
                <Mail size={13} /> hello@synfracore.com
              </a>
            </div>
          </div>

          {/* Academies */}
          <div>
            <div style={{ fontSize: "11px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "16px" }}>Academies</div>
            <ul style={{ listStyle: "none", padding: 0, display: "flex", flexDirection: "column", gap: "9px" }}>
              {academyLinks.map(l => (
                <li key={l.name}>
                  <Link href={l.href} prefetch={false} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
                    onMouseEnter={e => (e.target as HTMLElement).style.color = "var(--text-1)"}
                    onMouseLeave={e => (e.target as HTMLElement).style.color = "var(--text-3)"}>
                    {l.name}
                  </Link>
                </li>
              ))}
              <li>
                <Link href="/academies" prefetch={false} style={{ color: "var(--text-4)", fontSize: "13px", fontWeight: 700, textDecoration: "none", transition: "color 0.15s" }}
                  onMouseEnter={e => (e.target as HTMLElement).style.color = "var(--text-1)"}
                  onMouseLeave={e => (e.target as HTMLElement).style.color = "var(--text-4)"}>
                  View all academies →
                </Link>
              </li>
            </ul>
          </div>

          {/* Platform */}
          <div>
            <div style={{ fontSize: "11px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "16px" }}>Platform</div>
            <ul style={{ listStyle: "none", padding: 0, display: "flex", flexDirection: "column", gap: "9px" }}>
              {platformLinks.map(l => (
                <li key={l.name}>
                  <Link href={l.href} prefetch={false} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
                    onMouseEnter={e => (e.target as HTMLElement).style.color = "var(--text-1)"}
                    onMouseLeave={e => (e.target as HTMLElement).style.color = "var(--text-3)"}>
                    {l.name}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Company */}
          <div>
            <div style={{ fontSize: "11px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "16px" }}>Company</div>
            <ul style={{ listStyle: "none", padding: 0, display: "flex", flexDirection: "column", gap: "9px" }}>
              {companyLinks.map(l => (
                <li key={l.name}>
                  <Link href={l.href} prefetch={false} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
                    onMouseEnter={e => (e.target as HTMLElement).style.color = "var(--text-1)"}
                    onMouseLeave={e => (e.target as HTMLElement).style.color = "var(--text-3)"}>
                    {l.name}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Bottom bar */}
        <div style={{ borderTop: "1px solid var(--border)", padding: "20px 0", display: "flex", justifyContent: "space-between", alignItems: "center", flexWrap: "wrap", gap: "12px" }}>
          <p style={{ color: "var(--text-4)", fontSize: "12px" }}>
            © 2026 SynfraCore. Built for the community. Education should be free.
          </p>
          <p style={{ color: "var(--text-4)", fontSize: "11px", letterSpacing: "0.1em" }}>
            LEARN → PRACTICE → BUILD → GET HIRED
          </p>
        </div>
      </div>

      {/* Mobile footer CSS */}
      <style>{`
        .footer-logo-desktop { display: inline-block; }
        .footer-logo-mobile { display: none; }
        @media (max-width: 768px) {
          footer > div > div:first-child {
            grid-template-columns: 1fr 1fr !important;
            gap: 28px !important;
          }
          footer > div > div:first-child > div:first-child {
            grid-column: 1 / -1;
          }
          .footer-logo-desktop { display: none; }
          .footer-logo-mobile { display: inline-block; }
        }
        @media (max-width: 480px) {
          footer > div > div:first-child {
            grid-template-columns: 1fr !important;
          }
        }
      `}</style>
    </footer>
  );
}
