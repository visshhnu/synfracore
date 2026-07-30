# Linux — Prerequisites

## What You Need Before Starting

Linux is genuinely one of the more accessible starting points in this course — it doesn't require deep prior knowledge of another technology first, since it's largely foundational to everything else. That said, a few things will make the difference between productive learning and constant friction.

### 1. Comfort with the general idea of a command-line interface (helpful, not required)

You don't need prior Linux experience specifically, but if you've never used *any* command-line interface before (including Windows Command Prompt or PowerShell), expect the first few days to feel like learning to type all over again — that's normal, and it passes quickly. If you have any prior command-line exposure at all, even from a different OS, that general comfort transfers directly.

### 2. A real Linux environment to practice in (required — this is not optional reading)

The Installation tab covers the practical options in detail, but the short version: you need somewhere to actually type commands and see real results, not just read about them.
- **WSL2** (Windows) — fastest setup, a real Linux kernel running inside Windows
- **Terminal app** (macOS) — Unix-based already, most commands work directly
- **A free cloud VM** (AWS, Oracle Cloud's genuinely-free-forever tier, Google Cloud's trial credit) — closest to real production Linux, and worth doing at least once even if WSL2 is your daily driver, since a few things (systemd behavior, certain networking defaults) differ slightly on a real standalone VM versus WSL2
- **VirtualBox with a local VM** — fully offline, no cloud account needed at all

**Verified note on AWS specifically:** if you're setting up a fresh AWS account today, be aware AWS replaced its old "12 months free" model with a credit-based system in July 2025 — new accounts get $100-200 in credits over a 6-month window rather than a full year of free usage. The Installation tab reflects this, but it's worth knowing regardless of which specific guide you're following, since a lot of tutorials online still describe the old model.

### 3. Basic familiarity with what a "server" is, conceptually (helpful)

You don't need prior sysadmin experience, but understanding at a basic level that a server is just a computer, usually without a graphical interface, that stays running and does a job (hosts a website, runs a database) will make several concepts land faster — particularly why things like "no GUI" and "runs unattended for months" shape a lot of how Linux administration conventions work the way they do.

### 4. Basic English-language reading comfort with technical documentation (helpful)

A meaningful amount of real Linux troubleshooting involves reading `man` pages, error messages, and official documentation directly — if reading dense technical text feels genuinely difficult, that's worth building comfort with in parallel, since "read the man page" is a constant real-world habit worth developing rather than avoiding.

### 5. What you do *not* need yet

- Prior Windows system administration experience — helpful in a general "I've administered *a* system before" sense, but Linux's conventions (permissions model, filesystem hierarchy, package management) are different enough that Windows admin experience doesn't transfer directly
- Programming experience — Bash scripting is covered from scratch starting in the Intermediate tab; you don't need to already know a programming language, though prior exposure to *any* language's basic concepts (variables, loops, conditionals) will make that section click faster
- Networking deep-dives — this course covers the networking commands relevant to Linux administration (`ss`, basic firewall config) at the level needed here; `ip` and other reference-only commands appear in the Cheatsheets/Notes tabs but aren't walked through step by step. Deeper networking theory lives in this platform's dedicated Networking technology, and isn't a prerequisite to start here

### Quick self-check

Can you open a terminal (in whichever environment you set up from item #2 above) and successfully run `pwd`, `ls -la`, and `cd /tmp` without needing to look anything up? If yes, you're ready for the Fundamentals tab. If you don't yet have a terminal to try this in at all, that's the actual first step — go set up one of the environments above before anything else.
