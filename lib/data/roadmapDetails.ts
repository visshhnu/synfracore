// Single source of truth for roadmap detail pages (/roadmaps/[slug]).
// techLinks are cross-checked against lib/data/academies.ts's getTechnology() —
// see scripts/validate-roadmaps.ts, which fails the build if any entry here
// doesn't resolve to a real registered Technology.
export type RoadmapTechLink = {
  name: string;
  academy: string;
  slug: string;
  // Optional section override — defaults to "overview" if omitted.
  section?: string;
};

export type RoadmapDetail = {
  description: string;
  whyChoose: string;
  skills: string[];
  techLinks: RoadmapTechLink[];
  // New merged shape (Phase 3.6) — the actual source of truth going
  // forward. techLinks[] above is kept only for the transition window;
  // see docs/audit/06-roadmap.md 3.6.
  //
  // `fork` (optional, added 2026-09-03 for the roadmap-tree-redesign pilot
  // — see docs/audit/14-roadmap-tree-redesign.md) marks a step as a genuine
  // branch point: `techLink` above stays required and points at SOME
  // branch (usually the recommended one, when one exists — so
  // scripts/validate-roadmaps.ts's strict 1:1 techLinks/steps positional
  // matching keeps working completely unchanged for every roadmap, forked
  // or not — this field is additive, not a replacement for the existing
  // shape). `branches` lists every option INCLUDING whichever one
  // `techLink` points at (the renderer needs the full set to lay out the
  // fork visually). `recommendedSlug` is OPTIONAL (added 2026-09-04) —
  // most forks have a genuine technical reason to suggest a default (AWS
  // has real practice-exam papers already, GitHub Actions has the largest
  // market share), but some forks are a purely personal choice with no
  // technically-better option (e.g. which state's PSC you're targeting) —
  // forcing a "Recommended" badge onto an arbitrary branch in that case
  // would misrepresent it as a considered suggestion. Omit the field
  // entirely for that case; the renderer already treats "no branch matches
  // recommendedSlug" as "no badge, no branch highlighted" with zero
  // special-casing needed.
  steps: { label: string; techLink: RoadmapTechLink; fork?: { branches: RoadmapTechLink[]; recommendedSlug?: string } }[];
  // `trackGroups` (optional, added 2026-09-04) handles a genuinely
  // different shape from `fork`: a roadmap made of several fully
  // independent, NON-reconverging tracks (see "professional-certifications"
  // below) rather than one continuing path with a branch-and-rejoin point.
  // `fork` assumes exactly one of several options is chosen and the
  // roadmap continues afterward on a shared path — that doesn't fit a case
  // where a learner might reasonably want more than one track, and there's
  // no shared continuation to reconverge onto. Same additive discipline as
  // `fork`: `steps`/`techLinks` are untouched, so
  // scripts/validate-roadmaps.ts's positional matching stays unaffected;
  // this is purely a rendering hint grouping existing step INDICES into
  // independent tracks. See docs/audit/14-roadmap-tree-redesign.md.
  trackGroups?: { label: string; stepIndices: number[] }[];
  salaryRange: string;
  jobTitles: string[];
  topEmployers: string[];
  timelineNote: string;
  color: string;
};

