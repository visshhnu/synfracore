import { Mail, ExternalLink } from "lucide-react";

export const metadata = {
  title: "Contact — SynfraCore",
  description: "Get in touch with SynfraCore. Email, social media, and support channels.",
};

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

const socials = [
  {
    icon: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>,
    name: "LinkedIn",
    handle: "@synfracore",
    href: "https://linkedin.com/company/synfracore",
    color: "#0077B5",
  },
  {
    icon: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>,
    name: "Twitter / X",
    handle: "@synfracore",
    href: "https://twitter.com/synfracore",
    color: "#1DA1F2",
  },
  {
    icon: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>,
    name: "YouTube",
    handle: "@synfracore",
    href: "https://youtube.com/@synfracore",
    color: "#FF0000",
  },
  {
    icon: <ExternalLink size={18}/>,
    name: "GitHub",
    handle: "github.com/synfracore",
    href: "https://github.com/synfracore",
    color: "#888",
  },
  {
    icon: <ExternalLink size={18}/>,
    name: "Telegram",
    handle: "t.me/synfracore",
    href: "https://t.me/synfracore",
    color: "#0088CC",
  },
];

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

      {/* Social channels */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase", fontSize: "12px", color: "var(--text-4)", marginBottom: "16px" }}>
        SOCIAL MEDIA
      </h2>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(220px, 1fr))", gap: "10px", marginBottom: "48px" }}>
        {socials.map(s => (
          <a key={s.name} href={s.href} target="_blank" rel="noopener noreferrer"
            style={{ display: "flex", alignItems: "center", gap: "12px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "14px 16px", textDecoration: "none", color: "var(--text-1)" }}>
            <div style={{ width: "36px", height: "36px", borderRadius: "9px", background: `${s.color}18`, color: s.color, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
              {s.icon}
            </div>
            <div>
              <div style={{ fontSize: "14px", fontWeight: 600 }}>{s.name}</div>
              <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{s.handle}</div>
            </div>
          </a>
        ))}
      </div>

      {/* Response time */}
      <div style={{ background: "linear-gradient(135deg, rgba(59,130,246,0.08), rgba(139,92,246,0.08))", border: "1px solid rgba(59,130,246,0.15)", borderRadius: "14px", padding: "24px" }}>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "8px" }}>⏱ Response Times</h3>
        <div style={{ display: "flex", flexDirection: "column", gap: "6px", fontSize: "14px", color: "var(--text-4)" }}>
          <div>General questions: <strong style={{ color: "var(--text-2)" }}>within 24 hours</strong></div>
          <div>Support issues: <strong style={{ color: "var(--text-2)" }}>within 12 hours</strong></div>
          <div>Partnerships: <strong style={{ color: "var(--text-2)" }}>within 48 hours</strong></div>
        </div>
      </div>
    </div>
  );
}
