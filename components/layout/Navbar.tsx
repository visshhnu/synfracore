"use client";
import Link from "next/link";
import { useState, useEffect, useRef, useMemo } from "react";
import { Menu, X, ChevronDown, ChevronRight, Search, Globe } from "lucide-react";
import { ThemeToggle } from "@/components/ThemeToggle";
import { academies } from "@/lib/data/academies";
import Image from "next/image";

// ── Language Switcher ─────────────────────────────────────
function LanguageSwitcher() {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);
  const langs = [
    { code: "", label: "English" }, { code: "te", label: "తెలుగు" },
    { code: "hi", label: "हिंदी" }, { code: "kn", label: "ಕನ್ನಡ" },
    { code: "ta", label: "தமிழ்" }, { code: "ml", label: "മലയാളം" },
    { code: "ar", label: "العربية" }, { code: "es", label: "Español" },
    { code: "fr", label: "Français" }, { code: "de", label: "Deutsch" },
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
    } else {
      document.cookie = `googtrans=/en/${code}`;
      document.cookie = `googtrans=/en/${code}; domain=${window.location.hostname}`;
    }
    window.location.reload();
  };
  return (
    <div ref={ref} style={{ position: "relative", flexShrink: 0 }}>
      <div id="google_translate_element" style={{ display: "none" }} />
      <button onClick={() => setOpen(o => !o)} title="Translate" style={{ display: "flex", alignItems: "center", gap: "4px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "7px", padding: "5px 8px", cursor: "pointer", color: "var(--text-3)", fontFamily: "inherit" }}>
        <Globe size={14} /><ChevronDown size={10} />
      </button>
      {open && (
        <div className="notranslate" style={{ position: "absolute", top: "calc(100% + 6px)", right: 0, background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", boxShadow: "0 12px 32px rgba(0,0,0,0.25)", zIndex: 600, minWidth: "150px", maxHeight: "280px", overflowY: "auto" }}>
          {langs.map(l => (
            <button key={l.code} onClick={() => translate(l.code)} translate="no"
              style={{ display: "block", width: "100%", padding: "8px 14px", background: "none", border: "none", borderBottom: "1px solid var(--border)", cursor: "pointer", color: "var(--text-2)", fontSize: "13px", fontFamily: "inherit", textAlign: "left" }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "none"}
            >{l.label}</button>
          ))}
        </div>
      )}
    </div>
  );
}

// ── Desktop Search ────────────────────────────────────────
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
  const searchIndex = useMemo(() => {
    const idx: { name: string; tags: string[]; description: string; href: string; color: string; domain: string; academy: string }[] = [];
    for (const a of academies) {
      for (const d of (a.domains || [])) {
        for (const t of (d.technologies || [])) {
          idx.push({ name: t.name, tags: t.tags || [], description: (t as any).description || "", href: `/academies/${a.slug}/${t.slug}`, color: a.color, domain: d.name, academy: a.title });
        }
      }
    }
    return idx;
  }, []);
  useEffect(() => {
    if (!q.trim()) { setResults([]); setOpen(false); return; }
    const lq = q.toLowerCase();
    const hits = searchIndex.filter(t => t.name.toLowerCase().includes(lq) || t.tags.some(tg => tg.toLowerCase().includes(lq)) || t.description.toLowerCase().includes(lq) || t.academy.toLowerCase().includes(lq) || t.domain.toLowerCase().includes(lq)).slice(0, 7).map(t => ({ name: t.name, href: t.href, color: t.color, domain: t.domain, tags: t.tags }));
    setResults(hits);
    setOpen(hits.length > 0);
  }, [q, searchIndex]);
  return (
    <div ref={ref} style={{ position: "relative" }}>
      <div style={{ display: "flex", alignItems: "center", gap: "7px", background: "var(--bg-2)", border: `1px solid ${open ? "#3B82F6" : "var(--border)"}`, borderRadius: "8px", padding: "5px 10px", width: "210px", transition: "border-color 0.15s" }}>
        <Search size={13} color="var(--text-4)" />
        <input ref={inputRef} value={q} onChange={e => setQ(e.target.value)} onFocus={() => results.length > 0 && setOpen(true)} placeholder="Search topics, exams, tools..." style={{ background: "none", border: "none", outline: "none", fontSize: "13px", color: "var(--text-1)", width: "100%", fontFamily: "inherit" }} />
        {q && <button onClick={() => { setQ(""); setResults([]); setOpen(false); inputRef.current?.focus(); }} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-4)", padding: "0", display: "flex" }}><X size={12} /></button>}
      </div>
      {open && results.length > 0 && (
        <div style={{ position: "absolute", top: "calc(100% + 6px)", left: 0, width: "300px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px", boxShadow: "0 16px 40px rgba(0,0,0,0.2)", zIndex: 500, overflow: "hidden" }}>
          <div style={{ padding: "6px 12px 4px", fontSize: "10px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: "var(--text-4)" }}>{results.length} result{results.length !== 1 ? "s" : ""}</div>
          {results.map((r, i) => (
            <Link key={i} href={r.href} onClick={() => { setOpen(false); setQ(""); }} style={{ display: "flex", alignItems: "flex-start", gap: "10px", padding: "9px 12px", textDecoration: "none", borderTop: "1px solid var(--border)" }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}>
              <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: r.color, flexShrink: 0, marginTop: "5px" }} />
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{r.name}</div>
                <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "1px" }}>{r.domain}</div>
                <div style={{ display: "flex", gap: "3px", flexWrap: "wrap", marginTop: "3px" }}>{r.tags.slice(0, 3).map((tag, ti) => <span key={ti} style={{ fontSize: "10px", padding: "1px 5px", borderRadius: "4px", background: `${r.color}18`, color: r.color, fontWeight: 600 }}>{tag}</span>)}</div>
              </div>
              <span style={{ fontSize: "11px", color: r.color, fontWeight: 700, flexShrink: 0, marginTop: "2px" }}>→</span>
            </Link>
          ))}
          <Link href="/academies" onClick={() => { setOpen(false); setQ(""); }} style={{ display: "block", padding: "8px 12px", textAlign: "center", borderTop: "1px solid var(--border)", fontSize: "12px", color: "#3B82F6", fontWeight: 600, textDecoration: "none" }}
            onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
            onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}>
            Browse all academies →
          </Link>
        </div>
      )}
    </div>
  );
}

