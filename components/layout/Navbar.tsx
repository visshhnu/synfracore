"use client";
import Link from "next/link";
import { useState, useEffect, useRef, useMemo } from "react";
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

// ── Enhanced Search ───────────────────────────────────────
function SearchBox() {
  const [q, setQ] = useState("");
  const [results, setResults] = useState<{ name: string; href: string; color: string; domain: string; tags: string[] }[]>([]);
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const h = (e: MouseEvent) => { if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false); };
    document.addEventListener("mousedown", h);
    return () => document.removeEventListener("mousedown", h);
  }, []);

  // Build a rich search index: name, tags, description, academy, domain name
  const searchIndex = useMemo(() => {
    const index: { name: string; slug: string; tags: string[]; description: string; href: string; color: string; academy: string; domain: string }[] = [];
    for (const a of academies) {
      for (const d of (a.domains || [])) {
        for (const t of (d.technologies || [])) {
          index.push({
            name: t.name,
            slug: t.slug,
            tags: t.tags || [],
            description: (t as any).description || "",
            href: `/academies/${a.slug}/${t.slug}`,
            color: a.color,
            academy: a.title,
            domain: d.name,
          });
        }
      }
    }
    return index;
  }, []);

  useEffect(() => {
    if (!q.trim()) { setResults([]); return; }
    const lq = q.toLowerCase();
    const hits = searchIndex
      .filter(t =>
        t.name.toLowerCase().includes(lq) ||
        t.tags.some(tg => tg.toLowerCase().includes(lq)) ||
        t.description.toLowerCase().includes(lq) ||
        t.academy.toLowerCase().includes(lq) ||
        t.domain.toLowerCase().includes(lq)
      )
      .slice(0, 8)
      .map(t => ({ name: t.name, href: t.href, color: t.color, domain: t.domain, tags: t.tags }));
    setResults(hits);
    setOpen(true);
  }, [q, searchIndex]);

  const highlight = (text: string, query: string) => {
    if (!query.trim()) return text;
    const idx = text.toLowerCase().indexOf(query.toLowerCase());
    if (idx === -1) return text;
    return (
      <>
        {text.slice(0, idx)}
        <span style={{ background: "rgba(59,130,246,0.2)", borderRadius: "2px", padding: "0 1px" }}>{text.slice(idx, idx + query.length)}</span>
        {text.slice(idx + query.length)}
      </>
    );
  };

  return (
    <div ref={ref} style={{ position: "relative" }}>
      <div style={{
        display: "flex", alignItems: "center", gap: "7px",
        background: "var(--bg-2)", border: `1px solid ${open && q ? "#3B82F6" : "var(--border)"}`,
        borderRadius: "8px", padding: "5px 10px", width: "200px",
        transition: "border-color 0.15s",
      }}>
        <Search size={13} color="var(--text-4)" />
        <input
          ref={inputRef}
          value={q}
          onChange={e => setQ(e.target.value)}
          onFocus={() => { if (results.length > 0) setOpen(true); }}
          placeholder="Search topics, exams, tools..."
          style={{ background: "none", border: "none", outline: "none", fontSize: "13px", color: "var(--text-1)", width: "100%", fontFamily: "inherit" }}
        />
        {q && (
          <button onClick={() => { setQ(""); setResults([]); setOpen(false); inputRef.current?.focus(); }}
            style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-4)", padding: "0", display: "flex" }}>
            <X size={12} />
          </button>
        )}
      </div>
      {open && results.length > 0 && (
        <div style={{
          position: "absolute", top: "calc(100% + 6px)", left: 0,
          width: "320px",
          background: "var(--bg-2)", border: "1px solid var(--border)",
          borderRadius: "12px", boxShadow: "0 16px 40px rgba(0,0,0,0.2)", zIndex: 400,
          overflow: "hidden",
        }}>
          <div style={{ padding: "6px 10px 4px", fontSize: "10px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: "var(--text-4)" }}>
            {results.length} result{results.length !== 1 ? "s" : ""} for "{q}"
          </div>
          {results.map((r, i) => (
            <Link key={i} href={r.href} onClick={() => { setOpen(false); setQ(""); }}
              style={{
                display: "flex", alignItems: "flex-start", gap: "10px",
                padding: "9px 12px", textDecoration: "none",
                borderTop: "1px solid var(--border)",
              }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}
            >
              <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: r.color, flexShrink: 0, marginTop: "5px" }} />
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{highlight(r.name, q)}</div>
                <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "1px" }}>{r.domain}</div>
                <div style={{ display: "flex", gap: "4px", flexWrap: "wrap", marginTop: "3px" }}>
                  {r.tags.slice(0, 3).map((tag, ti) => (
                    <span key={ti} style={{
                      fontSize: "10px", padding: "1px 5px", borderRadius: "4px",
                      background: `${r.color}15`, color: r.color, fontWeight: 600,
                    }}>{tag}</span>
                  ))}
                </div>
              </div>
              <span style={{ fontSize: "11px", color: r.color, fontWeight: 700, flexShrink: 0, marginTop: "2px" }}>→</span>
            </Link>
          ))}
          <Link href="/academies" onClick={() => { setOpen(false); setQ(""); }}
            style={{ display: "block", padding: "8px 12px", textAlign: "center", borderTop: "1px solid var(--border)", fontSize: "12px", color: "#3B82F6", fontWeight: 600, textDecoration: "none" }}
            onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
            onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}
          >
            Browse all academies →
          </Link>
        </div>
      )}
    </div>
  );
}

