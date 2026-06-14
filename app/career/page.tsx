import Link from "next/link";
import { ArrowRight, Briefcase, TrendingUp, MapPin, DollarSign } from "lucide-react";

export const metadata = {
  title: "Career Guide — SynfraCore",
  description: "Career paths, salary guides, and job search strategies for tech professionals in India",
};

const careerPaths = [
  {
    title: "DevOps Engineer",
    icon: "⚙️",
    color: "#3B82F6",
    salaryRange: "₹6L – ₹40L",
    demand: "Very High",
    roadmapLink: "/roadmaps/devops-engineer",
    skills: ["Linux", "Docker", "Kubernetes", "CI/CD", "Terraform", "Cloud"],
    companies: ["Infosys", "TCS", "Wipro", "Amazon", "Microsoft", "Google"],
    jobTitles: ["DevOps Engineer", "Platform Engineer", "SRE", "Infrastructure Engineer"],
  },
  {
    title: "Cloud Architect",
    icon: "☁️",
    color: "#F59E0B",
    salaryRange: "₹15L – ₹80L",
    demand: "Very High",
    roadmapLink: "/roadmaps/cloud-architect",
    skills: ["AWS/Azure/GCP", "Networking", "Security", "Terraform", "Cost Optimization"],
    companies: ["Amazon", "Microsoft", "Google", "Accenture", "Deloitte", "KPMG"],
    jobTitles: ["Cloud Architect", "Solutions Architect", "Cloud Engineer"],
  },
  {
    title: "AI/ML Engineer",
    icon: "🤖",
    color: "#8B5CF6",
    salaryRange: "₹12L – ₹80L",
    demand: "Extremely High",
    roadmapLink: "/roadmaps/ai-engineer",
    skills: ["Python", "LLM APIs", "RAG", "AI Agents", "LLMOps", "Prompt Engineering"],
    companies: ["OpenAI", "Anthropic", "Google", "Microsoft", "Startups", "Consulting"],
    jobTitles: ["AI Engineer", "ML Engineer", "LLM Engineer", "AI Product Engineer"],
  },
  {
    title: "Data Analyst",
    icon: "📊",
    color: "#06B6D4",
    salaryRange: "₹4L – ₹25L",
    demand: "High",
    roadmapLink: "/roadmaps/data-analyst",
    skills: ["SQL", "Python/Pandas", "Excel", "Power BI/Tableau", "Statistics"],
    companies: ["Banks", "E-commerce", "FMCG", "Healthcare", "Consulting", "Tech"],
    jobTitles: ["Data Analyst", "Business Analyst", "BI Developer", "Analytics Engineer"],
  },
  {
    title: "Security Engineer",
    icon: "🛡️",
    color: "#EF4444",
    salaryRange: "₹8L – ₹50L",
    demand: "High",
    roadmapLink: "/roadmaps/security-engineer",
    skills: ["Network Security", "Cloud Security", "SIEM", "Ethical Hacking", "Compliance"],
    companies: ["Banks", "Government", "Consulting", "Tech Companies", "MSSPs"],
    jobTitles: ["Security Engineer", "SOC Analyst", "Penetration Tester", "Cloud Security Engineer"],
  },
  {
    title: "Platform Engineer",
    icon: "🏗️",
    color: "#10B981",
    salaryRange: "₹20L – ₹80L",
    demand: "High",
    roadmapLink: "/roadmaps/platform-engineer",
    skills: ["Kubernetes", "GitOps", "Service Mesh", "Developer Tooling", "Observability"],
    companies: ["Unicorns", "Product Companies", "Scale-ups", "Enterprise Tech"],
    jobTitles: ["Platform Engineer", "Staff Engineer", "Infrastructure Lead"],
  },
];

const jobSearchTips = [
  { step: "1", title: "Build Your Portfolio", desc: "3+ GitHub projects with clear READMEs. Employers check GitHub before interviews." },
  { step: "2", title: "Get Certified", desc: "1-2 relevant certifications prove skills to employers who can't verify them otherwise." },
  { step: "3", title: "Optimize LinkedIn", desc: "Complete profile, relevant headline, post content in your domain weekly." },
  { step: "4", title: "Apply Strategically", desc: "Apply to 20+ roles. Expect 3-5 interviews per offer. Numbers game — don't get discouraged." },
  { step: "5", title: "Prepare for Interviews", desc: "System design + technical + behavioral. All three matter equally for mid/senior roles." },
  { step: "6", title: "Negotiate Salary", desc: "Always negotiate. First offer is rarely final. Research market rates on Glassdoor/Levels.fyi." },
];

