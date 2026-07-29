# 4G/5G & Wireless — Advanced

## Beamforming mechanics — analog, digital, and hybrid

Intermediate covers beamforming's functional role; Advanced covers how it's actually implemented, since the implementation choice has real cost/performance consequences:

- **Analog beamforming:** a single RF chain drives all antenna elements, with phase shifters controlling each element's signal individually — cheaper and lower-power, but only supports one beam direction at a time, limiting it mostly to single-user, single-stream scenarios.
- **Digital beamforming:** each antenna element gets its own full RF chain, allowing multiple simultaneous, independently-steered beams (supporting multi-user MIMO) — significantly more capable but far more expensive and power-hungry at scale, since RF chain count scales with antenna count.
- **Hybrid beamforming:** the practical compromise most real 5G massive-MIMO deployments use — a moderate number of RF chains feeding groups of antenna elements via analog phase shifting, balancing digital beamforming's multi-beam flexibility against analog's lower cost, particularly important for FR2/mmWave deployments where full digital beamforming at typical massive-MIMO antenna counts would be prohibitively expensive.

## Network slicing — the isolation and orchestration layer beneath the concept

Intermediate's network-slicing example describes the customer-facing behavior; Advanced covers the mechanism: the 5G Core uses **Network Function Virtualization (NFV)** and **Software-Defined Networking (SDN)** principles to instantiate logically isolated network functions per slice, orchestrated dynamically rather than requiring physically separate hardware per slice. This is why network slicing is a genuinely 5G-native capability rather than something retrofittable onto 4G's EPC — LTE's core network architecture wasn't designed around virtualized, dynamically-orchestrated network functions the way the 5G Core is from the ground up.

## eMBB, URLLC, mMTC — the engineering tradeoffs behind each category

The three 5G use-case categories (Fundamentals) aren't just marketing segmentation — each implies genuinely different, sometimes conflicting, radio and core network configuration choices:

| Requirement | eMBB | URLLC | mMTC |
|---|---|---|---|
| Priority | Throughput | Latency, reliability | Device density, power efficiency |
| Typical numerology | Narrower sub-carrier spacing | Wider sub-carrier spacing | Narrowband, low-complexity |
| Beamforming use | High — maximizes per-user throughput | Moderate — reliability-focused | Often minimal — cost/power constrained |
| Core network handling | Standard eMBB slice | Dedicated low-latency slice, edge-compute-adjacent | Dedicated mMTC slice, optimized for signaling overhead reduction |

A single physical 5G deployment serving all three categories well requires network slicing precisely because no single radio/core configuration is simultaneously optimal for all three — this is the underlying engineering reason 5G's architecture is fundamentally more complex than "4G but faster."

## Edge computing and URLLC — why proximity matters for latency

URLLC's latency requirements (often sub-5ms end-to-end) can't be met by routing every packet back to a distant centralized data center, regardless of how fast the radio link itself is — propagation delay and core-network routing hops both add latency that becomes significant at these budgets. This is why 5G URLLC deployments are frequently paired with **multi-access edge computing (MEC)** — processing moved physically closer to the radio access network, reducing the round-trip distance for latency-critical applications like industrial automation or autonomous-vehicle coordination. `(needs verification — recheck against current source: MEC deployment specifics and real-world achieved latencies vary significantly by operator and deployment, and published figures are periodically revised.)`
