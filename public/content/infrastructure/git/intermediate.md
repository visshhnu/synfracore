# Git — Intermediate

## Advanced Branching Strategies

```bash
# Feature flags with Git — merge unfinished features behind a flag
git checkout -b feature/new-checkout
# Code: if (featureFlags.newCheckout) { ... }
git push origin feature/new-checkout
# Create PR, merge to main even unfinished — flag keeps it hidden

# Release branches
git checkout -b release/2.1.0 main
# Final bug fixes only — no new features
git commit -m "fix: final adjustments for 2.1.0"
git tag -a v2.1.0 -m "Release 2.1.0"
git checkout main && git merge release/2.1.0
git checkout develop && git merge release/2.1.0
git branch -d release/2.1.0

# Hotfix workflow
git checkout -b hotfix/critical-security-patch main
# Fix the bug
git tag -a v2.1.1 -m "Security patch"
git checkout main && git merge hotfix/critical-security-patch
git checkout develop && git merge hotfix/critical-security-patch
```

## Submodules

```bash
# Add a submodule (external repo inside your repo)
git submodule add https://github.com/org/shared-lib libs/shared

# Clone a repo that has submodules
git clone --recurse-submodules https://github.com/org/myapp
# Or after clone:
git submodule update --init --recursive

# Update all submodules to latest
git submodule update --remote --merge

# Submodule gotchas:
# - Each submodule is pinned to a specific commit
# - Must explicitly update to get new submodule commits
# - Collaborators must run submodule update after pull
```

## Git Hooks

```bash
# Hooks live in .git/hooks/ — not tracked by default
# Use husky (JavaScript) or pre-commit (Python) for shared hooks

# .pre-commit-config.yaml (pre-commit framework)
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-merge-conflict
      - id: detect-private-key          # Block accidental secret commits!

  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.18.0
    hooks:
      - id: gitleaks                    # Scan for secrets

  - repo: local
    hooks:
      - id: run-tests
        name: Run unit tests
        entry: npm test -- --watchAll=false
        language: node
        pass_filenames: false

# Install: pip install pre-commit && pre-commit install
```

## Monorepo Management

```bash
# Git sparse checkout — check out only what you need from a monorepo
git clone --no-checkout https://github.com/org/monorepo
cd monorepo
git sparse-checkout init --cone
git sparse-checkout set services/api services/auth common/utils
git checkout main

# Now only those directories are checked out
# Update sparse-checkout set when you need more directories

# Git worktrees — multiple branches checked out simultaneously
git worktree add ../myapp-hotfix hotfix/critical
# Now you have two working directories:
# ./myapp       (main branch)
# ../myapp-hotfix  (hotfix branch)
# No need to stash or switch branches

git worktree list
git worktree remove ../myapp-hotfix

# Partial clones — don't download all history (useful for large repos)
git clone --filter=blob:none --sparse https://github.com/org/huge-repo
# Only downloads objects you actually checkout
```
