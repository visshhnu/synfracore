# Telco Products — Fundamentals

## The network domains every telco platform maps onto

Before any specific product (TeMIP, vTeMIP, UOC) makes sense, the three physical domains they all manage need to be clear, because almost every telco management concept is scoped to one or more of them:

| Domain | What it covers | Example elements |
|---|---|---|
| RAN (Radio Access Network) | Everything that connects a subscriber's device to the network wirelessly | Base stations (BTS/eNodeB/gNodeB), antennas, radio controllers |
| Core Network | Call/session control, subscriber data, routing between RAN and the wider network | MSC, HLR/HSS, packet gateways |
| Transport | The physical/logical links connecting RAN sites back to the core | Microwave links, fiber (GPON/DWDM), leased lines |

A management platform like UTM (Unified Topology Manager) exists specifically because these domains, in a real network, number in the thousands of individual elements spread across a country — no NOC engineer manually tracks that by memory, and every fault-management or performance-management concept below is ultimately about making thousands of physically distributed elements visible and manageable from one place.

## OSS vs. BSS — the foundational split

Every telecom operator's IT estate is conventionally split into two halves with genuinely different concerns, and confusing which side a given task belongs to is a common beginner mistake:

- **OSS (Operations Support Systems)** — manages the *network itself*: fault management (what's broken right now), performance management (how well is it running), inventory (what equipment exists and where), and provisioning (activating new service on the network)
- **BSS (Business Support Systems)** — manages the *customer and revenue side*: CRM, billing, order management, product catalogue

The reason this split matters practically, not just organizationally: when a customer calls in about dropped calls, that's a BSS-side CRM ticket that needs correlating against OSS-side fault management data (is there an actual outage on the tower serving that customer) to determine if it's a real network issue or something else — the two systems have to integrate for that correlation to happen automatically rather than requiring a human to manually cross-reference two separate tools, which is exactly the kind of integration work most telco DevOps/platform teams spend their time on.

## Fault management — the OSS function most platforms center on

Fault management is the discipline of detecting, correlating, and surfacing hardware/software problems across the network before — or as soon as — they affect subscribers. Three concepts recur across every fault-management platform:

- **Alarm severity levels** — typically Critical, Major, Minor, Warning — a standardized scale so a NOC operator triaging hundreds of simultaneous alarms during a real incident can prioritize consistently rather than by gut feel per alarm
- **Alarm correlation** — a single physical failure (a fiber cut, a power outage at a site) commonly triggers dozens or hundreds of individual alarms from every dependent element downstream of it; correlation logic groups those into one root-cause alarm instead of leaving an operator to manually connect a flood of symptoms back to one cause
- **Manager of Managers (MoM)** — a real telco network runs equipment from multiple vendors (Nokia, Ericsson, Huawei), each with its own Element Management System reporting alarms in its own format; a MoM platform sits above all of them, normalizes alarms from every vendor's EMS into one consistent view, and is the architectural pattern behind platforms like TeMIP (covered in more depth on the Intermediate tab)

## Performance management — the other core OSS function

Where fault management answers "what's broken," performance management answers "how well is everything running, even when nothing is broken." This means continuously collecting KPIs (call drop rate, packet loss, throughput, latency) from every network element and feeding them into dashboards and trend analysis — the value isn't just real-time visibility, it's catching gradual degradation (a cell site's call drop rate creeping upward over weeks) before it becomes an outright fault-management incident. This is the same underlying philosophy as proactive monitoring in any IT operations context — catching a trend before it becomes an alert — applied specifically to physical network infrastructure rather than application/server metrics.

## Why this domain has been slow to modernize, and what's changing

Traditional OSS/BSS platforms (TeMIP among them) were built as large, monolithic, on-premises systems designed around the assumption of a small number of well-known vendor equipment types and a relatively static network topology. Two forces are pushing the industry toward the same cloud-native patterns used elsewhere in infrastructure: **virtualization** (vTeMIP, covered on Overview, runs as microservices on Kubernetes/OpenShift instead of dedicated hardware) and **5G's dramatically higher element density** (massive MIMO and small-cell deployments mean orders of magnitude more managed elements than 4G-era networks, which monolithic architectures don't scale to affordably). This is the direct reason DevOps practices — containerization, CI/CD, infrastructure as code — have become directly relevant to telecom operations teams in the last several years, not a generic trend applied for its own sake: the scale problem is real and specific to what 5G actually requires.
