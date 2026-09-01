# TypeScript — Revision Notes

Condensed summary consolidating this course's Overview, Intermediate, Advanced, and Troubleshooting material — for quick pre-interview review, not first-time learning.

## What TypeScript actually is

Superset of JavaScript. Adds a static type system, checked at compile time / in-editor. Structural typing (shape match decides compatibility, not declared name/relationship). Compiles (`tsc`) down to plain JavaScript — types are 100% erased at that step (**type erasure**): zero runtime cost, zero runtime benefit, no way to check a type at runtime.

## Basic types → Fundamentals

- Primitives map 1:1 to JS: `string`, `number`, `boolean`, `null`, `undefined`
- Inference handles most local variables automatically; explicit annotation needed for function parameters (no initial value to infer from)
- `interface` vs `type`: interface merges + extends, object shapes; type aliases name anything (unions/tuples/primitives too), no merging
- Tuples (`[string, number]`) = fixed length + fixed per-position type, distinct from arrays (`string[]`) = any length, one type

## Building safely → Intermediate

- Generics (`<T>`) preserve the real type through a function/type instead of degrading to `any`
- Utility types (`Partial`, `Pick`, `Omit`, `Record`) derive new types that stay in sync automatically if the source type changes
- Narrowing: `typeof`/`instanceof`/tag-field checks let the compiler refine a union within a branch
- Discriminated unions: shared literal "tag" field across union members, narrowed via that tag — the standard safe pattern for "one of several distinct shapes"
- `@types/<package>` for third-party JS libraries without their own bundled types; minimal local `.d.ts` if none exist at all

## The genuinely advanced layer → Advanced

- Conditional types: `T extends X ? A : B` — type-level branching
- `infer`: only inside a conditional's `extends` clause, extracts a type by pattern match (this is literally how `ReturnType<T>` works internally)
- Mapped types: iterate a type's keys, transform each (this is how `Partial`/`Readonly`/`Record` are implemented)
- Template literal types: `${...}` interpolation at the type level, produces a union of concrete matching strings
- Declaration merging: two `interface` blocks, same name, same scope → combine (NOT true for `type`, which errors on duplicate names)
- `strict: true` = bundle of flags, most impactful being `strictNullChecks` (null/undefined not assignable elsewhere by default) and `noImplicitAny` (every value needs an inferable/explicit type)
- Large-project perf: `skipLibCheck` + project references reduce unnecessary re-checking

## Common failure patterns → Troubleshooting

- "Property does not exist" → typo, stale type def, or unfamiliar union branch
- "possibly undefined/null" under `strictNullChecks` → handle it for real, don't reflexively reach for `!` (non-null assertion, unchecked at runtime)
- `any` is contagious — spreads silently to everything downstream that consumes it; prefer `unknown` + narrowing at genuinely unknown boundaries
- Slow type-checking on large projects → complexity of the *types* (deep conditionals/mappeds, huge unions), not raw line count, is usually the driver

## Versioning Note

TypeScript releases fairly frequently, and several areas are genuinely version-sensitive — treat the following as `(needs verification — recheck against current source)` rather than assumed-current facts:
- Newest syntax features and any recently-added utility types not covered in this course
- Exact default values of specific compiler flags (defaults have shifted across major versions before)
- Current `@types` package version compatibility for any specific third-party library
- Framework-specific TypeScript integration details (Next.js, Vite config defaults) — these evolve independently of TypeScript itself

The core language concepts covered above — structural typing, generics, interfaces, type erasure, discriminated unions — have been stable for years and are safe to treat as durable, not volatile.
