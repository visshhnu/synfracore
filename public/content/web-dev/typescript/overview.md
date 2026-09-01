# TypeScript

> **JavaScript, plus the type system that catches your mistakes before your users do**

**Category:** Frontend / Web Development
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** you need solid JavaScript fundamentals — variables and scope, functions, objects/arrays, and `async`/`await` — because TypeScript is not a separate language you learn instead of JavaScript, it's JavaScript *plus* a type system layered on top. Every JavaScript concept you already know still applies; TypeScript adds a way to describe the shape of your data and have mistakes caught before you ever run the code. If any of that JavaScript list feels shaky, this platform's own JavaScript technology is the right stop first. See the **Prerequisites** tab for the full detail.

---

## What is TypeScript?

Think of TypeScript as a spell-checker for your code. A spell-checker doesn't change what you're trying to say — it just catches typos and grammar mistakes *before* you hit send, instead of your reader finding them later. TypeScript does the same thing for JavaScript: it doesn't add new runtime behavior, it adds a layer that checks your code's "grammar" — does this function actually receive the shape of data it expects? does this variable actually have a `.length` property? — while you're writing it, not after you've shipped it. It's the same reason a building inspector checks a structure *during* construction rather than after tenants have moved in: catching a problem early is far cheaper than catching it late.

Technically: TypeScript is a strict **superset** of JavaScript — every valid JavaScript file is already valid TypeScript (rename `.js` to `.ts` and it still runs). It uses a **structural type system**: two types are considered compatible if their *shapes* match (the same properties, the same types), regardless of what they're named or where they were declared — this is different from languages with **nominal typing**, where two types are only compatible if one explicitly declares it implements the other. TypeScript code doesn't run directly in a browser or Node — it's compiled (more precisely, **transpiled**) down to plain JavaScript first, and during that step every type annotation is deleted. This is called **type erasure**, and it's a genuinely common misconception worth addressing head-on: TypeScript's types have *zero* runtime existence. You cannot `console.log` a type, check a type with `if` at runtime, or have a type annotation throw an error while your program is running — by the time your code executes, every `: string` and `interface User {...}` is already gone, stripped out during compilation, and what's left is ordinary JavaScript.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": ".ts source", "sublabel": "Your code + type annotations", "color": "blue" },
    { "label": "Type Checker", "sublabel": "Verifies shapes match, flags errors", "color": "purple" },
    { "label": "Compiler (tsc)", "sublabel": "Strips all types away", "color": "amber" },
    { "label": "Plain .js output", "sublabel": "What actually runs — no types left", "color": "green" }
  ]
}
```

## Why TypeScript?

JavaScript's dynamic typing means a variable can hold anything, and nothing checks that it holds what you *meant* it to hold until the exact line that breaks at runtime. `undefined is not a function` and `Cannot read properties of undefined` are two of the single most common production errors in real JavaScript codebases — and both usually trace back to the same root cause: code assumed a value or shape that wasn't actually there, and nothing caught it until a user hit that exact code path in production. Passing an object with the wrong shape into a function, forgetting to handle a `null` return value, or misspelling a property name are all mistakes JavaScript happily lets you make and only reveals when that specific line actually executes.

TypeScript moves that entire class of error from "discovered at runtime, possibly in production, possibly by a user" to "flagged in your editor before you even save the file, or at compile time in CI if it somehow slips past your editor." That shift — runtime to compile time — is the entire value proposition, and it's exactly why TypeScript has become the practical default for any JavaScript codebase past a small, personal-project scale: nearly every serious frontend framework (React, Angular, Vue), and the large majority of mid-to-senior frontend and full-stack job listings, now expect it as baseline, not a specialty skill.

---

## Learning Modules

### Module 01 — Basic Types & Type Inference
*Annotating your data, and knowing when TypeScript can figure it out without your help*

**Topics covered:**

- Primitive types: `string`, `number`, `boolean`, `null`, `undefined` — 🟢 Beginner
- Arrays and tuples — 🟢 Beginner
- Type inference — when TypeScript infers a type automatically — 🟢 Beginner
- `any` vs `unknown` — 🟡 Intermediate
- Object types and optional properties — 🟡 Intermediate

### Module 02 — Interfaces & Type Aliases
*Describing the shape of your data so the compiler can check it for you*

An `interface` and a `type` alias can often describe the exact same object shape — the real difference is that interfaces support **declaration merging** (two `interface` blocks with the same name combine into one) and are extended with `extends`, while type aliases use intersection (`&`) and can also name unions, tuples, and primitives, which interfaces cannot. Most teams pick one as their default convention for plain object shapes and reach for the other only when its specific capability is actually needed.

```conceptgrid
{
  "boxes": [
    { "title": "interface", "description": "Best for object/class shapes that might be extended or merged later. Use 'extends' to build on another interface", "color": "blue" },
    { "title": "type alias", "description": "Can name anything -- unions, tuples, primitives, function signatures -- not just object shapes. No merging", "color": "green" }
  ]
}
```

**Topics covered:**

- Interfaces and `extends` — 🟢 Beginner
- Type aliases — 🟢 Beginner
- Union types (`|`) and intersection types (`&`) — 🟡 Intermediate
- Literal types and enums — 🟡 Intermediate
- Function type signatures — 🟡 Intermediate

### Module 03 — Generics & Advanced Types
*Writing type-safe code that works across many types, not just one*

**Topics covered:**

- Generic functions and generic interfaces — 🟡 Intermediate
- Constraints on generics (`extends`) — 🔴 Advanced
- Utility types: `Partial`, `Pick`, `Omit`, `Record` — 🟡 Intermediate
- Type narrowing (`typeof`, `instanceof`, discriminated unions) — 🟡 Intermediate
- Conditional and mapped types — 🔴 Advanced

---

## Production Example

```typescript
// Production Runbook — "CI is failing on a type error I didn't introduce,
// on a line I didn't touch"

