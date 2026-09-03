import {
  siAnsible, siApacheairflow, siApachecassandra, siApachekafka, siApachespark,
  siArgo, siBackstage, siCilium, siCplusplus, siCss, siDatadog, siDocker,
  siElastic, siElasticsearch, siExpress, siFlux, siGit, siGithubactions,
  siGitlab, siGnubash, siGooglebigquery, siGooglecloud, siGrafana, siHarbor,
  siHelm, siHtml5, siIstio, siJavascript, siJenkins, siKubernetes,
  siLangchain, siLinux, siMongodb, siMysql, siNextdotjs, siNginx,
  siNodedotjs, siOpenapiinitiative, siOpenjdk, siOpentelemetry, siPandas,
  siPostgresql, siPrometheus, siPython, siReact, siRedhatopenshift, siRedis,
  siSonarqubeserver, siSplunk, siTekton, siTerraform, siTrivy, siTypescript,
  siVault,
} from "simple-icons";

// Real official brand logos, replacing generic emoji for technologies with a
// genuine, individually-confirmed match in simple-icons. Foundation phase
// (2026-09-01) shipped 3 entries (docker/kubernetes/terraform) as the
// approval-and-pattern-proof pass; this is the full rollout extending that
// pattern to every technology in lib/data/academies.ts (259 total) with a
// real brand-logo match — see docs/audit/13-brand-logo-rollout.md for the
// full record of how each entry below was verified, not assumed.
//
// Keyed by each technology's `slug` from lib/data/academies.ts (NOT by
// simple-icons' own `siXxx` export name) — callers already have the slug on
// hand from the same data they're already rendering, so this is the natural
// lookup key requiring zero new data plumbing.
//
// Every entry here was checked against simple-icons' actual exports
// directly (never assumed from a "the brand is famous, it must have an
// icon" guess) -- three categories of exclusion were found this way and are
// NOT bugs to eventually fix, they're permanent, confirmed absences:
//   - AWS and Microsoft Azure have NO entry in simple-icons at all (a real,
//     known trademark-related exclusion) -- neither the parent brand nor
//     any of their individual services (Lambda, EC2, S3, RDS, EKS, VPC,
//     IAM, AKS, VMs, VNets, Entra) have a matching icon. All of those
//     technology slugs stay on the emoji fallback indefinitely.
//   - KEDA and Loki have no distinct icon of their own in simple-icons --
//     showing Kubernetes' or Grafana's logo for them would misrepresent a
//     different project as those brands, so both were deliberately left
//     off rather than substituted.
//   - Generic "sql" (the query language, not a specific database product)
//     has no accurate brand icon -- MySQL's logo would misleadingly imply
//     the topic is MySQL-specific, so it stays emoji too.
// A few entries are the closest genuinely-real available match rather than
// a perfect one, noted inline where that's the case (OpenJDK for the "Java"
// slug, since Oracle's own Java coffee-cup mark has no simple-icons entry;
// OpenAPI Initiative for "REST API Design", the closest real brand adjacent
// to that general practice).
// AWS and Azure service-level icons — a SEPARATE registry, not folded into
// REGISTRY above, because these come from a different source with a
// genuinely different rendering contract. simple-icons ships a single SVG
// *path* per brand (a shape only) that this component recolors to the
// brand's hex on our own tinted backdrop; AWS's and Microsoft's official
// Architecture Icons ship complete, already-colored pictograms (AWS: a
// full-bleed solid-color square background baked into the file; Azure: a
// gradient/multi-color icon on a transparent canvas) — there is no "path"
// to extract and no hex to recolor with, and the compliance terms both
// vendors publish for these specific asset sets (Do's/Don'ts on each
// vendor's own architecture-icons page, 2026-09-03) explicitly prohibit
// exactly that: don't crop/distort/recolor, use the icons as provided.
// So these render as a plain <img> at a fixed size instead of the
// REGISTRY path/svg/fill treatment below.
//
// Deliberately scoped to ONLY the specific service-level technologies this
// platform already names in lib/data/academies.ts (aws-iam, aws-ec2,
// aws-vpc, aws-s3, aws-rds, aws-lambda, aws-eks, cloudformation, dynamodb,
// azure-entra, azure-vms, azure-vnets, azure-aks, azure-devops) — not the
// full ~1500-icon libraries either vendor publishes.
//
// The generic "aws" and "azure" parent/overview technology slugs are
// DELIBERATELY NOT included here, unlike every service-level slug above.
// Both vendors' Architecture Icons pages grant clear, on-page permission
// for the *service* icons specifically for diagrams/training/documentation
// use (our exact use case: a page teaching that one service). AWS's
// separate, broader Trademark Guidelines page states logo use beyond that
// "requires prior AWS approval" for the AWS brand mark itself, which is a
// meaningfully different, stricter standard than the Architecture Icons
// page's own terms — rather than judge which side of that line the
// generic "AWS Cloud" architecture-diagram icon falls on, both "aws" and
// "azure" (for symmetry, applying one consistent standard to both
// vendors) stay on the emoji fallback indefinitely, same as they do in
// REGISTRY's simple-icons world above. See
// docs/audit/13-brand-logo-rollout.md's Phase C record for the full
// sourcing/terms review.
const BRAND_ASSETS: Record<string, { src: string; title: string; bg?: string }> = {
  "aws-iam": { src: "/brand-assets/aws/iam.svg", title: "AWS IAM" },
  "aws-ec2": { src: "/brand-assets/aws/ec2.svg", title: "Amazon EC2" },
  "aws-vpc": { src: "/brand-assets/aws/vpc.svg", title: "Amazon VPC" },
  "aws-s3": { src: "/brand-assets/aws/s3.svg", title: "Amazon S3" },
  "aws-rds": { src: "/brand-assets/aws/rds.svg", title: "Amazon RDS" },
  "aws-lambda": { src: "/brand-assets/aws/lambda.svg", title: "AWS Lambda" },
  "aws-eks": { src: "/brand-assets/aws/eks.svg", title: "Amazon EKS" },
  cloudformation: { src: "/brand-assets/aws/cloudformation.svg", title: "AWS CloudFormation" },
  dynamodb: { src: "/brand-assets/aws/dynamodb.svg", title: "Amazon DynamoDB" },
  // Azure icons are transparent-canvas (no baked-in background the way
  // AWS's are), so they get a neutral, non-hue-derived backdrop (var(--bg-2),
  // the site's own standard card-background token, not a color pulled from
  // the icon) purely so they occupy a consistent slot size like every other
  // TechIcon — this is a container style choice, not a modification of the
  // icon file itself.
  "azure-entra": { src: "/brand-assets/azure/entra.svg", title: "Microsoft Entra ID", bg: "var(--bg-2)" },
  "azure-vms": { src: "/brand-assets/azure/vms.svg", title: "Azure Virtual Machines", bg: "var(--bg-2)" },
  "azure-vnets": { src: "/brand-assets/azure/vnets.svg", title: "Azure Virtual Networks", bg: "var(--bg-2)" },
  "azure-aks": { src: "/brand-assets/azure/aks.svg", title: "Azure Kubernetes Service", bg: "var(--bg-2)" },
  "azure-devops": { src: "/brand-assets/azure/devops.svg", title: "Azure DevOps", bg: "var(--bg-2)" },
};

