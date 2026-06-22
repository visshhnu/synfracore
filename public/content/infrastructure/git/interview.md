# Git Interview Questions

## Core Concepts

**Q: Explain Git's data model. What is a commit?**

Git stores snapshots, not diffs. Every commit is a complete snapshot of the entire repo at that point (efficiently stored using content-addressable storage — identical files are stored once).

**Objects in Git:**
- **Blob**: File contents (content only, no filename)
- **Tree**: Directory listing (maps filenames to blob/tree SHA1s)
- **Commit**: Points to a tree + parent commit(s) + author + message
- **Tag**: Points to a commit with additional metadata

Every object identified by SHA1 hash of its content. SHA1 changes if content changes → Git is immutable.

```
Commit → Tree → blobs (files)
              → Trees (subdirectories)
              → ...
```

**Working directory → Staging area (index) → Repository (commits)**

---

**Q: Explain merge vs rebase. When to use each?**

**Merge**: Combines two branches by creating a new merge commit. Preserves full history.
```bash
git checkout main
git merge feature-branch
# Creates merge commit with two parents
```

History: `A - B - C - M (merge commit)` where M has parents C and F.

**Rebase**: Replays commits from feature branch on top of target. Linear history.
```bash
git checkout feature-branch
git rebase main
# Replays feature commits on top of latest main
# Rewrites commit SHAs (history changes)
```

History: `A - B - C - F1' - F2'` (F commits replayed on top of C, new SHAs)

**When to use:**
- **Merge**: Public branches (main, develop), when you want to preserve exact history
- **Rebase**: Private feature branches, to clean up before PR, to incorporate upstream changes
- **Golden rule**: Never rebase commits that have been pushed to a shared branch

**Interactive rebase** (the superpower):
```bash
git rebase -i HEAD~5   # Rewrite last 5 commits
# Options: pick, squash, fixup, edit, drop, reorder
```

---

**Q: What is `git reset` vs `git revert` vs `git checkout`?**

**`git reset`**: Moves HEAD (and optionally index/working directory). Rewrites history. Use only on local commits.
```bash
git reset --soft HEAD~1   # Undo commit, keep staged changes
git reset --mixed HEAD~1  # Undo commit, keep working dir (default)
git reset --hard HEAD~1   # Undo commit, discard ALL changes (destructive!)
```

**`git revert`**: Creates new commit that undoes changes of specified commit. Safe for shared branches.
```bash
git revert abc123         # Creates new "Revert" commit
git revert HEAD~3..HEAD   # Revert multiple commits
```

**`git checkout`** (old) / **`git restore`** (new): Restore files in working directory.
```bash
git restore file.txt              # Discard working directory changes
git restore --staged file.txt     # Unstage file (keep working dir changes)
git checkout abc123 -- file.txt   # Get file from specific commit
```

**Summary:**
| Command | History | Safety | Use case |
|---|---|---|---|
| reset | Rewrites | Dangerous | Local commits only |
| revert | Adds commit | Safe | Shared/public branches |
| restore | No commit | Safe | Undo working changes |

---

**Q: Explain Git workflows — GitFlow, trunk-based, GitHub Flow.**

**GitFlow** (complex, release-based):
```
main → production releases (tagged)
develop → integration branch
feature/* → feature branches off develop
release/* → release prep off develop
hotfix/* → urgent fixes off main
```
Good for: products with scheduled releases, multiple versions in prod.
Problem: Complex, slow, many long-lived branches.

**GitHub Flow** (simple, continuous deployment):
```
main → always deployable, protected
feature/* → short-lived, PR to main, deploy immediately after merge
```
Good for: web apps, SaaS with continuous deployment.
Simple: only main is long-lived.

**Trunk-Based Development** (modern, recommended):
```
main/trunk → everyone commits here (or short-lived branches <1 day)
Feature flags → hide incomplete features in code, ship daily
```
Good for: teams with high test coverage and CD. Google, Meta use this.
Requires: strong CI/CD, feature flags, automated testing.

---

**Q: How do you resolve merge conflicts?**

