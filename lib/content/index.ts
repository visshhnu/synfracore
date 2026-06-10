// SynfraCore Content Registry
// Maps: academy/technology/section → actual file path

const contentRegistry = new Map<string, string>([

  // ── DEVOPS ACADEMY ──────────────────────────────────────
  ["devops/linux/overview",           "infrastructure/linux/overview"],
  ["devops/linux/fundamentals",       "infrastructure/linux/fundamentals"],
  ["devops/linux/intermediate",       "infrastructure/linux/intermediate"],
  ["devops/linux/advanced",           "infrastructure/linux/advanced"],
  ["devops/linux/cheatsheets",        "infrastructure/linux/cheatsheets"],
  ["devops/linux/interview",          "infrastructure/linux/interview"],
  ["devops/networking/overview",      "infrastructure/networking/overview"],
  ["devops/shell-scripting/overview", "infrastructure/shell-scripting/overview"],
  ["devops/docker/overview",          "infrastructure/docker/overview"],
  ["devops/docker/fundamentals",      "infrastructure/docker/fundamentals"],
  ["devops/docker/cheatsheets",       "infrastructure/docker/cheatsheets"],
  ["devops/docker/interview",         "infrastructure/docker/interview"],
  ["devops/kubernetes/overview",      "infrastructure/kubernetes/overview"],
  ["devops/kubernetes/fundamentals",  "infrastructure/kubernetes/fundamentals"],
  ["devops/kubernetes/advanced",      "infrastructure/kubernetes/advanced"],
  ["devops/kubernetes/troubleshooting","infrastructure/kubernetes/troubleshooting"],
  ["devops/kubernetes/interview",     "infrastructure/kubernetes/interview"],
  ["devops/kubernetes/labs",          "infrastructure/kubernetes/labs"],
  ["devops/kubernetes/cheatsheets",   "infrastructure/kubernetes/cheatsheets"],
  ["devops/helm/overview",            "infrastructure/helm/overview"],
  ["devops/helm/fundamentals",        "infrastructure/helm/fundamentals"],
  ["devops/git/overview",             "infrastructure/git/overview"],
  ["devops/jenkins/overview",         "infrastructure/jenkins/overview"],
  ["devops/jenkins/advanced",         "infrastructure/jenkins/advanced"],
  ["devops/argocd/overview",          "infrastructure/argocd/overview"],
  ["devops/terraform/overview",       "infrastructure/terraform/overview"],
  ["devops/terraform/fundamentals",   "infrastructure/terraform/fundamentals"],
  ["devops/terraform/advanced",       "infrastructure/terraform/advanced"],
  ["devops/terraform/interview",      "infrastructure/terraform/interview"],
  ["devops/terraform/cheatsheets",    "infrastructure/terraform/cheatsheets"],
  ["devops/ansible/overview",         "infrastructure/ansible/overview"],
  ["devops/ansible/fundamentals",     "infrastructure/ansible/fundamentals"],
  ["devops/ansible/interview",        "infrastructure/ansible/interview"],
  ["devops/prometheus/overview",      "infrastructure/prometheus/overview"],
  ["devops/grafana/overview",         "infrastructure/grafana/overview"],
  ["devops/elk-stack/overview",       "infrastructure/elk-stack/overview"],
  ["devops/python/overview",          "infrastructure/python/overview"],
  ["devops/python/fundamentals",      "infrastructure/python/fundamentals"],
  ["devops/python/cheatsheets",       "infrastructure/python/cheatsheets"],
  ["devops/python/interview",         "infrastructure/python/interview"],
  ["devops/nginx/overview",           "infrastructure/nginx/overview"],

  // ── CLOUD ACADEMY ───────────────────────────────────────
  ["cloud/aws-iam/overview",          "cloud/aws-iam/overview"],
  ["cloud/aws-iam/fundamentals",      "cloud/aws-iam/fundamentals"],
  ["cloud/aws-ec2/overview",          "cloud/aws-ec2/overview"],
  ["cloud/aws-ec2/fundamentals",      "cloud/aws-ec2/fundamentals"],
  ["cloud/aws-vpc/overview",          "cloud/aws-vpc/overview"],
  ["cloud/aws-s3/overview",           "cloud/aws-s3/overview"],
  ["cloud/aws-rds/overview",          "cloud/aws-rds/overview"],
  ["cloud/aws-lambda/overview",       "cloud/aws-lambda/overview"],
  ["cloud/aws-eks/overview",          "cloud/aws-eks/overview"],
  ["cloud/cloudformation/overview",   "cloud/terraform/overview"],
  ["cloud/route53/overview",          "cloud/aws-vpc/overview"],
  ["cloud/azure-entra/overview",      "cloud/azure-devops/overview"],
  ["cloud/azure-vms/overview",        "cloud/aws-ec2/overview"],
  ["cloud/azure-vnets/overview",      "cloud/aws-vpc/overview"],
  ["cloud/azure-aks/overview",        "cloud/azure-aks/overview"],
  ["cloud/azure-devops/overview",     "cloud/azure-devops/overview"],
  ["cloud/gke/overview",              "cloud/aws-eks/overview"],
  ["cloud/bigquery/overview",         "data/sql/overview"],
  ["cloud/cloud-run/overview",        "cloud/aws-lambda/overview"],
  ["cloud/cloud-security/overview",   "security/security-fundamentals/overview"],
  ["cloud/cost-optimization/overview","cloud/aws-ec2/overview"],
  ["cloud/landing-zones/overview",    "cloud/aws-vpc/overview"],

  // ── DATABASES ACADEMY ───────────────────────────────────
  ["databases/postgresql/overview",   "infrastructure/postgresql/overview"],
  ["databases/mysql/overview",        "infrastructure/mysql/overview"],
  ["databases/sql/overview",          "data/sql/overview"],
  ["databases/sql/fundamentals",      "data/sql/fundamentals"],
  ["databases/mongodb/overview",      "infrastructure/mongodb/overview"],
  ["databases/cassandra/overview",    "infrastructure/cassandra/overview"],
  ["databases/dynamodb/overview",     "infrastructure/redis/overview"],
  ["databases/redis/overview",        "infrastructure/redis/overview"],
  ["databases/elasticsearch/overview","infrastructure/elk-stack/overview"],

  // ── AI ACADEMY ──────────────────────────────────────────
  ["ai/ai-fundamentals/overview",     "ai/ai-fundamentals/overview"],
  ["ai/prompt-engineering/overview",  "ai/prompt-engineering/overview"],
  ["ai/langchain/overview",           "ai/langchain/overview"],
  ["ai/langchain/fundamentals",       "ai/langchain/fundamentals"],
  ["ai/rag/overview",                 "ai/rag/overview"],
  ["ai/ai-agents/overview",           "ai/ai-agents/overview"],
  ["ai/llmops/overview",              "ai/llmops/overview"],
  ["ai/openai/overview",              "ai/ai-fundamentals/overview"],

  // ── DATA ACADEMY ────────────────────────────────────────
  ["data/excel/overview",             "data/excel/overview"],
  ["data/pandas/overview",            "data/pandas/overview"],
  ["data/power-bi/overview",          "data/power-bi/overview"],
  ["data/tableau/overview",           "data/power-bi/overview"],
  ["data/sql/overview",               "data/sql/overview"],
  ["data/sql/fundamentals",           "data/sql/fundamentals"],

  // ── SECURITY ACADEMY ────────────────────────────────────
  ["security/security-fundamentals/overview", "security/security-fundamentals/overview"],
  ["security/network-security/overview",      "security/network-security/overview"],
  ["security/ethical-hacking/overview",       "security/ethical-hacking/overview"],
  ["security/soc/overview",                   "security/soc/overview"],
  ["security/siem/overview",                  "security/soc/overview"],
  ["security/pen-testing/overview",           "security/ethical-hacking/overview"],

  // ── HEALTHCARE ACADEMY ──────────────────────────────────
  ["healthcare/icd-10-cm/overview",           "healthcare/icd-10-cm/overview"],
  ["healthcare/icd-10-cm/fundamentals",       "healthcare/icd-10-cm/fundamentals"],
  ["healthcare/icd-10-cm/interview",          "healthcare/icd-10-cm/interview"],
  ["healthcare/cpt/overview",                 "healthcare/cpt/overview"],
  ["healthcare/hcpcs/overview",               "healthcare/hcpcs/overview"],
  ["healthcare/coding-guidelines/overview",   "healthcare/coding-guidelines/overview"],
  ["healthcare/home-health-coding/overview",  "healthcare/home-health-coding/overview"],
  ["healthcare/patient-documentation/overview","healthcare/coding-guidelines/overview"],
  ["healthcare/healthcare-admin/overview",    "healthcare/coding-guidelines/overview"],
  ["healthcare/mock-exams/overview",          "healthcare/icd-10-cm/interview"],

  // ── HUMAN ESSENTIALS ACADEMY ────────────────────────────
  ["essentials/gut-health/overview",          "healthcare/coding-guidelines/overview"],
  ["essentials/hygiene/overview",             "healthcare/coding-guidelines/overview"],
  ["essentials/nutrition/overview",           "healthcare/coding-guidelines/overview"],
  ["essentials/mental-health/overview",       "healthcare/coding-guidelines/overview"],
  ["essentials/personal-finance/overview",    "healthcare/coding-guidelines/overview"],
  ["essentials/first-aid/overview",           "healthcare/coding-guidelines/overview"],

  // ── EDUCATION ACADEMY (School & College) ────────────────
  ["education/dsa/overview",                  "education/dsa/overview"],
  ["education/os/overview",                   "education/dsa/overview"],
  ["education/dbms/overview",                 "data/sql/overview"],
  ["education/cn/overview",                   "infrastructure/networking/overview"],
  ["education/system-design/overview",        "infrastructure/kubernetes/advanced"],
  ["education/placement-prep/overview",       "education/dsa/overview"],
  ["education/maths/overview",                "exams/gate-cse/overview"],
  ["education/science/overview",              "exams/gate-cse/overview"],
  ["education/cs-school/overview",            "infrastructure/python/overview"],

  // ── EXAMS ACADEMY ───────────────────────────────────────
  ["exams/gate-cse/overview",                 "exams/gate-cse/overview"],
  ["exams/gate-ece/overview",                 "exams/gate-cse/overview"],
  ["exams/jee-maths/overview",                "exams/gate-cse/overview"],
  ["exams/jee-physics/overview",              "exams/gate-cse/overview"],
  ["exams/jee-chemistry/overview",            "exams/gate-cse/overview"],
  ["exams/banking-exams/overview",            "exams/banking-exams/overview"],
  ["exams/ssc-cgl/overview",                  "exams/banking-exams/overview"],
  ["exams/rrb-ntpc/overview",                 "exams/banking-exams/overview"],
  ["exams/upsc-prelims/overview",             "exams/gate-cse/overview"],
  ["exams/upsc-mains/overview",               "exams/gate-cse/overview"],
]);

export function hasContent(a: string, t: string, s: string): boolean {
  return contentRegistry.has(`${a}/${t}/${s}`);
}

export async function fetchContent(a: string, t: string, s: string): Promise<string | null> {
  const key = `${a}/${t}/${s}`;
  const filePath = contentRegistry.get(key);
  if (!filePath) return null;
  try {
    const res = await fetch(`/content/${filePath}.md`);
    if (!res.ok) return null;
    return await res.text();
  } catch { return null; }
}

export function getContent(_a: string, _t: string, _s: string): string | null { return null; }
