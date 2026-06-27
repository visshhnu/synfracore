# Git Troubleshooting Guide

## Issue 1: Merge conflicts — cannot merge branches

**Symptom:** `git merge feature-branch` → `CONFLICT (content): Merge conflict in file.py. Automatic merge failed.`

**Root Cause:** Same lines modified differently in both branches.

**Debug steps:**
```bash
git status                             # see conflicted files (U = unmerged)
git diff                              # see conflict markers
git log --merge --left-right HEAD...MERGE_HEAD  # commits causing conflict
```

**Fix:**
```bash
# Open conflicted files, look for <<<<<<< ======= >>>>>>> markers
# Edit to desired state, then:
git add resolved_file.py
git commit -m "resolve merge conflict"

# Or use a merge tool
git mergetool --tool=vimdiff

# Abort the merge entirely
git merge --abort
```

**Prevention:** Pull frequently (`git pull --rebase`). Keep feature branches short-lived (< 2 days). Use feature flags to avoid long-running branches.

---

## Issue 2: Accidental commit to wrong branch

**Symptom:** Committed to `main` when you meant to commit to a feature branch.

**Fix:**
```bash
# Create feature branch from current state
git branch feature/my-work

# Remove commits from main (move HEAD back)
git reset --hard HEAD~1               # if 1 commit to undo
git reset --hard HEAD~3               # if 3 commits to undo

# Now switch to feature branch (your commits are there)
git checkout feature/my-work

# If already pushed to remote
git push origin main --force-with-lease  # DANGEROUS - coordinate with team
```

---

## Issue 3: Pushed secret / sensitive data to remote

**Symptom:** API key, password, or private key accidentally committed and pushed.

**Immediate action (CRITICAL):**
1. **Rotate the secret immediately** — assume it is compromised
2. Remove from Git history

```bash
# Using BFG Repo Cleaner (faster than filter-branch)
java -jar bfg.jar --delete-files secrets.env repo.git
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push --force --all

# Or using git filter-repo
git filter-repo --path secrets.env --invert-paths

# Notify your team to re-clone (old clone has the secret)
```

---

## Issue 4: Detached HEAD state

**Symptom:** `git status` shows `HEAD detached at abc1234`. Changes may be lost.

**Root Cause:** Checked out a specific commit, tag, or remote branch directly instead of a local branch.

**Fix:**
```bash
# Save your work by creating a branch
git checkout -b my-work-from-detached

# Or if you haven't made changes, return to a branch
git checkout main
git checkout -b feature/new-work   # and start fresh
```

---

## Issue 5: Large files causing push to fail / repo bloat

**Symptom:** `git push` fails with `fatal: pack exceeds maximum allowed size`. Repository grows very large over time.

**Fix:**
```bash
# Find large files in history
git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -20 | awk '{print $1}')"

# Remove large files from history
git filter-repo --path large-file.zip --invert-paths

# For future: use Git LFS
git lfs install
git lfs track "*.zip" "*.jar" "*.mp4"
git add .gitattributes
```

**Prevention:** Add a `.gitignore` covering: `*.zip, *.jar, node_modules/, dist/, build/, *.log`. Use Git LFS for binaries. Pre-commit hook to reject large files:
```bash
# .git/hooks/pre-commit
if git rev-parse --verify HEAD >/dev/null 2>&1; then
  against=HEAD
fi
git diff-index --cached $against -- | awk '{print $NF}' | while read f; do
  size=$(git cat-file -s :$f 2>/dev/null)
  [ "$size" -gt 10485760 ] && echo "File too large: $f ($size bytes)" && exit 1
done
```
