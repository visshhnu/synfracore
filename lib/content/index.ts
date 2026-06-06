const contentRegistry = new Set([
  // Linux (6)
  "infrastructure/linux/overview","infrastructure/linux/fundamentals",
  "infrastructure/linux/intermediate","infrastructure/linux/advanced",
  "infrastructure/linux/cheatsheets","infrastructure/linux/interview",
  // Docker (4)
  "infrastructure/docker/overview","infrastructure/docker/fundamentals",
  "infrastructure/docker/cheatsheets","infrastructure/docker/interview",
  // Kubernetes (7)
  "infrastructure/kubernetes/overview","infrastructure/kubernetes/fundamentals",
  "infrastructure/kubernetes/advanced","infrastructure/kubernetes/troubleshooting",
  "infrastructure/kubernetes/interview","infrastructure/kubernetes/labs",
  "infrastructure/kubernetes/cheatsheets",
  // Python (4)
  "infrastructure/python/overview","infrastructure/python/fundamentals",
  "infrastructure/python/cheatsheets","infrastructure/python/interview",
  // Ansible (3)
  "infrastructure/ansible/overview","infrastructure/ansible/fundamentals",
  "infrastructure/ansible/interview",
  // Prometheus, Jenkins, ArgoCD, Helm, Git, Networking (6)
  "infrastructure/prometheus/overview","infrastructure/jenkins/overview",
  "infrastructure/argocd/overview","infrastructure/helm/overview",
  "infrastructure/git/overview","infrastructure/networking/overview",
  // Cloud — Terraform (5)
  "cloud/terraform/overview","cloud/terraform/fundamentals",
  "cloud/terraform/advanced","cloud/terraform/interview",
  "cloud/terraform/cheatsheets",
  // Cloud — AWS (8)
  "cloud/aws-ec2/overview","cloud/aws-ec2/fundamentals",
  "cloud/aws-vpc/overview",
  "cloud/aws-iam/overview","cloud/aws-iam/fundamentals",
  "cloud/aws-s3/overview","cloud/aws-lambda/overview",
  "cloud/aws-eks/overview",
  // Cloud — Azure (2)
  "cloud/azure-aks/overview","cloud/azure-devops/overview",
  // Monitoring (4)
  "monitoring/grafana/overview","monitoring/elk-stack/overview",
  "monitoring/datadog/overview","monitoring/loki/overview",
  // Data (3)
  "data/sql/overview","data/sql/fundamentals","data/pandas/overview",
  // AI (4)
  "ai/langchain/overview","ai/langchain/fundamentals",
  "ai/rag/overview","ai/prompt-engineering/overview",
  "ai/ai-agents/overview",
  // Healthcare (4)
  "healthcare/icd-10-cm/overview","healthcare/icd-10-cm/fundamentals",
  "healthcare/icd-10-cm/interview","healthcare/cpt/overview",
  // Security (3)
  "security/security-fundamentals/overview",
  "security/soc/overview","security/ethical-hacking/overview",
]);

export function hasContent(a: string, t: string, s: string): boolean {
  return contentRegistry.has(`${a}/${t}/${s}`);
}
export async function fetchContent(a: string, t: string, s: string): Promise<string | null> {
  if (!contentRegistry.has(`${a}/${t}/${s}`)) return null;
  try {
    const res = await fetch(`/content/${a}/${t}/${s}.md`);
    if (!res.ok) return null;
    return await res.text();
  } catch { return null; }
}
export function getContent(_a: string, _t: string, _s: string): string | null { return null; }
