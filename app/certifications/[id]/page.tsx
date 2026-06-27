export const runtime = "edge";
import { certifications } from "@/lib/data/navigation";
import { notFound } from "next/navigation";
import Link from "next/link";

type Props = { params: Promise<{ id: string }> };

// Per-cert detailed data
const certDetail: Record<string, {
  duration: string; questions: string; passingScore: string;
  validity: string; cost: string;
  domains: { name: string; weight: string; topics: string }[];
  studyModules: { label: string; href: string }[];
  tips: string[];
  afterCert: string;
}> = {
  "aws-ccp": {
    duration: "90 minutes", questions: "65 (MCQ + multiple response)", passingScore: "700/1000", validity: "3 years", cost: "$100 USD",
    domains: [
      { name: "Cloud Technology & Services", weight: "33%", topics: "EC2, S3, RDS, VPC, Lambda, CloudWatch — breadth over depth" },
      { name: "Security & Compliance", weight: "25%", topics: "Shared responsibility, IAM, compliance, encryption basics" },
      { name: "Cloud Concepts", weight: "26%", topics: "Cloud value proposition, Well-Architected, migration strategies" },
      { name: "Billing, Pricing & Support", weight: "16%", topics: "Pricing models, Cost Explorer, Support plans, TCO" },
    ],
    studyModules: [
      { label: "Cloud Fundamentals", href: "/academies/cloud/cloud-fundamentals/overview" },
      { label: "AWS IAM", href: "/academies/cloud/aws-iam/overview" },
      { label: "AWS EC2", href: "/academies/cloud/aws-ec2/overview" },
    ],
    tips: ["No hands-on experience required — foundational breadth exam", "Cost & pricing models appear in nearly every section", "AWS free tier lets you try every tested service before exam day"],
    afterCert: "AWS Solutions Architect Associate (SAA-C03) — the most popular next step",
  },
  "aws-saa": {
    duration: "130 minutes", questions: "65 (scenario-based)", passingScore: "720/1000", validity: "3 years", cost: "$150 USD",
    domains: [
      { name: "Design Secure Architectures", weight: "30%", topics: "IAM policies, VPC security groups, NACLs, encryption" },
      { name: "Design Resilient Architectures", weight: "26%", topics: "Multi-AZ, Auto Scaling, ELB, RDS Multi-AZ, S3 versioning" },
      { name: "Design High-Performing Architectures", weight: "24%", topics: "ElastiCache, CloudFront, compute sizing, storage class selection" },
      { name: "Design Cost-Optimized Architectures", weight: "20%", topics: "Spot vs Reserved vs On-Demand, S3 Intelligent-Tiering" },
    ],
    studyModules: [
      { label: "AWS EC2", href: "/academies/cloud/aws-ec2/overview" },
      { label: "AWS VPC", href: "/academies/cloud/aws-vpc/overview" },
      { label: "AWS IAM", href: "/academies/cloud/aws-iam/overview" },
    ],
    tips: ["Scenario questions — eliminate wrong answers, don't just find 'a correct' one", "Know S3 vs EFS vs EBS vs FSx trade-offs cold", "VPC: subnets, route tables, NAT Gateway, peering — always tested"],
    afterCert: "AWS SAP-C02 (Professional) or AWS DevOps Engineer Professional (DOP-C02)",
  },
  "aws-dop": {
    duration: "180 minutes", questions: "75 (scenario-based)", passingScore: "750/1000", validity: "3 years", cost: "$300 USD",
    domains: [
      { name: "SDLC Automation", weight: "22%", topics: "CodePipeline, CodeBuild, CodeDeploy, deployment strategies" },
      { name: "Configuration Management & IaC", weight: "17%", topics: "CloudFormation, CDK, OpsWorks, Systems Manager" },
      { name: "Resilient Cloud Solutions", weight: "15%", topics: "Multi-region, disaster recovery, RTO/RPO" },
      { name: "Monitoring & Logging", weight: "15%", topics: "CloudWatch, X-Ray, CloudTrail, EventBridge" },
      { name: "Incident & Event Response", weight: "18%", topics: "Auto recovery, runbooks, incident management" },
      { name: "Security & Compliance", weight: "13%", topics: "IAM policies, Config, Inspector, GuardDuty" },
    ],
    studyModules: [
      { label: "AWS EKS", href: "/academies/cloud/aws-eks/overview" },
      { label: "Jenkins CI/CD", href: "/academies/devops/jenkins/overview" },
      { label: "ArgoCD", href: "/academies/devops/argocd/overview" },
    ],
    tips: ["Requires SAA-C03 first — this is Professional level", "Deep knowledge of CodePipeline end-to-end is essential", "Focus on blue/green and canary deployment scenarios"],
    afterCert: "AWS Solutions Architect Professional (SAP-C02)",
  },
  "az-900": {
    duration: "60 minutes", questions: "40–60 (MCQ, drag & drop)", passingScore: "700/1000", validity: "No expiry", cost: "$165 USD",
    domains: [
      { name: "Cloud Concepts", weight: "25–30%", topics: "IaaS vs PaaS vs SaaS, CapEx vs OpEx, consumption-based model" },
      { name: "Azure Architecture & Services", weight: "35–40%", topics: "Compute, storage, networking, databases, AI/ML services overview" },
      { name: "Azure Management & Governance", weight: "30–35%", topics: "Cost Management, Azure Policy, RBAC, Blueprints, Compliance" },
    ],
    studyModules: [
      { label: "Azure VMs", href: "/academies/cloud/azure-vms/overview" },
      { label: "Cloud Fundamentals", href: "/academies/cloud/cloud-fundamentals/overview" },
    ],
    tips: ["Easiest Microsoft certification — 1–2 weeks study for IT professionals", "Microsoft Learn free path covers 90% of the content", "Focus on the management and governance section — many find it unexpected"],
    afterCert: "AZ-104 (Azure Administrator) — the most popular next step",
  },
  "az-104": {
    duration: "120 minutes", questions: "40–60 tasks", passingScore: "700/1000", validity: "1 year (must renew)", cost: "$165 USD",
    domains: [
      { name: "Manage Azure Identities & Governance", weight: "20–25%", topics: "Microsoft Entra ID, RBAC, policies, management groups, subscriptions" },
      { name: "Implement & Manage Storage", weight: "15–20%", topics: "Storage accounts, Blob, File shares, access tiers, redundancy options" },
      { name: "Deploy & Manage Compute Resources", weight: "20–25%", topics: "VMs, VMSS, App Service, Azure Container Instances" },
      { name: "Implement & Manage Virtual Networking", weight: "15–20%", topics: "VNets, subnets, NSGs, VPN Gateway, ExpressRoute, DNS" },
      { name: "Monitor & Back Up Azure Resources", weight: "10–15%", topics: "Azure Monitor, Log Analytics, Backup, Site Recovery" },
    ],
    studyModules: [
      { label: "Azure VMs", href: "/academies/cloud/azure-vms/overview" },
      { label: "Azure VNets", href: "/academies/cloud/azure-vnets/overview" },
      { label: "Azure Entra ID", href: "/academies/cloud/azure-entra/overview" },
    ],
    tips: ["Hands-on practice in Azure portal is mandatory — not just reading", "Annual renewal required — easy online renewal assessment", "NSG vs Azure Firewall vs NVA trade-offs are frequently tested"],
    afterCert: "AZ-305 (Solutions Architect Expert) — requires AZ-104 first",
  },
  "az-305": {
    duration: "120 minutes", questions: "40–60 case studies + MCQ", passingScore: "700/1000", validity: "1 year", cost: "$165 USD",
    domains: [
      { name: "Design Identity, Governance & Monitoring", weight: "25–30%", topics: "Zero Trust, Entra ID architecture, Azure Monitor, Log Analytics" },
      { name: "Design Data Storage Solutions", weight: "25–30%", topics: "SQL vs NoSQL, Cosmos DB, Azure SQL, Data Lake, tiering" },
      { name: "Design Business Continuity Solutions", weight: "10–15%", topics: "Backup strategies, Site Recovery, RTO/RPO, geo-redundancy" },
      { name: "Design Infrastructure Solutions", weight: "25–30%", topics: "AKS, App Service, Landing Zones, Hub-Spoke networking, migration" },
    ],
    studyModules: [
      { label: "Azure AKS", href: "/academies/cloud/azure-aks/overview" },
      { label: "Azure VMs", href: "/academies/cloud/azure-vms/overview" },
      { label: "Azure DevOps", href: "/academies/cloud/azure-devops/overview" },
    ],
    tips: ["Requires AZ-104 as prerequisite", "Case study format — read the entire scenario before answering", "Focus on trade-off reasoning, not just memorizing services"],
    afterCert: "AZ-400 (DevOps Engineer Expert) — pair with AZ-305 for full architect profile",
  },
  "kcna": {
    duration: "90 minutes", questions: "60 MCQ", passingScore: "75%", validity: "3 years", cost: "$250 USD",
    domains: [
      { name: "Kubernetes Fundamentals", weight: "46%", topics: "Pods, Deployments, Services, namespaces, kubectl basics" },
      { name: "Container Orchestration", weight: "22%", topics: "Container runtime, OCI, CRI, scheduling, resource management" },
      { name: "Cloud Native Architecture", weight: "16%", topics: "Microservices, 12-factor app, service mesh concepts, observability" },
      { name: "Cloud Native Observability", weight: "8%", topics: "Prometheus, Grafana, OpenTelemetry, log aggregation" },
      { name: "Cloud Native Application Delivery", weight: "8%", topics: "CI/CD, GitOps, Helm, Argo" },
    ],
    studyModules: [
      { label: "Kubernetes Fundamentals", href: "/academies/devops/kubernetes/fundamentals" },
      { label: "Docker", href: "/academies/devops/docker/overview" },
    ],
    tips: ["Theory-only exam — no terminal access like CKA/CKAD", "CNCF landscape knowledge is tested — know which projects do what", "Good first Kubernetes certification before CKA"],
    afterCert: "CKA (Administrator) or CKAD (Developer) — pick based on your role",
  },
  "cka": {
    duration: "2 hours", questions: "15–20 performance-based tasks", passingScore: "66%", validity: "3 years", cost: "$395 USD (2 attempts included)",
    domains: [
      { name: "Cluster Architecture, Installation & Config", weight: "25%", topics: "kubeadm init/join, etcd backup & restore, cluster upgrade, RBAC" },
      { name: "Workloads & Scheduling", weight: "15%", topics: "Deployments, DaemonSets, resource limits, taints, affinity, Priority" },
      { name: "Services & Networking", weight: "20%", topics: "ClusterIP, NodePort, LoadBalancer, Ingress, NetworkPolicy, CoreDNS" },
      { name: "Storage", weight: "10%", topics: "PersistentVolumes, PVC, StorageClasses, hostPath, emptyDir" },
      { name: "Troubleshooting", weight: "30%", topics: "Worker node issues, control plane failures, pod debugging, network issues" },
    ],
    studyModules: [
      { label: "Kubernetes Advanced", href: "/academies/devops/kubernetes/advanced" },
      { label: "Kubernetes Troubleshooting", href: "/academies/devops/kubernetes/troubleshooting" },
    ],
    tips: ["Practice every day in a real cluster — killer.sh is mandatory", "Learn kubectl imperative commands: create deployment, expose, run", "30% troubleshooting — be fast at reading events and logs"],
    afterCert: "CKAD (Developer) or CKS (Security Specialist)",
  },
  "ckad": {
    duration: "2 hours", questions: "15–20 performance-based tasks", passingScore: "66%", validity: "3 years", cost: "$395 USD",
    domains: [
      { name: "Application Design & Build", weight: "20%", topics: "Container builds, Jobs, CronJobs, initContainers, sidecar patterns" },
      { name: "Application Deployment", weight: "20%", topics: "Rolling updates, Helm, Kustomize, blue/green strategies" },
      { name: "Observability & Maintenance", weight: "15%", topics: "Liveness/readiness probes, logging, API deprecations, metrics" },
      { name: "Environment, Config & Security", weight: "25%", topics: "ConfigMaps, Secrets, ServiceAccounts, SecurityContext, AppArmor" },
      { name: "Services & Networking", weight: "20%", topics: "Services, Ingress controllers, NetworkPolicy, DNS" },
    ],
    studyModules: [
      { label: "Kubernetes Intermediate", href: "/academies/devops/kubernetes/intermediate" },
      { label: "Helm", href: "/academies/devops/helm/overview" },
    ],
    tips: ["Create alias: alias k=kubectl && export do='--dry-run=client -o yaml'", "Know Helm chart layout and values override patterns", "SecurityContext and NetworkPolicy are heavily tested"],
    afterCert: "CKA (Administrator) — gives you the cluster side of Kubernetes",
  },
  "cks": {
    duration: "2 hours", questions: "15–20 performance-based tasks", passingScore: "67%", validity: "3 years", cost: "$395 USD",
    domains: [
      { name: "Cluster Setup", weight: "10%", topics: "Network policies, CIS benchmarks, ingress TLS, Node metadata protection" },
      { name: "Cluster Hardening", weight: "15%", topics: "RBAC, ServiceAccount restrictions, Kubernetes API security, upgrade" },
      { name: "System Hardening", weight: "15%", topics: "AppArmor, Seccomp, privilege reduction, kernel hardening" },
      { name: "Minimize Microservice Vulnerabilities", weight: "20%", topics: "PSA, OPA Gatekeeper, Secret management (Vault), mTLS" },
      { name: "Supply Chain Security", weight: "20%", topics: "Image scanning (Trivy), allowlists, signing, Dockerfile best practices" },
      { name: "Monitoring, Logging & Runtime Security", weight: "20%", topics: "Falco rules, audit logs, immutable containers, behavior analysis" },
    ],
    studyModules: [
      { label: "DevSecOps", href: "/academies/security/devsecops/overview" },
      { label: "Kubernetes Advanced", href: "/academies/devops/kubernetes/advanced" },
    ],
    tips: ["CKA is a hard prerequisite — do not skip it", "Falco and AppArmor syntax must be memorized", "One of the hardest CNCF certifications — budget 4–6 months study"],
    afterCert: "CKAD if not already done. Or move to platform/security engineering roles.",
  },
  "terraform-associate": {
    duration: "60 minutes", questions: "57 MCQ", passingScore: "70%", validity: "2 years", cost: "$70.50 USD",
    domains: [
      { name: "IaC Concepts", weight: "~11%", topics: "What IaC is, Terraform vs Ansible vs CloudFormation, benefits" },
      { name: "Terraform Purpose & Basics", weight: "~9%", topics: "init, plan, apply, destroy workflow, HCL syntax" },
      { name: "Terraform Outside Core Workflow", weight: "~22%", topics: "fmt, validate, import, state mv, workspaces, taint" },
      { name: "Use Terraform Outside Core Workflow", weight: "~16%", topics: "Modules, remote state, backends, Terraform Cloud/Enterprise" },
      { name: "Interact with Terraform Modules", weight: "~17%", topics: "Public registry, input/output variables, module versioning" },
      { name: "Navigate State", weight: "~25%", topics: "State purpose, remote backends, locking, state file security" },
    ],
    studyModules: [
      { label: "Terraform", href: "/academies/devops/terraform/overview" },
    ],
    tips: ["Cheapest and fastest IaC certification ($70, 1 month study)", "State management questions are the majority — master them", "Try Terraform Cloud free tier for hands-on practice"],
    afterCert: "HashiCorp Vault Associate for secrets management, or AWS/Azure certs",
  },
  "rhcsa": {
    duration: "3 hours", questions: "Performance-based tasks on live RHEL system", passingScore: "210/300", validity: "3 years", cost: "$400 USD",
    domains: [
      { name: "Understand & Use Essential Tools", weight: "~15%", topics: "bash, grep, awk, find, file permissions, SSH, sudo, redirection" },
      { name: "Operate Running Systems", weight: "~15%", topics: "systemd, processes, logging (journalctl), boot targets, scheduling" },
      { name: "Configure Local Storage", weight: "~15%", topics: "fdisk/parted, LVM, mkfs, mount, fstab, swap" },
      { name: "Create & Configure File Systems", weight: "~15%", topics: "NFS, AutoFS, ACLs, SELinux contexts, quota" },
      { name: "Deploy, Configure & Maintain Systems", weight: "~20%", topics: "dnf, repos, time sync, network config (nmcli), kernel params" },
      { name: "Manage Users, Groups, Security", weight: "~20%", topics: "useradd, passwd, sudo policies, SELinux modes, firewall-cmd" },
    ],
    studyModules: [
      { label: "Linux", href: "/academies/devops/linux/overview" },
      { label: "Shell Scripting", href: "/academies/devops/shell-scripting/overview" },
    ],
    tips: ["100% hands-on — no multiple choice. You must DO tasks on a live server", "SELinux is always tested — know restorecon, semanage, setsebool", "Practice daily on a RHEL 9 VM or CentOS Stream 9"],
    afterCert: "RHCE (EX294) — Ansible automation, the natural next level",
  },
  "rhce": {
    duration: "4 hours", questions: "Performance-based tasks (Ansible automation)", passingScore: "210/300", validity: "3 years", cost: "$400 USD",
    domains: [
      { name: "Be able to perform all tasks from RHCSA", weight: "Prerequisite", topics: "Linux fundamentals are assumed — RHCSA is required" },
      { name: "Ansible Automation", weight: "~100%", topics: "Inventory, playbooks, roles, variables, templates (Jinja2), Vault, collections" },
    ],
    studyModules: [
      { label: "Ansible", href: "/academies/devops/ansible/overview" },
      { label: "Linux", href: "/academies/devops/linux/overview" },
    ],
    tips: ["RHCSA is a hard prerequisite — must have it first", "Write reusable roles, not just flat playbooks", "Jinja2 templating and Ansible Vault for secrets are always tested"],
    afterCert: "Red Hat OpenShift certifications (EX280) or DevOps platform roles",
  },
  "comptia-sec-plus": {
    duration: "90 minutes", questions: "90 max (MCQ + performance-based)", passingScore: "750/900", validity: "3 years", cost: "$392 USD",
    domains: [
      { name: "General Security Concepts", weight: "12%", topics: "Security controls, cryptography types, PKI, authentication" },
      { name: "Threats, Vulnerabilities & Mitigations", weight: "22%", topics: "Malware types, social engineering, vulnerability scanning, OWASP Top 10" },
      { name: "Security Architecture", weight: "18%", topics: "Cloud security, network segmentation, Zero Trust, SASE, virtualization security" },
      { name: "Security Operations", weight: "28%", topics: "EDR, SIEM, log analysis, incident response, digital forensics, identity management" },
      { name: "Security Program Management & Oversight", weight: "20%", topics: "Risk management, compliance (PCI-DSS, HIPAA, GDPR), auditing, policies" },
    ],
    studyModules: [
      { label: "Security Fundamentals", href: "/academies/security/security-fundamentals/overview" },
      { label: "Network Security", href: "/academies/security/network-security/overview" },
    ],
    tips: ["Professor Messer's free study guide covers everything", "Performance-based questions come first in the exam — don't skip them", "Incident response order: Identify → Contain → Eradicate → Recover → Lessons learned"],
    afterCert: "CompTIA CySA+ (analyst) or Security+ is enough for many entry-level roles",
  },
  "ceh": {
    duration: "4 hours", questions: "125 MCQ", passingScore: "60–85% (varies by exam form)", validity: "3 years", cost: "$950 USD + required training",
    domains: [
      { name: "Footprinting & Reconnaissance", weight: "~8%", topics: "OSINT, Shodan, Google dorking, DNS enumeration, WHOIS" },
      { name: "Scanning Networks", weight: "~8%", topics: "Nmap, vulnerability scanners, ping sweeps, banner grabbing" },
      { name: "Enumeration & Exploitation", weight: "~18%", topics: "Metasploit, Netcat, exploitation frameworks, post-exploitation" },
      { name: "Web Application Hacking", weight: "~12%", topics: "SQLi, XSS, CSRF, SSRF, authentication bypass, OWASP Top 10" },
      { name: "Cryptography", weight: "~10%", topics: "Symmetric vs Asymmetric, PKI, disk encryption, SSL/TLS" },
      { name: "Malware, IDS/IPS, Cloud, IoT", weight: "~44%", topics: "Malware analysis, evading defenses, cloud attack vectors, IoT threats" },
    ],
    studyModules: [
      { label: "Ethical Hacking", href: "/academies/security/ethical-hacking/overview" },
      { label: "Pen Testing", href: "/academies/security/pen-testing/overview" },
    ],
    tips: ["Requires official EC-Council training (no way around it)", "Memorize tool names and what each does — exam is tool-heavy", "OSCP is more respected for actual pentesters — CEH is better for compliance roles"],
    afterCert: "OSCP (Offensive Security Certified Professional) for practical penetration testing",
  },
  "az-400": {
    duration: "120 minutes", questions: "40–60 (scenario + case study)", passingScore: "700/1000", validity: "1 year", cost: "$165 USD",
    domains: [
      { name: "Configure Processes & Communications", weight: "10–15%", topics: "Azure Boards, work items, notifications, service connections, GitHub integration" },
      { name: "Design & Implement Source Control", weight: "15–20%", topics: "Git branching strategies, repo security, large file storage, migrations" },
      { name: "Design & Implement Pipelines", weight: "40–45%", topics: "Azure Pipelines (YAML), releases, approvals, gates, multi-stage, agents" },
      { name: "Design & Implement Deployment Strategy", weight: "10–15%", topics: "Blue/green, canary, feature flags, progressive delivery, rollback" },
      { name: "Implement Security & Validate Code Base", weight: "10–15%", topics: "SAST, DAST, SCA, secrets management, compliance, Key Vault in pipelines" },
    ],
    studyModules: [
      { label: "Azure DevOps", href: "/academies/cloud/azure-devops/overview" },
      { label: "Jenkins CI/CD", href: "/academies/devops/jenkins/overview" },
      { label: "ArgoCD", href: "/academies/devops/argocd/overview" },
    ],
    tips: ["Requires AZ-104 or AZ-204 as prerequisite", "YAML pipeline syntax is essential — practice writing from scratch", "Annual renewal required — short online assessment"],
    afterCert: "AZ-305 (Solutions Architect Expert) or move into SRE/platform engineering roles",
  },
};

