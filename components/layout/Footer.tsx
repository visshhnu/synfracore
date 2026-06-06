import Link from "next/link";
import { Zap } from "lucide-react";

const cols = [
  { title: "Academies", links: [
    { name: "Infrastructure", href: "/academies/infrastructure" },
    { name: "Cloud (AWS/Azure/GCP)", href: "/academies/cloud" },
    { name: "AI Engineering", href: "/academies/ai" },
    { name: "Data Analytics", href: "/academies/data" },
    { name: "Healthcare Coding", href: "/academies/healthcare" },
    { name: "Cybersecurity", href: "/academies/security" },
  ]},
  { title: "Platform", links: [
    { name: "Labs", href: "/labs" },
    { name: "Projects", href: "/projects" },
    { name: "Roadmaps", href: "/roadmaps" },
    { name: "Certifications", href: "/certifications" },
    { name: "Interview Hub", href: "/interview" },
    { name: "Troubleshooting", href: "/troubleshooting" },
  ]},
  { title: "Resources", links: [
    { name: "AI Assistant", href: "/ai-assistant" },
    { name: "Community Hub", href: "/community" },
    { name: "Career Hub", href: "/career" },
  ]},
];

export default function Footer() {
  return (
    <footer style={{ background: "var(--bg)", borderTop: "1px solid var(--border)" }}>
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "64px 24px 40px" }}>
        <div style={{ display: "grid", gridTemplateColumns: "2fr 1fr 1fr 1fr", gap: "48px", marginBottom: "56px" }}>
          {/* Brand */}
          <div>
            <Link href="/" style={{ display: "flex", alignItems: "center", gap: "10px", textDecoration: "none", marginBottom: "20px" }}>
              <div style={{ width: "32px", height: "32px", borderRadius: "8px", background: "linear-gradient(135deg, #2563EB, #7C3AED)", display: "flex", alignItems: "center", justifyContent: "center" }}>
                <Zap size={16} color="#fff" />
              </div>
              <span style={{ fontFamily: "'Syne', sans-serif", fontSize: "17px", fontWeight: 800, color: "var(--text-1)" }}>SynfraCore</span>
            </Link>
            <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.7, maxWidth: "280px", marginBottom: "20px" }}>
              The world&apos;s most comprehensive technology learning ecosystem. Built for practitioners, by practitioners.
            </p>
            <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
              {["DevOps", "Cloud", "AI", "Data", "Security"].map((t) => (
                <span key={t} style={{ background: "rgba(255,255,255,0.04)", border: "1px solid var(--border)", color: "var(--text-4)", padding: "3px 10px", borderRadius: "6px", fontSize: "11px", fontWeight: 500 }}>{t}</span>
              ))}
            </div>
          </div>

          {/* Link columns */}
          {cols.map((col) => (
            <div key={col.title}>
              <div style={{ fontSize: "11px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "18px" }}>{col.title}</div>
              <ul style={{ listStyle: "none", padding: 0, display: "flex", flexDirection: "column", gap: "10px" }}>
                {col.links.map((l) => (
                  <li key={l.name}>
                    <Link href={l.href} style={{ color: "var(--text-3)", fontSize: "13px", textDecoration: "none", transition: "color 0.15s" }}
                      
                      >
                      {l.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Bottom */}
        <div style={{ borderTop: "1px solid var(--border)", paddingTop: "28px", display: "flex", justifyContent: "space-between", alignItems: "center", flexWrap: "wrap", gap: "16px" }}>
          <p style={{ color: "var(--text-4)", fontSize: "13px" }}>© 2026 SynfraCore. Built for the community. Education should be free.</p>
          <p style={{ color: "var(--text-4)", fontSize: "12px", letterSpacing: "0.06em" }}>
            LEARN → PRACTICE → BUILD → GET HIRED
          </p>
        </div>
      </div>
    </footer>
  );
}
