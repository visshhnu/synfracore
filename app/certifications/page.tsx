import Link from "next/link";
import { Award, ExternalLink, Clock, CheckCircle, ArrowRight } from "lucide-react";

export const metadata = {
  title: "Certifications — SynfraCore",
  description: "Certification guides for AWS, Kubernetes, Terraform, Azure, GCP, and more",
};

const certGroups = [
  {
    category: "Cloud — AWS",
    color: "#FF9900",
    certs: [
      { name: "AWS Cloud Practitioner", code: "CLF-C02", level: "Foundational", time: "1-2 months", link: "/academies/cloud/aws-ec2/certification", topics: ["Cloud Concepts", "Security & Compliance", "Core Services", "Billing"] },
      { name: "AWS Solutions Architect Associate", code: "SAA-C03", level: "Associate", time: "3 months", link: "/academies/cloud/aws-ec2/certification", topics: ["Resilient Architectures", "High Performance", "Secure Design", "Cost Optimization"] },
      { name: "AWS DevOps Engineer Professional", code: "DOP-C02", level: "Professional", time: "6 months", link: "/academies/cloud/aws-eks/certification", topics: ["SDLC Automation", "Config Management", "Monitoring & Logging", "Incident Response"] },
    ],
  },
  {
    category: "Cloud — Azure",
    color: "#0078D4",
    certs: [
      { name: "Azure Fundamentals", code: "AZ-900", level: "Foundational", time: "1 month", link: "/academies/cloud/azure-vms/certification", topics: ["Cloud Concepts", "Azure Services", "Security", "Pricing"] },
      { name: "Azure Administrator", code: "AZ-104", level: "Associate", time: "3 months", link: "/academies/cloud/azure-vms/certification", topics: ["Identity", "Governance", "Storage", "Networking", "Compute"] },
      { name: "Azure DevOps Engineer Expert", code: "AZ-400", level: "Expert", time: "6 months", link: "/academies/cloud/azure-devops/certification", topics: ["Source Control", "CI/CD", "Dependency Management", "Security"] },
    ],
  },
  {
    category: "Kubernetes & Cloud Native",
    color: "#326CE5",
    certs: [
      { name: "Kubernetes & Cloud Native Associate", code: "KCNA", level: "Foundational", time: "1-2 months", link: "/academies/devops/kubernetes/certification", topics: ["K8s Fundamentals", "Cloud Native", "Container Orchestration"] },
      { name: "Certified Kubernetes Administrator", code: "CKA", level: "Professional", time: "3 months", link: "/academies/devops/kubernetes/certification", topics: ["Cluster Setup", "Workloads", "Networking", "Storage", "Troubleshooting"] },
      { name: "Certified Kubernetes App Developer", code: "CKAD", level: "Professional", time: "2 months", link: "/academies/devops/kubernetes/certification", topics: ["App Design", "Deployment", "Observability", "Configuration", "Networking"] },
    ],
  },
  {
    category: "HashiCorp",
    color: "#7B42BC",
    certs: [
      { name: "Terraform Associate", code: "003", level: "Associate", time: "2 months", link: "/academies/devops/terraform/certification", topics: ["IaC Concepts", "Terraform Workflow", "State Management", "Modules", "Terraform Cloud"] },
    ],
  },
  {
    category: "Red Hat",
    color: "#EE0000",
    certs: [
      { name: "Red Hat Certified System Administrator", code: "RHCSA", level: "Professional", time: "3 months", link: "/academies/devops/linux/certification", topics: ["Essential Tools", "File Systems", "Networking", "Users & Security", "Containers"] },
      { name: "Red Hat Certified Engineer", code: "RHCE", level: "Expert", time: "5 months", link: "/academies/devops/ansible/certification", topics: ["Ansible Automation", "System Roles", "Inventory Management", "Playbooks"] },
    ],
  },
  {
    category: "Security",
    color: "#10B981",
    certs: [
      { name: "CompTIA Security+", code: "SY0-701", level: "Associate", time: "2 months", link: "/academies/security/security-fundamentals/certification", topics: ["Threats & Vulnerabilities", "Architecture", "Implementation", "Incident Response", "Governance"] },
      { name: "Certified Ethical Hacker", code: "CEH", level: "Professional", time: "4 months", link: "/academies/security/ethical-hacking/certification", topics: ["Footprinting", "Scanning", "Exploitation", "Post-Exploitation", "Reporting"] },
    ],
  },
];

