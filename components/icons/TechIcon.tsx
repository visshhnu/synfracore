import { siDocker, siKubernetes, siTerraform } from "simple-icons";

// Real official brand logos, replacing generic emoji for a small, deliberately
// curated set of technologies — foundation phase only (2026-09-01). Docker/
// Kubernetes/AWS were originally kept as emoji specifically because pulling
// real logos required simple-icons as a new dependency that wasn't approved
// at the time; this component is that approval, scoped narrowly. See
// docs/audit/13-brand-logo-rollout.md for the full ~60-90-icon future
// rollout this deliberately does NOT attempt yet — REGISTRY below is meant
// to stay this small until that rollout actually happens, not silently grow.
//
// Keyed by each technology's `slug` from lib/data/academies.ts (NOT by
// simple-icons' own `siXxx` export name) — callers already have the slug on
// hand from the same data they're already rendering, so this is the natural
// lookup key requiring zero new data plumbing.
//
// IMPORTANT, confirmed by direct inspection of simple-icons 16.29.0's
// exports (not assumed): AWS and Microsoft Azure have NO entry in
// simple-icons at all — a real, known trademark-related exclusion, not a
// naming mismatch to work around. Both platform's `aws`/`azure` technology
// slugs are therefore intentionally absent from REGISTRY and will keep
// rendering their existing emoji indefinitely via the fallback path below,
// not merely until someone gets around to adding them.
const REGISTRY: Record<string, { path: string; hex: string; title: string }> = {
  docker: siDocker,
  kubernetes: siKubernetes,
  terraform: siTerraform,
};

type Props = {
  // Technology slug (lib/data/academies.ts) to look up in REGISTRY.
  slug: string;
  // The technology's existing emoji (tech.icon) — rendered as-is, completely
  // unchanged, whenever `slug` has no REGISTRY entry. This is the entire
  // graceful-fallback contract: a technology with no real logo yet must
  // look EXACTLY like it did before this component existed, not like a
  // broken or placeholder icon.
  fallback: string;
  // Pixel size of the rendered mark (both the real-logo backdrop circle and
  // the emoji fallback share this so swapping one technology's REGISTRY
  // membership in the future doesn't shift surrounding layout).
  size?: number;
};

// Real-logo path renders the brand's own canonical hex (simple-icons'
// `icon.hex`) as the SVG fill, on a low-opacity same-color backdrop circle —
// deliberately NOT a fixed light-mode/dark-mode color pair per brand, which
// would need per-icon theme logic to get right and to keep right as more
// icons are added later. A colored mark on its own same-hue tinted backdrop
// carries its own contrast with it regardless of the surrounding page
// background, which is what actually makes this theme-safe (verified
// directly against both themes for all 3 registered icons before this
// component was considered done — see the rollout tracker for the record).
export default function TechIcon({ slug, fallback, size = 32 }: Props) {
  const icon = REGISTRY[slug];

  if (!icon) {
    return (
      <span style={{ fontSize: size, lineHeight: 1, display: "inline-block" }}>
        {fallback}
      </span>
    );
  }

  const hex = `#${icon.hex}`;
  return (
    <span
      style={{
        display: "inline-flex",
        alignItems: "center",
        justifyContent: "center",
        width: size,
        height: size,
        borderRadius: size * 0.28,
        background: `${hex}1A`,
        flexShrink: 0,
      }}
    >
      <svg
        role="img"
        viewBox="0 0 24 24"
        width={size * 0.6}
        height={size * 0.6}
        fill={hex}
        aria-label={icon.title}
      >
        <title>{icon.title}</title>
        <path d={icon.path} />
      </svg>
    </span>
  );
}
