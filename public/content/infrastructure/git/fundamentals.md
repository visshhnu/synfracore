# Git & GitHub — Fundamentals

## Core Concepts

```
Repository: Project folder tracked by Git
Commit: Snapshot of changes with a message
Branch: Independent line of development
Remote: Repository hosted elsewhere (GitHub, GitLab)
HEAD: Pointer to current position (usually latest commit on current branch)
Staging area: Changes ready to commit (git add puts things here)
```

## Daily Workflow

```bash
# Configure (one time)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global core.editor "code --wait"    # VS Code
git config --global init.defaultBranch main

# Start a project
git init
git clone https://github.com/org/repo.git
git clone git@github.com:org/repo.git  # SSH (preferred for push)

# Check status
git status
git diff             # Unstaged changes
git diff --staged    # Staged changes (ready to commit)
git log --oneline    # Compact commit history
git log --oneline --graph --all  # Visual branch history

# Stage and commit
git add file.txt         # Stage specific file
git add .                # Stage all changes
git add -p               # Stage interactively (chunk by chunk)
git commit -m "feat: add user authentication"
git commit --amend       # Modify last commit (before push only)

# Push and pull
git push origin main
git push -u origin feature/auth   # -u sets upstream tracking
git pull                           # fetch + merge
git fetch origin                   # download without merging
git pull --rebase                  # cleaner history than merge
```

## Branching Strategy

```bash
# Create and switch
git checkout -b feature/login         # Create + switch
git switch -c feature/login           # Modern syntax
git switch main                       # Switch to existing
git branch -d feature/login           # Delete local branch
git push origin --delete feature/login  # Delete remote

# Merge strategies
git merge feature/login               # Merge with merge commit
git merge --squash feature/login      # Squash all commits into one
git rebase main                       # Replay commits on top of main

# Interactive rebase (rewrite history before push)
git rebase -i HEAD~3    # Rewrite last 3 commits
# pick   = keep commit
# squash = combine with previous
# reword = change message
# drop   = delete commit
```

## Undoing Things

```bash
# Unstage file (keep changes in working directory)
git restore --staged file.txt
git reset HEAD file.txt    # older syntax

# Discard working directory changes (DESTRUCTIVE)
git restore file.txt
git checkout -- file.txt   # older syntax

# Undo last commit, keep changes staged
git reset --soft HEAD~1

# Undo last commit, keep changes unstaged
git reset --mixed HEAD~1   # default

# Undo last commit, discard changes (DESTRUCTIVE)
git reset --hard HEAD~1

# Undo a commit that's already pushed (safe — creates new commit)
git revert abc123
git revert HEAD~2..HEAD    # Revert last 2 commits

# Find lost commits
git reflog                 # History of HEAD movements
git checkout abc123        # Go to any commit
```

## Branching Models

```
GitHub Flow (simple, recommended for most teams):
  main → create branch → commit → PR → review → merge
  Always deployable from main
  
GitFlow (complex, for versioned releases):
  main (production) ← release branches ← develop ← feature branches
  Long-lived develop branch
  Good for: mobile apps, versioned software

Trunk-Based Development (advanced, FAANG):
  Everyone commits directly to main (trunk)
  Use feature flags to hide incomplete features
  Requires strong CI/CD and test coverage
```

## GitHub Pull Requests

```bash
# Good PR workflow
git checkout -b fix/login-bug
# ... make changes ...
git add -p                    # Review each chunk before staging
git commit -m "fix: resolve null pointer in login flow

- Check for null user before accessing .id property
- Fixes #142

Reviewed-by: teammate@company.com"
git push origin fix/login-bug

# Then on GitHub: Create PR, request review, address feedback

# Keep branch up to date with main
git fetch origin
git rebase origin/main        # Cleaner than merge
git push --force-with-lease   # Safe force push (fails if remote changed)
```

## Useful Commands

```bash
# Stash work in progress
git stash                      # Save all uncommitted changes
git stash push -m "WIP auth"   # With a name
git stash pop                  # Restore and remove from stash
git stash list                 # Show all stashes

# Cherry-pick a specific commit from another branch
git cherry-pick abc123

# Find which commit introduced a bug (binary search)
git bisect start
git bisect bad                 # Current commit has the bug
git bisect good v1.0           # This version was fine
# Git checks out middle commit
# Test it, then: git bisect good/bad
# Git narrows down until it finds the exact commit

# Search through history
git log --grep="login"         # Commits mentioning "login"
git log -S "findUser"          # Commits that added/removed "findUser"
git blame file.txt             # Who changed each line and when

# Show what changed in a commit
git show abc123
git diff main..feature/auth    # Diff between branches
```
