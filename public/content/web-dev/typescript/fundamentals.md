# TypeScript — Fundamentals

## Basic types — describing what a value actually is

TypeScript's primitive types map directly onto JavaScript's own: `string`, `number`, `boolean`, `null`, `undefined`, `bigint`, `symbol`. The difference is you can now *say* what a variable is supposed to hold, and the compiler holds you to it.

```typescript
let username: string = "alex";
let age: number = 29;
let isActive: boolean = true;

username = 42; // Error: Type 'number' is not assignable to type 'string'
```

## Type inference — TypeScript is often smarter than you think

You don't need to annotate every single variable. When TypeScript can figure out the type from the initial value, it infers it automatically — and treats that inferred type exactly as strictly as if you'd written it yourself.

```typescript
let count = 5;        // inferred as number, no annotation needed
count = "five";        // Error: Type 'string' is not assignable to type 'number'

function double(n: number) {
  return n * 2;         // return type inferred as `number`, no annotation needed
}
```

The practical rule most real codebases follow: let inference handle local variables with an obvious initial value; write explicit annotations on function parameters (inference can't guess what a caller *will* pass) and on anything whose type isn't obvious from context.

## Interfaces vs. type aliases — describing object shapes

Both describe the shape of an object. Think of an `interface` as a contract a class or object can be checked against, and a `type` alias as a name you're giving to *any* type — including things that aren't objects at all.

```typescript
interface User {
  id: string;
  name: string;
  email?: string;       // optional property -- may be omitted entirely
}

type UserId = string;                       // a type alias can name a primitive
type Status = "active" | "inactive";        // ...or a union of literals
type UserWithStatus = User & { status: Status }; // ...or an intersection

const alice: User = { id: "u1", name: "Alice" }; // valid -- email is optional
```

```conceptgrid
{
  "boxes": [
    { "title": "interface", "description": "Object/class shapes. Supports 'extends' and declaration merging (same name defined twice combines)", "color": "blue" },
    { "title": "type alias", "description": "Names anything -- unions, intersections, tuples, primitives, function signatures. No merging", "color": "green" },
    { "title": "Optional (?)", "description": "A property that may be omitted entirely -- different from a property that's present but null", "color": "amber" },
    { "title": "readonly", "description": "A property that can be set once (at creation) but never reassigned after", "color": "purple" }
  ]
}
```

## Union and intersection types — combining types deliberately

A **union** (`|`) means "this value is one of these types." An **intersection** (`&`) means "this value must satisfy *all* of these types at once."

```typescript
type ID = string | number;              // union -- either is valid
function printId(id: ID) {
  console.log(id);
}
printId("abc123"); // ok
printId(42);        // ok

type Timestamped = { createdAt: Date };
type Named = { name: string };
type NamedEvent = Timestamped & Named;   // intersection -- must have BOTH fields

const event: NamedEvent = { name: "Launch", createdAt: new Date() };
```

## Arrays and tuples — ordered collections, with and without fixed shape

An array type says "a list of this one type, any length." A **tuple** says "a fixed-length list, where each position has its own specific type" — genuinely different guarantees.

```typescript
const scores: number[] = [90, 85, 78];         // array -- any length, all numbers
const alsoScores: Array<number> = [90, 85];     // identical, generic syntax

const point: [number, number] = [10, 20];       // tuple -- exactly 2 numbers, in order
const entry: [string, number] = ["age", 29];    // tuple -- string THEN number, fixed

point[2] = 5;      // Error: tuple has no index 2
entry[0] = 42;      // Error: index 0 must be string, not number
```

A common real use for tuples: React's `useState` returns a tuple (`[value, setValue]`), specifically so that destructuring gets each element's correct, distinct type rather than a generic union of "either could be either."

## Enums — a named set of constant values

An `enum` gives a set of related constant values readable names, instead of scattering "magic strings" or numbers through a codebase.

```typescript
enum OrderStatus {
  Pending,     // 0
  Shipped,     // 1
  Delivered,   // 2
}

function shipOrder(status: OrderStatus) {
  if (status === OrderStatus.Pending) {
    console.log("Shipping now...");
  }
}

shipOrder(OrderStatus.Pending);
```

In practice, many real codebases prefer a union of string literals (`type OrderStatus = "pending" | "shipped" | "delivered"`) over `enum` — it compiles to nothing extra at runtime (true type erasure), while a numeric `enum` actually generates a small runtime object. Both are valid; know that this tradeoff exists rather than defaulting to `enum` automatically.

## Functions with typed parameters and return values

Annotate a function's parameters (required — TypeScript can't guess what a caller will pass) and let it infer the return type, or annotate it explicitly when you want the compiler to hold you to a specific contract even if the implementation changes.

```typescript
function calculateTotal(price: number, quantity: number): number {
  return price * quantity;
}

// Optional parameter -- must come after required ones
function greet(name: string, greeting?: string): string {
  return `${greeting ?? "Hello"}, ${name}`;
}

// Default parameter -- also makes it optional for the caller
function createUser(name: string, role: string = "member") {
  return { name, role };
}

calculateTotal(10);       // Error: expected 2 arguments, got 1
greet("Sam");              // ok -- "Hello, Sam"
greet("Sam", "Hey");        // ok -- "Hey, Sam"
```

## Try It (2 Minutes)

Open the [TypeScript Playground](https://www.typescriptlang.org/play) and write an interface for a `Book` with `title: string`, `pages: number`, and an optional `subtitle?: string`. Then write a function `describeBook(book: Book): string` that returns a sentence using those fields. Try calling it with an object missing `title` — watch the compiler catch it before you ever run the code.
