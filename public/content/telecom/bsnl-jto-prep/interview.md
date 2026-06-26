# JTO Interview & Technical Q&A

**Q1: What is the difference between TDM and FDM?**
A: TDM (Time Division Multiplexing) assigns each channel a time slot in a shared medium — channels take turns. Used in digital systems (E1/T1, SDH). FDM (Frequency Division Multiplexing) assigns each channel a different frequency band — channels run simultaneously. Used in analog systems (cable TV, FM radio). OFDM combines both: multiple subcarriers (FDM) with cyclic prefix for ISI resistance.

**Q2: What is a guard band in FDM?**
A: A small unused frequency band between adjacent channels to prevent interference (inter-channel crosstalk). In FM radio, guard bands exist between stations. In LTE OFDM, orthogonality of subcarriers eliminates the need for guard bands between them, but guard bands exist at band edges.

**Q3: Explain handover types in mobile networks.**
A: Hard handover: connection to old cell is broken before new cell connection is established (GSM). Soft handover: simultaneous connection to multiple cells during handover (CDMA). Softer handover: connection to two sectors of the same base station. LTE uses hard handover with X2 (eNodeB-to-eNodeB) or S1 (via core) depending on configuration.

**Q4: What is a PIM (Passive Intermodulation)?**
A: Unwanted mixing of signals in passive components (connectors, cables, antennas) that generates new frequencies at harmonics. Caused by loose connections, corrosion, or non-linear materials. Critical in base station antennas — PIM below -150 dBc typically required. Poor PIM causes noise floor rise, degrading uplink performance.

**Q5: What is MIMO and why is it used in 5G?**
A: Multiple Input Multiple Output — using multiple antennas at both transmitter and receiver. Benefits: spatial multiplexing (multiple data streams simultaneously = higher throughput), diversity gain (reliability), beamforming (directed signals = better SNR). 5G Massive MIMO uses 64 or more antennas at base station (64T64R). Beamforming directs energy precisely toward UE, reducing interference, improving capacity.

**Q6: What is the difference between roaming and handover?**
A: Handover (handoff): mobile moves between cells while maintaining an active call — transparent to user. Occurs within same network. Roaming: subscriber uses a visited network different from home network. Authentication via HLR/HSS — MAP protocol queries home network. User may be charged roaming rates.

**Q7: What is latency and what causes it in telecom networks?**
A: End-to-end delay for a packet to travel from source to destination. Components: propagation delay (speed of light in medium — fiber ≈ 5 µs/km), transmission delay (packet size/link rate), queuing delay (congestion at routers), processing delay (routing table lookup). 5G targets < 1ms user-plane latency by placing UPF close to RAN (edge computing, MEC).

**Q8: Explain PDGM for Home Health billing.**
A: Patient Driven Groupings Model — Medicare payment system for home health services effective January 2020. Groups patients by clinical characteristics, functional impairment, and comorbidities to determine reimbursement. Replaced OASIS-based HHPPS. 30-day payment periods. 432 PDGM groups determined by: timing (early/late), admission source (institutional/community), clinical grouping (9 categories), functional impairment level, comorbidity adjustment.


**Q: What is the purpose of a guard band in FDM?**
Prevents interference between adjacent frequency channels. Provides frequency separation so signals don't bleed into neighbouring channels.

**Q: What is VSWR and ideal value?**
Voltage Standing Wave Ratio — measures impedance mismatch on transmission line. VSWR=1 = perfect match (all power transferred). VSWR=2 = about 11% power reflected. Target VSWR < 1.5 for antenna systems.

**Q: What is the Nyquist sampling theorem?**
Sampling rate must be at least twice the maximum signal frequency to reconstruct the original signal without aliasing. Voice telephony: 4kHz bandwidth → 8kHz sampling rate → 8000 samples/sec × 8 bits = 64kbps per voice channel (G.711).

**Q: What is ATM in telecom?**
Asynchronous Transfer Mode: cell-based switching using fixed 53-byte cells (5-byte header + 48-byte payload). Used in legacy backbone networks. Replaced by IP/MPLS in modern networks.

**Q: Explain different types of optical fiber connectors.**
SC (Subscriber Connector): push-pull, used in data centers. LC (Lucent Connector): small form factor, common in high-density. FC (Ferrule Connector): threaded, used in high-vibration environments. ST (Straight Tip): bayonet mount, older installations. MTP/MPO: multi-fiber (12 or 24 fibers), trunk cables in data centers.

## Quick Reference — Bsnl Jto Prep

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the telecom academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader telecom ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
