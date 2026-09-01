# TypeScript — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real production TypeScript usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The `any` that quietly spread through half a codebase from a single untyped API response

**The pattern:** A team integrates a third-party payment provider's API under real deadline pressure. The provider's SDK has no TypeScript types, and rather than writing a proper local declaration, one engineer types the response as `any` "just for now" to unblock the sprint. Over the following months, that `any` value gets passed into a dozen other functions, stored in application state, and eventually consumed by several unrelated features — each of which inherits the same lack of type checking, silently, with no compiler warning at any of those points. A production bug eventually surfaces: a field the team assumed was always a number arrives as a string under a specific payment method, and code that called `.toFixed(2)` on it throws at runtime, in production, for real users.

**Why this is a genuinely easy trap, not an obvious mistake:** the original `any` was a deliberate, reasonable-sounding shortcut under real time pressure, and nothing about the code "looked wrong" afterward — it compiled cleanly, every call site worked in testing with the data shapes actually exercised during development. The compiler gave no signal that safety had been lost, because giving that signal is structurally impossible once a value is typed `any` — there's no "this used to be checked and no longer is" warning built into the language.

**What actually prevents this:**
- **Treat `any` as requiring a one-line comment justifying why, reviewed like any other deliberate exception**, not something that quietly ships in a PR without discussion.
- **Type genuinely uncertain external data as `unknown` and narrow it at the boundary**, immediately, rather than letting an untyped value travel deep into the codebase before anything checks its actual shape.
- **Enable a lint rule flagging explicit `any` usage** (`@typescript-eslint/no-explicit-any`) so its use is visible in code review, not something that blends into a diff unnoticed.

---

## Scenario 2 (illustrative/composite): The library's own published types didn't match what it actually returned

**The pattern:** A team adopts a moderately popular open-source library with community-maintained (`@types`) definitions. The types describe a function as always returning a fully-populated object; in reality, a specific edge case (a network timeout the library handles internally) causes it to return a partially-populated object with several fields as `undefined` — behavior the published types simply don't capture, because the types were written against an earlier version of the library's actual behavior and never updated. Code written against the (incorrect) types compiles cleanly and works in every normal-path test, then throws in production the first time that specific edge case actually occurs for a real user.

**Why this is a genuinely easy trap, not an obvious mistake:** TypeScript's guarantees are only as good as the type definitions it's given — the compiler has no way to independently verify that a published `.d.ts` file actually matches a library's real runtime behavior, and a team using the library has no natural reason to distrust widely-used, seemingly-authoritative published types. The gap between "the types say X" and "the library actually does Y" is invisible until the specific runtime path that exposes the mismatch actually executes.

**What actually addresses this:**
- **Treat third-party type definitions as a hypothesis to verify at the actual boundaries your code depends on most heavily**, not an unquestionable source of truth — especially for less rigorously maintained community types.
- **Add a runtime check (or a narrow, explicit `as unknown as X` cast with a comment explaining the discrepancy) at the specific call site where the mismatch was found**, rather than trusting the type everywhere it's used, once one gap is discovered.
- **Report the discrepancy upstream** (an issue against the `@types` package or the library itself) — this is a genuine, common way real open-source type definitions actually improve over time.

---

## Scenario 3 (illustrative/composite): Disabling `strict` mode to "fix" a wave of errors quickly, and the debt that created later

**The pattern:** A team adopting TypeScript on an existing, previously-loose JavaScript codebase turns on `strict: true` and is met with several hundred compile errors at once — mostly `strictNullChecks` violations across code that had never explicitly handled `null`/`undefined`. Facing a deadline, the team turns `strict` back off, planning to "re-enable it properly later, once there's time." That time never comes, because the codebase keeps growing under the loose settings, meaning re-enabling `strict` later means fixing an even larger backlog than the original one — and each additional month makes that backlog measurably worse, not better.

**Why this is an easy trap, not a careless decision:** disabling `strict` genuinely does make the immediate error count go away, and the codebase keeps compiling and shipping normally — there's no visible symptom of the decision's cost until much later, and by then the "later" fix is a substantially bigger undertaking than it would have been at the original decision point. The cost is real but deferred and invisible in the short term, which is exactly the shape of decision that's easy to make under pressure and hard to reverse once made.

**What actually prevents this:**
- **Adopt `strict` incrementally rather than all-or-nothing** — TypeScript supports per-file or per-directory suppression (`// @ts-expect-error` with a tracked reason, or a stricter `tsconfig.json` scoped only to new/migrated files) so new code is held to the full standard immediately while a deliberately tracked backlog of legacy files gets fixed over time, rather than the whole codebase reverting to loose settings indefinitely.
- **Track the remaining non-strict file count as an explicit, visible metric**, so the backlog's size is known and shrinking, rather than an unmeasured debt that only becomes visible again when someone eventually tries to re-enable `strict` fully.
- **Treat "re-enable later" as requiring an actual scheduled follow-up, not an informal intention** — the scenario above happens specifically because the follow-up never got prioritized against other, more immediately visible work.
