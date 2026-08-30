# Computer Networks — Advanced

## Bandwidth-Delay Product and Throughput Numericals

```
Bandwidth-Delay Product (BDP) — the amount of data "in flight"
on a link at any moment, and the key number for sizing TCP's
window to actually use the available bandwidth:

  BDP = Bandwidth × RTT

  Example: 100 Mbps link, RTT = 50ms
  BDP = 100×10^6 bits/sec × 0.05 sec = 5×10^6 bits = 625,000 bytes ≈ 610 KB

  If TCP's window (receive buffer) is smaller than the BDP, the
  connection can never use the full available bandwidth — the
  sender runs out of window and has to wait for ACKs before
  sending more, no matter how fast the link actually is. This is
  the concrete, numerical reason long-fat networks (high
  bandwidth, high latency — e.g. transcontinental links) need TCP
  window scaling (RFC 1323) to reach full throughput; the
  original 16-bit TCP window field caps at 65,535 bytes, far
  below the 610KB needed in this example alone.

Effective throughput given window size W and RTT:
  Throughput = W / RTT
  If W = 64KB and RTT = 50ms:
  Throughput = 64×1024×8 bits / 0.05 sec ≈ 10.5 Mbps
  — far below the 100 Mbps link capacity, purely because the
  window is smaller than the BDP computed above.
```

## Routing — full Dijkstra worked example

```
Graph (undirected, weighted):
  A-B: 4    A-C: 1    C-B: 2    C-D: 5    B-D: 1

Dijkstra from A:
  Initialize: dist[A]=0, all others = ∞
  Visit A (dist 0): update B=4, C=1
  Visit C (dist 1, smallest unvisited): update B=min(4, 1+2)=3, D=min(∞,1+5)=6
  Visit B (dist 3, smallest unvisited): update D=min(6, 3+1)=4
  Visit D (dist 4, smallest unvisited): done, no smaller update possible

Final shortest distances from A: B=3 (via C), C=1, D=4 (via C→B)

This is the actual mechanism behind OSPF's route computation —
each router runs this exact algorithm on its locally-built
complete topology map, and the "visit smallest unvisited
distance next" rule is precisely why Dijkstra never has to
revisit a node once finalized (the greedy choice is always
correct as long as all edge weights are non-negative, which is
also why Dijkstra breaks on graphs with negative weights, unlike
Bellman-Ford).
```

## Error Detection — CRC worked example

```
CRC (Cyclic Redundancy Check) — data D, generator polynomial G
(as a bit string), find the CRC remainder R:

Data: 1101011011   Generator: 10011  (4-bit CRC, generator is 5 bits)

1. Append 4 zero bits to data: 11010110110000
2. XOR-divide by generator (binary division, XOR instead of subtract):

   11010110110000
   10011
   -----
   01001110110000
    10011
    -----
   00010100110000
      ...continue XOR division...
   (full long division yields remainder R = 1110, worked
   mechanically the same way as regular long division, using
   XOR at each step instead of subtraction)

3. Transmitted frame = original data + R = 1101011011 1110

Receiver divides the *received* frame by the same generator G —
if the remainder is 0, no error detected; a nonzero remainder
means the frame was corrupted in transit. CRC catches all
single-bit errors and (depending on the generator polynomial's
properties) most burst errors — a stronger guarantee than a
simple parity bit or checksum, which is why CRC (not parity) is
what Ethernet frames actually use.
```

## Congestion Control — TCP throughput formula (Mathis equation)

```
For a TCP connection under random loss, the classic approximation:

  Throughput ≈ (MSS / RTT) × (1 / √p)

  where p = packet loss probability

  Example: MSS = 1460 bytes, RTT = 100ms, p = 0.0001 (0.01% loss)
  Throughput ≈ (1460 / 0.1) × (1/√0.0001) = 14,600 × 100 = 1,460,000 bytes/sec ≈ 11.7 Mbps

  This formula is the quantitative version of "packet loss hurts
  TCP throughput more on high-RTT connections than low-RTT ones"
  — for the same loss rate p, doubling RTT halves throughput,
  which is precisely why satellite/long-haul links (high RTT)
  are disproportionately sensitive to even small amounts of loss
  compared to a low-latency LAN connection with the same p.
```

## High-Yield Advanced Topics

Based on GATE/placement exam patterns, prioritize in this order:
1. Subnetting/VLSM and Dijkstra/Bellman-Ford routing numericals — nearly guaranteed to appear, mechanical once the method is memorized
2. TCP throughput/BDP/window-size numericals — moderate frequency, formula-driven, easy points once the formulas above are internalized
3. CRC/checksum error-detection numericals — lower frequency but a common trick question testing whether the XOR-division mechanic (not just the concept) is actually understood

## Practice Resources

- **Labs section**: Advanced MCQ sets with detailed explanations, including full subnetting, Dijkstra, and CRC numericals
- **Interview Q&A**: Conceptual questions on trade-offs (link-state vs distance-vector, Go-Back-N vs Selective Repeat) rather than pure definitions
- Previous year GATE CS papers, specifically the networking numericals — subnetting and routing-table questions repeat the same underlying method with different numbers nearly every cycle