export async function generateMetadata({ params }: Props) {
  const { id } = await params;
  const cert = certifications.find((c) => c.id === id);
  if (!cert) return {};
  const detail = certDetail[id];
  return {
    title: `${cert.name} (${cert.code}) Study Guide — SynfraCore`,
    description: `Complete ${cert.name} exam guide: ${detail?.domains?.[0]?.name ?? "exam domains"}, study plan, practice questions, and tips. Pass on your first attempt.`,
    alternates: { canonical: `https://synfracore.com/certifications/${id}` },
  };
}

export default async function CertificationDetailPage({ params }: Props) {
  const { id } = await params;
  const cert = certifications.find((c) => c.id === id);
  if (!cert) notFound();

  const detail = certDetail[id];
  const color = cert.color;

  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "40px 24px" }}>
      <Link href="/certifications" style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none", marginBottom: "24px", display: "inline-block" }}>
        ← All Certifications
      </Link>

      {/* Hero */}
      <div style={{ background: `linear-gradient(135deg, ${color}12, transparent)`, border: `1px solid ${color}25`, borderRadius: "20px", padding: "32px", marginBottom: "32px" }}>
        <div style={{ display: "flex", alignItems: "flex-start", gap: "20px", flexWrap: "wrap" }}>
          <div style={{ width: "64px", height: "64px", borderRadius: "16px", background: `${color}20`, border: `1px solid ${color}30`, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0, fontSize: "30px" }}>
            {cert.provider === "AWS" ? "☁️" : cert.provider === "Azure" ? "🔷" : cert.provider === "CNCF" ? "⚙️" : cert.provider === "HashiCorp" ? "🏗️" : cert.provider === "Red Hat" ? "🎩" : "🛡️"}
          </div>
          <div style={{ flex: 1, minWidth: "240px" }}>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "clamp(20px,4vw,28px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "10px" }}>
              {cert.name}
            </h1>
            <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "16px" }}>
              <span style={{ background: `${color}15`, border: `1px solid ${color}25`, color, padding: "3px 12px", borderRadius: "100px", fontSize: "12px", fontWeight: 700 }}>{cert.provider}</span>
              <span style={{ background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-3)", padding: "3px 12px", borderRadius: "100px", fontSize: "12px", fontWeight: 600 }}>{cert.code}</span>
              <span style={{ background: cert.level === "Expert" ? "#fef2f2" : cert.level === "Professional" ? "#fefce8" : "#f0fdf4", color: cert.level === "Expert" ? "#ef4444" : cert.level === "Professional" ? "#ca8a04" : "#16a34a", padding: "3px 12px", borderRadius: "100px", fontSize: "12px", fontWeight: 700 }}>{cert.level}</span>
            </div>
            {detail && (
              <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill,minmax(140px,1fr))", gap: "8px" }}>
                {[["⏱", "Duration", detail.duration], ["❓", "Questions", detail.questions], ["✅", "Pass Score", detail.passingScore], ["💰", "Cost", detail.cost], ["📅", "Valid", detail.validity]].map(([icon, label, val]) => (
                  <div key={label as string} style={{ background: "var(--bg-2)", borderRadius: "10px", padding: "10px 12px", border: "1px solid var(--border)" }}>
                    <div style={{ fontSize: "10px", color: "var(--text-4)", fontWeight: 600, marginBottom: "2px", textTransform: "uppercase", letterSpacing: "0.05em" }}>{icon} {label}</div>
                    <div style={{ fontSize: "12px", fontWeight: 600, color: "var(--text-1)" }}>{val}</div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </div>

      {detail ? (
        <>
          {/* Exam Domains */}
          <section style={{ marginBottom: "28px" }}>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "18px", fontWeight: 800, marginBottom: "16px", display: "flex", alignItems: "center", gap: "8px" }}>
              📋 Exam Domains & Weightage
            </h2>
            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {detail.domains.map((d) => (
                <div key={d.name} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px", padding: "16px", display: "grid", gridTemplateColumns: "1fr auto", gap: "8px", alignItems: "start" }}>
                  <div>
                    <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "4px", color: "var(--text-1)" }}>{d.name}</div>
                    <div style={{ fontSize: "12px", color: "var(--text-4)", lineHeight: 1.5 }}>{d.topics}</div>
                  </div>
                  <span style={{ background: `${color}15`, color, padding: "3px 10px", borderRadius: "8px", fontSize: "13px", fontWeight: 800, whiteSpace: "nowrap", flexShrink: 0 }}>{d.weight}</span>
                </div>
              ))}
            </div>
          </section>

          {/* Study Modules */}
          <section style={{ marginBottom: "28px" }}>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "18px", fontWeight: 800, marginBottom: "16px", display: "flex", alignItems: "center", gap: "8px" }}>
              📚 Study Modules on SynfraCore
            </h2>
            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill,minmax(200px,1fr))", gap: "10px" }}>
              {detail.studyModules.map((m) => (
                <Link key={m.label} href={m.href} style={{ textDecoration: "none" }}>
                  <div style={{ background: "var(--bg-2)", border: `1px solid ${color}30`, borderRadius: "10px", padding: "14px 16px", display: "flex", alignItems: "center", justifyContent: "space-between", gap: "8px", transition: "border-color 0.15s" }}>
                    <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{m.label}</span>
                    <span style={{ color, fontWeight: 700, fontSize: "16px", flexShrink: 0 }}>→</span>
                  </div>
                </Link>
              ))}
            </div>
          </section>

          {/* Exam Tips */}
          <section style={{ marginBottom: "28px" }}>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "18px", fontWeight: 800, marginBottom: "16px", display: "flex", alignItems: "center", gap: "8px" }}>
              💡 Exam Tips
            </h2>
            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {detail.tips.map((tip, i) => (
                <div key={i} style={{ display: "flex", gap: "12px", alignItems: "flex-start", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "10px", padding: "14px 16px" }}>
                  <span style={{ fontSize: "16px", flexShrink: 0 }}>{"🔑"}</span>
                  <span style={{ fontSize: "13px", color: "var(--text-2)", lineHeight: 1.6 }}>{tip}</span>
                </div>
              ))}
            </div>
          </section>

          {/* After Cert */}
          <div style={{ background: `${color}08`, border: `1px solid ${color}20`, borderRadius: "14px", padding: "20px 24px", display: "flex", gap: "12px", alignItems: "flex-start" }}>
            <span style={{ fontSize: "24px", flexShrink: 0 }}>🎯</span>
            <div>
              <div style={{ fontWeight: 700, fontSize: "14px", marginBottom: "4px", color }}>After this certification</div>
              <div style={{ fontSize: "13px", color: "var(--text-3)", lineHeight: 1.6 }}>{detail.afterCert}</div>
            </div>
          </div>
        </>
      ) : (
        <div style={{ textAlign: "center", padding: "60px 20px", color: "var(--text-4)" }}>
          <div style={{ fontSize: "48px", marginBottom: "16px" }}>📋</div>
          <div style={{ fontSize: "16px", fontWeight: 600, marginBottom: "8px" }}>Detailed study guide coming soon</div>
          <div style={{ fontSize: "13px" }}>Start with the study modules for {cert.name}</div>
          <Link href="/academies" style={{ display: "inline-block", marginTop: "16px", padding: "8px 20px", background: color + "15", color, borderRadius: "8px", textDecoration: "none", fontWeight: 600, fontSize: "13px" }}>
            Browse Academies →
          </Link>
        </div>
      )}
    </div>
  );
}
