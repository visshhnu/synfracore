"use client";
import Link from "next/link";
import { useState, useRef } from "react";
import { Menu, X, Zap, ChevronDown } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";

const simpleNav = [
  { name: "Roadmaps", href: "/roadmaps" },
  { name: "Labs", href: "/labs" },
  { name: "Certifications", href: "/certifications" },
  { name: "Interview", href: "/interview" },
  { name: "Troubleshooting", href: "/troubleshooting" },
  { name: "AI Assistant", href: "/ai-assistant" },
  { name: "Career", href: "/career" },
];

const academyColors: Record<string, string> = {
  infrastructure: "#3B82F6",
  cloud: "#F59E0B",
  ai: "#8B5CF6",
  data: "#10B981",
  healthcare: "#EF4444",
  security: "#6366F1",
};

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [dropOpen, setDropOpen] = useState(false);
  const dropRef = useRef<HTMLDivElement>(null);
  let closeTimer: ReturnType<typeof setTimeout>;

  const openDrop = () => { clearTimeout(closeTimer); setDropOpen(true); };
  const closeDrop = () => { closeTimer = setTimeout(() => setDropOpen(false), 150); };

  return (
    <header style={{
      position: "sticky", top: 0, zIndex: 200,
      background: "rgba(4,8,15,0.92)",
      backdropFilter: "blur(20px)", WebkitBackdropFilter: "blur(20px)",
      borderBottom: "1px solid var(--border)",
    }}>
      <div style={{ maxWidth: "1240px", margin: "0 auto", padding: "0 24px", height: "62px", display: "flex", alignItems: "center", justifyContent: "space-between", gap: "16px" }}>

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
        <nav className="hide-mobile" style={{ display: "flex", alignItems: "center", gap: "1px" }}>

          {/* Academies dropdown */}
          <div ref={dropRef} style={{ position: "relative" }} onMouseEnter={openDrop} onMouseLeave={closeDrop}>
            <button style={{
              display: "flex", alignItems: "center", gap: "4px",
              color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
              padding: "6px 11px", borderRadius: "8px",
              background: "none", border: "none", cursor: "pointer",
              transition: "color 0.15s",
            }}
              onMouseEnter={e => (e.currentTarget.style.color = "var(--text-1)")}
              onMouseLeave={e => (e.currentTarget.style.color = "var(--text-3)")}
            >
              Academies <ChevronDown size={13} style={{ transition: "transform 0.2s", transform: dropOpen ? "rotate(180deg)" : "rotate(0deg)" }} />
            </button>

            {/* Mega dropdown */}
            {dropOpen && (
              <div style={{
                position: "absolute", top: "100%", left: "50%", transform: "translateX(-50%)",
                marginTop: "8px", width: "720px",
                background: "var(--bg-1)", border: "1px solid var(--border)",
                borderRadius: "16px", boxShadow: "0 24px 64px rgba(0,0,0,0.4)",
                padding: "20px", zIndex: 300,
                display: "grid", gridTemplateColumns: "1fr 1fr 1fr", gap: "8px",
              }}>
                {academies.map(academy => (
                  <Link key={academy.slug} href={`/academies/${academy.slug}`}
                    style={{ textDecoration: "none", padding: "12px 14px", borderRadius: "10px", border: "1px solid transparent", transition: "all 0.15s", display: "block" }}
                    onMouseEnter={e => { (e.currentTarget as HTMLElement).style.background = `${academy.color}0D`; (e.currentTarget as HTMLElement).style.borderColor = `${academy.color}30`; }}
                    onMouseLeave={e => { (e.currentTarget as HTMLElement).style.background = "transparent"; (e.currentTarget as HTMLElement).style.borderColor = "transparent"; }}
                  >
                    <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "6px" }}>
                      <span style={{ fontSize: "20px" }}>{academy.icon}</span>
                      <span style={{ fontFamily: "'Syne', sans-serif", fontSize: "13px", fontWeight: 700, color: "var(--text-1)" }}>{academy.title}</span>
                    </div>
                    <div style={{ display: "flex", flexWrap: "wrap", gap: "4px", paddingLeft: "30px" }}>
                      {academy.technologies.slice(0, 4).map(t => (
                        <span key={t.slug} style={{
                          fontSize: "10px", fontWeight: 600, padding: "1px 6px",
                          borderRadius: "4px", background: `${academy.color}12`,
                          color: academy.color,
                        }}>{t.name}</span>
                      ))}
                      {academy.technologies.length > 4 && (
                        <span style={{ fontSize: "10px", color: "var(--text-4)", padding: "1px 4px" }}>+{academy.technologies.length - 4}</span>
                      )}
                    </div>
                  </Link>
                ))}

                {/* Bottom bar */}
                <div style={{ gridColumn: "1 / -1", borderTop: "1px solid var(--border)", paddingTop: "12px", marginTop: "4px", display: "flex", gap: "8px", justifyContent: "center" }}>
                  <Link href="/academies" style={{
                    fontSize: "12px", fontWeight: 600, color: "#3B82F6",
                    textDecoration: "none", padding: "6px 16px",
                    background: "rgba(59,130,246,0.08)", borderRadius: "8px",
                    border: "1px solid rgba(59,130,246,0.2)",
                  }}>
                    View All Academies →
                  </Link>
                  <Link href="/roadmaps" style={{
                    fontSize: "12px", fontWeight: 600, color: "var(--text-3)",
                    textDecoration: "none", padding: "6px 16px",
                    background: "var(--bg-2)", borderRadius: "8px",
                    border: "1px solid var(--border)",
                  }}>
                    Learning Roadmaps
                  </Link>
                </div>
              </div>
            )}
          </div>

          {/* Simple nav items */}
          {simpleNav.map(item => (
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
          <button onClick={() => setMobileOpen(!mobileOpen)} className="show-mobile"
            style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", display: "flex", padding: "4px" }}>
            {mobileOpen ? <X size={22} /> : <Menu size={22} />}
          </button>
        </div>
      </div>

      {/* Mobile menu */}
      {mobileOpen && (
        <div style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", padding: "12px 24px 24px", maxHeight: "80vh", overflowY: "auto" }}>
          <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "8px", marginTop: "4px" }}>Academies</p>
          {academies.map(a => (
            <Link key={a.slug} href={`/academies/${a.slug}`} onClick={() => setMobileOpen(false)}
              style={{ display: "flex", alignItems: "center", gap: "10px", color: "var(--text-2)", fontSize: "14px", fontWeight: 600, padding: "10px 0", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              <span style={{ fontSize: "18px" }}>{a.icon}</span> {a.title}
            </Link>
          ))}
          <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "16px 0 8px" }}>Platform</p>
          {simpleNav.map(item => (
            <Link key={item.name} href={item.href} onClick={() => setMobileOpen(false)}
              style={{ display: "block", color: "var(--text-3)", fontSize: "14px", fontWeight: 500, padding: "10px 0", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              {item.name}
            </Link>
          ))}
          <Link href="/academies" onClick={() => setMobileOpen(false)} className="btn-primary"
            style={{ marginTop: "16px", width: "100%", justifyContent: "center", display: "flex" }}>
            Start Learning Free
          </Link>
        </div>
      )}

      <style>{`
        @media (min-width: 1025px) { .show-mobile { display: none !important; } }
        @media (max-width: 1024px) { .hide-mobile { display: none !important; } .show-mobile { display: flex !important; } }
      `}</style>
    </header>
  );
}
