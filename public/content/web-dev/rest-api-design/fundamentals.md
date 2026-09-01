# REST API Design — Fundamentals

## Resources as nouns, not verbs — the classic `/getUsers` mistake

The single most common beginner mistake in API design is putting the action in the URL: `/getUsers`, `/createUser`, `/deleteUser?id=42`. This duplicates information the HTTP method already carries and produces an inconsistent, ever-growing list of ad-hoc endpoint names. The fix: the URL names a **resource** (a noun — `/users`), and the HTTP method supplies the **action** (a verb):

```http
# Wrong -- verb baked into the URL, method is meaningless (often GET/POST for everything)
GET /getUsers
POST /createUser
GET /deleteUser?id=42

# Right -- resource as noun, method carries the action
GET    /users          -> list users
POST   /users          -> create a user
DELETE /users/42       -> delete user 42
```

Once you commit to nouns-in-URLs, an API's shape becomes self-documenting — a developer can guess `PATCH /users/42` updates user 42 without reading a single line of docs, because the convention is doing the explaining.

## The core HTTP methods and their semantics

Each method carries a specific, well-understood meaning — using the "wrong" one for an operation (e.g. GET to delete something) breaks assumptions clients, proxies, and caches all rely on.

```conceptgrid
{
  "boxes": [
    { "title": "GET", "description": "Read a resource. Safe (no side effects) and idempotent — calling it 1 or 100 times has the same effect", "color": "blue" },
    { "title": "POST", "description": "Create a new resource, or trigger a non-idempotent action. Calling it twice usually creates two things", "color": "green" },
    { "title": "PUT", "description": "Replace a resource entirely. Idempotent — sending the same PUT twice leaves the resource in the same state", "color": "amber" },
    { "title": "PATCH", "description": "Partially update a resource. Not guaranteed idempotent depending on how the patch is expressed", "color": "purple" },
    { "title": "DELETE", "description": "Remove a resource. Idempotent — deleting an already-deleted resource is still \"deleted\"", "color": "red" }
  ]
}
```

```http
GET /articles/17 HTTP/1.1
Host: api.example.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{ "id": 17, "title": "REST API Design", "published": true }
```

## Status code categories — what each range promises

A status code is the first thing client code checks, before it even looks at the body. Getting the range right is what lets a client's generic "did this succeed?" logic work correctly across the entire API, not just one endpoint.

```http
2xx  Success        -- the request was received, understood, and accepted
3xx  Redirection    -- further action needed, usually automatic (follow a new URL)
4xx  Client Error   -- the request itself was wrong (bad input, missing auth, not found)
5xx  Server Error   -- the server failed to fulfill a valid request
```

A client library's default retry logic often keys off exactly this: retry automatically on most 5xx (transient server failure), never automatically retry on 4xx (the request itself needs to change, retrying identically won't help).

## Nesting resources in URLs — expressing relationships

When a resource genuinely belongs to a parent, nesting the URL expresses that relationship directly:

```http
GET /users/42/orders          # all orders belonging to user 42
GET /users/42/orders/991      # order 991, specifically user 42's
POST /users/42/orders         # create a new order under user 42
```

Nesting more than 2-3 levels deep (`/users/42/orders/991/items/3/reviews`) usually signals it's time to give the deeply-nested resource its own top-level, filterable endpoint instead (`GET /reviews?item_id=3`) — deep nesting makes URLs harder to construct correctly and doesn't scale well as relationships grow.

## Request/response body shape — JSON as the default contract

Most modern REST APIs use JSON for both request and response bodies. The body's shape is itself part of the API's design surface — consistent field naming (`snake_case` or `camelCase`, pick one and never mix), consistent date formats (ISO 8601 — `"2026-09-01T14:30:00Z"`), and consistent nesting conventions all reduce the amount a client has to guess.

```http
POST /orders HTTP/1.1
Content-Type: application/json

{
  "item_id": "sku-4471",
  "quantity": 2,
  "shipping_address": { "city": "Bengaluru", "postal_code": "560001" }
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json
Location: /orders/991

{
  "id": 991,
  "item_id": "sku-4471",
  "quantity": 2,
  "status": "pending",
  "created_at": "2026-09-01T14:30:00Z"
}
```

## Headers' role — metadata that travels alongside the body

Headers carry information that isn't the data itself but affects how it's interpreted or handled:

```http
Content-Type: application/json         # tells the receiver how to parse the body
Authorization: Bearer eyJhbGciOi...    # identity/credentials for this request
Accept: application/json               # tells the server what response format the client wants
```

`Content-Type` and `Authorization` are the two you'll see constantly: `Content-Type` on both requests (what you're sending) and responses (what you're getting back); `Authorization` on requests that require identifying who's calling. This platform's later **Authentication** technology covers `Authorization` header mechanics (tokens, sessions) in implementation depth — here, the point is just that authentication and authorization are conveyed via headers, not embedded in the URL or body.

## Try It (2 Minutes)

Design (on paper, no server needed) the URL + method + expected success status code for: "a client wants to mark comment `55` on post `12` as resolved, without changing anything else about the comment." (One reasonable answer: `PATCH /posts/12/comments/55` with body `{"resolved": true}`, status `200 OK` — PATCH because it's a partial update, not a full replace.)
