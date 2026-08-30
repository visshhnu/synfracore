# System Design — Advanced

## Design: Distributed Chat/Messaging System (like WhatsApp)

```
Requirements:
  - 1:1 and group messaging, real-time delivery when both parties online
  - Message persistence — deliver later if recipient is offline
  - Scale: 500M daily active users, ~50 messages/user/day

Scale estimate:
  Messages/day = 500M × 50 = 25B messages/day ≈ 290,000 messages/sec average
  (real peak load is several times the average, not evenly spread)

Core design:
  Client (WebSocket, persistent connection) → Connection/Gateway
    Servers → Message Service → Message Store (Cassandra —
    chosen specifically for high write throughput, append-heavy
    workload, and the AP-leaning tunable consistency covered on
    Intermediate) → Notification Service (push, for offline users)

  Connection Servers hold a live mapping of user_id → which
  gateway server + WebSocket connection they're on — this
  mapping itself needs to live in a fast shared store (Redis)
  since with millions of connections, a message from user A to
  user B needs to find *which specific server* currently holds
  B's live connection, and that lookup can't be a broadcast to
  every server at this scale.

Message delivery flow:
  1. A sends message → hits any Gateway Server → Message Service
  2. Message Service persists to Message Store (durability first —
     never lose a message even if the recipient is offline)
  3. Message Service checks Redis for B's connection location
  4. If B is online: route directly to B's Gateway Server → deliver
     over B's WebSocket
  5. If B is offline: trigger push notification via Notification
     Service; B fetches missed messages from Message Store on
     next connect (using a stored "last synced" cursor per device)

Ordering guarantee: messages within one conversation need to
  arrive in order — solved with a per-conversation monotonic
  sequence number assigned at write time (not by relying on
  network delivery order, which distributed systems fundamentally
  cannot guarantee), so a client can detect and correctly
  reorder out-of-sequence delivery on its own.
```

## Design: Distributed Cache (like a simplified Memcached/Redis cluster)

```
Requirements:
  - Sub-millisecond get/set latency
  - Scale beyond one machine's memory
  - Handle node failure without losing all cached data instantly

Core design:
  Client → Client-side hash ring (consistent hashing, from
    Intermediate) → determines target Cache Node directly →
    Cache Node (in-memory hash table)

  Deliberately client-side routing, not a central router: a
  central lookup server would add a network hop and become a
  bottleneck/single point of failure on every single cache
  operation — since cache access needs to be as fast as possible,
  the client computing the target node locally (via the same
  consistent-hashing ring logic every client shares) avoids that
  hop entirely.

Replication for fault tolerance: each key is written to N=3 nodes
  (the node consistent hashing points to, plus the next 2 on the
  ring) — losing one node loses no data, since 2 replicas remain;
  this is a deliberate trade of memory cost (3x storage) for
  availability, appropriate specifically because cache data is
  usually re-derivable from a backing database anyway, so the
  actual failure cost of losing a cache node is degraded
  performance, not permanent data loss — a different risk profile
  than a primary datastore, which is why cache replication
  factor/strategy decisions differ from a primary database's.

Eviction: LRU (Least Recently Used) is the standard default —
  when a node's memory is full, evict the least-recently-accessed
  key first, on the reasoning that recently-accessed keys are the
  most likely to be accessed again soon (temporal locality) —
  the same principle behind CPU cache and OS page-replacement
  design (see the OS academy's LRU coverage for the underlying
  general concept).
```

## Consensus — Raft, at the level a system design interview expects

```
Problem: a distributed system needs multiple nodes to agree on a
single value (e.g. "who is the current leader," or "what is the
next entry in a replicated log") even when some nodes crash or
network messages are delayed — this is a materially harder
problem than it sounds, which is exactly why dedicated consensus
protocols exist rather than ad-hoc agreement logic.

Raft (a genuinely more understandable alternative to Paxos,
designed specifically to be teachable, not just correct):
  Leader election: nodes start as followers; if a follower
    doesn't hear from a leader within a randomized timeout, it
    becomes a candidate and requests votes — the randomization is
    deliberate, specifically to make simultaneous elections (a
    split vote) unlikely, since candidates with different random
    timeouts rarely all start an election at exactly the same
    moment.
  Log replication: once elected, the leader accepts writes and
    replicates them to followers; a write is considered committed
    once a MAJORITY of nodes have it — majority specifically
    because it guarantees any two majorities overlap by at least
    one node, which is the property that prevents two different
    leaders from committing conflicting values during a network
    partition.

  This majority-quorum mechanism is what underlies real production
  systems' leader election and configuration consensus (etcd,
  Consul use Raft directly; many databases use similar quorum
  logic for their own replication) — knowing that "quorum-based
  agreement" is the mechanism, and roughly why majority (not just
  any subset) matters, is the actual depth a system design
  interview at this level expects, not a full implementation.
```

## High-Yield Advanced Topics

Based on system-design-interview patterns, prioritize in this order:
1. A full end-to-end design (chat system, cache, or similar) that correctly justifies each component choice against the actual requirements, not just names components
2. Consistent hashing + replication trade-offs, since they recur inside almost every "design a distributed X" question regardless of the specific system
3. CAP/consensus reasoning applied to the *specific* system being designed, not recited generically

## Practice Resources

- **Labs section**: Advanced design-critique exercises with detailed trade-off explanations
- **Interview Q&A**: Follow-up questions that probe a design's failure modes ("what happens if this component goes down"), which is what separates a strong answer from a component list
- System Design Interview (Alex Xu) Vol. 1 and 2 — widely used for exactly this style of worked full-system design
