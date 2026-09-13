// SynfraCore's real social accounts. LinkedIn/X/YouTube/GitHub/Telegram
// were independently verified live (2026-09-12/13) via
// github.com/synfracore's own self-declared profile links (a real, active
// account with matching bio/repos) listing these exact canonical URLs.
// Instagram and Facebook (added 2026-09-13) could NOT be verified the same
// way — GitHub's profile doesn't list either yet, and both platforms serve
// a generic, content-free shell to unauthenticated/non-JS requests (same
// wall hit earlier for X, which returned an outright 402) — a direct fetch
// only confirms HTTP 200 (not a 404), nothing about the profile content
// itself. These two are added on the account owner's direct confirmation
// that both are real, live @synfracore accounts, not independently
// re-verified content the way the other five were. WhatsApp is a direct
// click-to-chat link (wa.me/<number>) to a number the user gave directly,
// not a profile-existence check at all — different kind of "account" by
// nature, nothing to verify there either.
//
// This file is the single source of truth both Footer.tsx and
// TopUtilityBar.tsx render from, so a fabricated placeholder or a wrong
// color here would leak into both places at once — exactly why colors
// live here too, not duplicated per-component.
//
// `color` is the resting-state icon color for this site's DEFAULT theme
// (dark — no `.light` class on <html>, see app/globals.css's :root vs
// html.light split). `lightColor`, when present, overrides it for light
// mode — only needed for brand marks that are themselves theme-dependent
// (X and GitHub both officially flip between a black mark on light
// backgrounds and a white mark on dark ones; LinkedIn/YouTube/Telegram/
// WhatsApp have one fixed brand hue that works on either background, so
// they don't need one).
export type SocialLink = {
  name: string;
  href: string;
  icon: React.ReactNode;
  color: string;
  lightColor?: string;
};

export const socialLinks: SocialLink[] = [
  {
    name: "LinkedIn",
    href: "https://www.linkedin.com/company/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
      </svg>
    ),
    color: "#0077B5",
  },
  {
    // Confirmed live 2026-09-13: X's real brand mark is black-on-light /
    // white-on-dark, not the old Twitter blue (#1DA1F2) this used to be
    // hardcoded to — Twitter's 2023 rebrand dropped the blue entirely.
    name: "X",
    href: "https://x.com/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
      </svg>
    ),
    color: "#FFFFFF",
    lightColor: "#000000",
  },
  {
    name: "YouTube",
    href: "https://youtube.com/@synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
      </svg>
    ),
    color: "#FF0000",
  },
  {
    // GitHub's Octocat mark is the same theme-dependent black/white
    // pattern as X, per GitHub's own brand guidelines — was a plain gray
    // (#888) before, which isn't the real brand color in either theme.
    name: "GitHub",
    href: "https://github.com/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
      </svg>
    ),
    color: "#FFFFFF",
    lightColor: "#181717",
  },
  {
    name: "Telegram",
    href: "https://t.me/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z" />
      </svg>
    ),
    color: "#0088CC",
  },
  {
    // Instagram's real mark is a multi-stop gradient, not one flat hue —
    // approximating it as a single color would misrepresent the actual
    // brand mark the user specifically asked for. Uses an SVG
    // <linearGradient> fill instead of currentColor, unlike every other
    // icon here. This same icon element renders in up to 3 places on one
    // page at once (TopUtilityBar + Footer always together; +Contact on
    // that page) — the gradient <defs> id is technically duplicated across
    // those instances, which is invalid HTML, but every instance defines
    // identical stops, so the visual result is correct everywhere
    // regardless; not worth restructuring `icon` into a component (which
    // every consumer would then need to render differently) just to avoid
    // a harmless duplicate id.
    name: "Instagram",
    href: "https://www.instagram.com/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24">
        <defs>
          <linearGradient id="sc-instagram-gradient" x1="0%" y1="100%" x2="100%" y2="0%">
            <stop offset="0%" stopColor="#FEDA75" />
            <stop offset="30%" stopColor="#FA7E1E" />
            <stop offset="55%" stopColor="#D62976" />
            <stop offset="80%" stopColor="#962FBF" />
            <stop offset="100%" stopColor="#4F5BD5" />
          </linearGradient>
        </defs>
        <path
          fill="url(#sc-instagram-gradient)"
          d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.332.014 7.052.072 2.695.272.273 2.69.073 7.052.014 8.332 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.332 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.668-.072-4.948-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"
        />
      </svg>
    ),
    // No dark/light split — the gradient is the brand mark in both themes
    // (Instagram itself doesn't flip it), so color/lightColor aren't used
    // for the SVG fill. Kept as the gradient's dominant hue purely for
    // Contact page's background-tile tint (${color}18), which does need a
    // flat value.
    color: "#D62976",
  },
  {
    name: "Facebook",
    href: "https://www.facebook.com/synfracore",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
      </svg>
    ),
    color: "#1877F2",
  },
  {
    // wa.me click-to-chat — no WhatsApp Business account/app registration
    // needed, just the destination number in the URL, digits only (no "+",
    // no spaces), per WhatsApp's own link format.
    name: "WhatsApp",
    href: "https://wa.me/40373783860",
    icon: (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884M20.52 3.449C18.24 1.245 15.24 0 12.05 0 5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.423-8.452" />
      </svg>
    ),
    color: "#25D366",
  },
];