const REGISTRY: Record<string, { path: string; hex: string; title: string }> = {
  airflow: siApacheairflow,
  ansible: siAnsible,
  argocd: siArgo,
  backstage: siBackstage,
  bigquery: siGooglebigquery,
  cassandra: siApachecassandra,
  "cloud-run": siGooglecloud,
  cpp: siCplusplus,
  css: siCss,
  datadog: siDatadog,
  docker: siDocker,
  ebpf: siCilium, // technology is named "eBPF & Cilium" -- Cilium has a real icon, eBPF itself (a kernel technology, not a branded product) does not
  elasticsearch: siElasticsearch,
  "elk-stack": siElastic,
  express: siExpress,
  fluxcd: siFlux,
  git: siGit,
  "github-actions": siGithubactions,
  "gitlab-ci": siGitlab,
  gke: siGooglecloud,
  grafana: siGrafana,
  harbor: siHarbor,
  helm: siHelm,
  html: siHtml5,
  istio: siIstio,
  java: siOpenjdk, // closest real match -- Oracle's own Java mark has no simple-icons entry
  javascript: siJavascript,
  jenkins: siJenkins,
  kafka: siApachekafka,
  kubernetes: siKubernetes,
  langchain: siLangchain,
  linux: siLinux,
  loki: siOpentelemetry, // technology is named "Loki + OpenTelemetry" -- OpenTelemetry has a real icon, Loki itself (Grafana Labs product) does not
  mongodb: siMongodb,
  mysql: siMysql,
  nextjs: siNextdotjs,
  nginx: siNginx,
  nodejs: siNodedotjs,
  openshift: siRedhatopenshift,
  pandas: siPandas,
  postgresql: siPostgresql,
  prometheus: siPrometheus,
  python: siPython,
  react: siReact,
  redis: siRedis,
  "rest-api-design": siOpenapiinitiative, // closest real match -- no generic "REST API" brand exists
  "shell-scripting": siGnubash,
  sonarqube: siSonarqubeserver, // closest real match -- simple-icons split SonarQube into 3 sub-product icons (Server/Cloud/IDE) post-rebrand, no single generic "SonarQube" icon exists; Server is the classic/most recognizable of the three
  spark: siApachespark,
  splunk: siSplunk,
  tekton: siTekton,
  terraform: siTerraform,
  trivy: siTrivy,
  typescript: siTypescript,
  vault: siVault,
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
  const brandAsset = BRAND_ASSETS[slug];
  if (brandAsset) {
    return (
      <span
        style={{
          display: "inline-flex",
          alignItems: "center",
          justifyContent: "center",
          width: size,
          height: size,
          borderRadius: size * 0.28,
          overflow: "hidden",
          background: brandAsset.bg,
          flexShrink: 0,
        }}
      >
        {/* eslint-disable-next-line @next/next/no-img-element -- these are
            fixed local static assets (public/brand-assets/), not
            user/CMS-driven images, so next/image's remote-optimization
            pipeline buys nothing here; a plain <img> avoids pulling every
            size variant through the image loader for a handful of fixed
            SVGs. */}
        <img
          src={brandAsset.src}
          alt={brandAsset.title}
          width={size}
          height={size}
          style={{ width: "100%", height: "100%", objectFit: "contain" }}
        />
      </span>
    );
  }

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