// ── Mobile Search Overlay ─────────────────────────────────
function MobileSearchOverlay({ onClose }: { onClose: () => void }) {
  const [q, setQ] = useState("");
  const [results, setResults] = useState<{ name: string; href: string; color: string; domain: string }[]>([]);
  const inputRef = useRef<HTMLInputElement>(null);
  const searchIndex = useMemo(() => {
    const idx: { name: string; tags: string[]; description: string; href: string; color: string; domain: string; academy: string }[] = [];
    for (const a of academies) {
      for (const d of (a.domains || [])) {
        for (const t of (d.technologies || [])) {
          idx.push({ name: t.name, tags: t.tags || [], description: (t as any).description || "", href: `/academies/${a.slug}/${t.slug}`, color: a.color, domain: d.name, academy: a.title });
        }
      }
    }
    return idx;
  }, []);
  useEffect(() => {
    setTimeout(() => inputRef.current?.focus(), 100);
  }, []);
  useEffect(() => {
    if (!q.trim()) { setResults([]); return; }
    const lq = q.toLowerCase();
    setResults(searchIndex.filter(t => t.name.toLowerCase().includes(lq) || t.tags.some(tg => tg.toLowerCase().includes(lq)) || t.academy.toLowerCase().includes(lq) || t.domain.toLowerCase().includes(lq)).slice(0, 8).map(t => ({ name: t.name, href: t.href, color: t.color, domain: t.domain })));
  }, [q, searchIndex]);
  return (
    <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,0.6)", zIndex: 10000, display: "flex", flexDirection: "column", padding: "60px 16px 24px", backdropFilter: "blur(4px)" }} onClick={e => { if (e.target === e.currentTarget) onClose(); }}>
      <div style={{ background: "var(--bg-1)", borderRadius: "14px", overflow: "hidden", maxHeight: "70vh", display: "flex", flexDirection: "column" }}>
        <div style={{ display: "flex", gap: "10px", padding: "12px 14px", alignItems: "center", borderBottom: "1px solid var(--border)" }}>
          <Search size={16} color="var(--text-4)" />
          <input ref={inputRef} value={q} onChange={e => setQ(e.target.value)} placeholder="Search topics, exams, tools..." style={{ background: "none", border: "none", outline: "none", fontSize: "15px", color: "var(--text-1)", flex: 1, fontFamily: "inherit" }} />
          <button onClick={onClose} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-3)", padding: "4px", display: "flex" }}><X size={18} /></button>
        </div>
        <div style={{ overflowY: "auto" }}>
          {results.length > 0 ? results.map((r, i) => (
            <Link key={i} href={r.href} onClick={onClose} style={{ display: "flex", alignItems: "center", gap: "10px", padding: "12px 14px", textDecoration: "none", borderBottom: "1px solid var(--border)" }}
              onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-2)"}
              onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}>
              <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: r.color, flexShrink: 0 }} />
              <div>
                <div style={{ fontSize: "14px", fontWeight: 600, color: "var(--text-1)" }}>{r.name}</div>
                <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{r.domain}</div>
              </div>
              <span style={{ marginLeft: "auto", fontSize: "12px", color: r.color, fontWeight: 700 }}>→</span>
            </Link>
          )) : q ? (
            <div style={{ padding: "24px", textAlign: "center", color: "var(--text-4)", fontSize: "14px" }}>No results for &quot;{q}&quot;</div>
          ) : (
            <div style={{ padding: "24px", textAlign: "center", color: "var(--text-4)", fontSize: "14px" }}>Start typing to search…</div>
          )}
        </div>
      </div>
    </div>
  );
}

