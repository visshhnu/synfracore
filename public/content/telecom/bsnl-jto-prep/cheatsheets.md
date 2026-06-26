# JTO Cheatsheet — Quick Reference

## Frequency Bands

```
VLF (3-30 kHz)    — submarine comms
LF (30-300 kHz)   — AM radio (long wave)
MF (300kHz-3MHz)  — AM radio (medium wave)
HF (3-30 MHz)     — shortwave, amateur radio
VHF (30-300 MHz)  — FM radio, TV, 4G Band 7
UHF (300MHz-3GHz) — TV, 4G/5G (700MHz-2.6GHz), WiFi, Bluetooth
SHF (3-30 GHz)    — satellite, microwave, 5G mmWave starts here
EHF (30-300 GHz)  — mmWave 5G (28/39 GHz), radar
```

## 5G Key Parameters

```
5G NR peak speed:   20 Gbps DL, 10 Gbps UL
Latency:            < 1ms (URLLC), < 4ms (eMBB)
Connection density: 1 million devices per km²
Frequencies:        FR1 (< 6GHz), FR2 (24-100 GHz mmWave)
Modulation:         Up to 256-QAM
MIMO:               Massive MIMO (64T64R or higher)
Numerology:         μ=0 (15kHz), μ=1 (30kHz), μ=3 (120kHz for mmWave)
```

## E1 / T1 Quick Facts

```
E1:  32 timeslots × 64kbps = 2.048 Mbps
     30 voice + 1 signaling + 1 framing = 32 total
T1:  24 timeslots × 64kbps = 1.544 Mbps
     24 voice + framing = 25 total
STM-1 = 155.52 Mbps = 63 × E1s
```

## OSI 7 Layers

```
7 Application   — HTTP, FTP, SMTP, DNS, SIP
6 Presentation  — SSL/TLS, encoding, compression
5 Session       — RPC, NetBIOS, session management
4 Transport     — TCP, UDP, SCTP (segments/datagrams)
3 Network       — IP, ICMP, OSPF, BGP (packets)
2 Data Link     — Ethernet, WiFi, PPP (frames)
1 Physical      — Copper, Fiber, Radio (bits)
```

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
