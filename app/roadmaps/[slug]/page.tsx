export const runtime = "edge";
import { roadmaps } from "@/lib/data/navigation";
import { notFound } from "next/navigation";
import Link from "next/link";
import { Clock, ArrowRight, BookOpen, Target, TrendingUp, Users, Briefcase } from "lucide-react";

type Props = { params: Promise<{ slug: string }> };

const roadmapDetails: Record<string, {
  description: string; whyChoose: string; skills: string[];
  techLinks: { name: string; academy: string; slug: string }[];
  salaryRange: string; jobTitles: string[]; topEmployers: string[];
  timelineNote: string; color: string;
}> = {
  "devops-engineer": {
    description: "Master the tools and practices modern engineering teams use to ship software fast and reliably.",
    whyChoose: "One of the highest-demand roles in Indian tech. Strong salary growth from Year 1. Clear skill progression.",
    skills: ["Linux administration", "Docker & Kubernetes", "CI/CD pipelines", "Cloud (AWS/Azure/GCP)", "Infrastructure as Code", "Monitoring & Observability"],
    techLinks: [
      { name: "Phase 1: Linux & Shell", academy: "devops", slug: "linux" },
      { name: "Phase 1: Shell Scripting", academy: "devops", slug: "shell-scripting" },
      { name: "Phase 2: Git & GitHub", academy: "devops", slug: "git" },
      { name: "Phase 2: Docker", academy: "devops", slug: "docker" },
      { name: "Phase 3: Kubernetes", academy: "devops", slug: "kubernetes" },
      { name: "Phase 4: Jenkins/CI-CD", academy: "devops", slug: "jenkins" },
      { name: "Phase 4: ArgoCD/GitOps", academy: "devops", slug: "argocd" },
      { name: "Phase 5: AWS EC2", academy: "cloud", slug: "aws-ec2" },
      { name: "Phase 6: Prometheus", academy: "devops", slug: "prometheus" },
      { name: "Phase 6: Grafana", academy: "devops", slug: "grafana" },
      { name: "Phase 6: Terraform", academy: "devops", slug: "terraform" },
      { name: "Phase 6: Ansible", academy: "devops", slug: "ansible" },
    ],
    salaryRange: "₹8L – ₹35L (India) | $90K – $160K (US)", jobTitles: ["DevOps Engineer", "Platform Engineer", "SRE", "Infrastructure Engineer"],
    topEmployers: ["Amazon", "Microsoft", "Infosys", "Wipro", "Juspay", "Razorpay", "Atlassian", "ThoughtWorks"],
    timelineNote: "Most people land their first DevOps role in 4–8 months of focused learning. Kubernetes + one cloud provider is the minimum bar.", color: "#3B82F6",
  },
  "cloud-architect": {
    description: "Design and build scalable, secure, cost-effective cloud infrastructure across AWS, Azure, or GCP.",
    whyChoose: "Highest-paying non-executive tech role. Every enterprise migrating to cloud needs architects. Certifications accelerate hiring.",
    skills: ["Multi-cloud architecture", "Networking & security", "High availability design", "Cost optimization", "Migration strategy", "Compliance & governance"],
    techLinks: [
      { name: "Phase 1: Cloud Fundamentals", academy: "cloud", slug: "cloud-fundamentals" },
      { name: "Phase 2: AWS IAM", academy: "cloud", slug: "aws-iam" },
      { name: "Phase 2: AWS EC2", academy: "cloud", slug: "aws-ec2" },
      { name: "Phase 2: AWS VPC", academy: "cloud", slug: "aws-vpc" },
      { name: "Phase 3: Azure AKS", academy: "cloud", slug: "azure-aks" },
      { name: "Phase 4: Cloud Security", academy: "cloud", slug: "cloud-security" },
      { name: "Phase 6: Terraform (IaC)", academy: "devops", slug: "terraform" },
      { name: "Phase 7: Cost Optimization", academy: "cloud", slug: "cost-optimization" },
    ],
    salaryRange: "₹15L – ₹60L (India) | $130K – $200K (US)", jobTitles: ["Cloud Architect", "Solutions Architect", "Cloud Engineer", "Principal Engineer"],
    topEmployers: ["Amazon", "Microsoft", "Google", "Accenture", "Deloitte", "KPMG", "TCS Digital"],
    timelineNote: "Typically 2+ years of hands-on cloud work before architect level. AWS SAA/Professional certifications are strong accelerators.", color: "#0EA5E9",
  },
  "platform-engineer": {
    description: "Build the internal developer platform that other engineers build on. Create the golden path for production deployments.",
    whyChoose: "Emerging senior role at top engineering companies. Very high impact, relatively few practitioners.",
    skills: ["Kubernetes advanced", "GitOps", "Service mesh", "Developer tooling", "Observability stack", "Self-service platforms"],
    techLinks: [
      { name: "Kubernetes", academy: "devops", slug: "kubernetes" }, { name: "Helm", academy: "devops", slug: "helm" },
      { name: "ArgoCD", academy: "devops", slug: "argocd" }, { name: "Istio", academy: "devops", slug: "istio" },
      { name: "Prometheus", academy: "devops", slug: "prometheus" }, { name: "Terraform", academy: "devops", slug: "terraform" },
    ],
    salaryRange: "₹20L – ₹80L (India) | $140K – $220K (US)", jobTitles: ["Platform Engineer", "Senior DevOps Engineer", "Infrastructure Lead", "Staff Engineer"],
    topEmployers: ["Razorpay", "Zepto", "Juspay", "PhonePe", "Atlassian", "ThoughtWorks"],
    timelineNote: "Requires 3–5 years of DevOps/Kubernetes experience. Build DevOps skills first.", color: "#6366F1",
  },
  "ai-engineer": {
    description: "Build AI-powered applications using large language models, RAG systems, and autonomous agents.",
    whyChoose: "Explosive demand — every company is building AI features. New field means experienced practitioners are rare.",
    skills: ["LLM APIs", "Prompt engineering", "RAG & vector databases", "AI agents & tools", "LLMOps & evaluation", "Python ML ecosystem"],
    techLinks: [
      { name: "AI Fundamentals", academy: "ai", slug: "ai-fundamentals" }, { name: "Prompt Engineering", academy: "ai", slug: "prompt-engineering" },
      { name: "LangChain", academy: "ai", slug: "langchain" }, { name: "RAG Systems", academy: "ai", slug: "rag" },
      { name: "AI Agents", academy: "ai", slug: "ai-agents" }, { name: "Python", academy: "devops", slug: "python" },
    ],
    salaryRange: "₹18L – ₹80L (India) | $150K – $300K (US)", jobTitles: ["AI Engineer", "ML Engineer", "LLM Engineer", "AI Product Engineer"],
    topEmployers: ["Sarvam AI", "Krutrim", "Google", "Microsoft", "Amazon", "AI Startups"],
    timelineNote: "Python proficiency is the prerequisite. Build portfolio projects — GitHub matters more than certifications.", color: "#8B5CF6",
  },
  "data-analyst": {
    description: "Turn raw data into business insights that drive decisions. Essential in every company.",
    whyChoose: "Accessible entry point into tech — SQL and Excel get you started. High demand across all industries.",
    skills: ["SQL (advanced)", "Python & Pandas", "Excel & Power Query", "Data visualization", "Power BI / Tableau", "Statistical analysis"],
    techLinks: [
      { name: "Excel", academy: "data", slug: "excel" }, { name: "SQL", academy: "databases", slug: "sql" },
      { name: "Power BI", academy: "data", slug: "power-bi" }, { name: "Tableau", academy: "data", slug: "tableau" },
      { name: "PostgreSQL", academy: "databases", slug: "postgresql" },
    ],
    salaryRange: "₹5L – ₹25L (India) | $60K – $120K (US)", jobTitles: ["Data Analyst", "Business Analyst", "BI Developer", "Analytics Engineer"],
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
      { name: "Ethical Hacking", academy: "security", slug: "ethical-hacking" },
      { name: "SOC Operations", academy: "security", slug: "soc" },
      { name: "DevSecOps", academy: "security", slug: "devsecops" },
    ],
    salaryRange: "₹10L – ₹45L (India) | $100K – $180K (US)", jobTitles: ["Security Engineer", "SOC Analyst", "Pen Tester", "CISO track"],
    topEmployers: ["BFSI sector", "Defense", "IT services (HCL, Infosys)", "Banks", "Government"],
    timelineNote: "CEH, OSCP, CompTIA Security+ certifications are valued. OWASP, TryHackMe for practice.", color: "#EF4444",
  },
  "database-engineer": {
    description: "Design, build, and maintain the databases that power modern applications.",
    whyChoose: "Foundational role — every application has a database. Growing demand for cloud database expertise.",
    skills: ["PostgreSQL & MySQL", "NoSQL (MongoDB, Redis)", "Database design", "Query optimization", "Replication & HA", "Cloud databases"],
    techLinks: [
      { name: "PostgreSQL", academy: "databases", slug: "postgresql" }, { name: "MySQL", academy: "databases", slug: "mysql" },
      { name: "Redis", academy: "databases", slug: "redis" }, { name: "MongoDB", academy: "databases", slug: "mongodb" },
      { name: "DynamoDB", academy: "databases", slug: "dynamodb" }, { name: "Elasticsearch", academy: "databases", slug: "elasticsearch" },
    ],
    salaryRange: "₹8L – ₹35L (India) | $100K – $170K (US)", jobTitles: ["Database Engineer", "DBA", "Data Infrastructure Engineer"],
    topEmployers: ["Banks", "E-commerce", "SaaS companies", "IT services"],
    timelineNote: "PostgreSQL expertise + cloud experience (RDS/Aurora) is the strongest combination.", color: "#10B981",
  },
  "data-engineer": {
    description: "Build the pipelines, warehouses, and infrastructure that move and transform data at scale.",
    whyChoose: "High demand in BFSI, e-commerce, and tech. Growing fast as companies collect more data.",
    skills: ["Python & Pandas", "SQL (advanced analytics)", "Apache Kafka", "Airflow", "dbt", "Cloud data warehouses"],
    techLinks: [
      { name: "Python", academy: "data", slug: "pandas" }, { name: "SQL", academy: "databases", slug: "sql" },
      { name: "Kafka", academy: "devops", slug: "kafka" }, { name: "PostgreSQL", academy: "databases", slug: "postgresql" },
    ],
    salaryRange: "₹10L – ₹40L (India) | $110K – $170K (US)", jobTitles: ["Data Engineer", "Analytics Engineer", "Data Infrastructure Engineer"],
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
      { name: "Grafana Dashboards", academy: "devops", slug: "grafana" },
      { name: "SLO Framework", academy: "devops", slug: "slo" },
      { name: "Incident Management", academy: "devops", slug: "incident" },
      { name: "HA & DR Design", academy: "devops", slug: "ha-dr" },
      { name: "Platform Engineering", academy: "devops", slug: "platform-engineering" },
    ],
    salaryRange: "₹20L – ₹90L (India) | $140K – $250K (US)", jobTitles: ["SRE", "Reliability Engineer", "Production Engineer"],
    topEmployers: ["Google", "Meta", "Razorpay", "Meesho", "Swiggy", "Zomato", "PhonePe"],
    timelineNote: "Not entry-level. Build DevOps + Kubernetes skills first (2–4 years), then transition.", color: "#EC4899",
  },
  "healthcare-coder": {
    description: "Convert clinical documentation into medical codes for billing and insurance. A specialised, globally portable skill.",
    whyChoose: "Work-from-home friendly. US healthcare outsourcing grows 8%/year. CPC certification opens international opportunities.",
    skills: ["ICD-10-CM diagnosis coding", "CPT procedure codes", "HCPCS Level II", "OASIS & PDGM", "Medical terminology", "CPC exam prep"],
    techLinks: [
      { name: "ICD-10-CM", academy: "healthcare", slug: "icd-10-cm" }, { name: "CPT Codes", academy: "healthcare", slug: "cpt" },
      { name: "Coding Guidelines", academy: "healthcare", slug: "coding-guidelines" },
    ],
    salaryRange: "₹3L – ₹12L (India) | $45K – $85K (US/remote)", jobTitles: ["Medical Coder", "HIM Specialist", "Coding Auditor"],
    topEmployers: ["Omega Healthcare", "Accenture Health", "Cognizant Health", "Gebbs Healthcare"],
    timelineNote: "CPC exam from AAPC after ~6 months study. Remote work available from Day 1 post-certification.", color: "#14B8A6",
  },
  "advocate-career": {
    description: "Build a career in legal practice — from enrollment to independent practice, law firms, or corporate legal roles.",
    whyChoose: "High intellectual challenge. Diverse career paths — litigation, corporate, government. Senior advocates earn crores.",
    skills: ["Core law (BNS, CrPC, CPC, Evidence)", "Legal drafting", "Court procedure", "AIBE preparation", "Specialisation", "Client management"],
    techLinks: [
      { name: "AIBE & Bar Exam", academy: "law", slug: "aibe-bar-exam" }, { name: "Legal Fundamentals", academy: "law", slug: "legal-fundamentals" },
      { name: "Constitutional Law", academy: "law", slug: "constitutional-law" }, { name: "Consumer Protection", academy: "law", slug: "consumer-protection" },
      { name: "CLAT Preparation", academy: "law", slug: "clat-prep" },
    ],
    salaryRange: "₹3L – ₹50L+ (variable by practice, city, specialisation)", jobTitles: ["Advocate", "Corporate Counsel", "Legal Analyst", "Law Firm Associate"],
    topEmployers: ["Law firms (AZB, Cyril Amarchand, Trilegal)", "In-house legal (Tech, BFSI)", "Government law offices", "DLSA/NALSA"],
    timelineNote: "Junior years (1–5) are hardest financially. Income grows significantly after Year 5–7.", color: "#6366F1",
  },
  "judiciary-civil-judge": {
    description: "Become a Civil Judge or Judicial Magistrate — a Gazetted Group-B officer in the Indian judiciary.",
    whyChoose: "Exceptional job security. Outstanding salary + perks (bungalow, vehicle). High social prestige. Path to High Court elevation.",
    skills: ["Constitutional & criminal law", "Civil procedure (CPC)", "Evidence law (BSA)", "Judgment writing", "Legal reasoning", "GK + language papers"],
    techLinks: [
      { name: "Judiciary Exams", academy: "law", slug: "judiciary-exams" }, { name: "Constitutional Law", academy: "law", slug: "constitutional-law" },
      { name: "Legal Fundamentals", academy: "law", slug: "legal-fundamentals" },
    ],
    salaryRange: "₹77,840 basic + perks ≈ ₹1.1L–₹1.5L/month (Civil Judge)", jobTitles: ["Civil Judge (Jr Division)", "Judicial Magistrate", "Additional District Judge"],
    topEmployers: ["State Government judicial services", "High Courts administer selections"],
    timelineNote: "Competitive: 2 lakh+ applicants for 300–500 seats in major states. Requires 1–3 years dedicated preparation.", color: "#A855F7",
  },
  "upsc-ias": {
    description: "Crack the UPSC Civil Services Examination to become an IAS, IPS, IFS, or other All India Service officer.",
    whyChoose: "Most prestigious exam in India. IAS officers have unmatched administrative power. Lifetime job security.",
    skills: ["Indian Polity & Governance", "Indian Economy", "History (Ancient, Medieval, Modern)", "Geography", "Environment & Ecology", "Ethics & Essay"],
    techLinks: [
      { name: "Indian Economy", academy: "economics", slug: "indian-economy" }, { name: "Budget Analysis", academy: "economics", slug: "budget-analysis" },
      { name: "Constitutional Law", academy: "law", slug: "constitutional-law" },
    ],
    salaryRange: "₹56,100–₹2,50,000 (7th Pay Commission, based on grade) + perks", jobTitles: ["IAS (District Collector, DM, Secretary)", "IPS (SP, DIG, IG)", "IFS (Diplomat)", "Other Group A Services"],
    topEmployers: ["Government of India", "State Governments"],
    timelineNote: "Average successful candidate attempts 3–4 times over 5–7 years. Start with NCERT books. Daily current affairs essential.", color: "#F59E0B",
  },
  "banking-po": {
    description: "Become a Probationary Officer at SBI, IBPS-linked banks or other PSBs.",
    whyChoose: "Stable government job with excellent perks. Rapid career progression. Available every year.",
    skills: ["Quantitative Aptitude", "Logical Reasoning", "English Language", "General/Banking Awareness", "Computer Basics"],
    techLinks: [
      { name: "Indian Economy", academy: "economics", slug: "indian-economy" }, { name: "Banking & RBI", academy: "finance", slug: "banking-rbi" },
      { name: "Budget Analysis", academy: "economics", slug: "budget-analysis" },
    ],
    salaryRange: "₹52,000–₹95,000/month (SBI PO) | ₹41,960–₹89,890/month (IBPS PO)", jobTitles: ["Probationary Officer", "Assistant Manager", "Branch Manager (after promotion)"],
    topEmployers: ["SBI", "PNB", "Bank of Baroda", "Canara Bank", "Union Bank", "Bank of India"],
    timelineNote: "SBI PO + IBPS PO: 2-phase prelims + mains + interview. Speed and accuracy are key.", color: "#10B981",
  },
  "state-psc-officer": {
    description: "Clear your State Public Service Commission exam for Group I/II/III posts — DSP, SDM, commercial tax officer, and more.",
    whyChoose: "State-level prestige. Work in your home state. Excellent job security and perks.",
    skills: ["State-specific GK", "State language", "Indian Polity & History", "Economy & Current Affairs", "Essay writing"],
    techLinks: [
      { name: "Indian Economy", academy: "economics", slug: "indian-economy" }, { name: "Constitutional Law", academy: "law", slug: "constitutional-law" },
    ],
    salaryRange: "₹35,000–₹1,50,000/month depending on group and post", jobTitles: ["Deputy SP", "SDM", "Commercial Tax Officer", "Block Development Officer"],
    topEmployers: ["TNPSC", "KPSC", "MPSC", "UP PSC", "APPSC", "TSPSC"],
    timelineNote: "Start with UPSC preparation, then add state-specific component (language, state history/geography).", color: "#8B5CF6",
  },
  "ca-journey": {
    description: "Complete the Chartered Accountancy qualification from ICAI — Foundation to Intermediate to Final over 4–5 years.",
    whyChoose: "Most respected finance qualification in India. Opens doors to Big 4, CFO track. Income scales rapidly after qualification.",
    skills: ["Financial accounting & Ind AS", "Taxation (Income Tax + GST)", "Auditing & Ethics", "Corporate law", "Cost accounting"],
    techLinks: [
      { name: "CA Foundation", academy: "finance", slug: "ca-cs-foundation" }, { name: "CA Intermediate", academy: "finance", slug: "ca-intermediate" },
      { name: "GST & Indirect Tax", academy: "finance", slug: "gst-taxation" }, { name: "Banking & RBI", academy: "finance", slug: "banking-rbi" },
    ],
    salaryRange: "₹7L–₹11L (Big 4 fresher) | ₹15L–₹50L+ (senior/industry)", jobTitles: ["Chartered Accountant", "Financial Controller", "CFO track", "Tax Consultant"],
    topEmployers: ["Deloitte", "EY", "KPMG", "PwC", "Grant Thornton", "MNCs", "Own practice"],
    timelineNote: "Foundation to Final + 3-year articleship. Most candidates take 5–6 years total. Persistence is everything.", color: "#F59E0B",
  },
  "banking-finance-analyst": {
    description: "Build a career in banking analysis, financial markets, or investment — at banks, NBFCs, brokerages, or AMCs.",
    whyChoose: "BFSI is India's largest employer. Diverse entry routes — banking exams, MBA Finance, NISM certifications.",
    skills: ["Accounting & financial statements", "Credit analysis", "Financial markets", "RBI/SEBI regulations", "Excel financial modelling"],
    techLinks: [
      { name: "Banking & RBI", academy: "finance", slug: "banking-rbi" }, { name: "SEBI & Markets", academy: "finance", slug: "sebi-nism" },
      { name: "Indian Economy", academy: "economics", slug: "indian-economy" },
    ],
    salaryRange: "₹5L – ₹25L (India, varies widely by role and firm)", jobTitles: ["Credit Analyst", "Equity Analyst", "Relationship Manager", "Risk Analyst"],
    topEmployers: ["HDFC Bank", "ICICI Bank", "Kotak Mahindra", "SBI", "SEBI", "RBI", "AMCs"],
    timelineNote: "NISM VA certification gets you started with mutual funds. CA or MBA Finance required for senior roles.", color: "#14B8A6",
  },
  "agricultural-officer": {
    description: "Become an Agricultural Field Officer at a bank (IBPS AFO), development officer at NABARD, or agricultural officer in state services.",
    whyChoose: "Growing sector. Government actively hiring. Rural banking expansion creating hundreds of AFO posts annually.",
    skills: ["Agronomy & crop science", "Soil science & fertilisers", "Plant pathology & IPM", "Agricultural economics", "Government schemes"],
    techLinks: [
      { name: "ICAR/IBPS AFO Prep", academy: "agriculture", slug: "icar-ibps-afo" }, { name: "Crop Science", academy: "agriculture", slug: "crop-science" },
      { name: "Organic Farming", academy: "agriculture", slug: "organic-farming" },
    ],
    salaryRange: "₹5L – ₹18L (IBPS AFO ₹36,000–₹63,840/month | NABARD Grade A ₹44,500+)", jobTitles: ["Agricultural Field Officer", "NABARD Development Manager", "Agricultural Extension Officer"],
    topEmployers: ["SBI (AFO)", "PNB", "Bank of Baroda", "NABARD", "ICAR institutes", "State Agriculture Departments"],
    timelineNote: "IBPS AFO exam every year. B.Sc Agriculture degree is mandatory. 6–8 months focused preparation sufficient.", color: "#22C55E",
  },
  "telecom-engineer": {
    description: "Build a career in India's telecom sector — as a BSNL JTO, network engineer, RAN specialist, or 5G architect.",
    whyChoose: "India is rolling out 5G aggressively. BSNL 4G/5G revival means thousands of JTO vacancies.",
    skills: ["Electronics & Communication fundamentals", "4G LTE & 5G NR architecture", "Transmission & fiber optics", "OSS/BSS systems", "Routing & switching"],
    techLinks: [
      { name: "BSNL JTO Prep", academy: "telecom", slug: "bsnl-jto-prep" }, { name: "Telecom Fundamentals", academy: "telecom", slug: "telecom-fundamentals" },
      { name: "Telecom Networking", academy: "telecom", slug: "networking-protocols" },
    ],
    salaryRange: "₹4L–₹20L (BSNL JTO ₹60,000+/month | Private telecom ₹6L–₹30L)", jobTitles: ["JTO (BSNL)", "Network Engineer", "RAN Engineer", "5G Solutions Architect"],
    topEmployers: ["BSNL", "MTNL", "Jio", "Airtel", "Vodafone Idea", "Nokia", "Ericsson"],
    timelineNote: "GATE ECE is the primary route for PSU telecom jobs. BSNL JTO direct exam is conducted irregularly.", color: "#0EA5E9",
  },
  "neet-medical": {
    description: "Clear NEET-UG to gain admission to MBBS, BDS, BAMS, BHMS at government and private colleges.",
    whyChoose: "One exam for all medical admissions in India. Government MBBS seats are heavily subsidised.",
    skills: ["Biology (Botany + Zoology)", "Physics (NEET pattern)", "Chemistry", "NCERT mastery", "Problem-solving speed"],
    techLinks: [
      { name: "NEET Biology", academy: "exams", slug: "neet-biology" }, { name: "NEET Physics", academy: "exams", slug: "neet-physics" },
    ],
    salaryRange: "MBBS: ₹1.5L–₹2.5L/month (resident) | ₹15L–₹1Cr+ (specialist in practice)", jobTitles: ["MBBS Doctor", "Specialist (after NEET-PG)", "Dentist (BDS)", "Ayurvedic Physician (BAMS)"],
    topEmployers: ["Government hospitals (AIIMS, PGI)", "Private hospitals", "Own clinic"],
    timelineNote: "NEET is conducted once per year (May). Biology carries 360 marks. Class 11+12 NCERT is the complete syllabus.", color: "#F43F5E",
  },
  "jee-engineering": {
    description: "Clear JEE Main and Advanced to gain admission to IITs, NITs, IIITs and other premier engineering institutions.",
    whyChoose: "IIT degree opens exceptional career doors — placements, startups, research, foreign universities.",
    skills: ["Mathematics (calculus, algebra, coordinate)", "Physics (mechanics, electrostatics)", "Chemistry (organic, inorganic, physical)"],
    techLinks: [
      { name: "JEE Mathematics", academy: "exams", slug: "jee-maths" }, { name: "JEE Physics", academy: "exams", slug: "jee-physics" },
      { name: "JEE Chemistry", academy: "exams", slug: "jee-chemistry" },
    ],
    salaryRange: "IIT graduates: ₹10L–₹1.5Cr+ (placement) | NIT: ₹6L–₹40L", jobTitles: ["Software Engineer", "Data Scientist", "Core Engineering", "Research Scientist"],
    topEmployers: ["Google", "Microsoft", "Amazon", "Goldman Sachs", "McKinsey", "Core engineering MNCs"],
    timelineNote: "JEE Main held twice (January + April). Top 2.5 lakh qualifiers appear for JEE Advanced. Negative marking applies.", color: "#3B82F6",
  },
  "personal-wellness": {
    description: "Build sustainable habits for physical health, mental wellbeing, financial security, and digital safety.",
    whyChoose: "Immediate impact on daily quality of life. Preventive health saves crores in future medical costs.",
    skills: ["Sleep & recovery", "Nutrition & hydration", "Daily movement", "Mental health practices", "Digital safety", "Personal finance basics"],
    techLinks: [
      { name: "Mental Wellness", academy: "essentials", slug: "mental-health" }, { name: "Nutrition Basics", academy: "essentials", slug: "nutrition" },
      { name: "Personal Finance", academy: "essentials", slug: "personal-finance" }, { name: "Digital Safety", academy: "essentials", slug: "digital-safety" },
    ],
    salaryRange: "Not a job path — life quality multiplier", jobTitles: ["N/A — personal development path"],
    topEmployers: ["N/A"],
    timelineNote: "Start with one habit. Small, consistent changes compound dramatically over 1–5 years.", color: "#22C55E",
  },
};

