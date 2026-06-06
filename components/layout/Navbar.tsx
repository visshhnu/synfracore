"use client";
import Link from "next/link";
import { useState } from "react";
import { Menu, X, Zap } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";

const navItems = [
  { name: "Academies", href: "/academies" },
  { name: "Roadmaps", href: "/roadmaps" },
  { name: "Labs", href: "/labs" },
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
      backdropFilter: "blur(20px)", WebkitBackdropFilter: "blur(20px)",
      borderBottom: "1px solid var(--border)",
    }}>
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "0 24px", height: "62px", display: "flex", alignItems: "center", justifyContent: "space-between", gap: "16px" }}>

        {/* Logo */}
        <Link href="/" style={{ display: "flex", alignItems: "center", gap: "9px", textDecoration: "none", flexShrink: 0 }}>
          <div style={{ width: "33px", height: "33px", borderRadius: "9px", background: "linear-gradient(135deg, #2563EB, #7C3AED)", display: "flex", alignItems: "center", justifyContent: "center" }}>
            <Zap size={16} color="#fff" />
          </div>
          <span style={{ fontFamily: "'Syne', sans-serif", fontSize: "17px", fontWeight: 800, color: "var(--text-1)", letterSpacing: "-0.02em" }}>
            SynfraCore
          </span>
        </Link>

        {/* Desktop nav */}
        <nav className="hide-mobile" style={{ display: "flex", alignItems: "center", gap: "2px", flex: 1, justifyContent: "center" }}>
          {navItems.map((item) => (
            <Link key={item.name} href={item.href} style={{
              color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
              padding: "6px 11px", borderRadius: "8px", textDecoration: "none",
              whiteSpace: "nowrap", transition: "color 0.15s, background 0.15s",
            }}
              onMouseEnter={e => { (e.target as HTMLElement).style.color = "var(--text-1)"; (e.target as HTMLElement).style.background = "var(--bg-2)"; }}
              onMouseLeave={e => { (e.target as HTMLElement).style.color = "var(--text-3)"; (e.target as HTMLElement).style.background = "transparent"; }}
            >
              {item.name}
            </Link>
          ))}
        </nav>

        {/* Right side */}
        <div style={{ display: "flex", alignItems: "center", gap: "8px", flexShrink: 0 }}>
          <ThemeToggle />
          <Link href="/academies" className="btn-primary hide-mobile" style={{ padding: "8px 18px", fontSize: "13px", borderRadius: "8px" }}>
            Start Learning
          </Link>
          <button onClick={() => setOpen(!open)} className="show-mobile"
            style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", display: "flex", padding: "4px" }}>
            {open ? <X size={22} /> : <Menu size={22} />}
          </button>
        </div>
      </div>

      {/* Mobile menu */}
      {open && (
        <div style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", padding: "12px 24px 20px" }}>
          {navItems.map((item) => (
            <Link key={item.name} href={item.href} onClick={() => setOpen(false)}
              style={{ display: "block", color: "var(--text-3)", fontSize: "15px", fontWeight: 500, padding: "11px 0", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              {item.name}
            </Link>
          ))}
          <Link href="/academies" onClick={() => setOpen(false)} className="btn-primary"
            style={{ marginTop: "16px", width: "100%", justifyContent: "center", display: "flex" }}>
            Start Learning Free
          </Link>
        </div>
      )}
    </header>
  );
}
