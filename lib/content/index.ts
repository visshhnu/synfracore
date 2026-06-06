const contentRegistry = new Set([
  // Linux
  "infrastructure/linux/overview",
  "infrastructure/linux/fundamentals",
  "infrastructure/linux/intermediate",
  "infrastructure/linux/advanced",
  "infrastructure/linux/cheatsheets",
  "infrastructure/linux/interview",
  // Docker
  "infrastructure/docker/overview",
  "infrastructure/docker/fundamentals",
  "infrastructure/docker/cheatsheets",
  // Kubernetes
  "infrastructure/kubernetes/overview",
  "infrastructure/kubernetes/fundamentals",
  "infrastructure/kubernetes/advanced",
  "infrastructure/kubernetes/troubleshooting",
  // Python
  "infrastructure/python/overview",
  "infrastructure/python/fundamentals",
  "infrastructure/python/cheatsheets",
  // Ansible
  "infrastructure/ansible/overview",
  "infrastructure/ansible/fundamentals",
  // Prometheus
  "infrastructure/prometheus/overview",
  // Jenkins
  "infrastructure/jenkins/overview",
  // Cloud — Terraform
  "cloud/terraform/overview",
  "cloud/terraform/fundamentals",
  // Cloud — AWS
  "cloud/aws-ec2/overview",
  "cloud/aws-ec2/fundamentals",
  "cloud/aws-vpc/overview",
  "cloud/aws-iam/overview",
  "cloud/aws-iam/fundamentals",
  // Data
  "data/sql/overview",
  "data/sql/fundamentals",
  // AI
  "ai/langchain/overview",
  "ai/langchain/fundamentals",
  // Healthcare
  "healthcare/icd-10-cm/overview",
  "healthcare/icd-10-cm/fundamentals",
  // Security
  "security/security-fundamentals/overview",
]);

export function hasContent(academy: string, technology: string, section: string): boolean {
  return contentRegistry.has(`${academy}/${technology}/${section}`);
}

export async function fetchContent(academy: string, technology: string, section: string): Promise<string | null> {
  if (!contentRegistry.has(`${academy}/${technology}/${section}`)) return null;
  try {
    const res = await fetch(`/content/${academy}/${technology}/${section}.md`);
    if (!res.ok) return null;
    return await res.text();
  } catch { return null; }
}

export function getContent(_a: string, _t: string, _s: string): string | null { return null; }
