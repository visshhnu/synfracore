export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "DevOps, Cloud, AI & Life Blog",
  description: "Practical articles across DevOps, Cloud, AI, Security, Health, Career, Education and more — written by engineers and professionals.",
  keywords: ["DevOps blog", "Kubernetes", "Docker", "AWS", "AI engineering", "medical coding", "JEE preparation"],
  alternates: { canonical: "https://synfracore.com/blog" },
  openGraph: {
    title: "Blog | SynfraCore",
    description: "Practical articles for tech professionals and learners — DevOps, Cloud, AI, Security, Health, Education and more.",
    url: "https://synfracore.com/blog",
    type: "website",
    siteName: "SynfraCore",
  },
};

const articles = [
  { slug: "how-to-learn-devops-2026", title: "How to Learn DevOps in 2026: The Complete Roadmap", date: "Jan 2026", tag: "DevOps" },
  { slug: "devops-salary-india-2026", title: "DevOps Engineer Salary in India 2026: City-wise Breakdown", date: "Feb 2026", tag: "Career" },
  { slug: "ansible-vs-terraform-2026", title: "Ansible vs Terraform 2026: When to Use Each", date: "Feb 2026", tag: "DevOps" },
  { slug: "openshift-vs-kubernetes-2026", title: "OpenShift vs Kubernetes 2026: Enterprise Choice Explained", date: "Mar 2026", tag: "DevOps" },
  { slug: "terraform-best-practices-2026", title: "Terraform Best Practices 2026: How Senior Engineers Write IaC", date: "Mar 2026", tag: "Terraform" },
  { slug: "jenkins-pipeline-tutorial-2026", title: "Jenkins Pipeline Tutorial 2026: From Zero to Production", date: "Apr 2026", tag: "DevOps" },
  { slug: "gitops-argocd-beginners-2026", title: "GitOps with ArgoCD 2026: Everything You Need to Know", date: "Apr 2026", tag: "DevOps" },
  { slug: "cka-exam-guide-2026", title: "How to Pass the CKA Exam in 2026", date: "May 2026", tag: "DevOps" },
  { slug: "monitoring-prometheus-grafana-2026", title: "Prometheus and Grafana 2026: Complete Monitoring Setup", date: "May 2026", tag: "DevOps" },
  { slug: "aws-vs-azure-vs-gcp-2026", title: "AWS vs Azure vs GCP 2026: Which Cloud to Learn First?", date: "Jan 2026", tag: "Cloud" },
  { slug: "what-is-serverless-2026", title: "Serverless Computing 2026: What It Is and When to Use It", date: "Mar 2026", tag: "Cloud" },
  { slug: "cloud-cost-optimization-2026", title: "Cloud Cost Optimization 2026: Cut Your AWS Bill by 40%", date: "Apr 2026", tag: "Cloud" },
  { slug: "aws-networking-vpc-2026", title: "AWS VPC Networking 2026: Complete Guide for DevOps Engineers", date: "May 2026", tag: "Cloud" },
  { slug: "gcp-bigquery-guide-2026", title: "GCP BigQuery 2026: Serverless Data Warehouse That Processes Petabytes", date: "Jun 2026", tag: "Cloud" },
  { slug: "what-is-rag-2026", title: "What is RAG? Retrieval-Augmented Generation Explained", date: "Jan 2026", tag: "AI" },
  { slug: "langchain-tutorial-2026", title: "LangChain Tutorial 2026: Build AI Applications in Python", date: "Feb 2026", tag: "AI" },
  { slug: "llmops-production-2026", title: "LLMOps 2026: Running AI Applications in Production", date: "Mar 2026", tag: "AI" },
  { slug: "vector-databases-2026", title: "Vector Databases 2026: The Foundation of AI Search and RAG", date: "Apr 2026", tag: "AI" },
  { slug: "ai-engineering-roadmap-2026", title: "AI Engineer Roadmap 2026: From Developer to AI Engineer", date: "May 2026", tag: "AI" },
  { slug: "postgresql-vs-mysql-2026", title: "PostgreSQL vs MySQL 2026: Which Database to Choose?", date: "Jan 2026", tag: "Databases" },
  { slug: "redis-use-cases-2026", title: "Redis 2026: Six Production Use Cases Every Developer Should Know", date: "Feb 2026", tag: "Databases" },
  { slug: "mongodb-beginners-2026", title: "MongoDB 2026: When to Use Document Database and How to Start", date: "Mar 2026", tag: "Databases" },
  { slug: "elasticsearch-guide-2026", title: "Elasticsearch 2026: Full-Text Search and Log Analytics Guide", date: "Apr 2026", tag: "Databases" },
  { slug: "sql-interview-questions-2026", title: "Top 40 SQL Interview Questions 2026: Complete Answers", date: "May 2026", tag: "Databases" },
  { slug: "cybersecurity-roadmap-2026", title: "Cybersecurity Roadmap 2026: How to Break Into the Field", date: "Jan 2026", tag: "Security" },
  { slug: "owasp-top-10-2026", title: "OWASP Top 10 2026: Critical Web Security Every Developer Must Know", date: "Feb 2026", tag: "Security" },
  { slug: "devsecops-guide-2026", title: "DevSecOps 2026: Security Inside Your CI/CD Pipeline", date: "Mar 2026", tag: "Security" },
  { slug: "gut-health-complete-guide-2026", title: "Gut Health 2026: Complete Guide to Your Microbiome", date: "Jan 2026", tag: "Health" },
  { slug: "mental-health-tech-professionals-2026", title: "Mental Health for Tech Professionals 2026", date: "Feb 2026", tag: "Health" },
  { slug: "work-life-balance-2026", title: "Work-Life Balance in Tech 2026: What It Actually Means", date: "Mar 2026", tag: "Health" },
  { slug: "first-aid-basics-2026", title: "First Aid Basics 2026: What Everyone Should Know", date: "Mar 2026", tag: "Health" },
  { slug: "personal-finance-india-2026", title: "Personal Finance for Indian Developers 2026", date: "Apr 2026", tag: "Health" },
  { slug: "sleep-optimization-2026", title: "Sleep Optimization for Developers 2026: Sleep Better, Think Clearer", date: "Apr 2026", tag: "Health" },
  { slug: "medical-coding-career-2026", title: "Medical Coding Career 2026: Complete Guide for Beginners", date: "Feb 2026", tag: "Healthcare" },
  { slug: "jee-preparation-2026", title: "JEE 2026 Preparation: Complete Strategy to Crack IIT Entrance", date: "Jan 2026", tag: "Education" },
  { slug: "gate-cse-2026", title: "GATE CSE 2026: Complete Preparation Strategy", date: "Feb 2026", tag: "Education" },
  { slug: "dsa-roadmap-2026", title: "DSA Roadmap 2026: Master Algorithms for FAANG", date: "Jan 2026", tag: "Education" },
  { slug: "system-design-interview-2026", title: "System Design Interview 2026: How to Crack the Most Important Round", date: "Mar 2026", tag: "Education" },
  { slug: "java-interview-2026", title: "Java Interview Questions 2026: Top 40 With Detailed Answers", date: "Apr 2026", tag: "Education" },
  { slug: "docker-beginner-guide", title: "Docker for Beginners: From Zero to First Container", date: "Jan 2026", tag: "Docker" },
  { slug: "kubernetes-vs-docker-swarm", title: "Kubernetes vs Docker Swarm: Which to Learn First?", date: "Jan 2026", tag: "Kubernetes" },
  { slug: "kubernetes-troubleshooting", title: "Kubernetes Troubleshooting: Fix the 10 Most Common Issues", date: "Apr 2026", tag: "Kubernetes" },
  { slug: "rag-beginner-guide", title: "Build Your First RAG System — Step by Step", date: "Mar 2026", tag: "AI" },
  { slug: "postgresql-indexing-guide", title: "PostgreSQL Indexing: Make Your Queries 100x Faster", date: "Mar 2026", tag: "Databases" },
  { slug: "aws-cost-optimization", title: "AWS Cost Optimization: Practical Savings Guide", date: "Mar 2026", tag: "Cloud" },
  { slug: "terraform-aws-starter", title: "Your First Terraform Project on AWS", date: "Feb 2026", tag: "Terraform" },
  { slug: "ansible-playbook-guide", title: "Ansible Playbook Tutorial: Automate Everything", date: "Mar 2026", tag: "DevOps" },
  { slug: "ethical-hacking-roadmap-2026", title: "Ethical Hacking Roadmap 2026: From Beginner to OSCP", date: "Jan 2026", tag: "Security" },
  { slug: "soc-analyst-guide-2026", title: "SOC Analyst Career 2026: Your Complete Entry Guide", date: "Feb 2026", tag: "Security" },
  { slug: "network-security-guide-2026", title: "Network Security 2026: Fundamentals Every Engineer Must Know", date: "Mar 2026", tag: "Security" },
  { slug: "nutrition-for-tech-2026", title: "Nutrition for Tech Professionals 2026: Eat for Focus", date: "Feb 2026", tag: "Health" },
  { slug: "exercise-for-desk-workers-2026", title: "Exercise for Desk Workers 2026: Stay Healthy Sitting All Day", date: "Mar 2026", tag: "Health" },
  { slug: "digital-wellbeing-2026", title: "Digital Wellbeing 2026: Use Technology Without Being Used by It", date: "Apr 2026", tag: "Health" },
  { slug: "placement-prep-guide-2026", title: "Campus Placement Preparation 2026: Complete Guide for CS Students", date: "Mar 2026", tag: "Education" },
  { slug: "cpp-beginners-2026", title: "C++ for Beginners 2026: Learn the Language That Powers Everything", date: "Apr 2026", tag: "Education" },
  { slug: "os-concepts-interview-2026", title: "Operating Systems Interview Questions 2026: Top 40 With Answers", date: "May 2026", tag: "Education" },
  { slug: "computer-networks-interview-2026", title: "Computer Networks Interview Questions 2026: Top 35 With Answers", date: "Jun 2026", tag: "Education" },
  { slug: "neet-preparation-2026", title: "NEET 2026 Preparation: Complete Strategy to Crack Medical Entrance", date: "Jan 2026", tag: "Education" },
  { slug: "banking-exam-guide-2026", title: "Banking Exam 2026: Complete Guide for IBPS, SBI, and RRB PO", date: "Feb 2026", tag: "Education" },
  { slug: "upsc-prelims-strategy-2026", title: "UPSC Prelims 2026: Strategy to Clear GS Paper 1 and CSAT", date: "Mar 2026", tag: "Education" },
  { slug: "icd10-coding-guide-2026", title: "ICD-10-CM Coding 2026: Complete Beginner to Professional Guide", date: "Jan 2026", tag: "Healthcare" },
  { slug: "medical-coding-interview-2026", title: "Medical Coding Interview Questions 2026: Top 40 With Answers", date: "Feb 2026", tag: "Healthcare" },
  { slug: "devops-salary-india-2025", title: "DevOps Engineer Salary in India 2025: Breakdown", date: "Jan 2025", tag: "Career" },
  { slug: "cka-exam-guide", title: "CKA Exam Guide: How to Pass Certified Kubernetes Administrator", date: "Jan 2026", tag: "DevOps" },
];

