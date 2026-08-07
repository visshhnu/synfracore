// Curated "related technologies" map for internal-linking SEO (technical-SEO
// audit, 2026-08-07 — see docs/audit/07-roadmap-final.md's "New: Technical
// SEO" section). Deliberately hand-curated, not derived from `tags`: tag
// overlap on its own is noisy (kubernetes/helm/istio/argocd/openshift all
// share "K8s", which would over-link nearly the whole ecosystem to itself).
//
// Keyed by `${academy}/${technology}` so an entry can point cross-academy
// (e.g. a cloud technology relating to a DevOps IaC tool) without any schema
// change — RelatedTechEntry doesn't assume same-academy.
//
// Coverage is intentionally partial (16 seeded technologies, DevOps/Cloud
// hubs first, as the highest-traffic starting slice) — RelatedTechnologies.tsx
// falls back to the existing same-domain sibling logic for any technology
// with no entry here, so every page still gets *something* while this list
// grows incrementally. Not exhaustive; extend as more technologies are added
// or as traffic/content data suggests better pairings.

export type RelatedTechEntry = { academy: string; technology: string };

export const RELATED_TECHNOLOGIES: Record<string, RelatedTechEntry[]> = {
  "devops/kubernetes": [
    { academy: "devops", technology: "helm" },
    { academy: "devops", technology: "argocd" },
    { academy: "devops", technology: "istio" },
    { academy: "devops", technology: "docker" },
    { academy: "devops", technology: "prometheus" },
  ],
  "devops/docker": [
    { academy: "devops", technology: "kubernetes" },
    { academy: "devops", technology: "cicd" },
  ],
  "devops/helm": [
    { academy: "devops", technology: "kubernetes" },
    { academy: "devops", technology: "argocd" },
  ],
  "devops/istio": [
    { academy: "devops", technology: "kubernetes" },
    { academy: "devops", technology: "prometheus" },
    { academy: "devops", technology: "grafana" },
  ],
  "devops/argocd": [
    { academy: "devops", technology: "kubernetes" },
    { academy: "devops", technology: "helm" },
    { academy: "devops", technology: "cicd" },
  ],
  "devops/cicd": [
    { academy: "devops", technology: "jenkins" },
    { academy: "devops", technology: "argocd" },
    { academy: "devops", technology: "docker" },
  ],
  "devops/jenkins": [
    { academy: "devops", technology: "cicd" },
    { academy: "devops", technology: "terraform" },
  ],
  "devops/terraform": [
    { academy: "devops", technology: "ansible" },
    { academy: "devops", technology: "jenkins" },
  ],
  "devops/ansible": [
    { academy: "devops", technology: "terraform" },
  ],
  "devops/prometheus": [
    { academy: "devops", technology: "grafana" },
    { academy: "devops", technology: "kubernetes" },
    { academy: "devops", technology: "istio" },
  ],
  "devops/grafana": [
    { academy: "devops", technology: "prometheus" },
  ],
  "devops/openshift": [
    { academy: "devops", technology: "kubernetes" },
    { academy: "devops", technology: "helm" },
  ],
  "devops/kafka": [
    { academy: "devops", technology: "prometheus" },
  ],
  "cloud/aws": [
    { academy: "devops", technology: "terraform" },
  ],
  "cloud/azure": [
    { academy: "devops", technology: "terraform" },
  ],
  "cloud/gcp": [
    { academy: "devops", technology: "terraform" },
  ],
};

export function getRelatedTechnologies(academySlug: string, techSlug: string): RelatedTechEntry[] {
  return RELATED_TECHNOLOGIES[`${academySlug}/${techSlug}`] ?? [];
}
