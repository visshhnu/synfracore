# Git — Interview Questions

**What is the difference between git merge and git rebase?**
Merge creates a new "merge commit" that ties together the histories of both branches — it preserves the exact history of when branches diverged and rejoined. Rebase replays your commits on top of another branch, rewriting them with new hashes — it creates a linear history as if you always branched from the tip. Use merge for long-lived shared branches (main, develop) where history preservation matters. Use rebase for feature branches before merging to keep a clean, readable history. Never rebase commits that have been pushed to a shared branch.

**What is git cherry-pick and when would you use it?**
Cherry-pick applies the changes from a specific commit to your current branch without merging the entire source branch. Use cases: you fixed a critical bug on main and need it on the release-2.0 branch without all the other main changes; a specific feature was committed to the wrong branch; you want to apply one commit from an abandoned feature branch. `git cherry-pick abc123` creates a new commit with the same changes but a different hash. Cherry-pick too many commits and you should probably use merge or rebase instead.

**Explain git reset vs git revert.**
Reset moves the HEAD pointer backward, effectively removing commits from the current branch's history. `--soft` keeps changes staged, `--mixed` (default) keeps changes unstaged, `--hard` discards all changes completely. Never use reset on pushed commits — it rewrites history and breaks others' copies. Revert creates a new commit that undoes the changes of a previous commit — history-safe because it only adds, never removes. Use revert for public branches; reset only for local/unpushed work.

**What is git stash and what are some advanced uses?**
Stash temporarily shelves uncommitted changes so you can switch context. Basic: `git stash` saves, `git stash pop` restores and removes, `git stash apply` restores but keeps in stash. Advanced: `git stash push -m "WIP oauth" -- src/auth/` to stash only specific files with a name. `git stash branch feature/auth` creates a new branch from the stash. `git stash list` shows all stashes; `git stash drop stash@{2}` removes a specific one. Useful when you've started work on the wrong branch.

**How do you find which commit introduced a bug?**
`git bisect` performs a binary search through commit history. Start with `git bisect start`, mark current commit as bad with `git bisect bad`, mark a known-good commit with `git bisect good v1.0`. Git checks out the middle commit; you test it and run `git bisect good` or `git bisect bad`. Repeat until Git identifies the exact commit. Automate with `git bisect run ./test.sh` — it runs your test script and bisects automatically. For large repositories with thousands of commits, bisect finds the culprit in 10-12 steps.

**What is the difference between `origin/main` and `main`?**
`main` is your local branch. `origin/main` is the remote-tracking branch — a local copy of what the remote had the last time you fetched. When you `git fetch`, origin/main updates but your local main doesn't move. When you `git pull`, it fetches AND merges origin/main into main. `git log main..origin/main` shows commits that are on remote but not local. `git log origin/main..main` shows commits you have locally but haven't pushed.
