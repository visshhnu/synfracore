# Git Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **GitHub Foundations** | GitHub | $99 | Multiple choice |
| **GitHub Actions** | GitHub | $99 | Multiple choice |
| **GitHub Advanced Security** | GitHub | $99 | Multiple choice |
| **GitHub Administration** | GitHub | $99 | Multiple choice |
| **GitLab Certified Associate** | GitLab | Free | Online |

No vendor-neutral "Git certification" exists — these test platform-specific workflows.

---

## GitHub Foundations Exam Objectives

**Core Git & GitHub concepts:**

```bash
# GIT FUNDAMENTALS (must know perfectly)
git init
git clone https://github.com/user/repo.git
git status
git add .                        # Stage all
git add -p                       # Interactive stage (patch by patch)
git commit -m "feat: add login"
git commit --amend               # Modify last commit (before push)

# BRANCHING
git branch feature/login
git checkout -b feature/login    # Create + switch
git switch -c feature/login      # Modern syntax
git merge feature/login
git merge --no-ff feature/login  # Always create merge commit
git rebase main                  # Rebase current branch onto main
git rebase -i HEAD~3             # Interactive rebase (squash, reorder)

# REMOTE
git remote add origin https://github.com/user/repo.git
git fetch origin                 # Download without merging
git pull                         # fetch + merge (or rebase)
git push origin feature/login
git push --force-with-lease      # Safe force push (checks remote hasn't changed)

# HISTORY & INSPECTION
git log --oneline --graph --all
git log --follow -- filename     # Track file through renames
git diff HEAD~1 HEAD             # Diff last commit
git blame file.py                # Who changed each line
git bisect start                 # Binary search for bug-introducing commit
git reflog                       # Recovery log (all HEAD movements)

# UNDOING
git restore file.py              # Discard unstaged changes
git restore --staged file.py     # Unstage file
git revert HEAD                  # New commit that undoes last commit
git reset HEAD~1 --soft          # Undo commit, keep changes staged
git reset HEAD~1 --mixed         # Undo commit, keep changes unstaged (default)
git reset HEAD~1 --hard          # Undo commit, discard all changes (DANGER)

# STASH
git stash                        # Stash dirty working tree
git stash push -m "WIP: login"  # Named stash
git stash list
git stash pop                    # Apply and drop
git stash apply stash@{1}        # Apply without dropping

# TAGS
git tag v1.0.0
git tag -a v1.0.0 -m "Release 1.0.0"  # Annotated (use for releases)
git push origin --tags
```

---

## GitHub-Specific Concepts

```
PULL REQUESTS:
  Fork → Clone → Branch → Commit → Push → PR → Review → Merge
  PR types: regular merge | squash and merge | rebase and merge

BRANCH PROTECTION RULES:
  Require PR reviews | Require status checks | Block force pushes
  Restrict pushes to matching branches

GITHUB ACTIONS (tested in Actions cert):
  .github/workflows/*.yml
  on: push, pull_request, schedule, workflow_dispatch
  jobs: runs-on, steps, uses (actions), env, secrets
  Environments with protection rules and approvals
  Reusable workflows: workflow_call

SECURITY:
  Dependabot: automated dependency updates
  Code scanning: CodeQL for vulnerability detection
  Secret scanning: detect committed credentials
  Branch protection: require signed commits

GITHUB PACKAGES:
  Docker images, npm, Maven, NuGet via ghcr.io
  Authenticate: docker login ghcr.io -u USERNAME -p $GITHUB_TOKEN
```

---

## Study Resources

- **GitHub Skills** (github.com/skills) — free interactive courses
- **GitHub Docs** (docs.github.com) — official documentation (open during exam)
- **Pro Git Book** (git-scm.com/book) — free, comprehensive
- **Learn Git Branching** (learngitbranching.js.org) — interactive visual

## Revision Notes
```
GITHUB FOUNDATIONS: MCQ, covers Git + GitHub collaboration

MUST KNOW:
  Core workflow: add/commit/push/pull/merge/branch
  Three areas: working tree / staging area / repository
  Merge strategies: regular / squash / rebase
  Conflict resolution: manual edit → add → commit

RECOVERING MISTAKES:
  reflog: find any lost commit
  reset --soft: undo commit, keep staged | --mixed: unstaged | --hard: discard
  revert: safe undo for shared branches (creates new commit)
  restore: discard working tree changes

GITHUB ACTIONS:
  on:/jobs:/steps: structure | uses: for pre-built actions
  secrets: never hardcode | environments: approval gates
  Reusable workflows: workflow_call trigger
```
