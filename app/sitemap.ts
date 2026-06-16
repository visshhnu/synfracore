import { MetadataRoute } from "next";

const BASE = "https://synfracore.com";

const staticPages = [
  { url: "/", priority: 1.0, freq: "daily" },
  { url: "/academies", priority: 0.9, freq: "weekly" },
  { url: "/roadmaps", priority: 0.9, freq: "weekly" },
  { url: "/labs", priority: 0.8, freq: "weekly" },
  { url: "/blog", priority: 0.8, freq: "daily" },
  { url: "/projects", priority: 0.7, freq: "weekly" },
  { url: "/certifications", priority: 0.7, freq: "weekly" },
  { url: "/interview", priority: 0.8, freq: "weekly" },
  { url: "/community", priority: 0.6, freq: "weekly" },
  { url: "/about", priority: 0.5, freq: "monthly" },
  { url: "/contact", priority: 0.5, freq: "monthly" },
  { url: "/roadmaps/devops-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/cloud-architect", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/platform-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/ai-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/data-analyst", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/security-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/database-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/sre-engineer", priority: 0.8, freq: "monthly" },
  { url: "/roadmaps/healthcare-coder", priority: 0.7, freq: "monthly" },
  { url: "/roadmaps/data-engineer", priority: 0.8, freq: "monthly" },
];

const academies = [
  "devops", "cloud", "databases", "ai", "data", "security",
  "healthcare", "essentials", "education", "exams",
];

const techs: Record<string, string[]> = {
  devops: ["linux", "networking", "shell-scripting", "git", "docker", "kubernetes", "helm", "jenkins", "argocd", "terraform", "ansible", "prometheus", "grafana", "elk-stack", "nginx", "python", "openshift"],
  cloud: ["aws-ec2", "aws-s3", "aws-vpc", "aws-iam", "aws-rds", "aws-lambda", "aws-eks", "cloudformation", "route53", "azure-entra", "azure-vms", "azure-vnets", "azure-aks", "azure-devops", "gke", "bigquery", "cloud-run", "cloud-security", "cost-optimization", "landing-zones"],
  databases: ["postgresql", "redis", "mongodb", "mysql", "cassandra", "dynamodb", "elasticsearch", "sql", "oracle"],
  ai: ["ai-fundamentals", "prompt-engineering", "langchain", "rag", "ai-agents", "llmops", "openai"],
  data: ["excel", "pandas", "power-bi", "tableau"],
  security: ["security-fundamentals", "network-security", "ethical-hacking", "soc", "siem", "pen-testing"],
  healthcare: ["icd-10-cm", "cpt", "hcpcs", "coding-guidelines", "mock-exams", "home-health-coding", "patient-documentation", "healthcare-admin"],
  essentials: ["gut-health", "hygiene", "nutrition", "mental-health", "personal-finance", "first-aid"],
  education: ["dsa", "system-design", "os", "dbms", "cn", "maths", "science", "cs-school", "placement-prep", "java", "c-programming", "cpp"],
  exams: ["jee-maths", "jee-physics", "jee-chemistry", "neet-biology", "neet-physics", "neet-chemistry", "gate-cse", "gate-ece", "banking-exams", "ssc-cgl", "rrb-ntpc", "upsc-prelims", "upsc-mains"],
};

const sections = [
  "overview", "fundamentals", "intermediate", "advanced",
  "labs", "projects", "interview", "certification", "cheatsheets",
  "troubleshooting", "roadmap",
];

const blogSlugs = [
  "docker-beginner-guide",
  "kubernetes-vs-docker-swarm",
  "terraform-aws-starter",
  "devops-salary-india-2025",
  "cka-exam-guide",
  "rag-beginner-guide",
  "ansible-playbook-guide",
  "postgresql-indexing-guide",
  "aws-cost-optimization",
  "kubernetes-troubleshooting",
];

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date();
  const entries: MetadataRoute.Sitemap = [];

  // Static pages
  staticPages.forEach(({ url, priority, freq }) => {
    entries.push({
      url: `${BASE}${url}`,
      lastModified: now,
      changeFrequency: freq as MetadataRoute.Sitemap[0]["changeFrequency"],
      priority,
    });
  });

  // Blog posts
  blogSlugs.forEach((slug) => {
    entries.push({
      url: `${BASE}/blog/${slug}`,
      lastModified: now,
      changeFrequency: "monthly",
      priority: 0.7,
    });
  });

  // Academy index pages
  academies.forEach((a) => {
    entries.push({
      url: `${BASE}/academies/${a}`,
      lastModified: now,
      changeFrequency: "weekly",
      priority: 0.8,
    });

    (techs[a] || []).forEach((tech) => {
      // Tech overview page
      entries.push({
        url: `${BASE}/academies/${a}/${tech}`,
        lastModified: now,
        changeFrequency: "weekly",
        priority: 0.75,
      });

      // Section pages — highest priority for content
      sections.forEach((sec) => {
        entries.push({
          url: `${BASE}/academies/${a}/${tech}/${sec}`,
          lastModified: now,
          changeFrequency: "monthly",
          priority: 0.65,
        });
      });
    });
  });

  return entries;
}