const tagColors: Record<string, string> = {
  Docker: "#0EA5E9",
  Kubernetes: "#6366F1",
  Terraform: "#8B5CF6",
  Career: "#10B981",
  AI: "#EC4899",
  Cloud: "#06B6D4",
  DevOps: "#3B82F6",
  Databases: "#14B8A6",
  Security: "#EF4444",
  Health: "#22C55E",
  Education: "#A855F7",
  AWS: "#F97316",
  Ansible: "#EF4444",
  Healthcare: "#0EA5E9"
};

export default function BlogPage() {
  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "48px 24px" }}>
      <div style={{ marginBottom: "40px" }}>
        <h1 style={{ fontSize: "36px", fontWeight: 700, marginBottom: "12px" }}>Blog</h1>
        <p style={{ color: "var(--text-3)", fontSize: "16px" }}>
          Practical articles across DevOps, Cloud, AI, Security, Health, Education and more.
        </p>
      </div>
      <div style={{ display: "flex", flexDirection: "column", gap: "14px" }}>
        {articles.map((article) => {
          const color = tagColors[article.tag] || "#6366F1";
          return (
            <Link key={article.slug} href={`/blog/${article.slug}`} style={{ textDecoration: "none" }}>
              <article style={{ padding: "18px 22px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }} className="card-hover">
                <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
                  <span style={{ fontSize: "11px", padding: "2px 8px", borderRadius: "10px", fontWeight: 600, background: color + "20", color }}>{article.tag}</span>
                  <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{article.date}</span>
                </div>
                <h2 style={{ fontSize: "15px", fontWeight: 600, color: "var(--text-1)", lineHeight: "1.4", margin: 0 }}>{article.title}</h2>
              </article>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