```bash
# Create conflict situation
git merge feature-branch
# CONFLICT: Auto-merge failed

# See conflicted files
git status
git diff

# Conflict markers in file:
# <<<<<<< HEAD
# Your changes
# =======
# Their changes  
# >>>>>>> feature-branch

# Options:
# 1. Edit manually — remove markers, keep correct code
# 2. Accept ours: git checkout --ours file.txt
# 3. Accept theirs: git checkout --theirs file.txt
# 4. Use mergetool: git mergetool  (opens vimdiff, VS Code, etc.)

# After resolving:
git add file.txt
git merge --continue
# OR if rebase conflict:
git rebase --continue
# Abort: git merge --abort / git rebase --abort
```

**Preventing conflicts**: communicate, keep PRs small, merge/rebase frequently, agree on formatting (use Prettier/Black to avoid whitespace conflicts).

---

**Q: Key Git commands for daily work.**

```bash
# Status and info
git status
git log --oneline --graph --all   # Visual branch history
git log -p file.txt               # File change history with diffs
git diff HEAD~3..HEAD             # Diff between commits
git show abc123                   # Show specific commit
git blame file.txt                # Who changed each line

# Branch management
git branch                         # List local branches
git branch -a                      # List all (including remote)
git switch -c feature/auth         # Create and switch (modern)
git switch main                    # Switch branch
git branch -d feature/auth         # Delete merged branch
git branch -D feature/auth         # Force delete

# Remote operations
git fetch origin                   # Fetch without merging
git pull --rebase origin main      # Rebase instead of merge on pull
git push origin feature/auth       # Push branch
git push -u origin feature/auth    # Push and set upstream tracking
git push --force-with-lease        # Safe force push (won't overwrite others' work)

# Stash
git stash                          # Save uncommitted changes
git stash push -m "WIP: auth"     # Named stash
git stash list
git stash pop                      # Apply and remove latest stash
git stash apply stash@{2}         # Apply specific stash

# Cherry-pick
git cherry-pick abc123            # Apply specific commit to current branch
git cherry-pick abc123..def456    # Apply range of commits

# Searching
git log -S "functionName"         # Find when code was added/removed
git log --grep="fix"              # Search commit messages
git bisect start                  # Binary search for bug-introducing commit
git bisect bad HEAD
git bisect good v1.0

# Cleaning
git clean -fd                     # Remove untracked files and dirs
git gc                            # Garbage collection

# Undo
git commit --amend               # Edit last commit (before pushing)
git reset HEAD~1 --soft          # Undo last commit, keep staged
```

---

**Q: Git hooks — what are they and when to use them?**

Git hooks are scripts that run automatically on specific Git events. Located in `.git/hooks/` (or use Husky for team sharing).

```bash
# Pre-commit hook (run before commit is created)
# .git/hooks/pre-commit
#!/bin/bash
npm run lint
npm run test:unit
# If non-zero exit → commit is rejected

# Commit-msg hook (validate commit message)
#!/bin/bash
commit_regex='^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .{1,72}'
if ! grep -qE "$commit_regex" "$1"; then
    echo "Invalid commit message. Use: feat: add login"
    exit 1
fi

# Pre-push hook (run before git push)
#!/bin/bash
npm run test
npm run build
```

**Husky** (Node.js projects): Share hooks across team via package.json.
```bash
npx husky init
echo "npm run lint-staged" > .husky/pre-commit
```

**lint-staged**: Run linters only on staged files (fast).

## Revision Notes
```
GIT DATA MODEL: Objects = Blob + Tree + Commit + Tag. SHA1 content-addressed.
Working dir → Stage (git add) → Repo (git commit)

MERGE vs REBASE:
Merge: preserves history, safe for public branches
Rebase: linear history, rewrites SHA, use for private branches
Golden rule: never rebase pushed commits

RESET vs REVERT vs RESTORE:
reset: rewrites history (local only) — soft/mixed/hard
revert: safe new commit (public branches)
restore: discard working changes

WORKFLOWS:
GitFlow: complex, release-based (main+develop+feature+release+hotfix)
GitHub Flow: simple (main + feature branches, deploy on merge)
Trunk-based: everyone commits to main, feature flags for incomplete code

CONFLICT RESOLUTION:
Mark conflict → edit/checkout ours/theirs → git add → git merge/rebase --continue
Abort: git merge/rebase --abort

USEFUL:
git log --oneline --graph --all (visual history)
git stash / pop (save/restore work in progress)
git cherry-pick (apply specific commit)
git bisect (find bug-introducing commit)
git push --force-with-lease (safe force push)
git commit --amend (edit last commit before push)
```
