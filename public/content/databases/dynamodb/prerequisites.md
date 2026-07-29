# DynamoDB — Prerequisites

## What You Need Before Starting

### 1. An AWS account and basic AWS CLI familiarity (required)

Every example in this course — from Overview's first `aws dynamodb
create-table` command onward — runs against real AWS CLI syntax or the
`boto3` Python SDK. You don't need broad AWS experience, but comfort running
AWS CLI commands (or willingness to set up a free-tier AWS account and
follow along) is assumed throughout, not taught as a separate topic here.

### 2. Basic Python (helpful, not a hard blocker)

Most of this course's CRUD and data-modeling examples use `boto3`, AWS's
Python SDK. You don't need to be a Python developer, but recognizing basic
syntax (dictionaries, function calls, list comprehensions) will make the
examples land faster — the AWS CLI equivalents are shown alongside in
several places if Python specifically isn't comfortable yet.

### 3. Comfort with JSON-like key-value structures (helpful)

DynamoDB items are attribute-based (not rows with fixed columns), and the
CLI's own item syntax is JSON with explicit type markers (`{"S": "value"}`
for a string, `{"N": "123"}` for a number). If JSON itself is unfamiliar,
spend a little time there first — it's used throughout, not introduced
separately.

### 4. What you do *not* need yet

- **Prior NoSQL database experience** — this course builds DynamoDB's
  specific concepts (partition/sort keys, single-table design, GSIs/LSIs)
  from a reasonable starting point, not assuming familiarity with a
  different NoSQL system.
- **Prior relational database experience** — genuinely not required, though
  this course's own Roadmap notes that access-pattern-first modeling is "a
  real mindset shift for anyone coming from relational database
  experience" — if that's your background, expect to consciously set aside
  entity-first/normalization instincts rather than transfer them directly,
  not to already have the right instinct going in.
- **Deep AWS ecosystem knowledge** — Lambda, IAM, and CloudWatch appear in
  later sections (Streams, monitoring) but are explained in the context
  they're used, not assumed as prior AWS platform expertise.

### Quick self-check

Given the requirement "get a user's profile and their 20 most recent orders
in a single request," would your first instinct be a `users` table joined
against an `orders` table (the relational instinct), or a single item
collection keyed so one query returns everything (the DynamoDB instinct)?
If the relational answer came first, that's normal, not a gap — it's exactly
the instinct this course's Fundamentals and Intermediate material is built
to retrain, not a sign you're starting from the wrong place.
