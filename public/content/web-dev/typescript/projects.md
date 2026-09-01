# TypeScript — Portfolio Projects

## Project 1: Strongly-Typed API Client

**Level:** Beginner-Intermediate | **Time:** 4-6 hours | **GitHub repo name:** `ts-api-client`

**What you build:** a small, reusable wrapper around `fetch` that's generic over the expected response shape, so every call site gets a correctly-typed result with no manual casting.

```typescript
interface ApiError {
  message: string;
  status: number;
}

async function apiGet<T>(url: string): Promise<T> {
  const res = await fetch(url);
  if (!res.ok) {
    const error: ApiError = { message: res.statusText, status: res.status };
    throw error;
  }
  return res.json() as Promise<T>;
}

interface User {
  id: string;
  name: string;
  email: string;
}

async function loadUser(id: string): Promise<User> {
  return apiGet<User>(`/api/users/${id}`);
}

// Every caller gets the actual User shape, fully typed, with no casting
// at the call site itself:
const user = await loadUser("u1");
console.log(user.name.toUpperCase()); // TypeScript knows .name is a string
```

Extend it further: add typed query parameters, a generic `apiPost<TBody, TResponse>`, and centralized error handling that narrows `ApiError` from a caught `unknown`.

---

## Project 2: Generic Data-Structure Library

**Level:** Intermediate | **Time:** 6-10 hours | **GitHub repo name:** `ts-data-structures`

**What you build:** a small library of classic data structures (a stack, a queue, a linked list) implemented generically, so they work correctly and safely with any element type.

```typescript
class Stack<T> {
  private items: T[] = [];

  push(item: T): void {
    this.items.push(item);
  }

  pop(): T | undefined {
    return this.items.pop();
  }

  peek(): T | undefined {
    return this.items[this.items.length - 1];
  }

  get size(): number {
    return this.items.length;
  }

  isEmpty(): boolean {
    return this.items.length === 0;
  }
}

const numberStack = new Stack<number>();
numberStack.push(1);
numberStack.push(2);
console.log(numberStack.pop()); // 2, typed as number | undefined

interface Task { id: string; title: string; }
const taskStack = new Stack<Task>();
taskStack.push({ id: "t1", title: "Write docs" });
```

Extend it further: implement a generic binary search tree with a comparator function parameter, and a typed event emitter (`on<K extends keyof Events>(event: K, handler: (payload: Events[K]) => void)`) — a genuinely common real-world generic pattern.

---

## Project 3: Migrating a Small JavaScript Project to Strict TypeScript

**Level:** Intermediate-Advanced | **Time:** 8-12 hours | **GitHub repo name:** `js-to-ts-migration`

**What you build:** take an existing small JavaScript project (or write a deliberately loose ~200-300 line one first), convert it file-by-file to `.ts`, and get it passing under `strict: true` — documenting every real bug the conversion surfaced along the way.

```typescript
// Before -- plain JavaScript, silently allows a wrong shape
// function calculateDiscount(order) {
//   return order.total * (order.discountRate || 0);
// }
// calculateDiscount({ total: 100 }); // "works", returns 0, hides a real bug
//   above: caller forgot discountRate entirely -- no error, no signal

// After -- converted to strict TypeScript
interface Order {
  total: number;
  discountRate: number;   // now REQUIRED -- the type documents the real contract
}

function calculateDiscount(order: Order): number {
  return order.total * order.discountRate;
}

calculateDiscount({ total: 100 });
// Error: Property 'discountRate' is missing in type '{ total: number }'
// -- exactly the bug the JS version was silently hiding, now caught
// before the code ever runs
```

Document, as part of the project's README, each specific bug `strict` mode surfaced during the conversion (a missing null check, an implicitly-`any` parameter, a wrong-shaped object) — this is genuinely strong portfolio material, because it demonstrates the *value* of the conversion concretely, not just that the file extension changed.
