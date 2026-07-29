# Shell Scripting — FAQ

## Should I use `#!/bin/bash` or `#!/usr/bin/env bash`?

Use `#!/usr/bin/env bash` unless you have a specific reason not to. It looks up `bash` via `$PATH`, so it works whether bash lives at `/bin/bash`, `/usr/bin/bash`, or somewhere else (common on macOS with Homebrew, or some BSD systems). `#!/bin/bash` is fine and slightly more explicit on Linux servers where that path is essentially guaranteed, but `env bash` is the more portable default.

## Why does my script work when I run it manually but fail when cron runs it?

Almost always a `$PATH` or environment problem. Cron runs jobs with a minimal environment — no `.bashrc`, no interactive-shell `$PATH`, sometimes no `$HOME`. If your script calls `aws`, `kubectl`, or anything not in `/usr/bin` or `/bin`, cron may not find it. Fix by using absolute paths for commands, or explicitly setting `PATH` at the top of the script, or sourcing the environment file cron needs before running the real command.

## My script has `set -e` but it still didn't stop on a failing command — why?

A few common reasons `set -e` doesn't fire when you'd expect:
- The failing command is part of an `if`, `while`, or `&&`/`||` condition — `set -e` deliberately ignores failures in a condition, since "the command failed" *is* the condition being tested.
- The failing command is in a pipeline and you don't also have `pipefail` set — by default, only the last command's exit status counts.
- The failing command is the last one in a function whose result is captured with `$(...)` — some shells have edge cases here depending on version.
This is why `set -euo pipefail` (not just `-e` alone) is the standard recommendation, and even then it's worth understanding the exceptions rather than assuming it catches everything.

## What's actually wrong with using `$var` instead of `"$var"`?

Without quotes, bash performs word splitting and filename globbing on the expanded value. If `$var` contains spaces, it gets split into multiple words; if it contains characters like `*`, bash may expand it against files in the current directory. This is fine when you're 100% sure the value can never contain spaces or glob characters — but that's a hard guarantee to maintain over a script's lifetime, which is why "always quote variables" is close to a universal rule rather than a situational one.

## Is `[[ ]]` always better than `[ ]`? Should I stop using `[ ]` entirely?

For scripts that will only ever run under bash, `[[ ]]` is generally safer (no word-splitting surprises, supports `=~` regex, supports `&&`/`||` inside the brackets). The one real reason to still use `[ ]` is portability: if a script needs to run under a strict POSIX `sh` (some minimal Docker base images use `dash` as `/bin/sh`, not bash), `[[ ]]` isn't available there at all — you'd need `[ ]` or `test`.

## Why do people say to avoid parsing `ls` output?

Because filenames can contain spaces, newlines, or even characters that look like `ls` flags, and `ls`'s output format isn't guaranteed to be stable or machine-parseable across systems/versions. The standard alternative is to use globbing directly (`for f in *.log; do ...`) or `find ... -print0 | xargs -0 ...` for anything more complex — both operate on actual filenames rather than a text rendering of them.

## What's the difference between `source script.sh` and `./script.sh`?

`./script.sh` runs the script in a **new subshell process** — any variables it sets or `cd` commands it runs disappear once it finishes, because that's a separate process. `source script.sh` (or the shorthand `. script.sh`) runs it in your **current shell**, so variable assignments, exported variables, and directory changes persist afterward. This is exactly why things like `.bashrc` and virtual-environment `activate` scripts are meant to be sourced, not executed directly — activating a Python venv, for example, only works if it modifies your current shell's `$PATH`.

## Why does my script say "Permission denied" even though I can see the file?

Being able to *read* a file (or `cat` it) is different from being able to *execute* it. Check `ls -l script.sh` — you need the execute bit (`x`) set for your user, group, or others as appropriate. Fix with `chmod +x script.sh`. If it still fails after that, check that the filesystem itself isn't mounted with `noexec` (common on some `/tmp` mounts in hardened environments), in which case you'd need to run it as `bash script.sh` instead of `./script.sh`.

## Should config values live in environment variables or a sourced config file?

Both patterns are common and legitimate. Environment variables are the standard for anything that varies by deployment environment or that shouldn't be committed to version control (secrets, hostnames, credentials) — set them via your CI/CD system or container orchestrator. A sourced config file (`source config.env`) works well for settings that are the same across a whole class of deployments and are fine to version-control. What you generally want to avoid is hardcoding either kind of value directly into the logic of the script itself, since that's what makes a script break the moment it's run somewhere new.

## Why did my script silently produce wrong output instead of erroring?

This is usually one of: an unquoted variable that word-split or glob-expanded unexpectedly; a pipeline where an early stage failed but `pipefail` wasn't set so the failure got swallowed; or an unset variable being treated as empty string rather than triggering an error (which `set -u` exists specifically to catch). Silent-wrong-output bugs are generally harder to catch than "script crashed" bugs precisely because nothing alerts you — which is the core argument for defensive flags (`set -euo pipefail`) and explicit validation rather than assuming inputs will always be well-formed.

## Is it ever OK to use `eval`?

Use it as a last resort and be aware it can execute arbitrary strings as commands — if any part of the string being `eval`'d comes from user input or an untrusted source, this is a direct code-injection risk, not a theoretical one. The rollback pattern shown in this course's Advanced section (storing shell commands as strings in an array and `eval`-ing them in reverse order) is a legitimate, contained use case because the strings are ones the script itself constructed, not external input. If you're reaching for `eval` to work around not knowing a variable's name in advance, look at indirect expansion (`${!varname}`) or associative arrays first — they solve most of the same problems without the injection risk.

## My associative array (`declare -A`) works on my machine but fails with "declare: -A: invalid option" elsewhere — why?

Associative arrays require **bash 4.0+**. This bites people on macOS specifically, where the system-default `/bin/bash` is often a very old version (3.2, for licensing reasons — Apple stopped updating bundled bash after Bash moved to the GPLv3) even on a recent macOS release. Check `bash --version` on any environment where this matters, and if you need to support macOS's default bash, either install a newer bash via Homebrew or avoid associative arrays in favor of an alternative structure.

## What's the quickest way to catch mistakes before running a script?

Run it through **ShellCheck** (`shellcheck script.sh`, or shellcheck.net for a quick paste-in check). It's the de-facto standard linter for shell scripts and catches most of the classic mistakes covered in this course — unquoted variables, `[ ]` vs `[[ ]]` misuse, unreachable code after certain constructs, and dozens of other patterns — before you ever run the script against something real.
