# Linux for DevOps & Cloud Engineers

Linux is the backbone of modern infrastructure. Over **95% of cloud servers**, all major container platforms, and virtually every DevOps tool runs on Linux. Mastering Linux isn't optional for a DevOps or Cloud engineer — it's the foundation everything else is built on.

## What is Linux?

Linux is an open-source, Unix-like operating system kernel first released by Linus Torvalds in 1991. Today, "Linux" refers to the kernel plus a collection of utilities and tools (GNU/Linux). Major distributions include:

| Distribution | Use Case | Package Manager |
|-------------|----------|----------------|
| **Ubuntu** | Development, servers | apt |
| **Red Hat / RHEL** | Enterprise servers | yum/dnf |
| **CentOS / Rocky** | Enterprise (free RHEL clone) | yum/dnf |
| **Amazon Linux** | AWS workloads | yum/dnf |
| **Alpine Linux** | Docker containers (tiny footprint) | apk |
| **Debian** | Stable servers | apt |

## Why Linux for DevOps?

- **Kubernetes** runs on Linux nodes
- **Docker** requires Linux kernel features (namespaces, cgroups)
- **Terraform, Ansible, Jenkins** are all Linux-native
- **Cloud instances** (EC2, Azure VMs, GCE) default to Linux
- **Shell scripting** automation is far more powerful on Linux
- **Cost** — no licensing fees

## Core Architecture

\`\`\`
┌─────────────────────────────┐
│     User Applications       │
├─────────────────────────────┤
│      Shell (bash/zsh)       │
├─────────────────────────────┤
│    System Libraries (glibc) │
├─────────────────────────────┤
│       Linux Kernel          │
│  (process, memory, fs, net) │
├─────────────────────────────┤
│         Hardware            │
└─────────────────────────────┘
\`\`\`

## Key Subsystems

**Process Management** — Every running program is a process with a PID. Processes have parent-child relationships, priorities (nice values), and states (running, sleeping, zombie).

**Filesystem** — Everything in Linux is a file. The filesystem hierarchy starts at `/` (root). Key directories: `/etc` (config), `/var` (variable data/logs), `/home` (user data), `/proc` (virtual: kernel/process info), `/tmp` (temporary files).

**Networking** — Linux has a full TCP/IP stack built into the kernel. Network interfaces, routing tables, iptables/nftables firewall rules are all managed through kernel subsystems.

**Memory Management** — Virtual memory, swap space, OOM killer. In containers, cgroups limit memory per process group.

## Getting Started

For DevOps, the most important distributions to know are **Ubuntu LTS** (most common in practice) and **RHEL/CentOS** (enterprise environments). Start with Ubuntu.

> 💡 **Pro tip:** Set up a Linux VM locally using VirtualBox or use WSL2 on Windows. Better yet, spin up a free EC2 t2.micro on AWS to practice on a real cloud instance.