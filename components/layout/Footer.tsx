import Link from "next/link";
import { Zap } from "lucide-react";
import { navigation } from "@/lib/data/navigation";

const footerLinks = {
  Academies: [
    { name: "Infrastructure", href: "/academies/infrastructure" },
    { name: "Cloud", href: "/academies/cloud" },
    { name: "AI Engineering", href: "/academies/ai" },
    { name: "Data Analytics", href: "/academies/data" },
    { name: "Healthcare", href: "/academies/healthcare" },
    { name: "Cybersecurity", href: "/academies/security" },
  ],
  Platform: [
    { name: "Labs", href: "/labs" },
    { name: "Projects", href: "/projects" },
    { name: "Roadmaps", href: "/roadmaps" },
    { name: "Certifications", href: "/certifications" },
    { name: "Interview Hub", href: "/interview" },
    { name: "Troubleshooting", href: "/troubleshooting" },
  ],
  Community: [
    { name: "Community Hub", href: "/community" },
    { name: "Career Hub", href: "/career" },
    { name: "Discussions", href: "/community" },
    { name: "Mentorship", href: "/community" },
  ],
};

export default function Footer() {
  return (
    <footer style={{ background: "#0C1524", borderTop: "1px solid #1E2D47" }}>
      <div className="mx-auto max-w-7xl px-6 py-16">
        <div className="grid gap-12 lg:grid-cols-5">
          {/* Brand */}
          <div className="lg:col-span-2">
            <Link href="/" className="flex items-center gap-2 mb-4">
              <div
                style={{
                  background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
                  borderRadius: "10px",
                  padding: "6px",
                  display: "inline-flex",
                }}
              >
                <Zap size={18} style={{ color: "#fff" }} />
              </div>
              <span
                style={{
                  fontFamily: "'Syne', sans-serif",
                  fontSize: "20px",
                  fontWeight: 700,
                  background: "linear-gradient(135deg, #60A5FA, #A78BFA)",
                  WebkitBackgroundClip: "text",
                  WebkitTextFillColor: "transparent",
                  backgroundClip: "text",
                }}
              >
                SynfraCore
              </span>
            </Link>
            <p style={{ color: "#6B7A99", fontSize: "14px", lineHeight: "1.7", maxWidth: "300px" }}>
              The world&apos;s most comprehensive technology learning ecosystem. Learn → Practice → Build → Troubleshoot → Get Certified → Get Hired.
            </p>
            <div className="mt-6 flex gap-3 flex-wrap">
              {["DevOps", "Cloud", "AI", "Data", "Security"].map((tag) => (
                <span key={tag} className="tag">{tag}</span>
              ))}
            </div>
          </div>

          {/* Links */}
          {Object.entries(footerLinks).map(([group, links]) => (
            <div key={group}>
              <h4
                style={{
                  color: "#E8EDF5",
                  fontSize: "13px",
                  fontWeight: 600,
                  letterSpacing: "0.1em",
                  textTransform: "uppercase",
                  marginBottom: "16px",
                }}
              >
                {group}
              </h4>
              <ul style={{ listStyle: "none", padding: 0, margin: 0 }}>
                {links.map((link) => (
                  <li key={link.name} style={{ marginBottom: "8px" }}>
                    <Link
                      href={link.href}
                      style={{
                        color: "#6B7A99",
                        fontSize: "14px",
                        textDecoration: "none",
                        transition: "color 0.2s",
                      }}
                      className="hover:text-blue-400"
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        <div
          style={{
            borderTop: "1px solid #1E2D47",
            marginTop: "48px",
            paddingTop: "24px",
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            flexWrap: "wrap",
            gap: "16px",
          }}
        >
          <p style={{ color: "#6B7A99", fontSize: "13px" }}>
            © 2026 SynfraCore. All rights reserved.
          </p>
          <p style={{ color: "#6B7A99", fontSize: "13px" }}>
            Learn → Practice → Build → Get Hired
          </p>
        </div>
      </div>
    </footer>
  );
}
