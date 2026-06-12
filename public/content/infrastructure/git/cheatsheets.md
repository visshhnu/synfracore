# Git Cheatsheet

## Daily Commands

```bash
# Status and history
git status
git log --oneline --graph --all --decorate
git log --oneline -20
git diff                    # unstaged changes
git diff --staged           # staged changes
git diff main..feature      # between branches

# Stage and commit
git add -p                  # interactive staging (chunk by chunk)
git add .
git commit -m "type: description"
git commit --amend --no-edit  # add to last commit
git commit --amend -m "new message"

# Branch
git checkout -b feature/login
git switch -c feature/login   # modern
git branch -d feature/login   # delete local
git push origin --delete feature/login  # delete remote
git branch -vv              # show tracking branches

# Remote
git fetch --all --prune     # fetch + remove stale remote branches
git pull --rebase           # pull with rebase (clean history)
git push -u origin HEAD     # push and set upstream
git push --force-with-lease # safe force push

# Undo
git restore file.txt        # discard unstaged changes
git restore --staged file.txt  # unstage
git reset --soft HEAD~1     # undo commit, keep staged
git reset --hard HEAD~1     # undo commit, discard changes
git revert abc123           # undo pushed commit safely
```

## Branching and Merging

```bash
# Merge strategies
git merge feature --no-ff         # always create merge commit
git merge feature --squash        # squash all into one commit, then commit

# Rebase
git rebase main               # replay commits on top of main
git rebase -i HEAD~5          # interactive: squash, reword, drop
git rebase --abort            # cancel in-progress rebase
git rebase --continue         # after resolving conflict

# Cherry-pick
git cherry-pick abc123        # apply one commit
git cherry-pick abc123..def456  # range of commits

# Tags
git tag v1.2.0                # lightweight tag
git tag -a v1.2.0 -m "Release v1.2.0"  # annotated
git push origin v1.2.0
git push origin --tags
git tag -d v1.2.0             # delete local tag
```

## Stash

```bash
git stash                   # save all changes
git stash push -m "WIP login"  # with name
git stash push -p           # interactive stash
git stash list
git stash pop               # restore and remove
git stash apply stash@{2}   # apply without removing
git stash drop stash@{0}
git stash clear             # delete all stashes
git stash branch new-branch  # stash into new branch
```

## Useful Aliases (.gitconfig)

```ini
[alias]
  st = status
  co = checkout
  br = branch
  ci = commit
  lg = log --oneline --graph --all --decorate
  last = log -1 HEAD
  unstage = restore --staged
  aliases = config --get-regexp alias
  whoami = config user.email

[core]
  editor = code --wait
  autocrlf = input     # Linux/Mac
  # autocrlf = true    # Windows

[push]
  default = current    # push to same-named branch

[pull]
  rebase = true        # always rebase on pull
```

## Commit Message Convention

```
type(scope): subject (max 72 chars)

[blank line]
Body: explain WHAT and WHY (not how)

[blank line]
Footer: Refs #123, BREAKING CHANGE: ...

Types:
  feat:     New feature
  fix:      Bug fix
  docs:     Documentation
  style:    Formatting (no code change)
  refactor: Code restructure (no feature/fix)
  test:     Add/update tests
  chore:    Build, deps, config
  perf:     Performance improvement
  ci:       CI/CD changes
```
