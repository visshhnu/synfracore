import { Mail, ExternalLink } from "lucide-react";
import { pageMetadata } from "@/lib/seo/metadata";
import { socialLinks } from "@/lib/data/socialLinks";

export const metadata = pageMetadata({
  title: "Contact",
  description: "Get in touch with SynfraCore. Email, social media, and support channels.",
  path: "/contact",
});

const channels = [
  {
    icon: <Mail size={20}/>,
    label: "General Enquiries",
    value: "hello@synfracore.com",
    href: "mailto:hello@synfracore.com",
    color: "#3B82F6",
    desc: "Questions about the platform, content, or learning paths",
  },
  {
    icon: <Mail size={20}/>,
    label: "Support",
    value: "support@synfracore.com",
    href: "mailto:support@synfracore.com",
    color: "#10B981",
    desc: "Technical issues, account problems, bugs",
  },
  {
    icon: <Mail size={20}/>,
    label: "Careers",
    value: "careers@synfracore.com",
    href: "mailto:careers@synfracore.com",
    color: "#8B5CF6",
    desc: "Job applications and partnerships",
  },
];

// Display handle text for each shared socialLinks entry — cosmetic only,
// not part of the shared type (lib/data/socialLinks.tsx has no reason to
// know how each platform's handle should read on this one page).
const SOCIAL_HANDLES: Record<string, string> = {
  LinkedIn: "@synfracore",
  X: "@synfracore",
  YouTube: "@synfracore",
  GitHub: "github.com/synfracore",
  Telegram: "t.me/synfracore",
  Instagram: "@synfracore",
  Facebook: "@synfracore",
  WhatsApp: "Chat with us",
};

export default function ContactPage() {
  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ marginBottom: "48px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "12px" }}>
          Contact Us
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "17px", lineHeight: 1.7 }}>
          We read every message. Choose the right channel below and we&apos;ll get back to you.
        </p>
      </div>

      {/* Email channels */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "12px", marginBottom: "16px", color: "var(--text-4)", letterSpacing: "0.06em", textTransform: "uppercase" }}>
        EMAIL
      </h2>
      <div style={{ display: "flex", flexDirection: "column", gap: "12px", marginBottom: "48px" }}>
        {channels.map(ch => (
          <a key={ch.label} href={ch.href}
            style={{ display: "flex", alignItems: "center", gap: "16px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px 24px", textDecoration: "none", color: "var(--text-1)" }}>
            <div style={{ width: "44px", height: "44px", borderRadius: "12px", background: `${ch.color}18`, color: ch.color, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
              {ch.icon}
            </div>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div style={{ fontSize: "12px", color: "var(--text-4)", fontWeight: 600, letterSpacing: "0.06em", textTransform: "uppercase", marginBottom: "2px" }}>{ch.label}</div>
              <div style={{ fontSize: "15px", fontWeight: 600, color: ch.color, marginBottom: "2px" }}>{ch.value}</div>
              <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{ch.desc}</div>
            </div>
            <ExternalLink size={14} color="var(--text-4)" style={{ flexShrink: 0 }}/>
          </a>
        ))}
      </div>

      {/* Social channels — real brand colors, shared with Footer.tsx and
          TopUtilityBar.tsx (lib/data/socialLinks.tsx). X/GitHub's marks
          are theme-dependent (black on light backgrounds, white on dark);
          this is a Server Component with no theme hook, so that's a CSS
          variable + html.light override, same mechanic as
          TopUtilityBar.tsx uses for the same reason. */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase", fontSize: "12px", color: "var(--text-4)", marginBottom: "16px" }}>
        SOCIAL MEDIA
      </h2>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(220px, 1fr))", gap: "10px", marginBottom: "48px" }}>
        {socialLinks.map(s => (
          <a key={s.name} href={s.href} target="_blank" rel="noopener noreferrer"
            style={{
              display: "flex", alignItems: "center", gap: "12px", background: "var(--bg-1)",
              border: "1px solid var(--border)", borderRadius: "12px", padding: "14px 16px",
              textDecoration: "none", color: "var(--text-1)",
              ["--icon-color" as string]: s.color,
              ["--icon-color-light" as string]: s.lightColor ?? s.color,
              ["--icon-bg" as string]: s.color + "18",
              ["--icon-bg-light" as string]: (s.lightColor ?? s.color) + "18",
            } as React.CSSProperties}>
            <div className="contact-social-icon" style={{ width: "36px", height: "36px", borderRadius: "9px", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
              {s.icon}
            </div>
            <div>
              <div style={{ fontSize: "14px", fontWeight: 600 }}>{s.name}</div>
              <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{SOCIAL_HANDLES[s.name]}</div>
            </div>
          </a>
        ))}
      </div>
      <style>{`
        .contact-social-icon { background: var(--icon-bg); color: var(--icon-color); }
        html.light .contact-social-icon { background: var(--icon-bg-light); color: var(--icon-color-light); }
      `}</style>

      {/* Response time */}
      <div style={{ background: "linear-gradient(135deg, rgba(59,130,246,0.08), rgba(139,92,246,0.08))", border: "1px solid rgba(59,130,246,0.15)", borderRadius: "14px", padding: "24px" }}>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "8px" }}>⏱️ Response Times</h3>
        <div style={{ display: "flex", flexDirection: "column", gap: "6px", fontSize: "14px", color: "var(--text-4)" }}>
          <div>General questions: <strong style={{ color: "var(--text-2)" }}>within 24 hours</strong></div>
          <div>Support issues: <strong style={{ color: "var(--text-2)" }}>within 12 hours</strong></div>
          <div>Partnerships: <strong style={{ color: "var(--text-2)" }}>within 48 hours</strong></div>
        </div>
      </div>
    </div>
  );
}
