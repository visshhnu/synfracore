import Link from "next/link";
import { ArrowRight, BookOpen, Target, Globe } from "lucide-react";

export const metadata = {
  title: "About — SynfraCore",
  description: "About SynfraCore — a comprehensive learning platform for DevOps, Cloud, AI, and tech professionals",
};

export default function AboutPage() {
  return (
    <div style={{ maxWidth: "860px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ marginBottom: "48px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "20px" }}>About SynfraCore</h1>
        <p style={{ fontSize: "18px", color: "var(--text-3)", lineHeight: 1.8, marginBottom: "16px" }}>
          SynfraCore is a comprehensive technical learning platform built for professionals and students who want to master the modern technology stack — from Linux fundamentals to AI engineering, from SQL to Kubernetes.
        </p>
        <p style={{ fontSize: "16px", color: "var(--text-4)", lineHeight: 1.8 }}>
          We believe learning should be practical, not just theoretical. Every section — from fundamentals to advanced — is designed to give you skills you can use in real jobs, not just pass an exam.
        </p>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "repeat(2, 1fr)", gap: "20px", marginBottom: "48px" }}>
        {[
          { icon: <BookOpen size={20}/>, title: "10 Academies", desc: "DevOps, Cloud, Databases, AI, Data, Security, Healthcare, Essentials, Education, Exams" },
          { icon: <Target size={20}/>, title: "101 Technologies", desc: "From Linux and Docker to RAG systems and UPSC preparation" },
          { icon: <Target size={20}/>, title: "For All Levels", desc: "Beginner to advanced — each topic has structured learning paths" },
          { icon: <Globe size={20}/>, title: "Made in India", desc: "Focused on Indian tech job market, salaries, and certifications" },
        ].map(item => (
          <div key={item.title} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px" }}>
            <div style={{ color: "#3B82F6", marginBottom: "12px" }}>{item.icon}</div>
            <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "8px" }}>{item.title}</h3>
            <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.6 }}>{item.desc}</p>
          </div>
        ))}
      </div>

      <div style={{ marginBottom: "48px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "16px" }}>What Makes Us Different</h2>
        <div style={{ display: "flex", flexDirection: "column", gap: "16px" }}>
          {[
            { title: "Real Labs, Not Just Theory", desc: "Interactive terminal simulation, SQL console, code editor — practice the actual commands and code you'll use at work." },
            { title: "Career-Focused Content", desc: "Every section is designed with employability in mind. Interview Q&A, projects for your portfolio, certification guides, and salary information." },
            { title: "India-Specific", desc: "Salary ranges in INR, focus on companies hiring in India, Indian exam preparation (GATE, JEE, UPSC, Banking), and healthcare coding for the Indian market." },
            { title: "AI-Powered Assistant", desc: "Ask questions about any technology and get instant, expert answers powered by Claude." },
          ].map(item => (
            <div key={item.title} style={{ borderLeft: "3px solid #3B82F6", paddingLeft: "20px" }}>
              <h4 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "6px" }}>{item.title}</h4>
              <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.6 }}>{item.desc}</p>
            </div>
          ))}
        </div>
      </div>

      <div style={{ textAlign: "center", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "20px", padding: "40px" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "12px" }}>Start Learning Today</h2>
        <p style={{ color: "var(--text-4)", marginBottom: "24px", fontSize: "15px" }}>Browse our academies, pick a technology, and start from the fundamentals.</p>
        <Link href="/academies" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
          Explore Academies <ArrowRight size={16}/>
        </Link>
      </div>
    </div>
  );
}
