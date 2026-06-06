const contentRegistry = new Set([
  "infrastructure/linux/overview","infrastructure/linux/fundamentals",
  "infrastructure/linux/intermediate","infrastructure/linux/advanced",
  "infrastructure/linux/cheatsheets","infrastructure/linux/interview",
  "infrastructure/docker/overview","infrastructure/docker/fundamentals",
  "infrastructure/docker/cheatsheets","infrastructure/docker/interview",
  "infrastructure/kubernetes/overview","infrastructure/kubernetes/fundamentals",
  "infrastructure/kubernetes/advanced","infrastructure/kubernetes/troubleshooting",
  "infrastructure/kubernetes/interview","infrastructure/kubernetes/labs",
  "infrastructure/python/overview","infrastructure/python/fundamentals","infrastructure/python/cheatsheets",
  "infrastructure/ansible/overview","infrastructure/ansible/fundamentals","infrastructure/ansible/interview",
  "infrastructure/prometheus/overview",
  "infrastructure/jenkins/overview",
  "infrastructure/argocd/overview",
  "infrastructure/helm/overview",
  "infrastructure/git/overview",
  "cloud/terraform/overview","cloud/terraform/fundamentals",
  "cloud/terraform/advanced","cloud/terraform/interview",
  "cloud/aws-ec2/overview","cloud/aws-ec2/fundamentals",
  "cloud/aws-vpc/overview",
  "cloud/aws-iam/overview","cloud/aws-iam/fundamentals",
  "cloud/aws-s3/overview",
  "cloud/azure-aks/overview",
  "monitoring/grafana/overview",
  "monitoring/elk-stack/overview",
  "monitoring/datadog/overview",
  "data/sql/overview","data/sql/fundamentals",
  "ai/langchain/overview","ai/langchain/fundamentals",
  "ai/rag/overview",
  "healthcare/icd-10-cm/overview","healthcare/icd-10-cm/fundamentals",
  "security/security-fundamentals/overview",
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
