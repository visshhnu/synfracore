# TypeScript — Advanced

## Conditional types — types that branch on other types

A conditional type applies `extends ? :` logic at the type level, not the value level — it lets a type's shape depend on whether another type satisfies a condition.

```typescript
type IsString<T> = T extends string ? true : false;

type A = IsString<"hello">;  // true
type B = IsString<42>;        // false

// Real-world use: extracting a function's return type generically
type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;

type Result1 = UnwrapPromise<Promise<string>>;  // string
type Result2 = UnwrapPromise<number>;            // number (not a Promise, passes through)
```

## The `infer` keyword — extracting a type from within another type

`infer` can only appear inside a conditional type's `extends` clause. It declares a new type variable that TypeScript fills in by pattern-matching against the type being checked — this is exactly the mechanism behind several of TypeScript's own built-in utility types.

```typescript
// This is (a simplified version of) how TypeScript's built-in
// ReturnType<T> utility actually works internally.
type MyReturnType<T> = T extends (...args: any[]) => infer R ? R : never;

function getUser() {
  return { id: "1", name: "Alice" };
}

type UserType = MyReturnType<typeof getUser>;
// { id: string; name: string } -- extracted directly from the function's actual return

// Extracting an array's element type
type ElementType<T> = T extends (infer E)[] ? E : never;
type Item = ElementType<string[]>;   // string
```

## Mapped types — building a new object type by transforming every property of another

A mapped type iterates over the keys of an existing type and applies a transformation to each — this is literally how `Partial<T>`, `Readonly<T>`, and `Record<K, T>` are implemented in TypeScript's own standard library.

```typescript
// A simplified version of TypeScript's built-in Readonly<T>
type MyReadonly<T> = {
  readonly [K in keyof T]: T[K];
};

interface User { id: string; name: string; }

type ReadonlyUser = MyReadonly<User>;
// { readonly id: string; readonly name: string }

const u: ReadonlyUser = { id: "1", name: "Alice" };
u.name = "Bob"; // Error: cannot assign to 'name' because it is a read-only property

// Mapped types can also transform VALUE types, not just add modifiers
type Nullable<T> = {
  [K in keyof T]: T[K] | null;
};

type NullableUser = Nullable<User>;
// { id: string | null; name: string | null }
```

## Template literal types — string types built from other types

Template literal types apply the same `${...}` interpolation syntax as JavaScript template strings, but at the type level — producing a union of every possible concrete string that pattern can match.

```typescript
type Direction = "top" | "bottom";
type Side = "left" | "right";

type Corner = `${Direction}-${Side}`;
// "top-left" | "top-right" | "bottom-left" | "bottom-right"

// A real use: strongly-typed event names
type EventName<T extends string> = `on${Capitalize<T>}`;
type ClickEvent = EventName<"click">;   // "onClick"

function on<T extends string>(event: EventName<T>, handler: () => void) {}
on("onClick", () => {});   // ok
on("click", () => {});      // Error: "click" is not assignable to `on${...}`
```

## Declaration merging — when TypeScript combines multiple declarations of the same name

Two `interface` declarations with the same name in the same scope don't conflict — TypeScript merges their members into one combined interface. This is intentional and is the mechanism real libraries use to let consumers extend a type they don't own (a very common pattern for augmenting Express's `Request` type, or global objects like `Window`).

```typescript
interface Window {
  myCustomGlobal: string;
}

// Elsewhere in the codebase (or a separate .d.ts file), this MERGES with
// the built-in Window interface rather than conflicting with it:
interface Window {
  anotherCustomGlobal: number;
}

// Both properties are now valid on window, from a plain TypeScript
// consumer's point of view -- no casting needed:
window.myCustomGlobal = "hello";
window.anotherCustomGlobal = 42;
```

`type` aliases explicitly do **not** support this — two `type` declarations with the same name in the same scope is a hard compile error, which is one of the concrete, decision-relevant differences between the two.

## Strict mode internals — what `strict: true` actually turns on

`strict` in `tsconfig.json` is not one setting — it's a bundle of several independent flags, and knowing what each does individually matters for understanding a specific error rather than treating "strict mode" as an opaque switch.

```json
{
  "compilerOptions": {
    "strict": true
    // equivalent to enabling all of:
    // "strictNullChecks": true       -- null/undefined are NOT assignable to other types by default
    // "noImplicitAny": true          -- every value needs an inferable or explicit type
    // "strictFunctionTypes": true    -- stricter checking of function parameter compatibility
    // "strictPropertyInitialization": true -- class properties must be initialized
    // "strictBindCallApply": true    -- .bind/.call/.apply are type-checked against the function signature
    // "noImplicitThis": true         -- 'this' must have a clear, inferable type
    // "alwaysStrict": true           -- emits JS in strict mode ('use strict')
  }
}
```

`strictNullChecks` is usually the single highest-impact flag on a real, sizable codebase — without it, `null` and `undefined` are silently assignable to *every* type, which defeats a huge share of what makes TypeScript's safety guarantees meaningful in practice. Turning it on for the first time on an existing large codebase is often where most of the real migration pain shows up, because it surfaces every place `null`/`undefined` was previously being handled implicitly (or not handled at all).

## Type-checker performance on large codebases

The type checker's cost grows with the complexity of the types themselves, not just the line count of code — deeply nested conditional/mapped types, very large union types, and excessive generic constraint chains can measurably slow down both `tsc` and editor responsiveness (autocomplete, hover, in-editor error checking) on a large project.

Practical mitigations real teams use: enabling `skipLibCheck` (skip re-type-checking `.d.ts` files in `node_modules` — they're already checked once when their own package was built), splitting a very large project into TypeScript **project references** (`tsconfig.json`'s `references`, which lets `tsc` incrementally rebuild only the parts that changed instead of the whole project every time), and avoiding excessively deep/recursive conditional types where a simpler type would do the same practical job.
