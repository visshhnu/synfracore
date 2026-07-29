# Telecom Fundamentals — Cheatsheets

## Generational comparison

| Generation | Core technology | Multiple access | Switching | Voice mechanism |
|---|---|---|---|---|
| 1G | Analog cellular | FDMA | Circuit | Native analog |
| 2G | GSM / CDMA | TDMA (GSM) / CDMA | Circuit (voice) + packet (data, GPRS/EDGE) | Native circuit-switched |
| 3G | UMTS / CDMA2000 | WCDMA (CDMA-based) | Circuit (voice) + packet (data) | Native circuit-switched |
| 4G | LTE | OFDMA | All-IP / packet only | CSFB or VoLTE |
| 5G | NR | OFDMA | All-IP / packet only | VoNR (IMS-based) |

## Multiple-access techniques

| Technique | Mechanism | Generation |
|---|---|---|
| FDMA | Distinct frequency per user | 1G |
| TDMA | Distinct time slot per user, shared frequency | 2G (GSM) |
| CDMA | Unique code per user, shared frequency and time | 2G/3G (CDMA, WCDMA) |
| OFDMA | Flexible allocation of narrow orthogonal sub-carriers | 4G/5G (LTE, NR) |

## Circuit switching vs. packet switching

| Property | Circuit switching | Packet switching |
|---|---|---|
| Connection | Dedicated, continuous path for call duration | No dedicated path; independently routed packets |
| Efficiency | Wasteful during silence/idle | Efficient — resources used only when data sent |
| Used for | Traditional 2G/3G voice | Data (all generations); voice from 4G onward (VoIP/IMS) |
| Legacy example | GSM voice call | VoLTE / VoNR |

## GSM core architecture elements

| Element | Function |
|---|---|
| BSS (Base Station Subsystem) | Radio communication with mobile devices |
| NSS (Network Switching Subsystem) | Call routing, mobility management |
| HLR (Home Location Register) | Central database: subscriber identity, permissions, current location area |
| VLR (Visitor Location Register) | Temporary local copy of HLR data for subscriber's current area |
| MSC (Mobile Switching Centre) | Routes calls, queries HLR/VLR |
| HSS (4G/5G equivalent) | IMS-era functional descendant of HLR |

## Voice-over-IP transition quick reference

| Term | Meaning |
|---|---|
| CSFB | Circuit-Switched Fallback — LTE device drops to 2G/3G circuit-switched network for a call |
| VoLTE | Voice over LTE — voice carried as packetized IP data over LTE, using IMS signaling |
| VoNR | Voice over New Radio — VoLTE's 5G-native equivalent, same IMS-based pattern |
| IMS | IP Multimedia Subsystem — signaling architecture for all-IP voice |
| SS7 | Signaling System No. 7 — legacy circuit-switched-era signaling protocol |

## Handover types

| Type | Mechanism | Used by |
|---|---|---|
| Hard handover | Break-before-make — old connection ends before new one starts | GSM |
| Soft handover | Make-before-break — both connections briefly active simultaneously | CDMA |

## Coverage vs. capacity — spectrum quick reference

| Frequency | Coverage | Capacity | Typical use |
|---|---|---|---|
| Lower | Longer range, better obstacle penetration | Lower | Rural/wide-area, 2G/3G bands |
| Higher | Shorter range, poor obstacle penetration | Higher | Dense urban, 5G mmWave |

`(needs verification — recheck against current source: specific spectrum band allocations and auction outcomes are periodically revised by regulatory policy.)`
