# Networking for DevOps — Prerequisites

## What You Need Before Starting

This technology sits underneath most other DevOps topics rather than on top of them — Kubernetes, load balancers, service meshes, and cloud infrastructure all assume the networking concepts covered here as a given. It's genuinely worth treating this as an early technology to complete, not something to circle back to later once networking-related confusion has already piled up in other material.

### 1. Basic Linux command-line comfort (required)

You should already be able to navigate a filesystem, run commands, and read output without the command-line itself being a barrier — this course's material moves directly into commands (`dig`, `ss`, `curl`, `iptables`) without re-teaching basic shell usage. If the command line itself feels unfamiliar, general Linux fundamentals should come first.

### 2. Basic arithmetic comfort with binary/powers of two (helpful, not a hard blocker)

Subnetting is fundamentally binary math (why a `/24` has 256 addresses, why a `/26` has 64) — you don't need to be fluent in binary, but recognizing powers of two (256, 128, 64, 32, 16...) without having to calculate them from scratch each time will make the CIDR/subnetting material land much faster. If this isn't already comfortable, spend a little time on it before diving deep into the IP Addressing sections — it pays off across this entire course.

### 3. Some exposure to how a web browser loading a page actually works (recommended)

You don't need to be a web developer, but having at least a rough mental model — a browser sends a request, a server sends back a response, there's a URL and a domain name involved — makes the DNS resolution chain and HTTP/TLS material land as "here's the actual mechanism" rather than entirely new abstract concepts. If you've never thought about what happens between typing a URL and a page appearing, spend a few minutes reading about it before this course's DNS and HTTP/HTTPS sections specifically.

### 4. Basic familiarity with Kubernetes concepts (recommended if you plan to reach the Kubernetes-networking material)

This course's material assumes you know what a Pod, Service, and Namespace are at a basic level before diving into Kubernetes-specific networking (NetworkPolicies, CoreDNS, Ingress). If Kubernetes itself is entirely new, it's worth covering this platform's own Kubernetes fundamentals material first, or at minimum understanding these three concepts, before this course's Kubernetes Networking module and later Projects (2 and 3 specifically require hands-on Kubernetes access).

### 5. Access to a real environment to practice in (required — this is not optional reading)

Reading commands without running them doesn't build the muscle memory this material needs:
- **A cloud free-tier account** (AWS, GCP, or Azure) — needed specifically for Project 1 (VPC segmentation) and anything involving real cloud networking concepts (Security Groups, NACLs, VPC peering)
- **A local Kubernetes cluster** (minikube, kind, or a single-node k3s) — sufficient for Projects 2 and 3 (NetworkPolicies, cert-manager) without needing a cloud-hosted cluster
- **A spare Linux VM or container** — useful for practicing firewall rules (iptables/ufw) and packet capture (tcpdump) without any risk to a system that matters

### 6. What you do *not* need yet

- Deep Cisco/vendor-specific hardware experience — this course focuses on concepts and cloud/Kubernetes-relevant networking, not physical router/switch configuration for its own sake (though the CCNA-track certification material does cover Cisco IOS specifically, for those pursuing that particular path)
- Prior security specialization — the security-adjacent concepts here (firewalls, NetworkPolicies, zero-trust) are covered from a networking-configuration angle; deeper security concepts are this platform's dedicated Security Fundamentals technology
- A formal networking degree or certification — this material is designed to build the practical, DevOps-relevant subset of networking knowledge from scratch, not to assume prior formal study

### Quick self-check

Given the CIDR `172.16.4.0/22`, can you say — without a calculator — roughly how many usable host addresses that provides, and whether `172.16.5.100` falls inside that range? If yes, you're ready for this course's Fundamentals section. If that took real effort or guesswork, spend more time on prerequisite #2 first — this exact kind of quick subnet math comes up constantly in later material, and it's worth being fast at it before it's load-bearing for harder concepts.
