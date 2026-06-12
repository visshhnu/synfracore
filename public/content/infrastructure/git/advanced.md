# Git — Advanced

## Rewriting History Safely

```bash
# BFG Repo Cleaner — remove secrets/large files from ALL history
# Way faster than git filter-branch

# Remove a file from all commits
java -jar bfg.jar --delete-files id_rsa my-repo.git
# Remove secrets matching pattern
java -jar bfg.jar --replace-text passwords.txt my-repo.git
# Remove large files
java -jar bfg.jar --strip-blobs-bigger-than 50M my-repo.git

# Then clean up
cd my-repo
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push --force

# git filter-repo (modern replacement for filter-branch)
pip install git-filter-repo

# Remove a file from all history
git filter-repo --path config/secrets.yml --invert-paths

# Rename an author in all commits
git filter-repo --commit-callback '
    if commit.author_email == b"old@email.com":
        commit.author_email = b"new@email.com"
        commit.author_name = b"Correct Name"
'
```

## Git Internals

```bash
# Git stores everything as objects: blobs, trees, commits, tags
# Each object is SHA1-hashed content

# See what's inside objects
git cat-file -t HEAD          # Type: commit
git cat-file -p HEAD          # Content of HEAD commit

git cat-file -p HEAD^{tree}   # Tree object (directory listing)
git cat-file -p abc123        # Any object by hash

# Find all commits that modified a file
git log --all --full-history -- path/to/deleted-file.txt

# Find which commit a line was added
git log -S "the specific line of code" --source --all

# Verify repository integrity
git fsck --full --unreachable

# Garbage collection (runs automatically, but manual for optimization)
git gc --aggressive --prune=now
```

## Git in CI/CD Best Practices

```yaml
# GitHub Actions — efficient Git operations in CI

- name: Checkout (shallow clone for speed)
  uses: actions/checkout@v4
  with:
    fetch-depth: 0    # 0 = full history (for git describe, tags)
    # fetch-depth: 1  # Default shallow - fastest but can't access old commits

# Conventional commits + semantic versioning
- name: Semantic Release
  uses: semantic-release/semantic-release@v22
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
# Based on commit messages:
#   feat: → minor bump (1.0.0 → 1.1.0)
#   fix: → patch bump (1.0.0 → 1.0.1)
#   feat!: or BREAKING CHANGE → major bump (1.0.0 → 2.0.0)

# Protected branch rules (enforce via GitHub API/Terraform)
resource "github_branch_protection" "main" {
  repository_id = github_repository.app.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 2
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
  }

  required_status_checks {
    strict   = true
    contexts = ["ci/tests", "ci/build", "sonarqube"]
  }

  enforce_admins                  = true
  require_conversation_resolution = true
}
```
