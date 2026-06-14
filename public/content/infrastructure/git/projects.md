# Git -- Portfolio Projects

---

## Project 1: Team Git Workflow Setup

**Level:** Beginner | **Time:** 1 day | **GitHub:** `git-team-workflow`

Set up a complete team Git workflow: branch protection, commit conventions, PR templates, hooks.

```bash
# .github/pull_request_template.md
## Summary
<!-- What does this PR do? -->

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation

## Testing
- [ ] Unit tests pass
- [ ] Manual testing done
- [ ] No console errors

## Checklist
- [ ] Code reviewed
- [ ] Documentation updated
```

```bash
# .husky/commit-msg -- enforce conventional commits
#!/bin/sh
commit_msg=$(cat "$1")
pattern="^(feat|fix|docs|style|refactor|test|chore|ci)(\(.+\))?: .{1,72}"

if ! echo "$commit_msg" | grep -qE "$pattern"; then
    echo "ERROR: Commit message must follow Conventional Commits format"
    echo "Examples: feat: add login page"
    echo "          fix(auth): handle expired tokens"
    exit 1
fi
```

**Steps:** Branch protection rules on main, PR template, commit hooks, CODEOWNERS file, changelog generation

---

## Project 2: Git History and Blame Analysis Tool

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `git-analytics`

Python CLI tool that analyzes a Git repository and generates insights: busiest files, top contributors, commit frequency.

```python
import subprocess, json
from collections import Counter
from datetime import datetime

def get_commits(repo_path: str) -> list:
    result = subprocess.run(
        ["git", "log", "--format=%H|%ae|%ai|%s", "--", "."],
        capture_output=True, text=True, cwd=repo_path
    )
    commits = []
    for line in result.stdout.strip().split("
"):
        if line:
            hash_, email, date, subject = line.split("|", 3)
            commits.append({"hash": hash_, "email": email,
                           "date": datetime.fromisoformat(date), "subject": subject})
    return commits

def hotspot_files(repo_path: str, top_n: int = 20) -> list:
    result = subprocess.run(
        ["git", "log", "--name-only", "--format=", "-n", "500"],
        capture_output=True, text=True, cwd=repo_path
    )
    files = [f for f in result.stdout.split("
") if f.strip()]
    return Counter(files).most_common(top_n)

def generate_report(repo_path: str):
    commits = get_commits(repo_path)
    print(f"Total commits: {len(commits)}")
    print(f"
Top 5 contributors:")
    for email, count in Counter(c["email"] for c in commits).most_common(5):
        print(f"  {email}: {count} commits")
    print(f"
Hotspot files (changed most often):")
    for file, count in hotspot_files(repo_path)[:10]:
        print(f"  {count:4d} changes: {file}")
```

**Steps:** Analyze a real open-source repo, generate HTML report, add commit frequency heatmap, refactor risk score

---

## Portfolio Checklist
- [ ] Conventional commits enforced with hooks
- [ ] Branch protection on main (no direct push)
- [ ] PR template in use
- [ ] CODEOWNERS configured
- [ ] Can explain: rebase vs merge, when to use each
