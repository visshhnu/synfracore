# Docker — Prerequisites

## What to Know Before Starting Docker

Docker is beginner-friendly but you'll learn much faster with these foundations in place.

## Required (Must Have)

### 1. Basic Linux Command Line (2-3 hours)
You need to be comfortable with:
```bash
ls, cd, pwd, mkdir, cp, mv, rm   # Navigate and manage files
cat, nano, vim                    # View and edit files
sudo                              # Run commands as root
apt/yum install                  # Install packages
systemctl start/stop/status      # Manage services
```
**Where to learn:** This site's Linux section → Fundamentals → or try OverTheWire: Bandit

### 2. Basic Understanding of Networking
- What is a port? (Port 80 = HTTP, 443 = HTTPS, 5432 = PostgreSQL)
- What is localhost / 127.0.0.1?
- What is an IP address?
**You don't need deep knowledge** — just enough to understand `docker run -p 8080:80`

### 3. How Applications Work (Vague Understanding is Fine)
- A web app has a frontend and backend
- Databases store data
- Web servers (nginx, Apache) serve HTTP requests
- Apps have dependencies (Python libraries, Node modules)

## Nice to Have (Speeds Up Learning)

### Programming Basics (Any Language)
You'll encounter Dockerfiles that use bash commands, Python, or Node. Basic reading comprehension helps — you don't need to write code.

### Git (Basic)
```bash
git clone, git add, git commit, git push
```
Most Docker projects are in Git repos. Being able to clone and navigate them helps.

### A Cloud Account (Optional)
AWS free tier or GCP/Azure trial to push Docker images to a registry and run containers in the cloud later.

## What You Do NOT Need

- ❌ Advanced networking knowledge
- ❌ Programming experience  
- ❌ Linux administration experience
- ❌ Any previous containerization experience
- ❌ Knowledge of virtual machines

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 2-3 days
- Intermediate: 3-5 days
- Advanced: 1-2 weeks
- Job-ready: 3-4 weeks of practice

## Start Here

Go to the **Installation** section to set up Docker on your machine, then proceed to **Fundamentals**.
