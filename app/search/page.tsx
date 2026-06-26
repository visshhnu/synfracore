"use client";
export const runtime = "edge";
import { useState, useEffect } from "react";
import Link from "next/link";
import { Search } from "lucide-react";

interface Result {
  title: string;
  url: string;
  category: string;
  tags: string[];
  color: string;
}

const searchIndex: Result[] = [
  // Tech academies
  { title: "Kubernetes Overview", url: "/academies/devops/kubernetes/overview", category: "DevOps", tags: ["kubernetes","k8s","containers","orchestration"], color: "#326CE5" },
  { title: "Kubernetes Interview Q&A", url: "/academies/devops/kubernetes/interview", category: "DevOps", tags: ["kubernetes","interview","k8s","jobs"], color: "#326CE5" },
  { title: "Kubernetes Advanced — HA/DR/RBAC", url: "/academies/devops/kubernetes/advanced", category: "DevOps", tags: ["kubernetes","ha","dr","rbac","production"], color: "#326CE5" },
  { title: "Terraform Interview Q&A", url: "/academies/devops/terraform/interview", category: "DevOps", tags: ["terraform","iac","infrastructure","interview"], color: "#7B42BC" },
  { title: "Ansible Interview Q&A", url: "/academies/devops/ansible/interview", category: "DevOps", tags: ["ansible","configuration","automation","interview"], color: "#EE0000" },
  { title: "Docker Interview Q&A", url: "/academies/devops/docker/interview", category: "DevOps", tags: ["docker","containers","images","interview"], color: "#2496ED" },
  { title: "Jenkins Interview Q&A", url: "/academies/devops/jenkins/interview", category: "DevOps", tags: ["jenkins","cicd","pipeline","interview"], color: "#D33833" },
  { title: "Helm Interview Q&A", url: "/academies/devops/helm/interview", category: "DevOps", tags: ["helm","kubernetes","charts","interview"], color: "#0F1689" },
  { title: "Prometheus Interview Q&A", url: "/academies/devops/prometheus/interview", category: "DevOps", tags: ["prometheus","monitoring","metrics","interview"], color: "#E6522C" },
  { title: "Linux Interview Q&A", url: "/academies/devops/linux/interview", category: "DevOps", tags: ["linux","shell","commands","interview"], color: "#FCC624" },
  { title: "ArgoCD Interview Q&A", url: "/academies/devops/argocd/interview", category: "DevOps", tags: ["argocd","gitops","cicd","interview"], color: "#EF7B4D" },
  { title: "Shell Scripting Interview Q&A", url: "/academies/devops/shell-scripting/interview", category: "DevOps", tags: ["shell","bash","scripting","interview"], color: "#4EAA25" },
  { title: "Git Interview Q&A", url: "/academies/devops/git/interview", category: "DevOps", tags: ["git","version control","github","interview"], color: "#F05032" },
  { title: "AI Engineering Interview Q&A", url: "/academies/ai/llm-engineering/interview", category: "AI", tags: ["llm","rag","ai","agents","interview","langchain"], color: "#8B5CF6" },
  // Education
  { title: "Class 10 — All Subjects", url: "/learn/class-10", category: "Education", tags: ["class 10","cbse","maths","science","board exam"], color: "#10B981" },
  { title: "JEE Main & Advanced Prep", url: "/learn/jee", category: "Education", tags: ["jee","iit","engineering","entrance"], color: "#F59E0B" },
  { title: "NEET Biology/Physics/Chemistry", url: "/learn/neet", category: "Education", tags: ["neet","medical","biology","physics","chemistry"], color: "#EC4899" },
  { title: "GATE CSE Preparation", url: "/learn/gate-cse", category: "Education", tags: ["gate","computer science","cse","exam"], color: "#6366F1" },
  { title: "Banking Exams (SBI/IBPS)", url: "/learn/banking", category: "Education", tags: ["banking","sbi","ibps","bank po","quant"], color: "#3B82F6" },
  { title: "UPSC Civil Services", url: "/learn/upsc", category: "Education", tags: ["upsc","ias","ips","civil services","prelims"], color: "#EF4444" },
  { title: "SSC CGL/CHSL", url: "/learn/ssc", category: "Education", tags: ["ssc","cgl","chsl","government job"], color: "#14B8A6" },
  { title: "Defence Exams (NDA/CDS)", url: "/learn/defence", category: "Education", tags: ["nda","cds","defence","military"], color: "#F59E0B" },
  { title: "Class 12 — All Subjects", url: "/learn/class-12", category: "Education", tags: ["class 12","cbse","board exam","physics","chemistry"], color: "#6366F1" },
  // Career roles
  { title: "Platform Engineer Career Path", url: "/careers/platform-engineer", category: "Career", tags: ["platform engineer","career","salary","roadmap"], color: "#8B5CF6" },
  { title: "DevOps Engineer Career Path", url: "/careers/devops-engineer", category: "Career", tags: ["devops engineer","career","salary","roadmap"], color: "#F59E0B" },
  { title: "SRE Career Path", url: "/careers/sre-engineer", category: "Career", tags: ["sre","site reliability","career","salary"], color: "#10B981" },
  { title: "Cloud Architect Career Path", url: "/careers/cloud-architect", category: "Career", tags: ["cloud architect","aws","azure","career","salary"], color: "#3B82F6" },
  { title: "AI Engineer Career Path", url: "/careers/ai-engineer", category: "Career", tags: ["ai engineer","ml","llm","career","salary"], color: "#8B5CF6" },
  // Certifications
  { title: "AWS Solutions Architect Prep", url: "/certifications/aws-saa", category: "Cert", tags: ["aws","solutions architect","certification","saa-c03"], color: "#FF9900" },
  { title: "CKA — Kubernetes Admin Cert", url: "/certifications/cka", category: "Cert", tags: ["cka","kubernetes","certification","exam"], color: "#326CE5" },
  { title: "Terraform Associate Cert", url: "/certifications/terraform-associate", category: "Cert", tags: ["terraform","hashicorp","certification","exam"], color: "#7B42BC" },
];

