# Git — Cheatsheet

```bash
# ── SETUP ────────────────────────────────────────────────────
git config --global user.name "Name"
git config --global user.email "email@example.com"
git config --global core.editor "code --wait"
git config --global pull.rebase true           # rebase on pull (cleaner history)
git config --global push.autoSetupRemote true  # auto track remote branch
git config --list --global

# ── BASICS ───────────────────────────────────────────────────
git init                           # Initialize repo
git clone <url>                    # Clone remote
git status                         # Working tree status
git add .                          # Stage all
git add -p                         # Stage interactively (chunk by chunk)
git commit -m "feat: add login"
git commit --amend                 # Modify last commit
git commit --amend --no-edit      # Amend without changing message
git log --oneline --graph --all    # Visual history
git diff                           # Unstaged changes
git diff --staged                  # Staged changes
git diff main..feature             # Between branches

# ── BRANCHES ─────────────────────────────────────────────────
git branch                         # List local branches
git branch -a                      # List all (including remote)
git branch -vv                     # With upstream tracking info
git switch -c feature/auth         # Create + switch (modern)
git switch main                    # Switch to existing
git branch -d feature/auth         # Delete merged branch
git branch -D feature/auth         # Force delete
git push origin --delete feature   # Delete remote branch

# ── REMOTE ───────────────────────────────────────────────────
git remote -v                      # List remotes
git remote add origin <url>
git fetch origin                   # Download without merging
git pull                           # Fetch + merge
git pull --rebase                  # Fetch + rebase (cleaner)
git push origin feature/auth
git push -u origin feature         # Push + set upstream
git push --force-with-lease        # Safe force push

# ── MERGE & REBASE ───────────────────────────────────────────
git merge feature/auth             # Merge with commit
git merge --squash feature/auth    # Squash into one commit
git merge --no-ff feature/auth     # Force merge commit
git rebase main                    # Replay commits on main
git rebase -i HEAD~3               # Interactive rebase last 3
git cherry-pick abc123             # Apply specific commit
git cherry-pick abc123..def456     # Apply range of commits

# ── UNDOING ──────────────────────────────────────────────────
git restore file.txt               # Discard working dir changes
git restore --staged file.txt      # Unstage file
git reset --soft HEAD~1            # Undo commit, keep staged
git reset --mixed HEAD~1           # Undo commit, keep unstaged
git reset --hard HEAD~1            # Undo commit, discard changes
git revert abc123                  # Undo commit safely (new commit)
git clean -fd                      # Remove untracked files+dirs

# ── STASH ────────────────────────────────────────────────────
git stash                          # Stash all changes
git stash push -m "WIP feature"    # Stash with message
git stash push -- src/auth/       # Stash specific files
git stash list                     # Show all stashes
git stash pop                      # Restore + remove
git stash apply stash@{0}         # Restore without removing
git stash drop stash@{0}          # Remove specific stash
git stash branch new-branch       # Create branch from stash

# ── SEARCH ───────────────────────────────────────────────────
git log --grep="login"             # Commits mentioning login
git log -S "findUser"              # Commits touching this code
git log --author="Alice"           # Commits by author
git log --since="2024-01-01"
git blame file.txt                 # Who changed each line
git show abc123                    # Show commit details
git bisect start
git bisect bad                     # Current commit is bad
git bisect good v1.0               # Known good commit

# ── TAGS ─────────────────────────────────────────────────────
git tag                            # List tags
git tag v1.2.0                     # Lightweight tag
git tag -a v1.2.0 -m "Release 1.2.0"  # Annotated tag
git push origin v1.2.0            # Push tag
git push origin --tags             # Push all tags
git checkout v1.2.0                # Checkout tag
```

## Conventional Commits

```
<type>(<scope>): <short description>

Types:
  feat:     New feature
  fix:      Bug fix
  docs:     Documentation
  style:    Formatting (no logic change)
  refactor: Code restructure
  test:     Add/fix tests
  chore:    Build, deps, tooling
  perf:     Performance improvement
  ci:       CI/CD changes
  revert:   Revert previous commit

Examples:
  feat(auth): add OAuth2 Google login
  fix(api): handle null user in /profile endpoint
  docs: update API setup instructions
  chore(deps): bump axios from 1.6.0 to 1.6.7
  feat!: redesign auth API (breaking change — note the !)
```
