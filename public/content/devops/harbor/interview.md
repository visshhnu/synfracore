# Harbor Interview Q&A

**Q: Harbor vs ECR vs ACR vs Docker Hub?**
Harbor: open-source, self-hosted, CNCF, vulnerability scanning (Trivy), content trust, replication, RBAC. ECR: AWS-native, IAM integration, no separate auth. ACR: Azure-native, geo-replication, tasks. Docker Hub: public images, rate limits. Harbor for air-gapped/on-prem; cloud registries for cloud-native.

**Q: What is Harbor's vulnerability scanning?**
Integrated Trivy scanner scans images on push. Blocks pull of images with critical CVEs (configurable policy). Reports CVEs by severity in UI. Auto-scan on push or scheduled.

**Q: How does Harbor replication work?**
Push-based or pull-based replication to/from other registries (ECR, ACR, Docker Hub, another Harbor). Used for: disaster recovery, bringing images closer to deployment clusters, air-gapped environments.
