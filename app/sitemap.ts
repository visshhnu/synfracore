import { MetadataRoute } from "next";

const BASE = "https://synfracore.com";

// ── Static pages ──────────────────────────────────────────────────────────
const staticPages = [
  { url: "/",              priority: 1.0, freq: "daily"   },
  { url: "/academies",     priority: 0.9, freq: "weekly"  },
  { url: "/roadmaps",      priority: 0.9, freq: "weekly"  },
  { url: "/certifications",priority: 0.8, freq: "weekly"  },
  { url: "/interview",     priority: 0.8, freq: "weekly"  },
  { url: "/pyqs",          priority: 0.8, freq: "weekly"  },
  { url: "/blog",          priority: 0.8, freq: "daily"   },
  { url: "/labs",          priority: 0.7, freq: "weekly"  },
  { url: "/projects",      priority: 0.7, freq: "weekly"  },
  { url: "/career",        priority: 0.7, freq: "weekly"  },
  { url: "/learn",         priority: 0.8, freq: "weekly"  },
  { url: "/search",        priority: 0.5, freq: "monthly" },
  { url: "/about",         priority: 0.5, freq: "monthly" },
  { url: "/contact",       priority: 0.4, freq: "monthly" },
];

// ── All 22 roadmap detail pages ───────────────────────────────────────────
const roadmapSlugs = [
  "devops-engineer", "cloud-architect", "platform-engineer", "ai-engineer",
  "data-analyst", "security-engineer", "database-engineer", "data-engineer",
  "sre-engineer", "healthcare-coder", "advocate-career", "judiciary-civil-judge",
  "upsc-ias", "banking-po", "state-psc-officer", "ca-journey",
  "banking-finance-analyst", "agricultural-officer", "telecom-engineer",
  "neet-medical", "jee-engineering", "personal-wellness",
];

// ── All 17 certification detail pages ────────────────────────────────────
const certIds = [
  "aws-ccp", "aws-saa", "aws-sap", "aws-dop",
  "az-900", "az-104", "az-305", "az-400",
  "kcna", "cka", "ckad", "cks",
  "terraform-associate", "rhcsa", "rhce",
  "comptia-sec-plus", "ceh",
];

// ── Academies + topics ────────────────────────────────────────────────────
// Tech academies (full section coverage)
const techTechs: Record<string, string[]> = {
  devops: [
    "linux", "shell-scripting", "git", "docker", "kubernetes", "helm",
    "jenkins", "argocd", "fluxcd", "terraform", "ansible", "prometheus",
    "grafana", "elk-stack", "nginx", "python", "openshift", "networking",
    "gitlab-ci", "github-actions", "azure-devops", "tekton", "kafka",
    "istio", "harbor", "keda", "datadog", "loki", "splunk", "ebpf",
    "platform-engineering", "devsecops", "ha-dr", "incident", "slo",
    "argo-rollouts",
  ],
  cloud: [
    "aws-ec2", "aws-s3", "aws-vpc", "aws-iam", "aws-rds", "aws-lambda",
    "aws-eks", "cloudformation", "route53", "cloud-fundamentals",
    "azure-entra", "azure-vms", "azure-vnets", "azure-aks", "azure-devops",
    "gke", "bigquery", "cloud-run", "cloud-security", "cost-optimization",
    "landing-zones", "multi-cloud",
  ],
  databases: [
    "postgresql", "redis", "mongodb", "mysql", "cassandra", "dynamodb",
    "elasticsearch", "sql", "oracle", "database-design", "performance-tuning",
  ],
  ai: [
    "ai-fundamentals", "prompt-engineering", "langchain", "rag",
    "ai-agents", "llmops", "openai", "llm-engineering",
  ],
  data: [
    "excel", "pandas", "power-bi", "tableau", "dbt", "airflow",
    "spark", "data-visualization", "dashboarding",
  ],
  security: [
    "security-fundamentals", "network-security", "ethical-hacking", "soc",
    "siem", "pen-testing", "incident-response", "cloud-security", "devsecops",
  ],
  infrastructure: [
    "networking", "kubernetes", "openshift", "platform-engineering", "ha-dr",
  ],
};

