# TypeScript — Interview Q&A

## Q: What is TypeScript, in one sentence?

A statically-typed superset of JavaScript that compiles down to plain JavaScript, adding a type system checked at compile time (or live in your editor) with zero runtime footprint — every valid JavaScript file is already valid TypeScript.

## Q: `interface` vs `type` — what's the real, decision-relevant difference?

Both describe object shapes and are interchangeable for most everyday object typing. The concrete differences: `interface` supports declaration merging (two `interface` blocks with the same name automatically combine into one — used by libraries to let consumers augment a type they don't own, like extending Express's `Request`) and uses `extends` to build on another interface. `type` can name *anything* — unions, tuples, function signatures, primitives — not just object shapes, and combines via intersection (`&`) rather than merging; two `type` declarations with the same name is a hard error. Pick `interface` as the default for plain object/class shapes, reach for `type` when you need a union, tuple, or to name something that isn't an object.

## Q: `any` vs `unknown` — why does this distinction matter in practice?

Both accept any value, but `any` completely opts out of type checking — you can call any method or access any property on it and the compiler stays silent even when it's wrong, and worse, that "no checking" silently spreads to anything that consumes an `any`-typed value downstream. `unknown` also accepts any value but *forces* you to narrow it (a `typeof` check, an `instanceof` check, a custom type guard) before you're allowed to do anything with it at all. `unknown` is the safe choice for genuinely unknown data — an API response, user input, a caught error in a `catch` block; `any` should be a deliberate, rare escape hatch, not a default reached for out of convenience.

## Q: Explain generics, with a concrete example of why `any` isn't good enough.

A generic parameterizes a function or type over a type variable filled in at the call site, preserving the actual type through the whole call rather than discarding it. `function first(arr: any[]): any` "works" for any array, but the return value is `any` — callers get zero type safety on the result and lose autocomplete entirely. `function first<T>(arr: T[]): T` preserves the real element type: calling it with `string[]` returns a genuinely typed `string`, not an untyped `any` that happens to hold a string. Generics let you write one reusable implementation without paying for that safety loss on every call site.

## Q: What is type narrowing, and how does a discriminated union rely on it?

Narrowing is the compiler refining a union type to a more specific member within a particular code branch, based on a runtime check it recognizes — `typeof x === "string"`, `instanceof`, `in`, or checking a shared literal "tag" field. A discriminated union is a union of object types that all share one literal-typed field used specifically as that tag (e.g. `{ kind: "circle"; radius: number } | { kind: "square"; side: number }`). Inside `if (shape.kind === "circle")`, the compiler already knows the exact variant and allows `shape.radius` with no manual cast — this is the standard, safe way to model "one of several distinct shapes" in TypeScript.

## Q: What does "type erasure" mean, and why does it mean TypeScript has zero runtime cost?

Every TypeScript type annotation, interface, and generic parameter exists only at compile time — during compilation (`tsc`), all of it is stripped out entirely, and what's left running is plain, ordinary JavaScript with zero trace that types were ever there. You cannot check a type at runtime with `if`, `console.log` a type, or have a type mismatch throw a runtime error — by the time the code actually executes, that information is already gone. This means TypeScript adds zero runtime performance cost (nothing left to execute) but also zero runtime benefit (it cannot catch a bug that only appears from real runtime data, like malformed JSON from an API, since by then the checking has already happened and finished).

## Q: Structural typing vs. nominal typing — what's the practical difference, and which does TypeScript use?

TypeScript uses **structural** typing: two types are compatible if their shapes match — the same properties with compatible types — regardless of name or where they were declared. A plain object literal satisfies an interface it was never explicitly declared to implement, as long as the shape matches. **Nominal** typing (Java, C#) requires an explicit declared relationship (`implements`/`extends`) for compatibility, even if the shapes are identical. Practically: TypeScript is far more flexible working with plain objects and data from outside your own codebase, but a type's *name* alone doesn't guarantee intent — two unrelated interfaces with identical shapes are fully interchangeable to the compiler, which can occasionally let a genuinely wrong value through if the shapes happen to coincide.

## Q: How do you type a function that can return different shapes depending on its input?

Function overloads (multiple type signatures for one implementation) or a generic constrained/conditioned on the input let the return type track the input precisely, rather than falling back to a loose union the caller has to re-narrow every time.

```typescript
function parseValue(input: string): string;
function parseValue(input: number): number;
function parseValue(input: string | number): string | number {
  return input;
}

const a = parseValue("hi");  // typed as string, not string | number
const b = parseValue(5);      // typed as number, not string | number
```

## Q: What's an actual bug you'd expect TypeScript to catch that plain JavaScript wouldn't?

A wrong-shaped object passed to a function (a caller forgot a required field, or passed `discountRate: "10%"` instead of `discountRate: 0.1`), a `null`/`undefined` value read without a check under `strictNullChecks`, or a typo'd property name (`user.naem` instead of `user.name`) on a known interface. In plain JavaScript, all three run without error and fail — if they fail at all — only when that exact code path executes with that exact bad data, potentially in production. In TypeScript, all three are flagged immediately, at the exact line, before the code ever runs.

## Q: When would you deliberately choose *not* to use TypeScript?

For a genuinely tiny, disposable script (a one-off data migration you'll run once and delete) the setup overhead may not be worth it. For rapid, throwaway prototyping where the shape of the data is still actively changing every few minutes, strict typing can occasionally slow iteration rather than help it — though many teams still find `strict: false` or a loose initial pass preferable to no types at all, even there. For anything that will be maintained, read by other developers, or shipped to production, the tradeoff strongly favors using it.
