# TypeScript Certification Guide

## Certifications Available

Unlike Docker (Docker Certified Associate) or several cloud platforms, TypeScript does not have one dominant, widely-recognized proctored certification the way those ecosystems do. TypeScript skill in the real hiring market is overwhelmingly validated through broader "Front End Developer" / "Full Stack Developer" certifications, coding assessments during interviews, and portfolio/GitHub work — not a TypeScript-specific exam that employers commonly reference by name.

| Cert / Credential | Provider | Notes |
|---|---|---|
| **Various "TypeScript" courses with completion certificates** | Coursera, Udemy, freeCodeCamp, and similar platforms | Completion certificates, not proctored exams — genuinely useful for structured learning, but carry little independent weight with employers compared to demonstrated project work `(needs verification — course catalogs and their current offerings change frequently; confirm what's actually live before recommending a specific one)` |
| **Broader front-end/full-stack certifications that include TypeScript** | Various (e.g. Meta's Front-End Developer Professional Certificate on Coursera) | TypeScript is typically one module within a broader curriculum, not the certification's sole focus `(needs verification — curriculum content changes; confirm TypeScript's actual current coverage before treating this as TS-specific credentialing)` |

**The honest framing:** if you're deciding how to spend limited study time, a strong, well-documented TypeScript portfolio project (see the Projects tab) — one that demonstrates generics, discriminated unions, and a real migration or API-typing exercise — carries more real hiring signal for this specific skill than a completion certificate does. This isn't unique to TypeScript; it's broadly true across most individual programming-language skills, which are usually assessed via take-home tests or live coding rather than a proctored language-specific exam.

---

## Core Topics

```typescript
// Interfaces & type aliases
interface User { id: string; name: string; role: "admin" | "member"; }
type ID = string | number;

// Generics
function wrap<T>(value: T): { value: T } {
  return { value };
}

// Utility types
type PartialUser = Partial<User>;
type UserPreview = Pick<User, "id" | "name">;
type PublicUser = Omit<User, "role">;
type UsersById = Record<string, User>;

// Discriminated unions + narrowing
type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "square"; side: number };

function area(shape: Shape): number {
  switch (shape.kind) {
    case "circle": return Math.PI * shape.radius ** 2;
    case "square": return shape.side ** 2;
  }
}

// Conditional types + infer
type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;

// Mapped types
type Readonly2<T> = { readonly [K in keyof T]: T[K] };

// Template literal types
type EventName<T extends string> = `on${Capitalize<T>}`;

// Type guards
function isString(val: unknown): val is string {
  return typeof val === "string";
}
```

```bash
# Compiler quick reference
npx tsc --init          # generate tsconfig.json
npx tsc                 # compile per tsconfig.json
npx tsc --noEmit         # type-check only, no output -- common CI usage
npx tsc --watch           # recompile on save

# tsconfig.json's highest-impact options
# strict: true       -- bundles strictNullChecks, noImplicitAny, and others
# target: "ES2022"   -- output JS version
# module: "NodeNext" -- output module system
# outDir: "./dist"   -- compiled output location
```

## Study Resources

- **TypeScript Handbook** (typescriptlang.org/docs/handbook) — free, comprehensive, and the authoritative official reference
- **TypeScript Playground** (typescriptlang.org/play) — try any snippet instantly, no local install
- **DefinitelyTyped** (github.com/DefinitelyTyped/DefinitelyTyped) — the community `@types` repository; genuinely useful to browse for real-world type-definition patterns
- **Type Challenges** (github.com/type-challenges/type-challenges) — a well-known open-source collection of advanced type-system puzzles, useful specifically for practicing conditional/mapped/infer-based types past the basics

## Revision Notes
```
STRUCTURAL TYPING: shape match, not declared relationship, decides compatibility
TYPE ERASURE: all types stripped at compile time -- zero runtime cost, zero runtime benefit
ANY vs UNKNOWN: any = opt out of checking entirely | unknown = must narrow before use

INTERFACE: merges, extends, object shapes only
TYPE ALIAS: no merging, names anything (unions/tuples/primitives too)

GENERICS: preserve the real type through a function/type instead of falling back to any
UTILITY TYPES: Partial/Pick/Omit/Record -- derived types that stay in sync with the source

NARROWING: typeof / instanceof / discriminated union tag field
STRICT MODE: bundles strictNullChecks + noImplicitAny + others -- enable from day one
```
