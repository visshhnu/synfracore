import { socialLinks } from "@/lib/data/socialLinks";

// A slim bar above the main Navbar, showing SynfraCore's real social
// accounts — additive to Footer.tsx's existing icon row, not a
// replacement (footer icons stay). Server Component (no "use client" —
// both the resting brand color and the light-mode override use plain CSS
// below, not a theme hook), so this costs nothing extra in client JS,
// unlike Navbar.tsx or Footer.tsx. Fixed at the very top of the viewport
// (top: 0), with Navbar.tsx shifted down by this bar's own height (see
// TOP_UTILITY_BAR_HEIGHT, and its two other usages: app/layout.tsx's
// <main> padding and components/tech/MobileSectionNav.tsx's sticky offset
// — both previously assumed the Navbar alone occupied the top 64px of the
// viewport).
export const TOP_UTILITY_BAR_HEIGHT = 32;

export default function TopUtilityBar() {
  return (
    <div
      style={{
        position: "fixed",
        top: 0,
        left: 0,
        right: 0,
        // 9990: below Navbar's own header/drawer/overlay layers (9997-10000
        // — see Navbar.tsx), since this bar and the header sit adjacent
        // (top:0 vs top:32px), not stacked — only things that visually
        // overlap the bar (Navbar's full-screen mobile menu overlay,
        // zIndex:10000) need to paint above it.
        zIndex: 9990,
        height: `${TOP_UTILITY_BAR_HEIGHT}px`,
        display: "flex",
        alignItems: "center",
        justifyContent: "flex-end",
        gap: "16px",
        padding: "0 20px",
        background: "var(--bg-2)",
        borderBottom: "1px solid var(--border)",
      }}
    >
      {socialLinks.map((s) => (
        <a
          key={s.name}
          href={s.href}
          target="_blank"
          rel="noopener noreferrer"
          aria-label={s.name}
          title={s.name}
          className="utility-bar-icon"
          style={{
            display: "flex",
            ["--icon-color" as string]: s.color,
            ["--icon-color-light" as string]: s.lightColor ?? s.color,
          } as React.CSSProperties}
        >
          {s.icon}
        </a>
      ))}
      <style>{`
        .utility-bar-icon {
          color: var(--icon-color);
          opacity: 0.85;
          transition: opacity 0.15s;
        }
        html.light .utility-bar-icon { color: var(--icon-color-light); }
        .utility-bar-icon:hover { opacity: 1; }
        .utility-bar-icon svg { width: 14px; height: 14px; display: block; }
      `}</style>
    </div>
  );
}
