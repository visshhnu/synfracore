# REST API Design Quick Reference

## HTTP Methods

| Method | Purpose | Idempotent? | Safe? | Typical success code |
|---|---|---|---|---|
| GET | Read a resource | Yes | Yes (no side effects) | 200 |
| POST | Create a resource / trigger a non-idempotent action | No | No | 201 |
| PUT | Replace a resource entirely | Yes | No | 200 / 204 |
| PATCH | Partially update a resource | Not guaranteed | No | 200 / 204 |
| DELETE | Remove a resource | Yes | No | 204 |

## Status Code Reference

| Code | Name | Meaning | When to use |
|---|---|---|---|
| 200 | OK | Generic success | Successful GET/PUT/PATCH with a body to return |
| 201 | Created | Resource was created | After a successful POST, often with `Location` header |
| 204 | No Content | Success, nothing to return | After a successful DELETE, or a PUT/PATCH with no body needed |
| 301/302 | Redirect | Resource moved | Rare in API design; more common for web pages |
| 400 | Bad Request | Malformed request | Invalid JSON, missing required field structurally |
| 401 | Unauthorized | Not authenticated | Missing or invalid credentials |
| 403 | Forbidden | Authenticated, not permitted | Valid credentials, insufficient permission |
| 404 | Not Found | Resource doesn't exist | Requested URL/resource ID not found |
| 405 | Method Not Allowed | Method not supported on this resource | e.g. DELETE on a read-only endpoint |
| 409 | Conflict | Request valid, conflicts with current state | Duplicate email, optimistic-lock version mismatch |
| 422 | Unprocessable Entity | Syntactically valid, semantically invalid | Failed validation rules (bad email format, out-of-range value) |
| 429 | Too Many Requests | Rate limited | Pair with `Retry-After` header |
| 500 | Internal Server Error | Unexpected server failure | Unhandled exception, bug |
| 503 | Service Unavailable | Server temporarily can't handle requests | Overload, maintenance, dependency down — pair with `Retry-After` |

## Common URL Pattern Examples

```http
GET    /users                    # list users
POST   /users                    # create a user
GET    /users/42                 # read user 42
PUT    /users/42                 # replace user 42
PATCH  /users/42                 # partially update user 42
DELETE /users/42                 # delete user 42

GET    /users/42/orders          # list user 42's orders (nested resource)
POST   /users/42/orders          # create an order under user 42
GET    /users/42/orders/991      # read a specific nested order

GET    /orders?status=pending&sort=-created_at&limit=25   # filter + sort + paginate
GET    /orders?cursor=eyJpZCI6NDJ9&limit=20                # cursor pagination

GET    /v1/users/42              # URL-path versioning
GET    /users/42                 # header-based versioning (Accept: ...v2+json)
```

## Header Reference

| Header | Direction | Purpose |
|---|---|---|
| `Content-Type` | Request & Response | Format of the body (e.g. `application/json`) |
| `Accept` | Request | Format the client wants back |
| `Authorization` | Request | Credentials (`Bearer <token>`) — never in the URL |
| `Location` | Response | URL of a newly created resource (with 201) |
| `Idempotency-Key` | Request | Client-supplied key to dedupe retried non-idempotent creates |
| `Retry-After` | Response | Seconds to wait before retrying (used with 429, 503) |
| `X-RateLimit-Limit` / `-Remaining` / `-Reset` | Response | Rate-limit state — common but not standardized *(needs verification — recheck against current source)* |
| `ETag` / `If-None-Match` | Response / Request | Caching / optimistic-concurrency validation |
