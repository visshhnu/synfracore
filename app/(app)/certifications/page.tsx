import Link from "next/link";
import { Award, ExternalLink, Clock, CheckCircle, ArrowRight } from "lucide-react";

export const metadata = {
  title: "Certifications — SynfraCore",
  description: "Certification guides for AWS, Kubernetes, Terraform, Azure, GCP, and more",
};

const certGroups = [
  {
    category: "Cloud — AWS", color: "#FF9900",
    certs: [
      { id: "aws-ccp",  name: "AWS Cloud Practitioner",           code: "CLF-C02", level: "Foundational", time: "1-2 months",
        topics: ["Cloud Concepts", "Security & Compliance", "Core Services", "Billing"],
        modules: [{ label: "Cloud Fundamentals", href: "/academies/cloud/cloud-fundamentals/overview" }, { label: "AWS IAM", href: "/academies/cloud/aws-iam/overview" }] },
      { id: "aws-saa",  name: "AWS Solutions Architect Associate", code: "SAA-C03", level: "Associate",    time: "3 months",
        topics: ["Resilient Architectures", "High Performance", "Secure Design", "Cost Optimization"],
        modules: [{ label: "AWS EC2", href: "/academies/cloud/aws-ec2/overview" }, { label: "AWS VPC", href: "/academies/cloud/aws-vpc/overview" }, { label: "AWS IAM", href: "/academies/cloud/aws-iam/overview" }] },
      { id: "aws-dop",  name: "AWS DevOps Engineer Professional",  code: "DOP-C02", level: "Professional", time: "6 months",
        topics: ["SDLC Automation", "Config Management", "Monitoring & Logging", "Incident Response"],
        modules: [{ label: "AWS EKS", href: "/academies/cloud/aws-eks/overview" }, { label: "CI/CD Jenkins", href: "/academies/devops/jenkins/overview" }, { label: "ArgoCD", href: "/academies/devops/argocd/overview" }] },
    ],
  },
  {
    category: "Cloud — Azure", color: "#0078D4",
    certs: [
      { id: "az-900", name: "Azure Fundamentals",              code: "AZ-900", level: "Foundational", time: "1 month",
        topics: ["Cloud Concepts", "Azure Services", "Security", "Pricing"],
        modules: [{ label: "Azure VMs", href: "/academies/cloud/azure-vms/overview" }, { label: "Cloud Fundamentals", href: "/academies/cloud/cloud-fundamentals/overview" }] },
      { id: "az-104", name: "Azure Administrator",             code: "AZ-104", level: "Associate",    time: "3 months",
        topics: ["Identity", "Governance", "Storage", "Networking", "Compute"],
        modules: [{ label: "Azure VMs", href: "/academies/cloud/azure-vms/overview" }, { label: "Azure VNets", href: "/academies/cloud/azure-vnets/overview" }, { label: "Azure Entra ID", href: "/academies/cloud/azure-entra/overview" }] },
      { id: "az-305", name: "Azure Solutions Architect Expert", code: "AZ-305", level: "Expert",       time: "5 months",
        topics: ["Identity & Access", "Data Storage", "Business Continuity", "Infrastructure"],
        modules: [{ label: "Azure AKS", href: "/academies/cloud/azure-aks/overview" }, { label: "Azure VMs", href: "/academies/cloud/azure-vms/overview" }, { label: "Azure DevOps", href: "/academies/cloud/azure-devops/overview" }] },
    ],
  },
  {
    category: "Kubernetes & Cloud Native", color: "#326CE5",
    certs: [
      { id: "kcna", name: "Kubernetes & Cloud Native Associate", code: "KCNA", level: "Foundational", time: "1-2 months",
        topics: ["K8s Fundamentals", "Cloud Native", "Container Orchestration"],
        modules: [{ label: "Kubernetes Fundamentals", href: "/academies/devops/kubernetes/fundamentals" }, { label: "Docker", href: "/academies/devops/docker/overview" }] },
      { id: "cka",  name: "Certified Kubernetes Administrator",   code: "CKA",  level: "Professional", time: "3 months",
        topics: ["Cluster Setup", "Workloads", "Networking", "Storage", "Troubleshooting"],
        modules: [{ label: "Kubernetes Advanced", href: "/academies/devops/kubernetes/advanced" }, { label: "Kubernetes Troubleshooting", href: "/academies/devops/kubernetes/troubleshooting" }] },
      { id: "ckad", name: "Certified Kubernetes App Developer",   code: "CKAD", level: "Professional", time: "2 months",
        topics: ["App Design", "Deployment", "Observability", "Configuration", "Networking"],
        modules: [{ label: "Kubernetes Intermediate", href: "/academies/devops/kubernetes/intermediate" }, { label: "Helm", href: "/academies/devops/helm/overview" }] },
      { id: "cks",  name: "Certified Kubernetes Security Specialist", code: "CKS", level: "Expert",   time: "4 months",
        topics: ["Cluster Hardening", "System Hardening", "Supply Chain Security", "Runtime Security"],
        modules: [{ label: "DevSecOps", href: "/academies/security/devsecops/overview" }, { label: "Kubernetes Security", href: "/academies/devops/kubernetes/advanced" }] },
    ],
  },
  {
    category: "Infrastructure & DevOps", color: "#7B42BC",
    certs: [
      { id: "terraform-associate", name: "Terraform Associate",                     code: "003",    level: "Associate",    time: "2 months",
        topics: ["IaC Concepts", "Terraform Workflow", "State Management", "Modules"],
        modules: [{ label: "Terraform", href: "/academies/devops/terraform/overview" }] },
      { id: "rhcsa",               name: "Red Hat Certified System Administrator",  code: "EX200",  level: "Professional", time: "3 months",
        topics: ["Essential Tools", "File Systems", "Networking", "Users & Security"],
        modules: [{ label: "Linux", href: "/academies/devops/linux/overview" }, { label: "Shell Scripting", href: "/academies/devops/shell-scripting/overview" }] },
      { id: "rhce",                name: "Red Hat Certified Engineer",              code: "EX294",  level: "Expert",       time: "5 months",
        topics: ["Ansible Automation", "System Roles", "Inventory Management", "Playbooks"],
        modules: [{ label: "Ansible", href: "/academies/devops/ansible/overview" }] },
    ],
  },
  {
    category: "Security", color: "#EF4444",
    certs: [
      { id: "comptia-sec-plus", name: "CompTIA Security+", code: "SY0-701", level: "Associate",    time: "2 months",
        topics: ["Threats & Vulnerabilities", "Architecture", "Implementation", "Incident Response"],
        modules: [{ label: "Security Fundamentals", href: "/academies/security/security-fundamentals/overview" }, { label: "Network Security", href: "/academies/security/network-security/overview" }] },
      { id: "ceh",              name: "Certified Ethical Hacker", code: "CEH",  level: "Professional", time: "4 months",
        topics: ["Footprinting", "Scanning", "Exploitation", "Post-Exploitation", "Reporting"],
        modules: [{ label: "Ethical Hacking", href: "/academies/security/ethical-hacking/overview" }, { label: "Pen Testing", href: "/academies/security/pen-testing/overview" }] },
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
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 200px), 1fr))", gap: "16px", marginBottom: "64px" }}>
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
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 300px), 1fr))", gap: "16px" }}>
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
                {(cert as {modules?: {label:string;href:string}[]}).modules?.length && (
                  <div style={{ borderTop: "1px solid var(--border)", paddingTop: "10px" }}>
                    <div style={{ fontSize: "10px", color: "var(--text-4)", fontWeight: 700, marginBottom: "6px", letterSpacing: "0.06em", textTransform: "uppercase" }}>Study Modules</div>
                    <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
                      {(cert as {modules?: {label:string;href:string}[]}).modules!.map((m) => (
                        <a key={m.label} href={m.href} style={{ fontSize: "11px", padding: "3px 10px", borderRadius: "8px", border: "1px solid var(--border)", color: "var(--text-3)", textDecoration: "none" }}>
                          {m.label} →
                        </a>
                      ))}
                    </div>
                  </div>
                )}

                <Link href={`/certifications/${cert.id}`} style={{ display: "flex", alignItems: "center", gap: "6px", background: `${group.color}15`, color: group.color, border: `1px solid ${group.color}33`, padding: "10px 16px", borderRadius: "10px", textDecoration: "none", fontSize: "13px", fontWeight: 600, marginTop: "auto" }}>
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
