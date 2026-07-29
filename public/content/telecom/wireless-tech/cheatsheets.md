# 4G/5G & Wireless — Cheatsheets

## LTE vs. NR architecture quick reference

| Element | LTE (4G) | NR (5G) |
|---|---|---|
| Radio access node | eNodeB | gNodeB |
| Core network | EPC | 5GC (supports network slicing, NFV/SDN-based) |
| Downlink multiple access | OFDMA | OFDMA (flexible numerology) |
| Uplink multiple access | SC-FDMA (lower peak-to-average power) | OFDMA (both directions) |
| Sub-carrier spacing | Fixed | Flexible (multiple numerologies) |

## 5G use-case categories

| Category | Full name | Priority | Example |
|---|---|---|---|
| eMBB | enhanced Mobile Broadband | Throughput | Video streaming, consumer data |
| URLLC | Ultra-Reliable Low-Latency Communication | Latency, reliability | Industrial automation, autonomous vehicles |
| mMTC | massive Machine-Type Communication | Device density, power efficiency | IoT sensor networks |

## FR1 vs. FR2

| Property | FR1 (sub-6 GHz) | FR2 (mmWave, ~24-52 GHz) |
|---|---|---|
| Range | Wide-area | Short-range |
| Obstacle penetration | Good | Poor |
| Capacity | Moderate-high | Very high |
| Typical use | General coverage backbone | Dense small-cell, high-capacity hotspots |

`(needs verification — recheck against current source: exact FR2 boundaries and allocated bands vary by region.)`

## Beamforming implementation types

| Type | RF chains | Simultaneous beams | Cost/power | Typical use |
|---|---|---|---|---|
| Analog | One, shared across elements | One | Low | Simpler single-user scenarios |
| Digital | One per antenna element | Multiple, independently steered | High | Full multi-user MIMO |
| Hybrid | Moderate number, grouped elements | Several | Balanced | Typical massive-MIMO / FR2 deployments |

## Massive MIMO vs. multiple-access techniques

| Approach | Mechanism | Capacity lever |
|---|---|---|
| TDMA/CDMA/OFDMA | Divide a fixed resource (time/code/frequency) among users | Resource-division efficiency |
| Massive MIMO | Spatially separate simultaneous streams via many antennas | Adds new spatial capacity, not just divides existing resource |

## Key terms

| Term | Meaning |
|---|---|
| eNodeB / gNodeB | LTE / NR base station |
| EPC / 5GC | LTE / NR core network |
| Network slicing | Logical partitioning of one physical 5G network into differentiated-QoS virtual networks |
| Numerology | NR's configurable sub-carrier spacing scheme |
| MEC | Multi-access Edge Computing — processing moved near the radio access network to cut latency |
