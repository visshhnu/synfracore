"use client";
import Link from "next/link";
import { useState, useRef } from "react";
import { Menu, X, ChevronDown } from "lucide-react";
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

function LogoMark({ size = 32 }: { size?: number }) {
  const s = size / 32;
  return (
    <svg width={size} height={size} viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <linearGradient id="lmag" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#60A5FA"/>
          <stop offset="100%" stopColor="#2563EB"/>
        </linearGradient>
        <linearGradient id="lmog" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#06B6D4"/>
          <stop offset="100%" stopColor="#2563EB"/>
        </linearGradient>
      </defs>
      {/* A — infrastructure triangle, left half */}
      <g transform="translate(8,16)">
        <polygon points="0,-11 8,6 -8,6" fill="none" stroke="url(#lmag)" strokeWidth="1.8" strokeLinejoin="round"/>
        <rect x="-4" y="0" width="8" height="2.2" rx="0.8" fill="url(#lmag)"/>
        <rect x="-3" y="3.2" width="6" height="2.2" rx="0.8" fill="url(#lmag)" opacity="0.5"/>
        <circle cx="0" cy="-11" r="1.6" fill="#60A5FA"/>
        <circle cx="-8" cy="6" r="1.2" fill="#7C3AED"/>
        <circle cx="8" cy="6" r="1.2" fill="#06B6D4"/>
      </g>
      {/* O — sync ring, right half */}
      <g transform="translate(23,16)">
        <path d="M 6,-9 A 10,10 0 1,0 9,5" fill="none" stroke="url(#lmog)" strokeWidth="2.5" strokeLinecap="round"/>
        <g transform="translate(9,5) rotate(48)">
          <polygon points="0,-2.8 2.2,2.8 -2.2,2.8" fill="#06B6D4"/>
        </g>
        <circle cx="0" cy="0" r="1.8" fill="url(#lmog)"/>
      </g>
    </svg>
  );
}

