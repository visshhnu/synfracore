# SonarQube — FAQ

## Does SonarQube replace the need for code review by humans?

No — SonarQube catches a specific, systematic class of issues (bugs, security patterns, maintainability metrics) consistently on every change, but it doesn't evaluate design decisions, business logic correctness, or architectural fit the way a human reviewer does. It's a complement to code review, catching what's easy for a reviewer to miss under time pressure, not a replacement for review itself.

## Why does a Quality Gate sometimes pass even though the project has many known issues?

Because the default "Clean as You Code" gate scopes conditions to the New Code period specifically — a project can have a large backlog of pre-existing issues (tracked separately, visible in "Overall Code" views) while still passing a gate focused only on what's new or changed. This is intentional, not a gap — it's what makes adopting SonarQube on an imperfect legacy codebase practical.

## Is a Code Smell something that must be fixed before merging?

Not necessarily — Code Smells are maintainability concerns, and many teams' Quality Gates don't block on new Code Smells the way they block on new Bugs/Vulnerabilities, treating them as visible signal worth tracking rather than an automatic hard stop. Whether Code Smells gate a merge is a configuration choice, not a fixed SonarQube behavior.

## Can SonarQube analyze code without also computing test coverage?

Yes — coverage is entirely optional and depends on whether a coverage report was generated and correctly imported. A project can run full SonarQube static analysis (bugs, vulnerabilities, code smells) with zero test coverage data at all; coverage-related Quality Gate conditions simply won't be meaningfully evaluated (or will show 0%) if no report is ever supplied.

## Why would a team customize a Quality Profile instead of just using the default rule set?

Default profiles are reasonable general-purpose starting points, but a specific codebase's actual patterns can generate persistent false-positive-feeling findings for certain rules, or a team may want stricter rules for genuinely security-sensitive code than the default provides. Tuning is a normal, expected part of getting real value from SonarQube — not something to avoid out of caution.

## What happens if the New Code period's definition changes mid-project (e.g. switching from "number of days" to "reference branch")?

The Quality Gate's evaluation scope changes going forward based on the new definition — this is a deliberate configuration decision a team might make if the previous definition wasn't giving intuitive results (e.g. a fixed day-window behaving confusingly for an irregular release cadence). It doesn't retroactively re-classify already-resolved historical issues, but does change what counts as "new" for future gate evaluations.

## Does SonarQube work for codebases using multiple languages in one project?

Yes — SonarQube supports analyzing multi-language projects (a common real scenario: a backend in one language, a frontend in another, infrastructure code in a third), applying the appropriate language-specific analyzer and Quality Profile to each part, aggregated into one project's overall dashboard.

## Is a Security Hotspot marked "SAFE" a permanent, unchangeable decision?

Not necessarily permanent in principle — if the surrounding code changes later in a way that could affect whether the original "safe" reasoning still holds, that context should be re-evaluated. In practice, whether a "SAFE" marking gets automatically re-flagged depends on whether the underlying code/pattern actually changes in a subsequent analysis; a documented reason at the time of marking is what makes a later re-review possible and meaningful, rather than starting from scratch.
