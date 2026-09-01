# REST API Design — Intermediate

## PUT vs. PATCH — a genuinely common point of confusion

Both "update" a resource, but they mean different things, and mixing them up causes real bugs.

**PUT** replaces the resource entirely — the request body is the resource's new complete state. Any field you don't include is treated as absent/cleared, not "left alone":

```http
PUT /users/42 HTTP/1.1
Content-Type: application/json

{ "name": "Alice Smith", "email": "alice@example.com" }
# If user 42 previously also had a "phone" field, a strict PUT
# implementation clears it -- it wasn't included in this replacement.
```

**PATCH** applies a partial change — only the included fields change, everything else on the resource stays exactly as it was:

```http
PATCH /users/42 HTTP/1.1
Content-Type: application/json

{ "email": "alice.smith@example.com" }
# Only email changes. name, phone, and every other field are untouched.
```

The practical rule: if the client is sending "here's everything about this resource now," use PUT. If the client is sending "change just this one thing," use PATCH. Using PUT for what's semantically a partial update is the exact mistake that silently wipes fields a client didn't intend to touch.

## Idempotency — which methods are, and why it matters for retries

An operation is **idempotent** if calling it once has the same end effect as calling it many times. This isn't an abstract property — it's the deciding factor in whether a client can safely retry after a network failure.

```conceptgrid
{
  "boxes": [
    { "title": "GET — idempotent", "description": "Reading never changes state, safe to retry any number of times", "color": "blue" },
    { "title": "PUT — idempotent", "description": "Replacing with the same body twice leaves the same end state", "color": "green" },
    { "title": "DELETE — idempotent", "description": "Deleting an already-deleted resource is still \"deleted\" -- same end state", "color": "amber" },
    { "title": "POST — NOT idempotent", "description": "Retrying a create can produce a second resource -- the classic double-order bug", "color": "red" }
  ]
}
```

Consider a client that calls `POST /orders`, the network times out before the response arrives, and the client — having no way to know if the order was actually created — retries. If the first request *did* succeed server-side, the retry creates a **second, duplicate order**. This is exactly why payment/order APIs commonly require an explicit **idempotency key**:

```http
POST /orders HTTP/1.1
Idempotency-Key: 7d8f3a2e-91c4-4b77-9c11-2f0a5e8b6d10
Content-Type: application/json

{ "item_id": "sku-4471", "quantity": 2 }
```

The server records the key alongside the result of the first request with that key; a retried request carrying the same key returns the original result instead of creating a second order. GET, PUT, and DELETE don't need this pattern — they're naturally idempotent, so a client can just retry them directly.

## Pagination strategies — offset vs. cursor

**Offset-based** (`?page=3&limit=20` or `?offset=40&limit=20`) is simple and lets a client jump to an arbitrary page, but has a real weakness on large or actively-changing datasets: the database still has to scan past all skipped rows (slow at high offsets), and if rows are inserted or deleted between page requests, results can skip or duplicate items.

```http
GET /articles?offset=40&limit=20
```

**Cursor-based** (`?cursor=eyJpZCI6NDJ9`) uses an opaque pointer to "the last item you saw" rather than a numeric position, avoiding both problems — but it doesn't support "jump to page 50" directly, only "give me the next page from here."

```http
GET /articles?cursor=eyJpZCI6NDJ9&limit=20 HTTP/1.1
```

```http
HTTP/1.1 200 OK

{
  "items": [ /* 20 articles */ ],
  "next_cursor": "eyJpZCI6NjJ9"
}
```

For a large, frequently-mutating dataset (a social feed, a live orders table), cursor-based pagination is the more robust default. For a small, mostly-static, or admin-only dataset, offset's simplicity is often the better tradeoff.

## Filtering and sorting — query-parameter conventions

Query parameters are the standard place for optional filters and sort order — they don't change *which* resource collection you're addressing, just how it's narrowed and ordered:

```http
GET /orders?status=pending&sort=-created_at&limit=25
# status=pending    -- filter
# sort=-created_at  -- sort descending by created_at (a common convention: "-" prefix = descending)
# limit=25          -- page size
```

Keep filter/sort parameter names consistent across every endpoint in the API (`sort`, not `sort` on one endpoint and `order_by` on another) — this is exactly the kind of small inconsistency that quietly increases integration effort across an entire API surface.

## HATEOAS — the purist ideal, rarely fully implemented

**HATEOAS** (Hypermedia As The Engine Of Application State) is part of Fielding's original REST description: a response should include links describing what a client can do *next*, so a client discovers available actions dynamically rather than hardcoding URL patterns in advance:

```json
{
  "id": 991,
  "status": "pending",
  "links": {
    "self": "/orders/991",
    "cancel": "/orders/991/cancel",
    "customer": "/users/42"
  }
}
```

Being honest about where this actually stands in practice: HATEOAS is widely considered the "purist" REST ideal, and genuinely few production APIs implement it fully — most clients are written against fixed documentation/URL patterns rather than following links dynamically, which somewhat defeats HATEOAS's own premise. It's worth knowing what the term means and recognizing a `links`/`_links` field when you see one, but don't treat its absence as a design flaw in an otherwise well-built API — the overwhelming majority of real-world "RESTful" APIs skip it.

## Try It (2 Minutes)

A client needs to update just the `status` field on order `991`, and separately needs to guarantee that retrying a failed "place order" request never double-charges the customer. Write the two requests (method, URL, relevant headers) that correctly handle each case.
