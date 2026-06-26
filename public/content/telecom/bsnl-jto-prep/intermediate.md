# JTO Intermediate — Telecom Systems & Network Management

## OSS/BSS Systems — What Telco Engineers Work With

Source content (from original learn platform):
OSS, BSS, TeMIP, UOC, UTM, UCA, NFV, 5G — how telecom networks work
OverviewOSS & BSSTeMIPUOCUTMUCANFV & 5GInterview Q&A
📡 Telecom Industry Overview
What is Telecom and why DevOps engineers are in high demand
Telecom (telecommunications) is the infrastructure that carries every phone call, mobile data packet, and internet connection worldwide. A major telecom operator like Vodafone or Airtel manages hundreds of thousands of network elements — base stations, routers, switches, fibre cables — across an entire country.
The shift happening right now: network functions that used to run on proprietary hardware boxes are moving to software running on Kubernetes. A 5G core network is now microservices. A network management platform like TeMIP runs on OpenShift. This is exactly why DevOps engineers with container and cloud skills are being hired by telcos.
How a telecom network is structured
Layer
What it is
Example
Radio Access Network (RAN)
Base stations, antennas — what your phone connects to
4G/5G towers, small cells
Transport Network
Fibre and microwave links carrying data between sites
Transmission links, GPON
Core Network
Routing, switching, subscriber management
4G EPC, 5G core (AMF, SMF, UPF)
OSS
Operations Support Systems — manage the network
TeMIP, UOC, UTM
BSS
Business Support Systems — manage the business
Billing, CRM, order management
Why this matters for your careerHPE TeMIP, UOC, UTM run on OpenShift and Kubernetes. The SRO (Service Relationship Objects) platform you know from HPE is a Kubernetes-native application. Every skill you have in K8s, Docker, Helm, ArgoCD applies directly to running these telecom platforms.
⚙️ OSS and BSS — The Two Pillars
OSS — Operations Support Systems
OSS manages the technical operation of the network. Think of it as the IT systems that the engineering and NOC (Network Operations Centre) teams use to keep the network running.
Fault Management — detect, correlate, and resolve network alarms. When a fibre is cut, thousands of alar

---

## SS7 Signaling System No. 7

SS7 is the signaling protocol used in the PSTN for call setup and control. Still used in core telecom networks for SMS delivery, number portability.

**SS7 Protocol Layers:**
- MTP 1 (Message Transfer Part 1): Physical — T1/E1 links
- MTP 2: Data link — error correction, sequencing
- MTP 3: Network — routing between signaling points
- SCCP (Signalling Connection Control Part): Network layer services for TCAP
- ISUP (ISDN User Part): Call setup/teardown for voice circuits
- TCAP (Transaction Capabilities Application Part): Queries (e.g. HLR lookup for roaming)
- MAP (Mobile Application Part): Mobile-specific — location update, roaming, SMS delivery
- INAP (Intelligent Network Application Part): Value-added services

**Signaling Points:**
- SSP (Service Switching Point): Telephone exchange
- STP (Signal Transfer Point): Routes SS7 messages
- SCP (Service Control Point): Database for intelligent services

---

## Network Management — OSS Architecture

**TMN (Telecommunications Management Network) — ITU-T M.3000 series:**
```
Business Management Layer (BML)
    ↓
Service Management Layer (SML) — SLAs, customer-facing
    ↓
Network Management Layer (NML) — end-to-end network view
    ↓
Element Management Layer (EML) — manages groups of NEs
    ↓
Network Element Layer (NEL) — actual devices
```

**Key OSS Components:**
- **Network Inventory:** Stores all network element details — topology, capacities
- **Fault Management:** Detects, correlates, routes alarms. TeMIP in telcos.
- **Performance Management:** KPIs — availability, throughput, latency, error rates
- **Configuration Management:** Provisions new services, manages device config
- **Security Management:** Access control, audit logs, encryption

---

## SDH/PDH — Transmission Hierarchy

**PDH (Plesiochronous Digital Hierarchy):**

| Level | Europe (E-carrier) | North America (T-carrier) |
|-------|-------------------|--------------------------|
| DS0 | 2 Mbps (E1) | 1.544 Mbps (T1) |
| Level 1 | E1 = 30 voice channels | T1 = 24 voice channels |
| Level 2 | E2 = 4× E1 = 8.448 Mbps | T2 = 4× T1 = 6.312 Mbps |
| Level 3 | E3 = 16× E1 = 34.368 Mbps | T3 = 28× T1 = 44.736 Mbps |
| Level 4 | E4 = 4× E3 = 139.264 Mbps | T4 = 6× T3 = 274 Mbps |

**SDH (Synchronous Digital Hierarchy) — ITU-T G.707:**

| STM Level | Bit Rate | US Equivalent (SONET) |
|-----------|---------|----------------------|
| STM-1 | 155.52 Mbps | OC-3 |
| STM-4 | 622.08 Mbps | OC-12 |
| STM-16 | 2.488 Gbps | OC-48 |
| STM-64 | 9.953 Gbps | OC-192 |
| STM-256 | 39.813 Gbps | OC-768 |

SDH provides synchronous multiplexing, overhead bytes for management, pointer mechanism for flexible timing.

---

## Routing Protocols — Comparison

| Protocol | Type | Metric | Use |
|----------|------|--------|-----|
| RIP | Distance-vector | Hop count (max 15) | Small networks |
| OSPF | Link-state | Cost (= 10⁸/BW) | Enterprise, ISP |
| IS-IS | Link-state | Cost (configurable) | ISP backbone |
| EIGRP | Hybrid | Bandwidth + Delay | Cisco proprietary |
| BGP | Path-vector | AS-PATH, MED, Local Pref | Internet routing |

**OSPF Areas:**
- Area 0 (backbone): All inter-area traffic passes through
- Stub area: No external routes
- NSSA (Not-so-stubby): Limited external routes
- DR/BDR election on multi-access networks (Ethernet)

**BGP attributes (decision order):**
1. Highest WEIGHT (Cisco-local)
2. Highest LOCAL_PREF
3. Locally originated
4. Shortest AS_PATH
5. Lowest ORIGIN (i < e < ?)
6. Lowest MED
7. eBGP > iBGP
8. Lowest IGP metric to next-hop
9. Lowest Router-ID
