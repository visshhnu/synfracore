export const runtime = "edge";
import Link from "next/link";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { getAcademy } from "@/lib/data/academies";

type Props = {
  params: Promise<{ academy: string }>;
};

const academyDescriptions: Record<string, string> = {
  devops: "Master DevOps with Docker, Kubernetes, Terraform, Ansible, Jenkins, and more. Real labs, interview prep, and certification guides for DevOps engineers in 2025.",
  cloud: "Learn AWS, Azure, and GCP cloud platforms. EC2, S3, VPC, AKS, GKE — complete cloud architect preparation with hands-on labs.",
  databases: "PostgreSQL, MySQL, MongoDB, Redis, Cassandra, DynamoDB — full database engineering track with SQL mastery and NoSQL expertise.",
  ai: "AI Engineering — LLMs, RAG, LangChain, AI Agents, Prompt Engineering, LLMOps. Build production AI applications from scratch.",
  data: "Data Analytics with Python Pandas, Power BI, Tableau, and Excel. Transform raw data into business insights.",
  security: "Cybersecurity — ethical hacking, SOC, SIEM, network security, and penetration testing. Prepare for security certifications.",
  healthcare: "Medical coding — ICD-10-CM, CPT, HCPCS, and CMS guidelines. Complete healthcare coding preparation and mock exams.",
  essentials: "Human essentials — nutrition, mental health, personal finance, first aid, and gut health. Life skills that compound.",
  education: "Computer science fundamentals — DSA, System Design, OS, DBMS, CN, Java, C++, and placement preparation.",
  exams: "JEE, NEET, GATE, UPSC, SSC CGL, RRB NTPC — comprehensive exam preparation with practice questions and strategies.",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { academy: aSlug } = await params;
  const academy = getAcademy(aSlug);
  if (!academy) return { title: "Academy | SynfraCore" };

  const description = academyDescriptions[aSlug] || academy.description;
  const canonicalUrl = `https://synfracore.com/academies/${aSlug}`;

  return {
    title: `${academy.title} Academy`,
    description,
    keywords: [academy.title, `learn ${academy.title}`, `${academy.title} course`, "SynfraCore"],
    alternates: { canonical: canonicalUrl },
    openGraph: {
      title: `${academy.title} Academy | SynfraCore`,
      description,
      url: canonicalUrl,
      type: "website",
      siteName: "SynfraCore",
    },
  };
}

export default async function AcademyPage({ params }: Props) {
  const { academy: aSlug } = await params;
  const academy = getAcademy(aSlug);
  if (!academy) redirect("/academies");

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "40px 24px" }}>

      {/* Breadcrumb */}
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>
        {" / "}
        <Link href="/academies" style={{ color: "var(--text-4)", textDecoration: "none" }}>Academies</Link>
        {" / "}
        <span style={{ color: "var(--text-2)" }}>{academy.title}</span>
      </nav>

      {/* Header */}
      <div style={{ marginBottom: "40px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "12px" }}>
          <span style={{ fontSize: "36px" }}>{academy.icon}</span>
          <div>
            <h1 style={{ fontSize: "32px", fontWeight: 700, marginBottom: "4px" }}>{academy.title}</h1>
            <p style={{ fontSize: "14px", color: "var(--text-4)" }}>{academy.subtitle}</p>
          </div>
        </div>
        <p style={{ color: "var(--text-3)", fontSize: "15px", maxWidth: "720px", lineHeight: "1.7" }}>
          {academyDescriptions[aSlug] || academy.description}
        </p>
      </div>

      {/* Domains with their technologies — THE CORRECT STRUCTURE */}
      {academy.domains.map((domain) => (
        <div key={domain.slug} style={{ marginBottom: "40px" }}>

          {/* Domain header */}
          <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "16px", paddingBottom: "12px", borderBottom: "1px solid var(--border)" }}>
            <span style={{ fontSize: "20px" }}>{domain.icon}</span>
            <div>
              <h2 style={{ fontSize: "18px", fontWeight: 600, margin: 0 }}>{domain.name}</h2>
              <p style={{ fontSize: "12px", color: "var(--text-4)", margin: 0 }}>{domain.description}</p>
            </div>
          </div>

          {/* Technologies grid inside this domain */}
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "12px" }}>
            {domain.technologies.map((tech) => (
              <Link
                key={tech.slug}
                href={`/academies/${aSlug}/${tech.slug}`}
                style={{ textDecoration: "none" }}
              >
                <div
                  style={{
                    padding: "18px",
                    borderRadius: "10px",
                    border: "1px solid var(--border)",
                    background: "var(--bg-1)",
                    cursor: "pointer",
                    height: "100%",
                  }}
                  className="card-hover"
                >
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
                    <span style={{ fontSize: "22px" }}>{tech.icon}</span>
                    <span style={{ fontWeight: 600, fontSize: "14px" }}>{tech.name}</span>
                    <span style={{
                      marginLeft: "auto", fontSize: "10px", padding: "2px 6px",
                      borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-4)",
                      whiteSpace: "nowrap",
                    }}>
                      {tech.level}
                    </span>
                  </div>
                  <p style={{ fontSize: "12px", color: "var(--text-4)", lineHeight: "1.5", margin: "0 0 8px 0" }}>
                    {tech.description}
                  </p>
                  {tech.tags && (
                    <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
                      {tech.tags.slice(0, 3).map((tag: string) => (
                        <span key={tag} style={{
                          fontSize: "10px", padding: "2px 6px", borderRadius: "10px",
                          background: "var(--bg-2)", color: "var(--text-4)",
                        }}>
                          {tag}
                        </span>
                      ))}
                    </div>
                  )}
                </div>
              </Link>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
