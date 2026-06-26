# Platform Engineering Interview Q&A

**Q: What is an Internal Developer Platform (IDP)?**
A self-service layer built by platform teams that enables developers to provision infrastructure, deploy applications, and manage environments without needing DevOps expertise. Abstracts Kubernetes, cloud APIs, and CI/CD behind golden paths.

**Q: Platform Engineering vs DevOps?**
DevOps: culture and practices, teams own their deployments. Platform Engineering: builds the infrastructure other teams use. Platform team creates the "paved road" — developers choose to use it because it's faster and better than doing it themselves.

**Q: What is Backstage?**
Open-source developer portal by Spotify (now CNCF). Software catalog for discoverability. Scaffolding templates for creating new services. Plugin ecosystem for integrating tools (K8s, Datadog, GitHub, PagerDuty). Reduces cognitive load for developers.