function FullLogo() {
  return (
    <svg width="200" height="36" viewBox="0 0 200 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <linearGradient id="flag" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#60A5FA"/>
          <stop offset="100%" stopColor="#2563EB"/>
        </linearGradient>
        <linearGradient id="flog" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#06B6D4"/>
          <stop offset="100%" stopColor="#2563EB"/>
        </linearGradient>
      </defs>

      {/* A mark */}
      <g transform="translate(12,18)">
        <polygon points="0,-12 9,7 -9,7" fill="none" stroke="url(#flag)" strokeWidth="1.8" strokeLinejoin="round"/>
        <rect x="-4" y="0" width="8" height="2.2" rx="0.8" fill="url(#flag)"/>
        <rect x="-3" y="3.5" width="6" height="2.2" rx="0.8" fill="url(#flag)" opacity="0.5"/>
        <circle cx="0" cy="-12" r="1.8" fill="#60A5FA"/>
        <circle cx="-9" cy="7" r="1.3" fill="#7C3AED"/>
        <circle cx="9" cy="7" r="1.3" fill="#06B6D4"/>
      </g>

      {/* Synfr text */}
      <text x="26" y="24" fontSize="22" fontWeight="800" letterSpacing="-0.5"
        fontFamily="'Syne','Inter',system-ui,sans-serif" fill="white">Synfr</text>

      {/* O mark — positioned where O sits in "Core" */}
      <g transform="translate(108,18)">
        <path d="M 9,-12 A 14,14 0 1,0 13,7" fill="none" stroke="url(#flog)" strokeWidth="3" strokeLinecap="round"/>
        <g transform="translate(13,7) rotate(48)">
          <polygon points="0,-3.2 2.8,3.2 -2.8,3.2" fill="#06B6D4"/>
        </g>
        <circle cx="0" cy="0" r="2.2" fill="url(#flog)"/>
      </g>

      {/* re text */}
      <text x="126" y="24" fontSize="22" fontWeight="800" letterSpacing="-0.5"
        fontFamily="'Syne','Inter',system-ui,sans-serif" fill="white">re</text>
    </svg>
  );
}

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [dropOpen, setDropOpen] = useState(false);
  let closeTimer: ReturnType<typeof setTimeout>;

  const openDrop = () => { clearTimeout(closeTimer); setDropOpen(true); };
  const closeDrop = () => { closeTimer = setTimeout(() => setDropOpen(false), 180); };

  return (
    <header style={{
      position: "sticky", top: 0, zIndex: 200,
      background: "rgba(4,8,15,0.93)",
      backdropFilter: "blur(20px)", WebkitBackdropFilter: "blur(20px)",
      borderBottom: "1px solid var(--border)",
    }}>
      <div style={{ maxWidth: "1240px", margin: "0 auto", padding: "0 24px", height: "62px", display: "flex", alignItems: "center", justifyContent: "space-between", gap: "16px" }}>

        {/* Full logo */}
        <Link href="/" style={{ display: "flex", alignItems: "center", textDecoration: "none", flexShrink: 0 }}>
          <FullLogo />
        </Link>

        {/* Desktop nav */}
        <nav className="hide-mobile" style={{ display: "flex", alignItems: "center", gap: "1px" }}>

          {/* Academies mega dropdown */}
          <div style={{ position: "relative" }} onMouseEnter={openDrop} onMouseLeave={closeDrop}>
            <button style={{
              display: "flex", alignItems: "center", gap: "4px",
              color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
              padding: "6px 11px", borderRadius: "8px",
              background: "none", border: "none", cursor: "pointer",
            }}>
              Academies
              <ChevronDown size={13} style={{ transition: "transform 0.2s", transform: dropOpen ? "rotate(180deg)" : "rotate(0)" }} />
            </button>

            {dropOpen && (
              <div style={{
                position: "absolute", top: "calc(100% + 8px)", left: "50%",
                transform: "translateX(-50%)", width: "680px",
                background: "var(--bg-1)", border: "1px solid var(--border)",
                borderRadius: "16px", boxShadow: "0 24px 64px rgba(0,0,0,0.5)",
                padding: "16px", zIndex: 300,
                display: "grid", gridTemplateColumns: "1fr 1fr 1fr", gap: "6px",
              }}>
                {academies.map(a => (
                  <Link key={a.slug} href={`/academies/${a.slug}`}
                    style={{ textDecoration: "none", padding: "11px 13px", borderRadius: "10px", border: "1px solid transparent", transition: "all 0.15s", display: "block" }}
                    onMouseEnter={e => { (e.currentTarget).style.background = `${a.color}0D`; (e.currentTarget).style.borderColor = `${a.color}28`; }}
                    onMouseLeave={e => { (e.currentTarget).style.background = "transparent"; (e.currentTarget).style.borderColor = "transparent"; }}
                  >
                    <div style={{ display: "flex", alignItems: "center", gap: "9px", marginBottom: "5px" }}>
                      <span style={{ fontSize: "18px" }}>{a.icon}</span>
                      <span style={{ fontFamily: "'Syne',sans-serif", fontSize: "13px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</span>
                    </div>
                    <div style={{ display: "flex", flexWrap: "wrap", gap: "3px", paddingLeft: "27px" }}>
                      {a.technologies.slice(0, 4).map(t => (
                        <span key={t.slug} style={{ fontSize: "10px", fontWeight: 600, padding: "1px 6px", borderRadius: "4px", background: `${a.color}12`, color: a.color }}>{t.name}</span>
                      ))}
                      {a.technologies.length > 4 && <span style={{ fontSize: "10px", color: "var(--text-4)", padding: "1px" }}>+{a.technologies.length - 4}</span>}
                    </div>
                  </Link>
                ))}
                <div style={{ gridColumn: "1/-1", borderTop: "1px solid var(--border)", paddingTop: "10px", marginTop: "2px", display: "flex", gap: "8px", justifyContent: "center" }}>
                  <Link href="/academies" style={{ fontSize: "12px", fontWeight: 600, color: "#3B82F6", textDecoration: "none", padding: "6px 18px", background: "rgba(59,130,246,0.08)", borderRadius: "8px", border: "1px solid rgba(59,130,246,0.18)" }}>
                    View All Academies →
                  </Link>
                  <Link href="/roadmaps" style={{ fontSize: "12px", fontWeight: 600, color: "var(--text-3)", textDecoration: "none", padding: "6px 18px", background: "var(--bg-2)", borderRadius: "8px", border: "1px solid var(--border)" }}>
                    Learning Roadmaps
                  </Link>
                </div>
              </div>
            )}
          </div>

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
          <div style={{ display: "flex", alignItems: "center", gap: "12px", padding: "12px 0", borderBottom: "1px solid var(--border)", marginBottom: "8px" }}>
            <LogoMark size={28} />
            <span style={{ fontFamily: "'Syne',sans-serif", fontSize: "15px", fontWeight: 800, color: "var(--text-1)" }}>SynfraCore</span>
          </div>
          <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "12px 0 8px" }}>Academies</p>
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
