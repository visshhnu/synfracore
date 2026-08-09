# Terraform — PYQ (Previously Asked / Practice Questions)

**Framing note:** HashiCorp Terraform certifications (Terraform Associate) are proctored and confidential — no public leaked-question archive exists. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Terraform behavior.

---

### 1. (Domain: Core Concepts) What does "declarative" actually mean in the context of Terraform, and why does this matter for how you write configuration?

**Answer:** Declarative means you define *what* infrastructure state you want, not *how* to achieve it step by step — Terraform figures out the actual sequence of API calls needed to reach that state from wherever infrastructure currently stands. This matters practically because you don't write "create this, then that, then update this" imperative logic; you describe the end state, and Terraform's plan/apply cycle handles determining and executing the necessary changes, including on subsequent runs where only a diff needs to be applied.

---

### 2. (Domain: State Management) Why is remote state (S3, Azure Blob, etc.) considered mandatory for any team using Terraform, rather than an optional convenience?

**Answer:** Local state means each team member has their own separate state file, with no locking and no shared source of truth — two people running `terraform apply` around the same time with local state can easily conflict or corrupt state, and nobody else can safely know what infrastructure currently exists according to Terraform. Remote state provides both locking (preventing concurrent applies from conflicting) and a single shared source of truth every team member and CI pipeline reads from — genuinely required for safe team collaboration, not just a nice-to-have.

---

### 3. (Domain: Troubleshooting) `terraform plan` shows an unexpected destroy-and-recreate for a resource that wasn't intentionally changed. What's the most common underlying cause?

**Answer:** A change to an attribute that forces replacement rather than an in-place update — some resource attributes in a given provider's schema are marked as requiring replacement if changed (versus other attributes that support in-place update), and a seemingly small configuration change can trigger this if it touches one of those specific attributes. The fix is checking the provider documentation for which specific attribute triggered the forced replacement, and confirming whether that replacement is actually intended before applying.

---

### 4. (Domain: State Locking) A `terraform apply` fails with a state lock error. What does this actually mean, and what's the correct way to resolve it?

**Answer:** It means another Terraform operation (possibly from a different team member, or a stuck/crashed previous run) currently holds the state lock, preventing concurrent modification of the same state file. The correct resolution is confirming no other legitimate operation is actually still running before using `terraform force-unlock` — force-unlocking while another operation is genuinely still in progress can cause real state corruption, so this should never be a reflexive first response to a lock error.

---

### 5. (Domain: Providers) What's the difference between a Terraform "provider" and a "resource," and how do they relate?

**Answer:** A provider is the plugin that lets Terraform interact with a specific platform's API (the AWS provider, the Azure provider) — it's what translates Terraform's declarative configuration into actual API calls against that platform. A resource is a specific infrastructure object defined using a provider's schema (an `aws_instance`, an `azurerm_storage_account`) — resources are always defined in the context of a specific provider, which supplies the schema and API interaction logic for that resource type.

---

### 6. (Domain: Variables/Secrets) Why does this guide explicitly warn against hardcoding secrets in Terraform configuration, even in a private repository?

**Answer:** Terraform state files often store resource attribute values in plaintext, including values that originated from variables — a hardcoded secret in configuration can end up persisted in the state file as well, which is a separate, additional exposure surface beyond the configuration file itself, especially if state is stored remotely and accessed by more people/systems than the original configuration repository. Using environment variables or a secrets manager (Vault integration) keeps secrets out of both the configuration and, where properly implemented, minimizes their persistence in state.

---

### 7. (Domain: State Drift) `terraform plan` shows unexpected changes even though nobody modified the Terraform configuration. What does this indicate, and how should it be handled?

**Answer:** This indicates state drift — the actual infrastructure has been modified outside of Terraform (a manual change via cloud console, another automation tool, or an out-of-band API call), so Terraform's recorded state no longer matches reality. The plan Terraform generates is trying to reconcile the *real* infrastructure back to match the configuration, which may include reverting the manual change. This should be investigated before blindly applying — understanding *why* the drift happened (and whether the manual change should actually be preserved by updating the Terraform configuration instead) matters more than mechanically applying the plan.

---

### 8. (Domain: Providers) A `terraform apply` fails with a provider authentication error, but the same credentials work fine via the cloud provider's own CLI. What's a common cause of this specific discrepancy?

**Answer:** Terraform's provider block often expects credentials via specific, provider-defined mechanisms (environment variables with specific names, a particular credentials file location, or explicit provider block arguments) that may differ from what the cloud provider's own CLI tooling uses by default — a credential that's correctly configured for the CLI isn't automatically picked up by Terraform's provider unless it's exposed through the exact mechanism that provider's Terraform plugin expects.

---

### 9. (Domain: Lifecycle) Walk through what `terraform plan`, `terraform apply`, and `terraform destroy` each actually do, in sequence.

**Answer:** `terraform plan` computes and displays the difference between current state and desired configuration, without making any actual changes — a dry run. `terraform apply` executes the plan (or generates and immediately executes one if run without a saved plan file), making the actual API calls to bring infrastructure in line with configuration, and updates the state file to reflect the new reality. `terraform destroy` computes and executes a plan to remove all resources currently tracked in state — the inverse operation, tearing down what Terraform created rather than creating or updating it.

---

### 10. (Domain: IaC Comparison) When would a team choose Terraform over a cloud-native IaC tool (like AWS CloudFormation) despite the added complexity of a separate tool and state management?

**Answer:** Primarily for multi-cloud or cloud-agnostic infrastructure management — Terraform's provider model lets a single tool and configuration language manage resources across AWS, Azure, GCP, and many other platforms with a consistent workflow, whereas CloudFormation is AWS-specific. For a team fully committed to a single cloud with no multi-cloud requirement, a cloud-native tool avoids Terraform's added state-management overhead; the tradeoff shifts toward Terraform specifically once genuine multi-cloud or provider-portability needs exist.
