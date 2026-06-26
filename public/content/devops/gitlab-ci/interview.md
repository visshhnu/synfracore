# GitLab CI Interview Q&A

**Q: GitLab CI vs GitHub Actions?**
GitLab CI: native to GitLab, powerful include/extends, better multi-project pipelines, built-in registry and K8s integration. GitHub Actions: better marketplace, OIDC support, free for public repos. GitLab preferred for self-hosted enterprise.

**Q: What are GitLab CI stages?**
Stages define execution order. Jobs within same stage run in parallel. Default stages: build, test, deploy. Custom: `stages: [lint, build, test, security, deploy]`.

**Q: What is `extends` in GitLab CI?**
Reuse job configurations. Define a `.template` job, extend it in real jobs. Reduces duplication. Hidden jobs (prefix with `.`) don't run but can be extended.

## Quick Reference — Gitlab Ci

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

**Q: How do GitLab CI rules differ from only/except?**
`rules` is the modern replacement for `only/except`. Rules are evaluated top-to-bottom; first matching rule applies. More powerful: combine conditions (if, changes, exists, when). `only/except` is simpler but cannot express complex conditions. GitLab recommends using `rules` for all new pipelines.

**Q: What is a GitLab CI/CD component vs a template?**
CI/CD components (GitLab 16.0+): versioned, reusable pipeline configuration distributed via the GitLab CI/CD Catalog. Input parameters defined, versioned with semantic versioning. Templates: YAML includes from GitLab's template library — less structured. Components are the future of pipeline reuse in GitLab.

**Q: How does GitLab handle secrets?**
Variables defined in Settings > CI/CD > Variables. Masked variables (hidden in logs), protected variables (only on protected branches/tags). Integration with HashiCorp Vault: `secrets:` keyword fetches from Vault dynamically at job start. External secrets manager is preferred over GitLab variables for sensitive credentials.

**Q: What are GitLab runners and how do you scale them?**
Runners execute CI jobs. GitLab.com provides shared runners. Self-managed: install gitlab-runner on Linux/Docker/Kubernetes. Docker executor: each job gets fresh container (most common). Kubernetes executor: each job is a Kubernetes pod — auto-scales with cluster. Group/project runners for dedicated performance.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
