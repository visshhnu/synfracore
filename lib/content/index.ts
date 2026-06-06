// Content registry — tracks all pre-written .md files in /public/content/

const contentRegistry = new Set([
  // Infrastructure — Linux
  "infrastructure/linux/overview",
  "infrastructure/linux/fundamentals",
  "infrastructure/linux/intermediate",
  "infrastructure/linux/advanced",
  "infrastructure/linux/cheatsheets",
  "infrastructure/linux/interview",
  // Infrastructure — Docker
  "infrastructure/docker/overview",
  "infrastructure/docker/fundamentals",
  "infrastructure/docker/cheatsheets",
  // Infrastructure — Kubernetes
  "infrastructure/kubernetes/overview",
  "infrastructure/kubernetes/fundamentals",
  "infrastructure/kubernetes/advanced",
  "infrastructure/kubernetes/troubleshooting",
  // Infrastructure — Python
  "infrastructure/python/overview",
  "infrastructure/python/fundamentals",
  "infrastructure/python/cheatsheets",
  // Cloud — Terraform
  "cloud/terraform/overview",
  "cloud/terraform/fundamentals",
  // Cloud — AWS
  "cloud/aws-ec2/overview",
  "cloud/aws-ec2/fundamentals",
  "cloud/aws-vpc/overview",
  "cloud/aws-iam/overview",
  "cloud/aws-iam/fundamentals",
  // Data — SQL
  "data/sql/overview",
  "data/sql/fundamentals",
  // AI — LangChain
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

export async function fetchContent(
  academy: string,
  technology: string,
  section: string
): Promise<string | null> {
  const key = `${academy}/${technology}/${section}`;
  if (!contentRegistry.has(key)) return null;
  try {
    const res = await fetch(`/content/${key}.md`);
    if (!res.ok) return null;
    return await res.text();
  } catch {
    return null;
  }
}

export function getContent(_academy: string, _technology: string, _section: string): string | null {
  return null; // Use fetchContent (async) instead
}
