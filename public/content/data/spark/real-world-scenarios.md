# Apache Spark — Common Failure Patterns

Unlike some Real World pages on this site that cite specific, dated, publicly-documented incidents, the patterns below are **composite and illustrative** — synthesized from failure modes that recur across real Spark production work, not write-ups of one specific, named, citable incident. Treat them as "this class of mistake is common and worth designing against."

## The `.collect()` that took down the driver

A common, recurring pattern: a job that works fine in development against a small sample dataset calls `.collect()` to pull a DataFrame's full contents back to the driver for some downstream processing — and in production, against the real, much larger dataset, this either exhausts driver memory outright or degrades performance dramatically, since `.collect()` defeats the entire point of distributed processing by pulling everything onto a single machine. This is exactly why Fundamentals and Troubleshooting both flag `.collect()` specifically as a common driver-OOM cause, not a hypothetical edge case.

**Lesson:** code that works on a small local sample doesn't automatically work at production data volume — `.collect()`, `.toPandas()`, and similar "pull everything to one machine" operations need explicit justification (a genuinely small, bounded result set) rather than being used out of habit from smaller-scale development and testing.

## The join that quietly got slower every month

A common, gradual real pattern: a join against a "small" lookup table works efficiently via automatic broadcast joining when the table was genuinely small — but the lookup table grows over time (more product categories added, more regions, more reference data), eventually crossing the broadcast-join size threshold without anyone noticing, and the job silently falls back to a full shuffle join. Because the degradation is gradual, it's often not investigated until job runtime has become a real, visible problem, at which point tracing the cause back to a table that grew past a threshold takes real diagnostic work.

**Lesson:** an optimization that depends on a table staying small is a real, ongoing assumption worth monitoring, not a one-time decision — checking whether "reference" or "lookup" tables have grown into genuinely large tables over time is a real, useful periodic review, not paranoia.

## The skewed key that made everyone think the cluster needed more resources

A common misdiagnosis pattern: a job with severe data skew (one or a few keys with disproportionately many rows) runs slowly, and the reflexive response is to add more executors/resources to the cluster — which doesn't actually help, because the bottleneck is the single skewed partition/task that no amount of additional parallel capacity speeds up, since that one task still has to process its disproportionate share of data on its own. Only after checking the Spark UI's task-level timing (see Troubleshooting/Advanced) does the actual cause — a small number of dramatically slower tasks, not overall resource scarcity — become visible.

**Lesson:** "the job is slow" has genuinely different root causes with genuinely different fixes — more cluster resources solves a resource-scarcity problem, but does nothing for a skew problem, and treating every slow-job symptom as a resource problem by default (without checking the Spark UI first) leads to real, wasted cost without actually fixing the underlying issue.