// Symptom: `tsc` fails in CI with:
//   error TS2339: Property 'discount' does not exist on type 'Product'.
// on a line in checkout.ts that hasn't changed in months.

// Step 1: Don't assume the checkout.ts diff is the problem -- a type
// error on an unchanged line almost always means an UPSTREAM type
// changed, not that this file broke itself. Find where Product is defined.
// grep -rn "interface Product" src/

// Step 2: Confirm the actual change -- a teammate's recent PR removed
// an optional 'discount?: number' field from the shared Product interface
// because it looked unused... in the files THEY were looking at.
interface Product {
  id: string;
  name: string;
  price: number;
  // discount?: number;   <- removed here, but still read elsewhere
}

// Step 3: This is exactly the value TypeScript provides here -- in
// plain JavaScript, this same removal would have shipped silently and
// only failed at runtime, in production, on the exact code path that
// reads `.discount`. In TypeScript, the compiler caught every single
// usage across the whole codebase, at build time, before merge.

// Step 4: Fix -- restore the field if it's genuinely still needed
// elsewhere, or update checkout.ts to stop depending on it, deliberately:
interface Product {
  id: string;
  name: string;
  price: number;
  discount?: number;
}

// Step 5: Verify -- rerun `tsc --noEmit` locally to confirm zero errors
// before pushing again, rather than relying on CI to catch it a second time.

// Step 6: Prevention -- this is exactly why "just delete the unused field,
// I checked and it's not used" needs a project-wide type-check, not a
// single-file glance -- the compiler already does that check for you,
// every time, for free.
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is TypeScript and why would a team adopt it over plain JavaScript?**

**A:** **Problem:** JavaScript's dynamic typing lets a wrong-shaped value or a `null`/`undefined` slip through unnoticed until the exact line of code that touches it runs — often in production. **Solution:** TypeScript adds a static type system on top of JavaScript, checked at compile time (or live in your editor), catching shape mismatches, typos in property names, and missing null checks before the code ever runs. **Result:** the same class of bug that used to surface as a production incident now shows up as a red squiggle in the editor — a shift from runtime discovery to compile-time discovery.

---

**Q2. `interface` vs `type` — what's the actual difference, and when would you pick one over the other?**

**A:** **Problem:** both can describe an object's shape, which makes the distinction feel arbitrary at first. **Solution:** `interface` supports declaration merging (defining the same interface twice combines both) and `extends` for building on another interface; `type` can alias anything — unions, tuples, function signatures, primitives — not just object shapes, and combines via intersection (`&`) rather than merging. **Result:** many teams default to `interface` for object/class shapes (especially public API shapes that might need extending later) and reach for `type` when they need a union, a tuple, or to name something that isn't a plain object.

---

**Q3. What's the difference between `any` and `unknown`?**

**A:** **Problem:** both let a value be "anything," which sounds identical but behaves very differently in practice. **Solution:** `any` completely opts a value out of type checking — you can call any method, access any property, and the compiler stays silent even if it's wrong. `unknown` also accepts any value, but forces you to narrow it (a type guard, an `instanceof` check) before you're allowed to do anything with it. **Result:** `unknown` is the safe choice for genuinely unknown data (an API response, user input) because it *forces* a check; `any` should be treated as an escape hatch of last resort, since it silently defeats the entire point of using TypeScript wherever it's used.

---

**Q4. Explain type erasure — does TypeScript have any runtime cost?**

**A:** **Problem:** it's a common misconception that TypeScript's types exist at runtime somehow, or that they add performance overhead. **Solution:** TypeScript types are 100% compile-time only — during compilation (`tsc`), every type annotation, interface, and generic parameter is stripped out entirely, leaving plain JavaScript with zero trace of them. **Result:** TypeScript has zero runtime cost and zero runtime benefit either way — it cannot catch a bug that only appears after compilation (like malformed JSON from a real API at runtime), because by then, the types are already gone.

