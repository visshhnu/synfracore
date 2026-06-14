import { Mail, ExternalLink, Globe } from "lucide-react";

export const metadata = {
  title: "Contact — SynfraCore",
  description: "Get in touch with the SynfraCore team",
};

export default function ContactPage() {
  return (
    <div style={{ maxWidth: "640px", margin: "0 auto", padding: "56px 24px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "16px" }}>Contact Us</h1>
      <p style={{ color: "var(--text-4)", fontSize: "17px", lineHeight: 1.7, marginBottom: "40px" }}>
        Have a question, suggestion, or want to report an issue? We'd love to hear from you.
      </p>

      <div style={{ display: "flex", flexDirection: "column", gap: "16px", marginBottom: "48px" }}>
        {[
          { icon: <Mail size={18}/>, label: "Email", value: "hello@synfracore.com", href: "mailto:hello@synfracore.com" },
          { icon: <ExternalLink size={18}/>, label: "GitHub", value: "github.com/visshhnu/synfracore", href: "https://github.com/visshhnu/synfracore" },
          { icon: <Globe size={18}/>, label: "Website", value: "synfracore.com", href: "https://synfracore.com" },
        ].map(item => (
          <a key={item.label} href={item.href} target="_blank" rel="noopener noreferrer"
            style={{ display: "flex", alignItems: "center", gap: "16px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "20px 24px", textDecoration: "none", color: "var(--text-1)", transition: "border-color 0.2s" }}
            onMouseEnter={e => (e.currentTarget.style.borderColor = "#3B82F6")}
            onMouseLeave={e => (e.currentTarget.style.borderColor = "var(--border)")}>
            <div style={{ color: "#3B82F6" }}>{item.icon}</div>
            <div>
              <div style={{ fontSize: "12px", color: "var(--text-4)", fontWeight: 600, letterSpacing: "0.08em", marginBottom: "2px" }}>{item.label.toUpperCase()}</div>
              <div style={{ fontSize: "15px", fontWeight: 500 }}>{item.value}</div>
            </div>
          </a>
        ))}
      </div>

      <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "12px" }}>Found an issue with content?</h3>
        <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.7 }}>
          If you notice incorrect information, broken links, or have suggestions for improving any topic, please open a GitHub issue. We appreciate community contributions to making this platform better.
        </p>
      </div>
    </div>
  );
}
