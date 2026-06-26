# GitLab CI Interview Q&A

**Q: GitLab CI vs GitHub Actions?**
GitLab CI: native to GitLab, powerful include/extends, better multi-project pipelines, built-in registry and K8s integration. GitHub Actions: better marketplace, OIDC support, free for public repos. GitLab preferred for self-hosted enterprise.

**Q: What are GitLab CI stages?**
Stages define execution order. Jobs within same stage run in parallel. Default stages: build, test, deploy. Custom: `stages: [lint, build, test, security, deploy]`.

**Q: What is `extends` in GitLab CI?**
Reuse job configurations. Define a `.template` job, extend it in real jobs. Reduces duplication. Hidden jobs (prefix with `.`) don't run but can be extended.
