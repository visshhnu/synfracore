"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, X, ChevronDown, Search } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";
import { useTheme } from "@/components/ThemeProvider";
import Image from "next/image";

function SearchBar() {
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<{name:string;href:string;academy:string}[]>([]);

  useEffect(() => {
    if (!query.trim()) { setResults([]); return; }
    const q = query.toLowerCase();
    const matches: {name:string;href:string;academy:string}[] = [];
    for (const a of academies) {
      for (const d of a.domains) {
        for (const t of d.technologies) {
          if (t.name.toLowerCase().includes(q) || t.tags.some(tag => tag.toLowerCase().includes(q))) {
            matches.push({ name: t.name, href: `/academies/${a.slug}/${t.slug}`, academy: a.title });
          }
        }
      }
    }
    setResults(matches.slice(0, 8));
  }, [query]);

  return (
    <div style={{ position: "relative", flexShrink: 0 }}>
      <div style={{ display: "flex", alignItems: "center", gap: "8px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "6px 12px", cursor: "text", minWidth: open ? "260px" : "140px", transition: "min-width 0.2s" }}
        onClick={() => setOpen(true)}>
        <Search size={14} color="var(--text-4)" />
        <input
          value={query}
          onChange={e => setQuery(e.target.value)}
          onFocus={() => setOpen(true)}
          onBlur={() => setTimeout(() => { setOpen(false); setQuery(""); }, 200)}
          placeholder="Search topics..."
          style={{ background: "none", border: "none", outline: "none", fontSize: "13px", color: "var(--text-2)", width: "100%", fontFamily: "inherit" }}
        />
        {query && <span style={{ fontSize: "10px", color: "var(--text-4)", background: "var(--bg-1)", padding: "1px 5px", borderRadius: "4px" }}>ESC</span>}
      </div>
      {open && results.length > 0 && (
        <div style={{ position: "absolute", top: "calc(100% + 6px)", left: 0, right: 0, background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px", boxShadow: "0 16px 40px rgba(0,0,0,0.25)", zIndex: 400, overflow: "hidden" }}>
          {results.map((r, i) => (
            <Link key={i} href={r.href}
              style={{ display: "block", padding: "10px 14px", textDecoration: "none", borderBottom: i < results.length-1 ? "1px solid var(--border)" : "none" }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}>
              <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{r.name}</div>
              <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "2px" }}>{r.academy}</div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [mobileSearch, setMobileSearch] = useState(false);
  const [dropOpen, setDropOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const { theme } = useTheme();
  const isLight = theme === "light";
  let closeTimer: ReturnType<typeof setTimeout>;

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 60);
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  const openDrop = () => { clearTimeout(closeTimer); setDropOpen(true); };
  const closeDrop = () => { closeTimer = setTimeout(() => setDropOpen(false), 180); };

  // Logo: AC image with dark bg in light mode, transparent in dark mode
  const LogoImg = ({ h }: { h: number }) => (
    <div style={{
      background: isLight ? "#0F172A" : "transparent",
      borderRadius: isLight ? "8px" : "0",
      padding: isLight ? "4px 6px" : "0",
      display: "flex", alignItems: "center",
      transition: "all 0.2s",
    }}>
      <Image
        src={h <= 28 ? "/logo-ac-mini.png" : "/logo-ac-nav.png"}
        alt="SynfraCore"
        width={h <= 28 ? 51 : 64}
        height={h}
        style={{ height: `${h}px`, width: "auto" }}
        priority
      />
    </div>
  );

  return (
    <header style={{
      position: "sticky", top: 0, zIndex: 200,
      background: "var(--bg-1)",
      backdropFilter: "blur(20px)", WebkitBackdropFilter: "blur(20px)",
      borderBottom: "1px solid var(--border)",
    }}>
      <div style={{
        maxWidth: "1200px", margin: "0 auto", padding: "0 16px",
        height: scrolled ? "52px" : "64px",
        display: "flex", alignItems: "center",
        justifyContent: "space-between", gap: "10px",
        transition: "height 0.2s",
      }}>

        {/* Logo: AC only — mini on scroll */}
        <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0 }}>
          <LogoImg h={scrolled ? 26 : 34} />
        </Link>

        {/* Desktop nav */}
        <nav className="hide-mobile" style={{ display: "flex", alignItems: "center", gap: "1px", flex: 1, justifyContent: "center" }}>
          <div style={{ position: "relative" }} onMouseEnter={openDrop} onMouseLeave={closeDrop}>
            <button style={{ display: "flex", alignItems: "center", gap: "4px", color: "var(--text-3)", fontSize: "13px", fontWeight: 500, padding: "6px 11px", borderRadius: "8px", background: "none", border: "none", cursor: "pointer", fontFamily: "inherit" }}>
              Academies <ChevronDown size={12} style={{ transition: "transform 0.2s", transform: dropOpen ? "rotate(180deg)" : "none" }} />
            </button>
            {dropOpen && (
              <div style={{ position: "absolute", top: "calc(100% + 8px)", left: "50%", transform: "translateX(-50%)", width: "700px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", boxShadow: "0 24px 64px rgba(0,0,0,0.3)", padding: "16px", zIndex: 300, display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr", gap: "6px" }}>
                {academies.map(a => (
                  <Link key={a.slug} href={`/academies/${a.slug}`} onClick={() => setDropOpen(false)}
                    style={{ textDecoration: "none", padding: "10px 12px", borderRadius: "10px", border: "1px solid transparent", display: "block" }}
                    onMouseEnter={e => { e.currentTarget.style.background = `${a.color}10`; e.currentTarget.style.borderColor = `${a.color}28`; }}
                    onMouseLeave={e => { e.currentTarget.style.background = "transparent"; e.currentTarget.style.borderColor = "transparent"; }}>
                    <div style={{ display: "flex", alignItems: "center", gap: "7px", marginBottom: "4px" }}>
                      <span style={{ fontSize: "15px" }}>{a.icon}</span>
                      <span style={{ fontSize: "12px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</span>
                    </div>
                    <div style={{ paddingLeft: "22px", display: "flex", gap: "3px", flexWrap: "wrap" }}>
                      {a.domains.slice(0,2).map(d => <span key={d.slug} style={{ fontSize: "10px", padding: "1px 5px", borderRadius: "4px", background: `${a.color}12`, color: a.color }}>{d.name}</span>)}
                      {a.domains.length > 2 && <span style={{ fontSize: "10px", color: "var(--text-4)" }}>+{a.domains.length-2}</span>}
                    </div>
                  </Link>
                ))}
                <div style={{ gridColumn: "1/-1", borderTop: "1px solid var(--border)", paddingTop: "10px", marginTop: "2px", display: "flex", justifyContent: "center" }}>
                  <Link href="/academies" onClick={() => setDropOpen(false)} style={{ fontSize: "12px", fontWeight: 600, color: "#3B82F6", textDecoration: "none", padding: "6px 16px", background: "rgba(59,130,246,0.08)", borderRadius: "8px", border: "1px solid rgba(59,130,246,0.18)" }}>All Academies →</Link>
                </div>
              </div>
            )}
          </div>
          {[{n:"Roadmaps",h:"/roadmaps"},{n:"Labs",h:"/labs"},{n:"Certifications",h:"/certifications"},{n:"Interview",h:"/interview"},{n:"Troubleshooting",h:"/troubleshooting"},{n:"AI Assistant",h:"/ai-assistant"},{n:"Career",h:"/career"}].map(item => (
            <Link key={item.n} href={item.h} style={{ color: "var(--text-3)", fontSize: "13px", fontWeight: 500, padding: "6px 9px", borderRadius: "8px", textDecoration: "none", whiteSpace: "nowrap" }}
              onMouseEnter={e => { (e.target as HTMLElement).style.color = "var(--text-1)"; (e.target as HTMLElement).style.background = "var(--bg-2)"; }}
              onMouseLeave={e => { (e.target as HTMLElement).style.color = "var(--text-3)"; (e.target as HTMLElement).style.background = "transparent"; }}>
              {item.n}
            </Link>
          ))}
        </nav>

        {/* Right: Search + Theme + CTA + Mobile menu */}
        <div style={{ display: "flex", alignItems: "center", gap: "8px", flexShrink: 0 }}>
          <div className="hide-mobile"><SearchBar /></div>
          <ThemeToggle />
          <Link href="/academies" className="btn-primary hide-mobile" style={{ padding: "7px 14px", fontSize: "13px", borderRadius: "8px" }}>Start Learning</Link>
          <div className="show-mobile" style={{ display: "flex", gap: "6px" }}>
            <button onClick={() => setMobileSearch(!mobileSearch)} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", display: "flex", padding: "4px" }}><Search size={20} /></button>
            <button onClick={() => setMobileOpen(!mobileOpen)} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", display: "flex", padding: "4px" }}>
              {mobileOpen ? <X size={22} /> : <Menu size={22} />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile search bar */}
      {mobileSearch && (
        <div className="show-mobile" style={{ padding: "8px 16px 12px", borderBottom: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "8px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "10px 14px" }}>
            <Search size={16} color="var(--text-4)" />
            <input autoFocus placeholder="Search technologies, topics..." style={{ background: "none", border: "none", outline: "none", fontSize: "14px", color: "var(--text-2)", width: "100%", fontFamily: "inherit" }} />
          </div>
        </div>
      )}

      {/* Mobile menu */}
      {mobileOpen && (
        <div style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", maxHeight: "85vh", overflowY: "auto" }}>
          <div style={{ padding: "10px 16px 6px" }}><p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)" }}>Academies</p></div>
          {academies.map(a => (
            <Link key={a.slug} href={`/academies/${a.slug}`} onClick={() => setMobileOpen(false)}
              style={{ display: "flex", alignItems: "center", gap: "12px", padding: "11px 16px", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              <span style={{ fontSize: "20px", width: "28px", textAlign: "center" }}>{a.icon}</span>
              <div>
                <div style={{ fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</div>
                <div style={{ fontSize: "11px", color: a.color, marginTop: "1px" }}>{a.subtitle}</div>
              </div>
            </Link>
          ))}
          <div style={{ padding: "12px 16px 20px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "0 0 8px" }}>Platform</p>
            {[{n:"Roadmaps",h:"/roadmaps"},{n:"Labs",h:"/labs"},{n:"Certifications",h:"/certifications"},{n:"Interview",h:"/interview"},{n:"AI Assistant",h:"/ai-assistant"},{n:"Career",h:"/career"}].map(item => (
              <Link key={item.n} href={item.h} onClick={() => setMobileOpen(false)} style={{ display: "block", color: "var(--text-3)", fontSize: "14px", fontWeight: 500, padding: "9px 0", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>{item.n}</Link>
            ))}
            <Link href="/academies" onClick={() => setMobileOpen(false)} className="btn-primary" style={{ marginTop: "14px", justifyContent: "center", display: "flex" }}>Start Learning Free</Link>
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
