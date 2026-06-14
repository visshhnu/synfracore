import { MetadataRoute } from "next";

const BASE = "https://synfracore.com";

const staticPages = [
  "/", "/academies", "/roadmaps", "/labs", "/projects", "/certifications",
  "/interview", "/troubleshooting", "/career", "/ai-assistant", "/blog",
  "/about", "/contact", "/community",
  "/roadmaps/devops-engineer", "/roadmaps/cloud-architect", "/roadmaps/platform-engineer",
  "/roadmaps/ai-engineer", "/roadmaps/data-analyst", "/roadmaps/security-engineer",
];

const academies = [
  "devops", "cloud", "databases", "ai", "data", "security",
  "healthcare", "essentials", "education", "exams",
];

const techs: Record<string, string[]> = {
  devops: ["linux", "networking", "shell-scripting", "git", "docker", "kubernetes", "helm", "jenkins", "argocd", "terraform", "ansible", "prometheus", "grafana", "elk-stack", "nginx", "python"],
  cloud: ["aws-ec2", "aws-s3", "aws-vpc", "aws-iam", "aws-rds", "aws-lambda", "aws-eks", "cloudformation", "route53", "azure-entra", "azure-vms", "azure-vnets", "azure-aks", "azure-devops", "gke", "bigquery", "cloud-run", "cloud-security", "cost-optimization", "landing-zones"],
  databases: ["postgresql", "redis", "mongodb", "mysql", "cassandra", "dynamodb", "elasticsearch", "sql", "oracle"],
  ai: ["ai-fundamentals", "prompt-engineering", "langchain", "rag", "ai-agents", "llmops", "openai"],
  data: ["excel", "pandas", "power-bi", "tableau"],
  security: ["security-fundamentals", "network-security", "ethical-hacking", "soc", "siem"],
  healthcare: ["icd-10-cm", "cpt", "hcpcs", "coding-guidelines", "mock-exams", "home-health-coding", "patient-documentation", "healthcare-admin"],
  essentials: ["gut-health", "hygiene", "nutrition", "mental-health", "personal-finance", "first-aid"],
  education: ["dsa", "system-design", "os", "dbms", "cn", "maths", "science", "cs-school", "placement-prep", "java", "c-programming", "cpp"],
  exams: ["jee-maths", "jee-physics", "jee-chemistry", "neet-biology", "neet-physics", "neet-chemistry", "gate-cse", "gate-ece", "banking-exams", "ssc-cgl", "rrb-ntpc", "upsc-prelims", "upsc-mains"],
};

const sections = ["overview", "fundamentals", "intermediate", "advanced", "labs", "projects", "interview", "certification", "cheatsheets"];

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date();
  const entries: MetadataRoute.Sitemap = staticPages.map((url) => ({
    url: `${BASE}${url}`,
    lastModified: now,
    changeFrequency: url === "/" ? "daily" : "weekly",
    priority: url === "/" ? 1.0 : url.startsWith("/academies") || url.startsWith("/roadmaps") ? 0.9 : 0.7,
  }));

  // Academy index pages
  academies.forEach((a) => {
    entries.push({ url: `${BASE}/academies/${a}`, lastModified: now, changeFrequency: "weekly", priority: 0.8 });
    (techs[a] || []).forEach((tech) => {
      entries.push({ url: `${BASE}/academies/${a}/${tech}`, lastModified: now, changeFrequency: "monthly", priority: 0.7 });
      sections.forEach((sec) => {
        entries.push({ url: `${BASE}/academies/${a}/${tech}/${sec}`, lastModified: now, changeFrequency: "monthly", priority: 0.6 });
      });
    });
  });

  return entries;
}
