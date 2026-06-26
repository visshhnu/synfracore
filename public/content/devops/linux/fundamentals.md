# Linux & Bash Complete Guide

DevOps › Linux & Bash
**Linux & Bash**
BeginnerEngineerProductionArchitectCommand line mastery — every DevOps engineer's foundation
[Why Linux](#sec-why)[Processes](#sec-process)[Performance](#sec-performance)[Files & Permissions](#sec-files)[Networking](#sec-networking)[Bash Scripts](#sec-bash)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## 🐧 Why Linux for DevOps?›


Every server, every container, every Kubernetes node runs Linux. When something breaks at 2am, you debug it in a Linux terminal. When you write automation scripts, you use bash. When you tune performance, you read Linux metrics. Linux command line proficiency is non-negotiable for any DevOps role.


#### Linux in the DevOps World

| Where you encounter Linux | What you need to know |
|---|---|
| Production servers (AWS EC2, Azure VM) | Files, processes, networking, services |
| Docker containers | Alpine/Debian/Ubuntu base images, shell debugging |
| Kubernetes nodes | kubelet runs on Linux, debug with node exec |
| CI/CD pipelines (GitHub Actions, Jenkins) | Pipeline steps run bash on Ubuntu runners |
| Ansible playbooks | SSH into Linux servers, execute Linux commands |
| Terraform remote-exec | Run shell scripts on provisioned Linux VMs |


Linux navigation and distributionsCopy

```

```


## ⚙️ Processes & Services›


#### What is a Process?

A process is a running program with its own PID (Process ID), memory space, and file handles. When you start nginx, the OS creates a process. When nginx spawns worker processes, each gets its own PID. Every process has a parent — orphan processes cause zombie issues.


#### Process States

| State | What it means |
|---|---|
| R Running | Actively using CPU or ready to use CPU |
| S Sleeping | Waiting for something (I/O, timer, signal) — normal |
| D Uninterruptible sleep | Waiting for disk I/O — if many D state processes, disk is slow |
| Z Zombie | Process finished but parent hasn't acknowledged yet — minor issue |
| T Stopped | Paused (Ctrl+Z in terminal) |


Process management commandsCopy

```

```


## 📊 Performance Troubleshooting›


#### The USE Method — Systematic Performance Analysis

For every resource (CPU, memory, disk, network): check **Utilisation** (how busy is it?), **Saturation** (is there a queue forming?), **Errors** (are there failures?). Don't randomly check things — follow this framework every time.


Performance troubleshooting — full flowCopy

```

```


## 📁 Files, Permissions & Text Processing›


#### Understanding Linux Permissions

Every file has three permission sets: **owner**, **group**, **others**. Each set has read (r=4), write (w=2), execute (x=1). The number 755 means: owner=7(rwx), group=5(r-x), others=5(r-x).


| Permission | Octal | Use case |
|---|---|---|
| rwxr-xr-x | 755 | Executables, directories with public access |
| rw-r--r-- | 644 | Regular config files, public readable |
| rw------- | 600 | SSH private keys, sensitive credentials |
| rwx------ | 700 | Directories with sensitive content |
| rwxrwxrwx | 777 | NEVER use in production — anyone can modify! |


File operations + text processingCopy

```

```


## 🌐 Networking Commands›


#### Network Troubleshooting Mindset

Work through the OSI layers from bottom up: Physical → Network (ping, ip route) → Transport (ss, netstat, nc) → Application (curl, wget, nslookup). Most DevOps networking problems are at layers 3-7.


Complete networking commandsCopy

```

```


## 🖥️ Bash Scripting — Production Standard›


#### Why Bash Matters

CI/CD pipeline steps are bash. Deployment scripts are bash. Cron jobs are bash. The difference between a good bash script and a dangerous one is error handling. A script that silently continues after an error can delete production data.


**Critical rules:** Always use `set -euo pipefail`. Always use logging functions. Always trap cleanup on exit. Never use `rm -rf` with an unquoted variable.


Production bash script templateCopy

```

```


## 🔍 Troubleshooting — Scenarios›


These are the exact scenarios asked in senior DevOps interviews. Know them cold.


Server troubleshooting — complete playbookCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


LINUX · ENGINEER
Server is at high CPU. Walk through how you find the cause.
Start broad, then narrow. First: uptime to see load average — compare to number of CPUs. If load is 2× number of CPUs, something is wrong. Then: ps aux --sort=-%cpu to find the top consumer. Note the PID and process name. Check how long it has been running with ps -o pid,etime,cmd -p PID. If it is a known service (nginx, java): check its logs — journalctl -u nginx --since '30 min ago'. If it is a runaway process: check what it is doing with strace -p PID -e trace=all — you will see infinite loops, repeated failed syscalls. Common causes at HPE: a Kafka consumer stuck in retry loop consuming 100% CPU. Fix: kill the process, find the poison message, add retry limit with backoff in code.

LINUX · ENGINEER
What is the difference between a process and a thread in Linux?
A process is an independent program with its own memory space, file descriptors, and PID. A thread is a lightweight execution unit WITHIN a process — threads share the same memory space and file descriptors as the parent process. Creating a process (fork) is expensive — copies all memory. Creating a thread is cheap — shares existing memory. In Linux, both are implemented as tasks with clone() syscall — processes use clone() without CLONE_VM flag (separate memory), threads use clone() with CLONE_VM (shared memory). For DevOps: ps aux shows processes. To see threads: ps -eLf or top -H. Important for troubleshooting: if a Java process has 200 threads and CPU is high, it might be a thread pool exhaustion issue. Use jstack PID to get thread dump.

LINUX · PRODUCTION
Your disk is 100% full on a production server. Walk through the fix without downtime.
Do NOT just delete random fi
