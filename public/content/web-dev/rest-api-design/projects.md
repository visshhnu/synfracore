# REST API Design — Portfolio Projects

## Project 1

**Level:** Beginner
**Time:** 4-6 hours
**GitHub repo name:** `api-redesign-audit`

**What you build:** Take a deliberately poorly-designed sample API (verb-in-URL endpoints, inconsistent status codes, no clear resource model — write one yourself as the "before," or use a known bad example) and produce a full redesign: corrected URLs and methods for every endpoint, corrected status codes for every success/failure case, and a written rationale document explaining *why* each change was made, not just what changed. This is a design exercise first, implementation second — the write-up is the actual deliverable a reviewer will read closely.

## Project 2

**Level:** Intermediate
**Time:** 10-15 hours
**GitHub repo name:** `paginated-filterable-api`

**What you build:** Design and implement (any language/framework — this academy's Express technology is a natural choice) a fully paginated and filterable resource endpoint for a dataset of meaningful size (1000+ synthetic records is enough to make offset-pagination's weaknesses visible). Implement both offset-based and cursor-based pagination on the same endpoint (behind a query parameter choosing the mode), and write up the concrete performance/consistency difference you observe between them as the dataset grows and mutates during pagination.

## Project 3

**Level:** Advanced
**Time:** 15-20 hours
**GitHub repo name:** `versioned-api-migration`

**What you build:** Design a `v1` API, then design and implement a `v2` that includes at least one genuinely breaking change (a renamed field, a restructured response shape) alongside at least one safe additive change — running both versions side by side. Write a documented migration guide for a hypothetical existing `v1` client, including a deprecation timeline and exactly what breaks if they don't migrate. This project is specifically about demonstrating you can ship a breaking change *without* breaking existing consumers overnight — the discipline, not just the code.
