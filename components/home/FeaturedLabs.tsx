import Link from "next/link";
import { FlaskConical, ArrowRight, Clock } from "lucide-react";

const featuredLabs = [
  {
    title: "Deploy a 3-Tier App on Kubernetes",
    tech: "Kubernetes",
    icon: "☸",
    level: "Intermediate",
    duration: "2 hours",
    desc: "Build frontend, backend, and database pods with services and ingress",
    color: "#3B82F6",
    academy: "infrastructure",
    slug: "kubernetes",
  },
  {
    title: "Zero-Downtime Deploy with ArgoCD",
    tech: "ArgoCD",
    icon: ">",
    level: "Advanced",
    duration: "3 hours",
    desc: "Implement GitOps CD pipeline with blue-green deployment strategy",
    color: "#EC4899",
    academy: "infrastructure",
    slug: "argocd",
  },
  {
    title: "Terraform AWS VPC from Scratch",
    tech: "Terraform",
    icon: "[P]",
    level: "Intermediate",
    duration: "1.5 hours",
    desc: "Create a production VPC with public/private subnets, NAT gateway, and routing",
    color: "#8B5CF6",
    academy: "infrastructure",
    slug: "terraform",
  },
  {
    title: "Build a RAG Pipeline with LangChain",
    tech: "LangChain",
    icon: "⛓",
    level: "Advanced",
    duration: "2.5 hours",
    desc: "Ingest documents, embed to Chroma, and query with GPT-4 using RAG",
    color: "#10B981",
    academy: "ai",
    slug: "langchain",
  },
  {
    title: "Prometheus + Grafana Stack",
    tech: "Prometheus",
    icon: ">",
    level: "Intermediate",
    duration: "1 hour",
    desc: "Full monitoring stack with alerting rules and custom Grafana dashboards",
    color: "#F43F5E",
    academy: "infrastructure",
    slug: "prometheus",
  },
  {
    title: "AWS EKS Cluster with Fargate",
    tech: "EKS",
    icon: "☸",
    level: "Advanced",
    duration: "3 hours",
    desc: "Production EKS cluster, IRSA, ALB ingress, and autoscaling setup",
    color: "#FF9900",
    academy: "cloud",
    slug: "aws-eks",
  },
];

const levelStyle = {
  Beginner: { color: "#34D399", bg: "rgba(16,185,129,0.1)", border: "rgba(16,185,129,0.2)" },
  Intermediate: { color: "#FCD34D", bg: "rgba(245,158,11,0.1)", border: "rgba(245,158,11,0.2)" },
  Advanced: { color: "#FB7185", bg: "rgba(244,63,94,0.1)", border: "rgba(244,63,94,0.2)" },
} as const;

export default function FeaturedLabs() {
  return (
    <section style={{ background: "#0C1524", borderTop: "1px solid #1E2D47", borderBottom: "1px solid #1E2D47" }}>
      <div className="mx-auto max-w-7xl px-6 py-20">
        <div className="flex items-end justify-between mb-14 flex-wrap gap-4">
          <div>
            <span style={{ display: "inline-flex", alignItems: "center", gap: "6px", background: "rgba(16,185,129,0.1)", border: "1px solid rgba(16,185,129,0.2)", color: "#34D399", fontSize: "12px", fontWeight: 600, letterSpacing: "0.1em", textTransform: "uppercase", padding: "5px 14px", borderRadius: "100px", marginBottom: "16px" }}>
              <FlaskConical size={12} /> Hands-on Labs
            </span>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px, 3.5vw, 42px)", fontWeight: 800, letterSpacing: "-0.02em" }}>
              Featured Labs
            </h2>
            <p style={{ color: "var(--text-4)", fontSize: "16px", marginTop: "8px" }}>
              Real exercises on real infrastructure — no toy examples
            </p>
          </div>
          <Link href="/labs" style={{ display: "flex", alignItems: "center", gap: "6px", color: "#34D399", fontSize: "14px", fontWeight: 600, textDecoration: "none" }}>
            All Labs <ArrowRight size={16} />
          </Link>
        </div>

        <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
          {featuredLabs.map((lab) => {
            const ls = levelStyle[lab.level as keyof typeof levelStyle];
            return (
              <Link key={lab.title} href={`/academies/${lab.academy}/${lab.slug}/labs`} style={{ textDecoration: "none" }}>
                <div className="card" style={{ padding: "24px", height: "100%", display: "flex", flexDirection: "column" }}>
                  <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "14px" }}>
                    <div style={{ width: "46px", height: "46px", borderRadius: "12px", background: `${lab.color}15`, border: `1px solid ${lab.color}25`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "22px" }}>
                      {lab.icon}
                    </div>
                    <div style={{ display: "flex", gap: "6px", flexDirection: "column", alignItems: "flex-end" }}>
                      <span style={{ background: ls.bg, border: `1px solid ${ls.border}`, color: ls.color, padding: "2px 9px", borderRadius: "100px", fontSize: "10px", fontWeight: 600 }}>{lab.level}</span>
                      <span style={{ display: "flex", alignItems: "center", gap: "4px", color: "var(--text-4)", fontSize: "11px" }}><Clock size={11} />{lab.duration}</span>
                    </div>
                  </div>

                  <h3 style={{ fontSize: "15px", fontWeight: 700, marginBottom: "8px", lineHeight: 1.4 }}>{lab.title}</h3>
                  <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6, flexGrow: 1 }}>{lab.desc}</p>

                  <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginTop: "16px", paddingTop: "14px", borderTop: "1px solid #1E2D47" }}>
                    <span style={{ background: `${lab.color}12`, border: `1px solid ${lab.color}20`, color: lab.color, padding: "3px 9px", borderRadius: "6px", fontSize: "11px", fontWeight: 600 }}>{lab.tech}</span>
                    <span style={{ color: lab.color, fontSize: "12px", fontWeight: 600 }}>Start Lab →</span>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </div>
    </section>
  );
}
