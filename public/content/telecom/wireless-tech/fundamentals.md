# 4G/5G & Wireless — Fundamentals

## LTE network architecture

LTE's network splits into two main parts: the **radio access network**, built around the **eNodeB** (evolved Node B — the LTE base station, combining functions that earlier generations split across separate base-station and controller elements), and the **EPC (Evolved Packet Core)**, the all-IP core network handling mobility management, session management, and routing to external networks (the internet). This is a flatter architecture than GSM's BSS/NSS split (Telecom Fundamentals) — LTE deliberately reduced the number of network elements a data packet passes through, cutting latency as a direct design goal.

## OFDM and OFDMA — LTE and NR's shared physical layer

Telecom Fundamentals introduces OFDMA as 4G/5G's multiple-access technique; Fundamentals here covers the mechanics: **OFDM (Orthogonal Frequency Division Multiplexing)** divides available spectrum into many narrow, mathematically orthogonal sub-carriers — "orthogonal" meaning they don't interfere with each other despite overlapping in frequency, which is what allows dense sub-carrier packing without wasted guard-band spectrum between them. **OFDMA** is the multiple-access application of OFDM — different users are allocated different sub-carriers (and time slots) dynamically, letting the network flexibly assign more spectrum to users who need more throughput at a given moment, rather than a fixed per-user allocation.

LTE uses OFDMA for the downlink (network-to-device) but **SC-FDMA (Single-Carrier FDMA)** for the uplink specifically to reduce peak-to-average power ratio in the device's transmitter — a battery-life and hardware-cost consideration, since devices have much tighter power budgets than base stations. 5G NR uses OFDMA in both directions, made practical by improvements in device power-amplifier efficiency since LTE's original design.

## 5G NR — what's actually new

5G NR is not simply "faster LTE" — it introduces genuinely new architectural elements:

- **Network slicing:** the 5G Core can partition a single physical network into multiple logical "slices," each with different performance guarantees (throughput, latency, reliability), letting one network simultaneously serve eMBB, URLLC, and mMTC use cases without needing separate physical infrastructure for each.
- **Massive MIMO:** using a much larger number of antenna elements (tens to hundreds) than LTE's MIMO implementations, enabling more spatial multiplexing (more simultaneous independent data streams) and finer beamforming.
- **Flexible numerology:** unlike LTE's fixed sub-carrier spacing, NR supports multiple sub-carrier spacing options, letting the network trade off latency against robustness depending on the deployment scenario (e.g., wider spacing for lower latency in URLLC use cases).

## FR1 and FR2 — the NR band split

5G NR spectrum is divided into two frequency ranges: **FR1** (sub-6 GHz, extending the coverage-oriented lower/mid bands familiar from 4G) and **FR2** (mmWave, roughly 24-52 GHz, offering very high capacity but short range and poor obstacle penetration — Telecom Fundamentals' coverage-vs-capacity tradeoff taken to its extreme). Most real-world 5G deployment relies primarily on FR1 for wide-area coverage, with FR2 used selectively for high-density urban capacity (stadiums, dense city centers) where its short range is an acceptable tradeoff for extreme throughput. `(needs verification — recheck against current source: exact FR2 band boundaries and specific allocated bands vary by region and are periodically revised.)`

## Getting started

1. Treat LTE's eNodeB/EPC architecture as the baseline — 5G's gNodeB/5GC largely extends the same structural pattern rather than replacing it wholesale.
2. Understand OFDM's orthogonality property before moving to OFDMA's multi-user allocation — the "why no interference despite overlap" mechanic is the foundation the rest of the physical-layer material builds on.
3. Learn the eMBB/URLLC/mMTC three-way split as 5G's organizing design principle, not a side detail — network slicing, massive MIMO, and the FR1/FR2 split all exist substantially to serve this three-way requirement.
