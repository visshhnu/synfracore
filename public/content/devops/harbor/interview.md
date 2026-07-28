# Harbor Interview Q&A

**Q: Harbor vs ECR vs ACR vs Docker Hub?**
Harbor: open-source, self-hosted, CNCF, vulnerability scanning (Trivy), content trust, replication, RBAC. ECR: AWS-native, IAM integration, no separate auth. ACR: Azure-native, geo-replication, tasks. Docker Hub: public images, rate limits. Harbor for air-gapped/on-prem; cloud registries for cloud-native.

**Q: What is Harbor's vulnerability scanning?**
Integrated Trivy scanner scans images on push. Blocks pull of images with critical CVEs (configurable policy). Reports CVEs by severity in UI. Auto-scan on push or scheduled.

**Q: How does Harbor replication work?**
Push-based or pull-based replication to/from other registries (ECR, ACR, Docker Hub, another Harbor). Used for: disaster recovery, bringing images closer to deployment clusters, air-gapped environments.


**Q: How does Harbor enforce image signing and content trust?**
Harbor integrates with Cosign (Sigstore) for OCI artifact signing. CI pipeline signs images after build. Harbor policy can block unsigned images from being pulled. Combined with admission controllers (Connaisseur, Kyverno) in Kubernetes — only signed images from trusted registries run in cluster.

**Q: What is Harbor's replication and when do you use it?**
Push or pull replication between Harbor instances or to/from ECR, ACR, Docker Hub. Use cases: (1) HA/DR — replicate to standby region; (2) air-gapped environments — pull from internet-facing Harbor to internal Harbor; (3) edge deployments — replicate subset of images closer to deployment sites.

**Q: How do you set up RBAC in Harbor?**
Projects contain repositories. Users/groups assigned roles per project: Project Admin, Developer (push), Guest (pull only). LDAP/AD integration for enterprise. Robot accounts for CI/CD — scoped to specific projects, time-limited credentials, auto-rotated.

**Q: What is Harbor's garbage collection and when should you run it?**
GC reclaims storage from deleted artifacts and untagged layers. Run during off-peak hours (scheduled maintenance window). Before GC: ensure no active pushes/pulls. Harbor UI: Administration → Garbage Collection → Schedule. Logs show what was reclaimed. Important for large registries that accumulate many image versions.


