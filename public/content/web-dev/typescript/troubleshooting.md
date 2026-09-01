# TypeScript Troubleshooting Guide

## Issue 1: "Property does not exist on type"

**Symptom:** `error TS2339: Property 'foo' does not exist on type 'Bar'.` on code that "should" work.

**Root Cause:** The value's inferred or declared type genuinely doesn't include that property — either a typo in the property name, the type definition is out of date relative to the actual data, or the value's type is broader than expected (e.g. a union where only some members have that property).

**Debug steps:**
```typescript
// Hover the value in your editor to see its actual inferred type --
// this alone resolves a large share of these errors immediately.

// Or log it explicitly to confirm the shape at that point:
console.log(typeof myValue, myValue);

// If it's a union, check which branch you're actually in:
type Result = { status: "ok"; data: string } | { status: "error" };
function handle(r: Result) {
  console.log(r.data); // Error -- 'data' only exists on the "ok" branch
}
```

**Fix patterns:**
- Typo → fix the property name, don't suppress the error
- Union type → narrow first (`if (r.status === "ok")`) before accessing the property
- Type genuinely out of date vs. real data → update the interface/type to match reality, don't cast around it

---

## Issue 2: "Object is possibly 'undefined'" / "possibly 'null'"

**Symptom:** `error TS2532: Object is possibly 'undefined'.` on an access that "always works" in practice.

**Root Cause:** `strictNullChecks` (part of `strict`) correctly flags that the type allows `undefined`/`null`, even if a specific runtime path never actually produces it — the compiler reasons from the *type*, not from your knowledge of the data.

**Debug steps:**
```typescript
function getFirst(arr: number[]): number {
  return arr[0]; // Error under strict: array access can be undefined (out-of-bounds)
}
```

**Fix patterns:**
```typescript
// Fix 1: Actually handle the undefined case (usually the right fix)
function getFirst(arr: number[]): number | undefined {
  return arr[0];
}

// Fix 2: Guard explicitly before use
function getFirst(arr: number[]): number {
  if (arr.length === 0) throw new Error("empty array");
  return arr[0];
}

// Fix 3: Non-null assertion -- ONLY when you are certain and can justify why,
// never as a default reflex to silence the error
function getFirst(arr: number[]): number {
  return arr[0]!; // asserts "trust me, this isn't undefined" -- unchecked at runtime
}
```
Fix 3 is a real escape hatch, not a solution — it removes the check without adding any actual safety, and a wrong assumption there fails at runtime exactly like plain JavaScript would have.

---

## Issue 3: A third-party library has no types (or the types don't match reality)

**Symptom:** `Could not find a declaration file for module 'some-lib'.` or the library's types compile fine but don't match what the library actually returns at runtime.

**Root Cause:** Either no types were ever published for the package, or a published `@types` package has drifted out of sync with the library's actual current behavior (a real, if less common, occurrence with community-maintained types).

**Debug steps:**
```bash
npm ls some-lib                 # confirm the package and its actual version
npm view @types/some-lib        # check if community types exist at all
```

**Fix patterns:**
```typescript
// If no types exist anywhere: minimal local declaration covering only
// what you actually use -- keeps the untyped surface small and explicit
declare module "some-lib" {
  export function doThing(x: string): number;
}

// If published types exist but are WRONG for your actual usage: don't
// silently work around it everywhere it's used -- fix or override once,
// centrally, and document why:
import * as lib from "some-lib";
// lib.doThing() actually returns a Promise<number> in the version we use,
// despite the published types saying number -- confirmed against changelog
const result = (await lib.doThing("x")) as unknown as number;
```

---

## Issue 4: `any` creeping into a codebase silently

**Symptom:** Type safety "feels" weaker over time even though most files are `.ts`; autocomplete stops working in places it used to.

**Root Cause:** `any` is contagious — once a value is `any` (an unchecked third-party return, a quick fix under deadline pressure, a forgotten `// @ts-ignore`), everything that consumes it downstream silently becomes untyped too, with no compiler warning that this happened.

**Debug steps:**
```bash
# Find explicit `any` usage across the codebase
npx tsc --noEmit --strict  # surfaces noImplicitAny violations directly

# grep for the two most common places it hides
grep -rn ": any" src/
grep -rn "@ts-ignore" src/
```

**Fix patterns:**
- Enable `noImplicitAny` (part of `strict`) so an *implicit* `any` (a forgotten annotation) is a compile error, not a silent fallback
- Use `noExplicitAny`-style lint rules (e.g. `@typescript-eslint/no-explicit-any`) to flag every deliberate `any` for review, rather than letting it blend into the codebase invisibly
- Replace genuinely-unknown-shape values with `unknown` plus a narrowing check, not `any` — this preserves the "must check before use" guarantee `any` throws away entirely

---

## Issue 5: Slow type-checking on a large project

**Symptom:** `tsc` takes minutes, or editor autocomplete/hover lags noticeably on a large codebase.

**Root Cause:** The type checker's cost scales with the complexity of the *types* themselves (deeply nested conditional/mapped types, very large unions, unnecessarily deep generic constraint chains), plus re-checking `.d.ts` files in `node_modules` that don't need re-verification.

**Debug steps:**
```bash
# Profile where time is actually going
npx tsc --extendedDiagnostics
npx tsc --generateTrace trace-output
# load trace-output/trace.json in chrome://tracing for a visual breakdown
```

**Fix patterns:**
```json
{
  "compilerOptions": {
    "skipLibCheck": true    // skip re-checking .d.ts files already verified when built
  },
  "references": [
    { "path": "./packages/core" }   // project references -- incremental rebuilds
  ]
}
```
- Split a very large monolithic project into TypeScript **project references**, so `tsc` only rebuilds what actually changed instead of the whole project every time
- Simplify excessively deep/recursive conditional or mapped types where a simpler, flatter type does the same practical job

---

## Prevention Tips
- Enable `strict: true` from a project's first day — retrofitting it onto a large, already-loose codebase later is far more painful than growing with it
- Treat every `any` as something that needs a one-line comment explaining *why*, reviewed like any other deliberate exception, not a default reflex
- Prefer `unknown` over `any` at any genuinely untyped boundary (API responses, third-party libraries, `catch` blocks)
- Keep `@types` packages' versions reasonably in sync with the library versions they describe — a large version gap is a common, avoidable source of type/reality mismatches
- Run `tsc --noEmit` in CI, not just rely on individual developers' editors catching errors before commit