export const roadmapDetails: Record<string, RoadmapDetail> = {
  "full-stack-developer": {
    description: "Build and ship complete web applications — frontend, backend, database, auth, and deployment — using the modern JavaScript/TypeScript stack.",
    whyChoose: "The most in-demand tech role by sheer job volume in India. JavaScript remains the #1 most-used language industry-wide, and TypeScript is now a co-requirement at most companies. One skill stack covers both frontend and backend hiring.",
    skills: ["HTML/CSS & semantic markup", "JavaScript & TypeScript", "React & Next.js", "Node.js & Express", "REST API design", "Authentication & deployment"],
    techLinks: [
      { name: "HTML & Semantic Markup", academy: "web-dev", slug: "html" },
      { name: "CSS & Modern Layout", academy: "web-dev", slug: "css" },
      { name: "JavaScript", academy: "web-dev", slug: "javascript" },
      { name: "TypeScript", academy: "web-dev", slug: "typescript" },
      { name: "React", academy: "web-dev", slug: "react" },
      { name: "Next.js", academy: "web-dev", slug: "nextjs" },
      { name: "Node.js", academy: "web-dev", slug: "nodejs" },
      { name: "Express.js", academy: "web-dev", slug: "express" },
      { name: "REST API Design", academy: "web-dev", slug: "rest-api-design" },
      { name: "Authentication & Authorization", academy: "web-dev", slug: "auth" },
      { name: "Full-Stack Integration & Deployment", academy: "web-dev", slug: "fullstack-integration" },
    ],
    steps: [
      { label: "HTML & Semantic Markup", techLink: { name: "HTML & Semantic Markup", academy: "web-dev", slug: "html" } },
      { label: "CSS & Modern Layout", techLink: { name: "CSS & Modern Layout", academy: "web-dev", slug: "css" } },
      { label: "JavaScript", techLink: { name: "JavaScript", academy: "web-dev", slug: "javascript" } },
      { label: "TypeScript", techLink: { name: "TypeScript", academy: "web-dev", slug: "typescript" } },
      { label: "React", techLink: { name: "React", academy: "web-dev", slug: "react" } },
      { label: "Next.js", techLink: { name: "Next.js", academy: "web-dev", slug: "nextjs" } },
      { label: "Node.js", techLink: { name: "Node.js", academy: "web-dev", slug: "nodejs" } },
      { label: "Express.js", techLink: { name: "Express.js", academy: "web-dev", slug: "express" } },
      { label: "REST API Design", techLink: { name: "REST API Design", academy: "web-dev", slug: "rest-api-design" } },
      { label: "Authentication & Authorization", techLink: { name: "Authentication & Authorization", academy: "web-dev", slug: "auth" } },
      { label: "Full-Stack Integration & Deployment", techLink: { name: "Full-Stack Integration & Deployment", academy: "web-dev", slug: "fullstack-integration" } },
    ],
    salaryRange: "Scales heavily with React/Next.js depth and a real deployed portfolio versus tutorial-level familiarity — check current listings for this exact stack and seniority rather than a fixed figure.",
    jobTitles: ["Full-Stack Developer", "Frontend Developer", "Backend Developer", "Software Engineer"],
    topEmployers: ["Swiggy", "Zomato", "Razorpay", "Flipkart", "Freshworks", "Zoho", "Infosys", "TCS Digital"],
    timelineNote: "Most people land their first full-stack role in 5-7 months of focused learning. A deployed, working portfolio project matters more than any single credential — see the Full-Stack Integration technology's Projects tab.",
    color: "#0EA5E9",
  },
  "devops-engineer": {
    description: "Master the tools and practices modern engineering teams use to ship software fast and reliably.",
    whyChoose: "One of the highest-demand roles in Indian tech. Strong salary growth from Year 1. Clear skill progression.",
    skills: ["Linux administration", "Docker & Kubernetes", "CI/CD pipelines", "Cloud (AWS/Azure/GCP)", "Infrastructure as Code", "Monitoring & Observability"],
    techLinks: [
      { name: "Linux", academy: "devops", slug: "linux" },
      { name: "Shell Scripting", academy: "devops", slug: "shell-scripting" },
      { name: "Git", academy: "devops", slug: "git" },
      { name: "Docker", academy: "devops", slug: "docker" },
      { name: "Kubernetes", academy: "devops", slug: "kubernetes" },
      { name: "GitHub Actions", academy: "devops", slug: "github-actions" },
      { name: "Cloud — AWS", academy: "cloud", slug: "aws" },
      { name: "Monitoring — Prometheus", academy: "devops", slug: "prometheus" },
      { name: "IaC — Terraform", academy: "devops", slug: "terraform" },
    ],
    steps: [
      { label: "Linux", techLink: { name: "Linux", academy: "devops", slug: "linux" } },
      { label: "Shell Scripting", techLink: { name: "Shell Scripting", academy: "devops", slug: "shell-scripting" } },
      { label: "Git", techLink: { name: "Git", academy: "devops", slug: "git" } },
      { label: "Docker", techLink: { name: "Docker", academy: "devops", slug: "docker" } },
      { label: "Kubernetes", techLink: { name: "Kubernetes", academy: "devops", slug: "kubernetes" } },
      {
        label: "CI/CD Tooling", techLink: { name: "GitHub Actions", academy: "devops", slug: "github-actions" },
        fork: {
          recommendedSlug: "github-actions",
          branches: [
            { name: "GitHub Actions", academy: "devops", slug: "github-actions" },
            { name: "Jenkins", academy: "devops", slug: "jenkins" },
            { name: "GitLab CI", academy: "devops", slug: "gitlab-ci" },
          ],
        },
      },
      {
        label: "Cloud Platform", techLink: { name: "Cloud — AWS", academy: "cloud", slug: "aws" },
        fork: {
          recommendedSlug: "aws",
          branches: [
            { name: "AWS", academy: "cloud", slug: "aws" },
            { name: "Azure", academy: "cloud", slug: "azure" },
          ],
        },
      },
      { label: "Monitoring", techLink: { name: "Monitoring — Prometheus", academy: "devops", slug: "prometheus" } },
      { label: "IaC with Terraform", techLink: { name: "IaC — Terraform", academy: "devops", slug: "terraform" } },
    ],
    salaryRange: "Scales more with cloud/Kubernetes depth and company tier (early-stage startup vs. scaleup vs. large tech) than with raw years of experience — check current listings on Levels.fyi or a recent job posting for this exact stack and seniority rather than a fixed figure.", jobTitles: ["DevOps Engineer", "Platform Engineer", "SRE", "Infrastructure Engineer"],
    topEmployers: ["Amazon", "Microsoft", "Infosys", "Wipro", "Juspay", "Razorpay", "Atlassian", "ThoughtWorks"],
    timelineNote: "Most people land their first DevOps role in 4–8 months of focused learning. Kubernetes + one cloud provider is the minimum bar.", color: "#3B82F6",
  },
  "cloud-architect": {
    description: "Design and build scalable, secure, cost-effective cloud infrastructure across AWS, Azure, or GCP.",
    whyChoose: "Highest-paying non-executive tech role. Every enterprise migrating to cloud needs architects. Certifications accelerate hiring.",
    skills: ["Multi-cloud architecture", "Networking & security", "High availability design", "Cost optimization", "Migration strategy", "Compliance & governance"],
    techLinks: [
      { name: "Cloud Fundamentals", academy: "cloud", slug: "cloud-fundamentals" },
      { name: "AWS Core Services", academy: "cloud", slug: "aws" },
      { name: "Networking & Security", academy: "cloud", slug: "networking-security" },
      { name: "Architecture Patterns", academy: "cloud", slug: "architecture-patterns" },
      { name: "HA & DR", academy: "devops", slug: "ha-dr" },
      { name: "Cost Optimization", academy: "cloud", slug: "cost-optimization" },
    ],
    // 6 steps, not the previous 7 — "AWS Core Services"/"Azure Core Services"
    // (formerly two separate sequential steps) are now one fork step with
    // two branches, since a cloud architect specializing genuinely picks a
    // primary platform rather than mastering both in sequence. AWS is the
    // recommended default: it already has real practice-exam papers
    // (aws-saa) on this platform, the same reasoning used for the DevOps
    // Engineer pilot's Cloud Platform fork. See
    // docs/audit/14-roadmap-tree-redesign.md for the rollout record.
    steps: [
      { label: "Cloud Fundamentals", techLink: { name: "Cloud Fundamentals", academy: "cloud", slug: "cloud-fundamentals" } },
      {
        label: "Cloud Platform", techLink: { name: "AWS Core Services", academy: "cloud", slug: "aws" },
        fork: {
          recommendedSlug: "aws",
          branches: [
            { name: "AWS Core Services", academy: "cloud", slug: "aws" },
            { name: "Azure Core Services", academy: "cloud", slug: "azure" },
          ],
        },
      },
      { label: "Networking & Security", techLink: { name: "Networking & Security", academy: "cloud", slug: "networking-security" } },
      { label: "Architecture Patterns", techLink: { name: "Architecture Patterns", academy: "cloud", slug: "architecture-patterns" } },
      { label: "HA & DR", techLink: { name: "HA & DR", academy: "devops", slug: "ha-dr" } },
      { label: "Cost Optimization", techLink: { name: "Cost Optimization", academy: "cloud", slug: "cost-optimization" } },
    ],
    salaryRange: "Architect-level compensation varies heavily by company size and cloud-provider depth (single-cloud vs. genuine multi-cloud expertise) — check current listings for the specific provider certifications and company tier you're targeting rather than a fixed figure.", jobTitles: ["Cloud Architect", "Solutions Architect", "Cloud Engineer", "Principal Engineer"],
    topEmployers: ["Amazon", "Microsoft", "Google", "Accenture", "Deloitte", "KPMG", "TCS Digital"],
    timelineNote: "Typically 2+ years of hands-on cloud work before architect level. AWS SAA/Professional certifications are strong accelerators.", color: "#0EA5E9",
  },
  "platform-engineer": {
    description: "Build the internal developer platform that other engineers build on. Create the golden path for production deployments.",
    whyChoose: "Emerging senior role at top engineering companies. Very high impact, relatively few practitioners.",
    skills: ["Kubernetes advanced", "GitOps", "Service mesh", "Developer tooling", "Observability stack", "Self-service platforms"],
    techLinks: [
      { name: "Linux", academy: "devops", slug: "linux" },
      { name: "Networking", academy: "devops", slug: "networking" },
      { name: "Kubernetes Advanced", academy: "devops", slug: "kubernetes" },
      { name: "Terraform", academy: "devops", slug: "terraform" },
      { name: "Helm", academy: "devops", slug: "helm" },
      { name: "ArgoCD / GitOps", academy: "devops", slug: "argocd" },
      { name: "Service Mesh — Istio", academy: "devops", slug: "istio" },
      { name: "Observability", academy: "devops", slug: "prometheus" },
    ],
    steps: [
      { label: "Linux", techLink: { name: "Linux", academy: "devops", slug: "linux" } },
      { label: "Networking", techLink: { name: "Networking", academy: "devops", slug: "networking" } },
      { label: "Kubernetes Advanced", techLink: { name: "Kubernetes Advanced", academy: "devops", slug: "kubernetes" } },
      { label: "Terraform", techLink: { name: "Terraform", academy: "devops", slug: "terraform" } },
      { label: "Helm", techLink: { name: "Helm", academy: "devops", slug: "helm" } },
      { label: "ArgoCD / GitOps", techLink: { name: "ArgoCD / GitOps", academy: "devops", slug: "argocd" } },
      { label: "Service Mesh", techLink: { name: "Service Mesh — Istio", academy: "devops", slug: "istio" } },
      { label: "Observability", techLink: { name: "Observability", academy: "devops", slug: "prometheus" } },
    ],
    salaryRange: "A newer, more specialized role than plain DevOps — pay varies significantly by how mature the hiring organization's internal platform engineering function actually is, not just seniority. Check current listings for this specific title, since the role itself is still being defined differently company to company.", jobTitles: ["Platform Engineer", "Senior DevOps Engineer", "Infrastructure Lead", "Staff Engineer"],
    topEmployers: ["Razorpay", "Zepto", "Juspay", "PhonePe", "Atlassian", "ThoughtWorks"],
    timelineNote: "Requires 3–5 years of DevOps/Kubernetes experience. Build DevOps skills first.", color: "#6366F1",
  },
  "ai-engineer": {
    description: "Build AI-powered applications using large language models, RAG systems, and autonomous agents.",
    whyChoose: "Explosive demand — every company is building AI features. New field means experienced practitioners are rare.",
    skills: ["LLM APIs", "Prompt engineering", "RAG & vector databases", "AI agents & tools", "LLMOps & evaluation", "Python ML ecosystem"],
    techLinks: [
      { name: "Python Foundations", academy: "ai", slug: "python-for-ai" },
      { name: "ML Fundamentals", academy: "ai", slug: "ai-fundamentals" },
      { name: "LLM Concepts", academy: "ai", slug: "llm-engineering" },
      { name: "Prompt Engineering", academy: "ai", slug: "prompt-engineering" },
      { name: "LangChain & RAG", academy: "ai", slug: "langchain" },
      { name: "AI Agents", academy: "ai", slug: "ai-agents" },
      { name: "LLMOps", academy: "ai", slug: "llmops" },
    ],
    steps: [
      { label: "Python Foundations", techLink: { name: "Python Foundations", academy: "ai", slug: "python-for-ai" } },
      { label: "ML Fundamentals", techLink: { name: "ML Fundamentals", academy: "ai", slug: "ai-fundamentals" } },
      { label: "LLM Concepts", techLink: { name: "LLM Concepts", academy: "ai", slug: "llm-engineering" } },
      { label: "Prompt Engineering", techLink: { name: "Prompt Engineering", academy: "ai", slug: "prompt-engineering" } },
      { label: "LangChain & RAG", techLink: { name: "LangChain & RAG", academy: "ai", slug: "langchain" } },
      { label: "AI Agents", techLink: { name: "AI Agents", academy: "ai", slug: "ai-agents" } },
      { label: "LLMOps", techLink: { name: "LLMOps", academy: "ai", slug: "llmops" } },
    ],
    salaryRange: "One of the fastest-moving compensation bands in tech right now — AI/LLM engineering pay has shifted dramatically as demand has outpaced supply, meaning even a recent figure can understate current market rates. Check current listings specifically rather than any fixed number, including ones on this page from a few months ago.", jobTitles: ["AI Engineer", "ML Engineer", "LLM Engineer", "AI Product Engineer"],
    topEmployers: ["Sarvam AI", "Krutrim", "Google", "Microsoft", "Amazon", "AI Startups"],
    timelineNote: "Python proficiency is the prerequisite. Build portfolio projects — GitHub matters more than certifications.", color: "#8B5CF6",
  },
  "data-analyst": {
    description: "Turn raw data into business insights that drive decisions. Essential in every company.",
    whyChoose: "Accessible entry point into tech — SQL and Excel get you started. High demand across all industries.",
    skills: ["SQL (advanced)", "Python & Pandas", "Excel & Power Query", "Data visualization", "Power BI / Tableau", "Statistical analysis"],
    techLinks: [
      { name: "Excel Advanced", academy: "data", slug: "excel" },
      { name: "SQL Mastery", academy: "databases", slug: "sql" },
      { name: "Python & Pandas", academy: "data", slug: "pandas" },
      { name: "Data Visualization", academy: "data", slug: "data-visualization" },
      { name: "Power BI", academy: "data", slug: "power-bi" },
      { name: "Dashboarding", academy: "data", slug: "dashboarding" },
    ],
    // 6 steps, not the previous 7 — "Power BI"/"Tableau" (formerly two
    // separate sequential steps) are now one fork step with two branches,
    // since a data analyst typically specializes in the one BI tool their
    // target employer/market actually uses rather than mastering both in
    // sequence. Power BI is the recommended default — Microsoft-ecosystem
    // prevalence in the Indian corporate market gives it a lower real
    // barrier to entry than Tableau for a first BI tool; this is a softer
    // call than AWS's "already has practice-exam papers" reasoning on the
    // Cloud Platform fork, flagged here rather than presented as equally
    // clear-cut. See docs/audit/14-roadmap-tree-redesign.md.
    steps: [
      { label: "Excel Advanced", techLink: { name: "Excel Advanced", academy: "data", slug: "excel" } },
      { label: "SQL Mastery", techLink: { name: "SQL Mastery", academy: "databases", slug: "sql" } },
      { label: "Python & Pandas", techLink: { name: "Python & Pandas", academy: "data", slug: "pandas" } },
      { label: "Data Visualization", techLink: { name: "Data Visualization", academy: "data", slug: "data-visualization" } },
      {
        label: "BI Tool", techLink: { name: "Power BI", academy: "data", slug: "power-bi" },
        fork: {
          recommendedSlug: "power-bi",
          branches: [
            { name: "Power BI", academy: "data", slug: "power-bi" },
            { name: "Tableau", academy: "data", slug: "tableau" },
          ],
        },
      },
      { label: "Dashboarding", techLink: { name: "Dashboarding", academy: "data", slug: "dashboarding" } },
    ],
    salaryRange: "An entry-accessible tech role where pay varies mostly by city and company tier rather than deep specialization — check current listings for your target city and industry rather than a fixed figure.", jobTitles: ["Data Analyst", "Business Analyst", "BI Developer", "Analytics Engineer"],
    topEmployers: ["Banks", "E-commerce", "FMCG", "Healthcare", "Consulting"],
    timelineNote: "SQL + Python + one BI tool gets you a junior role in 3–4 months.", color: "#06B6D4",
  },
  "security-engineer": {
    description: "Protect systems, data, and infrastructure from threats. Demand is high and talent is scarce.",
    whyChoose: "Future-proof career. DPDP Act, RBI mandates accelerating hiring in India.",
    skills: ["Security fundamentals", "Network security", "Cloud security", "SIEM & SOC", "Penetration testing", "Incident response"],
    techLinks: [
      { name: "Security Fundamentals", academy: "security", slug: "security-fundamentals" },
      { name: "Network Security", academy: "security", slug: "network-security" },
      { name: "Cloud Security", academy: "security", slug: "cloud-security" },
      { name: "SIEM & SOC", academy: "security", slug: "soc" },
      { name: "Pen Testing", academy: "security", slug: "pen-testing" },
      { name: "Ethical Hacking", academy: "security", slug: "ethical-hacking" },
      { name: "Incident Response", academy: "security", slug: "incident-response" },
    ],
    steps: [
      { label: "Security Fundamentals", techLink: { name: "Security Fundamentals", academy: "security", slug: "security-fundamentals" } },
      { label: "Network Security", techLink: { name: "Network Security", academy: "security", slug: "network-security" } },
      { label: "Cloud Security", techLink: { name: "Cloud Security", academy: "security", slug: "cloud-security" } },
      { label: "SIEM & SOC", techLink: { name: "SIEM & SOC", academy: "security", slug: "soc" } },
      { label: "Pen Testing", techLink: { name: "Pen Testing", academy: "security", slug: "pen-testing" } },
      { label: "Ethical Hacking", techLink: { name: "Ethical Hacking", academy: "security", slug: "ethical-hacking" } },
      { label: "Incident Response", techLink: { name: "Incident Response", academy: "security", slug: "incident-response" } },
    ],
    salaryRange: "Varies substantially by sub-specialty (SOC operations vs. penetration testing vs. cloud security architecture) and, in some sectors, by security-clearance or compliance requirements — check current listings for the specific sub-specialty rather than a blanket security-role figure.", jobTitles: ["Security Engineer", "SOC Analyst", "Pen Tester", "CISO track"],
    topEmployers: ["BFSI sector", "Defense", "IT services (HCL, Infosys)", "Banks", "Government"],
    timelineNote: "CEH, OSCP, CompTIA Security+ certifications are valued. OWASP, TryHackMe for practice.", color: "#EF4444",
  },
  "database-engineer": {
    description: "Design, build, and maintain the databases that power modern applications.",
    whyChoose: "Foundational role — every application has a database. Growing demand for cloud database expertise.",
    skills: ["PostgreSQL & MySQL", "NoSQL (MongoDB, Redis)", "Database design", "Query optimization", "Replication & HA", "Cloud databases"],
    techLinks: [
      { name: "SQL Mastery", academy: "databases", slug: "sql" },
      { name: "PostgreSQL Advanced", academy: "databases", slug: "postgresql" },
      { name: "Redis & Caching", academy: "databases", slug: "redis" },
      { name: "MongoDB", academy: "databases", slug: "mongodb" },
      { name: "Database Design", academy: "databases", slug: "database-design" },
      { name: "Performance Tuning", academy: "databases", slug: "performance-tuning" },
      { name: "Cloud Databases", academy: "databases", slug: "cloud-databases" },
    ],
    steps: [
      { label: "SQL Mastery", techLink: { name: "SQL Mastery", academy: "databases", slug: "sql" } },
      { label: "PostgreSQL Advanced", techLink: { name: "PostgreSQL Advanced", academy: "databases", slug: "postgresql" } },
      { label: "Redis & Caching", techLink: { name: "Redis & Caching", academy: "databases", slug: "redis" } },
      { label: "MongoDB", techLink: { name: "MongoDB", academy: "databases", slug: "mongodb" } },
      { label: "Database Design", techLink: { name: "Database Design", academy: "databases", slug: "database-design" } },
      { label: "Performance Tuning", techLink: { name: "Performance Tuning", academy: "databases", slug: "performance-tuning" } },
      { label: "Cloud Databases", techLink: { name: "Cloud Databases", academy: "databases", slug: "cloud-databases" } },
    ],
    salaryRange: "Scales with which database technologies and system scale you can operate (a single-instance PostgreSQL admin and a multi-region distributed-database engineer are paid very differently under the same job title) — check current listings for the specific technology stack and scale rather than a fixed figure.", jobTitles: ["Database Engineer", "DBA", "Data Infrastructure Engineer"],
    topEmployers: ["Banks", "E-commerce", "SaaS companies", "IT services"],
    timelineNote: "PostgreSQL expertise + cloud experience (RDS/Aurora) is the strongest combination.", color: "#10B981",
  },
  "data-engineer": {
    description: "Build the pipelines, warehouses, and infrastructure that move and transform data at scale.",
    whyChoose: "High demand in BFSI, e-commerce, and tech. Growing fast as companies collect more data.",
    skills: ["Python & Pandas", "SQL (advanced analytics)", "Apache Kafka", "Airflow", "dbt", "Cloud data warehouses"],
    techLinks: [
      { name: "Python & Pandas", academy: "data", slug: "pandas" },
      { name: "SQL Advanced", academy: "databases", slug: "sql", section: "advanced" },
      { name: "Apache Kafka", academy: "devops", slug: "kafka" },
      { name: "dbt", academy: "data", slug: "dbt" },
      { name: "Airflow", academy: "data", slug: "airflow" },
      { name: "Spark Basics", academy: "data", slug: "spark" },
      { name: "Cloud Data Warehouses", academy: "data", slug: "cloud-data-warehouses" },
    ],
    steps: [
      { label: "Python & Pandas", techLink: { name: "Python & Pandas", academy: "data", slug: "pandas" } },
      { label: "SQL Advanced", techLink: { name: "SQL Advanced", academy: "databases", slug: "sql", section: "advanced" } },
      { label: "Apache Kafka", techLink: { name: "Apache Kafka", academy: "devops", slug: "kafka" } },
      { label: "dbt", techLink: { name: "dbt", academy: "data", slug: "dbt" } },
      { label: "Airflow", techLink: { name: "Airflow", academy: "data", slug: "airflow" } },
      { label: "Spark Basics", techLink: { name: "Spark Basics", academy: "data", slug: "spark" } },
      { label: "Cloud Data Warehouses", techLink: { name: "Cloud Data Warehouses", academy: "data", slug: "cloud-data-warehouses" } },
    ],
    salaryRange: "Scales with pipeline complexity and data volume experience more than years alone — check current listings for the specific tools (Kafka/Airflow/Spark) and data scale you can point to rather than a fixed figure.", jobTitles: ["Data Engineer", "Analytics Engineer", "Data Infrastructure Engineer"],
    topEmployers: ["Flipkart", "Amazon", "Zomato", "BFSI sector", "Healthcare analytics"],
    timelineNote: "SQL + Python + one pipeline tool (Airflow or dbt) gets you hired.", color: "#F59E0B",
  },
  "sre-engineer": {
    description: "Keep production systems reliable, scalable, and fast. SREs combine software engineering with operational excellence.",
    whyChoose: "Premium role at senior level — SREs earn SDE3-equivalent salaries.",
    skills: ["Linux production", "Kubernetes production", "Prometheus & SLOs", "Incident management", "Chaos engineering", "Capacity planning"],
    techLinks: [
      { name: "Linux Deep Dive", academy: "devops", slug: "linux" },
      { name: "Kubernetes Production", academy: "devops", slug: "kubernetes" },
      { name: "Prometheus & SLOs", academy: "devops", slug: "prometheus" },
      { name: "Incident Management", academy: "devops", slug: "incident" },
      { name: "Chaos Engineering", academy: "devops", slug: "chaos-engineering" },
      { name: "Capacity Planning", academy: "devops", slug: "capacity-planning" },
      { name: "Automation", academy: "devops", slug: "automation" },
    ],
    steps: [
      { label: "Linux Deep Dive", techLink: { name: "Linux Deep Dive", academy: "devops", slug: "linux" } },
      { label: "Kubernetes Production", techLink: { name: "Kubernetes Production", academy: "devops", slug: "kubernetes" } },
      { label: "Prometheus & SLOs", techLink: { name: "Prometheus & SLOs", academy: "devops", slug: "prometheus" } },
      { label: "Incident Management", techLink: { name: "Incident Management", academy: "devops", slug: "incident" } },
      { label: "Chaos Engineering", techLink: { name: "Chaos Engineering", academy: "devops", slug: "chaos-engineering" } },
      { label: "Capacity Planning", techLink: { name: "Capacity Planning", academy: "devops", slug: "capacity-planning" } },
      { label: "Automation", techLink: { name: "Automation", academy: "devops", slug: "automation" } },
    ],
    salaryRange: "Scales heavily with how much the hiring company's business depends on uptime — fintech/infra/high-scale consumer companies typically pay SREs a premium over general product companies for the same nominal seniority. Check current listings for companies in that category rather than a fixed figure.", jobTitles: ["SRE", "Reliability Engineer", "Production Engineer"],
    topEmployers: ["Google", "Meta", "Razorpay", "Meesho", "Swiggy", "Zomato", "PhonePe"],
    timelineNote: "Not entry-level. Build DevOps + Kubernetes skills first (2–4 years), then transition.", color: "#EC4899",
  },
  "healthcare-coder": {
    description: "Convert clinical documentation into medical codes for billing and insurance. A specialised, globally portable skill.",
    whyChoose: "Work-from-home friendly. US healthcare outsourcing grows 8%/year. CPC and BCHHC certifications open international opportunities.",
    skills: ["Anatomy & physiology", "Medical terminology", "ICD-10-CM diagnosis coding", "CPT procedure codes", "HCPCS Level II", "OASIS & PDGM", "CPC/BCHHC exam prep"],
    techLinks: [
      { name: "Anatomy & Physiology", academy: "healthcare", slug: "anatomy-physiology" },
      { name: "Medical Terminology", academy: "healthcare", slug: "medical-terminology" },
      { name: "ICD-10-CM Fundamentals", academy: "healthcare", slug: "icd-10-cm" },
      { name: "CPT Procedure Codes", academy: "healthcare", slug: "cpt" },
      { name: "HCPCS Level II", academy: "healthcare", slug: "hcpcs" },
      { name: "Coding Guidelines", academy: "healthcare", slug: "coding-guidelines" },
      { name: "OASIS & PDGM", academy: "healthcare", slug: "home-health-coding" },
      { name: "CPC Exam Prep", academy: "healthcare", slug: "mock-exams" },
    ],
    // 8 steps, not the previous 9 — "CPC Exam Prep"/"BCHHC Certification
    // Prep" (formerly two separate sequential steps) are now one fork step
    // with two branches, since these are two distinct certification tracks
    // (general medical coding vs. home-health-specific), not a sequence.
    // CPC is the recommended default — the broader, more foundational
    // certification most coders pursue first. This link ONLY points at
    // bchhc-prep's existing overview page — it does not touch the
    // standing BCHHC mock-exam-bank/quiz_questions exclusion (see memory:
    // "never touch the 10 BCHHC mock exam papers/backing DB data").
    steps: [
      { label: "Anatomy & Physiology", techLink: { name: "Anatomy & Physiology", academy: "healthcare", slug: "anatomy-physiology" } },
      { label: "Medical Terminology", techLink: { name: "Medical Terminology", academy: "healthcare", slug: "medical-terminology" } },
      { label: "ICD-10-CM Fundamentals", techLink: { name: "ICD-10-CM Fundamentals", academy: "healthcare", slug: "icd-10-cm" } },
      { label: "CPT Procedure Codes", techLink: { name: "CPT Procedure Codes", academy: "healthcare", slug: "cpt" } },
      { label: "HCPCS Level II", techLink: { name: "HCPCS Level II", academy: "healthcare", slug: "hcpcs" } },
      { label: "Coding Guidelines", techLink: { name: "Coding Guidelines", academy: "healthcare", slug: "coding-guidelines" } },
      { label: "OASIS & PDGM", techLink: { name: "OASIS & PDGM", academy: "healthcare", slug: "home-health-coding" } },
      {
        label: "Certification Track", techLink: { name: "CPC Exam Prep", academy: "healthcare", slug: "mock-exams" },
        fork: {
          recommendedSlug: "mock-exams",
          branches: [
            { name: "CPC Exam Prep", academy: "healthcare", slug: "mock-exams" },
            { name: "BCHHC Certification Prep", academy: "healthcare", slug: "bchhc-prep" },
          ],
        },
      },
    ],
    salaryRange: "Two genuinely different pay structures, not one scale — US-remote roles (common for BCHHC/CPC-certified coders) are typically hourly or per-encounter contract work, while India-based hospital/BPO roles are salaried. Check current listings for the specific employment model you're targeting rather than a blended figure.", jobTitles: ["Medical Coder", "HIM Specialist", "Coding Auditor"],
    topEmployers: ["Omega Healthcare", "Accenture Health", "Cognizant Health", "Gebbs Healthcare"],
    timelineNote: "CPC exam from AAPC after ~6 months study; BCHHC adds home-health specialisation. Remote work available from Day 1 post-certification.", color: "#14B8A6",
  },
  "advocate-career": {
    description: "Build a career in legal practice — from enrollment to independent practice, law firms, or corporate legal roles.",
    whyChoose: "High intellectual challenge. Diverse career paths — litigation, corporate, government. Senior advocates earn crores.",
    skills: ["Core law (BNS, CrPC, CPC, Evidence)", "Legal drafting", "Court procedure", "AIBE preparation", "Specialisation", "Client management"],
    techLinks: [
      { name: "LLB Degree", academy: "law", slug: "legal-fundamentals" },
      { name: "Bar Council Enrollment", academy: "law", slug: "aibe-bar-exam" },
      { name: "AIBE Exam & Certificate", academy: "law", slug: "aibe-bar-exam", section: "fundamentals" },
      { name: "Junior Advocate Practice", academy: "law", slug: "legal-career-growth" },
      { name: "Build Specialisation", academy: "law", slug: "legal-career-growth", section: "fundamentals" },
      { name: "Independent Practice", academy: "law", slug: "legal-career-growth", section: "advanced" },
    ],
    steps: [
      { label: "LLB / LLB Hons Degree", techLink: { name: "LLB Degree", academy: "law", slug: "legal-fundamentals" } },
      { label: "State Bar Council Enrollment", techLink: { name: "Bar Council Enrollment", academy: "law", slug: "aibe-bar-exam" } },
      { label: "AIBE Exam & Certificate", techLink: { name: "AIBE Exam & Certificate", academy: "law", slug: "aibe-bar-exam", section: "fundamentals" } },
      { label: "Junior to Senior Advocate (2–4 yrs)", techLink: { name: "Junior Advocate Practice", academy: "law", slug: "legal-career-growth" } },
      { label: "Build Specialisation", techLink: { name: "Build Specialisation", academy: "law", slug: "legal-career-growth", section: "fundamentals" } },
      { label: "Independent Practice", techLink: { name: "Independent Practice", academy: "law", slug: "legal-career-growth", section: "advanced" } },
    ],
    salaryRange: "Genuinely bimodal, not a single scale — independent litigation practice income is fee-based and builds slowly with reputation and case volume, while corporate counsel or law-firm associate roles are salaried from day one. Check current data for the specific track (litigation practice vs. corporate/firm employment) rather than one blended range.", jobTitles: ["Advocate", "Corporate Counsel", "Legal Analyst", "Law Firm Associate"],
    topEmployers: ["Law firms (AZB, Cyril Amarchand, Trilegal)", "In-house legal (Tech, BFSI)", "Government law offices", "DLSA/NALSA"],
    timelineNote: "Junior years (1–5) are hardest financially. Income grows significantly after Year 5–7.", color: "#6366F1",
  },
  "judiciary-civil-judge": {
    description: "Become a Civil Judge or Judicial Magistrate — a Gazetted Group-B officer in the Indian judiciary.",
    whyChoose: "Exceptional job security. Outstanding salary + perks (bungalow, vehicle). High social prestige. Path to High Court elevation.",
    skills: ["Constitutional & criminal law", "Civil procedure (CPC)", "Evidence law (BSA)", "Judgment writing", "Legal reasoning", "GK + language papers"],
    techLinks: [
      { name: "LLB + Core Subjects", academy: "law", slug: "legal-fundamentals" },
      { name: "Constitutional & Criminal Law", academy: "law", slug: "constitutional-law" },
      { name: "Civil Law (CPC, Contract)", academy: "law", slug: "civil-law-procedure" },
      { name: "Prelims Practice (MCQ)", academy: "law", slug: "judiciary-exams" },
      { name: "Mains + Judgment Writing", academy: "law", slug: "judiciary-exams", section: "advanced" },
      { name: "Interview / Viva", academy: "law", slug: "judiciary-exams", section: "interview" },
    ],
    steps: [
      { label: "LLB + Core Subjects", techLink: { name: "LLB + Core Subjects", academy: "law", slug: "legal-fundamentals" } },
      { label: "Constitutional & Criminal Law", techLink: { name: "Constitutional & Criminal Law", academy: "law", slug: "constitutional-law" } },
      { label: "Civil Law (CPC, Contract, TP)", techLink: { name: "Civil Law (CPC, Contract)", academy: "law", slug: "civil-law-procedure" } },
      { label: "Prelims Practice (MCQ)", techLink: { name: "Prelims Practice (MCQ)", academy: "law", slug: "judiciary-exams" } },
      { label: "Mains (Descriptive + Judgment Writing)", techLink: { name: "Mains + Judgment Writing", academy: "law", slug: "judiciary-exams", section: "advanced" } },
      { label: "Interview / Viva", techLink: { name: "Interview / Viva", academy: "law", slug: "judiciary-exams", section: "interview" } },
    ],
    salaryRange: "A fixed government pay scale (set via State Pay Commission/judicial pay commission revisions, not continuous private-sector market drift) — check the specific state's currently notified judicial pay scale rather than a figure from any given point in time, since these revise periodically at multi-year intervals, not gradually.", jobTitles: ["Civil Judge (Jr Division)", "Judicial Magistrate", "Additional District Judge"],
    topEmployers: ["State Government judicial services", "High Courts administer selections"],
    timelineNote: "Competitive: 2 lakh+ applicants for 300–500 seats in major states. Requires 1–3 years dedicated preparation.", color: "#A855F7",
  },
  "upsc-ias": {
    description: "Crack the UPSC Civil Services Examination to become an IAS, IPS, IFS, or other All India Service officer.",
    whyChoose: "Most prestigious exam in India. IAS officers have unmatched administrative power. Lifetime job security.",
    skills: ["Indian Polity & Governance", "Indian Economy", "History (Ancient, Medieval, Modern)", "Geography", "Environment & Ecology", "Ethics & Essay"],
    techLinks: [
      { name: "History, Polity, Geography", academy: "exams", slug: "upsc-prelims" },
      { name: "Economy & Environment", academy: "economics", slug: "indian-economy" },
      { name: "Prelims — GS + CSAT", academy: "exams", slug: "upsc-prelims", section: "fundamentals" },
      { name: "Mains — GS Papers 1–4", academy: "exams", slug: "upsc-mains" },
      { name: "Optional Subject", academy: "exams", slug: "upsc-mains", section: "fundamentals" },
      { name: "Essay + Ethics (GS4)", academy: "exams", slug: "upsc-ethics" },
      { name: "Interview / Personality Test", academy: "exams", slug: "upsc-interview" },
    ],
    steps: [
      { label: "Foundation: History, Polity, Geography", techLink: { name: "History, Polity, Geography", academy: "exams", slug: "upsc-prelims" } },
      { label: "Economy & Environment", techLink: { name: "Economy & Environment", academy: "economics", slug: "indian-economy" } },
      { label: "Prelims (GS + CSAT)", techLink: { name: "Prelims — GS + CSAT", academy: "exams", slug: "upsc-prelims", section: "fundamentals" } },
      { label: "Mains: GS Papers 1–4", techLink: { name: "Mains — GS Papers 1–4", academy: "exams", slug: "upsc-mains" } },
      { label: "Optional Subject (2 papers)", techLink: { name: "Optional Subject", academy: "exams", slug: "upsc-mains", section: "fundamentals" } },
      { label: "Essay + Ethics (GS4)", techLink: { name: "Essay + Ethics (GS4)", academy: "exams", slug: "upsc-ethics" } },
      { label: "Interview / Personality Test", techLink: { name: "Interview / Personality Test", academy: "exams", slug: "upsc-interview" } },
    ],
    salaryRange: "A fixed government pay scale set by the Central Pay Commission (currently the 7th CPC) and revised only at each new Pay Commission's implementation — not continuous market drift. Check the currently applicable CPC matrix for the exact grade rather than a figure that may already be a Pay Commission cycle out of date.", jobTitles: ["IAS (District Collector, DM, Secretary)", "IPS (SP, DIG, IG)", "IFS (Diplomat)", "Other Group A Services"],
    topEmployers: ["Government of India", "State Governments"],
    timelineNote: "Average successful candidate attempts 3–4 times over 5–7 years. Start with NCERT books. Daily current affairs essential.", color: "#F59E0B",
  },
  "banking-po": {
    description: "Become a Probationary Officer at SBI, IBPS-linked banks or other PSBs.",
    whyChoose: "Stable government job with excellent perks. Rapid career progression. Available every year.",
    skills: ["Quantitative Aptitude", "Logical Reasoning", "English Language", "General/Banking Awareness", "Computer Basics"],
    techLinks: [
      { name: "Quantitative Aptitude", academy: "exams", slug: "quant-aptitude" },
      { name: "Reasoning Ability", academy: "exams", slug: "reasoning-ability" },
      { name: "English Language", academy: "exams", slug: "english-language" },
      { name: "General/Banking Awareness", academy: "exams", slug: "banking-awareness" },
      { name: "Prelims Exam", academy: "exams", slug: "banking-exam" },
      { name: "Mains Exam", academy: "exams", slug: "banking-exams", section: "intermediate" },
      { name: "Interview", academy: "finance", slug: "banking-rbi" },
    ],
    steps: [
      { label: "Quantitative Aptitude", techLink: { name: "Quantitative Aptitude", academy: "exams", slug: "quant-aptitude" } },
      { label: "Reasoning Ability", techLink: { name: "Reasoning Ability", academy: "exams", slug: "reasoning-ability" } },
      { label: "English Language", techLink: { name: "English Language", academy: "exams", slug: "english-language" } },
      { label: "General/Banking Awareness", techLink: { name: "General/Banking Awareness", academy: "exams", slug: "banking-awareness" } },
      { label: "Prelims Exam", techLink: { name: "Prelims Exam", academy: "exams", slug: "banking-exam" } },
      { label: "Mains Exam", techLink: { name: "Mains Exam", academy: "exams", slug: "banking-exams", section: "intermediate" } },
      { label: "Interview", techLink: { name: "Interview", academy: "finance", slug: "banking-rbi" } },
    ],
    salaryRange: "Set via periodic bipartite wage settlements specific to the banking sector (not continuous market drift) — check the currently applicable pay scale for the specific bank (SBI vs. a particular IBPS-participating bank) rather than a figure from a prior settlement cycle.", jobTitles: ["Probationary Officer", "Assistant Manager", "Branch Manager (after promotion)"],
    topEmployers: ["SBI", "PNB", "Bank of Baroda", "Canara Bank", "Union Bank", "Bank of India"],
    timelineNote: "SBI PO + IBPS PO: 2-phase prelims + mains + interview. Speed and accuracy are key.", color: "#10B981",
  },
  "state-psc-officer": {
    description: "Clear your State Public Service Commission exam for Group I/II/III posts — DSP, SDM, commercial tax officer, and more.",
    whyChoose: "State-level prestige. Work in your home state. Excellent job security and perks.",
    skills: ["State-specific GK", "State language", "Indian Polity & History", "Economy & Current Affairs", "Essay writing"],
    techLinks: [
      { name: "TNPSC Prep", academy: "state-psc", slug: "tnpsc" },
      { name: "Indian Polity & History", academy: "law", slug: "constitutional-law" },
      { name: "Prelims (state-specific)", academy: "exams", slug: "state-psc", section: "fundamentals" },
      { name: "Mains + State-specific papers", academy: "exams", slug: "state-psc", section: "pyq" },
      { name: "Mains — Essay & Answer Writing", academy: "exams", slug: "state-psc", section: "advanced" },
      { name: "Interview", academy: "exams", slug: "state-psc", section: "interview" },
    ],
    // 6 steps, unchanged count — "State GK + Language" is now a genuine
    // fork across all 5 real, content-complete state-psc technologies
    // (confirmed 2026-09-03: each of tnpsc/kpsc/mpsc/appsc/tspsc has real,
    // distinct 6-tab content, not templates) instead of pointing at the
    // generic exams/state-psc technology. Deliberately NO recommendedSlug
    // — which state to target is a personal choice (where the learner
    // actually lives/wants to work), not a technically-better option, so
    // no branch is marked "Recommended". Steps 3-6 (Prelims/Mains/
    // Interview) stay on the generic exams/state-psc technology for now —
    // making those state-aware too would need a persistent "remember my
    // state" pattern across steps, a larger, separate UI question, not
    // this fork. See docs/audit/14-roadmap-tree-redesign.md.
    steps: [
      {
        label: "State GK + Language", techLink: { name: "TNPSC Prep", academy: "state-psc", slug: "tnpsc" },
        fork: {
          branches: [
            { name: "TNPSC (Tamil Nadu)", academy: "state-psc", slug: "tnpsc" },
            { name: "KPSC (Karnataka)", academy: "state-psc", slug: "kpsc" },
            { name: "MPSC (Maharashtra)", academy: "state-psc", slug: "mpsc" },
            { name: "APPSC (Andhra Pradesh)", academy: "state-psc", slug: "appsc" },
            { name: "TSPSC (Telangana)", academy: "state-psc", slug: "tspsc" },
          ],
        },
      },
      { label: "Indian Polity & History", techLink: { name: "Indian Polity & History", academy: "law", slug: "constitutional-law" } },
      { label: "Prelims (state-specific)", techLink: { name: "Prelims (state-specific)", academy: "exams", slug: "state-psc", section: "fundamentals" } },
      { label: "Mains + State-specific papers", techLink: { name: "Mains + State-specific papers", academy: "exams", slug: "state-psc", section: "pyq" } },
      { label: "Mains — Essay & Answer Writing", techLink: { name: "Mains — Essay & Answer Writing", academy: "exams", slug: "state-psc", section: "advanced" } },
      { label: "Interview", techLink: { name: "Interview", academy: "exams", slug: "state-psc", section: "interview" } },
    ],
    salaryRange: "A fixed state government pay scale — and one that genuinely differs by state (each state has its own Pay Commission), so even an accurate figure for one state wouldn't apply to another. Check the specific state's currently notified pay scale for the specific post rather than a blended figure.", jobTitles: ["Deputy SP", "SDM", "Commercial Tax Officer", "Block Development Officer"],
    topEmployers: ["TNPSC", "KPSC", "MPSC", "UP PSC", "APPSC", "TSPSC"],
    timelineNote: "Uses the State PSC guide's dedicated Prelims, Mains, and Interview sections — once you know your target state, layer in that state's own board textbooks (e.g. TNPSC, KPSC, MPSC) for state-specific language and GK on top of this common pattern.", color: "#8B5CF6",
  },
  "ca-journey": {
    description: "Complete the Chartered Accountancy qualification from ICAI — Foundation to Intermediate to Final over 4–5 years.",
    whyChoose: "Most respected finance qualification in India. Opens doors to Big 4, CFO track. Income scales rapidly after qualification.",
    skills: ["Financial accounting & Ind AS", "Taxation (Income Tax + GST)", "Auditing & Ethics", "Corporate law", "Cost accounting"],
    techLinks: [
      { name: "CA Foundation (4 papers)", academy: "finance", slug: "ca-cs-foundation" },
      { name: "Register for Articleship", academy: "finance", slug: "ca-articleship" },
      { name: "CA Intermediate Group I", academy: "finance", slug: "ca-intermediate" },
      { name: "CA Intermediate Group II", academy: "finance", slug: "ca-intermediate" },
      { name: "3-Year Articleship", academy: "finance", slug: "ca-articleship" },
      { name: "CA Final Group I", academy: "finance", slug: "ca-final" },
      { name: "CA Final Group II + AICITSS", academy: "finance", slug: "ca-final" },
    ],
    steps: [
      { label: "CA Foundation (4 papers)", techLink: { name: "CA Foundation (4 papers)", academy: "finance", slug: "ca-cs-foundation" } },
      { label: "Register for Articleship", techLink: { name: "Register for Articleship", academy: "finance", slug: "ca-articleship" } },
      { label: "CA Intermediate Group I (4 papers)", techLink: { name: "CA Intermediate Group I", academy: "finance", slug: "ca-intermediate" } },
      { label: "CA Intermediate Group II (4 papers)", techLink: { name: "CA Intermediate Group II", academy: "finance", slug: "ca-intermediate" } },
      { label: "3-Year Articleship + ICITSS", techLink: { name: "3-Year Articleship", academy: "finance", slug: "ca-articleship" } },
      { label: "CA Final Group I", techLink: { name: "CA Final Group I", academy: "finance", slug: "ca-final" } },
      { label: "CA Final Group II + AICITSS", techLink: { name: "CA Final Group II + AICITSS", academy: "finance", slug: "ca-final" } },
    ],
    salaryRange: "Famously bimodal — Big 4/large-firm campus placement pay and independent-practice/small-firm income are genuinely different tracks that diverge further with post-qualification experience. Check ICAI's own current campus placement data for the placement track, or current market rates for the practice track, rather than a single blended figure.", jobTitles: ["Chartered Accountant", "Financial Controller", "CFO track", "Tax Consultant"],
    topEmployers: ["Deloitte", "EY", "KPMG", "PwC", "Grant Thornton", "MNCs", "Own practice"],
    timelineNote: "Foundation to Final + 3-year articleship. Most candidates take 5–6 years total. Persistence is everything.", color: "#F59E0B",
  },
  "banking-finance-analyst": {
    description: "Build a career in banking analysis, financial markets, or investment — at banks, NBFCs, brokerages, or AMCs.",
    whyChoose: "BFSI is India's largest employer. Diverse entry routes — banking exams, MBA Finance, NISM certifications.",
    skills: ["Accounting & financial statements", "Credit analysis", "Financial markets", "RBI/SEBI regulations", "Excel financial modelling"],
    techLinks: [
      { name: "Accounting Basics", academy: "finance", slug: "accounting-basics" },
      { name: "Financial Markets (SEBI/NISM)", academy: "finance", slug: "sebi-nism" },
      { name: "Banking & RBI Framework", academy: "finance", slug: "banking-rbi" },
      { name: "Credit Analysis Fundamentals", academy: "finance", slug: "credit-analysis" },
      { name: "Credentialing Path", academy: "finance", slug: "ca-cs-foundation" },
      { name: "Role: Analyst / RM", academy: "finance", slug: "banking-rbi", section: "notes" },
    ],
    steps: [
      { label: "Accounting Basics", techLink: { name: "Accounting Basics", academy: "finance", slug: "accounting-basics" } },
      { label: "Financial Markets (SEBI/NISM)", techLink: { name: "Financial Markets (SEBI/NISM)", academy: "finance", slug: "sebi-nism" } },
      { label: "Banking & RBI Framework", techLink: { name: "Banking & RBI Framework", academy: "finance", slug: "banking-rbi" } },
      { label: "Credit Analysis Fundamentals", techLink: { name: "Credit Analysis Fundamentals", academy: "finance", slug: "credit-analysis" } },
      // "CA/MBA or NISM Certifications" -> "Credentialing Path", now a real
      // fork (CA/CS/CMA route vs. the banking-exam route). No technically-
      // better default between them -- CA/CS/CMA suits someone targeting
      // credit/risk/investment-banking roles, the banking exam route suits
      // someone targeting a direct PO/officer post -- so recommendedSlug is
      // deliberately omitted, same reasoning as state-psc-officer's fork.
      {
        label: "Credentialing Path", techLink: { name: "Credentialing Path", academy: "finance", slug: "ca-cs-foundation" },
        fork: {
          branches: [
            { name: "CA/CS/CMA Foundation", academy: "finance", slug: "ca-cs-foundation" },
            { name: "Banking Exams (SBI/IBPS)", academy: "exams", slug: "banking-exams" },
          ],
        },
      },
      { label: "Role: Analyst / Relationship Manager", techLink: { name: "Role: Analyst / RM", academy: "finance", slug: "banking-rbi", section: "notes" } },
    ],
    salaryRange: "Varies by which role and firm type you target — a public-sector bank, a private bank, and a boutique investment firm pay on genuinely different scales for similar-sounding analyst titles. Check current listings for the specific role and firm type rather than a blended figure.", jobTitles: ["Credit Analyst", "Equity Analyst", "Relationship Manager", "Risk Analyst"],
    topEmployers: ["HDFC Bank", "ICICI Bank", "Kotak Mahindra", "SBI", "SEBI", "RBI", "AMCs"],
    timelineNote: "NISM VA certification gets you started with mutual funds. CA or MBA Finance required for senior roles.", color: "#14B8A6",
  },
  "agricultural-officer": {
    description: "Become an Agricultural Field Officer at a bank (IBPS AFO), development officer at NABARD, or agricultural officer in state services.",
    whyChoose: "Growing sector. Government actively hiring. Rural banking expansion creating hundreds of AFO posts annually.",
    skills: ["Agronomy & crop science", "Soil science & fertilisers", "Plant pathology & IPM", "Agricultural economics", "Government schemes"],
    techLinks: [
      { name: "Agronomy & Soil Science", academy: "agriculture", slug: "soil-science" },
      { name: "Crop Science & Horticulture", academy: "agriculture", slug: "crop-science" },
      { name: "Plant Pathology & Entomology", academy: "agriculture", slug: "crop-science", section: "advanced" },
      { name: "Agricultural Economics & Policy", academy: "agriculture", slug: "agri-business" },
      { name: "Current Agri Schemes (PM-KISAN)", academy: "agriculture", slug: "icar-ibps-afo", section: "intermediate" },
      { name: "IBPS AFO / NABARD Grade A Exam", academy: "agriculture", slug: "icar-ibps-afo" },
    ],
    steps: [
      { label: "Agronomy & Soil Science", techLink: { name: "Agronomy & Soil Science", academy: "agriculture", slug: "soil-science" } },
      { label: "Crop Science & Horticulture", techLink: { name: "Crop Science & Horticulture", academy: "agriculture", slug: "crop-science" } },
      { label: "Plant Pathology & Entomology", techLink: { name: "Plant Pathology & Entomology", academy: "agriculture", slug: "crop-science", section: "advanced" } },
      { label: "Agricultural Economics & Policy", techLink: { name: "Agricultural Economics & Policy", academy: "agriculture", slug: "agri-business" } },
      { label: "Current Agri Schemes (PM-KISAN, MSP)", techLink: { name: "Current Agri Schemes (PM-KISAN)", academy: "agriculture", slug: "icar-ibps-afo", section: "intermediate" } },
      { label: "IBPS AFO / NABARD Grade A Exam", techLink: { name: "IBPS AFO / NABARD Grade A Exam", academy: "agriculture", slug: "icar-ibps-afo" } },
    ],
    salaryRange: "IBPS AFO and NABARD Grade A are each set by their own periodic official recruitment notification (fixed PSU/government scales, not market drift) — check the current, specific notification for the exact exam and post rather than a figure from a prior recruitment cycle.", jobTitles: ["Agricultural Field Officer", "NABARD Development Manager", "Agricultural Extension Officer"],
    topEmployers: ["SBI (AFO)", "PNB", "Bank of Baroda", "NABARD", "ICAR institutes", "State Agriculture Departments"],
    timelineNote: "IBPS AFO exam every year. B.Sc Agriculture degree is mandatory. 6–8 months focused preparation sufficient.", color: "#22C55E",
  },
  "telecom-engineer": {
    description: "Build a career in India's telecom sector — as a BSNL JTO, network engineer, RAN specialist, or 5G architect.",
    whyChoose: "India is rolling out 5G aggressively. BSNL 4G/5G revival means thousands of JTO vacancies.",
    skills: ["Electronics & Communication fundamentals", "4G LTE & 5G NR architecture", "Transmission & fiber optics", "OSS/BSS systems", "Routing & switching"],
    techLinks: [
      { name: "Electronics & Communication Basics", academy: "telecom", slug: "telecom-fundamentals" },
      { name: "Transmission & Fiber Optics", academy: "telecom", slug: "fiber-optics" },
      { name: "Mobile Networks (4G LTE / 5G NR)", academy: "telecom", slug: "wireless-tech" },
      { name: "OSS/BSS & Network Management", academy: "telecom", slug: "telco", section: "fundamentals" },
      { name: "GATE ECE", academy: "exams", slug: "gate-ece" },
      { name: "Career: JTO, Network Engineer, RAN", academy: "telecom", slug: "telco", section: "interview" },
    ],
    // 6 steps, unchanged count — "GATE ECE / BSNL JTO Exam" is now a
    // genuine fork: exams/gate-ece was confirmed 2026-09-03 as a real,
    // content-complete (9-tab) technology, unused by any other roadmap
    // (zero collapsed-step collision risk), sitting unused as a second
    // exam path this label already named but never linked to. GATE ECE
    // is the recommended default — this roadmap's OWN pre-existing
    // timelineNote below already states "GATE ECE is the primary route
    // for PSU telecom jobs; BSNL JTO direct exam is conducted
    // irregularly" — recommending BSNL JTO instead would have directly
    // contradicted the roadmap's own already-vetted content, caught in
    // visual review before this shipped. See
    // docs/audit/14-roadmap-tree-redesign.md.
    steps: [
      { label: "Electronics & Communication (ECE Basics)", techLink: { name: "Electronics & Communication Basics", academy: "telecom", slug: "telecom-fundamentals" } },
      { label: "Transmission & Fiber Optics", techLink: { name: "Transmission & Fiber Optics", academy: "telecom", slug: "fiber-optics" } },
      { label: "Mobile Networks (4G LTE / 5G NR)", techLink: { name: "Mobile Networks (4G LTE / 5G NR)", academy: "telecom", slug: "wireless-tech" } },
      { label: "OSS/BSS & Network Management", techLink: { name: "OSS/BSS & Network Management", academy: "telecom", slug: "telco", section: "fundamentals" } },
      {
        label: "Exam Path", techLink: { name: "GATE ECE", academy: "exams", slug: "gate-ece" },
        fork: {
          recommendedSlug: "gate-ece",
          branches: [
            { name: "GATE ECE", academy: "exams", slug: "gate-ece" },
            { name: "BSNL JTO Prep", academy: "telecom", slug: "bsnl-jto-prep" },
          ],
        },
      },
      { label: "Career: JTO, Network Engineer, RAN", techLink: { name: "Career: JTO, Network Engineer, RAN", academy: "telecom", slug: "telco", section: "interview" } },
    ],
    salaryRange: "Two genuinely different structures — BSNL JTO follows a fixed PSU pay scale set by official notification, while private-telecom roles (Jio, Airtel, network vendors) are market-rate and vary by employer and specialization. Check the current BSNL notification for the PSU track, or current listings for the private track, rather than one blended figure.", jobTitles: ["JTO (BSNL)", "Network Engineer", "RAN Engineer", "5G Solutions Architect"],
    topEmployers: ["BSNL", "MTNL", "Jio", "Airtel", "Vodafone Idea", "Nokia", "Ericsson"],
    timelineNote: "GATE ECE is the primary route for PSU telecom jobs. BSNL JTO direct exam is conducted irregularly.", color: "#0EA5E9",
  },
  "neet-medical": {
    description: "Clear NEET-UG to gain admission to MBBS, BDS, BAMS, BHMS at government and private colleges.",
    whyChoose: "One exam for all medical admissions in India. Government MBBS seats are heavily subsidised.",
    skills: ["Biology (Botany + Zoology)", "Physics (NEET pattern)", "Chemistry", "NCERT mastery", "Problem-solving speed"],
    techLinks: [
      { name: "Biology (Botany + Zoology)", academy: "exams", slug: "neet-biology" },
      { name: "Physics (Mechanics, Modern, Optics)", academy: "exams", slug: "neet-physics" },
      { name: "Chemistry (Organic, Inorganic, Physical)", academy: "exams", slug: "neet-chemistry" },
      { name: "NCERT Mastery", academy: "exams", slug: "neet-biology", section: "cheatsheets" },
      { name: "Previous Year Questions (10 years)", academy: "exams", slug: "neet-biology", section: "pyq" },
      { name: "Mock Tests + Revision", academy: "exams", slug: "neet-mocktests" },
    ],
    steps: [
      { label: "Biology (Botany + Zoology)", techLink: { name: "Biology (Botany + Zoology)", academy: "exams", slug: "neet-biology" } },
      { label: "Physics (Mechanics, Modern, Optics)", techLink: { name: "Physics (Mechanics, Modern, Optics)", academy: "exams", slug: "neet-physics" } },
      { label: "Chemistry (Organic, Inorganic, Physical)", techLink: { name: "Chemistry (Organic, Inorganic, Physical)", academy: "exams", slug: "neet-chemistry" } },
      { label: "NCERT Mastery (all chapters)", techLink: { name: "NCERT Mastery", academy: "exams", slug: "neet-biology", section: "cheatsheets" } },
      { label: "Previous Year Questions (10 years)", techLink: { name: "Previous Year Questions (10 years)", academy: "exams", slug: "neet-biology", section: "pyq" } },
      { label: "Mock Tests + Revision", techLink: { name: "Mock Tests + Revision", academy: "exams", slug: "neet-mocktests" } },
    ],
    salaryRange: "Not a single comparable figure at any stage — resident stipends are set individually by each medical college/state government and vary institution to institution, while specialist private-practice income is reputation- and location-driven with no real ceiling. Check the specific institution's current stipend notification for the residency stage; treat specialist practice income as not meaningfully comparable to a standard salary at all.", jobTitles: ["MBBS Doctor", "Specialist (after NEET-PG)", "Dentist (BDS)", "Ayurvedic Physician (BAMS)"],
    topEmployers: ["Government hospitals (AIIMS, PGI)", "Private hospitals", "Own clinic"],
    timelineNote: "NEET is conducted once per year (May). Biology carries 360 marks. Class 11+12 NCERT is the complete syllabus.", color: "#F43F5E",
  },
  "jee-engineering": {
    description: "Clear JEE Main and Advanced to gain admission to IITs, NITs, IIITs and other premier engineering institutions.",
    whyChoose: "IIT degree opens exceptional career doors — placements, startups, research, foreign universities.",
    skills: ["Mathematics (calculus, algebra, coordinate)", "Physics (mechanics, electrostatics)", "Chemistry (organic, inorganic, physical)"],
    techLinks: [
      { name: "Mathematics (Calculus, Algebra, Coordinate)", academy: "exams", slug: "jee-maths" },
      { name: "Physics (Mechanics, E&M, Modern)", academy: "exams", slug: "jee-physics" },
      { name: "Chemistry (Organic, Inorganic, Physical)", academy: "exams", slug: "jee-chemistry" },
      { name: "JEE Main Exam (Jan + Apr)", academy: "exams", slug: "jee-main" },
      { name: "JEE Advanced (IIT shortlist)", academy: "exams", slug: "jee-advanced" },
      { name: "JOSAA Counselling", academy: "exams", slug: "jee-advanced", section: "fundamentals" },
    ],
    steps: [
      { label: "Mathematics (Calculus, Algebra, Coordinate)", techLink: { name: "Mathematics (Calculus, Algebra, Coordinate)", academy: "exams", slug: "jee-maths" } },
      { label: "Physics (Mechanics, E&M, Modern)", techLink: { name: "Physics (Mechanics, E&M, Modern)", academy: "exams", slug: "jee-physics" } },
      { label: "Chemistry (Organic, Inorganic, Physical)", techLink: { name: "Chemistry (Organic, Inorganic, Physical)", academy: "exams", slug: "jee-chemistry" } },
      { label: "JEE Main Exam (Jan + Apr)", techLink: { name: "JEE Main Exam (Jan + Apr)", academy: "exams", slug: "jee-main" } },
      { label: "JEE Advanced (IIT shortlist)", techLink: { name: "JEE Advanced (IIT shortlist)", academy: "exams", slug: "jee-advanced" } },
      { label: "JOSAA Counselling", techLink: { name: "JOSAA Counselling", academy: "exams", slug: "jee-advanced", section: "fundamentals" } },
    ],
    salaryRange: "Campus placement packages change every single placement season and are published fresh by each institute's own placement cell annually — this is genuinely one of the fastest-changing figures on this page, so no number here would stay current for long. Check the specific institute's own most recent official placement report rather than any figure quoted elsewhere.", jobTitles: ["Software Engineer", "Data Scientist", "Core Engineering", "Research Scientist"],
    topEmployers: ["Google", "Microsoft", "Amazon", "Goldman Sachs", "McKinsey", "Core engineering MNCs"],
    timelineNote: "JEE Main held twice (January + April). Top 2.5 lakh qualifiers appear for JEE Advanced. Negative marking applies.", color: "#3B82F6",
  },
  "personal-wellness": {
    description: "Build sustainable habits for physical health, mental wellbeing, financial security, and digital safety.",
    whyChoose: "Immediate impact on daily quality of life. Preventive health saves crores in future medical costs.",
    skills: ["Sleep & recovery", "Nutrition & hydration", "Daily movement", "Mental health practices", "Digital safety", "Personal finance basics"],
    techLinks: [
      { name: "Morning Routine & Sleep", academy: "essentials", slug: "sleep-health" },
      { name: "Nutrition & Hydration", academy: "essentials", slug: "nutrition" },
      { name: "Daily Movement", academy: "essentials", slug: "daily-movement" },
      { name: "Mental Health Practices", academy: "essentials", slug: "mental-health" },
      { name: "Digital Safety & Privacy", academy: "essentials", slug: "digital-safety" },
      { name: "Personal Finance Basics", academy: "essentials", slug: "personal-finance" },
      { name: "First Aid & Emergency Preparedness", academy: "essentials", slug: "first-aid" },
    ],
    steps: [
      { label: "Morning Routine & Sleep", techLink: { name: "Morning Routine & Sleep", academy: "essentials", slug: "sleep-health" } },
      { label: "Nutrition & Hydration", techLink: { name: "Nutrition & Hydration", academy: "essentials", slug: "nutrition" } },
      { label: "Daily Movement", techLink: { name: "Daily Movement", academy: "essentials", slug: "daily-movement" } },
      { label: "Mental Health Practices", techLink: { name: "Mental Health Practices", academy: "essentials", slug: "mental-health" } },
      { label: "Digital Safety & Privacy", techLink: { name: "Digital Safety & Privacy", academy: "essentials", slug: "digital-safety" } },
      { label: "Personal Finance Basics", techLink: { name: "Personal Finance Basics", academy: "essentials", slug: "personal-finance" } },
      { label: "First Aid & Emergency Preparedness", techLink: { name: "First Aid & Emergency Preparedness", academy: "essentials", slug: "first-aid" } },
    ],
    salaryRange: "Not a job path — life quality multiplier", jobTitles: ["N/A — personal development path"],
    topEmployers: ["N/A"],
    timelineNote: "Start with one habit. Small, consistent changes compound dramatically over 1–5 years.", color: "#22C55E",
  },
  "aerospace-engineer": {
    description: "Build the toolkit for flight and space engineering — aerodynamics, propulsion, orbital mechanics, and India's growing government + private space sector.",
    whyChoose: "ISRO remains the dominant government path, but private space (Skyroot, Agnikul) is now genuinely hiring, not just experimenting — this is the first India-relevant aerospace roadmap on the platform.",
    skills: ["Aerodynamics", "Propulsion systems", "Flight mechanics", "Orbital mechanics", "Spacecraft systems design", "GATE AE"],
    techLinks: [
      { name: "Aerospace Foundations", academy: "aerospace", slug: "aerospace-foundations" },
      { name: "Aerodynamics", academy: "aerospace", slug: "aerodynamics" },
      { name: "Propulsion Systems", academy: "aerospace", slug: "propulsion-systems" },
      { name: "Flight Mechanics & Aircraft Structures", academy: "aerospace", slug: "flight-mechanics-structures" },
      { name: "Orbital Mechanics & Astrodynamics", academy: "aerospace", slug: "orbital-mechanics" },
      { name: "Spacecraft Systems & Mission Design", academy: "aerospace", slug: "spacecraft-systems" },
      { name: "Aerospace Careers & Exam Pathways", academy: "aerospace", slug: "aerospace-careers" },
    ],
    steps: [
      { label: "Aerospace Foundations", techLink: { name: "Aerospace Foundations", academy: "aerospace", slug: "aerospace-foundations" } },
      { label: "Aerodynamics", techLink: { name: "Aerodynamics", academy: "aerospace", slug: "aerodynamics" } },
      { label: "Propulsion Systems", techLink: { name: "Propulsion Systems", academy: "aerospace", slug: "propulsion-systems" } },
      { label: "Flight Mechanics & Structures", techLink: { name: "Flight Mechanics & Aircraft Structures", academy: "aerospace", slug: "flight-mechanics-structures" } },
      { label: "Orbital Mechanics", techLink: { name: "Orbital Mechanics & Astrodynamics", academy: "aerospace", slug: "orbital-mechanics" } },
      { label: "Spacecraft Systems", techLink: { name: "Spacecraft Systems & Mission Design", academy: "aerospace", slug: "spacecraft-systems" } },
      { label: "Careers & Exam Prep", techLink: { name: "Aerospace Careers & Exam Pathways", academy: "aerospace", slug: "aerospace-careers" } },
    ],
    salaryRange: "Three genuinely different pay structures under one field — ISRO/DRDO follow fixed PSU/government scales set by official notification, private space startups (Skyroot, Agnikul) pay is influenced by equity and stage of funding, and established aerospace MNCs (Boeing India, Airbus India) pay closer to standard large-corporate scales. Check the current source relevant to the specific track rather than one blended figure.",
    jobTitles: ["Aerospace Design Engineer", "Propulsion Engineer", "Flight Test Engineer", "Mission/Systems Engineer"],
    topEmployers: ["ISRO", "HAL", "DRDO", "Skyroot Aerospace", "Agnikul Cosmos", "Boeing India", "Airbus India"],
    timelineNote: "GATE AE is the practical gateway for MTech/PSU routes; private space hiring (Skyroot, Agnikul) increasingly runs like general tech hiring — direct applications and referrals, not one standardized exam.", color: "#1D4ED8",
  },
  "vlsi-design-engineer": {
    description: "Chip design from digital logic to fabrication — HDL, RTL design, functional verification, and physical design for India's expanding semiconductor industry.",
    whyChoose: "Private semiconductor hiring (Intel, Qualcomm, AMD, and India's own fab buildout) is the dominant path — no single centralized exam the way ISRO anchors Aerospace.",
    skills: ["Digital logic & Boolean algebra", "Verilog/VHDL", "RTL design & FSMs", "SystemVerilog/UVM verification", "Physical design & STA", "GATE EC"],
    techLinks: [
      { name: "Digital Logic & Design Fundamentals", academy: "vlsi", slug: "digital-logic-fundamentals" },
      { name: "HDL — Verilog & VHDL", academy: "vlsi", slug: "hdl-verilog-vhdl" },
      { name: "RTL Design & Computer Architecture", academy: "vlsi", slug: "rtl-digital-design" },
      { name: "Functional Verification", academy: "vlsi", slug: "functional-verification" },
      { name: "Physical Design & Fabrication", academy: "vlsi", slug: "physical-design-fabrication" },
      { name: "Analog & Mixed-Signal Design", academy: "vlsi", slug: "analog-mixed-signal" },
      { name: "VLSI Careers & Exam Pathways", academy: "vlsi", slug: "vlsi-careers" },
    ],
    steps: [
      { label: "Digital Logic Fundamentals", techLink: { name: "Digital Logic & Design Fundamentals", academy: "vlsi", slug: "digital-logic-fundamentals" } },
      { label: "HDL — Verilog & VHDL", techLink: { name: "HDL — Verilog & VHDL", academy: "vlsi", slug: "hdl-verilog-vhdl" } },
      { label: "RTL Design", techLink: { name: "RTL Design & Computer Architecture", academy: "vlsi", slug: "rtl-digital-design" } },
      { label: "Functional Verification", techLink: { name: "Functional Verification", academy: "vlsi", slug: "functional-verification" } },
      { label: "Physical Design & Fabrication", techLink: { name: "Physical Design & Fabrication", academy: "vlsi", slug: "physical-design-fabrication" } },
      { label: "Analog & Mixed-Signal", techLink: { name: "Analog & Mixed-Signal Design", academy: "vlsi", slug: "analog-mixed-signal" } },
      { label: "Careers & Exam Prep", techLink: { name: "VLSI Careers & Exam Pathways", academy: "vlsi", slug: "vlsi-careers" } },
    ],
    salaryRange: "Not a single scale — Indian services-company VLSI roles and Tier-1 global product-company roles (Intel, Qualcomm, NVIDIA) pay on genuinely different structures for similarly-titled work, and the gap is large. Check current listings for the specific company tier you're targeting rather than a blended figure.",
    jobTitles: ["Functional Verification Engineer", "RTL Design Engineer", "Physical Design Engineer", "Analog Design Engineer"],
    topEmployers: ["Intel", "Qualcomm", "AMD", "NVIDIA", "Synopsys", "Cadence", "Texas Instruments", "MediaTek"],
    timelineNote: "GATE EC (not a separate 'GATE VLSI' paper) is the qualifying exam for MTech VLSI admission; Bangalore hosts roughly 60-65% of India's semiconductor design activity.", color: "#64748B",
  },
  "professional-certifications": {
    description: "Four standalone, widely-recognized professional certifications — project management (PMP), IT service management (ITIL), Agile delivery (Scrum), and process quality (Six Sigma) — each valuable independently, not a single linear curriculum.",
    whyChoose: "Unlike most roadmaps on this platform, these four certifications aren't sequential steps toward one role — they're four separate, real credentials a professional picks based on their actual career direction (delivery/PM, IT operations, Agile teams, or process improvement). This roadmap surveys all four at overview + fundamentals depth so you can compare and pick the one relevant to your role before going deeper.",
    skills: ["Project management fundamentals (PMBOK)", "Agile & Scrum framework", "ITIL 4 service management", "Six Sigma DMAIC methodology"],
    techLinks: [
      { name: "PMP — Overview", academy: "professional-certs", slug: "pmp", section: "overview" },
      { name: "PMP — Fundamentals", academy: "professional-certs", slug: "pmp", section: "fundamentals" },
      { name: "Scrum & Agile — Overview", academy: "professional-certs", slug: "scrum", section: "overview" },
      { name: "Scrum & Agile — Fundamentals", academy: "professional-certs", slug: "scrum", section: "fundamentals" },
      { name: "ITIL 4 — Overview", academy: "professional-certs", slug: "itil", section: "overview" },
      { name: "ITIL 4 — Fundamentals", academy: "professional-certs", slug: "itil", section: "fundamentals" },
      { name: "Six Sigma — Overview", academy: "professional-certs", slug: "six-sigma", section: "overview" },
      { name: "Six Sigma — Fundamentals", academy: "professional-certs", slug: "six-sigma", section: "fundamentals" },
    ],
    steps: [
      { label: "PMP — Overview", techLink: { name: "PMP — Overview", academy: "professional-certs", slug: "pmp", section: "overview" } },
      { label: "PMP — Fundamentals", techLink: { name: "PMP — Fundamentals", academy: "professional-certs", slug: "pmp", section: "fundamentals" } },
      { label: "Scrum & Agile — Overview", techLink: { name: "Scrum & Agile — Overview", academy: "professional-certs", slug: "scrum", section: "overview" } },
      { label: "Scrum & Agile — Fundamentals", techLink: { name: "Scrum & Agile — Fundamentals", academy: "professional-certs", slug: "scrum", section: "fundamentals" } },
      { label: "ITIL 4 — Overview", techLink: { name: "ITIL 4 — Overview", academy: "professional-certs", slug: "itil", section: "overview" } },
      { label: "ITIL 4 — Fundamentals", techLink: { name: "ITIL 4 — Fundamentals", academy: "professional-certs", slug: "itil", section: "fundamentals" } },
      { label: "Six Sigma — Overview", techLink: { name: "Six Sigma — Overview", academy: "professional-certs", slug: "six-sigma", section: "overview" } },
      { label: "Six Sigma — Fundamentals", techLink: { name: "Six Sigma — Fundamentals", academy: "professional-certs", slug: "six-sigma", section: "fundamentals" } },
    ],
    // 4 fully independent, non-reconverging tracks — see trackGroups'
    // type comment. Indices map 1:1 to the `steps` array immediately above.
    trackGroups: [
      { label: "PMP", stepIndices: [0, 1] },
      { label: "Scrum & Agile", stepIndices: [2, 3] },
      { label: "ITIL 4", stepIndices: [4, 5] },
      { label: "Six Sigma", stepIndices: [6, 7] },
    ],
    salaryRange: "Varies significantly by certification, industry, and seniority — these four credentials carry different market value depending on role and sector, more so than most single-track technical paths. Check current compensation benchmarks for your specific role, industry, and location before treating any figure as representative.",
    jobTitles: ["Project Manager (PMP)", "Scrum Master / Agile Coach", "IT Service Manager (ITIL)", "Process Improvement / Quality Manager (Six Sigma)"],
    topEmployers: ["Consulting firms", "IT services companies", "Manufacturing (Six Sigma)", "Any large organization running structured project delivery"],
    timelineNote: "Each certification has its own independent exam and eligibility path (PMP requires documented project-management experience hours; ITIL/Scrum have shorter, more accessible entry certifications) — pick one based on your actual career direction rather than pursuing all four.", color: "#14B8A6",
  },
  "economics-analyst": {
    description: "Micro and macro economic theory applied to India's actual economy — budget analysis, RBI monetary policy, and international trade — for research, policy, banking, and competitive-exam career paths.",
    whyChoose: "Economics knowledge is tested directly in UPSC, RBI Grade B, and banking exams, and is also a standalone analyst/research career path outside exam prep — this roadmap builds the theory first, then applies it specifically to the Indian economic and policy context most of these roles actually require.",
    skills: ["Microeconomic theory", "Macroeconomic theory", "Indian economic policy & reforms", "Union Budget & Economic Survey analysis", "RBI monetary policy mechanics", "International trade & balance of payments"],
    techLinks: [
      { name: "Microeconomics", academy: "economics", slug: "micro-economics" },
      { name: "Macroeconomics", academy: "economics", slug: "macro-economics" },
      { name: "Indian Economy", academy: "economics", slug: "indian-economy" },
      { name: "Union Budget & Economic Survey", academy: "economics", slug: "budget-analysis" },
      { name: "RBI & Monetary Policy", academy: "economics", slug: "rbi-monetary-policy" },
      { name: "International Trade", academy: "economics", slug: "international-trade" },
    ],
    steps: [
      { label: "Microeconomics", techLink: { name: "Microeconomics", academy: "economics", slug: "micro-economics" } },
      { label: "Macroeconomics", techLink: { name: "Macroeconomics", academy: "economics", slug: "macro-economics" } },
      { label: "Indian Economy", techLink: { name: "Indian Economy", academy: "economics", slug: "indian-economy" } },
      { label: "Union Budget & Economic Survey", techLink: { name: "Union Budget & Economic Survey", academy: "economics", slug: "budget-analysis" } },
      { label: "RBI & Monetary Policy", techLink: { name: "RBI & Monetary Policy", academy: "economics", slug: "rbi-monetary-policy" } },
      { label: "International Trade", techLink: { name: "International Trade", academy: "economics", slug: "international-trade" } },
    ],
    salaryRange: "Varies widely by path — a government/RBI/banking-exam route has fixed, published pay scales that change with each recruitment cycle; a private-sector research or policy-analyst role varies by employer and city. Check the specific exam's current official pay scale, or current market rates for the specific role, rather than a single blanket figure.",
    jobTitles: ["Research Economist", "Policy Analyst", "RBI Grade B Officer", "Banking/Financial Sector Analyst"],
    topEmployers: ["RBI", "NITI Aayog", "Ministry of Finance", "Public & private sector banks", "Research institutions (NCAER, ICRIER)", "Consulting firms"],
    timelineNote: "This is foundational theory + India-specific application — the exact next step (UPSC, RBI Grade B, banking exams, or a research-role application) depends on which specific path you're targeting, each with its own separate exam pattern and timeline.", color: "#F97316",
  },
};
