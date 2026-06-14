import Link from "next/link";
import { ArrowRight, BookOpen } from "lucide-react";

export const metadata = {
  title: "Blog — SynfraCore",
  description: "Tech articles, career tips, and learning guides",
};

const posts = [
  { title: "How to Pass the CKA Exam in 60 Days", slug: "#", date: "Jan 2025", readTime: "8 min", tags: ["Kubernetes", "Certification"] },
  { title: "DevOps vs Platform Engineering — What's the Difference?", slug: "#", date: "Jan 2025", readTime: "6 min", tags: ["Career", "DevOps"] },
  { title: "The Complete Guide to AWS Cost Optimization", slug: "#", date: "Dec 2024", readTime: "12 min", tags: ["AWS", "FinOps"] },
  { title: "Building Your First RAG App with LangChain and Claude", slug: "#", date: "Dec 2024", readTime: "10 min", tags: ["AI", "RAG", "Python"] },
  { title: "GATE CSE 2025 Preparation Strategy — From 0 to 700+", slug: "#", date: "Nov 2024", readTime: "15 min", tags: ["GATE", "Exam Prep"] },
  { title: "Kubernetes Networking Explained — Services, Ingress, and CNI", slug: "#", date: "Nov 2024", readTime: "14 min", tags: ["Kubernetes", "Networking"] },
];

export default function BlogPage() {
  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ marginBottom: "48px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 48px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>Blog</h1>
        <p style={{ color: "var(--text-4)", fontSize: "17px", lineHeight: 1.7 }}>Tech deep-dives, career tips, and learning guides</p>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "1px", background: "var(--border)", borderRadius: "16px", overflow: "hidden" }}>
        {posts.map((post, i) => (
          <Link key={i} href={post.slug}
            style={{ display: "flex", justifyContent: "space-between", alignItems: "center", gap: "16px", background: "var(--bg-1)", padding: "20px 24px", textDecoration: "none", color: "var(--text-1)", transition: "background 0.15s" }}
            onMouseEnter={e => (e.currentTarget.style.background = "var(--bg-2)")}
            onMouseLeave={e => (e.currentTarget.style.background = "var(--bg-1)")}>
            <div style={{ flex: 1, minWidth: 0 }}>
              <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "8px", lineHeight: 1.4 }}>{post.title}</h2>
              <div style={{ display: "flex", gap: "8px", alignItems: "center", flexWrap: "wrap" }}>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{post.date}</span>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>·</span>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{post.readTime} read</span>
                {post.tags.map(t => (
                  <span key={t} style={{ background: "rgba(59,130,246,0.1)", color: "#3B82F6", padding: "1px 7px", borderRadius: "4px", fontSize: "11px", fontWeight: 600 }}>{t}</span>
                ))}
              </div>
            </div>
            <ArrowRight size={16} color="var(--text-4)" style={{ flexShrink: 0 }}/>
          </Link>
        ))}
      </div>

      <div style={{ marginTop: "48px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "32px", textAlign: "center" }}>
        <BookOpen size={32} style={{ margin: "0 auto 16px", color: "#3B82F6" }}/>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "8px" }}>Learn by doing, not just reading</h3>
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "20px", lineHeight: 1.6 }}>
          Our labs and projects section has interactive content that goes deeper than blog posts.
        </p>
        <Link href="/labs" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "12px 24px", borderRadius: "10px", fontSize: "14px", fontWeight: 700, textDecoration: "none" }}>
          Go to Labs <ArrowRight size={14}/>
        </Link>
      </div>
    </div>
  );
}
