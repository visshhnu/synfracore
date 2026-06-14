# GKE — Interview Questions

**What is GKE Autopilot and when should you use it over Standard?**
GKE Autopilot: Google fully manages node provisioning, scaling, and lifecycle. You only define pods; GKE auto-provisions nodes to fit them. Billing is per pod resource request (CPU/memory), not per node — cost-efficient for variable workloads. Limitations: no DaemonSets (replaced by GKE mechanisms), no privileged containers, specific machine types. Standard: you manage node pools, pays for allocated nodes. Use Autopilot for: variable traffic, simplicity, rapid iteration. Use Standard for: GPU workloads, specific VM requirements, DaemonSets, maximum control.

**How does Workload Identity improve security over service account keys?**
Traditional approach: create GCP service account key (JSON), store in Kubernetes secret, mount in pod — keys can be exfiltrated from etcd/secrets, must be manually rotated. Workload Identity: GKE issues short-lived OIDC tokens to pods based on Kubernetes service account, GCP validates tokens and issues GCP credentials automatically, no keys stored anywhere, credentials auto-rotate every hour, audit trail shows exactly which pod made which GCP API call. Significantly reduces credential exposure and management overhead.

**What is the difference between GKE and GCP Compute Engine (VMs)?**
Compute Engine: raw VMs, you manage OS/software/scaling manually, maximum flexibility, persistent state by default. GKE: orchestrated containers running on Compute Engine VMs under the hood, Kubernetes manages scheduling/scaling/healing, better for stateless apps, microservices, CI/CD workflows. GKE Autopilot: no visible VMs at all. Rule of thumb: stateless apps → GKE or Cloud Run; stateful legacy apps → Compute Engine; simple APIs → Cloud Run; complex microservices → GKE.
