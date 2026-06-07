"use client";
import Link from "next/link";
import Image from "next/image";

const academyLinks = [
  { name: "DevOps & Platform", href: "/academies/devops" },
  { name: "Cloud (AWS/Azure/GCP)", href: "/academies/cloud" },
  { name: "Databases", href: "/academies/databases" },
  { name: "AI & ML Engineering", href: "/academies/ai" },
  { name: "Data Analytics & BI", href: "/academies/data" },
  { name: "Cybersecurity", href: "/academies/security" },
  { name: "Health & Medical Coding", href: "/academies/healthcare" },
  { name: "Human Essentials", href: "/academies/essentials" },
];

const platformLinks = [
  { name: "Labs", href: "/labs" },
  { name: "Projects", href: "/projects" },
  { name: "Roadmaps", href: "/roadmaps" },
  { name: "Certifications", href: "/certifications" },
  { name: "Interview Hub", href: "/interview" },
  { name: "Troubleshooting", href: "/troubleshooting" },
  { name: "AI Assistant", href: "/ai-assistant" },
  { name: "Community", href: "/community" },
];

const companyLinks = [
  { name: "About SynfraCore", href: "/about" },
  { name: "Our Mission", href: "/about#mission" },
  { name: "Contact Us", href: "/contact" },
  { name: "Careers", href: "/careers" },
  { name: "Blog", href: "/blog" },
  { name: "Privacy Policy", href: "/privacy" },
  { name: "Terms of Service", href: "/terms" },
];

const socialLinks = [
  {
    name: "LinkedIn",
    href: "https://linkedin.com/company/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
      </svg>
    ),
    color: "#0077B5",
  },
  {
    name: "Twitter / X",
    href: "https://twitter.com/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
      </svg>
    ),
    color: "#1DA1F2",
  },
  {
    name: "YouTube",
    href: "https://youtube.com/@synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
      </svg>
    ),
    color: "#FF0000",
  },
  {
    name: "GitHub",
    href: "https://github.com/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
      </svg>
    ),
    color: "#888",
  },
  {
    name: "Telegram",
    href: "https://t.me/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/>
      </svg>
    ),
    color: "#0088CC",
  },
  {
    name: "Discord",
    href: "https://discord.gg/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M20.317 4.37a19.791 19.791 0 0 0-4.885-1.515.074.074 0 0 0-.079.037c-.21.375-.444.864-.608 1.25a18.27 18.27 0 0 0-5.487 0 12.64 12.64 0 0 0-.617-1.25.077.077 0 0 0-.079-.037A19.736 19.736 0 0 0 3.677 4.37a.07.07 0 0 0-.032.027C.533 9.046-.32 13.58.099 18.057.1 18.079.11 18.1.127 18.114c2.045 1.504 4.035 2.418 5.993 3.022a.077.077 0 0 0 .084-.028c.462-.63.874-1.295 1.226-1.994a.076.076 0 0 0-.041-.106 13.107 13.107 0 0 1-1.872-.892.077.077 0 0 1-.008-.128 10.2 10.2 0 0 0 .372-.292.074.074 0 0 1 .077-.01c3.928 1.793 8.18 1.793 12.062 0a.074.074 0 0 1 .078.01c.12.098.246.198.373.292a.077.077 0 0 1-.006.127 12.299 12.299 0 0 1-1.873.892.077.077 0 0 0-.041.107c.36.698.772 1.362 1.225 1.993a.076.076 0 0 0 .084.028c1.961-.604 3.95-1.518 5.996-3.022a.077.077 0 0 0 .032-.054c.5-5.177-.838-9.674-3.549-13.66a.061.061 0 0 0-.031-.03z"/>
      </svg>
    ),
    color: "#5865F2",
  },
];

export default function Footer() {
  return (
    <footer style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)" }}>
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 16px 0" }}>

        {/* Main footer grid */}
        <div style={{ display: "grid", gridTemplateColumns: "1.8fr 1fr 1fr 1fr", gap: "48px", marginBottom: "48px" }}>

          {/* Brand column */}
          <div>
            <Link href="/" style={{ display: "inline-flex", alignItems: "center", gap: "10px", textDecoration: "none", marginBottom: "16px" }}>
              <div className="logo-pill" style={{ display: "flex", alignItems: "center" }}>
                <Image src="/logo-ac-footer.png" alt="AC" width={58} height={36}
                  style={{ height: "30px", width: "auto" }} />
              </div>
              <span style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "17px", fontWeight: 800, color: "var(--text-1)" }}>SynfraCore</span>
            </Link>
            <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.75, maxWidth: "260px", marginBottom: "20px" }}>
              The world&apos;s most comprehensive tech learning ecosystem. Built for practitioners, by practitioners. Education should be free.
            </p>

            {/* Social icons */}
            <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
              {socialLinks.map(s => (
                <a key={s.name} href={s.href} target="_blank" rel="noopener noreferrer"
                  title={s.name}
                  style={{
                    width: "36px", height: "36px", borderRadius: "9px",
                    background: "var(--bg-2)", border: "1px solid var(--border)",
                    display: "flex", alignItems: "center", justifyContent: "center",
                    color: "var(--text-4)", textDecoration: "none",
                    transition: "color 0.2s, border-color 0.2s, background 0.2s",
                  }}
                  onMouseEnter={e => {
                    (e.currentTarget as HTMLElement).style.color = s.color;
                    (e.currentTarget as HTMLElement).style.borderColor = s.color + "44";
                    (e.currentTarget as HTMLElement).style.background = s.color + "10";
                  }}
                  onMouseLeave={e => {
                    (e.currentTarget as HTMLElement).style.color = "var(--text-4)";
                    (e.currentTarget as HTMLElement).style.borderColor = "var(--border)";
                    (e.currentTarget as HTMLElement).style.background = "var(--bg-2)";
                  }}
                >
                  {s.icon}
                </a>
              ))}
            </div>

            {/* Contact */}
            <div style={{ marginTop: "20px" }}>
              <a href="mailto:hello@synfracore.com" style={{ fontSize: "13px", color: "var(--text-4)", textDecoration: "none", display: "flex", alignItems: "center", gap: "6px" }}>
                <span>✉️</span> hello@synfracore.com
              </a>
            </div>
          </div>

          {/* Academies */}
          <div>
            <div style={{ fontSize: "11px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "16px" }}>Academies</div>
            <ul style={{ listStyle: "none", padding: 0, display: "flex", flexDirection: "column", gap: "9px" }}>
              {academyLinks.map(l => (
                <li key={l.name}>
                  <Link href={l.href} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
                    onMouseEnter={e => (e.target as HTMLElement).style.color = "var(--text-1)"}
                    onMouseLeave={e => (e.target as HTMLElement).style.color = "var(--text-3)"}>
                    {l.name}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Platform */}
          <div>
            <div style={{ fontSize: "11px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "16px" }}>Platform</div>
            <ul style={{ listStyle: "none", padding: 0, display: "flex", flexDirection: "column", gap: "9px" }}>
              {platformLinks.map(l => (
                <li key={l.name}>
                  <Link href={l.href} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
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
                  <Link href={l.href} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
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
        @media (max-width: 768px) {
          footer > div > div:first-child {
            grid-template-columns: 1fr 1fr !important;
            gap: 28px !important;
          }
          footer > div > div:first-child > div:first-child {
            grid-column: 1 / -1;
          }
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