export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const rm = roadmaps.find(r => r.slug === slug);
  if (!rm) return { title: "Roadmap | SynfraCore" };
  const detail = roadmapDetails[slug];
  return {
    title: `${rm.title} Roadmap | SynfraCore`,
    description: detail?.description || `Complete learning roadmap for ${rm.title}`,
  };
}

export default async function RoadmapDetailPage({ params }: Props) {
  const { slug } = await params;
  const rm = roadmaps.find(r => r.slug === slug);
  if (!rm) notFound();
  const detail = roadmapDetails[slug];
  if (!detail) notFound();
  const color = detail.color;

  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "48px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "28px", display: "flex", gap: "6px", alignItems: "center" }}>
        <a href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</a>
        <span>›</span>
        <a href="/roadmaps" style={{ color: "var(--text-4)", textDecoration: "none" }}>Roadmaps</a>
        <span>›</span>
        <span style={{ color: "var(--text-2)" }}>{rm.title}</span>
      </nav>

      {/* Hero */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "20px", padding: "40px", marginBottom: "32px", borderTop: `4px solid ${color}` }}>
        <div style={{ display: "flex", gap: "20px", alignItems: "flex-start", flexWrap: "wrap" }}>
          <span style={{ fontSize: "52px" }}>{rm.icon}</span>
          <div style={{ flex: 1, minWidth: "260px" }}>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "clamp(22px,4vw,34px)", fontWeight: 800, marginBottom: "10px" }}>{rm.title}</h1>
            <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.6, marginBottom: "16px" }}>{detail.description}</p>
            <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
              <span style={{ background: color + "18", color, padding: "5px 14px", borderRadius: "10px", fontSize: "13px", fontWeight: 700 }}>
                {rm.duration}
              </span>
              <span style={{ background: "#10B98118", color: "#10B981", padding: "5px 14px", borderRadius: "10px", fontSize: "13px", fontWeight: 700 }}>
                {detail.salaryRange}
              </span>
            </div>
          </div>
        </div>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "20px", marginBottom: "28px" }}>
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "10px", color }}>Why this path</div>
          <p style={{ color: "var(--text-3)", fontSize: "13px", lineHeight: 1.6, margin: 0 }}>{detail.whyChoose}</p>
        </div>
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "10px", color }}>Job titles</div>
          <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
            {detail.jobTitles.slice(0, 4).map(t => (
              <div key={t} style={{ fontSize: "13px", color: "var(--text-3)", display: "flex", alignItems: "center", gap: "7px" }}>
                <div style={{ width: "5px", height: "5px", borderRadius: "50%", background: color, flexShrink: 0 }} />
                {t}
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Steps */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px", marginBottom: "24px" }}>
        <div style={{ fontWeight: 700, fontSize: "16px", marginBottom: "24px", color }}>Step-by-step roadmap</div>
        <div style={{ display: "flex", flexDirection: "column", gap: "0" }}>
          {rm.steps.map((step, i) => (
            <div key={step} style={{ display: "flex", gap: "16px" }}>
              <div style={{ display: "flex", flexDirection: "column", alignItems: "center", flexShrink: 0, width: "32px" }}>
                <div style={{ width: "32px", height: "32px", borderRadius: "50%", background: i === 0 ? color : "var(--bg-1)", border: `2px solid ${i === 0 ? color : "var(--border)"}`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "12px", fontWeight: 700, color: i === 0 ? "white" : "var(--text-4)", flexShrink: 0 }}>
                  {i + 1}
                </div>
                {i < rm.steps.length - 1 && <div style={{ width: "2px", flex: 1, background: "var(--border)", minHeight: "20px" }} />}
              </div>
              <div style={{ paddingBottom: "20px", flex: 1 }}>
                <div style={{ fontWeight: i === 0 ? 700 : 500, fontSize: "14px", color: i === 0 ? "var(--text-1)" : "var(--text-2)", paddingTop: "6px" }}>
                  {step}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Content links */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px", marginBottom: "24px" }}>
        <div style={{ fontWeight: 700, fontSize: "16px", marginBottom: "18px", color }}>Start learning — content pages</div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(180px, 1fr))", gap: "8px" }}>
          {detail.techLinks.map(t => (
            <Link key={t.slug} href={`/academies/${t.academy}/${t.slug}/overview`} style={{ textDecoration: "none" }}>
              <div style={{ padding: "10px 14px", borderRadius: "8px", border: "1px solid var(--border)", fontSize: "13px", color: "var(--text-2)", fontWeight: 500, display: "flex", alignItems: "center", justifyContent: "space-between", gap: "6px" }}>
                {t.name} <ArrowRight size={12} />
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Employers + Timeline */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "16px" }}>
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px" }}>
          <div style={{ fontWeight: 700, fontSize: "13px", marginBottom: "10px", color }}>Top employers</div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
            {detail.topEmployers.map(e => (
              <span key={e} style={{ fontSize: "11px", padding: "3px 9px", borderRadius: "12px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-3)" }}>{e}</span>
            ))}
          </div>
        </div>
        <div style={{ background: color + "08", border: `1px solid ${color}30`, borderRadius: "14px", padding: "20px" }}>
          <div style={{ fontWeight: 700, fontSize: "13px", marginBottom: "8px", color }}>Timeline reality check</div>
          <p style={{ fontSize: "12px", color: "var(--text-3)", lineHeight: 1.6, margin: 0 }}>{detail.timelineNote}</p>
        </div>
      </div>

      <div style={{ marginTop: "24px", textAlign: "center" }}>
        <Link href="/roadmaps" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none" }}>
          ← All roadmaps
        </Link>
      </div>
    </div>
  );
}
