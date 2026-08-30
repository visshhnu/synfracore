import Link from "next/link";
import { getAcademy, getTechnology, type Domain } from "@/lib/data/academies";
import { getRelatedTechnologies } from "@/lib/data/relatedTechnologies";

// Internal-linking SEO component (2026-08-07 technical-SEO build — see
// docs/audit/07-roadmap-final.md's "New: Technical SEO" section). Extracted
// from the inline "Also in {domain.name}" block that used to live directly
// in app/academies/[academy]/[technology]/page.tsx.
//
// Lookup order:
//   1. Curated cross-domain/cross-academy relations from
//      lib/data/relatedTechnologies.ts, if this technology has any.
//   2. Fallback: same-domain siblings (the original behavior), unchanged,
//      so a technology with no curated entry yet still gets real links
//      rather than nothing.
//
// This means curated coverage can grow incrementally — a technology not yet
// in the curated map isn't a broken page, it just hasn't been upgraded past
// the fallback yet.

type Props = {
  academySlug: string;
  techSlug: string;
  domain?: Domain;
};

type LinkItem = {
  academy: string;
  slug: string;
  name: string;
  icon: string;
  crossAcademy: boolean;
};

export function RelatedTechnologies({ academySlug, techSlug, domain }: Props) {
  const curated = getRelatedTechnologies(academySlug, techSlug);

  let items: LinkItem[] = [];
  let heading = "Related Technologies";

  if (curated.length > 0) {
    items = curated
      .map((entry): LinkItem | null => {
        const tech = getTechnology(entry.academy, entry.technology);
        if (!tech) return null; // curated entry pointing at a slug that doesn't (or no longer) exists — skip rather than render a dead link
        return {
          academy: entry.academy,
          slug: entry.technology,
          name: tech.name,
          icon: tech.icon,
          crossAcademy: entry.academy !== academySlug,
        };
      })
      .filter((item): item is LinkItem => item !== null);
  } else if (domain) {
    heading = `Also in ${domain.name}`;
    items = domain.technologies
      .filter((t) => t.slug !== techSlug)
      .slice(0, 6)
      .map((t) => ({
        academy: academySlug,
        slug: t.slug,
        name: t.name,
        icon: t.icon,
        crossAcademy: false,
      }));
  }

  if (items.length === 0) return null;

  return (
    <div>
      <h3
        style={{
          fontFamily: "'Plus Jakarta Sans',sans-serif",
          fontWeight: 700,
          fontSize: "16px",
          marginBottom: "14px",
        }}
      >
        {heading}
      </h3>
      <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
        {items.map((item) => {
          const itemAcademy = item.crossAcademy ? getAcademy(item.academy) : undefined;
          return (
            <Link
              key={`${item.academy}/${item.slug}`}
              href={`/academies/${item.academy}/${item.slug}`}
              style={{ textDecoration: "none" }}
            >
              <div
                className="card-hover"
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "8px",
                  padding: "8px 14px",
                  borderRadius: "8px",
                  border: "1px solid var(--border)",
                  background: "var(--bg-1)",
                  fontSize: "13px",
                  fontWeight: 600,
                  color: "var(--text-2)",
                }}
              >
                <span>{item.icon}</span> {item.name}
                {item.crossAcademy && itemAcademy && (
                  <span
                    title={itemAcademy.title}
                    style={{
                      display: "inline-flex",
                      alignItems: "center",
                      gap: "3px",
                      fontSize: "12px",
                      fontWeight: 700,
                      padding: "2px 6px",
                      borderRadius: "10px",
                      background: itemAcademy.color + "20",
                      color: itemAcademy.color,
                    }}
                  >
                    {itemAcademy.icon} {itemAcademy.title}
                  </span>
                )}
              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
