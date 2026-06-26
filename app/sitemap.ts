import { MetadataRoute } from "next";
export const runtime = "edge";

const BASE = "https://synfracore.com";

const staticPages = [
  { url: "/", priority: 1.0, freq: "daily" },
  { url: "/academies", priority: 0.95, freq: "daily" },
  { url: "/roadmaps", priority: 0.9, freq: "weekly" },
  { url: "/labs", priority: 0.85, freq: "weekly" },
  { url: "/certifications", priority: 0.85, freq: "weekly" },
  { url: "/interview", priority: 0.85, freq: "weekly" },
  { url: "/search", priority: 0.8, freq: "daily" },
  { url: "/career", priority: 0.75, freq: "weekly" },
  { url: "/ai-assistant", priority: 0.8, freq: "weekly" },
  { url: "/blog", priority: 0.8, freq: "daily" },
  { url: "/projects", priority: 0.75, freq: "weekly" },
  { url: "/community", priority: 0.6, freq: "weekly" },
  { url: "/about", priority: 0.5, freq: "monthly" },
  { url: "/contact", priority: 0.4, freq: "monthly" },
  // Roadmaps
  { url: "/roadmaps/devops-engineer", priority: 0.85, freq: "monthly" },
  { url: "/roadmaps/cloud-architect", priority: 0.85, freq: "monthly" },
  { url: "/roadmaps/platform-engineer", priority: 0.85, freq: "monthly" },
  { url: "/roadmaps/ai-engineer", priority: 0.85, freq: "monthly" },
  { url: "/roadmaps/data-analyst", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/security-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/database-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/sre-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/healthcare-coder", priority: 0.75, freq: "monthly" },
  { url: "/roadmaps/data-engineer", priority: 0.8, freq: "monthly" },
];

const blogSlugs = [
  "docker-beginner-guide", "kubernetes-vs-docker-swarm", "terraform-aws-starter",
  "devops-salary-india-2025", "cka-exam-guide", "rag-beginner-guide",
  "ansible-playbook-guide", "postgresql-indexing-guide", "aws-cost-optimization",
  "kubernetes-troubleshooting", "linux-commands-devops", "github-actions-tutorial",
];

// All 18 academies with every technology topic slug
const allTechs: Record<string, string[]> = {
  "agriculture": ["organic-farming", "soil-science", "horticulture", "agri-business"],
  "ai": ["ai-fundamentals", "prompt-engineering", "langchain", "rag", "ai-agents", "llmops", "openai"],
  "central-exams": ["ctet-paper1", "ctet-paper2", "psu-technical", "nda-prep"],
  "cloud": ["aws-iam", "aws-ec2", "aws-vpc", "aws-s3", "aws-rds", "aws-lambda", "aws-eks", "cloudformation", "route53", "azure-entra", "azure-vms", "azure-vnets", "azure-aks", "azure-devops", "gke", "bigquery", "cloud-run", "cloud-security", "cost-optimization", "landing-zones"],
  "data": ["excel", "pandas", "power-bi", "tableau", "sql"],
  "databases": ["postgresql", "mysql", "sql", "oracle", "mongodb", "cassandra", "dynamodb", "redis", "elasticsearch"],
  "devops": ["linux", "networking", "shell-scripting", "docker", "kubernetes", "helm", "git", "jenkins", "argocd", "terraform", "ansible", "prometheus", "grafana", "elk-stack", "python", "nginx", "openshift"],
  "economics": ["micro-economics", "macro-economics", "indian-economy", "international-trade"],
  "education": ["maths", "science", "cs-school", "dsa", "os", "dbms", "cn", "system-design", "placement-prep", "java", "c-programming", "cpp"],
  "essentials": ["gut-health", "hygiene", "nutrition", "mental-health", "personal-finance", "first-aid"],
  "exams": ["neet-biology", "neet-physics", "neet-chemistry", "jee-maths", "jee-physics", "jee-chemistry", "gate-cse", "gate-ece", "banking-exams", "ssc-cgl", "rrb-ntpc", "upsc-prelims", "upsc-mains"],
  "finance": ["accounting-basics", "gst-taxation", "direct-tax", "financial-markets", "ca-cs-foundation"],
  "healthcare": ["icd-10-cm", "cpt", "hcpcs", "coding-guidelines", "mock-exams", "home-health-coding", "patient-documentation", "bchhc-prep", "healthcare-admin"],
  "law": ["legal-fundamentals", "constitutional-law", "clat-prep", "consumer-protection"],
  "professional-certs": ["pmp", "itil", "scrum", "six-sigma"],
  "security": ["security-fundamentals", "network-security", "ethical-hacking", "soc", "siem"],
  "state-psc": ["tnpsc", "kpsc", "mpsc", "appsc", "tspsc"],
  "telecom": ["telecom-fundamentals", "wireless-tech", "fiber-optics", "networking-protocols"]
};

// Tech academies use full 14-section list; non-tech use 8 relevant sections
const techAcademyIds = new Set(["devops","cloud","databases","ai","data","security","infrastructure","monitoring"]);

const techSections = [
  "overview","fundamentals","intermediate","advanced","roadmap",
  "labs","projects","interview","certification","cheatsheets",
  "troubleshooting","notes","real-world-scenarios","faq",
];

const nonTechSections = [
  "overview","fundamentals","intermediate","advanced","notes","cheatsheets","interview","faq",
];

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date();
  const entries: MetadataRoute.Sitemap = [];

  // Static pages
  staticPages.forEach(({ url, priority, freq }) => {
    entries.push({ url: `${BASE}${url}`, lastModified: now, changeFrequency: freq as MetadataRoute.Sitemap[0]["changeFrequency"], priority });
  });

  // Blog
  blogSlugs.forEach(slug => {
    entries.push({ url: `${BASE}/blog/${slug}`, lastModified: now, changeFrequency: "monthly", priority: 0.7 });
  });

  // All 18 academy pages + topic pages + section pages
  Object.entries(allTechs).forEach(([academy, techs]) => {
    const isNonTech = !techAcademyIds.has(academy);
    const sections = isNonTech ? nonTechSections : techSections;

    // Academy index page
    entries.push({ url: `${BASE}/academies/${academy}`, lastModified: now, changeFrequency: "weekly", priority: 0.85 });

    techs.forEach(tech => {
      // Topic landing page
      entries.push({ url: `${BASE}/academies/${academy}/${tech}`, lastModified: now, changeFrequency: "weekly", priority: 0.8 });
      // All section pages
      sections.forEach(sec => {
        entries.push({ url: `${BASE}/academies/${academy}/${tech}/${sec}`, lastModified: now, changeFrequency: "monthly", priority: isNonTech ? 0.6 : 0.65 });
      });
    });
  });

  return entries;
}
