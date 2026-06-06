const contentRegistry = new Set([
  // ── INFRASTRUCTURE ───────────────────────────────────────────
  "infrastructure/linux/overview","infrastructure/linux/fundamentals",
  "infrastructure/linux/intermediate","infrastructure/linux/advanced",
  "infrastructure/linux/cheatsheets","infrastructure/linux/interview",
  "infrastructure/docker/overview","infrastructure/docker/fundamentals",
  "infrastructure/docker/cheatsheets","infrastructure/docker/interview",
  "infrastructure/kubernetes/overview","infrastructure/kubernetes/fundamentals",
  "infrastructure/kubernetes/advanced","infrastructure/kubernetes/troubleshooting",
  "infrastructure/kubernetes/interview","infrastructure/kubernetes/labs",
  "infrastructure/kubernetes/cheatsheets",
  "infrastructure/python/overview","infrastructure/python/fundamentals",
  "infrastructure/python/cheatsheets","infrastructure/python/interview",
  "infrastructure/ansible/overview","infrastructure/ansible/fundamentals",
  "infrastructure/ansible/interview",
  "infrastructure/terraform/overview","infrastructure/terraform/fundamentals",
  "infrastructure/terraform/advanced","infrastructure/terraform/interview",
  "infrastructure/terraform/cheatsheets",
  "infrastructure/jenkins/overview","infrastructure/jenkins/advanced",
  "infrastructure/helm/overview","infrastructure/helm/fundamentals",
  "infrastructure/argocd/overview",
  "infrastructure/prometheus/overview",
  "infrastructure/grafana/overview",
  "infrastructure/elk-stack/overview",
  "infrastructure/git/overview",
  "infrastructure/networking/overview",
  // Databases
  "infrastructure/postgresql/overview",
  "infrastructure/mysql/overview",
  "infrastructure/mongodb/overview",
  "infrastructure/redis/overview",
  "infrastructure/cassandra/overview",
  // ── CLOUD ────────────────────────────────────────────────────
  "cloud/aws-ec2/overview","cloud/aws-ec2/fundamentals",
  "cloud/aws-vpc/overview",
  "cloud/aws-iam/overview","cloud/aws-iam/fundamentals",
  "cloud/aws-s3/overview","cloud/aws-lambda/overview",
  "cloud/aws-eks/overview",
  "cloud/azure-aks/overview","cloud/azure-devops/overview",
  // ── DATA ─────────────────────────────────────────────────────
  "data/sql/overview","data/sql/fundamentals",
  "data/pandas/overview","data/power-bi/overview",
  // ── AI ───────────────────────────────────────────────────────
  "ai/langchain/overview","ai/langchain/fundamentals",
  "ai/rag/overview","ai/prompt-engineering/overview",
  "ai/ai-agents/overview","ai/llmops/overview",
  // ── HEALTHCARE ───────────────────────────────────────────────
  "healthcare/icd-10-cm/overview","healthcare/icd-10-cm/fundamentals",
  "healthcare/icd-10-cm/interview","healthcare/cpt/overview",
  "healthcare/hcpcs/overview","healthcare/coding-guidelines/overview",
  // ── SECURITY ─────────────────────────────────────────────────
  "security/security-fundamentals/overview","security/soc/overview",
  "security/ethical-hacking/overview","security/network-security/overview",
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