---

**Q5. What is structural typing, and how is it different from what languages like Java or C# do?**

**A:** **Problem:** developers coming from nominally-typed languages often expect two types to be compatible only if one explicitly declares it implements the other. **Solution:** TypeScript uses structural typing — two types are compatible if their shapes match, regardless of name or declared relationship; an object literal with `{ id: 1, name: "x" }` satisfies an interface requiring exactly those fields even if it was never declared as that interface. **Result:** this makes TypeScript far more flexible for working with plain objects and third-party data, but it also means a type name alone doesn't guarantee intent — two unrelated interfaces with identical shapes are fully interchangeable to the compiler.

---

**Q6. What are generics, and why not just use `any` to write code that works with multiple types?**

**A:** **Problem:** `any` "works" with multiple types, but it throws away all type safety — the compiler can no longer verify anything about what goes in or comes out. **Solution:** generics let a function or type be parameterized over a type variable (`function identity<T>(x: T): T`), preserving the *actual* input type all the way through to the output, verified by the compiler. **Result:** `Array<T>`, `Promise<T>`, and virtually every serious TypeScript library are generic for exactly this reason — you get one reusable implementation without giving up type safety on any specific usage of it.

---

**Q7. What is type narrowing, and how does a discriminated union use it?**

**A:** **Problem:** a union type like `string | number` can't have type-specific operations called on it directly, since the compiler doesn't yet know which member type a given value actually is at that point in the code. **Solution:** narrowing uses runtime checks (`typeof x === "string"`, `instanceof`, or checking a shared literal "tag" property) that the compiler recognizes and uses to refine the type within that code branch. A discriminated union is a union of object types that all share one literal-typed field (e.g. `kind: "circle" | "square"`) used specifically as that narrowing tag. **Result:** inside `if (shape.kind === "circle")`, the compiler already knows `shape` is the circle variant and allows accessing `shape.radius` safely — no manual cast needed.

---

**Q8. How do you work with a third-party JavaScript library that has no TypeScript types?**

**A:** **Problem:** most of the npm ecosystem predates or doesn't ship TypeScript definitions directly. **Solution:** check `@types/<package-name>` on npm first — the community-maintained DefinitelyTyped project covers a huge share of popular untyped packages; if none exists, write a minimal local `.d.ts` declaration file describing just the shapes actually being used, or fall back to `any` at that one specific boundary as a deliberate, documented exception rather than letting it spread. **Result:** the goal is keeping the "untyped" surface area small and explicit, not eliminating it entirely — a single well-documented `any` at a library boundary is very different from `any` creeping silently through application code.

---

**Q9. What does `strict` mode actually enable, and why do most real projects turn it on?**

**A:** **Problem:** TypeScript is fully backward-compatible with loosely-typed JavaScript by default, which means a lot of genuinely unsafe patterns compile without complaint unless you opt into stricter checking. **Solution:** `strict: true` in `tsconfig.json` bundles a set of stricter checks — most notably `strictNullChecks` (variables can't be `null`/`undefined` unless explicitly typed to allow it) and `noImplicitAny` (every value needs an inferable or explicit type, not a silent fallback to `any`). **Result:** most real, production-serious projects enable `strict` from day one, because retrofitting it onto a large already-loose codebase later is significantly more painful than starting with it and fixing errors as they're written.

---

**Q10. What's your actual production experience with TypeScript — has it ever caught a real bug before it shipped?**

**A:** This is a genuinely personal question — answer with a real example using Problem → Solution → Result: a specific type error the compiler flagged (a mismatched API response shape, a forgotten `null` check, a renamed property that broke a distant caller), what it would have looked like as a runtime bug instead, and what you changed. Interviewers are listening for whether you've actually relied on the type system under real conditions, not just written `: string` a few times.

---

## Official Resources

- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
- [TypeScript Official Site](https://www.typescriptlang.org/)
- [TypeScript Playground](https://www.typescriptlang.org/play)

## Try It (2 Minutes)

Open the [TypeScript Playground](https://www.typescriptlang.org/play) (no install needed) and paste this in:

```typescript
function greet(user: { name: string; age: number }) {
  return `Hi ${user.name}, you are ${user.age}`;
}

greet({ name: "Alex", age: "twenty" }); // try this first
```

Watch the editor underline `"twenty"` in red before you even run anything — `age` was typed as `number`, and a plain JavaScript version of this exact code would have run fine, silently producing `"you are twenty"` instead of catching the mistake. Now fix it to `age: 20` and watch the error disappear. That's the entire point of TypeScript in one example: the mistake was caught while writing the code, not after running it.
