# BSNL JTO & JE Exam Preparation

## What is the JTO / JE Exam?

**Junior Telecom Officer (JTO)** — Entry-level Group-B gazetted officer in BSNL and MTNL.
**Junior Engineer (JE)** — Similar grade in BSNL for technical roles.

These exams are conducted by BSNL directly (for external candidates) or through GATE scores.

---

## Recruitment Routes

### Route 1: GATE Score
- BSNL uses GATE (Electronics & Communication / Computer Science) scores for JTO recruitment
- GATE score valid for 3 years
- No separate written test — GATE + interview
- Most preferred route: well-structured preparation

### Route 2: BSNL Direct Written Exam (JTO/JE)
- BSNL conducts its own exam when vacancies are high
- Two papers: Paper I (Technical), Paper II (General Ability)
- 200 marks each, 3 hours each
- Multiple choice + some descriptive (depending on year)

### Route 3: Internal Promotion (BSNL employees only)
- Not applicable for fresh candidates

---

## JTO Exam Syllabus — Technical Paper

### Section A: Electronics & Communication
- **Electronic Devices:** PN junction, BJT, MOSFET, diodes, rectifiers, amplifiers
- **Analog Circuits:** Op-amps, filters, oscillators, feedback amplifiers
- **Digital Electronics:** Boolean algebra, K-maps, flip-flops, counters, ADC/DAC, microprocessors
- **Signals & Systems:** Fourier transform, Laplace, Z-transform, sampling theorem
- **Communication Systems:** AM, FM, PM; noise in communication; multiplexing (TDM, FDM, OFDM)
- **Electromagnetics:** Maxwell's equations, transmission lines, antennas, wave propagation
- **Microwave Engineering:** Waveguides, microwave devices, radar fundamentals

### Section B: Telecom Specific
- **Switching:** PSTN, circuit switching, packet switching, SS7 signaling
- **Transmission:** PDH, SDH, DWDM, OTN, optical fiber types
- **Mobile Networks:** GSM/GPRS/EDGE, 3G WCDMA, 4G LTE, 5G NR concepts
- **Data Networks:** TCP/IP, Ethernet, VLAN, MPLS, routing protocols (OSPF, BGP)
- **Network Management:** SNMP, TL1, CORBA interfaces, OSS/BSS systems

---

## 4G LTE Architecture — Deep Dive

```
UE (User Equipment)
    ↓ (air interface — LTE-Uu)
eNodeB (Evolved Node B) — base station
    ↓ (S1 interface)
EPC — Evolved Packet Core
    ├── MME (Mobility Management Entity) — signalling
    ├── SGW (Serving Gateway) — user data routing
    ├── PGW (PDN Gateway) — internet connectivity
    └── HSS (Home Subscriber Server) — subscriber database
    ↓ (SGi interface)
Internet / IMS
```

**Key LTE facts for exam:**
- Downlink: OFDMA — Orthogonal Frequency Division Multiple Access
- Uplink: SC-FDMA — Single Carrier FDMA
- Frequency bands: 700 MHz (rural coverage), 1800/2100/2600 MHz (urban)
- Theoretical peak: 100 Mbps downlink (LTE), 1 Gbps (LTE-A)
- Latency: < 10ms (LTE), < 1ms target (5G NR)
- Handover: X2 interface between eNodeBs (direct), S1 interface (via core)

---

## 5G NR (New Radio) — Key Concepts

**5G Frequency Bands:**
- **FR1 (Sub-6 GHz):** 600 MHz – 6 GHz. Good coverage, lower speed. Used for wide-area coverage.
- **FR2 (mmWave):** 24 GHz – 100 GHz. Very high speed, short range. Dense urban/indoor.

**5G Architecture:**
- **NSA (Non-Standalone):** 5G NR + 4G EPC. Option 3x. Faster deployment — uses existing LTE core.
- **SA (Standalone):** 5G NR + 5G Core (5GC). Full 5G — enables network slicing, ultra-low latency.

**5G Core (5GC) — Service Based Architecture:**
- AMF (Access & Mobility Function) — replaced MME
- SMF (Session Management Function) — replaced PGW-C/SGW-C
- UPF (User Plane Function) — replaced PGW-U/SGW-U
- UDM (Unified Data Management) — replaced HSS
- All functions communicate via HTTP/2 REST APIs (not point-to-point interfaces like 4G)

**Network Slicing:** Virtual networks within one physical 5G infrastructure. Example: one slice for eMBB (broadband), one for URLLC (autonomous vehicles, < 1ms latency), one for mMTC (IoT sensors).

---

## Optical Fiber Technology

**Types of fiber:**
- **SMF (Single Mode Fiber):** Core 8–10 µm. Long distance (100s of km). Used in backbone/transport.
- **MMF (Multi Mode Fiber):** Core 50–62.5 µm. Short distance (< 2 km). Used in data centers/LAN.

**Fiber amplifiers:**
- **EDFA (Erbium Doped Fiber Amplifier):** Amplifies 1550 nm window. Used in DWDM systems.
- **Raman Amplifier:** Amplifies using stimulated Raman scattering. Used for very long spans.

**DWDM (Dense Wavelength Division Multiplexing):**
- Multiple wavelengths on one fiber
- ITU-T grid: 100 GHz spacing (0.8 nm) — 80 channels per fiber
- Each channel carries 10/40/100/400 Gbps
- Total capacity: 80 × 400 Gbps = 32 Tbps per fiber pair

**FTTH (Fiber to the Home) — GPON:**
- Passive Optical Network — no active elements in field
- OLT (Optical Line Terminal) at exchange
- ODN (Optical Distribution Network) — passive splitters
- ONT/ONU at customer premises
- Downstream: 2.488 Gbps shared among 64–128 users
- Upstream: 1.244 Gbps
