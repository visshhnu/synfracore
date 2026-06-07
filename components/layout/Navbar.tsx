"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, X, ChevronDown } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";
import Image from "next/image";

// Mini AC logo mark — shown when scrolled
function MiniLogo() {
  return (
    <svg width="36" height="36" viewBox="0 0 36 36" fill="none">
      <defs>
        <linearGradient id="mlag" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#60A5FA"/>
          <stop offset="100%" stopColor="#2563EB"/>
        </linearGradient>
        <linearGradient id="mlog" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#06B6D4"/>
          <stop offset="100%" stopColor="#2563EB"/>
        </linearGradient>
      </defs>
      {/* A triangle */}
      <g transform="translate(8,18)">
        <polygon points="0,-12 9,6 -9,6" fill="none" stroke="url(#mlag)" strokeWidth="2" strokeLinejoin="round"/>
        <rect x="-4" y="0" width="8" height="2.5" rx="1" fill="url(#mlag)"/>
        <rect x="-3" y="3.5" width="6" height="2.5" rx="1" fill="url(#mlag)" opacity="0.5"/>
        <circle cx="0" cy="-12" r="1.8" fill="#60A5FA"/>
        <circle cx="-9" cy="6" r="1.3" fill="#7C3AED"/>
        <circle cx="9" cy="6" r="1.3" fill="#06B6D4"/>
      </g>
      {/* C circle/ring */}
      <g transform="translate(26,18)">
        <path d="M 7,-10 A 11,11 0 1,0 10,5" fill="none" stroke="url(#mlog)" strokeWidth="2.5" strokeLinecap="round"/>
        <g transform="translate(10,5) rotate(48)">
          <polygon points="0,-2.5 2,2.5 -2,2.5" fill="#06B6D4"/>
        </g>
        <circle cx="0" cy="0" r="1.8" fill="url(#mlog)"/>
      </g>
    </svg>
  );
}

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

        {/* Logo — full on top, mini AC on scroll */}
        <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0, display: "flex", alignItems: "center" }}>
          {scrolled ? (
            <MiniLogo />
          ) : (
            <Image
              src="/logo.png"
              alt="SynfraCore"
              width={169}
              height={38}
              priority
              style={{ height: "30px", width: "auto", objectFit: "contain" }}
            />
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

        {/* Right */}
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
        <div style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", maxHeight: "80vh", overflowY: "auto" }}>
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
          <div style={{ padding: "12px 16px", borderTop: "1px solid var(--border)", display: "flex", flexDirection: "column", gap: "8px" }}>
            {[
              { name: "Roadmaps", href: "/roadmaps" },
              { name: "Labs", href: "/labs" },
              { name: "Certifications", href: "/certifications" },
              { name: "Interview", href: "/interview" },
              { name: "AI Assistant", href: "/ai-assistant" },
              { name: "Career", href: "/career" },
            ].map(item => (
              <Link key={item.name} href={item.href} onClick={() => setMobileOpen(false)}
                style={{ display: "block", color: "var(--text-3)", fontSize: "14px", fontWeight: 500, padding: "8px 0", textDecoration: "none" }}>
                {item.name}
              </Link>
            ))}
            <Link href="/academies" onClick={() => setMobileOpen(false)} className="btn-primary"
              style={{ marginTop: "8px", justifyContent: "center", display: "flex", width: "100%" }}>
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
