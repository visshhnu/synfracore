"use client";
import Link from "next/link";
import { useState, useEffect, useRef } from "react";
import { Menu, X, ChevronDown, Search, Globe } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";
import Image from "next/image";

// ── Language Switcher ─────────────────────────────────────
function LanguageSwitcher() {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);
  const langs = [
    { code: "", label: "English" },
    { code: "te", label: "తెలుగు" },
    { code: "hi", label: "हिंदी" },
    { code: "kn", label: "ಕನ್ನಡ" },
    { code: "ta", label: "தமிழ்" },
    { code: "ml", label: "മലയാളം" },
    { code: "ar", label: "العربية" },
    { code: "es", label: "Español" },
    { code: "pt", label: "Português" },
    { code: "zh-TW", label: "中文" },
    { code: "fr", label: "Français" },
    { code: "de", label: "Deutsch" },
  ];

  useEffect(() => {
    const h = (e: MouseEvent) => { if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false); };
    document.addEventListener("mousedown", h);
    return () => document.removeEventListener("mousedown", h);
  }, []);

  const translate = (code: string) => {
    setOpen(false);
    if (!code) {
      document.cookie = "googtrans=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
      document.cookie = `googtrans=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; domain=${window.location.hostname}`;
      window.location.reload();
    } else {
      document.cookie = `googtrans=/en/${code}`;
      document.cookie = `googtrans=/en/${code}; domain=${window.location.hostname}`;
      window.location.reload();
    }
  };

  return (
    <div ref={ref} style={{ position: "relative", flexShrink: 0 }}>
      <div id="google_translate_element" style={{ display: "none" }} />
      <button onClick={() => setOpen(!open)} title="Translate" style={{
        display: "flex", alignItems: "center", gap: "4px",
        background: "var(--bg-2)", border: "1px solid var(--border)",
        borderRadius: "7px", padding: "5px 8px", cursor: "pointer",
        color: "var(--text-3)", fontFamily: "inherit",
      }}>
        <Globe size={14} />
        <ChevronDown size={10} />
      </button>
      {open && (
        <div style={{
          position: "absolute", top: "calc(100% + 6px)", right: 0,
          background: "var(--bg-2)", border: "1px solid var(--border)",
          borderRadius: "10px", boxShadow: "0 12px 32px rgba(0,0,0,0.25)",
          zIndex: 500, minWidth: "150px", maxHeight: "280px", overflowY: "auto",
        }}>
          {langs.map(l => (
            <button key={l.code} onClick={() => translate(l.code)} style={{
              display: "block", width: "100%", padding: "8px 14px",
              background: "none", border: "none",
              borderBottom: "1px solid var(--border)", cursor: "pointer",
              color: "var(--text-2)", fontSize: "13px", fontFamily: "inherit",
              textAlign: "left",
            }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "none"}
            >{l.label}</button>
          ))}
        </div>
      )}
    </div>
  );
}

