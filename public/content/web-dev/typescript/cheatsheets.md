# TypeScript Quick Reference

## Basic Types

```typescript
let a: string = "hi";
let b: number = 5;
let c: boolean = true;
let d: null = null;
let e: undefined = undefined;
let f: any = "avoid this";
let g: unknown = "prefer this for genuinely unknown data";

let arr: number[] = [1, 2, 3];
let arr2: Array<number> = [1, 2, 3];
let tuple: [string, number] = ["age", 29];

enum Status { Pending, Shipped, Delivered }
type StatusLiteral = "pending" | "shipped" | "delivered"; // often preferred over enum
```

## Objects: interface & type

```typescript
interface User {
  id: string;
  name: string;
  email?: string;        // optional
  readonly createdAt: Date; // set once, never reassigned
}

type Point = { x: number; y: number };

interface Admin extends User {
  permissions: string[];
}

type AdminAlt = User & { permissions: string[] }; // intersection, same result
```

## Unions, Narrowing & Discriminated Unions

```typescript
type ID = string | number;

function isString(x: unknown): x is string {
  return typeof x === "string";
}

type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "square"; side: number };

function area(s: Shape) {
  switch (s.kind) {
    case "circle": return Math.PI * s.radius ** 2;
    case "square": return s.side ** 2;
  }
}
```

## Functions

```typescript
function add(a: number, b: number): number { return a + b; }
const multiply = (a: number, b: number): number => a * b;

function greet(name: string, greeting?: string): string {
  return `${greeting ?? "Hello"}, ${name}`;
}

function log(msg: string, ...rest: unknown[]): void { console.log(msg, ...rest); }

// Function type as a value
type BinaryOp = (a: number, b: number) => number;
const subtract: BinaryOp = (a, b) => a - b;
```

## Generics

```typescript
function identity<T>(x: T): T { return x; }

interface Box<T> { value: T; }

function firstOf<T extends { length: number }>(arr: T[]): T { return arr[0]; }

class Stack<T> {
  private items: T[] = [];
  push(item: T) { this.items.push(item); }
  pop(): T | undefined { return this.items.pop(); }
}
```

## Built-in Utility Types

```typescript
Partial<User>          // every property optional
Required<User>          // every property required
Readonly<User>           // every property readonly
Pick<User, "id" | "name">   // only listed keys
Omit<User, "email">          // everything except listed keys
Record<string, User>          // dictionary keyed by string
ReturnType<typeof someFn>       // extract a function's return type
Parameters<typeof someFn>        // extract a function's parameter tuple
Awaited<ReturnType<typeof asyncFn>> // unwrap a Promise's resolved type
Exclude<"a" | "b" | "c", "a">        // "b" | "c"
Extract<"a" | "b" | "c", "a" | "z">   // "a"
NonNullable<string | null | undefined> // string
```

## Advanced: Conditional, Mapped, Template Literal Types

```typescript
type IsString<T> = T extends string ? true : false;

type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;

type ReadonlyAll<T> = { readonly [K in keyof T]: T[K] };
type Nullable<T> = { [K in keyof T]: T[K] | null };

type Direction = "top" | "bottom";
type Side = "left" | "right";
type Corner = `${Direction}-${Side}`; // "top-left" | "top-right" | ...
```

## tsconfig.json — most-used options

```json
{
  "compilerOptions": {
    "strict": true,
    "target": "ES2022",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "outDir": "./dist",
    "rootDir": "./src",
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"]
}
```

## CLI

```bash
npx tsc --init          # generate a tsconfig.json
npx tsc                  # compile per tsconfig.json
npx tsc --noEmit          # type-check only, no output (common in CI)
npx tsc --watch            # recompile on save
npx tsx src/index.ts        # run a .ts file directly, no separate compile step
```
