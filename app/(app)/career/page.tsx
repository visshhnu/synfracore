"use client";
import Link from "next/link";
import { ArrowRight, TrendingUp } from "lucide-react";
export const runtime = "edge";

const CAREER_CLUSTERS = [
  {
    cluster: "Tech & Engineering", color: "#3B82F6", icon: "⚙️",
    description: "Software, DevOps, Cloud, AI, Data, Security — highest-paying careers in India's IT sector",
    careers: [
      { title: "DevOps Engineer", icon: "⚙️", salary: "₹8L–₹35L", demand: "Very High", roadmap: "/roadmaps/devops-engineer", academy: "/academies/devops", skills: ["Linux", "Docker", "Kubernetes", "CI/CD", "Cloud"], entry: "B.Tech/BSc + self-learning" },
      { title: "Cloud Architect", icon: "☁️", salary: "₹15L–₹60L", demand: "Very High", roadmap: "/roadmaps/cloud-architect", academy: "/academies/cloud", skills: ["AWS/Azure/GCP", "Terraform", "Security", "Cost Opt."], entry: "3+ yrs cloud experience" },
      { title: "AI Engineer", icon: "🤖", salary: "₹18L–₹80L", demand: "Extremely High", roadmap: "/roadmaps/ai-engineer", academy: "/academies/ai", skills: ["Python", "LLMs", "RAG", "LangChain"], entry: "Software/Data background" },
      { title: "Data Analyst", icon: "📊", salary: "₹5L–₹25L", demand: "High", roadmap: "/roadmaps/data-analyst", academy: "/academies/data", skills: ["SQL", "Python", "Power BI", "Excel"], entry: "Any degree + SQL/Python" },
      { title: "Security Engineer", icon: "🛡️", salary: "₹10L–₹45L", demand: "High", roadmap: "/roadmaps/security-engineer", academy: "/academies/security", skills: ["Network Security", "SIEM", "Pen Testing"], entry: "IT background + CEH/OSCP" },
      { title: "SRE / Platform Engineer", icon: "📡", salary: "₹20L–₹90L", demand: "Very High", roadmap: "/roadmaps/sre-engineer", academy: "/academies/devops", skills: ["Kubernetes", "SLOs", "Incident Mgmt"], entry: "3+ yrs DevOps/Cloud" },
    ],
  },
  {
    cluster: "Law & Legal", color: "#6366F1", icon: "⚖️",
    description: "Advocate, judiciary, corporate counsel, legal analyst — one of India's most respected professions",
    careers: [
      { title: "Advocate / Litigator", icon: "⚖️", salary: "₹3L–₹50L+ (variable)", demand: "Stable", roadmap: "/roadmaps/advocate-career", academy: "/academies/law", skills: ["Court procedure", "Drafting", "AIBE"], entry: "LLB + Bar Council enrollment" },
      { title: "Civil Judge / Judicial Officer", icon: "🏛️", salary: "₹13L–₹25L (govt)", demand: "Competitive exam", roadmap: "/roadmaps/judiciary-civil-judge", academy: "/academies/law", skills: ["Constitutional law", "CPC", "Criminal law"], entry: "LLB + State PSC exam" },
      { title: "Corporate Counsel", icon: "💼", salary: "₹8L–₹35L", demand: "Growing", roadmap: "/roadmaps/advocate-career", academy: "/academies/law", skills: ["Company law", "Contract drafting", "M&A"], entry: "LLB + 2–5 yrs litigation" },
    ],
  },
  {
    cluster: "Government & Civil Services", color: "#F59E0B", icon: "🏛️",
    description: "IAS, IPS, State PSC, Banking PO — prestige, security, and the opportunity to serve millions",
    careers: [
      { title: "IAS / IPS / IFS (UPSC)", icon: "🏛️", salary: "₹56K–₹2.5L/mo + perks", demand: "Extremely Competitive", roadmap: "/roadmaps/upsc-ias", academy: "/academies/exams", skills: ["General Studies I–IV", "Optional subject", "Essay"], entry: "Any graduation + UPSC exam" },
      { title: "State PSC Officer", icon: "🏛️", salary: "₹35K–₹1.5L/mo", demand: "Competitive", roadmap: "/roadmaps/state-psc-officer", academy: "/academies/state-psc", skills: ["State GK", "Polity", "Economy"], entry: "Graduation + State PSC exam" },
      { title: "Banking PO (SBI/IBPS)", icon: "🏦", salary: "₹52K–₹95K/mo", demand: "High (annual exam)", roadmap: "/roadmaps/banking-po", academy: "/academies/exams", skills: ["Quant aptitude", "Reasoning", "Banking awareness"], entry: "Graduation + IBPS/SBI exam" },
    ],
  },
  {
    cluster: "Finance & Commerce", color: "#14B8A6", icon: "💹",
    description: "CA, banking analyst, financial markets, SEBI — India's growing financial sector",
    careers: [
      { title: "Chartered Accountant (CA)", icon: "📒", salary: "₹7L–₹50L+", demand: "Always High", roadmap: "/roadmaps/ca-journey", academy: "/academies/finance", skills: ["Audit", "Taxation", "Ind AS", "Corporate law"], entry: "CA Foundation → Intermediate → Final + Articleship" },
      { title: "Banking Analyst / RM", icon: "🏦", salary: "₹5L–₹25L", demand: "High", roadmap: "/roadmaps/banking-finance-analyst", academy: "/academies/finance", skills: ["Credit analysis", "Financial modelling", "Banking regulation"], entry: "B.Com/MBA Finance + NISM certs" },
      { title: "Tax Consultant / GST Expert", icon: "🧾", salary: "₹4L–₹25L", demand: "High", roadmap: "/roadmaps/ca-journey", academy: "/academies/finance", skills: ["Income Tax", "GST", "TDS", "ITR filing"], entry: "CA / CS / B.Com + experience" },
    ],
  },
  {
    cluster: "Healthcare", color: "#F43F5E", icon: "🏥",
    description: "Medical coding, hospital administration, health IT — India's healthcare outsourcing industry grows 8%/year",
    careers: [
      { title: "Medical Coder (CPC)", icon: "🏥", salary: "₹3L–₹12L (India) | $45K–$85K (remote)", demand: "Very High", roadmap: "/roadmaps/healthcare-coder", academy: "/academies/healthcare", skills: ["ICD-10-CM", "CPT", "HCPCS", "Medical terminology"], entry: "Any graduate + CPC certification" },
    ],
  },
  {
    cluster: "Agriculture", color: "#22C55E", icon: "🌾",
    description: "Agricultural officer, NABARD, ICAR — India's ₹30L crore agriculture sector needs qualified professionals",
    careers: [
      { title: "Agricultural Field Officer (IBPS AFO)", icon: "🌾", salary: "₹36K–₹64K/mo (bank)", demand: "Good (annual exam)", roadmap: "/roadmaps/agricultural-officer", academy: "/academies/agriculture", skills: ["Agronomy", "Crop science", "Agri economics"], entry: "B.Sc Agriculture + IBPS AFO exam" },
      { title: "NABARD Development Manager", icon: "🌱", salary: "₹44,500+/mo (Grade A)", demand: "Competitive", roadmap: "/roadmaps/agricultural-officer", academy: "/academies/agriculture", skills: ["Agricultural finance", "Rural development", "NABARD schemes"], entry: "Agriculture/Finance degree + NABARD exam" },
    ],
  },
  {
    cluster: "Telecom", color: "#0EA5E9", icon: "📡",
    description: "BSNL JTO, network engineer, 5G specialist — India's telecom sector is in the middle of a 5G build-out",
    careers: [
      { title: "BSNL JTO / JE", icon: "📡", salary: "₹60,000+/mo (govt)", demand: "Good (GATE/Direct)", roadmap: "/roadmaps/telecom-engineer", academy: "/academies/telecom", skills: ["Electronics", "4G/5G", "Transmission"], entry: "B.Tech ECE + GATE/BSNL JTO exam" },
      { title: "Network Engineer (Private Telco)", icon: "🌐", salary: "₹6L–₹25L", demand: "High", roadmap: "/roadmaps/telecom-engineer", academy: "/academies/telecom", skills: ["Routing/Switching", "5G NR", "MPLS"], entry: "B.Tech ECE/CSE + CCNA/CCNP" },
    ],
  },
  {
    cluster: "Education", color: "#8B5CF6", icon: "🎓",
    description: "CTET/TET teacher, NEET/JEE exam pathway, EdTech — education is one of India's largest employment sectors",
    careers: [
      { title: "NEET → MBBS Doctor", icon: "🧬", salary: "₹1.5L–₹2.5L/mo (resident) | ₹15L–₹1Cr+ (specialist)", demand: "Always High", roadmap: "/roadmaps/neet-medical", academy: "/academies/exams", skills: ["Biology", "Physics", "Chemistry"], entry: "Class 12 PCB + NEET exam" },
      { title: "JEE → Engineering (IIT/NIT)", icon: "🔬", salary: "₹10L–₹1.5Cr+ (placement)", demand: "Always High", roadmap: "/roadmaps/jee-engineering", academy: "/academies/exams", skills: ["Maths", "Physics", "Chemistry"], entry: "Class 12 PCM + JEE Main + Advanced" },
    ],
  },
];