// ── Search ────────────────────────────────────────────────
function SearchBox() {
  const [q, setQ] = useState("");
  const [results, setResults] = useState<{ name: string; href: string; color: string }[]>([]);
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const h = (e: MouseEvent) => { if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false); };
    document.addEventListener("mousedown", h);
    return () => document.removeEventListener("mousedown", h);
  }, []);

  useEffect(() => {
    if (!q.trim()) { setResults([]); return; }
    const lq = q.toLowerCase();
    const hits: typeof results = [];
    for (const a of academies) {
      for (const d of a.domains) {
        for (const t of d.technologies) {
          if (t.name.toLowerCase().includes(lq) || t.tags.some(tg => tg.toLowerCase().includes(lq))) {
            hits.push({ name: t.name, href: `/academies/${a.slug}/${t.slug}`, color: a.color });
            if (hits.length >= 6) break;
          }
        }
        if (hits.length >= 6) break;
      }
      if (hits.length >= 6) break;
    }
    setResults(hits);
  }, [q]);

  return (
    <div ref={ref} style={{ position: "relative" }}>
      <div style={{
        display: "flex", alignItems: "center", gap: "7px",
        background: "var(--bg-2)", border: `1px solid ${open ? "#3B82F6" : "var(--border)"}`,
        borderRadius: "8px", padding: "5px 10px", width: "180px",
      }}>
        <Search size={13} color="var(--text-4)" />
        <input value={q} onChange={e => setQ(e.target.value)}
          onFocus={() => setOpen(true)}
          placeholder="Search..."
          style={{ background: "none", border: "none", outline: "none", fontSize: "13px", color: "var(--text-1)", width: "100%", fontFamily: "inherit" }}
        />
      </div>
      {open && results.length > 0 && (
        <div style={{
          position: "absolute", top: "calc(100% + 6px)", left: 0, right: 0,
          background: "var(--bg-2)", border: "1px solid var(--border)",
          borderRadius: "10px", boxShadow: "0 12px 32px rgba(0,0,0,0.2)", zIndex: 400,
        }}>
          {results.map((r, i) => (
            <Link key={i} href={r.href} onClick={() => { setOpen(false); setQ(""); }}
              style={{ display: "flex", justifyContent: "space-between", padding: "9px 12px", textDecoration: "none", borderBottom: i < results.length - 1 ? "1px solid var(--border)" : "none" }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}
            >
              <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{r.name}</span>
              <span style={{ fontSize: "10px", color: r.color, fontWeight: 600 }}>→</span>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}

// ── Main Navbar ───────────────────────────────────────────
const NAV_LINKS = [
  { n: "Roadmaps", h: "/roadmaps" },
  { n: "Labs", h: "/labs" },
  { n: "Certifications", h: "/certifications" },
  { n: "Interview", h: "/interview" },
  { n: "AI Assistant", h: "/ai-assistant" },
  { n: "Career", h: "/career" },
];

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [dropOpen, setDropOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  let dropTimer: ReturnType<typeof setTimeout>;

  useEffect(() => {
    const fn = () => setScrolled(window.scrollY > 40);
    window.addEventListener("scroll", fn, { passive: true });
    return () => window.removeEventListener("scroll", fn);
  }, []);

  return (
    <>
      {/* ── STICKY HEADER ── */}
      <header style={{
        position: "sticky", top: 0, zIndex: 200,
        background: "var(--bg-1)",
        backdropFilter: "blur(16px)", WebkitBackdropFilter: "blur(16px)",
        borderBottom: "1px solid var(--border)",
        transition: "box-shadow 0.2s",
        boxShadow: scrolled ? "0 2px 20px rgba(0,0,0,0.15)" : "none",
      }}>
        <div style={{
          maxWidth: "1300px", margin: "0 auto", padding: "0 16px",
          height: scrolled ? "50px" : "60px",
          display: "flex", alignItems: "center", gap: "8px",
          transition: "height 0.2s",
        }}>

          {/* Logo - visible only when NOT scrolled */}
          {!scrolled && (
            <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0 }}>
              <div className="logo-wrapper">
                <Image
                  src="/logo-main.png"
                  alt="SynfraCore"
                  width={223}
                  height={32}
                  style={{ height: "28px", width: "auto", display: "block" }}
                  priority
                />
              </div>
            </Link>
          )}
          {/* When scrolled: show AC icon as home link */}
          {scrolled && (
            <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0 }}>
              <div className="logo-wrapper">
                <Image
                  src="/logo-ac-icon.png"
                  alt="SynfraCore"
                  width={39}
                  height={26}
                  style={{ height: "22px", width: "auto", display: "block" }}
                  priority
                />
              </div>
            </Link>
          )}

          {/* Desktop: Academies dropdown + nav links */}
          <nav className="desktop-nav" style={{ display: "flex", alignItems: "center", flex: 1, gap: "1px" }}>
            {/* Academies */}
            <div
              onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }}
              onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 150); }}
              style={{ position: "relative" }}
            >
              <button style={{
                display: "flex", alignItems: "center", gap: "3px",
                color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
                padding: "5px 9px", borderRadius: "7px",
                background: "none", border: "none", cursor: "pointer", fontFamily: "inherit",
              }}>
                Academies
                <ChevronDown size={11} style={{ transform: dropOpen ? "rotate(180deg)" : "none", transition: "transform 0.2s" }} />
              </button>
            </div>

            {/* Regular links */}
            {NAV_LINKS.map(item => (
              <Link key={item.n} href={item.h} style={{
                color: "var(--text-3)", fontSize: "13px", fontWeight: 500,
                padding: "5px 9px", borderRadius: "7px", textDecoration: "none", whiteSpace: "nowrap",
              }}
                onMouseEnter={e => { (e.target as HTMLElement).style.color = "var(--text-1)"; (e.target as HTMLElement).style.background = "var(--bg-2)"; }}
                onMouseLeave={e => { (e.target as HTMLElement).style.color = "var(--text-3)"; (e.target as HTMLElement).style.background = "transparent"; }}
              >{item.n}</Link>
            ))}
          </nav>

          {/* Right side */}
          <div style={{ display: "flex", alignItems: "center", gap: "6px", flexShrink: 0, marginLeft: "auto" }}>
            <div className="desktop-nav"><SearchBox /></div>
            <LanguageSwitcher />
            <ThemeToggle />
            <Link href="/academies" className="desktop-nav btn-primary"
              style={{ padding: "6px 14px", fontSize: "13px", borderRadius: "7px", whiteSpace: "nowrap" }}>
              Start Learning
            </Link>
            {/* Mobile menu button */}
            <button className="mobile-only" onClick={() => setMobileOpen(!mobileOpen)}
              style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-2)", padding: "4px", display: "flex" }}>
              {mobileOpen ? <X size={22} /> : <Menu size={22} />}
            </button>
          </div>
        </div>

        {/* Academies mega dropdown */}
        {dropOpen && (
          <div
            onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }}
            onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 150); }}
            style={{
              position: "absolute", left: 0, right: 0, top: "100%",
              background: "var(--bg-2)", borderBottom: "2px solid var(--border)",
              boxShadow: "0 20px 60px rgba(0,0,0,0.25)", zIndex: 300,
              padding: "20px 40px",
              display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(190px, 1fr))", gap: "6px",
            }}
          >
            {academies.map(a => (
              <Link key={a.slug} href={`/academies/${a.slug}`}
                onClick={() => setDropOpen(false)}
                style={{ textDecoration: "none", padding: "10px 12px", borderRadius: "9px", border: "1px solid transparent", display: "block" }}
                onMouseEnter={e => { e.currentTarget.style.background = `${a.color}12`; e.currentTarget.style.borderColor = `${a.color}30`; }}
                onMouseLeave={e => { e.currentTarget.style.background = "transparent"; e.currentTarget.style.borderColor = "transparent"; }}
              >
                <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "4px" }}>
                  <span style={{ fontSize: "16px" }}>{a.icon}</span>
                  <span style={{ fontSize: "12px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</span>
                </div>
                <div style={{ paddingLeft: "24px", display: "flex", gap: "3px", flexWrap: "wrap" }}>
                  {a.domains.slice(0, 2).map(d => (
                    <span key={d.slug} style={{ fontSize: "10px", padding: "1px 5px", borderRadius: "4px", background: `${a.color}12`, color: a.color }}>{d.name}</span>
                  ))}
                  {a.domains.length > 2 && <span style={{ fontSize: "10px", color: "var(--text-4)" }}>+{a.domains.length - 2}</span>}
                </div>
              </Link>
            ))}
            <div style={{ gridColumn: "1/-1", paddingTop: "12px", borderTop: "1px solid var(--border)", display: "flex", justifyContent: "center", gap: "10px" }}>
              <Link href="/academies" onClick={() => setDropOpen(false)}
                style={{ fontSize: "12px", fontWeight: 600, color: "#3B82F6", textDecoration: "none", padding: "7px 20px", background: "rgba(59,130,246,0.08)", borderRadius: "8px", border: "1px solid rgba(59,130,246,0.2)" }}>
                View All {academies.length} Academies →
              </Link>
            </div>
          </div>
        )}
      </header>

      {/* ── MOBILE MENU (full screen overlay) ── */}
      {mobileOpen && (
        <div style={{
          position: "fixed", top: 0, left: 0, right: 0, bottom: 0,
          background: "var(--bg-1)", zIndex: 300, overflowY: "auto",
          display: "flex", flexDirection: "column",
        }}>
          {/* Mobile header */}
          <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "16px", borderBottom: "1px solid var(--border)", flexShrink: 0 }}>
            <div className="logo-wrapper" style={{ lineHeight: 0 }}>
              <Image src="/logo-main.png" alt="SynfraCore" width={223} height={32} style={{ height: "26px", width: "auto" }} />
            </div>
            <div style={{ display: "flex", gap: "8px", alignItems: "center" }}>
              <ThemeToggle />
              <button onClick={() => setMobileOpen(false)} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-2)", padding: "4px", display: "flex" }}>
                <X size={22} />
              </button>
            </div>
          </div>

          {/* Mobile search */}
          <div style={{ padding: "14px 16px", borderBottom: "1px solid var(--border)" }}>
            <div style={{ display: "flex", gap: "8px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "10px 14px", alignItems: "center" }}>
              <Search size={15} color="var(--text-4)" />
              <input autoFocus placeholder="Search technologies, exams, topics..."
                style={{ background: "none", border: "none", outline: "none", fontSize: "14px", color: "var(--text-1)", width: "100%", fontFamily: "inherit" }} />
            </div>
          </div>

          {/* Academies list */}
          <div style={{ padding: "10px 16px 4px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "0 0 4px" }}>Academies</p>
          </div>
          {academies.map(a => (
            <Link key={a.slug} href={`/academies/${a.slug}`}
              onClick={() => setMobileOpen(false)}
              style={{ display: "flex", alignItems: "center", gap: "12px", padding: "12px 16px", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              <span style={{ fontSize: "20px", width: "28px", textAlign: "center", flexShrink: 0 }}>{a.icon}</span>
              <div>
                <div style={{ fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</div>
                <div style={{ fontSize: "11px", color: a.color, marginTop: "1px" }}>{a.subtitle}</div>
              </div>
            </Link>
          ))}

          {/* Platform links */}
          <div style={{ padding: "10px 16px 4px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "8px 0 4px" }}>Platform</p>
          </div>
          {[...NAV_LINKS].map(item => (
            <Link key={item.n} href={item.h}
              onClick={() => setMobileOpen(false)}
              style={{ display: "block", color: "var(--text-2)", fontSize: "15px", fontWeight: 500, padding: "12px 16px", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              {item.n}
            </Link>
          ))}

          <div style={{ padding: "16px" }}>
            <Link href="/academies" onClick={() => setMobileOpen(false)} className="btn-primary"
              style={{ display: "flex", justifyContent: "center", padding: "12px" }}>
              Start Learning Free
            </Link>
          </div>
        </div>
      )}

      <style>{`
        .desktop-nav { display: flex; align-items: center; gap: 1px; }
        .mobile-only { display: none; }
        @media (max-width: 1024px) {
          .desktop-nav { display: none !important; }
          .mobile-only { display: flex !important; }
        }
        /* Light mode: logo needs dark background */
        html.light .logo-wrapper {
          background: #0F172A;
          padding: 4px 8px;
          border-radius: 8px;
          display: inline-flex;
          align-items: center;
        }
        html:not(.light) .logo-wrapper {
          display: inline-flex;
          align-items: center;
        }
      `}</style>
    </>
  );
}
