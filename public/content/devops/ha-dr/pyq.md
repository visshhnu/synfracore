# HA / DR Design — PYQ (Previously Asked / Practice Questions)

**Framing note:** there's no certification dedicated specifically to HA/DR design — this material is instead tested as part of broader cloud architecture certifications. The most directly relevant is **AWS Certified Solutions Architect – Associate (SAA-C03)**, which covers reliability and disaster recovery design as one of its core domains. Verified current format: 65 questions, 130 minutes, 720/1000 passing, $150 USD, 3-year validity. Since AWS's own certification exams are proctored and confidential (no public past-paper archive, same as every other certification covered in this course), the questions below are built from the domain's actual subject matter and from realistic architecture-design scenarios rather than invented "leaked" exam content.

---

### 1. (SAA-C03 domain: Design Resilient Architectures) A business says their system "must never lose more than 1 minute of data, and must never be down for more than 15 minutes." Translate this into RPO/RTO and identify the minimum DR strategy tier that satisfies both.

**Answer:** RPO ≤ 1 minute, RTO ≤ 15 minutes. Per this course's own DR strategy tiers, Backup & Restore (RTO in hours) and Pilot Light (RTO 10-30 min, borderline) don't reliably satisfy a 15-minute RTO — **Warm Standby** (RTO in minutes, RPO in seconds via continuous replication) is the minimum tier that comfortably satisfies both requirements; Active-Active would also satisfy them but at meaningfully higher cost than necessary for these specific targets.

---

### 2. (SAA-C03 domain: Design Resilient Architectures) Why does a Kubernetes Deployment with `replicas: 3` and no anti-affinity configuration NOT actually provide the availability someone might assume from "3 replicas"?

**Answer:** Without anti-affinity rules, the Kubernetes scheduler is free to place all 3 replicas on the same node (or same availability zone) if that's where capacity happens to be available — meaning a single node failure could take out all 3 replicas simultaneously despite the deployment nominally having redundancy. This is exactly the gap this course's own material opens with: "by default all 3 replicas of a deployment could land on the same node." The fix (pod anti-affinity, topology spread constraints) is what actually converts a replica count into real fault-tolerance across failure domains.

---

### 3. (Scenario-based) A team implements a PodDisruptionBudget with `minAvailable: 2` for a 3-replica deployment. During a node drain (planned maintenance), the drain gets stuck and won't proceed. What's the likely cause?

**Answer:** If fewer than the required minimum (2, in this case) healthy replicas are currently available — perhaps one replica is already down for an unrelated reason, or the node being drained hosts 2 of the 3 replicas due to insufficient anti-affinity — draining that node would violate the PDB's guarantee, so Kubernetes correctly refuses to proceed with the drain rather than silently violating the availability guarantee. This is the PDB working as intended, not a bug — the real fix is addressing why replica health or distribution isn't in the state the PDB assumes, not overriding the PDB.

---

### 4. (SAA-C03 domain: Design Resilient Architectures) Explain, with a concrete example, why RTO and RPO targets should be set based on actual business impact rather than defaulting to "as low as possible."

**Answer:** Lower RTO/RPO always costs more infrastructure — an internal reporting tool with an RTO of 24 hours and RPO of 24 hours can use simple, cheap daily Backup & Restore, while a payment system might genuinely need Warm Standby or Active-Active at multiples of the cost. Setting every system to the lowest possible RTO/RPO "just to be safe" means spending Active-Active-level money on systems where a business genuinely would tolerate hours of downtime — the correct process is assessing actual business impact per system (or per tier) first, then choosing the cheapest DR strategy that satisfies those specific, justified requirements, not applying a single aggressive target uniformly.

---

### 5. (Scenario-based) A readiness probe and a liveness probe are configured with the exact same shallow health check (just confirms the HTTP server responds). A pod experiences a temporary slowdown from a downstream dependency being briefly overloaded. What happens, and why is it the wrong outcome?

**Answer:** Since both probes use the same shallow check and the HTTP server itself is still responding (just serving slow responses due to the downstream issue), neither probe fails — meaning the pod stays in the load balancer's rotation despite serving poor real-world responses, AND wouldn't be restarted even if a restart might have helped. Worse: if the shallow check is *too* shallow to detect the real problem at all, users keep getting routed to a struggling pod. The correct design differentiates the two: readiness should check real dependency health (pulling the pod from rotation the moment it can't serve well, without restarting it — since restarting doesn't fix a downstream dependency), while liveness should only catch genuinely stuck/crashed processes, not transient slowness — conflating the two into one shallow check, as covered in this course's own Fundamentals material, produces exactly the wrong response for a downstream-dependency slowdown.