export default function CareerPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ textAlign: "center", marginBottom: "56px" }}>
        <div style={{ display: "inline-block", background: "rgba(99,102,241,0.1)", border: "1px solid rgba(99,102,241,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#6366F1", fontWeight: 600, marginBottom: "16px" }}>
          8 Career Clusters · All Domains
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,5vw,52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Career Guide
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "17px", maxWidth: "640px", margin: "0 auto", lineHeight: 1.6 }}>
          Every career cluster, every domain. Find where you want to go, then follow the roadmap to get there.
        </p>
      </div>

      {CAREER_CLUSTERS.map(cluster => (
        <div key={cluster.cluster} style={{ marginBottom: "48px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "20px", paddingBottom: "12px", borderBottom: `2px solid ${cluster.color}30` }}>
            <span style={{ fontSize: "24px" }}>{cluster.icon}</span>
            <div>
              <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "20px", fontWeight: 800, marginBottom: "2px" }}>{cluster.cluster}</h2>
              <p style={{ color: "var(--text-4)", fontSize: "13px", margin: 0 }}>{cluster.description}</p>
            </div>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 320px), 1fr))", gap: "14px" }}>
            {cluster.careers.map(career => (
              <div key={career.title} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px", borderLeft: `3px solid ${cluster.color}` }}>
                <div style={{ display: "flex", gap: "10px", alignItems: "flex-start", marginBottom: "12px" }}>
                  <span style={{ fontSize: "22px", flexShrink: 0 }}>{career.icon}</span>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "4px" }}>{career.title}</div>
                    <div style={{ display: "flex", gap: "6px", alignItems: "center", flexWrap: "wrap" }}>
                      <span style={{ fontSize: "11px", color: "#10B981", fontWeight: 700 }}>{career.salary}</span>
                      <span style={{ fontSize: "10px", padding: "1px 7px", borderRadius: "10px", background: cluster.color + "15", color: cluster.color, fontWeight: 600 }}>{career.demand}</span>
                    </div>
                  </div>
                </div>
                <div style={{ display: "flex", flexWrap: "wrap", gap: "4px", marginBottom: "12px" }}>
                  {career.skills.map(s => (
                    <span key={s} style={{ fontSize: "10px", padding: "2px 7px", borderRadius: "8px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-4)" }}>{s}</span>
                  ))}
                </div>
                <div style={{ fontSize: "11px", color: "var(--text-4)", marginBottom: "12px", paddingTop: "8px", borderTop: "1px solid var(--border)" }}>
                  <span style={{ fontWeight: 600, color: "var(--text-3)" }}>Entry: </span>{career.entry}
                </div>
                <div style={{ display: "flex", gap: "8px" }}>
                  {career.roadmap && (
                    <Link href={career.roadmap} style={{ textDecoration: "none", flex: 1 }}>
                      <div style={{ padding: "7px 10px", borderRadius: "8px", background: cluster.color, color: "white", fontSize: "11px", fontWeight: 700, textAlign: "center", display: "flex", alignItems: "center", justifyContent: "center", gap: "4px" }}>
                        <TrendingUp size={11} /> Roadmap
                      </div>
                    </Link>
                  )}
                  <Link href={career.academy} style={{ textDecoration: "none", flex: 1 }}>
                    <div style={{ padding: "7px 10px", borderRadius: "8px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-2)", fontSize: "11px", fontWeight: 600, textAlign: "center", display: "flex", alignItems: "center", justifyContent: "center", gap: "4px" }}>
                      Start Learning <ArrowRight size={11} />
                    </div>
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
