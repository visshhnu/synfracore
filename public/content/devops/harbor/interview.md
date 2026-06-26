# Harbor Interview Q&A

**Q: Harbor vs ECR vs ACR vs Docker Hub?**
Harbor: open-source, self-hosted, CNCF, vulnerability scanning (Trivy), content trust, replication, RBAC. ECR: AWS-native, IAM integration, no separate auth. ACR: Azure-native, geo-replication, tasks. Docker Hub: public images, rate limits. Harbor for air-gapped/on-prem; cloud registries for cloud-native.

**Q: What is Harbor's vulnerability scanning?**
Integrated Trivy scanner scans images on push. Blocks pull of images with critical CVEs (configurable policy). Reports CVEs by severity in UI. Auto-scan on push or scheduled.

**Q: How does Harbor replication work?**
Push-based or pull-based replication to/from other registries (ECR, ACR, Docker Hub, another Harbor). Used for: disaster recovery, bringing images closer to deployment clusters, air-gapped environments.

## Quick Reference — Harbor

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

**Q: How does Harbor enforce image signing and content trust?**
Harbor integrates with Cosign (Sigstore) for OCI artifact signing. CI pipeline signs images after build. Harbor policy can block unsigned images from being pulled. Combined with admission controllers (Connaisseur, Kyverno) in Kubernetes — only signed images from trusted registries run in cluster.

**Q: What is Harbor's replication and when do you use it?**
Push or pull replication between Harbor instances or to/from ECR, ACR, Docker Hub. Use cases: (1) HA/DR — replicate to standby region; (2) air-gapped environments — pull from internet-facing Harbor to internal Harbor; (3) edge deployments — replicate subset of images closer to deployment sites.

**Q: How do you set up RBAC in Harbor?**
Projects contain repositories. Users/groups assigned roles per project: Project Admin, Developer (push), Guest (pull only). LDAP/AD integration for enterprise. Robot accounts for CI/CD — scoped to specific projects, time-limited credentials, auto-rotated.

**Q: What is Harbor's garbage collection and when should you run it?**
GC reclaims storage from deleted artifacts and untagged layers. Run during off-peak hours (scheduled maintenance window). Before GC: ensure no active pushes/pulls. Harbor UI: Administration → Garbage Collection → Schedule. Logs show what was reclaimed. Important for large registries that accumulate many image versions.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