export default function SearchPage() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<Result[]>([]);
  const [activeCategory, setActiveCategory] = useState("All");

  const categories = ["All", "DevOps", "Education", "Career", "AI", "Cert"];

  useEffect(() => {
    if (!query.trim() && activeCategory === "All") {
      setResults(searchIndex.slice(0, 12));
      return;
    }
    const q = query.toLowerCase();
    const filtered = searchIndex.filter(r => {
      const matchCat = activeCategory === "All" || r.category === activeCategory;
      const matchQuery = !q || r.title.toLowerCase().includes(q) || r.tags.some(t => t.includes(q));
      return matchCat && matchQuery;
    });
    setResults(filtered);
  }, [query, activeCategory]);

  return (
    <div style={{ maxWidth: "800px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ textAlign: "center", marginBottom: "40px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "36px", marginBottom: "12px" }}>
          Search SynfraCore
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "16px" }}>
          Find content across tech academies, education boards, career paths, and certifications
        </p>
      </div>

      {/* Search input */}
      <div style={{ position: "relative", marginBottom: "24px" }}>
        <Search size={18} style={{ position: "absolute", left: "16px", top: "50%", transform: "translateY(-50%)", color: "var(--text-4)" }} />
        <input
          autoFocus
          value={query}
          onChange={e => setQuery(e.target.value)}
          placeholder="Search topics, exams, tools, careers..."
          style={{
            width: "100%", padding: "16px 16px 16px 48px", borderRadius: "12px",
            border: "2px solid var(--border)", background: "var(--bg-1)",
            fontSize: "16px", color: "var(--text-1)", outline: "none",
            boxSizing: "border-box",
          }}
        />
      </div>

      {/* Category filters */}
      <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "32px" }}>
        {categories.map(cat => (
          <button key={cat} onClick={() => setActiveCategory(cat)} style={{
            padding: "6px 16px", borderRadius: "20px", fontSize: "13px", fontWeight: 600,
            border: "1px solid var(--border)", cursor: "pointer",
            background: activeCategory === cat ? "var(--accent)" : "var(--bg-2)",
            color: activeCategory === cat ? "white" : "var(--text-3)",
          }}>
            {cat}
          </button>
        ))}
      </div>

      {/* Results */}
      <div style={{ display: "flex", flexDirection: "column", gap: "10px" }}>
        {results.length === 0 && (
          <div style={{ textAlign: "center", padding: "48px", color: "var(--text-4)" }}>
            No results for &quot;{query}&quot; — try different keywords
          </div>
        )}
        {results.map(r => (
          <Link key={r.url} href={r.url} style={{ textDecoration: "none" }}>
            <div className="card-hover" style={{ padding: "16px 20px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", display: "flex", alignItems: "center", gap: "14px", cursor: "pointer" }}>
              <div style={{ width: "4px", height: "40px", borderRadius: "2px", background: r.color, flexShrink: 0 }} />
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "4px", flexWrap: "wrap" }}>
                  <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>{r.title}</span>
                  <span style={{ fontSize: "10px", padding: "2px 8px", borderRadius: "20px", background: r.color + "15", color: r.color, fontWeight: 700, flexShrink: 0 }}>{r.category}</span>
                </div>
                <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
                  {r.tags.slice(0, 4).map(t => (
                    <span key={t} style={{ fontSize: "11px", padding: "1px 6px", borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-4)" }}>{t}</span>
                  ))}
                </div>
              </div>
              <span style={{ color: "var(--text-4)", fontSize: "16px", flexShrink: 0 }}>→</span>
            </div>
          </Link>
        ))}
      </div>

      {!query && activeCategory === "All" && (
        <p style={{ textAlign: "center", color: "var(--text-4)", fontSize: "13px", marginTop: "24px" }}>
          Showing popular content · Type to search all {searchIndex.length} topics
        </p>
      )}
    </div>
  );
}
