# HA / DR Design — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from architecture reviews and DR postmortems industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The DR region that had never actually been tested

**The pattern:** A company runs a warm-standby DR setup exactly as designed on paper — a scaled-down copy running in a secondary region, database replication configured, DNS failover ready. It's never actually been failed over to, not even in a drill, because "the architecture is sound and testing it risks disrupting production." When a real regional outage hits the primary region, the failover runbook is executed for the first time under real pressure — and the database promotion step fails, because a schema migration applied to the primary months earlier was never actually replicated correctly to the standby due to a permissions issue that silently prevented one specific type of DDL statement from replicating. Nobody had noticed, because nobody had ever tried promoting the standby.

**Why "the architecture is sound on paper" isn't the same claim as "the architecture works":** a DR setup that's never been exercised end-to-end is, in a very real sense, unverified — this is exactly the reasoning behind this course's own material insisting that DR only works if you test it, and that teams which never test find it doesn't work during real incidents. A replication configuration silently failing to propagate one specific kind of change is a genuinely easy failure mode to have — and it's precisely the kind of gap that only surfaces during an actual promotion attempt, which is why "we've never actually promoted the standby" is itself a red flag independent of how well-designed the architecture looks on paper.

**What actually prevents this:**
- **Quarterly GameDay exercises that actually promote the standby**, not just review the runbook document — this course's own material specifically recommends this cadence, and the reasoning holds here exactly: the promotion step is precisely the part most likely to have a silent, undiscovered gap.
- **Test in a way that's genuinely representative of the real failover**, not just a sanitized version — testing DB promotion against a standby that's known to be in perfect sync doesn't catch a silent replication gap; the test needs to include verifying the standby actually has the data it's supposed to have, not just that the promotion command executes without erroring.
- **Treat "we've never tested this" as an open risk item with real priority**, not a permanently acceptable state — the instinct to avoid testing because it "risks disrupting production" is understandable but backwards: an untested DR plan risks a much worse disruption exactly when it's needed most, with none of the control a planned test would have.

---

## Scenario 2 (illustrative/composite): The RTO that was achievable for compute but not for the human decision to trigger it

**The pattern:** An architecture is designed and technically capable of achieving a 15-minute RTO — DNS TTLs are low, database failover is automated to complete within 2 minutes, compute scale-up is pre-warmed. During an actual regional degradation (not a clean, obvious "the whole region is down" event, but a partial, ambiguous degradation — elevated latency and intermittent errors, not total unavailability), it takes 40 minutes for the on-call engineer to become confident enough that this constitutes an actual disaster worth triggering an expensive, disruptive failover, rather than a transient blip that might resolve on its own.

**Why this is a genuinely common gap between "technical RTO" and "actual RTO":** the RTO calculation and the architecture design both assumed the *decision* to fail over would be fast and clear-cut — but the technical capability to fail over quickly doesn't address the much harder, more ambiguous human judgment call of *whether this specific situation warrants triggering it*. A clean, unambiguous "the entire region returned zero successful requests for 5 minutes" scenario is actually the easy case; a partial, intermittent degradation of unclear severity and unclear duration is the much more common and much harder real-world trigger to reason about under pressure.

**What actually addresses this:**
- **Define explicit, pre-agreed trigger criteria for failover** *before* an actual incident — a specific, objective threshold (e.g., "error rate above X% for more than Y minutes, or health check failures across Z% of the region's endpoints") that removes the need to make a fresh, high-stakes judgment call in the moment, replacing it with checking a pre-agreed condition.
- **Practice the ambiguous case specifically in GameDay exercises**, not just the clean "entire region is obviously down" scenario — simulating a partial, uncertain degradation and practicing the actual decision process is what builds the judgment and confidence that a clean-cut drill doesn't.
- **Give whoever's on-call explicit, pre-authorized authority to trigger failover** without needing to escalate for permission first — a design that technically allows a 15-minute RTO but requires manager sign-off before triggering has effectively built in a much longer real RTO than the technical capability suggests.

---

## Scenario 3 (illustrative/composite): The active-active setup that traded an availability problem for a consistency bug

**The pattern:** A team moves from active-passive to active-active across two regions specifically to hit a near-zero RTO/RPO target. The application layer is genuinely stateless and handles this well. But a specific feature — a promotional discount code with a limited total redemption count — wasn't designed with multi-region writes in mind: two users in different regions redeem the last available discount code within milliseconds of each other, and because each region's write happens against its own local data before cross-region replication catches up, both redemptions succeed, and the promotion is honored twice past its intended limit.

**Why active-active isn't a pure upgrade over active-passive, and this course's own material is right to flag data consistency as "the challenge":** active-active fundamentally means two locations can both accept writes to overlapping data simultaneously, and unless every single piece of application logic was explicitly designed with that possibility in mind, some subset of it almost certainly assumes single-writer semantics that no longer hold. A limited-count resource (a discount code, an inventory count, a rate-limited action) is exactly the class of logic most likely to break under this assumption, because "count remaining" checks that were safe under a single writer become a race condition the moment two writers can act on stale local state simultaneously.

**What actually addresses this:**
- **Audit every piece of business logic that involves a limited/counted resource specifically before enabling active-active writes for it** — this is a targeted, findable category of risk (anything involving "is there capacity left," "has this already been used," or similar checks), not a vague general warning.
- **For genuinely limited resources, route writes for that specific resource through a single region (or a distributed consensus mechanism) even in an otherwise active-active architecture**, rather than assuming the whole system needs to be either fully active-active or fully active-passive uniformly — a hybrid approach where most traffic is active-active but specific narrow categories of writes are deliberately serialized is a legitimate, common pattern.
- **This is exactly why the DR strategy pyramid in this course's own material notes active-active's cost isn't just infrastructure spend** — the real cost also includes the application-level engineering effort to make multi-region writes actually safe for every piece of logic that needs it, which is easy to underestimate relative to the infrastructure cost alone.