// ── Nav links ─────────────────────────────────────────────
const NAV_LINKS = [
  { n: "Roadmaps", h: "/roadmaps" },
  { n: "Labs", h: "/labs" },
  { n: "Certifications", h: "/certifications" },
  { n: "Interview", h: "/interview" },
  { n: "AI Assistant", h: "/ai-assistant" },
  { n: "Career", h: "/career" },
];

// Group academies for the mega dropdown
const ACADEMY_GROUPS = [
  {
    label: "Tech & Engineering", color: "#3B82F6",
    slugs: ["devops", "cloud", "databases", "ai", "data", "security"],
  },
  {
    label: "Education & Exams", color: "#F59E0B",
    slugs: ["education", "exams"],
  },
  {
    label: "Health & Essentials", color: "#F43F5E",
    slugs: ["healthcare", "essentials"],
  },
];

// ── Main Navbar ───────────────────────────────────────────
export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [dropOpen, setDropOpen] = useState(false);
  const [expandedAcademy, setExpandedAcademy] = useState<string | null>(null);
  const [scrolled, setScrolled] = useState(false);
  let dropTimer: ReturnType<typeof setTimeout>;

  useEffect(() => {
    const fn = () => {
      if (window.scrollY > 40) { setScrolled(true); return; }
      const sc = Array.from(document.querySelectorAll('aside, [class*="sidebar"], main'))
        .some(el => (el as HTMLElement).scrollTop > 40);
      setScrolled(window.scrollY > 40 || sc);
    };
    window.addEventListener("scroll", fn, { passive: true });
    const interval = setInterval(fn, 200);
    return () => { window.removeEventListener("scroll", fn); clearInterval(interval); };
  }, []);

  useEffect(() => {
    if (typeof window === "undefined") return;
    if ((window as any).__gtLoaded) return;
    (window as any).__gtLoaded = true;
    (window as any).googleTranslateElementInit = function () {
      try {
        new (window as any).google.translate.TranslateElement(
          { pageLanguage: "en", includedLanguages: "te,hi,kn,ta,ml,ar,es,pt,zh-TW,fr,de,ja", autoDisplay: false },
          "google_translate_element"
        );
      } catch {}
    };
    const script = document.createElement("script");
    script.src = "//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);
  }, []);

  // Close mobile menu on route change
  useEffect(() => {
    if (!mobileOpen) setExpandedAcademy(null);
  }, [mobileOpen]);

  const academyMap = useMemo(() => Object.fromEntries(academies.map(a => [a.slug, a])), []);

  return (
    <>
      {/* ── STICKY HEADER ── */}
      <header style={{
        position: "fixed", top: 0, left: 0, right: 0, zIndex: 9999,
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

          {/* Logo */}
          <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0 }}>
            <div className="logo-wrapper">
              {!scrolled ? (
                <Image src="/logo-main.webp" alt="SynfraCore" width={223} height={32} priority style={{ height: "28px", width: "auto", display: "block" }} />
              ) : (
                <Image src="/logo-ac-icon.png" alt="SynfraCore" width={39} height={26} style={{ height: "22px", width: "auto", display: "block" }} priority />
              )}
            </div>
          </Link>

          {/* Desktop nav */}
          <nav className="desktop-nav" style={{ display: "flex", alignItems: "center", flex: 1, gap: "1px" }}>
            {/* Single unified Academies dropdown */}
            <div
              onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }}
              onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 150); }}
              style={{ position: "relative" }}
            >
              <button style={{
                display: "flex", alignItems: "center", gap: "3px",
                color: dropOpen ? "var(--text-1)" : "var(--text-3)", fontSize: "13px", fontWeight: 500,
                padding: "5px 9px", borderRadius: "7px",
                background: dropOpen ? "var(--bg-2)" : "none", border: "none", cursor: "pointer", fontFamily: "inherit",
                transition: "color 0.15s, background 0.15s",
              }}>
                Academies
                <ChevronDown size={11} style={{ transform: dropOpen ? "rotate(180deg)" : "none", transition: "transform 0.2s" }} />
              </button>
            </div>

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
            <button className="mobile-only" onClick={() => setMobileOpen(!mobileOpen)}
              style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-2)", padding: "4px", display: "flex" }}>
              {mobileOpen ? <X size={22} /> : <Menu size={22} />}
            </button>
          </div>
        </div>

        {/* ── UNIFIED ACADEMIES MEGA DROPDOWN ── */}
        {dropOpen && (
          <div
            onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }}
            onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 150); }}
            style={{
              position: "absolute", left: 0, right: 0, top: "100%",
              background: "var(--bg-2)", borderBottom: "2px solid var(--border)",
              boxShadow: "0 20px 60px rgba(0,0,0,0.2)", zIndex: 300,
              padding: "20px 32px 16px",
            }}
          >
            {/* Grouped grid */}
            <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr", gap: "24px", maxWidth: "1000px", margin: "0 auto" }}>
              {ACADEMY_GROUPS.map(group => (
                <div key={group.label}>
                  <div style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: group.color, marginBottom: "8px" }}>
                    {group.label}
                  </div>
                  {group.slugs.map(slug => {
                    const a = academyMap[slug];
                    if (!a) return null;
                    return (
                      <Link key={slug} href={`/academies/${slug}`}
                        onClick={() => setDropOpen(false)}
                        style={{ textDecoration: "none", padding: "8px 10px", borderRadius: "8px", display: "block", marginBottom: "2px" }}
                        onMouseEnter={e => { e.currentTarget.style.background = `${a.color}12`; }}
                        onMouseLeave={e => { e.currentTarget.style.background = "transparent"; }}
                      >
                        <div style={{ display: "flex", alignItems: "center", gap: "7px" }}>
                          <span style={{ fontSize: "15px" }}>{a.icon}</span>
                          <div>
                            <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{a.title}</div>
                            <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "1px" }}>{a.subtitle}</div>
                          </div>
                        </div>
                      </Link>
                    );
                  })}
                </div>
              ))}
            </div>

            <div style={{ gridColumn: "1/-1", paddingTop: "12px", borderTop: "1px solid var(--border)", marginTop: "12px", display: "flex", justifyContent: "center", gap: "10px" }}>
              <Link href="/academies" onClick={() => setDropOpen(false)}
                style={{ fontSize: "12px", fontWeight: 600, color: "#3B82F6", textDecoration: "none", padding: "7px 20px", background: "rgba(59,130,246,0.08)", borderRadius: "8px", border: "1px solid rgba(59,130,246,0.2)" }}>
                View all {academies.length} academies →
              </Link>
            </div>
          </div>
        )}
      </header>

      {/* ── MOBILE MENU ── */}
      {mobileOpen && (
        <div style={{
          position: "fixed", top: 0, left: 0, right: 0, bottom: 0,
          background: "var(--bg-1)", zIndex: 9998, overflowY: "auto",
          display: "flex", flexDirection: "column",
        }}>
          {/* Mobile header */}
          <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "16px", borderBottom: "1px solid var(--border)", flexShrink: 0 }}>
            <div className="logo-wrapper" style={{ lineHeight: 0 }}>
              <Image src="/logo-main.webp" alt="SynfraCore" width={223} height={32} priority style={{ height: "26px", width: "auto" }} />
            </div>
            <div style={{ display: "flex", gap: "8px", alignItems: "center" }}>
              <ThemeToggle />
              <button onClick={() => setMobileOpen(false)} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-2)", padding: "4px", display: "flex" }}>
                <X size={22} />
              </button>
            </div>
          </div>

          {/* Mobile search */}
          <div style={{ padding: "12px 16px", borderBottom: "1px solid var(--border)" }}>
            <MobileSearch onClose={() => setMobileOpen(false)} />
          </div>

          {/* Academies with accordion */}
          <div style={{ padding: "10px 16px 4px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "0 0 4px" }}>Academies</p>
          </div>

          {academies.map(a => {
            const isOpen = expandedAcademy === a.slug;
            return (
              <div key={a.slug} style={{ borderBottom: "1px solid var(--border)" }}>
                {/* Academy header row — tap to expand */}
                <button
                  onClick={() => setExpandedAcademy(isOpen ? null : a.slug)}
                  style={{
                    width: "100%", display: "flex", alignItems: "center", gap: "12px",
                    padding: "13px 16px", background: "none", border: "none", cursor: "pointer",
                    textAlign: "left",
                  }}
                >
                  <span style={{ fontSize: "20px", width: "28px", textAlign: "center", flexShrink: 0 }}>{a.icon}</span>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>{a.title}</div>
                    <div style={{ fontSize: "11px", color: a.color, marginTop: "1px" }}>{a.subtitle}</div>
                  </div>
                  <ChevronDown size={16} color="var(--text-4)" style={{ transition: "transform 0.2s", transform: isOpen ? "rotate(180deg)" : "none", flexShrink: 0 }} />
                </button>

                {/* Expanded sub-domains */}
                {isOpen && (
                  <div style={{ background: "var(--bg-2)", padding: "4px 0 8px" }}>
                    {/* Go to academy main page */}
                    <Link href={`/academies/${a.slug}`}
                      onClick={() => setMobileOpen(false)}
                      style={{ display: "flex", alignItems: "center", gap: "8px", padding: "8px 20px 8px 56px", textDecoration: "none" }}
                      onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
                      onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}
                    >
                      <span style={{ fontSize: "11px", fontWeight: 600, color: a.color }}>View all {a.title} →</span>
                    </Link>
                    {/* Sub-domain technology links */}
                    {a.domains.flatMap(d => d.technologies || []).slice(0, 8).map(tech => (
                      <Link key={tech.slug} href={`/academies/${a.slug}/${tech.slug}`}
                        onClick={() => setMobileOpen(false)}
                        style={{ display: "flex", alignItems: "center", gap: "8px", padding: "7px 16px 7px 56px", textDecoration: "none" }}
                        onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
                        onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}
                      >
                        <span style={{ fontSize: "13px" }}>{(tech as any).icon || "·"}</span>
                        <span style={{ fontSize: "13px", color: "var(--text-2)", fontWeight: 500 }}>{tech.name}</span>
                      </Link>
                    ))}
                    {a.domains.flatMap(d => d.technologies || []).length > 8 && (
                      <Link href={`/academies/${a.slug}`} onClick={() => setMobileOpen(false)}
                        style={{ display: "block", padding: "6px 16px 6px 56px", fontSize: "12px", color: "var(--text-4)", textDecoration: "none" }}>
                        + {a.domains.flatMap(d => d.technologies || []).length - 8} more topics
                      </Link>
                    )}
                  </div>
                )}
              </div>
            );
          })}

          {/* Platform links */}
          <div style={{ padding: "10px 16px 4px" }}>
            <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: "8px 0 4px" }}>Platform</p>
          </div>
          {NAV_LINKS.map(item => (
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

// ── Mobile Search ─────────────────────────────────────────
function MobileSearch({ onClose }: { onClose: () => void }) {
  const [q, setQ] = useState("");
  const [results, setResults] = useState<{ name: string; href: string; color: string; domain: string }[]>([]);

  const searchIndex = useMemo(() => {
    const index: { name: string; tags: string[]; description: string; href: string; color: string; domain: string; academy: string }[] = [];
    for (const a of academies) {
      for (const d of (a.domains || [])) {
        for (const t of (d.technologies || [])) {
          index.push({
            name: t.name, tags: t.tags || [],
            description: (t as any).description || "",
            href: `/academies/${a.slug}/${t.slug}`,
            color: a.color, domain: d.name, academy: a.title,
          });
        }
      }
    }
    return index;
  }, []);

  useEffect(() => {
    if (!q.trim()) { setResults([]); return; }
    const lq = q.toLowerCase();
    const hits = searchIndex
      .filter(t =>
        t.name.toLowerCase().includes(lq) ||
        t.tags.some(tg => tg.toLowerCase().includes(lq)) ||
        t.description.toLowerCase().includes(lq) ||
        t.academy.toLowerCase().includes(lq) ||
        t.domain.toLowerCase().includes(lq)
      )
      .slice(0, 6)
      .map(t => ({ name: t.name, href: t.href, color: t.color, domain: t.domain }));
    setResults(hits);
  }, [q, searchIndex]);

  return (
    <div>
      <div style={{ display: "flex", gap: "8px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "10px 14px", alignItems: "center" }}>
        <Search size={15} color="var(--text-4)" />
        <input autoFocus value={q} onChange={e => setQ(e.target.value)}
          placeholder="Search topics, exams, tools..."
          style={{ background: "none", border: "none", outline: "none", fontSize: "14px", color: "var(--text-1)", width: "100%", fontFamily: "inherit" }} />
        {q && <button onClick={() => setQ("")} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-4)", padding: 0, display: "flex" }}><X size={14} /></button>}
      </div>
      {results.length > 0 && (
        <div style={{ marginTop: "8px", borderRadius: "10px", border: "1px solid var(--border)", overflow: "hidden" }}>
          {results.map((r, i) => (
            <Link key={i} href={r.href} onClick={onClose}
              style={{ display: "flex", alignItems: "center", gap: "10px", padding: "11px 14px", textDecoration: "none", borderTop: i > 0 ? "1px solid var(--border)" : "none" }}>
              <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: r.color, flexShrink: 0 }} />
              <div>
                <div style={{ fontSize: "14px", fontWeight: 600, color: "var(--text-1)" }}>{r.name}</div>
                <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{r.domain}</div>
              </div>
              <span style={{ marginLeft: "auto", fontSize: "12px", color: r.color, fontWeight: 700 }}>→</span>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