// ── Constants ─────────────────────────────────────────────
const NAV_LINKS = [
  { n: "Roadmaps", h: "/roadmaps" }, { n: "Academies", h: "/academies" }, { n: "Labs", h: "/labs" },
  { n: "Certifications", h: "/certifications" }, { n: "Interview", h: "/interview" }, { n: "PYQs", h: "/pyqs" },
  { n: "AI Assistant", h: "/ai-assistant" }, { n: "Career", h: "/career" },
];

// Dropdown groups — 4 semantically correct columns
const GROUPS = [
  {
    label: "Tech & Engineering", color: "#3B82F6", icon: "⚙️",
    slugs: ["devops", "cloud", "databases", "ai", "data", "security", "telecom"],
  },
  {
    label: "Education & Exams", color: "#F59E0B", icon: "🎓",
    slugs: ["education", "exams", "state-psc", "central-exams", "professional-certs"],
  },
  {
    label: "Health & Life Skills", color: "#F43F5E", icon: "🌿",
    slugs: ["healthcare", "essentials", "agriculture"],
  },
  {
    label: "Professional & Law", color: "#8B5CF6", icon: "🏛️",
    slugs: ["law", "finance", "economics"],
  },
];

// All 18 academies are now live — no coming-soon placeholder needed

// ── Main Navbar ───────────────────────────────────────────
export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const [searchOpen, setSearchOpen] = useState(false);
  const [expandedAcademy, setExpandedAcademy] = useState<string | null>(null);
  const [dropOpen, setDropOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  let dropTimer: ReturnType<typeof setTimeout>;

  useEffect(() => {
    const fn = () => setScrolled(window.scrollY > 40);
    window.addEventListener("scroll", fn, { passive: true });
    return () => window.removeEventListener("scroll", fn);
  }, []);

  useEffect(() => {
    if (typeof window === "undefined" || (window as any).__gtLoaded) return;
    (window as any).__gtLoaded = true;
    (window as any).googleTranslateElementInit = function () {
      try { new (window as any).google.translate.TranslateElement({ pageLanguage: "en", autoDisplay: false }, "google_translate_element"); } catch {}
    };
    const s = document.createElement("script");
    s.src = "//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";
    s.async = true; s.defer = true;
    document.head.appendChild(s);
  }, []);

  useEffect(() => {
    document.body.style.overflow = (mobileOpen || searchOpen) ? "hidden" : "";
    return () => { document.body.style.overflow = ""; };
  }, [mobileOpen, searchOpen]);

  // Close drawer on Escape
  useEffect(() => {
    const fn = (e: KeyboardEvent) => {
      if (e.key === "Escape") { setMobileOpen(false); setSearchOpen(false); setExpandedAcademy(null); setDropOpen(false); }
    };
    document.addEventListener("keydown", fn);
    return () => document.removeEventListener("keydown", fn);
  }, []);

  const academyMap = useMemo(() => Object.fromEntries(academies.map(a => [a.slug, a])), []);
  const closeDrawer = () => { setMobileOpen(false); setExpandedAcademy(null); };

  return (
    <>
      <header style={{ position: "fixed", top: 0, left: 0, right: 0, zIndex: 9999, background: "var(--bg-1)", backdropFilter: "blur(16px)", borderBottom: "1px solid var(--border)", boxShadow: scrolled ? "0 2px 20px rgba(0,0,0,0.12)" : "none", transition: "box-shadow 0.2s" }}>
        <div style={{ maxWidth: "1300px", margin: "0 auto", padding: "0 16px", height: "60px", display: "flex", alignItems: "center", gap: "6px" }}>
          <Link href="/" style={{ textDecoration: "none", flexShrink: 0, lineHeight: 0, marginRight: "4px" }}>
            <div className="logo-wrapper">
              <Image src="/logo-synfracore-full.png" alt="SynfraCore" width={160} height={24} priority
                className={scrolled ? "logo-full logo-scrolled-hide" : "logo-full"}
                style={{ height: "24px", width: "auto", display: scrolled ? "none" : "block" }} />
              <Image src="/logo-ac-mark.png" alt="AC" width={36} height={28} priority
                className={scrolled ? "logo-icon logo-scrolled-show" : "logo-icon"}
                style={{ height: "28px", width: "auto", display: scrolled ? "block" : "none" }} />
            </div>
          </Link>

          {/* Desktop nav */}
          <nav className="desktop-nav" style={{ display: "flex", alignItems: "center", flex: 1, gap: "1px" }}>
            <div onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }} onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 200); }} style={{ position: "relative" }}>
              <button style={{ display: "flex", alignItems: "center", gap: "3px", color: dropOpen ? "var(--text-1)" : "var(--text-3)", fontSize: "13px", fontWeight: 500, padding: "5px 9px", borderRadius: "7px", background: dropOpen ? "var(--bg-2)" : "none", border: "none", cursor: "pointer", fontFamily: "inherit" }}>
                Academies <ChevronDown size={11} style={{ transform: dropOpen ? "rotate(180deg)" : "none", transition: "transform 0.2s" }} />
              </button>
            </div>
            {NAV_LINKS.map(item => (
              <Link key={item.n} href={item.h} style={{ color: "var(--text-3)", fontSize: "13px", fontWeight: 500, padding: "5px 9px", borderRadius: "7px", textDecoration: "none", whiteSpace: "nowrap" }}
                onMouseEnter={e => { (e.target as HTMLElement).style.color = "var(--text-1)"; (e.target as HTMLElement).style.background = "var(--bg-2)"; }}
                onMouseLeave={e => { (e.target as HTMLElement).style.color = "var(--text-3)"; (e.target as HTMLElement).style.background = "transparent"; }}
              >{item.n}</Link>
            ))}
          </nav>

          {/* Right controls */}
          <div style={{ display: "flex", alignItems: "center", gap: "6px", flexShrink: 0, marginLeft: "auto" }}>
            <div className="desktop-nav"><SearchBox /></div>
            <LanguageSwitcher />
            <ThemeToggle />
            <Link href="/academies" className="desktop-nav btn-primary" style={{ padding: "6px 14px", fontSize: "13px", borderRadius: "7px", whiteSpace: "nowrap" }}>Start Learning</Link>
            {/* Mobile: search icon */}
            <button className="mobile-only" onClick={() => setSearchOpen(true)} aria-label="Search" style={{ background: "none", border: "1px solid var(--border)", cursor: "pointer", color: "var(--text-2)", padding: "6px 8px", display: "flex", borderRadius: "8px" }}>
              <Search size={18} />
            </button>
            {/* Mobile: hamburger — toggles on/off */}
            <button className="mobile-only"
              onClick={() => { if (mobileOpen) { closeDrawer(); } else { setMobileOpen(true); } }}
              aria-label={mobileOpen ? "Close menu" : "Open menu"}
              style={{ background: "none", border: "1px solid var(--border)", cursor: "pointer", color: "var(--text-2)", padding: "6px 8px", display: "flex", borderRadius: "8px" }}>
              {mobileOpen ? <X size={20} /> : <Menu size={20} />}
            </button>
          </div>
        </div>

        {/* Desktop mega dropdown — single unified grid */}
        {dropOpen && (
          <div onMouseEnter={() => { clearTimeout(dropTimer); setDropOpen(true); }} onMouseLeave={() => { dropTimer = setTimeout(() => setDropOpen(false), 200); }}
            style={{ position: "absolute", left: 0, right: 0, top: "100%", background: "var(--bg-2)", borderBottom: "2px solid var(--border)", boxShadow: "0 20px 50px rgba(0,0,0,0.18)", zIndex: 300, padding: "16px 32px 12px" }}>
            <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
              {/* 4 independent columns — each group owns its header + items */}
              <div style={{ display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: "0 20px" }}>
                {GROUPS.map(group => (
                  <div key={group.label}>
                    {/* Column header */}
                    <div style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: group.color, display: "flex", alignItems: "center", gap: "4px", marginBottom: "8px", paddingBottom: "6px", borderBottom: `1px solid ${group.color}30` }}>
                      <span>{group.icon}</span> {group.label}
                    </div>
                    {/* Items in this column */}
                    <div style={{ display: "flex", flexDirection: "column", gap: "1px" }}>
                      {group.slugs.map(slug => {
                        const a = academyMap[slug];
                        if (!a) return null;
                        return (
                          <Link key={a.slug} href={`/academies/${a.slug}`} onClick={() => setDropOpen(false)}
                            style={{ textDecoration: "none", padding: "5px 7px", borderRadius: "7px", display: "flex", alignItems: "center", gap: "7px" }}
                            onMouseEnter={e => { e.currentTarget.style.background = `${a.color}14`; }}
                            onMouseLeave={e => { e.currentTarget.style.background = "transparent"; }}>
                            <span style={{ fontSize: "13px", flexShrink: 0 }}>{a.icon}</span>
                            <div style={{ minWidth: 0 }}>
                              <div style={{ fontSize: "11px", fontWeight: 600, color: "var(--text-1)", lineHeight: 1.2, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>{a.title}</div>
                              <div style={{ fontSize: "9px", color: "var(--text-4)", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>{a.subtitle}</div>
                            </div>
                          </Link>
                        );
                      })}
                    </div>
                  </div>
                ))}
              </div>
              <div style={{ marginTop: "10px", paddingTop: "8px", borderTop: "1px solid var(--border)", display: "flex", justifyContent: "center" }}>
                <Link href="/academies" onClick={() => setDropOpen(false)} style={{ fontSize: "12px", fontWeight: 600, color: "#3B82F6", textDecoration: "none", padding: "5px 18px", background: "rgba(59,130,246,0.08)", borderRadius: "8px", border: "1px solid rgba(59,130,246,0.2)" }}>
                  View all {academies.length} academies →
                </Link>
              </div>
            </div>
          </div>
        )}
      </header>

      {/* Mobile search overlay */}
      {searchOpen && <MobileSearchOverlay onClose={() => setSearchOpen(false)} />}

      {/* Mobile backdrop */}
      {mobileOpen && (
        <div onClick={closeDrawer} style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,0.45)", zIndex: 9997, backdropFilter: "blur(2px)" }} />
      )}

      {/* Mobile slide-in drawer */}
      <div style={{ position: "fixed", top: 0, right: 0, bottom: 0, width: "min(300px, 88vw)", background: "var(--bg-1)", zIndex: 9998, transform: mobileOpen ? "translateX(0)" : "translateX(100%)", transition: "transform 0.28s cubic-bezier(0.4,0,0.2,1)", boxShadow: mobileOpen ? "-8px 0 40px rgba(0,0,0,0.2)" : "none", display: "flex", flexDirection: "column", overflowY: "auto", overflowX: "hidden" }}>
        <div style={{ position: "sticky", top: 0, zIndex: 2, display: "flex", alignItems: "center", justifyContent: "space-between", padding: "13px 14px", borderBottom: "1px solid var(--border)", background: "var(--bg-1)", flexShrink: 0 }}>
          <span style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)" }}>Navigation</span>
          <div style={{ display: "flex", gap: "8px", alignItems: "center" }}>
            <ThemeToggle />
            <button onClick={closeDrawer} aria-label="Close menu" style={{ background: "none", border: "1px solid var(--border)", cursor: "pointer", color: "var(--text-2)", padding: "5px", display: "flex", borderRadius: "7px" }}>
              <X size={16} />
            </button>
          </div>
        </div>

        {/* Mobile search — only visible inside drawer */}
        <div style={{ padding: "10px 12px", borderBottom: "1px solid var(--border)" }}>
          <SearchBox />
        </div>

        <div style={{ padding: "8px 12px 3px" }}>
          <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: 0 }}>Academies</p>
        </div>

        {academies.map(a => {
          const isExpanded = expandedAcademy === a.slug;
          const techs = a.domains.flatMap(d => d.technologies || []);
          return (
            <div key={a.slug} style={{ borderBottom: "1px solid var(--border)" }}>
              <button onClick={() => setExpandedAcademy(isExpanded ? null : a.slug)}
                style={{ width: "100%", display: "flex", alignItems: "center", gap: "10px", padding: "10px 12px", background: "none", border: "none", cursor: "pointer", textAlign: "left" }}>
                <span style={{ fontSize: "16px", width: "22px", textAlign: "center", flexShrink: 0 }}>{a.icon}</span>
                <div style={{ flex: 1, minWidth: 0, textAlign: "left" }}>
                  <div style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", lineHeight: 1.2 }}>{a.title}</div>
                  <div style={{ fontSize: "10px", color: a.color, marginTop: "1px", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{a.subtitle}</div>
                </div>
                {techs.length > 0 && <ChevronRight size={14} color="var(--text-4)" style={{ transform: isExpanded ? "rotate(90deg)" : "none", transition: "transform 0.18s", flexShrink: 0 }} />}
              </button>
              {isExpanded && techs.length > 0 && (
                <div style={{ background: "var(--bg-2)", paddingBottom: "4px" }}>
                  <Link href={`/academies/${a.slug}`} onClick={closeDrawer} style={{ display: "block", padding: "7px 12px 7px 44px", textDecoration: "none" }}
                    onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
                    onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}>
                    <span style={{ fontSize: "11px", fontWeight: 600, color: a.color }}>View all {a.title} →</span>
                  </Link>
                  {techs.slice(0, 10).map(tech => (
                    <Link key={tech.slug} href={`/academies/${a.slug}/${tech.slug}`} onClick={closeDrawer}
                      style={{ display: "flex", alignItems: "center", gap: "7px", padding: "6px 12px 6px 44px", textDecoration: "none" }}
                      onMouseEnter={e => (e.currentTarget as HTMLElement).style.background = "var(--bg-1)"}
                      onMouseLeave={e => (e.currentTarget as HTMLElement).style.background = "transparent"}>
                      <span style={{ fontSize: "11px" }}>{(tech as any).icon || "·"}</span>
                      <span style={{ fontSize: "12px", color: "var(--text-2)", fontWeight: 500 }}>{tech.name}</span>
                    </Link>
                  ))}
                  {techs.length > 10 && (
                    <Link href={`/academies/${a.slug}`} onClick={closeDrawer} style={{ display: "block", padding: "4px 12px 4px 44px", fontSize: "11px", color: "var(--text-4)", textDecoration: "none" }}>
                      + {techs.length - 10} more
                    </Link>
                  )}
                </div>
              )}
            </div>
          );
        })}

        <div style={{ padding: "8px 12px 3px", marginTop: "2px" }}>
          <p style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.1em", textTransform: "uppercase", color: "var(--text-4)", margin: 0 }}>Platform</p>
        </div>
        {NAV_LINKS.map(item => (
          <Link key={item.n} href={item.h} onClick={closeDrawer} style={{ display: "block", color: "var(--text-2)", fontSize: "13px", fontWeight: 500, padding: "10px 12px", borderBottom: "1px solid var(--border)", textDecoration: "none" }}>
            {item.n}
          </Link>
        ))}
        <div style={{ padding: "14px 12px 8px", flexShrink: 0, display: "flex", flexDirection: "column", gap: "8px" }}>
          <Link href="/academies" onClick={closeDrawer} className="btn-primary" style={{ display: "flex", justifyContent: "center", padding: "11px", fontSize: "13px", borderRadius: "8px" }}>
            Start Learning Free
          </Link>
          <Link href="/roadmaps" onClick={closeDrawer} style={{ display: "flex", justifyContent: "center", alignItems: "center", gap: "6px", padding: "10px", fontSize: "13px", borderRadius: "8px", textDecoration: "none", background: "var(--bg-2)", color: "var(--text-2)", border: "1px solid var(--border)", fontWeight: 600 }}>
            🗺️ Learning Roadmaps
          </Link>
        </div>
      </div>

      <style>{`
        .desktop-nav { display: flex; align-items: center; gap: 1px; }
        .mobile-only { display: none; }
        .logo-full { display: block; }
        .logo-icon { display: none; }
        @media (max-width: 1024px) {
          .desktop-nav { display: none !important; }
          .mobile-only { display: flex !important; }
          .logo-full { display: none !important; }
          .logo-icon { display: block !important; }
        }
        .logo-wrapper { display: inline-flex; align-items: center; }
        /* Light/dark mode: logos have transparent-friendly design */
        html.light .logo-full { opacity: 0.95; }
        html.light .logo-icon { opacity: 0.95; }
      `}</style>
    </>
  );
}
