# 4G/5G & Wireless — Overview

**Before you start:** [Telecom Fundamentals](/academies/telecom/telecom-fundamentals/overview) (spectrum, multiple-access techniques, circuit/packet switching) is assumed — this technology builds directly on those concepts without re-explaining them.

## What this technology covers

4G/5G & Wireless covers mobile broadband architecture from LTE through 5G NR: the LTE network architecture (eNodeB, EPC), OFDM/OFDMA as the physical-layer technique underlying both generations, 5G NR's key architectural additions (network slicing, massive MIMO, beamforming), the NR frequency band structure (FR1/FR2), and the primary 5G use-case categories (eMBB, URLLC, mMTC). This technology assumes Telecom Fundamentals' spectrum, multiple-access, and circuit/packet-switching concepts as a prerequisite — it does not re-explain them, but builds directly on top of them. Despite this technology's on-platform title referencing "Wireless" broadly, its actual scope per the curriculum is 4G/5G mobile broadband specifically — WiFi and Bluetooth are short-range wireless technologies with different standards bodies (IEEE 802.11/802.15) and design goals, and are not covered here.

## Why This Exists (The Hook)

4G LTE and 5G NR are the architectures underneath nearly all modern mobile connectivity — every smartphone data session, most IoT deployments, and an increasing share of fixed broadband (5G FWA) run on this stack. Understanding *why* 5G is architected the way it is (network slicing for differentiated services, massive MIMO and beamforming for capacity/coverage, the FR1/FR2 band split for the coverage-vs-capacity tradeoff) matters more than memorizing spec numbers, because these architectural choices are direct, traceable responses to specific 4G limitations — the same pattern Telecom Fundamentals establishes for earlier generational transitions.

**Analogy** — Think of network slicing like a single highway with dedicated lanes for different vehicle types, not separate highways. Building three separate physical highways — one for emergency vehicles, one for regular traffic, one for freight — would be enormously expensive and wasteful of land. Instead, one highway with dedicated lanes (an emergency lane, a carpool lane, a truck lane) serves all three needs from shared infrastructure, each with different rules and guarantees. Network slicing does exactly this for 5G: one physical network, sliced into virtual "lanes" (eMBB, URLLC, mMTC) each with different latency/throughput/reliability guarantees, rather than building three separate physical networks.

**Try it (2 minutes)** — Reason through why URLLC (Ultra-Reliable Low-Latency Communication) and eMBB (enhanced Mobile Broadband) genuinely need different network guarantees rather than one "as fast as possible" target serving both, without looking anything up: eMBB is for high-throughput consumer use (streaming video) where occasionally waiting an extra few milliseconds for a video frame is barely noticeable. URLLC is for industrial automation and autonomous vehicles, where a few milliseconds of extra latency could mean a robotic arm or a vehicle reacting too late to prevent a collision. If both use cases shared one identical network configuration optimized purely for average throughput, what would happen to URLLC's actual reliability guarantee during a moment of high eMBB traffic congestion — and why does that failure mode explain why 5G needs slicing with independent guarantees per use case, not just one shared "best effort" network?

## LTE and NR — a quick map

| Concept | LTE (4G) | NR (5G) |
|---|---|---|
| Radio access node | eNodeB | gNodeB |
| Core network | EPC (Evolved Packet Core) | 5GC (5G Core), supports network slicing |
| Physical layer | OFDMA (downlink), SC-FDMA (uplink) | OFDMA (both directions, more flexible numerology) |
| Peak theoretical throughput | ~1 Gbps (LTE-Advanced) | Multi-Gbps (FR2/mmWave conditions) |
| Latency (typical) | ~10ms | Sub-5ms (URLLC scenarios) |

## The three 5G use-case categories

```conceptgrid
{
  "boxes": [
    { "title": "eMBB", "description": "Enhanced Mobile Broadband -- high-throughput consumer data, video streaming", "color": "blue" },
    { "title": "URLLC", "description": "Ultra-Reliable Low-Latency -- industrial automation, autonomous vehicles", "color": "red" },
    { "title": "mMTC", "description": "Massive Machine-Type -- high-density IoT sensor deployments", "color": "green" }
  ]
}
```

5G NR is explicitly designed around three distinct use-case categories rather than a single "faster 4G" goal: **eMBB** (enhanced Mobile Broadband — high-throughput consumer data, video streaming), **URLLC** (Ultra-Reliable Low-Latency Communication — industrial automation, autonomous vehicles, applications where latency and reliability matter more than raw throughput), and **mMTC** (massive Machine-Type Communication — high-density IoT sensor deployments where device count matters more than per-device throughput). Network slicing exists specifically to let a single physical 5G network serve all three categories simultaneously with different performance guarantees per slice, rather than requiring separate physical networks.

## Exam and career relevance

4G/5G & Wireless is core syllabus for GATE ECE (communication systems sections), BSNL JTO/JE recruitment's 4G/5G architecture components, and is directly relevant to RF engineering, network planning, and telecom equipment vendor roles.

## How to use this technology's sections

Fundamentals covers LTE architecture and OFDM/OFDMA basics. Intermediate applies these to 5G NR's specific architectural additions (network slicing, massive MIMO, band structure). Advanced covers beamforming mechanics, NR numerology, and the eMBB/URLLC/mMTC design tradeoffs in depth. Interview and Cheatsheets provide exam-format practice and quick reference.
