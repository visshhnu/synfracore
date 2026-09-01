# REST API Design — Advanced

## API versioning strategies — URL-path vs. header-based

An API will eventually need a breaking change — a field renamed, a response shape restructured — and existing clients can't be forced to update the instant that happens. Versioning is how an API ships a breaking change without breaking every consumer at once.

**URL-path versioning** — the version lives directly in the URL:

```http
GET /v1/users/42
GET /v2/users/42
```

Simple, visible at a glance, trivially cacheable by URL, and easy to test with a bare `curl` or browser. The tradeoff: it "pollutes" every URL in the API, and teams sometimes over-use it — bumping a major version for a change that could have been additive instead.

**Header-based versioning** — the URL stays stable, the version is negotiated via a header:

```http
GET /users/42 HTTP/1.1
Accept: application/vnd.example.v2+json
```

Keeps URLs clean and arguably more "correct" from a pure-REST standpoint (a resource's identity/URL shouldn't change just because its representation format did), but it's less discoverable — a developer can't tell the version from the URL alone, and it's harder to test casually.

In practice, URL-path versioning is the more common real-world default specifically because of that visibility and ease-of-use for consumers — most public APIs (Stripe, GitHub, Twilio, among many others) use it, even though it's arguably the less "pure" REST approach *(needs verification — recheck against current source; specific companies' exact versioning schemes can change)*.

## Designing for backward compatibility — safe vs. breaking changes

Not every change requires a new version. The distinction that matters:

```conceptgrid
{
  "boxes": [
    { "title": "Safe (non-breaking)", "description": "Adding a new optional field to a response. Adding a new optional query parameter. Adding a new endpoint entirely", "color": "green" },
    { "title": "Breaking — requires a new version", "description": "Removing or renaming a field. Changing a field's type or meaning. Changing a status code an existing endpoint returns for an existing scenario", "color": "red" }
  ]
}
```

A well-behaved client is expected to ignore fields it doesn't recognize — which is exactly what makes adding a new field safe, and removing/renaming one dangerous: any client that *was* reading that field breaks the moment it's gone, with no warning. The practical discipline: treat every response shape as a contract, and audit any proposed change against "would an existing client, written against the current shape, break?" before shipping it without a version bump.

## Rate limiting design

A rate limit protects the API from being overwhelmed by any single client (deliberately or accidentally) — and needs to communicate its state clearly enough that well-behaved clients can back off correctly rather than hammering a failing endpoint.

```http
HTTP/1.1 429 Too Many Requests
Retry-After: 30
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 0
X-RateLimit-Reset: 1735689600

{ "error": { "code": "RATE_LIMITED", "message": "Too many requests, retry after 30 seconds" } }
```

`429` is the specific status code for this — not `403` (which implies a permissions problem, not a temporary throttle) and not `503` (which implies the *server* is overloaded, a different failure mode). `Retry-After` tells a well-behaved client exactly how long to wait before retrying, which is the actual point of the design — without it, a client is left guessing and may retry immediately, making the overload worse rather than better.

## Authentication/authorization at the API-design level

This course covers authentication and authorization only at the design-decision level — where credentials go, and what status code an API returns for each failure mode. This platform's dedicated **Authentication** technology (later in this academy) covers actual implementation depth: sessions, JWTs, OAuth flows, and how to wire them into a real server.

At the design level, the decisions that matter:

- Credentials travel in the `Authorization` header (`Authorization: Bearer <token>`), never as a URL query parameter — URLs end up in server logs, browser history, and `Referer` headers, all of which leak a token that shouldn't be logged anywhere.
- **401 Unauthorized** — no valid credentials presented at all (missing or invalid token).
- **403 Forbidden** — credentials are valid, but this identity isn't permitted to perform this specific action.

```http
GET /admin/users HTTP/1.1
Authorization: Bearer <valid-but-non-admin-token>
```
```http
HTTP/1.1 403 Forbidden

{ "error": { "code": "FORBIDDEN", "message": "This action requires admin privileges" } }
```

Getting 401 vs. 403 right matters for a client's error handling — 401 usually means "re-authenticate" (redirect to login), 403 means "this identity, correctly authenticated, simply can't do this" (no re-login will fix it).

## Error response body design — one consistent shape across the entire API

The single highest-leverage design decision for API error handling: define one error envelope, used by every endpoint, rather than letting each handler invent its own shape.

```http
HTTP/1.1 422 Unprocessable Entity
Content-Type: application/json

{
  "error": {
    "code": "INVALID_EMAIL",
    "message": "email must be a valid email address",
    "field": "email"
  }
}
```

Key design choices worth being deliberate about:

- **A machine-readable `code`**, not just a human-readable `message` — client code should branch on `code` (stable, versioned deliberately), never on `message` text (which can change wording without warning and silently break string-matching client code).
- **One envelope shape everywhere** (`{ "error": { ... } }`) — enforced at the framework/middleware level, not left to individual handlers, so a client can write one generic error parser for the whole API instead of one per endpoint.
- **`field`, when relevant**, pointing at exactly which input caused a validation failure — genuinely useful for form-validation UIs mapping API errors back to specific inputs.

## Try It (2 Minutes)

An existing `GET /orders/42` endpoint currently returns `{ "id": 42, "total": 99.99 }`. Design the change to add a `currency` field to every order response — decide whether this requires a version bump, and justify the answer using the safe-vs-breaking distinction above.
