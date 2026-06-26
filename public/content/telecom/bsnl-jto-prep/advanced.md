# JTO Advanced — 5G Core & NFV/SDN

## NFV & SDN — The Network Transformation

### SDN (Software Defined Networking)
- Separates **control plane** (routing decisions) from **data plane** (packet forwarding)
- Centralized SDN Controller (e.g. OpenDaylight, ONOS)
- Southbound interface: OpenFlow protocol (controller → switches)
- Northbound interface: REST APIs (applications → controller)
- Benefits: Programmable, centrally managed, vendor-agnostic

### NFV (Network Functions Virtualisation) — ETSI NFV Framework
- Replaces dedicated hardware with software running on COTS servers
- **VNF (Virtual Network Function):** Software implementation of a network function (vFirewall, vRouter, vEPC)
- **NFVI (NFV Infrastructure):** Compute + Storage + Network resources
- **MANO (Management and Orchestration):**
  - VIM (Virtual Infrastructure Manager) — OpenStack, VMware vSphere
  - VNFM (VNF Manager) — lifecycle management of VNFs
  - NFVO (NFV Orchestrator) — end-to-end service orchestration

**Telecom use cases:**
- vEPC (virtualised EPC): Full 4G core as VNFs
- vIMS (virtualised IP Multimedia Subsystem): Voice over LTE
- vCPE (virtual Customer Premises Equipment): Replace hardware at customer site
- vRAN (virtual RAN): Baseband units in data center

---

## 5G Network Slicing

A 5G network can be divided into multiple isolated virtual networks (slices) on the same physical infrastructure:

| Slice Type | 3GPP Name | Latency | Speed | Use Case |
|------------|-----------|---------|-------|----------|
| Broadband | eMBB | < 10ms | > 1 Gbps | Video streaming, AR/VR |
| Mission Critical | URLLC | < 1ms | Moderate | Autonomous vehicles, surgery |
| IoT | mMTC | Tolerant | Low | Smart meters, sensors |

Each slice has dedicated AMF, SMF, UPF (or shared depending on design). Network Slice Selection Assistance Information (NSSAI) identifies the slice.

---

## BSNL JTO Previous Year Questions (Pattern)

**Electronics:**
Q1: In a series resonant circuit, at resonance, the impedance is:
Answer: Equal to resistance R only (L and C reactances cancel)

Q2: The noise figure of a cascaded system (Friis formula):
NF_total = NF1 + (NF2-1)/G1 + (NF3-1)/(G1×G2) + ...
Answer: First stage noise figure is most critical

**Communication:**
Q3: OFDM is used in LTE because:
Answer: Resilience to multipath fading; efficient spectrum use; allows flexible subcarrier allocation

Q4: For a bandwidth of 1 MHz and SNR of 30 dB, Shannon capacity is:
C = B × log2(1 + SNR) = 1 × 10⁶ × log2(1001) ≈ 10 Mbps

**Networking:**
Q5: Which layer of OSI model is responsible for routing?
Answer: Network Layer (Layer 3) — IP protocol

Q6: The maximum segment size in TCP is negotiated during:
Answer: Three-way handshake (SYN exchange) — MSS option