export default function CareerPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ textAlign: "center", marginBottom: "64px" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "20px" }}>
          <Briefcase size={14}/> Career in Tech
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Your Tech Career Guide
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "580px", margin: "0 auto", lineHeight: 1.7 }}>
          Salary ranges, career paths, job search strategies, and step-by-step roadmaps for every tech role
        </p>
      </div>

      {/* Career Paths Grid */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "24px" }}>Career Paths & Salaries (India 2025)</h2>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(360px, 1fr))", gap: "20px", marginBottom: "64px" }}>
        {careerPaths.map(path => (
          <div key={path.title} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "16px" }}>
              <div style={{ display: "flex", gap: "12px", alignItems: "center" }}>
                <span style={{ fontSize: "32px" }}>{path.icon}</span>
                <div>
                  <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "4px" }}>{path.title}</h3>
                  <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
                    <span style={{ display: "flex", alignItems: "center", gap: "4px", color: "#10B981", fontSize: "13px", fontWeight: 600 }}>
                      <DollarSign size={12}/>{path.salaryRange}
                    </span>
                    <span style={{ background: path.demand === "Extremely High" ? "#8B5CF622" : path.demand === "Very High" ? "#3B82F622" : "#10B98122", color: path.demand === "Extremely High" ? "#8B5CF6" : path.demand === "Very High" ? "#3B82F6" : "#10B981", padding: "1px 6px", borderRadius: "4px", fontSize: "10px", fontWeight: 700 }}>
                      {path.demand} Demand
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div style={{ marginBottom: "12px" }}>
              <div style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 600, letterSpacing: "0.08em", marginBottom: "6px" }}>KEY SKILLS</div>
              <div style={{ display: "flex", gap: "5px", flexWrap: "wrap" }}>
                {path.skills.map(s => (
                  <span key={s} style={{ background: `${path.color}15`, color: path.color, padding: "2px 7px", borderRadius: "4px", fontSize: "11px", fontWeight: 600 }}>{s}</span>
                ))}
              </div>
            </div>

            <div style={{ marginBottom: "16px" }}>
              <div style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 600, letterSpacing: "0.08em", marginBottom: "6px" }}>JOB TITLES</div>
              <div style={{ fontSize: "13px", color: "var(--text-3)" }}>{path.jobTitles.join(" · ")}</div>
            </div>

            <Link href={path.roadmapLink} style={{ display: "flex", alignItems: "center", gap: "6px", background: `${path.color}15`, color: path.color, border: `1px solid ${path.color}33`, padding: "10px 16px", borderRadius: "10px", textDecoration: "none", fontSize: "13px", fontWeight: 600 }}>
              <TrendingUp size={14}/> View Learning Roadmap <ArrowRight size={13} style={{ marginLeft: "auto" }}/>
            </Link>
          </div>
        ))}
      </div>

      {/* Job Search Tips */}
      <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "20px", padding: "40px", marginBottom: "48px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "32px" }}>
          Job Search Strategy
        </h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "20px" }}>
          {jobSearchTips.map(tip => (
            <div key={tip.step} style={{ display: "flex", gap: "16px" }}>
              <div style={{ width: "32px", height: "32px", borderRadius: "50%", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", display: "flex", alignItems: "center", justifyContent: "center", fontSize: "13px", fontWeight: 700, color: "#fff", flexShrink: 0 }}>{tip.step}</div>
              <div>
                <h4 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "4px" }}>{tip.title}</h4>
                <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6 }}>{tip.desc}</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Interview Prep CTA */}
      <div style={{ textAlign: "center", background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "48px 32px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "28px", fontWeight: 800, marginBottom: "12px" }}>Interview Preparation</h2>
        <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "500px", margin: "0 auto 28px", lineHeight: 1.7 }}>
          Every technology has a dedicated Interview Q&A section with the most asked questions and detailed answers.
        </p>
        <div style={{ display: "flex", gap: "16px", justifyContent: "center", flexWrap: "wrap" }}>
          <Link href="/interview" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
            Interview Questions <ArrowRight size={16}/>
          </Link>
          <Link href="/roadmaps" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "var(--bg-2)", border: "1px solid var(--border)", color: "var(--text-1)", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 600, textDecoration: "none" }}>
            View Roadmaps
          </Link>
        </div>
      </div>
    </div>
  );
}
