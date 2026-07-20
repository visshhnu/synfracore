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
# Using BFG Repo Cleaner (faster than filter-branch) -- BFG requires a
# FRESH BARE MIRROR clone, not your normal working clone:
git clone --mirror <url> repo.git
java -jar bfg.jar --delete-files secrets.env repo.git
cd repo.git
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push                   # mirror push -- includes ALL refs, tags too
# (git push --force --all only pushes branches -- if the secret is
# reachable from a tag, --tags must be pushed separately or it survives)

# Or using git filter-repo -- also requires a fresh clone; filter-repo
# refuses to run on an existing/dirty working copy by default (use
# --force only if you're certain it's disposable):
git clone <url> repo-to-clean
cd repo-to-clean
git filter-repo --path secrets.env --invert-paths

# Notify your team to re-clone (old clone has the secret in its own history)
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
# Find large files in history -- the unquoted-substitution version of this
# command that circulates widely is actually broken (word-splits the 20
# hashes into 20 separate grep arguments, most of which grep then tries to
# open as filenames). This version works:
git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  sed -n 's/^blob //p' |
  sort --numeric-sort --key=2 |
  tail -n 20

# Remove large files from history -- filter-repo needs a fresh clone, see
# Issue 3 above for the same precondition
git filter-repo --path large-file.zip --invert-paths

# For future: use Git LFS
git lfs install
git lfs track "*.zip" "*.jar" "*.mp4"
git add .gitattributes
```

**Prevention:** Add a `.gitignore` covering: `*.zip, *.jar, node_modules/, dist/, build/, *.log`. Use Git LFS for binaries. Pre-commit hook to reject large files:
```bash
# .git/hooks/pre-commit -- then: chmod +x .git/hooks/pre-commit
if git rev-parse --verify HEAD >/dev/null 2>&1; then
  against=HEAD
fi
git diff-index --cached $against -- | awk '{print $NF}' | while read f; do
  size=$(git cat-file -s :$f 2>/dev/null)
  [ "$size" -gt 10485760 ] && echo "File too large: $f ($size bytes)" && exit 1
done
```
**`.git/hooks/` is not version-controlled** — it's local to each clone, so committing this script to the repo does *not* distribute it to teammates or CI; everyone has to add it manually, and nothing enforces that they do. For a hook that actually needs to run for the whole team, either point `core.hooksPath` at a directory that *is* tracked in the repo (`git config core.hooksPath .githooks`, with the scripts committed under `.githooks/`), or use a framework built for this (Husky for Node projects, the `pre-commit` framework generally) that installs hooks as part of the normal setup step everyone already runs.