---

### 6. (SAA-C03 domain: Design High-Performing Architectures) Why does a synchronous replication strategy achieve a lower RPO than asynchronous replication, and what's the real cost of that lower RPO?

**Answer:** Synchronous replication confirms a write only after the replica has also acknowledged it — meaning a completed write is guaranteed to exist in both locations, giving an RPO of effectively zero for that replication link. Asynchronous replication confirms the write immediately at the primary and ships it to the replica afterward, meaning a small, real window of data exists only on the primary until replication catches up — an RPO measured in seconds rather than zero. The real cost of synchronous replication is added write latency, since every write must wait for the remote acknowledgment before completing — this is exactly why synchronous replication is typically used only within a region (AZ-to-AZ, where latency is low) while cross-region replication for DR is much more commonly asynchronous, trading a small, non-zero RPO for acceptable write latency.

---

### 7. (Scenario-based) An architecture moves from Active-Passive to Active-Active specifically to reduce RTO to near-zero. What's a category of application logic that needs to be specifically audited before this change is safe, and why?

**Answer:** Any logic involving a limited or counted shared resource — a discount code with a maximum redemption count, remaining inventory of a specific item, a rate-limited action — needs explicit review, because active-active means two regions can accept writes to the same logical resource simultaneously, and "check remaining count, then decrement" logic that was safe under a single writer becomes a race condition once two writers can act on their own local, possibly-stale view of that count at the same time. This is exactly the failure mode covered in this course's own Real World Scenarios material — the infrastructure-level RTO/RPO improvement doesn't automatically make every piece of existing application logic safe for the new multi-writer reality.

---

### 8. (Scenario-based) A DR runbook has never actually been executed — only reviewed as a document. Leadership considers this acceptable since "the architecture has been carefully designed." What's the specific risk this reasoning misses?

**Answer:** A carefully designed architecture can still contain a silent, undiscovered gap that only manifests during an actual failover attempt — a replication permission issue that silently blocks one specific type of change, a runbook step that references an outdated command or credential, a promotion procedure that assumes a state the standby doesn't actually have. "Well-designed on paper" and "verified to actually work" are different claims, and the entire reason this course's own material insists DR only works if tested is that these gaps are specifically the kind that don't show up in a design review — only in an actual promotion/failover attempt, which is exactly what a quarterly GameDay exercise is for.

---

### 9. (SAA-C03 domain: Design Resilient Architectures) What's the CAP theorem tradeoff, and give a concrete example of a system that should choose CP over AP, and one that should choose AP over CP.

**Answer:** Under a network partition, a distributed system must choose Consistency (every read reflects the latest write, but some requests may be rejected/delayed until consistency can be guaranteed) or Availability (every request gets a response, but it might be stale) — it cannot guarantee both simultaneously during the partition. A payment or inventory system should generally choose **CP** — serving a stale "yes, you have funds" or "yes, item is in stock" answer during a partition risks real financial/business harm (double-spending, overselling). A social media feed or product recommendation system should generally choose **AP** — serving a slightly stale feed during a brief partition is a minor, acceptable degradation, while refusing to serve any response at all is a worse user experience for that specific use case.

---

### 10. (Scenario-based) A DNS-based failover mechanism is configured with a TTL of 24 hours "to reduce DNS query load and cost." What's wrong with this specifically in the context of a DR failover design?

**Answer:** A 24-hour TTL means clients and intermediate resolvers can cache the old (failed) endpoint's address for up to 24 hours after a DNS failover switch, meaning a significant fraction of traffic keeps trying to reach the failed primary for potentially most of a day, regardless of how fast the actual failover infrastructure work completes. This directly undermines any RTO target measured in minutes — the *infrastructure* might fail over in 2 minutes, but the *effective* RTO experienced by a meaningful share of users is bounded by the DNS TTL, not by how fast the backend switched. This is exactly why this course's own material specifically calls out a low TTL (60 seconds) as part of achieving a fast RTO — DNS TTL is a real, easily overlooked component of the *actual* end-to-end recovery time, not just a cost-optimization knob independent of DR design.
