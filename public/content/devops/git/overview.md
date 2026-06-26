# Git & GitHub — Version Control for DevOps

## Why Git for DevOps?

Every DevOps workflow starts with Git. Infrastructure-as-Code, application code, CI/CD pipeline definitions, Kubernetes manifests, Helm charts — all live in Git. GitOps (ArgoCD, FluxCD) uses Git as the single source of truth for cluster state.

---

## Core Concepts

### Repository (Repo)
A directory tracked by Git. Contains:
- **Working tree:** current files you see and edit
- **.git/ directory:** history, refs, objects (the actual repo)
- **Remote:** copy on GitHub/GitLab/Bitbucket

### Three Areas
```
Working Directory → (git add) → Staging Area → (git commit) → Local Repo → (git push) → Remote
```

### Branches
Lightweight, movable pointer to a commit. Default: `main` (formerly `master`).

### Commits
Snapshots of staged changes + metadata (author, timestamp, message, parent commit).

---

## Essential Commands

```bash
# Setup (first time)
git config --global user.name "Vishnu"
git config --global user.email "vishnu@example.com"
git config --global init.defaultBranch main

# Start
git init                          # new repo
git clone https://github.com/org/repo.git   # clone existing

# Daily workflow
git status                        # what changed?
git add file.txt                  # stage specific file
git add .                         # stage all changes
git add -p                        # interactive stage (hunk by hunk)
git commit -m "feat: add search feature"
git push origin main
git pull origin main              # fetch + merge

# Branching
git branch feature/search         # create branch
git checkout feature/search       # switch to it
git checkout -b feature/search    # create + switch (shorthand)
git switch -c feature/search      # modern syntax

# Merging
git merge feature/search          # merge into current branch
git rebase main                   # rebase current branch onto main
git cherry-pick abc1234           # apply single commit

# Viewing history
git log --oneline --graph --all   # visual branch graph
git log -p                        # show diffs
git diff main...feature/search    # what changed in branch vs main?
git blame app.py                  # who changed each line?

# Undoing
git restore file.py               # discard working dir changes
git restore --staged file.py      # unstage (keep changes)
git revert abc1234                # create new commit that undoes abc1234
git reset --soft HEAD~1           # undo last commit, keep staged
git reset --hard HEAD~1           # undo last commit AND changes (careful!)

# Stashing
git stash                         # save current changes temporarily
git stash pop                     # restore most recent stash
git stash list                    # list all stashes

# Tags (for versioning)
git tag v1.2.3                    # lightweight tag
git tag -a v1.2.3 -m "Release v1.2.3"  # annotated tag
git push origin v1.2.3            # push specific tag
git push origin --tags            # push all tags
```

---

## Branching Strategies

### Git Flow
- `main` — production-ready
- `develop` — integration branch
- `feature/*` — new features (from develop)
- `release/*` — release candidates (from develop → main)
- `hotfix/*` — urgent fixes (from main)

### GitHub Flow (simpler, recommended for CI/CD)
- `main` — always deployable
- `feature/*` — short-lived feature branches
- PR → review → merge → auto-deploy
- Works well with CI/CD pipelines

### Trunk-Based Development (for DevOps teams)
- Everyone commits to `main` daily (short-lived branches, max 1–2 days)
- Feature flags for incomplete features
- Requires strong CI/CD and automated testing

---

## Git for DevOps — Key Patterns

### Conventional Commits
```
feat: add user authentication
fix: resolve database connection timeout
docs: update deployment guide
ci: add GitHub Actions workflow
refactor: extract payment service
test: add unit tests for order processing
chore: update dependencies
```

### .gitignore for Infrastructure Repos
```
# Terraform
*.tfvars        # may contain secrets
*.tfstate       # must be in remote state, not git
*.tfstate.backup
.terraform/     # local provider cache

# General
.env            # environment files with secrets
*.key           # private keys
*.pem
secrets/
__pycache__/
node_modules/
.DS_Store
```

### Git Hooks for DevOps
```bash
# .git/hooks/pre-commit — run checks before every commit
#!/bin/bash
# Run terraform fmt check
terraform fmt -check -recursive
# Run shellcheck on scripts
find . -name "*.sh" -exec shellcheck {} \;
# Detect secrets
detect-secrets scan
```

### GitHub Actions Trigger Patterns
```yaml
on:
  push:
    branches: [main]          # trigger on push to main
    paths:
      - 'app/**'              # only when app/ changes
      - '!**.md'              # ignore markdown changes
  pull_request:
    branches: [main]
  workflow_dispatch:           # manual trigger
  schedule:
    - cron: '0 2 * * *'       # 2am daily
```

---

## Common Issues & Fixes

| Issue | Command |
|-------|---------|
| Wrong email in commit | `git commit --amend --author="Name <email>"` |
| Need to undo pushed commit | `git revert HEAD && git push` (safe) |
| Merge conflict | Edit file, `git add`, `git commit` |
| Detached HEAD | `git checkout -b new-branch` to save work |
| Pushed secret by accident | Rotate the secret immediately, then use BFG Repo Cleaner |
| Large file accidentally committed | `git filter-repo` or BFG Repo Cleaner |
