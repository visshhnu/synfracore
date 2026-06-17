export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "DevOps, Cloud, AI & Health Blog",
  description: "Tutorials, guides, and insights across DevOps, Cloud, AI, Security, Health, and Career topics — practical articles from practising engineers.",
  keywords: ["DevOps blog", "Kubernetes tutorial", "Docker guide", "AWS tips", "AI engineering", "health for developers"],
  alternates: { canonical: "https://synfracore.com/blog" },
  openGraph: {
    title: "DevOps, Cloud, AI & Health Blog | SynfraCore",
    description: "Practical articles for cloud and DevOps engineers — Kubernetes, Docker, AWS, Terraform, AI, and more.",
    url: "https://synfracore.com/blog",
    type: "website",
    siteName: "SynfraCore",
  },
};

const articles = [
  // DevOps
  { slug: "how-to-learn-devops-2026", title: "How to Learn DevOps in 2026: The Complete Roadmap", date: "Jan 2026", tag: "DevOps" },
  { slug: "ansible-vs-terraform-2026", title: "Ansible vs Terraform 2026: When to Use Each", date: "Feb 2026", tag: "DevOps" },
  { slug: "openshift-vs-kubernetes-2026", title: "OpenShift vs Kubernetes 2026: Enterprise Choice Explained", date: "Mar 2026", tag: "DevOps" },
  { slug: "jenkins-pipeline-tutorial-2026", title: "Jenkins Pipeline Tutorial 2026: From Zero to Production", date: "Apr 2026", tag: "DevOps" },
  { slug: "gitops-argocd-beginners-2026", title: "GitOps with ArgoCD 2026: Everything You Need to Know", date: "Apr 2026", tag: "DevOps" },
  { slug: "cka-exam-guide-2026", title: "How to Pass the CKA Exam in 2026: Complete Study Guide", date: "May 2026", tag: "DevOps" },
  { slug: "monitoring-prometheus-grafana-2026", title: "Prometheus and Grafana 2026: Complete Monitoring Setup", date: "May 2026", tag: "DevOps" },
  // Cloud
  { slug: "aws-vs-azure-vs-gcp-2026", title: "AWS vs Azure vs GCP 2026: Which Cloud to Learn First?", date: "Jan 2026", tag: "Cloud" },
  { slug: "terraform-aws-starter", title: "Your First Terraform Project: Build a Complete AWS VPC", date: "Feb 2026", tag: "Terraform" },
  { slug: "aws-cost-optimization", title: "AWS Cost Optimization: Cut Your Cloud Bill by 40%", date: "Mar 2026", tag: "AWS" },
  // AI
  { slug: "what-is-rag-2026", title: "What is RAG? Retrieval-Augmented Generation Explained (2026)", date: "Jan 2026", tag: "AI" },
  { slug: "rag-beginner-guide", title: "Build Your First RAG System — Step by Step", date: "Mar 2026", tag: "AI" },
  // Databases
  { slug: "postgresql-vs-mysql-2026", title: "PostgreSQL vs MySQL 2026: Which Database to Choose?", date: "Jan 2026", tag: "Databases" },
  { slug: "postgresql-indexing-guide", title: "PostgreSQL Indexing: Make Your Queries 100x Faster", date: "Mar 2026", tag: "Databases" },
  // Security
  { slug: "cybersecurity-roadmap-2026", title: "Cybersecurity Roadmap 2026: How to Break Into the Field", date: "Jan 2026", tag: "Security" },
  // Health & Wellness
  { slug: "gut-health-complete-guide-2026", title: "Gut Health 2026: Complete Guide to Your Microbiome", date: "Jan 2026", tag: "Health" },
  { slug: "mental-health-tech-professionals-2026", title: "Mental Health for Tech Professionals 2026", date: "Feb 2026", tag: "Health" },
  { slug: "work-life-balance-2026", title: "Work-Life Balance in Tech 2026: What It Actually Means", date: "Mar 2026", tag: "Health" },
  { slug: "personal-finance-india-2026", title: "Personal Finance for Indian Developers 2026", date: "Apr 2026", tag: "Health" },
  // Education & Career
  { slug: "dsa-roadmap-2026", title: "DSA Roadmap 2026: Master Algorithms for FAANG", date: "Jan 2026", tag: "Education" },
  { slug: "devops-salary-india-2026", title: "DevOps Engineer Salary in India 2026: Full Breakdown", date: "Feb 2026", tag: "Career" },
  // Original posts
  { slug: "docker-beginner-guide", title: "Docker for Beginners: From Zero to First Container", date: "Jan 2026", tag: "Docker" },
  { slug: "kubernetes-vs-docker-swarm", title: "Kubernetes vs Docker Swarm: Which to Learn First?", date: "Jan 2026", tag: "Kubernetes" },
  { slug: "kubernetes-troubleshooting", title: "Kubernetes Troubleshooting: Fix the 10 Most Common Issues", date: "Apr 2026", tag: "Kubernetes" },
];

const tagColors: Record<string, string> = {
  Docker: "#0EA5E9", Kubernetes: "#6366F1", Terraform: "#8B5CF6", Career: "#10B981",
  AI: "#EC4899", Cloud: "#06B6D4", DevOps: "#3B82F6", Databases: "#14B8A6",
  Security: "#EF4444", Health: "#22C55E", Education: "#A855F7", AWS: "#F97316", Ansible: "#EF4444",
};

export default function BlogPage() {
  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "48px 24px" }}>
      <div style={{ marginBottom: "40px" }}>
        <h1 style={{ fontSize: "36px", fontWeight: 700, marginBottom: "12px" }}>Blog</h1>
        <p style={{ color: "var(--text-3)", fontSize: "16px" }}>
          Practical DevOps, Cloud, AI, Security, and Life articles — written by engineers, for engineers.
        </p>
      </div>
      <div style={{ display: "flex", flexDirection: "column", gap: "16px" }}>
        {articles.map((article) => {
          const color = tagColors[article.tag] || "#6366F1";
          return (
            <Link key={article.slug} href={`/blog/${article.slug}`} style={{ textDecoration: "none" }}>
              <article style={{ padding: "20px 24px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }} className="card-hover">
                <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
                  <span style={{ fontSize: "11px", padding: "2px 8px", borderRadius: "10px", fontWeight: 600, background: color + "20", color }}>{article.tag}</span>
                  <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{article.date}</span>
                </div>
                <h2 style={{ fontSize: "16px", fontWeight: 600, color: "var(--text-1)", lineHeight: "1.4", margin: 0 }}>{article.title}</h2>
              </article>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
