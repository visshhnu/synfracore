// Content registry — maps academy/technology/section to actual file paths
// New structure: academies have domains, each domain has technologies
// Content files stay in their existing paths for now

const contentRegistry = new Map<string, string>([
  // DevOps academy — maps to existing content files
  ["devops/linux/overview",          "infrastructure/linux/overview"],
  ["devops/linux/fundamentals",      "infrastructure/linux/fundamentals"],
  ["devops/linux/intermediate",      "infrastructure/linux/intermediate"],
  ["devops/linux/advanced",          "infrastructure/linux/advanced"],
  ["devops/linux/cheatsheets",       "infrastructure/linux/cheatsheets"],
  ["devops/linux/interview",         "infrastructure/linux/interview"],
  ["devops/networking/overview",     "infrastructure/networking/overview"],
  ["devops/shell-scripting/overview","infrastructure/linux/cheatsheets"],
  ["devops/docker/overview",         "infrastructure/docker/overview"],
  ["devops/docker/fundamentals",     "infrastructure/docker/fundamentals"],
  ["devops/docker/cheatsheets",      "infrastructure/docker/cheatsheets"],
  ["devops/docker/interview",        "infrastructure/docker/interview"],
  ["devops/kubernetes/overview",     "infrastructure/kubernetes/overview"],
  ["devops/kubernetes/fundamentals", "infrastructure/kubernetes/fundamentals"],
  ["devops/kubernetes/advanced",     "infrastructure/kubernetes/advanced"],
  ["devops/kubernetes/troubleshooting","infrastructure/kubernetes/troubleshooting"],
  ["devops/kubernetes/interview",    "infrastructure/kubernetes/interview"],
  ["devops/kubernetes/labs",         "infrastructure/kubernetes/labs"],
  ["devops/kubernetes/cheatsheets",  "infrastructure/kubernetes/cheatsheets"],
  ["devops/helm/overview",           "infrastructure/helm/overview"],
  ["devops/helm/fundamentals",       "infrastructure/helm/fundamentals"],
  ["devops/git/overview",            "infrastructure/git/overview"],
  ["devops/jenkins/overview",        "infrastructure/jenkins/overview"],
  ["devops/jenkins/advanced",        "infrastructure/jenkins/advanced"],
  ["devops/argocd/overview",         "infrastructure/argocd/overview"],
  ["devops/terraform/overview",      "infrastructure/terraform/overview"],
  ["devops/terraform/fundamentals",  "infrastructure/terraform/fundamentals"],
  ["devops/terraform/advanced",      "infrastructure/terraform/advanced"],
  ["devops/terraform/interview",     "infrastructure/terraform/interview"],
  ["devops/terraform/cheatsheets",   "infrastructure/terraform/cheatsheets"],
  ["devops/ansible/overview",        "infrastructure/ansible/overview"],
  ["devops/ansible/fundamentals",    "infrastructure/ansible/fundamentals"],
  ["devops/ansible/interview",       "infrastructure/ansible/interview"],
  ["devops/prometheus/overview",     "infrastructure/prometheus/overview"],
  ["devops/grafana/overview",        "infrastructure/grafana/overview"],
  ["devops/elk-stack/overview",      "infrastructure/elk-stack/overview"],
  ["devops/python/overview",         "infrastructure/python/overview"],
  ["devops/python/fundamentals",     "infrastructure/python/fundamentals"],
  ["devops/python/cheatsheets",      "infrastructure/python/cheatsheets"],
  ["devops/python/interview",        "infrastructure/python/interview"],
  ["devops/nginx/overview",          "infrastructure/networking/overview"],

  // Cloud academy
  ["cloud/aws-iam/overview",         "cloud/aws-iam/overview"],
  ["cloud/aws-iam/fundamentals",     "cloud/aws-iam/fundamentals"],
  ["cloud/aws-ec2/overview",         "cloud/aws-ec2/overview"],
  ["cloud/aws-ec2/fundamentals",     "cloud/aws-ec2/fundamentals"],
  ["cloud/aws-vpc/overview",         "cloud/aws-vpc/overview"],
  ["cloud/aws-s3/overview",          "cloud/aws-s3/overview"],
  ["cloud/aws-rds/overview",         "cloud/aws-s3/overview"],
  ["cloud/aws-lambda/overview",      "cloud/aws-lambda/overview"],
  ["cloud/aws-eks/overview",         "cloud/aws-eks/overview"],
  ["cloud/cloudformation/overview",  "cloud/terraform/overview"],
  ["cloud/route53/overview",         "cloud/aws-vpc/overview"],
  ["cloud/azure-entra/overview",     "cloud/azure-devops/overview"],
  ["cloud/azure-vms/overview",       "cloud/aws-ec2/overview"],
  ["cloud/azure-vnets/overview",     "cloud/aws-vpc/overview"],
  ["cloud/azure-aks/overview",       "cloud/azure-aks/overview"],
  ["cloud/azure-devops/overview",    "cloud/azure-devops/overview"],
  ["cloud/gke/overview",             "cloud/aws-eks/overview"],
  ["cloud/bigquery/overview",        "data/sql/overview"],
  ["cloud/cloud-run/overview",       "cloud/aws-lambda/overview"],
  ["cloud/cloud-security/overview",  "security/security-fundamentals/overview"],
  ["cloud/cost-optimization/overview","cloud/aws-ec2/overview"],
  ["cloud/landing-zones/overview",   "cloud/aws-vpc/overview"],

  // Databases academy
  ["databases/postgresql/overview",  "infrastructure/postgresql/overview"],
  ["databases/mysql/overview",       "infrastructure/mysql/overview"],
  ["databases/sql/overview",         "data/sql/overview"],
  ["databases/sql/fundamentals",     "data/sql/fundamentals"],
  ["databases/mongodb/overview",     "infrastructure/mongodb/overview"],
  ["databases/cassandra/overview",   "infrastructure/cassandra/overview"],
  ["databases/dynamodb/overview",    "infrastructure/redis/overview"],
  ["databases/redis/overview",       "infrastructure/redis/overview"],
  ["databases/elasticsearch/overview","monitoring/elk-stack/overview"],

  // AI academy
  ["ai/ai-fundamentals/overview",    "ai/prompt-engineering/overview"],
  ["ai/prompt-engineering/overview", "ai/prompt-engineering/overview"],
  ["ai/langchain/overview",          "ai/langchain/overview"],
  ["ai/langchain/fundamentals",      "ai/langchain/fundamentals"],
  ["ai/rag/overview",                "ai/rag/overview"],
  ["ai/ai-agents/overview",          "ai/ai-agents/overview"],
  ["ai/llmops/overview",             "ai/llmops/overview"],
  ["ai/openai/overview",             "ai/prompt-engineering/overview"],

  // Data academy
  ["data/excel/overview",            "data/pandas/overview"],
  ["data/pandas/overview",           "data/pandas/overview"],
  ["data/power-bi/overview",         "data/power-bi/overview"],
  ["data/tableau/overview",          "data/power-bi/overview"],
  ["data/sql/overview",              "data/sql/overview"],
  ["data/sql/fundamentals",          "data/sql/fundamentals"],

  // Security academy
  ["security/security-fundamentals/overview","security/security-fundamentals/overview"],
  ["security/network-security/overview",     "security/network-security/overview"],
  ["security/ethical-hacking/overview",      "security/ethical-hacking/overview"],
  ["security/soc/overview",                  "security/soc/overview"],
  ["security/siem/overview",                 "security/soc/overview"],

  // Healthcare academy
  ["healthcare/icd-10-cm/overview",          "healthcare/icd-10-cm/overview"],
  ["healthcare/icd-10-cm/fundamentals",      "healthcare/icd-10-cm/fundamentals"],
  ["healthcare/icd-10-cm/interview",         "healthcare/icd-10-cm/interview"],
  ["healthcare/coding-guidelines/overview",  "healthcare/coding-guidelines/overview"],
  ["healthcare/cpt/overview",                "healthcare/cpt/overview"],
  ["healthcare/hcpcs/overview",              "healthcare/hcpcs/overview"],
  ["healthcare/mock-exams/overview",         "healthcare/icd-10-cm/interview"],
]);

export function hasContent(academy: string, technology: string, section: string): boolean {
  return contentRegistry.has(`${academy}/${technology}/${section}`);
}

export async function fetchContent(academy: string, technology: string, section: string): Promise<string | null> {
  const key = `${academy}/${technology}/${section}`;
  const filePath = contentRegistry.get(key);
  if (!filePath) return null;
  try {
    const res = await fetch(`/content/${filePath}.md`);
    if (!res.ok) return null;
    return await res.text();
  } catch { return null; }
}

export function getContent(_a: string, _t: string, _s: string): string | null { return null; }
