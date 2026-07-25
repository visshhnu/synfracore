# Elasticsearch — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Elasticsearch incidents industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The cluster that turned yellow and nobody noticed until it turned red

**The pattern:** A team runs a single-node Elasticsearch cluster for months (a common, reasonable starting point for a small deployment), where cluster health has permanently shown "yellow" the entire time — expected and harmless on a single node, since replica shards genuinely can't be assigned anywhere else. Nobody set up alerting specifically for cluster health, since "yellow" had been the accepted, normal baseline from day one. When the team later adds a second node and forgets to actually verify replica shards get assigned to it, the cluster silently stays yellow for an entirely different reason — and months later, when the original node's disk fails, the primary shards on it are lost entirely, because the replicas that were supposed to exist on the second node were never actually allocated.

**Why "yellow is normal for us" became a dangerous assumption:** the team's baseline expectation ("yellow is fine, that's just how our single-node setup works") stopped being accurate the moment a second node was added, but nothing forced a re-evaluation of that assumption — the cluster health indicator looked identical (yellow) whether the cause was "expected, single-node limitation" or "replicas failing to allocate for an unexpected reason." Without actively monitoring *why* a cluster is yellow, not just *that* it's yellow, a genuinely dangerous state can hide behind a status that used to be totally benign.

**What actually prevents this:**
- **Alert on cluster health transitions and investigate the *reason* for yellow/red, not just the color itself** — `GET _cluster/allocation/explain` reveals exactly why a shard isn't allocated, which distinguishes "expected, single-node limitation" from "something is actually broken."
- **Re-evaluate baseline health expectations explicitly whenever cluster topology changes** — adding a node is exactly the kind of change that should trigger someone to confirm replicas are actually being assigned as expected, not just assume the yellow status means the same thing it did before.
- **Treat a single point of failure (one node holding all primary shards with no replicas actually assigned anywhere) as a real, monitored risk**, independent of what the aggregate cluster health color happens to show — the health indicator is a useful summary, but knowing your actual replication topology matters more than trusting a single color code.

---

## Scenario 2 (illustrative/composite): The mapping explosion that came from letting dynamic mapping run wild

**The pattern:** An application logs structured JSON events into Elasticsearch, relying entirely on dynamic mapping (letting Elasticsearch infer field types automatically from whatever's indexed) rather than an explicit mapping. A code change starts including a `metadata` object with keys that vary per event — sometimes a request ID, sometimes a user-agent string, sometimes an arbitrary nested object from a third-party webhook payload. Within weeks, the index's mapping has ballooned to tens of thousands of unique fields, since Elasticsearch dynamically creates a new mapped field for every previously-unseen key. Cluster performance degrades noticeably, and eventually indexing starts failing outright once the index hits Elasticsearch's default field count limit.

**Why dynamic mapping's convenience is also its risk, at scale:** dynamic mapping is genuinely useful for getting started quickly and for data with a stable, bounded set of fields — the problem is specifically when a field's *values* (not just its presence) effectively become field *names*, as happens when arbitrary or highly variable key names get indexed as top-level mapped fields. Each unique field name becomes a permanent addition to the index's mapping, and mappings don't shrink back down even if that specific field stops being used — this is a structurally different problem from a document simply containing "a lot of data," since it's specifically about unbounded *field name* variety, not data volume.

**What actually prevents this:**
- **Use explicit mappings for any field that could plausibly receive unpredictable or attacker/webhook-controlled key names**, and set `"dynamic": false` or `"dynamic": "strict"` at the object level for genuinely unpredictable nested data — this stops Elasticsearch from creating new mapped fields for keys it wasn't told to expect, though it does mean unmapped data becomes unsearchable in the normal way (a real, worthwhile tradeoff for avoiding mapping explosion).
- **For genuinely arbitrary key-value data, use the `flattened` field type instead of dynamic object mapping** — it stores the whole object as a single field for the mapping's purposes while still allowing basic querying, specifically designed to avoid the per-key mapping explosion that plain dynamic mapping causes.
- **Monitor total mapped field count per index as a leading indicator**, not just something discovered once indexing starts failing — `GET /index/_mapping` field count trending upward over time is a real, catchable signal well before hitting the hard limit.

---

## Scenario 3 (illustrative/composite): The relevance-tuned search that got worse the more it was tuned

**The pattern:** A product search team notices that search results for "wireless headphones" sometimes surface an accessory (a phone case with "wireless" in its description, mentioning wireless charging) above genuinely relevant headphone products. Their fix is to add field boosts (`name^5`, making the name field score much more heavily) and adjust `fuzziness` settings, iterating repeatedly whenever a specific bad result gets reported. After several rounds of ad-hoc tuning, overall search quality — measured by actual click-through and conversion data, once someone finally checks — has gotten *worse* on average, even though the specific reported bad results got fixed one at a time.

**Why iterative, complaint-driven tuning without measurement produces this outcome:** each individual tuning change was a locally reasonable response to a specific bad result someone noticed and reported — but relevance tuning changes interact with each other in ways that aren't obvious from looking at one query at a time, and a change that fixes one reported case can easily degrade a much larger number of unreported cases that nobody happened to notice or complain about. Without measuring aggregate search quality (not just spot-checking individual complaints), there's no way to know whether the net effect of a series of individually-reasonable tuning changes is actually positive.

**What actually prevents this:**
- **Measure search quality with an actual metric before and after any relevance change** — click-through rate on top results, or a manually-scored relevance judgment set against a fixed sample of real queries, rather than relying on the absence of new complaints as the signal that a change was good.
- **Test relevance changes against a representative sample of real historical queries, not just the one query that prompted the change** — a query log sample run through both the old and new scoring configuration reveals whether a change helps broadly or just for the one case that was complained about.
- **Elasticsearch's `_explain` and `profile: true` API features exist specifically to show *why* a document scored the way it did** — using these to understand the actual mechanism behind a bad result (which clause, which boost, which field match contributed the score) leads to a more targeted fix than broadly increasing a field boost and hoping it generalizes correctly to every other query the same boost will now affect.
