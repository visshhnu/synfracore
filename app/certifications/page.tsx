import Link from "next/link";
import { certifications } from "@/lib/data/navigation";
import { Trophy, ArrowRight } from "lucide-react";

export const metadata = {
  title: "Certifications — SynfraCore",
  description: "Comprehensive certification prep for AWS, Azure, Kubernetes, Terraform, Linux certifications",
};

const providers = [...new Set(certifications.map((c) => c.provider))];

export default function CertificationsPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ marginBottom: "56px", textAlign: "center" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Certification Hub
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          13 industry certifications — structured prep, practice exams, and study guides
        </p>
      </div>

      {providers.map((provider) => {
        const provCerts = certifications.filter((c) => c.provider === provider);
        return (
          <div key={provider} style={{ marginBottom: "48px" }}>
            <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "20px" }}>
              <Trophy size={20} style={{ color: provCerts[0].color }} />
              <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "24px", fontWeight: 700 }}>{provider}</h2>
              <div style={{ height: "1px", flexGrow: 1, background: "#1E2D47" }} />
            </div>

            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "20px" }}>
              {provCerts.map((cert) => (
                <Link key={cert.id} href={`/certifications/${cert.id}`} style={{ textDecoration: "none" }}>
                  <div
                    style={{
                      background: "var(--bg-2)",
                      border: "1px solid var(--border)",
                      borderRadius: "16px",
                      padding: "24px",
                      transition: "all 0.2s",
                    }}
                   
                  >
                    <div
                      style={{
                        width: "44px",
                        height: "44px",
                        borderRadius: "12px",
                        background: `${cert.color}18`,
                        border: `1px solid ${cert.color}30`,
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        marginBottom: "14px",
                      }}
                    >
                      <Trophy size={20} style={{ color: cert.color }} />
                    </div>

                    <h3 style={{ fontSize: "15px", fontWeight: 700, marginBottom: "4px" }}>{cert.name}</h3>
                    <p style={{ color: "var(--text-4)", fontSize: "12px", marginBottom: "16px" }}>{cert.code}</p>

                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                      <span
                        style={{
                          background: cert.level === "Expert" ? "rgba(244, 63, 94, 0.1)" : cert.level === "Professional" ? "rgba(245, 158, 11, 0.1)" : "rgba(16, 185, 129, 0.1)",
                          color: cert.level === "Expert" ? "#FB7185" : cert.level === "Professional" ? "#FCD34D" : "#34D399",
                          padding: "3px 10px",
                          borderRadius: "100px",
                          fontSize: "11px",
                          fontWeight: 600,
                        }}
                      >
                        {cert.level}
                      </span>
                      <span style={{ display: "flex", alignItems: "center", gap: "4px", color: "#60A5FA", fontSize: "12px", fontWeight: 600 }}>
                        Study <ArrowRight size={12} />
                      </span>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        );
      })}
    </div>
  );
}
