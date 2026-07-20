# Git — Fundamentals

## The Three Trees: Working Directory, Staging Area, Repository

Git tracks changes through three distinct states, and most early confusion about "why didn't my commit include that change" comes from not having a clear mental model of them:

- **Working directory** — the actual files on disk, as you're editing them.
- **Staging area (the "index")** — a snapshot of exactly what will go into the *next* commit. `git add` moves changes from the working directory into staging; nothing else does.
- **Repository (`.git/`)** — the committed history. `git commit` takes whatever is currently staged and turns it into a permanent snapshot.

```bash
git status              # shows the difference between all three states at once
git diff                # working directory vs staging (unstaged changes)
git diff --staged       # staging vs last commit (what a commit right now would contain)
```
A very common mistake: editing a file after `git add`-ing it, then committing, and being surprised the new edits aren't in the commit — `git add` staged a snapshot *at that moment*, not a live link to the file. Re-run `git add` after any further edits, or `git commit -a` to auto-stage all tracked-file changes at commit time (this does not pick up brand-new untracked files).

## Branches Are Just Pointers

A branch in Git is not a copy of the codebase — it's a lightweight, movable pointer to a specific commit. This is why creating a branch (`git branch feature/x`) is instant regardless of repository size: it's writing one small pointer file, not copying anything. `HEAD` is a pointer to whichever branch (or commit, in detached-HEAD state) you currently have checked out — `git log` walks backward from wherever `HEAD` currently points.

```bash
git branch                      # list local branches, * marks current
git branch feature/search       # create a new branch (does NOT switch to it)
git switch feature/search       # switch to it (modern; git checkout feature/search also works)
git switch -c feature/search    # create AND switch in one step
git branch -d feature/search    # delete a branch (refuses if it has unmerged commits)
git branch -D feature/search    # force-delete, even with unmerged commits
```

## Merge vs. Rebase — Same Goal, Different History Shape

Both bring changes from one branch into another, but they produce genuinely different history:

- **`git merge feature/x`** (while on `main`) creates a new merge commit with two parents, preserving the exact sequence of commits from both branches exactly as they happened. Non-destructive — never rewrites existing commits.
- **`git rebase main`** (while on `feature/x`) replays your branch's commits one by one on top of the current tip of `main`, producing a linear history with no merge commit — but it rewrites your branch's commit hashes in the process.

**The rule that actually matters in practice: never rebase commits that have already been pushed and that anyone else might have based work on.** Rebasing rewrites commit hashes — if someone else already pulled the old commits, their history and yours diverge in a way that's genuinely painful to reconcile. Rebasing your own local, not-yet-pushed commits (to clean up history before opening a PR) is safe and common; rebasing a shared branch after others have pulled it is the mistake that causes real team pain.

## Undoing Things — Pick the Right Tool for What You Actually Want

Git has several "undo" commands that look similar but do meaningfully different things — using the wrong one is a common source of either lost work or a messy shared history:

```bash
git restore file.py              # discard uncommitted changes in the working directory
git restore --staged file.py     # unstage a file (keeps the actual edits, just un-stages them)

git revert abc1234                # create a NEW commit that undoes abc1234 -- safe for shared/pushed history,
                                   # since it adds to history rather than rewriting it

git reset --soft HEAD~1           # undo the last commit, keep changes staged
git reset --mixed HEAD~1          # undo the last commit, keep changes but unstaged (this is the default mode)
git reset --hard HEAD~1           # undo the last commit AND discard the changes entirely -- destructive, no confirmation
```
`revert` vs `reset`: `revert` is the right tool once something has been pushed and others may already have it — it never rewrites history, just adds a compensating commit. `reset` rewrites what your branch points to and is only safe for commits that are still purely local.

## Stashing — Temporarily Set Aside Uncommitted Work

```bash
git stash                    # save uncommitted changes, restore working directory to last commit
git stash list                # see all stashed sets of changes
git stash pop                 # reapply the most recent stash AND remove it from the stash list
git stash apply                # reapply the most recent stash but KEEP it in the stash list too
git stash drop                 # discard a stash without applying it
```
The common use case: you're mid-way through changes, need to switch branches to fix something urgent, but aren't ready to commit the in-progress work. `git stash` clears the working directory so the switch is clean, without losing anything or forcing a half-finished commit.

## Tags — Marking a Specific Point in History

```bash
git tag v1.0.0                          # lightweight tag (just a name pointing at the current commit)
git tag -a v1.0.0 -m "Release 1.0.0"    # annotated tag (stores tagger, date, message -- use this for releases)
git push origin v1.0.0                  # tags are NOT pushed automatically with a normal git push
git push origin --tags                  # push all tags at once
```
Use annotated tags (`-a`) for anything meant to represent a real release — they carry metadata (who tagged it, when, why) that a lightweight tag doesn't, which matters when someone's trying to understand release history months later.
