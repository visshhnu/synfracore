# Shell Scripting — Prerequisites

## What You Need Before Starting

Shell scripting isn't a from-zero starting point — it assumes you're already reasonably comfortable *using* Linux/Unix interactively, and just want to automate what you already do by hand. Make sure you have the items below before jumping into the Fundamentals section.

### 1. Comfort with the Linux command line (required)

You should already be able to do these without looking anything up:
- Navigate directories (`cd`, `pwd`, `ls -la`)
- Create, move, copy, and delete files and directories (`mkdir`, `mv`, `cp`, `rm`)
- View file contents (`cat`, `less`, `head`, `tail`)
- Understand file permissions at a basic level (`chmod`, `chown`, and what the `rwx` bits mean)
- Chain commands together with pipes (`|`) and redirect output (`>`, `>>`)

If any of these feel unfamiliar, this course's foundational Linux material (or an equivalent basic Linux/command-line course) should come first — shell scripting is "the same commands you already type, but saved and made repeatable," and it's much harder to learn both at once.

### 2. A real Linux environment to practice in (required)

You need somewhere to actually run and break scripts — reading examples isn't enough. Reasonable options, roughly in order of how quickly you can get started:
- **A cloud VM** (a free-tier instance on AWS/GCP/Azure, or a low-cost VPS) — closest to how scripts behave in real deployment targets
- **WSL2 on Windows** or a **Linux virtual machine** (VirtualBox/UTM) on macOS/Windows
- **Docker** — `docker run -it ubuntu bash` gives you a disposable Linux shell in seconds, which is genuinely convenient for testing destructive commands without any real risk
- **macOS Terminal directly** — works for most of this course's material, but be aware macOS ships a very old default bash (3.2) for licensing reasons; some syntax shown later (associative arrays, certain string operations) needs bash 4+, installable via Homebrew

### 3. Basic programming concepts (recommended, not strictly required)

You don't need to already know a "real" programming language, but if you've never programmed at all, having some exposure to these ideas first will make the Fundamentals section click faster instead of feeling like memorization:
- Variables and assignment
- Conditionals (if/else)
- Loops (for/while)
- Functions and parameters

If you've written even basic code in Python, JavaScript, or similar, you already have this — the concepts transfer directly, only the syntax changes.

### 4. A text editor you're comfortable in (required)

Any editor works — VS Code, Vim, Nano, Sublime — but you'll want one with syntax highlighting for shell scripts and, ideally, an integrated terminal so you can edit and immediately run a script without switching windows. If you're editing directly on a remote server rather than locally, basic `vim` or `nano` proficiency (enough to write and save a file) is worth having regardless of your editor preference elsewhere.

### 5. What you do *not* need yet

- Prior DevOps/sysadmin job experience — this course builds that from here
- Knowledge of a "real" programming language — helpful context, but not a hard requirement (see #3)
- Kubernetes, Docker, or cloud platform knowledge — several examples in this course reference `kubectl` and `docker` commands to show realistic DevOps usage, but you don't need to understand those tools deeply yet; treat those specific lines as "here's what this looks like in practice" rather than something to fully master before continuing

### Quick self-check

If you can comfortably do this without looking anything up, you're ready to start:
```bash
cd /var/log && ls -la *.log && cat error.log | grep -i "fail" | wc -l
```
If that command reads naturally rather than needing to be decoded piece by piece, you're ready for the Fundamentals section.
