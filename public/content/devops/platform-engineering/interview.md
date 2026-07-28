# Platform Engineering Interview Q&A

**Q: What is an Internal Developer Platform (IDP)?**
A self-service layer built by platform teams that enables developers to provision infrastructure, deploy applications, and manage environments without needing DevOps expertise. Abstracts Kubernetes, cloud APIs, and CI/CD behind golden paths.

**Q: Platform Engineering vs DevOps?**
DevOps: culture and practices, teams own their deployments. Platform Engineering: builds the infrastructure other teams use. Platform team creates the "paved road" — developers choose to use it because it's faster and better than doing it themselves.

**Q: What is Backstage?**
Open-source developer portal by Spotify (now CNCF). Software catalog for discoverability. Scaffolding templates for creating new services. Plugin ecosystem for integrating tools (K8s, Datadog, GitHub, PagerDuty). Reduces cognitive load for developers.


**Q: What is a platform team's primary responsibility?**
Build and maintain the Internal Developer Platform (IDP) — the self-service infrastructure layer that enables product teams to deploy, monitor, and manage their services without deep infrastructure knowledge. Goal: reduce cognitive load on developers, increase deployment velocity.

**Q: What is the "golden path" concept in platform engineering?**
A well-lit, opinionated path for doing common tasks correctly. Templates, scaffolding, and automation that make the right way the easy way. Developers who follow the golden path get: security, compliance, observability, and reliability built in. Backstage.io is commonly used to expose the golden path as a developer portal.

**Q: How do you measure platform team success?**
- DORA metrics: deployment frequency, lead time, MTTR, change failure rate
- Platform adoption: % of teams using the platform vs managing their own infra
- Ticket reduction: fewer infra support requests to platform team
- Developer satisfaction: survey scores from product teams
- Onboarding time: how fast a new team can deploy their first service

**Q: What is the team topology for platform engineering?**
Platform team = enabling team (Team Topologies model). Reduces cognitive load for stream-aligned teams (product teams). Uses X-as-a-Service interaction mode: platform provides self-service APIs, product teams consume them independently. Platform team treats developers as internal customers.

