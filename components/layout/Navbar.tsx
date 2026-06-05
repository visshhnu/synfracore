"use client";
import Link from "next/link";
import { useState } from "react";
import { Menu, X, Zap, ChevronDown } from "lucide-react";

const navItems = [
  { name: "Academies", href: "/academies" },
  { name: "Roadmaps", href: "/roadmaps" },
  { name: "Labs", href: "/labs" },
  { name: "Projects", href: "/projects" },
  { name: "Certifications", href: "/certifications" },
  { name: "Interview", href: "/interview" },
  { name: "Troubleshooting", href: "/troubleshooting" },
  { name: "AI Assistant", href: "/ai-assistant" },
  { name: "Career", href: "/career" },
];

export default function Navbar() {
  const [open, setOpen] = useState(false);
  return (
    <header style={{
      position: "sticky", top: 0, zIndex: 200,
      background: "rgba(4,8,15,0.88)",
      backdropFilter: "blur(24px)", WebkitBackdropFilter: "blur(24px)",
      borderBottom: "1px solid #0F1E30",
    }}>
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "0 24px", height: "64px", display: "flex", alignItems: "center", justifyContent: "space-between" }}>
        {/* Logo */}
        <Link href="/" style={{ display: "flex", alignItems: "center", gap: "10px", textDecoration: "none" }}>
          <div style={{ width: "34px", height: "34px", borderRadius: "9px", background: "linear-gradient(135deg, #2563EB, #7C3AED)", display: "flex", alignItems: "center", justifyContent: "center" }}>
            <Zap size={17} color="#fff" />
          </div>
          <span style={{ fontFamily: "'Syne', sans-serif", fontSize: "18px", fontWeight: 800, color: "#E2E8F4", letterSpacing: "-0.02em" }}>
            SynfraCore
          </span>
        </Link>

        {/* Desktop nav */}
        <nav style={{ display: "flex", alignItems: "center", gap: "2px" }} className="hide-mobile">
          {navItems.map((item) => (
            <Link key={item.name} href={item.href} style={{
              color: "#94A3BF", fontSize: "13px", fontWeight: 500,
              padding: "6px 12px", borderRadius: "8px", textDecoration: "none",
              transition: "color 0.15s, background 0.15s",
              whiteSpace: "nowrap",
            }}
              onMouseEnter={e => { (e.target as HTMLElement).style.color = "#E2E8F4"; (e.target as HTMLElement).style.background = "rgba(255,255,255,0.05)"; }}
              onMouseLeave={e => { (e.target as HTMLElement).style.color = "#94A3BF"; (e.target as HTMLElement).style.background = "transparent"; }}
            >
              {item.name}
            </Link>
          ))}
        </nav>

        {/* CTA */}
        <div style={{ display: "flex", alignItems: "center", gap: "12px" }}>
          <Link href="/academies" className="btn-primary hide-mobile" style={{ padding: "8px 20px", fontSize: "13px", borderRadius: "8px" }}>
            Start Learning
          </Link>
          <button onClick={() => setOpen(!open)} style={{ background: "none", border: "none", cursor: "pointer", color: "#94A3BF", display: "flex", padding: "4px" }}
            className="show-mobile"
            aria-label="Menu">
            {open ? <X size={22} /> : <Menu size={22} />}
          </button>
        </div>
      </div>

      {/* Mobile menu */}
      {open && (
        <div style={{ background: "#080D18", borderTop: "1px solid #0F1E30", padding: "16px 24px 24px" }}>
          {navItems.map((item) => (
            <Link key={item.name} href={item.href} onClick={() => setOpen(false)} style={{
              display: "block", color: "#94A3BF", fontSize: "15px", fontWeight: 500,
              padding: "12px 0", borderBottom: "1px solid #0F1E30", textDecoration: "none",
            }}>
              {item.name}
            </Link>
          ))}
          <Link href="/academies" onClick={() => setOpen(false)} className="btn-primary" style={{ marginTop: "20px", width: "100%", justifyContent: "center" }}>
            Start Learning Free
          </Link>
        </div>
      )}

      <style>{`
        @media (min-width: 769px) { .show-mobile { display: none !important; } }
        @media (max-width: 768px) { .hide-mobile { display: none !important; } .show-mobile { display: flex !important; } }
      `}</style>
    </header>
  );
}
