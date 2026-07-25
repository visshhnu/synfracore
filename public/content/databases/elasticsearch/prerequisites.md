# Elasticsearch — Prerequisites

## What You Need Before Starting

Elasticsearch sits at an interesting intersection — it's queried via JSON over HTTP (accessible even without deep prior database experience), but reasoning well about it benefits from some general data and infrastructure background.

### 1. Comfort with JSON (required)

Elasticsearch documents, mappings, and the entire Query DSL are expressed in JSON — if reading and writing nested JSON objects feels natural, you're most of the way to reading this course's examples fluently. If JSON itself is new, spend a little time there first.

### 2. Basic command-line / curl familiarity (required)

This course's examples are heavily `curl`-based against Elasticsearch's REST API — comfort running command-line HTTP requests (or willingness to learn just enough `curl` syntax to follow along) removes real friction. Tools like Kibana's Dev Tools console or Postman can substitute for hands-on practice if you prefer a GUI, but the underlying HTTP request/JSON body concepts are the same either way.

### 3. Some general database or data-modeling background (recommended, not required)

You don't need prior SQL or NoSQL experience specifically, but having thought at all about "how should data be structured for the queries I need to run" makes Elasticsearch's mapping and indexing concepts land as genuine design decisions rather than arbitrary configuration. If you've completed this platform's SQL or MongoDB material first, several concepts transfer usefully as contrast — Elasticsearch's `text` vs. `keyword` field distinction, for instance, is often best understood in relation to how a relational database would (or wouldn't) let you both search and exactly-match/aggregate on the same underlying data.

### 4. Basic understanding of what "full-text search" actually means, conceptually (helpful)

Understanding, even informally, that searching for "running shoes" should probably also match a document containing "run shoe" (via stemming) — and that this is fundamentally different from an exact string match — helps the analyzer/tokenization material land as "here's the actual mechanism behind something I already expect search to do" rather than new, abstract theory.

### 5. A place to actually run queries — required, not optional reading

- **Docker** (`docker run elasticsearch:8.x` or the current version) — fastest local setup for hands-on practice
- **Elastic Cloud free trial** — closest to a real production-shaped deployment without local setup
- **Kibana's Dev Tools console**, paired with either of the above — a genuinely convenient way to write and run queries interactively with syntax help, rather than hand-crafting every `curl` command

### 6. What you do *not* need yet

- Deep Java/JVM tuning expertise — this course covers the practical heap-sizing guidance you need (roughly 50% of RAM, capped near 31GB) without requiring you to understand JVM internals deeply
- Prior experience with a different search engine (Solr, Algolia) — helpful context if you have it, but Elasticsearch's concepts are covered from a reasonable starting point here
- Distributed systems theory beyond a practical understanding of quorum/majority voting — this course explains the specific "why 3 master nodes" reasoning directly, rather than assuming prior formal distributed-systems coursework

### Quick self-check

Given the requirement "users should be able to search product descriptions by typed keywords, but also filter and sort exactly by an exact `category` value" — can you already guess, even before reading this course's Fundamentals section, that these two needs probably require mapping the same underlying field two different ways? If that intuition is already there, you're off to a strong start. If not, that's completely fine — this exact "text vs. keyword, and why you often want both" realization is one of the very first concepts this course builds deliberately, precisely because it trips up almost everyone coming from a purely relational-database background.
