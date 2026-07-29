# Telecom Fundamentals — Fundamentals

## Radio spectrum — the core scarce resource

Spectrum is the range of radio frequencies available for wireless communication, divided into licensed bands allocated by government regulators (in India, the Department of Telecommunications, via spectrum auctions) to specific operators for specific uses. Two properties matter most:

- **Lower frequencies** travel farther and penetrate obstacles (buildings, terrain) better, but carry less data capacity — historically used for wide-area coverage (2G/3G bands).
- **Higher frequencies** carry far more data capacity but travel shorter distances and penetrate obstacles poorly — used for high-capacity urban deployment (a driving reason 5G's higher-frequency mmWave bands need many more, closely-spaced cell sites than older generations).

This tradeoff — coverage vs. capacity — is the single most important spectrum concept, and it explains most network-planning decisions covered later in Intermediate/Advanced: an operator doesn't choose one "best" frequency, but combines multiple bands to balance wide-area coverage against urban capacity needs.

## Multiple access techniques — how many users share one channel

A cellular network must let many users share limited spectrum simultaneously without interfering with each other. Each generation is defined substantially by *how* it solves this:

| Technique | How it works | Used in |
|---|---|---|
| FDMA (Frequency Division) | Each user gets a distinct frequency slice | Early 1G |
| TDMA (Time Division) | Each user gets a distinct time slot on a shared frequency | GSM (2G) |
| CDMA (Code Division) | Each user's signal is spread using a unique code, allowing simultaneous use of the same frequency and time | CDMA (2G/3G), also underlies 3G UMTS (WCDMA) |
| OFDMA (Orthogonal Frequency Division, multiple access variant) | Divides spectrum into many narrow, orthogonal sub-carriers, allocated flexibly per user | 4G LTE, 5G NR |

The generational pattern worth understanding, not just memorizing: each newer technique generally allows more efficient spectrum use (more simultaneous users, higher aggregate throughput) than the one before — this efficiency gain, not just "newer is better" marketing, is the actual engineering reason for the multiple-access technique changing generation to generation.

## Circuit switching vs. packet switching

- **Circuit switching** (used for traditional 2G/3G voice calls) establishes a dedicated, continuous connection path between two parties for the full call duration — reliable and consistent, but wasteful, since the dedicated path is reserved even during silence in the conversation.
- **Packet switching** (used for data, and eventually for voice too via VoIP/IMS, covered in Networking Protocols) breaks communication into discrete packets, each routed independently and only using network resources when actual data is being sent — far more efficient for bursty traffic (like most data usage and even most voice, given how much of a call is actually silence), which is why the entire industry has moved toward all-IP, packet-switched architecture from 4G onward.

Understanding this shift explains a huge amount of telecom architecture history: 2G/3G networks needed separate circuit-switched (voice) and packet-switched (data) domains as genuinely different subsystems; 4G LTE was designed from the start as all-IP, treating voice as just another type of data traffic (requiring VoLTE — Voice over LTE — specifically because LTE's packet-only architecture has no native circuit-switched fallback of its own).

## GSM — core architecture concepts

GSM's network architecture divides into distinct functional areas: the **Base Station Subsystem (BSS)** handling radio communication with mobile devices, the **Network Switching Subsystem (NSS)** handling call routing and mobility management, and the **Home Location Register (HLR)** — a database tracking each subscriber's identity, service permissions, and current location, which is how a network knows where to route an incoming call to a mobile device that could be anywhere within the network's coverage. This HLR concept — a central subscriber database enabling mobility — is a foundational pattern that persists in modified form through every subsequent generation, including 5G's equivalent subscriber-data functions.

## Getting started

1. Master the coverage-vs-capacity spectrum tradeoff first — it's the lens through which nearly every later network-planning and generational-evolution topic makes sense.
2. Learn the multiple-access technique progression (FDMA → TDMA/CDMA → OFDMA) as one continuous efficiency story, not four unrelated acronyms to memorize.
3. Understand circuit vs. packet switching as the architectural fault line separating "traditional telecom" from "modern all-IP telecom" — this single concept explains why voice calling needed a specific technical solution (VoLTE) when networks moved to LTE.
