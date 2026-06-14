# Git — Installation Guide

## Install Git

### macOS
```bash
# Option 1: Xcode Command Line Tools (simplest)
xcode-select --install
git --version

# Option 2: Homebrew (keeps it updated)
brew install git
git --version
```

### Ubuntu / Debian
```bash
sudo apt update && sudo apt install git -y
git --version   # git version 2.x.x
```

### Windows
1. Download from **git-scm.com/download/win**
2. Run installer — accept all defaults
3. Open "Git Bash" from Start Menu
```bash
git --version
```

### Amazon Linux / RHEL / CentOS
```bash
sudo yum install git -y
git --version
```

## First-Time Setup (Required — Do This Once)

```bash
# Set your identity (used in every commit)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Set default branch name to main
git config --global init.defaultBranch main

# Set your preferred editor (choose one)
git config --global core.editor vim
git config --global core.editor "code --wait"   # VS Code
git config --global core.editor nano

# Verify settings
git config --list
```

## Connect to GitHub / GitLab (SSH — Recommended)

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "you@example.com"
# Press Enter 3 times (accept defaults)

# Copy your public key
cat ~/.ssh/id_ed25519.pub
# Copy the entire output

# Add to GitHub:
# Settings → SSH and GPG keys → New SSH key → Paste

# Test the connection
ssh -T git@github.com
# "Hi username! You've successfully authenticated."
```

## Your First Repository

```bash
# Create new repo
mkdir my-project && cd my-project
git init
echo "# My Project" > README.md
git add README.md
git commit -m "first commit"

# Push to GitHub (create repo on github.com first)
git remote add origin git@github.com:yourusername/my-project.git
git push -u origin main

# Clone an existing repo
git clone git@github.com:yourusername/my-project.git
cd my-project
```

## Verify Everything Works

```bash
git init test-repo && cd test-repo
echo "hello" > file.txt
git add . && git commit -m "test"
git log --oneline
# Output: abc1234 test
cd .. && rm -rf test-repo
```

## Next Steps

Go to **Fundamentals** to learn branching, merging, and the daily Git workflow used in every team.
