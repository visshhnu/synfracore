# Telecom Networking — Cheatsheets

## TCP vs. UDP for telecom traffic

| Property | TCP | UDP |
|---|---|---|
| Delivery guarantee | Reliable, ordered | Best-effort, no ordering guarantee |
| Latency impact | Higher (retransmission, ordering) | Lower |
| Typical telecom use | SIP signaling transport (can also use UDP) | VoIP media (RTP), most SIP deployments |

## SIP call flow quick reference

| Step | Message/Action |
|---|---|
| 1 | INVITE — initiate session |
| 2 | Ringing / provisional response |
| 3 | 200 OK — call answered |
| 4 | Media flows via RTP |
| 5 | BYE — call ends |

## IMS architecture components

| Component | Function |
|---|---|
| P-CSCF | Subscriber's first point of contact into IMS network |
| S-CSCF | Handles session control/routing for the subscriber |
| I-CSCF | Routes signaling to correct S-CSCF from external networks |
| HSS | Subscriber profile/authentication database (IMS-era HLR equivalent) |
| SBC | Network-edge NAT traversal, security, interoperability management |

## MPLS vs. standard IP routing

| Property | Standard IP routing | MPLS |
|---|---|---|
| Forwarding decision | Full routing-table lookup per hop | Label-based, faster |
| Path control | Best-path per routing protocol only | Explicit traffic engineering possible |
| QoS differentiation | Limited | Supports guaranteed bandwidth/priority per class |

## SD-WAN vs. traditional MPLS-only WAN

| Property | Traditional MPLS-only WAN | SD-WAN |
|---|---|---|
| Transport | Single dedicated MPLS circuit | Multiple: MPLS, broadband, cellular |
| Control | Static provisioning | Dynamic, software-orchestrated |
| Cost profile | Higher (all traffic on premium circuit) | Lower (critical traffic on MPLS, rest on cheaper transport) |
| Relationship | — | Orchestration layer; can still use MPLS as one transport option |

## Key protocol/term glossary

| Term | Meaning |
|---|---|
| SIP | Session Initiation Protocol — VoIP call signaling |
| RTP | Real-time Transport Protocol — carries voice/video media |
| IMS | IP Multimedia Subsystem — architecture underlying VoLTE/VoNR |
| MPLS | Multiprotocol Label Switching — carrier traffic engineering |
| SD-WAN | Software-Defined WAN — dynamic multi-transport orchestration |
| SBC | Session Border Controller — edge NAT/security/interop management |

`(needs verification — recheck against current source: SBC vendor implementations and SD-WAN/MPLS adoption patterns evolve.)`
