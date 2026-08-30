# Computer Networks — Intermediate

## Subnetting — worked example

```
Given: 192.168.1.0/24, need 4 subnets of equal size

/24 = 256 addresses total, 8 host bits
Need 4 subnets → borrow 2 bits (2^2 = 4) → new prefix = /26
Each subnet: 256/4 = 64 addresses (2^6, since 6 host bits remain)

Subnet 0: 192.168.1.0   /26   (usable: .1 – .62,   broadcast .63)
Subnet 1: 192.168.1.64  /26   (usable: .65 – .126,  broadcast .127)
Subnet 2: 192.168.1.128 /26   (usable: .129 – .190, broadcast .191)
Subnet 3: 192.168.1.192 /26   (usable: .193 – .254, broadcast .255)

Rule: each subnet's usable range excludes the network address
(first) and broadcast address (last) — 64 total addresses per
subnet, but only 62 usable for hosts. Getting the -2 wrong (or
forgetting it) is the single most common subnetting mistake.

VLSM (Variable Length Subnet Masking) — same idea, but subnets
don't have to be equal size: allocate the largest requirement
first (e.g. a /25 for 100 hosts), then subdivide the remainder
for smaller requirements (a /28 for 10 hosts, etc.) — this is
what real networks actually use, since equal-size subnetting
wastes addresses when requirements genuinely differ.
```

## Routing — distance vector vs link state

```
Distance Vector (RIP is the classic example):
  Each router only knows: "neighbor X, cost to reach destination D"
  Shares its entire routing table with direct neighbors periodically
  Uses Bellman-Ford: cost(me→D) = min over all neighbors N of
    [cost(me→N) + cost(N→D advertised by N)]

  Count-to-infinity problem: if a route fails, routers can keep
  advertising stale routes to each other in a loop, incrementing
  the hop count slowly instead of realizing the route is dead —
  RIP's fix is capping "infinity" at 16 hops, a real, deliberate
  design limitation, not an oversight (and the direct reason RIP
  can't scale to networks needing more than 15 hops).

Link State (OSPF is the classic example):
  Each router builds a complete map of the entire network topology
  (floods link-state advertisements to everyone, not just neighbors)
  Runs Dijkstra's algorithm locally to compute shortest paths to
  every destination from its own complete topology view.

  Converges faster and avoids count-to-infinity (each router
  computes independently from full topology, not from
  possibly-stale neighbor advice) — the trade-off is more memory
  and computation per router, which is why link-state protocols
  are standard for larger networks despite the extra overhead.
```

## Congestion Control — TCP's actual algorithm

```
Slow Start: congestion window (cwnd) starts small (1 MSS),
  doubles every RTT (exponential growth) until it hits a
  threshold (ssthresh) or packet loss occurs.

Congestion Avoidance: once past ssthresh, cwnd grows linearly
  (+1 MSS per RTT) instead of doubling — this is the "Additive
  Increase" half of AIMD (Additive Increase, Multiplicative
  Decrease).

On packet loss (detected via timeout or 3 duplicate ACKs):
  ssthresh = cwnd / 2
  cwnd resets to 1 (timeout) or ssthresh (fast recovery, on
    triple-duplicate-ACK loss specifically — TCP treats this as
    a less severe signal than a full timeout, since duplicate
    ACKs mean *some* packets are still getting through)

Why "multiplicative decrease" specifically, not linear: cutting
the window sharply on any sign of congestion is what keeps TCP
flows fair to each other and prevents the network from staying
overloaded — a slow, linear backoff wouldn't relieve congestion
fast enough once it's actually detected.
```

## Sliding Window Protocols

```
Go-Back-N: sender can have N unacknowledged packets in flight.
  On a lost packet, receiver discards every subsequent packet
  (even correctly received ones) and the sender must retransmit
  everything from the lost packet onward — simple to implement,
  but wastes bandwidth resending packets that already arrived fine.

Selective Repeat: receiver buffers out-of-order packets instead
  of discarding them, and the sender only retransmits the
  specific packet(s) that were actually lost — more efficient,
  but requires more buffer memory at the receiver and a more
  complex acknowledgment scheme (each packet ACKed individually,
  not just "everything up to N").

Which one a real protocol uses is a direct bandwidth-vs-memory
trade-off — TCP itself behaves closer to Selective Repeat via
SACK (Selective Acknowledgment) in modern implementations,
specifically because the bandwidth savings outweigh the extra
buffer cost on typical modern hardware.
```

## Transition to Advanced

You're ready for advanced Computer Networks topics when you can:
- Perform VLSM subnetting for a set of unequal host requirements without a subnet calculator
- Trace a Bellman-Ford or Dijkstra routing computation by hand from a given topology
- Explain, with the actual formula, why TCP's cwnd is 1 MSS after a timeout but ssthresh after triple-duplicate-ACK loss
