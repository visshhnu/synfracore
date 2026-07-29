# Redis — Prerequisites

## What You Need Before Starting

### 1. Basic command-line comfort (required)

Every example in this course runs through `redis-cli` or a Docker container
you start yourself — from Overview's first `docker run` and `SET`/`GET`
commands onward. You don't need shell scripting skill, but you should be
comfortable running commands in a terminal and reading their output.

### 2. Basic programming in any language (recommended)

Most of Fundamentals/Intermediate/Advanced show client code in Python
(`redis-py`), with a Node.js (`ioredis`) example in Installation. You don't
need Python specifically — the patterns (cache-aside, rate limiting,
pipelining) are language-agnostic and the concepts carry over — but comfort
reading basic functions, loops, and dictionaries in some language will make
the code examples land faster.

### 3. Familiarity with what a cache or key-value store is conceptually (helpful)

If "key-value store" and "cache" are unfamiliar terms, Overview and
Fundamentals do introduce them from a reasonable starting point — but some
prior exposure (even just "sometimes apps store data in memory to avoid
hitting the database every time") will make the early material feel less
abstract.

### 4. What you do *not* need yet

- **Prior Redis or NoSQL experience** — this course builds Redis's data
  structures and commands from the ground up in Fundamentals.
- **Distributed systems background** — replication, Sentinel, and Cluster
  are covered in Advanced with the concepts explained as they're
  introduced, not assumed.
- **Deep networking or ops knowledge** — production configuration
  (`redis.conf`, persistence tuning, memory eviction policy) is explained
  in context in Advanced and Troubleshooting, not treated as prior
  knowledge.

### Quick self-check

If asked "why would you use `SET key value NX PX 30000` instead of just
`SETNX key value` followed by a separate `EXPIRE key 30`?" and the answer
isn't obvious yet, that's fine — that's exactly the kind of atomicity
reasoning this course's Intermediate and Interview material is built to
teach, not something you're expected to already know.
