import Link from "next/link";
export const runtime = "edge";
export const metadata = {
  title: "About SynfraCore",
  description: "SynfraCore is India's most comprehensive tech learning platform — DevOps, Cloud, AI, Databases, Security and more. Learn who we are and what we are building.",
};

const stats = [
  { value: "101", label: "Technologies" },
  { value: "10", label: "Learning Academies" },
  { value: "5,000+", label: "Content Pages" },
  { value: "100%", label: "Free to Start" },
];

const values = [
  { icon: "🎯", title: "Practical First", desc: "Every concept is backed by labs you can run, projects you can build, and interview questions you can answer. Theory without practice is useless." },
  { icon: "📈", title: "Career-Focused", desc: "Content is structured around what gets you hired and promoted — not what's academically interesting. Real job requirements drive every topic we cover." },
  { icon: "🌍", title: "Built for India", desc: "Salaries, job market data, and career paths reflect the Indian tech industry. We include cloud certifications, GATE, NEET, and government exam prep alongside DevOps and AI." },
  { icon: "🚀", title: "From Zero to Architect", desc: "Each technology has a clear path: Installation → Fundamentals → Intermediate → Advanced → Projects → Certification. No prerequisite knowledge assumed without being stated." },
  { icon: "💡", title: "Open Access", desc: "Core content is free. We believe access to quality technical education should not depend on your ability to pay ₹50,000 for a bootcamp." },
  { icon: "🔄", title: "Always Current", desc: "Tech moves fast. We update content when tools release major versions, when job market demands shift, and when better explanations emerge." },
];

const academies = [
  { icon: "⚙️", name: "DevOps", techs: "Linux, Docker, Kubernetes, Terraform, Ansible, Jenkins, ArgoCD" },
  { icon: "☁️", name: "Cloud", techs: "AWS, Azure, GCP — 20 services with hands-on labs" },
  { icon: "🗄️", name: "Databases", techs: "PostgreSQL, Redis, MongoDB, MySQL, Cassandra, Elasticsearch" },
  { icon: "🤖", name: "AI Engineering", techs: "LLMs, RAG, LangChain, AI Agents, Prompt Engineering, LLMOps" },
  { icon: "📊", name: "Data Analytics", techs: "SQL, Pandas, Power BI, Tableau" },
  { icon: "🛡️", name: "Security", techs: "Network Security, Ethical Hacking, SOC, SIEM, Pen Testing" },
  { icon: "🏥", name: "Healthcare Coding", techs: "ICD-10-CM, CPT, HCPCS, OASIS, PDGM — CPC exam prep" },
  { icon: "💡", name: "Life Essentials", techs: "Nutrition, Mental Health, Personal Finance, First Aid" },
  { icon: "🎓", name: "CS Education", techs: "DSA, OS, DBMS, System Design, Java, C, C++" },
  { icon: "📝", name: "Competitive Exams", techs: "GATE CSE/ECE, JEE, NEET, UPSC, SSC CGL, RRB NTPC" },
];

export default function AboutPage() {
  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ maxWidth: "720px", marginBottom: "64px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px,4vw,52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "20px" }}>
          About SynfraCore
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", lineHeight: 1.8 }}>
          SynfraCore is a tech learning platform built for engineers who want to go deep — not just watch videos, but actually build things, pass certifications, and get hired into better roles.
        </p>
        <p style={{ color: "var(--text-4)", fontSize: "18px", lineHeight: 1.8, marginTop: "16px" }}>
          We cover 101 technologies across DevOps, Cloud, AI, Databases, Security, Healthcare Coding, and more — each with a complete learning path from installation guides to advanced architecture to interview preparation.
        </p>
      </div>

      {/* Stats */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: "16px", marginBottom: "64px" }}>
        {stats.map(s => (
          <div key={s.label} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px", textAlign: "center" }}>
            <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "28px", fontWeight: 800, color: "#3B82F6", marginBottom: "6px" }}>{s.value}</div>
            <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{s.label}</div>
          </div>
        ))}
      </div>

      {/* What we cover */}
      <div style={{ marginBottom: "64px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "24px" }}>What We Cover</h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "12px" }}>
          {academies.map(a => (
            <div key={a.name} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "18px" }}>
              <div style={{ display: "flex", gap: "10px", alignItems: "center", marginBottom: "8px" }}>
                <span style={{ fontSize: "20px" }}>{a.icon}</span>
                <span style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px" }}>{a.name}</span>
              </div>
              <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6, margin: 0 }}>{a.techs}</p>
            </div>
          ))}
        </div>
      </div>

      {/* Values */}
      <div style={{ marginBottom: "64px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "24px" }}>Our Approach</h2>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "20px" }}>
          {values.map(v => (
            <div key={v.title} style={{ display: "flex", gap: "16px" }}>
              <span style={{ fontSize: "24px", flexShrink: 0, marginTop: "2px" }}>{v.icon}</span>
              <div>
                <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "6px" }}>{v.title}</h3>
                <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.7, margin: 0 }}>{v.desc}</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* CTA */}
      <div style={{ display: "flex", gap: "16px", flexWrap: "wrap" }}>
        <Link href="/academies" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 28px", borderRadius: "12px", textDecoration: "none", fontSize: "15px", fontWeight: 700 }}>
          Browse Academies →
        </Link>
        <Link href="/contact" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-2)", padding: "14px 28px", borderRadius: "12px", textDecoration: "none", fontSize: "15px", fontWeight: 600 }}>
          Contact Us
        </Link>
      </div>
    </div>
  );
}