// Non-tech academies (use nonTechSections)
const nonTechTechs: Record<string, string[]> = {
  healthcare: [
    "icd-10-cm", "cpt", "hcpcs", "coding-guidelines", "home-health-coding",
    "patient-documentation", "healthcare-admin", "mock-exams", "medical-coding",
  ],
  law: [
    "legal-fundamentals", "constitutional-law", "clat-prep", "aibe-bar-exam",
    "judiciary-exams", "consumer-protection",
  ],
  finance: [
    "ca-cs-foundation", "ca-intermediate", "gst-taxation", "direct-tax",
    "accounting-basics", "banking-rbi", "sebi-nism", "financial-markets",
  ],
  economics: [
    "indian-economy", "micro-economics", "macro-economics",
    "budget-analysis", "rbi-monetary-policy", "international-trade",
  ],
  agriculture: [
    "organic-farming", "soil-science", "crop-science", "horticulture",
    "icar-ibps-afo", "agri-business",
  ],
  telecom: [
    "telecom-fundamentals", "fiber-optics", "wireless-tech",
    "networking-protocols", "bsnl-jto-prep", "telco",
  ],
  "state-psc": ["tnpsc", "kpsc", "mpsc", "appsc", "tspsc"],
  "central-exams": ["ctet-paper1", "ctet-paper2", "psu-technical", "nda-prep"],
  "professional-certs": ["pmp", "scrum", "itil", "six-sigma"],
  essentials: [
    "gut-health", "hygiene", "nutrition", "mental-health",
    "personal-finance", "first-aid", "digital-safety", "human-essentials",
    "sleep-health",
  ],
  exams: [
    "jee-maths", "jee-physics", "jee-chemistry",
    "neet-biology", "neet-physics", "neet-chemistry",
    "gate-cse", "gate-ece", "gate", "banking-exams", "banking-exam",
    "ssc-cgl", "ssc-exam", "rrb-ntpc", "upsc-prelims", "upsc-mains",
    "state-psc",
  ],
  education: [
    "dsa", "system-design", "os", "dbms", "cn", "maths", "science",
    "cs-school", "placement-prep", "java", "c-programming", "cpp",
  ],
};

// Section slugs for tech
const techSections = [
  "overview", "fundamentals", "intermediate", "advanced",
  "labs", "interview", "troubleshooting", "cheatsheets", "certification",
];

// Section slugs for non-tech
const nonTechSections = [
  "overview", "fundamentals", "intermediate", "advanced",
  "interview", "cheatsheets", "notes", "pyq", "faq",
];

