export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "DevOps & Cloud Blog",
  description: "DevOps tutorials, Kubernetes guides, AWS tips, Terraform how-tos, and cloud engineering insights. Real articles from practising engineers.",
  keywords: ["DevOps blog", "Kubernetes tutorial", "Docker guide", "AWS tips", "Terraform", "cloud engineering blog", "SynfraCore"],
  alternates: { canonical: "https://synfracore.com/blog" },
  openGraph: {
    title: "DevOps & Cloud Blog | SynfraCore",
    description: "Kubernetes, Docker, AWS, Terraform and more — practical articles for cloud and DevOps engineers.",
    url: "https://synfracore.com/blog",
    type: "website",
    siteName: "SynfraCore",
  },
};

const articles = [
  { slug: "docker-beginner-guide", title: "Docker for Beginners — Complete Guide 2025", date: "Jan 15, 2025", category: "Docker", readTime: "12 min" },
  { slug: "kubernetes-vs-docker-swarm", title: "Kubernetes vs Docker Swarm — Which Should You Learn?", date: "Jan 22, 2025", category: "Kubernetes", readTime: "8 min" },
  { slug: "terraform-aws-starter", title: "Terraform on AWS — From Zero to First Infrastructure", date: "Feb 1, 2025", category: "Terraform", readTime: "15 min" },
  { slug: "devops-salary-india-2025", title: "DevOps Engineer Salary in India 2025 — Complete Breakdown", date: "Feb 10, 2025", category: "Career", readTime: "10 min" },
  { slug: "cka-exam-guide", title: "CKA Exam Guide — How to Pass Certified Kubernetes Administrator", date: "Feb 18, 2025", category: "Certifications", readTime: "20 min" },
  { slug: "rag-beginner-guide", title: "RAG for Beginners — Build Your First AI Search System", date: "Mar 1, 2025", category: "AI", readTime: "14 min" },
  { slug: "ansible-playbook-guide", title: "Ansible Playbook Tutorial — Automate Everything", date: "Mar 10, 2025", category: "Ansible", readTime: "18 min" },
  { slug: "postgresql-indexing-guide", title: "PostgreSQL Indexing — Speed Up Your Queries 10×", date: "Mar 20, 2025", category: "Databases", readTime: "12 min" },
  { slug: "aws-cost-optimization", title: "AWS Cost Optimization — Cut Your Cloud Bill by 40%", date: "Apr 1, 2025", category: "AWS", readTime: "16 min" },
  { slug: "kubernetes-troubleshooting", title: "Kubernetes Troubleshooting — Fix the 10 Most Common Issues", date: "Apr 15, 2025", category: "Kubernetes", readTime: "22 min" },
];

const categoryColors: Record<string, string> = {
  Docker: "#0EA5E9", Kubernetes: "#6366F1", Terraform: "#8B5CF6",
  Career: "#10B981", Certifications: "#F59E0B", AI: "#EC4899",
  Ansible: "#EF4444", Databases: "#14B8A6", AWS: "#F97316",
};

export default function BlogPage() {
  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "48px 24px" }}>
      <div style={{ marginBottom: "40px" }}>
        <h1 style={{ fontSize: "36px", fontWeight: 700, marginBottom: "12px" }}>Blog</h1>
        <p style={{ color: "var(--text-3)", fontSize: "16px" }}>
          Practical DevOps, Cloud, and AI articles — written by engineers, for engineers.
        </p>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "20px" }}>
        {articles.map((article) => (
          <Link key={article.slug} href={`/blog/${article.slug}`} style={{ textDecoration: "none" }}>
            <article
              style={{
                padding: "24px",
                borderRadius: "12px",
                border: "1px solid var(--border)",
                background: "var(--bg-1)",
                cursor: "pointer",
              }}
              className="card-hover"
            >
              <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "10px" }}>
                <span style={{
                  fontSize: "11px", padding: "2px 8px", borderRadius: "10px", fontWeight: 600,
                  background: (categoryColors[article.category] || "#6366F1") + "20",
                  color: categoryColors[article.category] || "#6366F1",
                }}>
                  {article.category}
                </span>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{article.date}</span>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>· {article.readTime} read</span>
              </div>
              <h2 style={{ fontSize: "18px", fontWeight: 600, color: "var(--text-1)", lineHeight: "1.4" }}>
                {article.title}
              </h2>
            </article>
          </Link>
        ))}
      </div>
    </div>
  );
}
