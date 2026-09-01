# REST API Design — Certification Guide

## Certifications Available

Honest framing first: REST API design as a discrete topic doesn't have a dominant, widely-recognized proctored certification the way a specific database or cloud platform does. There's no "REST API Design Associate" exam analogous to, say, a cloud provider's certification track. It's usually assessed in one of two ways in practice:

1. **As part of a broader "API development" or platform-specific certification** — e.g. certifications from API-management vendors (Postman, Apigee, MuleSoft) or general backend/cloud certifications that include an API-design component alongside other material.
2. **Through portfolio review or live design discussion in interviews** — far more common for this specific topic than a proctored exam. A senior backend interview will often include a live "design an API for X" exercise, evaluated on exactly the judgment this course teaches (resource modeling, status code choices, versioning strategy) rather than recall of a spec.

| Cert / Path | Provider | Notes |
|---|---|---|
| **Postman API Fundamentals** | Postman | Free, self-paced; covers API testing/design basics, not exclusively REST design *(needs verification — recheck against current source)* |
| **Platform-specific API certs** (e.g. cloud provider API Gateway certs) | Various | Usually bundle API design alongside implementation/infra topics, not a standalone design cert |
| **Portfolio/interview assessment** | N/A | The most common real-world path for this specific topic — see Projects and Interview tabs |

*(needs verification — recheck against current source; the certification landscape for this specific topic is thin and any provider's offering can change or be discontinued)*

---

## Core Topics

The material any credible assessment of REST API design competency — proctored or interview-based — will actually test:

```http
# Resource modeling
GET    /articles              # list
POST   /articles              # create
GET    /articles/17           # read one
PUT    /articles/17           # replace
PATCH  /articles/17           # partial update
DELETE /articles/17           # remove

# Status codes that come up constantly
200 OK                    # generic success
201 Created                # POST succeeded, resource now exists (often with Location header)
204 No Content              # success, nothing to return (common after DELETE)
400 Bad Request             # malformed request
401 Unauthorized            # not authenticated
403 Forbidden               # authenticated, but not permitted
404 Not Found                # resource doesn't exist
409 Conflict                 # request valid, conflicts with current state
422 Unprocessable Entity     # syntactically valid, semantically invalid
429 Too Many Requests        # rate limited -- pair with Retry-After
500 Internal Server Error    # unexpected server failure
503 Service Unavailable      # server temporarily can't handle the request

# Idempotency key pattern for non-idempotent creates
POST /orders
Idempotency-Key: 7d8f3a2e-91c4-4b77-9c11-2f0a5e8b6d10

# Cursor pagination response
{
  "items": [ /* ... */ ],
  "next_cursor": "eyJpZCI6NjJ9"
}

# Consistent error envelope
{
  "error": { "code": "INVALID_EMAIL", "message": "...", "field": "email" }
}

# Rate-limit response
HTTP/1.1 429 Too Many Requests
Retry-After: 30
```

## Study Resources

- [Fielding's Dissertation, Chapter 5](https://ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm) — the original source, worth reading directly at least once
- [MDN — HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP) — authoritative status code and method reference
- This course's own Interview Prep and Troubleshooting tabs — closer in format to how this topic is actually assessed than any proctored exam

## Revision Notes
```
RESOURCES: nouns in URLs, verbs in methods -- /users not /getUsers
METHODS: GET (idempotent, safe) | POST (not idempotent) | PUT (idempotent, full replace)
         PATCH (partial, not guaranteed idempotent) | DELETE (idempotent)

STATUS: 2xx success | 3xx redirect | 4xx client error | 5xx server error
201 = created | 204 = success, no body | 401 = unauthenticated | 403 = unauthorized
409 = conflict with current state | 422 = semantically invalid | 429 = rate limited

IDEMPOTENCY: matters for safe retries after network failure -- use idempotency
keys on non-idempotent creates (payments, orders)

VERSIONING: URL-path (/v1/, common) vs header-based (Accept header, "purer")
SAFE CHANGE: add optional field | BREAKING CHANGE: remove/rename/retype a field
```
