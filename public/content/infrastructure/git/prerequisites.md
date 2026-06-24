# Git Prerequisites

## What You Need Before Learning Git

### Required Background Knowledge

```
COMMAND LINE BASICS (essential):
  Navigate: cd, ls/dir, pwd
  Files: touch/type nul, mkdir, rm/del, cp/copy, mv/move
  View: cat/type, less/more, head, tail
  Permissions: chmod (Linux/Mac)
  
  Practice: spend at least 2-3 hours with command line before Git
  Resources: Ryan's Linux Tutorial (ryanstutorials.net), SS64.com reference

TEXT EDITOR:
  You need a terminal-based or GUI editor configured
  Recommended: VS Code (free, excellent Git integration built-in)
  Alternative: Vim/Neovim (steep learning curve; powerful once mastered)
  Alternative: Nano (beginner-friendly terminal editor)
  
  Configure Git to use VS Code:
    git config --global core.editor "code --wait"

BASIC UNDERSTANDING OF:
  What a file system is (directories and files)
  What text files vs binary files means
  Concept of a "project" directory containing related files
```

### Installing Git

```bash
# Linux (Ubuntu/Debian)
sudo apt update && sudo apt install git -y

# macOS (using Homebrew)
brew install git
# Or: install Xcode Command Line Tools (includes git)
# xcode-select --install

# Windows
# Download from: git-scm.com/download/win
# Git Bash included — use this as your terminal

# Verify installation
git --version  # should show git version 2.x.x

# Initial configuration (do this first — required)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global core.editor "code --wait"  # or vim, nano
git config --global init.defaultBranch main

# View your configuration
git config --list
git config --global --list
```

### Understanding Version Control Concepts

```
WHAT PROBLEM DOES GIT SOLVE?
  Without version control:
    - "final_v2_FINAL_reallyfinal.docx" syndrome
    - No way to undo a mistake from 3 days ago
    - Collaborating by emailing files = chaos
    - No record of who changed what and why
  
  With Git:
    - Every change is tracked with author, time, and message
    - Roll back to any point in history instantly
    - Work on features without breaking main code (branches)
    - Multiple people work on same codebase simultaneously

CORE MENTAL MODEL:
  Working Directory: your files on disk right now
  Staging Area (Index): files marked for next commit
  Repository (.git folder): the full history of all commits
  
  WORKFLOW: edit file → stage file → commit (save to history)
  
  Remote: a copy of the repository on another server (GitHub, GitLab, Bitbucket)
  Push: send local commits to remote
  Pull: get remote commits to local
  Clone: copy a remote repository to your computer
```

### GitHub Setup

```bash
# Create account at github.com

# SSH key setup (recommended over HTTPS)
ssh-keygen -t ed25519 -C "you@example.com"  # accept defaults
# Copy public key:
cat ~/.ssh/id_ed25519.pub  # copy this entire output
# Add to GitHub: Settings → SSH and GPG keys → New SSH key → paste

# Test connection
ssh -T git@github.com  # should say "Hi username!"

# Clone a repository
git clone git@github.com:username/repository.git
git clone https://github.com/username/repository.git  # HTTPS alternative

# Your first repository
mkdir my-project && cd my-project
git init
echo "# My Project" > README.md
git add README.md
git commit -m "Initial commit: add README"
git remote add origin git@github.com:username/my-project.git
git push -u origin main
```

## Study Resources
- **Pro Git book** (git-scm.com/book) — free online, comprehensive, official
- **Learn Git Branching** (learngitbranching.js.org) — interactive visual learning
- **GitHub Skills** (skills.github.com) — free hands-on GitHub courses
- **Oh My Git!** (ohmygit.org) — game to learn Git interactively
