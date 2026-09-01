# TypeScript — Learning Roadmap

## Estimated Time to Job-Ready

**4-6 weeks** of consistent learning (2-3 hours/day), assuming solid JavaScript fluency already — TypeScript builds directly on JavaScript rather than re-teaching it, so most of the time here goes to the type system itself, not general programming fundamentals.

## Phase 1: Basic Types & Setup (Week 1)

- Install TypeScript, generate a `tsconfig.json`, and understand `strict`, `target`, `module`, `outDir` well enough to explain what each does
- Primitive types, arrays, tuples, and when to let inference handle a type vs. annotating explicitly
- Interfaces and type aliases for describing object shapes
- Convert a small existing JavaScript file to TypeScript, fixing every error `tsc` surfaces one at a time

**Checkpoint:** can you explain why `let count = 5;` doesn't need a `: number` annotation, but a function parameter almost always does? (Inference works from an initial value the compiler can already see; a function parameter has no initial value until it's called, so the compiler has nothing to infer from.)

## Phase 2: Building Real Type-Safe Code (Week 2-3)

- Union and intersection types, literal types, and enums vs. string-literal unions
- Generics — writing one function or interface that works correctly across multiple types
- Utility types: `Partial`, `Pick`, `Omit`, `Record`, and reading their built-in type definitions to understand how they actually work
- Type narrowing with `typeof`, `instanceof`, and discriminated unions
- Complete a hands-on project: a small typed API client wrapper around `fetch`, with a generic response type

**Checkpoint:** given a union type `type Shape = Circle | Square`, can you write a function that safely accesses `radius` only on the `Circle` branch, using a discriminated union tag — without a single manual type cast?

## Phase 3: Working With Real-World Code (Week 4)

- Third-party libraries: finding/using `@types` packages, writing a minimal local `.d.ts` for anything untyped
- Reading and understanding compiler errors from an unfamiliar codebase, not just your own code
- Module organization (`import`/`export`) across a multi-file project
- Practice on a real open-source TypeScript codebase — read, don't just write; understanding *others'* type definitions is a distinct skill from writing your own

**Checkpoint:** you hit `Property 'x' does not exist on type 'unknown'` on a third-party library's return value. What are your actual next diagnostic steps, in order? (Check if `@types/<package>` exists and is installed; if not, check the library's own bundled types; if genuinely untyped, narrow or write a minimal local declaration rather than reaching for `any` immediately.)

## Phase 4: Advanced Types & Interview Readiness (Week 5-6)

- Conditional types, `infer`, and mapped types — enough to read (not necessarily author from scratch) how a library's own advanced type definitions work
- Template literal types and declaration merging
- Understand what each individual flag inside `strict: true` actually does, not just that turning it on is "good practice"
- Review this course's Interview Q&A material and practice explaining `interface` vs `type`, `any` vs `unknown`, and type erasure out loud, not just recognizing the answer when reading it

## Common Pitfalls Specific to TypeScript (Not Generic Study Advice)

- **Reaching for `any` the moment a type error is inconvenient** — this defeats the entire point locally, and it silently spreads: any code that consumes an `any`-typed value also loses type safety, often without anyone noticing until much later. Reach for `unknown` plus a narrowing check instead.
- **Assuming TypeScript catches every possible bug** — types are erased at compile time; a malformed API response at runtime, or a value cast with `as` that doesn't actually match reality, both slip straight past the type system.
- **Turning on `strict` and trying to fix every resulting error at once on a large existing codebase** — this is real, painful work; incremental adoption (`// @ts-expect-error` on genuinely unfixed lines, tracked deliberately) is usually more realistic than a single big-bang fix.
- **Treating `enum` as the only option for a fixed set of values** — a string-literal union often compiles to nothing extra at runtime and is preferred in many real codebases; know both and the tradeoff, don't default blindly.

## Getting Your First TypeScript-Heavy Role

1. **Portfolio:** projects that show deliberate type-system usage — generics, discriminated unions, a typed API layer — not just `.ts` file extensions with `any` scattered through them, which is easy for an interviewer to spot in a code sample.
2. **Resume:** be specific — "migrated a 40-file JavaScript module to strict TypeScript, catching 12 latent null-reference bugs during the conversion" is far stronger than "experience with TypeScript."
3. **Know the ecosystem, not just the syntax:** `@types` packages, `tsconfig.json`'s key options, and at least one framework's TypeScript integration (React, Next.js, or Node/Express) relevant to the roles you're targeting.
4. **Interview prep:** `interface` vs `type`, `any` vs `unknown`, and type erasure come up constantly precisely because they distinguish real hands-on experience from having only skimmed the syntax.
