"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, X, ChevronDown } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";
import Image from "next/image";

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [dropOpen, setDropOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  let closeTimer: ReturnType<typeof setTimeout>;

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 60);
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  const openDrop = () => { clearTimeout(closeTimer); setDropOpen(true); };
  const closeDrop = () => { closeTimer = setTimeout(() => setDropOpen(false), 180); };

  return (
    <header style={{
      position: "sticky", top: 0, zIndex: 200,
      background: "var(--bg-1)",
      backdropFilter: "blur(20px)", WebkitBackdropFilter: "blur(20px)",
      borderBottom: "1px solid var(--border)",
      transition: "all 0.2s",
    }}>
      <div style={{
        maxWidth: "1200px", margin: "0 auto",
        padding: "0 16px",
        height: scrolled ? "52px" : "62px",
        display: "flex", alignItems: "center",
        justifyContent: "space-between", gap: "12px",
        transition: "height 0.2s",
      }}>

        {/* Logo: mini AC on scroll, full wordmark at top */}
        <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0, display: "flex", alignItems: "center" }}>
          {scrolled ? (
            <div className="logo-pill" style={{ display: "flex", alignItems: "center" }}>
              <Image src="/logo-ac-mini.png" alt="AC" width={51} height={32}
                style={{ height: "28px", width: "auto" }} priority />
            </div>
          ) : (
            <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
              <div className="logo-pill" style={{ display: "flex", alignItems: "center" }}>
                <Image src="/logo-ac-nav.png" alt="AC" width={64} height={40}
                  style={{ height: "34px", width: "auto" }} priority />
              </div>
              <span style={{ fontFamily: "'Syne',sans-serif", fontSize: "18px", fontWeight: 800, color: "var(--text-1)", letterSpacing: "-0.02em" }}>
                SynfraCore
              </span>
            </div>
          )}
        </Link>

        {/* Desktop nav */}
        <nav className="hide-mobile" style={{ display: "flex", alignItems: "center", gap: "1px", flex: 1, justifyContent: "center" }}>
          {/* Academies dropdown */}
          <div style={{ position: "relative" }} onMouseEnter={openDrop} onMouseLeave={closeDrop}>
            <button style={{
              display: "flex", alignItems: "center", gap: "4px",
              color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
              padding: "6px 11px", borderRadius: "8px",
              background: "none", border: "none", cursor: "pointer", fontFamily: "inherit",
            }}>
              Academies
              <ChevronDown size={12} style={{ transition: "transform 0.2s", transform: dropOpen ? "rotate(180deg)" : "rotate(0)" }} />
            </button>

            {dropOpen && (
              <div style={{
                position: "absolute", top: "calc(100% + 8px)", left: "50%",
                transform: "translateX(-50%)", width: "720px",
                background: "var(--bg-2)", border: "1px solid var(--border)",
                borderRadius: "16px",
                boxShadow: "0 24px 64px rgba(0,0,0,0.3)",
                padding: "16px", zIndex: 300,
                display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr", gap: "6px",
              }}>
                {academies.map(a => (
                  <Link key={a.slug} href={`/academies/${a.slug}`}
                    onClick={() => setDropOpen(false)}
                    style={{ textDecoration: "none", padding: "10px 12px", borderRadius: "10px", border: "1px solid transparent", transition: "all 0.15s", display: "block" }}
                    onMouseEnter={e => { e.currentTarget.style.background = `${a.color}10`; e.currentTarget.style.borderColor = `${a.color}28`; }}
                    onMouseLeave={e => { e.currentTarget.style.background = "transparent"; e.currentTarget.style.borderColor = "transparent"; }}
                  >
                    <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "4px" }}>
                      <span style={{ fontSize: "16px" }}>{a.icon}</span>
                      <span style={{ fontFamily: "'Syne',sans-serif", fontSize: "12px", fontWeight: 700, color: "var(--text-1)", lineHeight: 1.2 }}>{a.title}</span>
                    </div>
                    <div style={{ display: "flex", flexWrap: "wrap", gap: "3px", paddingLeft: "24px" }}>
                      {a.domains.slice(0, 2).map(d => (
                        <span key={d.slug} style={{ fontSize: "10px", fontWeight: 500, padding: "1px 5px", borderRadius: "4px", background: `${a.color}12`, color: a.color }}>{d.name}</span>
                      ))}
                      {a.domains.length > 2 && <span style={{ fontSize: "10px", color: "var(--text-4)" }}>+{a.domains.length - 2}</span>}
                    </div>
                  </Link>
                ))}
                <div style={{ gridColumn: "1/-1", borderTop: "1px solid var(--border)", paddingTop: "10px", marginTop: "2px", display: "flex", gap: "8px", justifyContent: "center" }}>
                  <Link href="/academies" onClick={() => setDropOpen(false)} style={{ fontSize: "12px", fontWeight: 600, color: "#3B82F6", textDecoration: "none", padding: "6px 16px", background: "rgba(59,130,246,0.08)", borderRadius: "8px", border: "1px solid rgba(59,130,246,0.18)" }}>
                    All Academies →
                  </Link>
                </div>
              </div>
            )}
          </div>

          {[
            { name: "Roadmaps", href: "/roadmaps" },
            { name: "Labs", href: "/labs" },
            { name: "Certifications", href: "/certifications" },
            { name: "Interview", href: "/interview" },
            { name: "Troubleshooting", href: "/troubleshooting" },
            { name: "AI Assistant", href: "/ai-assistant" },
            { name: "Career", href: "/career" },
          ].map(item => (
            <Link key={item.name} href={item.href} style={{
              color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
              padding: "6px 10px", borderRadius: "8px", textDecoration: "none",
              whiteSpace: "nowrap", transition: "color 0.15s, background 0.15s",
            }}
              onMouseEnter={e => { (e.target as HTMLElement).style.color = "var(--text-1)"; (e.target as HTMLElement).style.background = "var(--bg-2)"; }}
              onMouseLeave={e => { (e.target as HTMLElement).style.color = "var(--text-3)"; (e.target as HTMLElement).style.background = "transparent"; }}
            >{item.name}</Link>
          ))}
        </nav>

        {/* Right side */}
        <div style={{ display: "flex", alignItems: "center", gap: "8px", flexShrink: 0 }}>
          <ThemeToggle />
          <Link href="/academies" className="btn-primary hide-mobile"
            style={{ padding: "8px 16px", fontSize: "13px", borderRadius: "8px" }}>
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
        <div style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", maxHeight: "85vh", overflowY: "auto" }}>
          <div style={{ padding: "12px 16px 8px", borderBottom: "1px solid var(--border)" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)" }}>Academies</p>
          </div>
          {academies.map(a => (
            <Link key={a.slug} href={`/academies/${a.slug}`} onClick={() => setMobileOpen(false)}
              style={{ display: "flex", alignItems: "center", gap: "12px", padding: "12px 16px", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              <span style={{ fontSize: "20px", flexShrink: 0 }}>{a.icon}</span>
              <div>
                <div style={{ fontFamily: "'Syne',sans-serif", fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</div>
                <div style={{ fontSize: "11px", color: a.color, marginTop: "2px" }}>{a.subtitle}</div>
              </div>
            </Link>
          ))}
          <div style={{ padding: "12px 16px 20px", display: "flex", flexDirection: "column", gap: "2px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "8px", marginTop: "4px" }}>Platform</p>
            {[
              { name: "Roadmaps", href: "/roadmaps" },
              { name: "Labs", href: "/labs" },
              { name: "Certifications", href: "/certifications" },
              { name: "Interview", href: "/interview" },
              { name: "AI Assistant", href: "/ai-assistant" },
              { name: "Career", href: "/career" },
            ].map(item => (
              <Link key={item.name} href={item.href} onClick={() => setMobileOpen(false)}
                style={{ display: "block", color: "var(--text-3)", fontSize: "14px", fontWeight: 500, padding: "10px 0", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
                {item.name}
              </Link>
            ))}
            <Link href="/academies" onClick={() => setMobileOpen(false)} className="btn-primary"
              style={{ marginTop: "16px", justifyContent: "center", display: "flex", width: "100%" }}>
              Start Learning Free
            </Link>
          </div>
        </div>
      )}

      <style>{`
        @media (min-width: 1025px) { .show-mobile { display: none !important; } }
        @media (max-width: 1024px) { .hide-mobile { display: none !important; } .show-mobile { display: flex !important; } }
      `}</style>
    </header>
  );
}
