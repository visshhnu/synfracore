# Apache Airflow — Common Failure Patterns

Unlike some Real World pages on this site that cite specific, dated, publicly-documented incidents, the patterns below are **composite and illustrative** — synthesized from failure modes that recur across real Airflow production work, not write-ups of one specific, named, citable incident.

## The catchup backfill that overwhelmed a downstream system

A common, recurring pattern: a DAG is deployed with a `start_date` set months or years in the past (sometimes copy-pasted from another DAG template without adjusting it) and `catchup` left at a permissive default — on deployment, Airflow immediately triggers a large wave of backfilled runs, all hitting the same downstream API or database simultaneously, in a way the downstream system was never sized to handle. The result ranges from a downstream rate-limit lockout to a genuine downstream outage, caused entirely by an orchestration configuration mistake, not by any actual problem in the downstream system itself.

**Lesson:** `catchup`/`start_date` (see Fundamentals) aren't just scheduling-semantics trivia — a mismatched configuration is a real, common way to accidentally generate a traffic spike against a downstream system, and it's exactly why this page recommends `catchup=False` as the safer default unless backfilling is a deliberate, sized-for choice.

## The non-idempotent task that silently duplicated data for months

A common, gradual pattern: a task appends output on every run rather than overwriting/upserting by logical date — this works invisibly for a long time, since most runs succeed on the first attempt and never trigger a retry or manual re-run. Then a transient failure eventually does trigger a retry (exactly the scenario idempotency exists to handle safely), and the task's append-based logic silently duplicates that run's data — often not discovered until a downstream report or aggregation looks subtly wrong, well after the actual duplication occurred, making root-cause tracing genuinely difficult after the fact.

**Lesson:** idempotency (see Intermediate) isn't a theoretical concern that only matters in edge cases — it's specifically the retry/re-run scenario, which is a normal, expected part of operating Airflow, not a rare occurrence, that makes a non-idempotent task's flaw eventually surface in production.

## The sensor left in `poke` mode that quietly starved the worker pool

A common pattern as an Airflow deployment grows: several sensors are written using the default `poke` mode, each individually reasonable when the deployment was small — but as more sensors accumulate, each holding a worker slot for its entire (sometimes multi-hour) wait, the pool of available workers for actual task execution shrinks, and unrelated DAGs start experiencing tasks stuck in "queued" state with no obvious individual cause, since no single sensor is "broken," they're collectively consuming capacity that was never designed to be held this way at this volume.

**Lesson:** `mode="reschedule"` (see Intermediate/Cheatsheet) isn't a minor optimization — at real scale, sensor mode choice is a genuine capacity-planning decision, and a deployment that grew organically without this consideration can hit a real capacity wall that looks like "random" queued-task problems until someone traces it back to accumulated poking sensors specifically.
