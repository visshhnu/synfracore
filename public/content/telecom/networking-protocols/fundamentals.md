# Telecom Networking — Fundamentals

## TCP/IP in a telecom context

TCP/IP is the general-purpose protocol suite underlying essentially all modern data networking, and telecom networks are no exception — the **IP layer** handles addressing and routing packets across networks, while **TCP** (for connection-oriented, reliable delivery) and **UDP** (for lighter-weight, connectionless delivery) sit above it handling how data is actually transported end to end. Telecom-specific applications choose deliberately between them: SIP signaling and most VoIP media traffic favor UDP, since a small amount of occasional packet loss in a live voice call is more tolerable than the added latency of TCP's retransmission and ordering guarantees — a dropped audio sample is barely noticeable, but a delayed one due to retransmission is often worse for real-time voice quality.

## SIP — session signaling for VoIP

**SIP (Session Initiation Protocol)** handles the signaling side of a VoIP call: establishing ("inviting") a session between two endpoints, negotiating session parameters (like which audio/video codecs both sides support), and tearing the session down when the call ends. SIP is deliberately analogous in role to SS7 (Telecom Fundamentals) — both are signaling protocols distinct from the actual media/bearer path — but SIP is text-based (readable, HTTP-like in structure) and designed natively for IP networks, whereas SS7 was designed for the circuit-switched telecom world that predates widespread IP adoption. A basic SIP call flow: an INVITE message initiates the session, the far end responds (ringing, then answer), media flows over a separate protocol (commonly RTP — Real-time Transport Protocol) once the session is established, and a BYE message ends the call.

## Why signaling and media are separate protocols

SIP handles signaling; RTP (Real-time Transport Protocol) carries the actual voice/video media once a SIP session establishes it — this separation mirrors Telecom Fundamentals' SS7-versus-bearer-channel distinction in the circuit-switched world. The practical reason for keeping them separate: signaling and media have different requirements (signaling needs reliable delivery of a relatively small amount of control data; media needs low-latency, loss-tolerant delivery of a continuous stream), and separating the two protocols lets each be optimized for its actual job rather than compromising a single protocol to handle both reasonably.

## IMS — the architecture SIP operates within

**IMS (IP Multimedia Subsystem)** is the broader network architecture — not just a protocol — that telecom operators use to deliver IP-based multimedia services (voice, video, messaging) using SIP as its core signaling protocol. VoLTE and VoNR (Wireless Tech) are specific applications running on top of IMS architecture — IMS provides the session control, subscriber authentication, and service-routing framework, while SIP is the specific signaling protocol IMS uses to actually establish and manage those sessions.

## Getting started

1. Learn TCP vs. UDP's tradeoff (reliability vs. latency) before SIP specifics — it explains why VoIP media traffic is architected the way it is.
2. Treat SIP as SS7's IP-native successor conceptually, not an unrelated new protocol — the signaling-versus-bearer separation principle carries over directly.
3. Understand IMS as an architecture that *uses* SIP, not a synonym for SIP — this distinction matters for correctly relating VoLTE/VoNR (an IMS application) back to SIP (IMS's signaling protocol).
