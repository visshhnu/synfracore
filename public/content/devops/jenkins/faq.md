# Jenkins — FAQ

## Why can't I just run a quick build job directly on the Jenkins controller to save the hassle of setting up an agent?

Because a hung, memory-heavy, or malicious build on the controller can degrade or take down the entire Jenkins instance — every team's pipelines, not just the one job. The controller's job is scheduling and coordinating across the whole instance; agent isolation exists specifically to contain any single job's blast radius. What feels like a small convenience carries a disproportionately large risk given what the controller is responsible for.

## Is a `Jenkinsfile` really necessary, or is UI-configured job setup fine for a small team?

Even for a small team, UI-configured jobs have no review process, no change history, and no guarantee the job's actual configuration matches what's in the repository at any given commit — problems that don't disappear just because the team is small. A `Jenkinsfile` checked into the repository gets reviewed via the same pull-request process as code, has full Git history, and stays reproducible for any specific commit. The benefit scales with team size but exists even at small scale.

## Why does my cleanup/notification code sometimes not run when a pipeline fails partway through?

If that code is placed as regular steps within a specific stage (rather than in a `post` block), it only runs if the pipeline actually reaches that stage — an earlier failure skips it entirely. Move cleanup/notification logic into the `post` block with the appropriate condition (`always`, `failure`, etc.), which is specifically designed to run regardless of which stage the pipeline reached or failed at.

## Why does this guide insist on pinning Shared Library imports to a tagged version instead of the library's default branch?

Because referencing the default branch means every consuming pipeline's behavior can change the instant anyone pushes a new commit to that branch, with no coordination or opt-in from the consuming teams — a single library change can simultaneously and unexpectedly break every pipeline importing the unpinned reference. Pinning to a specific tag means a library update only affects your pipeline when you deliberately update your own reference, giving you control over timing and letting you test the update first.

## Is installing more Jenkins plugins always a straightforward win since they add capability?

Not without a real, ongoing cost — every installed plugin is a dependency that can break on a core upgrade or need its own independent security patching. More plugins mean more individual compatibility surfaces that can fail during any given upgrade, which is why "plugin sprawl" is treated as a real, common source of operational fragility, not just a one-time installation decision with no ongoing cost.

## Why did my pipelines break after a routine Jenkins core upgrade, even though I tested beforehand?

Pre-upgrade testing commonly focuses on the most frequently-used pipelines, which can miss plugin-compatibility issues affecting less-frequently-run but still business-critical pipelines that weren't naturally exercised during the testing window. Maintaining an explicit inventory of every plugin your pipelines actually depend on, and deliberately testing infrequently-run pipelines as part of upgrade validation (not just the ones naturally exercised by regular traffic), closes this specific gap.

## Should credentials ever be set as plain environment variables directly in a Jenkinsfile?

No — credentials embedded directly in a Jenkinsfile checked into a repository are visible to anyone with repository read access and remain in Git history indefinitely even if later removed. Use Jenkins' built-in credentials management system instead, which injects sensitive values into the pipeline's execution environment at runtime without exposing them in the Jenkinsfile itself, and masks credential values from build logs by default.

## What's the actual advantage of parallel stages, and are there downsides to using them everywhere?

Parallel stages reduce total pipeline wall-clock time for genuinely independent work (different test suites, independent component builds) that don't depend on each other's output. The tradeoff: they require enough available agent capacity to actually run simultaneously, and debugging parallel pipeline output can be less straightforward than following a single, linear sequential log — worth using specifically where the speed gain justifies that added complexity, not as a default for every pipeline regardless of whether stages are genuinely independent.
