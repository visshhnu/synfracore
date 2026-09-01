# TypeScript — Intermediate

## Generics — one implementation, many types, without losing safety

A generic function or type is parameterized over a type variable — conventionally named `T` — that gets filled in at the call site, letting TypeScript track the *actual* type flowing through rather than falling back to `any`.

```typescript
function firstElement<T>(arr: T[]): T {
  return arr[0];
}

const num = firstElement([1, 2, 3]);          // T inferred as number -- num: number
const str = firstElement(["a", "b"]);          // T inferred as string -- str: string

// Generic interfaces work the same way
interface ApiResponse<T> {
  data: T;
  status: number;
  error?: string;
}

const userResponse: ApiResponse<{ id: string; name: string }> = {
  data: { id: "u1", name: "Alice" },
  status: 200,
};
```

Constraining a generic (`T extends ...`) narrows what's allowed, while still preserving the specific type passed in — the key difference from just typing the parameter as the constraint itself.

```typescript
function getLength<T extends { length: number }>(item: T): number {
  return item.length;
}

getLength("hello");        // ok -- strings have .length
getLength([1, 2, 3]);        // ok -- arrays have .length
getLength(42);               // Error: number has no .length
```

## Utility types — building new types from existing ones

TypeScript ships a set of built-in generic utility types for common transformations, so you rarely need to hand-write a modified version of an existing type from scratch.

```typescript
interface User {
  id: string;
  name: string;
  email: string;
  role: "admin" | "member";
}

type PartialUser = Partial<User>;
// { id?: string; name?: string; email?: string; role?: "admin" | "member" }
// Useful for update payloads -- caller sends only the fields they're changing

type UserPreview = Pick<User, "id" | "name">;
// { id: string; name: string } -- only the listed keys

type PublicUser = Omit<User, "email">;
// User minus 'email' -- everything else stays

type UsersById = Record<string, User>;
// { [key: string]: User } -- a dictionary/map keyed by string

function updateUser(id: string, changes: Partial<User>) {
  // caller can pass { name: "New Name" } alone, without email/role
}
```

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Base type", "sublabel": "e.g. interface User {...}", "color": "blue" },
    { "label": "Utility type applied", "sublabel": "Partial<User> / Pick<User,...> / Omit<User,...>", "color": "purple" },
    { "label": "New derived type", "sublabel": "Stays in sync automatically if User changes", "color": "green" }
  ]
}
```

The real benefit beyond convenience: `PartialUser` above stays automatically in sync if `User` changes later — add a field to `User` and `Partial<User>` picks it up with no separate edit required, unlike a hand-written duplicate type that would silently drift out of sync.

## Narrowing — type guards and discriminated unions

A union type can't have type-specific code run on it directly — narrowing is how you tell the compiler "within this branch, I've confirmed which member of the union this actually is."

```typescript
function formatValue(value: string | number) {
  if (typeof value === "string") {
    return value.toUpperCase();   // TypeScript knows value is string here
  }
  return value.toFixed(2);         // and knows it's number here, by elimination
}
```

A **discriminated union** uses a shared literal-typed field (the "discriminant" or "tag") across every member, which narrowing can check directly — this is the standard pattern for modeling "one of several distinct shapes" safely.

```typescript
interface LoadingState { status: "loading"; }
interface SuccessState { status: "success"; data: string[]; }
interface ErrorState { status: "error"; message: string; }

type FetchState = LoadingState | SuccessState | ErrorState;

function render(state: FetchState) {
  switch (state.status) {
    case "loading":
      return "Loading...";
    case "success":
      return state.data.join(", ");   // TypeScript knows .data exists here
    case "error":
      return state.message;            // and .message exists ONLY here
  }
}
```

## Modules — the standard way real TypeScript code is organized

Modern TypeScript (matching modern JavaScript) uses ES module syntax (`import`/`export`) almost universally — the older CommonJS-style `namespace` construct still exists for legacy/global-script scenarios but is rarely the right choice in a new project.

```typescript
// math.ts
export function add(a: number, b: number): number {
  return a + b;
}
export interface Point { x: number; y: number; }

// app.ts
import { add, Point } from "./math";

const p: Point = { x: 1, y: 2 };
console.log(add(p.x, p.y));
```

## Working with third-party JavaScript — `@types` packages and declaration files

Most popular npm packages either ship their own types (check for a `.d.ts` file in the package) or have community-maintained types published separately under the `@types` scope, from the DefinitelyTyped project.

```bash
npm install lodash
npm install -D @types/lodash    # types published separately -- lodash itself has none
```

If no types exist anywhere for a package you need, write a minimal local declaration file describing just what you actually use — this keeps the "untyped surface" small and explicit rather than letting `any` leak silently into calling code:

```typescript
// types/some-untyped-lib.d.ts
declare module "some-untyped-lib" {
  export function doThing(input: string): number;
}
```

```bash
# TypeScript automatically picks up any *.d.ts files that are included
# by your tsconfig.json's "include" — no separate registration needed.
```
