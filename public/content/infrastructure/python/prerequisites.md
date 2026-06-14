# Python for DevOps — Prerequisites

## Python is Beginner-Friendly

Python is the easiest first programming language and the most used language in DevOps automation. The prerequisites are minimal.

## Required

### 1. Basic Linux Command Line
Python DevOps scripts run in terminals and interact with Linux systems:
```bash
# You should be comfortable with:
ls, cd, pwd, mkdir      # Navigate the filesystem
cat, nano               # Read and edit files
chmod +x script.py     # Make files executable
./script.py            # Run scripts
pip install package    # Install Python packages
```

### 2. Understanding of What You Want to Automate
Python is a tool for automation. Before diving deep, think about:
- What repetitive task do you want to automate? (report generation, server checks, deployments)
- What data do you work with? (CSV files, JSON APIs, databases)
- What tools do you want to control? (AWS, Kubernetes, Slack)

The clearest learners are those who have a specific real problem to solve.

## That's It for Getting Started

Unlike Kubernetes or Terraform, Python can be learned without any prior technical background. It's designed to be readable and beginner-friendly.

## Nice to Have (Speeds Up Learning)

### Any Prior Programming Experience
Even VBA macros in Excel, or basic HTML/CSS. Understanding variables, conditions, and loops in ANY language makes Python faster to pick up.

### Git Basics
Your Python scripts should be version controlled. Knowing `git add`, `git commit`, `git push` helps from day one.

## Learning Path for DevOps Python

```
Python Installation
      ↓
Fundamentals: variables, loops, functions, files
      ↓
Intermediate: APIs with requests, YAML/JSON, error handling
      ↓
DevOps libraries: boto3 (AWS), kubernetes SDK, Ansible modules
      ↓
Projects: Build real automation scripts
```

## What Python Unlocks in DevOps

- **AWS automation** — boto3 manages EC2, S3, EKS programmatically
- **Kubernetes scripts** — kubernetes SDK for custom controllers
- **CI/CD helpers** — parse build output, create tickets, send notifications
- **Custom Ansible modules** — extend Ansible with Python
- **Data processing** — analyze logs, generate reports, process CSVs

## Time Estimate

- Python basics (variables, loops, functions): 1 week
- File I/O and APIs: 1 week
- AWS boto3 automation scripts: 2-3 weeks
- Job-ready Python for DevOps: 6-8 weeks of practice
