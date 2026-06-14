# Azure DevOps — Interview Questions

**What is the difference between Azure Pipelines Classic and YAML pipelines?**
Classic (GUI) pipelines: visual editor, easier to get started, less version control, harder to reuse/template, being deprecated. YAML pipelines: code in repository, version controlled alongside application code, supports templates for reuse, multi-stage with approvals, portable between projects. YAML is the recommended approach for new pipelines — enables GitOps for CI/CD configuration.

**What are service connections in Azure DevOps?**
Service connections store credentials for external services (Azure subscriptions, Kubernetes clusters, Docker registries, GitHub, etc.) securely — pipelines don't see the raw credentials. Types: Azure Resource Manager (uses service principal or managed identity), Kubernetes service connection, Docker registry, GitHub. Manage access control: specific pipelines can be restricted from using certain connections. Always use service connections over storing credentials in variables.

**How do you implement approval gates in Azure DevOps?**
In YAML pipelines: define an environment (e.g., production), then configure approvals on that environment in the Azure DevOps UI (Environments → Approvals and Checks). When a pipeline stage deploys to that environment, it pauses and sends notifications to approvers. Approvers review and approve/reject via the UI or email. You can also add: branch filters (only allow deploys from main), timeout (auto-reject after N hours), required reviewers, and task checks (custom validations before approval).
