"use client";
import Link from "next/link";
import { useState, useEffect, useRef } from "react";
import { Menu, X, ChevronDown, Search, Globe } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";
import Image from "next/image";

// Language options
const languages = [
  { code: "en", name: "English",    native: "English" },
  { code: "te", name: "Telugu",     native: "తెలుగు" },
  { code: "hi", name: "Hindi",      native: "हिंदी" },
  { code: "kn", name: "Kannada",    native: "ಕನ್ನಡ" },
  { code: "ta", name: "Tamil",      native: "தமிழ்" },
  { code: "ml", name: "Malayalam",  native: "മലയാളം" },
  { code: "ar", name: "Arabic",     native: "العربية" },
  { code: "es", name: "Spanish",    native: "Español" },
  { code: "pt", name: "Portuguese", native: "Português" },
  { code: "zh", name: "Chinese",    native: "中文" },
];

function LanguageSwitcher() {
  const [open, setOpen] = useState(false);
  const [current, setCurrent] = useState("en");
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const close = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener("mousedown", close);
    return () => document.removeEventListener("mousedown", close);
  }, []);

  return (
    <div ref={ref} style={{ position: "relative" }}>
      <button
        onClick={() => setOpen(!open)}
        style={{
          display: "flex", alignItems: "center", gap: "5px",
          background: "var(--bg-2)", border: "1px solid var(--border)",
          borderRadius: "8px", padding: "6px 10px", cursor: "pointer",
          color: "var(--text-3)", fontSize: "12px", fontFamily: "inherit",
          transition: "all 0.15s",
        }}
      >
        <Globe size={14} />
        <span className="hide-xs">{languages.find(l => l.code === current)?.native}</span>
        <ChevronDown size={11} />
      </button>
      {open && (
        <div style={{
          position: "absolute", top: "calc(100% + 6px)", right: 0,
          background: "var(--bg-2)", border: "1px solid var(--border)",
          borderRadius: "12px", boxShadow: "0 16px 40px rgba(0,0,0,0.3)",
          zIndex: 500, minWidth: "180px", overflow: "hidden", maxHeight: "300px", overflowY: "auto",
        }}>
          {languages.map(lang => (
            <button key={lang.code}
              onClick={() => { setCurrent(lang.code); setOpen(false); }}
              style={{
                display: "flex", alignItems: "center", justifyContent: "space-between",
                width: "100%", padding: "9px 14px", background: "none", border: "none",
                borderBottom: "1px solid var(--border)", cursor: "pointer",
                color: lang.code === current ? "#3B82F6" : "var(--text-2)",
                fontSize: "13px", fontFamily: "inherit",
                fontWeight: lang.code === current ? 700 : 400,
              }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "none"}
            >
              <span>{lang.name}</span>
              <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{lang.native}</span>
            </button>
          ))}
        </div>
      )}
    </div>
  );
}