// ── All 64 blog articles ──────────────────────────────────────────────────
const blogSlugs = [
  "docker-beginner-guide", "kubernetes-vs-docker-swarm", "terraform-aws-starter",
  "devops-salary-india-2025", "cka-exam-guide", "rag-beginner-guide",
  "ansible-playbook-guide", "postgresql-indexing-guide", "aws-cost-optimization",
  "kubernetes-troubleshooting", "how-to-learn-devops-2026",
  "devops-salary-india-2026", "openshift-vs-kubernetes-2026",
  "what-is-rag-2026", "gut-health-complete-guide-2026",
  "mental-health-tech-professionals-2026", "postgresql-vs-mysql-2026",
  "cybersecurity-roadmap-2026", "dsa-roadmap-2026", "aws-vs-azure-vs-gcp-2026",
  "work-life-balance-2026", "ansible-vs-terraform-2026",
  "personal-finance-india-2026", "terraform-best-practices-2026",
  "what-is-serverless-2026", "cloud-cost-optimization-2026",
  "aws-networking-vpc-2026", "gcp-bigquery-guide-2026",
  "langchain-tutorial-2026", "llmops-production-2026",
  "vector-databases-2026", "ai-engineering-roadmap-2026",
  "redis-use-cases-2026", "mongodb-beginners-2026",
  "elasticsearch-guide-2026", "sql-interview-questions-2026",
  "owasp-top-10-2026", "devsecops-guide-2026", "gate-cse-2026",
  "system-design-interview-2026", "java-interview-2026",
  "medical-coding-career-2026", "first-aid-basics-2026",
  "sleep-optimization-2026", "jee-preparation-2026",
  "jenkins-pipeline-tutorial-2026", "gitops-argocd-beginners-2026",
  "cka-exam-guide-2026", "monitoring-prometheus-grafana-2026",
  "ethical-hacking-roadmap-2026", "soc-analyst-guide-2026",
  "network-security-guide-2026", "nutrition-for-tech-2026",
  "exercise-for-desk-workers-2026", "digital-wellbeing-2026",
  "placement-prep-guide-2026", "cpp-beginners-2026",
  "os-concepts-interview-2026", "computer-networks-interview-2026",
  "neet-preparation-2026", "banking-exam-guide-2026",
  "upsc-prelims-strategy-2026", "icd10-coding-guide-2026",
  "medical-coding-interview-2026",
];

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date();
  const entries: MetadataRoute.Sitemap = [];

  // 1. Static pages
  staticPages.forEach(({ url, priority, freq }) => {
    entries.push({
      url: `${BASE}${url}`,
      lastModified: now,
      changeFrequency: freq as MetadataRoute.Sitemap[0]["changeFrequency"],
      priority,
    });
  });

  // 2. All 22 roadmap detail pages
  roadmapSlugs.forEach((slug) => {
    entries.push({
      url: `${BASE}/roadmaps/${slug}`,
      lastModified: now,
      changeFrequency: "monthly",
      priority: 0.8,
    });
  });

  // 3. All 17 certification detail pages
  certIds.forEach((id) => {
    entries.push({
      url: `${BASE}/certifications/${id}`,
      lastModified: now,
      changeFrequency: "monthly",
      priority: 0.75,
    });
  });

  // 4. Tech academy + topic + section pages
  Object.entries(techTechs).forEach(([academy, topics]) => {
    entries.push({
      url: `${BASE}/academies/${academy}`,
      lastModified: now,
      changeFrequency: "weekly",
      priority: 0.8,
    });
    topics.forEach((topic) => {
      entries.push({
        url: `${BASE}/academies/${academy}/${topic}`,
        lastModified: now,
        changeFrequency: "weekly",
        priority: 0.75,
      });
      techSections.forEach((sec) => {
        entries.push({
          url: `${BASE}/academies/${academy}/${topic}/${sec}`,
          lastModified: now,
          changeFrequency: "monthly",
          priority: 0.65,
        });
      });
    });
  });

  // 5. Non-tech academy + topic + section pages
  Object.entries(nonTechTechs).forEach(([academy, topics]) => {
    entries.push({
      url: `${BASE}/academies/${academy}`,
      lastModified: now,
      changeFrequency: "weekly",
      priority: 0.75,
    });
    topics.forEach((topic) => {
      entries.push({
        url: `${BASE}/academies/${academy}/${topic}`,
        lastModified: now,
        changeFrequency: "weekly",
        priority: 0.7,
      });
      nonTechSections.forEach((sec) => {
        entries.push({
          url: `${BASE}/academies/${academy}/${topic}/${sec}`,
          lastModified: now,
          changeFrequency: "monthly",
          priority: 0.6,
        });
      });
    });
  });

  // 6. All 64 blog posts
  blogSlugs.forEach((slug) => {
    entries.push({
      url: `${BASE}/blog/${slug}`,
      lastModified: now,
      changeFrequency: "monthly",
      priority: 0.7,
    });
  });

  return entries;
}
