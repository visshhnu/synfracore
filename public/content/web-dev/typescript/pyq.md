# TypeScript — PYQ (Previously Asked / Practice Questions)

**Framing note:** TypeScript has no dominant proctored certification and therefore no public past-paper archive exists (see the Certification tab for the full honest breakdown). What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented TypeScript behavior rather than invented "leaked" exam content.

---

### 1. (Domain: Type System Fundamentals) Why is TypeScript described as having zero runtime cost, and what does that actually mean during compilation?

**Answer:** During compilation (`tsc`), every type annotation, interface, and generic type parameter is stripped out entirely — this is called type erasure. What remains and actually executes is plain, ordinary JavaScript with no trace that types were ever present. Because nothing type-related survives into the running program, there's no runtime overhead from using types (nothing extra to execute) — but also no runtime benefit, since a type mismatch that only manifests from real runtime data (malformed JSON from an API, for instance) can't be caught by something that no longer exists once the code is running.

---

### 2. (Domain: Interfaces & Type Aliases) A team debates whether to standardize on `interface` or `type` for all object shapes. What's the actual, decision-relevant difference, not just a style preference?

**Answer:** `interface` supports declaration merging — two `interface` blocks with the same name in the same scope automatically combine into one, which is specifically how libraries let consumers extend a type they don't own (augmenting Express's `Request`, for example). `type` cannot do this — two `type` declarations with the same name is a hard compile error. Conversely, `type` can name anything (a union, a tuple, a function signature, a primitive), while `interface` is limited to object/class shapes. The choice matters concretely when either merging or non-object-shape naming is actually needed — otherwise it's largely interchangeable.

---

### 3. (Domain: any vs unknown) Why does this guide treat `any` as an escape hatch of last resort rather than a convenient default when a type is momentarily unclear?

**Answer:** `any` doesn't just leave one value unchecked — it silently disables checking for everything downstream that consumes that value too, with no compiler warning that this propagation happened. `unknown` accepts the same range of values but forces an explicit narrowing check (`typeof`, `instanceof`, a custom type guard) before any operation is allowed on it. Using `unknown` at a genuinely uncertain boundary (an API response, user input) preserves the actual safety guarantee TypeScript exists to provide; `any` discards it entirely, silently, for every consumer of that value.

---

### 4. (Domain: Generics) Why does `function first<T>(arr: T[]): T` provide meaningfully more safety than `function first(arr: any[]): any`, given both technically "work" for any array type?

**Answer:** The generic version preserves the actual element type all the way through — calling it with `string[]` returns a genuinely typed `string`, with full autocomplete and further type checking available on the result. The `any` version accepts any array but returns `any`, meaning every caller loses type safety on the result regardless of what they passed in, and that loss silently spreads to whatever code consumes that return value next.

---

### 5. (Domain: Narrowing & Discriminated Unions) Given a union of several object shapes that each need different handling, why is a shared literal "tag" field the standard safe pattern rather than checking for the presence of a specific property?

**Answer:** A shared literal-typed field (e.g. `kind: "circle" | "square"`) gives the compiler an exhaustive, unambiguous signal it can check directly (`switch (shape.kind)`), narrowing the type precisely within each branch. Checking for a property's mere presence (`"radius" in shape`) works too in simple cases, but doesn't scale as cleanly when shapes share overlapping optional fields, and doesn't give the compiler the same exhaustiveness-checking capability a `switch` over a literal tag does (catching, at compile time, a newly-added union member that isn't yet handled anywhere).

---

### 6. (Domain: Third-Party Libraries) A project needs to use a JavaScript library that has no bundled types and no `@types` package published for it. What's the recommended approach, and why not just type every usage as `any`?

**Answer:** Write a minimal local `.d.ts` declaration file describing only the specific functions/shapes actually being used from that library. This keeps the untyped surface small, explicit, and documented — a deliberate, reviewable boundary — rather than letting `any` (which would be the alternative at every call site) spread its lack of checking silently into every place that library's return values get used throughout the rest of the codebase.

---

### 7. (Domain: Advanced Types — infer) Explain, conceptually, how `ReturnType<T>` is able to extract a function's return type, using the `infer` keyword.

**Answer:** `infer` can only appear inside a conditional type's `extends` clause, where it declares a new type variable that TypeScript fills in by pattern-matching the type being checked against a shape containing `infer`. `ReturnType<T>` is essentially `T extends (...args: any[]) => infer R ? R : never` — it checks whether `T` matches the shape of "a function returning something," and if so, captures whatever that "something" (`R`) actually is as the resulting type.

---

### 8. (Domain: strict mode) Why does turning on `strict: true` for the first time on a large, already-loose existing codebase typically surface far more errors than turning it on for a brand-new project?

**Answer:** `strict` bundles several checks, and `strictNullChecks` in particular is usually the highest-impact one — without it, `null`/`undefined` are silently assignable to every type by default, so a large existing codebase written without that check has almost certainly accumulated many implicit, unchecked assumptions about values never being null/undefined. Turning the check on retroactively surfaces every one of those existing assumptions at once, as compile errors, rather than the checks growing incrementally alongside the code the way they would on a project that had `strict` on from day one.

---

### 9. (Domain: Troubleshooting — Type-Checker Performance) A large TypeScript project's `tsc` build time and editor responsiveness both degrade noticeably as the codebase grows, even though the line count growth alone doesn't seem to explain it. What's the more likely underlying driver?

**Answer:** The type checker's cost scales primarily with the complexity of the types themselves — deeply nested conditional or mapped types, very large union types, and excessive generic constraint chains — not simply with raw line count. Two projects of similar size can have very different type-checking costs depending on how complex their actual type definitions are. `skipLibCheck` (skip re-checking already-verified `.d.ts` files in `node_modules`) and splitting the project into TypeScript project references (enabling incremental rebuilds of only what changed) are the standard mitigations, rather than simply accepting the slowdown as an inevitable cost of codebase size.

---

### 10. (Domain: Migration Practice) When migrating an existing JavaScript file to TypeScript, why does this guide recommend fixing each compiler error one at a time rather than suppressing errors broadly to get a fast green build?

**Answer:** Each compiler error surfaced during a migration typically represents a real, previously-invisible assumption in the original JavaScript — a value that could be `null`/`undefined` and was never checked, a function called with the wrong shape of argument, a typo'd property name that happened to silently return `undefined` at runtime instead of throwing. Suppressing these broadly (blanket `any` typing, wholesale `// @ts-ignore`) reaches a passing build faster but discards exactly the diagnostic value the migration exists to capture — the whole point of converting to TypeScript is surfacing and fixing these latent issues, not hiding them behind a compiler that's been told to stop looking.