function SearchBox() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<{ name: string; href: string; academy: string; color: string }[]>([]);
  const [focused, setFocused] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const close = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setFocused(false);
    };
    document.addEventListener("mousedown", close);
    return () => document.removeEventListener("mousedown", close);
  }, []);

  useEffect(() => {
    if (!query.trim()) { setResults([]); return; }
    const q = query.toLowerCase();
    const matches: typeof results = [];
    for (const a of academies) {
      for (const d of a.domains) {
        for (const t of d.technologies) {
          if (
            t.name.toLowerCase().includes(q) ||
            t.description.toLowerCase().includes(q) ||
            t.tags.some(tag => tag.toLowerCase().includes(q))
          ) {
            matches.push({ name: t.name, href: `/academies/${a.slug}/${t.slug}`, academy: a.title, color: a.color });
            if (matches.length >= 8) break;
          }
        }
        if (matches.length >= 8) break;
      }
      if (matches.length >= 8) break;
    }
    setResults(matches);
  }, [query]);

  return (
    <div ref={ref} style={{ position: "relative" }}>
      <div style={{
        display: "flex", alignItems: "center", gap: "8px",
        background: "var(--bg-2)", border: `1px solid ${focused ? "#3B82F6" : "var(--border)"}`,
        borderRadius: "10px", padding: "6px 12px",
        width: "200px", transition: "border-color 0.2s",
      }}>
        <Search size={14} color="var(--text-4)" style={{ flexShrink: 0 }} />
        <input
          value={query}
          onChange={e => setQuery(e.target.value)}
          onFocus={() => setFocused(true)}
          placeholder="Search topics..."
          style={{
            background: "none", border: "none", outline: "none",
            fontSize: "13px", color: "var(--text-1)", width: "100%", fontFamily: "inherit",
          }}
        />
      </div>
      {focused && results.length > 0 && (
        <div style={{
          position: "absolute", top: "calc(100% + 6px)", left: 0, right: 0,
          background: "var(--bg-2)", border: "1px solid var(--border)",
          borderRadius: "12px", boxShadow: "0 16px 40px rgba(0,0,0,0.25)",
          zIndex: 400, overflow: "hidden",
        }}>
          {results.map((r, i) => (
            <Link key={i} href={r.href}
              onClick={() => { setFocused(false); setQuery(""); }}
              style={{
                display: "flex", justifyContent: "space-between", alignItems: "center",
                padding: "10px 14px", textDecoration: "none",
                borderBottom: i < results.length - 1 ? "1px solid var(--border)" : "none",
              }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}
            >
              <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{r.name}</span>
              <span style={{ fontSize: "11px", color: r.color, fontWeight: 600 }}>{r.academy}</span>
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
  let dropTimer: ReturnType<typeof setTimeout>;

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 60);
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <header style={{
      position: "sticky", top: 0, zIndex: 200,
      background: "var(--nav-bg, var(--bg-1))",
      backdropFilter: "blur(20px)", WebkitBackdropFilter: "blur(20px)",
      borderBottom: "1px solid var(--border)",
      width: "100%",
    }}>
      <div style={{
        maxWidth: "1280px", margin: "0 auto", padding: "0 16px",
        height: scrolled ? "52px" : "64px",
        display: "flex", alignItems: "center", gap: "8px",
        transition: "height 0.2s",
      }}>

        {/* ── LOGO ── */}
        <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0, display: "flex", alignItems: "center" }}>
          {/* On scroll: show just the AC icon */}
          {/* Not scrolled: show full logo */}
          <div className="logo-bg">
            <Image
              src={scrolled ? "/logo-ac-icon.png" : "/logo-main.png"}
              alt="SynfraCore"
              width={scrolled ? 49 : 306}
              height={scrolled ? 32 : 44}
              style={{
                height: scrolled ? "28px" : "40px",
                width: "auto",
                display: "block",
              }}
              priority
            />
          </div>
        </Link>

        {/* ── DESKTOP NAV ── */}
        <nav className="hide-mobile" style={{ display: "flex", alignItems: "center", flex: 1, gap: "1px" }}>
          {/* Academies Mega Menu */}
          <div
            style={{ position: "relative" }}
            onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }}
            onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 150); }}
          >
            <button style={{
              display: "flex", alignItems: "center", gap: "4px", color: "var(--text-3)",
              fontSize: "13px", fontWeight: 500, padding: "6px 10px", borderRadius: "8px",
              background: "none", border: "none", cursor: "pointer", fontFamily: "inherit",
            }}>
              Academies
              <ChevronDown size={12} style={{ transition: "transform 0.2s", transform: dropOpen ? "rotate(180deg)" : "none" }} />
            </button>

            {dropOpen && (
              <div style={{
                position: "fixed",
                top: scrolled ? "52px" : "64px",
                left: 0, right: 0,
                background: "var(--bg-2)",
                borderBottom: "2px solid var(--border)",
                boxShadow: "0 20px 60px rgba(0,0,0,0.3)",
                zIndex: 300,
                padding: "24px 40px",
                display: "grid",
                gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))",
                gap: "8px",
              }}>
                {academies.map(a => (
                  <Link key={a.slug} href={`/academies/${a.slug}`}
                    onClick={() => setDropOpen(false)}
                    style={{
                      textDecoration: "none", padding: "12px 14px", borderRadius: "10px",
                      border: "1px solid transparent", display: "block",
                    }}
                    onMouseEnter={e => { e.currentTarget.style.background = `${a.color}10`; e.currentTarget.style.borderColor = `${a.color}30`; }}
                    onMouseLeave={e => { e.currentTarget.style.background = "transparent"; e.currentTarget.style.borderColor = "transparent"; }}
                  >
                    <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "5px" }}>
                      <span style={{ fontSize: "18px" }}>{a.icon}</span>
                      <span style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", lineHeight: 1.3 }}>{a.title}</span>
                    </div>
                    <div style={{ paddingLeft: "26px", display: "flex", gap: "3px", flexWrap: "wrap" }}>
                      {a.domains.slice(0, 2).map(d => (
                        <span key={d.slug} style={{ fontSize: "10px", padding: "1px 6px", borderRadius: "4px", background: `${a.color}12`, color: a.color }}>
                          {d.name}
                        </span>
                      ))}
                      {a.domains.length > 2 && (
                        <span style={{ fontSize: "10px", color: "var(--text-4)" }}>+{a.domains.length - 2}</span>
                      )}
                    </div>
                  </Link>
                ))}
                <div style={{
                  gridColumn: "1/-1", borderTop: "1px solid var(--border)",
                  paddingTop: "12px", marginTop: "4px",
                  display: "flex", justifyContent: "center",
                }}>
                  <Link href="/academies" onClick={() => setDropOpen(false)}
                    style={{
                      fontSize: "13px", fontWeight: 600, color: "#3B82F6",
                      textDecoration: "none", padding: "8px 24px",
                      background: "rgba(59,130,246,0.08)", borderRadius: "8px",
                      border: "1px solid rgba(59,130,246,0.2)",
                    }}>
                    View All {academies.length} Academies →
                  </Link>
                </div>
              </div>
            )}
          </div>

          {[
            { n: "Roadmaps", h: "/roadmaps" },
            { n: "Labs", h: "/labs" },
            { n: "Certifications", h: "/certifications" },
            { n: "Interview", h: "/interview" },
            { n: "AI Assistant", h: "/ai-assistant" },
            { n: "Career", h: "/career" },
          ].map(item => (
            <Link key={item.n} href={item.h}
              style={{ color: "var(--text-3)", fontSize: "13px", fontWeight: 500, padding: "6px 9px", borderRadius: "8px", textDecoration: "none", whiteSpace: "nowrap" }}
              onMouseEnter={e => { (e.target as HTMLElement).style.color = "var(--text-1)"; (e.target as HTMLElement).style.background = "var(--bg-2)"; }}
              onMouseLeave={e => { (e.target as HTMLElement).style.color = "var(--text-3)"; (e.target as HTMLElement).style.background = "transparent"; }}
            >
              {item.n}
            </Link>
          ))}
        </nav>

        {/* ── RIGHT SIDE ── */}
        <div style={{ display: "flex", alignItems: "center", gap: "6px", flexShrink: 0, marginLeft: "auto" }}>
          <div className="hide-mobile"><SearchBox /></div>
          <LanguageSwitcher />
          <ThemeToggle />
          <Link href="/academies" className="btn-primary hide-mobile"
            style={{ padding: "7px 14px", fontSize: "13px", borderRadius: "8px", whiteSpace: "nowrap" }}>
            Start Learning
          </Link>
          <div className="show-mobile" style={{ display: "flex", gap: "4px" }}>
            <button onClick={() => { setMobileSearch(!mobileSearch); setMobileOpen(false); }}
              style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", padding: "4px" }}>
              <Search size={20} />
            </button>
            <button onClick={() => { setMobileOpen(!mobileOpen); setMobileSearch(false); }}
              style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", padding: "4px" }}>
              {mobileOpen ? <X size={22} /> : <Menu size={22} />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Search */}
      {mobileSearch && (
        <div style={{ padding: "10px 16px 14px", borderBottom: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <div style={{ display: "flex", gap: "8px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "10px 14px", alignItems: "center" }}>
            <Search size={16} color="var(--text-4)" />
            <input autoFocus placeholder="Search technologies, topics, exams..."
              style={{ background: "none", border: "none", outline: "none", fontSize: "14px", color: "var(--text-1)", width: "100%", fontFamily: "inherit" }} />
          </div>
        </div>
      )}

      {/* Mobile Menu */}
      {mobileOpen && (
        <div style={{ background: "var(--bg-1)", borderTop: "1px solid var(--border)", maxHeight: "85vh", overflowY: "auto" }}>
          <div style={{ padding: "10px 16px 6px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: 0 }}>All Academies</p>
          </div>
          {academies.map(a => (
            <Link key={a.slug} href={`/academies/${a.slug}`}
              onClick={() => setMobileOpen(false)}
              style={{ display: "flex", alignItems: "center", gap: "12px", padding: "11px 16px", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
              <span style={{ fontSize: "20px", width: "28px", textAlign: "center", flexShrink: 0 }}>{a.icon}</span>
              <div>
                <div style={{ fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</div>
                <div style={{ fontSize: "11px", color: a.color, marginTop: "1px" }}>{a.subtitle}</div>
              </div>
            </Link>
          ))}
          <div style={{ padding: "12px 16px 20px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "0 0 8px" }}>Platform</p>
            {[
              { n: "Roadmaps", h: "/roadmaps" }, { n: "Labs", h: "/labs" },
              { n: "Certifications", h: "/certifications" }, { n: "Interview", h: "/interview" },
              { n: "AI Assistant", h: "/ai-assistant" }, { n: "Career", h: "/career" },
            ].map(item => (
              <Link key={item.n} href={item.h}
                onClick={() => setMobileOpen(false)}
                style={{ display: "block", color: "var(--text-3)", fontSize: "14px", fontWeight: 500, padding: "9px 0", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
                {item.n}
              </Link>
            ))}
            <Link href="/academies" onClick={() => setMobileOpen(false)} className="btn-primary"
              style={{ marginTop: "14px", justifyContent: "center", display: "flex" }}>
              Start Learning Free
            </Link>
          </div>
        </div>
      )}

      <style>{`
        @media (min-width: 1025px) { .show-mobile { display: none !important; } }
        @media (max-width: 1024px) { .hide-mobile { display: none !important; } .show-mobile { display: flex !important; } }
        @media (max-width: 380px) { .hide-xs { display: none !important; } }

        /* Logo background for light mode */
        html.light .logo-bg {
          background: #0F172A;
          padding: 5px 8px;
          border-radius: 8px;
          display: inline-flex;
        }
        html:not(.light) .logo-bg {
          display: inline-flex;
        }
      `}</style>
    </header>
  );
}
