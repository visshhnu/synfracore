import Link from "next/link";
import { ArrowRight, Clock, Tag } from "lucide-react";
export const runtime = "edge";
export const metadata = {
  title: "Blog — SynfraCore",
  description: "DevOps, Cloud, and AI tutorials, career guides, and industry insights from the SynfraCore team.",
};

const posts = [
  {
    slug: "docker-beginner-guide",
    title: "Docker for Beginners: From Zero to Your First Container in 30 Minutes",
    excerpt: "Everything you need to know to get started with Docker — install, build your first image, and run a multi-container app. No prior experience needed.",
    tag: "Docker", readTime: "8 min", date: "Jan 2025", featured: true,
  },
  {
    slug: "kubernetes-vs-docker-swarm",
    title: "Kubernetes vs Docker Swarm in 2025: Which Should You Learn First?",
    excerpt: "A practical comparison for job seekers. Spoiler: the answer isn't 'learn both' — it depends entirely on your target companies.",
    tag: "Kubernetes", readTime: "6 min", date: "Jan 2025", featured: true,
  },
  {
    slug: "terraform-aws-starter",
    title: "Your First Terraform Project: Build a Complete AWS VPC in 20 Minutes",
    excerpt: "Step-by-step guide to provisioning a production-ready VPC with public/private subnets, NAT Gateway, and bastion host using Terraform.",
    tag: "Terraform", readTime: "10 min", date: "Feb 2025", featured: false,
  },
  {
    slug: "devops-salary-india-2025",
    title: "DevOps Engineer Salaries in India 2025: City-wise, Experience-wise Breakdown",
    excerpt: "Real salary data from 500+ DevOps engineers across Bangalore, Hyderabad, Mumbai, Pune, and Chennai. What to expect at each level.",
    tag: "Career", readTime: "5 min", date: "Feb 2025", featured: false,
  },
  {
    slug: "cka-exam-guide",
    title: "CKA Exam Guide 2025: What I Wish I Knew Before Studying",
    excerpt: "A practical CKA preparation guide from someone who passed on the first attempt — resources, time plan, and the 5 mistakes most candidates make.",
    tag: "Kubernetes", readTime: "12 min", date: "Mar 2025", featured: false,
  },
  {
    slug: "rag-beginner-guide",
    title: "Build a RAG System in Python: Step-by-Step with Claude API",
    excerpt: "Learn Retrieval-Augmented Generation from scratch. Build a document Q&A system that answers questions about your own PDF files.",
    tag: "AI", readTime: "15 min", date: "Mar 2025", featured: false,
  },
  {
    slug: "ansible-playbook-guide",
    title: "Your First Ansible Playbook: Automate Server Setup in 15 Minutes",
    excerpt: "Stop SSHing into servers one by one. Write one playbook, run it against 100 servers simultaneously. Complete beginner guide with real examples.",
    tag: "DevOps", readTime: "10 min", date: "Apr 2025", featured: false,
  },
  {
    slug: "postgresql-indexing-guide",
    title: "PostgreSQL Indexing: Why Your Queries Are Slow and How to Fix Them",
    excerpt: "EXPLAIN ANALYZE demystified. Learn to read query execution plans, understand when indexes help vs hurt, and fix the 5 most common slow query patterns.",
    tag: "Databases", readTime: "12 min", date: "Apr 2025", featured: false,
  },
  {
    slug: "aws-cost-optimization",
    title: "Reduce Your AWS Bill by 60%: Real Techniques That Actually Work",
    excerpt: "Not theory — actual changes that cut real AWS bills. Reserved instances, Savings Plans, right-sizing, S3 lifecycle rules, and the one setting most people miss.",
    tag: "Cloud", readTime: "8 min", date: "May 2025", featured: false,
  },
  {
    slug: "kubernetes-troubleshooting",
    title: "Kubernetes Troubleshooting: The 10 Most Common Issues and Fixes",
    excerpt: "CrashLoopBackOff, ImagePullBackOff, Pending pods, OOMKilled — every Kubernetes engineer hits these. Here is exactly how to diagnose and fix each one.",
    tag: "Kubernetes", readTime: "14 min", date: "May 2025", featured: false,
  },
];

const tagColors: Record<string, string> = {
  Docker: "#3B82F6", Kubernetes: "#8B5CF6", Terraform: "#7C3AED",
  Career: "#10B981", AI: "#F59E0B", Cloud: "#06B6D4",
};

export default function BlogPage() {
  const featured = posts.filter(p => p.featured);
  const rest = posts.filter(p => !p.featured);
  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ marginBottom: "48px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,4vw,44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "12px" }}>Blog</h1>
        <p style={{ color: "var(--text-4)", fontSize: "17px" }}>Practical guides on DevOps, Cloud, AI, and career growth.</p>
      </div>

      {/* Featured posts */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(420px, 1fr))", gap: "20px", marginBottom: "48px" }}>
        {featured.map(post => (
          <Link key={post.slug} href={`/blog/${post.slug}`}
            style={{ display: "flex", flexDirection: "column", gap: "16px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "28px", textDecoration: "none", color: "var(--text-1)" }}>
            <div style={{ display: "flex", gap: "8px", alignItems: "center" }}>
              <span style={{ background: `${tagColors[post.tag] || "#3B82F6"}18`, color: tagColors[post.tag] || "#3B82F6", padding: "3px 10px", borderRadius: "6px", fontSize: "12px", fontWeight: 700 }}>{post.tag}</span>
              <span style={{ background: "rgba(234,179,8,0.15)", color: "#B45309", padding: "3px 10px", borderRadius: "6px", fontSize: "11px", fontWeight: 600 }}>Featured</span>
            </div>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", lineHeight: 1.4, margin: 0 }}>{post.title}</h2>
            <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.7, margin: 0 }}>{post.excerpt}</p>
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginTop: "auto" }}>
              <div style={{ display: "flex", gap: "12px", fontSize: "12px", color: "var(--text-4)" }}>
                <span style={{ display: "flex", alignItems: "center", gap: "4px" }}><Clock size={11}/> {post.readTime} read</span>
                <span>{post.date}</span>
              </div>
              <span style={{ fontSize: "13px", fontWeight: 600, color: "#3B82F6" }}>Read →</span>
            </div>
          </Link>
        ))}
      </div>

      {/* All posts */}
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "16px", color: "var(--text-4)" }}>All Articles</h2>
      <div style={{ display: "flex", flexDirection: "column", gap: "1px", background: "var(--border)", borderRadius: "14px", overflow: "hidden", border: "1px solid var(--border)" }}>
        {rest.map(post => (
          <Link key={post.slug} href={`/blog/${post.slug}`}
            style={{ display: "flex", alignItems: "center", gap: "16px", background: "var(--bg-1)", padding: "18px 24px", textDecoration: "none", color: "var(--text-1)" }}>
            <span style={{ background: `${tagColors[post.tag] || "#3B82F6"}18`, color: tagColors[post.tag] || "#3B82F6", padding: "2px 8px", borderRadius: "4px", fontSize: "11px", fontWeight: 700, flexShrink: 0 }}>{post.tag}</span>
            <span style={{ flex: 1, fontSize: "15px", fontWeight: 500 }}>{post.title}</span>
            <div style={{ display: "flex", gap: "12px", fontSize: "12px", color: "var(--text-4)", flexShrink: 0, alignItems: "center" }}>
              <span>{post.readTime}</span>
              <span>{post.date}</span>
              <ArrowRight size={13}/>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