const levelColors: Record<string, string> = {
  Foundational: "#10B981",
  Associate: "#3B82F6",
  Professional: "#8B5CF6",
  Expert: "#F59E0B",
};

export default function CertificationsPage() {
  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "64px" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#3B82F6", fontWeight: 600, marginBottom: "20px" }}>
          <Award size={14}/> Industry-Recognized Certifications
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Certification Guides
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "560px", margin: "0 auto", lineHeight: 1.7 }}>
          Structured preparation for the most valuable certifications in DevOps, Cloud, Kubernetes, and Security
        </p>
      </div>

      {/* Stats row */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: "16px", marginBottom: "64px" }}>
        {[
          { value: "13+", label: "Certifications Covered" },
          { value: "6", label: "Certification Providers" },
          { value: "3-6 months", label: "Average Prep Time" },
          { value: "40-80%", label: "Salary Premium" },
        ].map(stat => (
          <div key={stat.label} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px", textAlign: "center" }}>
            <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "28px", fontWeight: 800, background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent", marginBottom: "6px" }}>{stat.value}</div>
            <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{stat.label}</div>
          </div>
        ))}
      </div>

      {/* Cert groups */}
      {certGroups.map(group => (
        <div key={group.category} style={{ marginBottom: "48px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "20px" }}>
            <div style={{ width: "4px", height: "24px", background: group.color, borderRadius: "2px" }}/>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px" }}>{group.category}</h2>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(340px, 1fr))", gap: "16px" }}>
            {group.certs.map(cert => (
              <div key={cert.code} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px", display: "flex", flexDirection: "column", gap: "16px" }}>
                <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                  <div>
                    <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "6px" }}>{cert.name}</div>
                    <div style={{ fontFamily: "monospace", fontSize: "12px", color: group.color, fontWeight: 600 }}>{cert.code}</div>
                  </div>
                  <span style={{ background: `${levelColors[cert.level]}22`, color: levelColors[cert.level], border: `1px solid ${levelColors[cert.level]}44`, padding: "3px 10px", borderRadius: "20px", fontSize: "11px", fontWeight: 700, flexShrink: 0, marginLeft: "8px" }}>{cert.level}</span>
                </div>

                <div style={{ display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", color: "var(--text-4)" }}>
                  <Clock size={13}/> Prep time: {cert.time}
                </div>

                <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
                  {cert.topics.map(t => (
                    <span key={t} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "2px 8px", borderRadius: "4px", fontSize: "11px", color: "var(--text-4)" }}>{t}</span>
                  ))}
                </div>

                <Link href={cert.link} style={{ display: "flex", alignItems: "center", gap: "6px", background: `${group.color}15`, color: group.color, border: `1px solid ${group.color}33`, padding: "10px 16px", borderRadius: "10px", textDecoration: "none", fontSize: "13px", fontWeight: 600, marginTop: "auto" }}>
                  <CheckCircle size={14}/> View Study Guide <ArrowRight size={13} style={{ marginLeft: "auto" }}/>
                </Link>
              </div>
            ))}
          </div>
        </div>
      ))}

      {/* Bottom CTA */}
      <div style={{ marginTop: "48px", background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "48px 32px", textAlign: "center" }}>
        <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "28px", fontWeight: 800, marginBottom: "12px" }}>Ready to get certified?</h2>
        <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "500px", margin: "0 auto 28px", lineHeight: 1.7 }}>
          Each certification page includes the full exam guide, domain breakdown, study tips, and recommended resources.
        </p>
        <Link href="/academies" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 32px", borderRadius: "12px", fontSize: "15px", fontWeight: 700, textDecoration: "none" }}>
          Start Learning <ArrowRight size={16}/>
        </Link>
      </div>
    </div>
  );
}
