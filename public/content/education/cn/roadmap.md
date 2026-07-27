# Computer Networks — Learning Roadmap

## Estimated Time to GATE/Interview-Ready
**8-10 weeks** of consistent learning (2-3 hours/day) — CN is 8-10 marks in GATE CSE and heavily tested in backend/infrastructure interviews, making this genuinely dual-purpose preparation.

## Phase 1: Foundation (Week 1-2)

- The OSI and TCP/IP models, and the data unit (PDU) at each layer — segment, packet, frame, bits
- IP addressing and subnetting basics
- Complete the Fundamentals section in this course

**Checkpoint:** can you map any common protocol (HTTP, TCP, IP, Ethernet) to its correct OSI layer, and explain what it's actually responsible for at that layer?

## Phase 2: Transport and Network Layer Depth (Week 2-5)

- TCP vs. UDP: the real reliability/ordering trade-off, not just "TCP is reliable, UDP isn't"
- The TCP three-way handshake, and connection teardown
- IP routing basics: how a packet actually finds its way across networks
- Complete Project 1 (TCP chat application) from this course's Projects section

**Checkpoint:** can you explain, step by step, what happens during a TCP three-way handshake and why it takes three steps specifically, not two?

## Phase 3: Protocols and Applied Practice (Week 5-8)

- DNS, HTTP/HTTPS, and how a URL resolves to an actual connection
- Subnetting numerical problems — this is one of the most consistently tested CN topics, both in GATE and interviews
- Complete Project 2 (UDP vs. TCP reliability demo) from this course's Projects section

**Checkpoint:** given a network address and subnet mask, can you correctly calculate the network address, broadcast address, and usable host range, without a calculator tool?

## Phase 4: Packet-Level Understanding and Interview/GATE Readiness (Week 8-10)

- Routing protocols (RIP, OSPF, BGP) at a conceptual level, and network security basics
- Complete Project 3 (packet capture and protocol analysis) and review this course's Interview Q&A section
- For GATE specifically: subnetting and OSI-layer-mapping questions are consistently high-yield

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Layered Architecture | OSI/TCP-IP models and what each layer actually does |
| Transport Protocols | TCP vs. UDP trade-offs, in practice not just theory |
| Addressing | IP addressing, subnetting, and numerical fluency |
| Application Protocols | DNS, HTTP/HTTPS, and real connection setup |
| Socket Programming | Building actual networked applications, not just describing them |

## Weekly Study Plan

```
Monday:    New concept — fundamentals/intermediate section + examples
Tuesday:   Subnetting/numerical practice problems
Wednesday: Redo problems you got wrong on Monday/Tuesday
Thursday:  Work on the relevant portfolio project
Friday:    Review previous-year GATE questions on the topic
Weekend:   Timed practice test, or continue project work
```

## Red Flags to Avoid

- ❌ Memorizing "TCP is reliable, UDP is fast" without understanding the actual mechanisms (sequence numbers, ACKs, retransmission) that make TCP reliable
- ❌ Skipping subnetting practice — this is one of the most consistently tested numerical topics in both GATE and interviews
- ❌ Never writing any actual networking code — socket programming makes the theory concrete in a way pure reading doesn't
- ❌ Treating the OSI model as trivia to recite instead of a framework for understanding where a given protocol or problem actually lives
- ❌ Studying HTTP/DNS without ever capturing real traffic to see what an actual request/response looks like

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Interview Q&A
- **GATE previous-year papers**: subnetting and OSI-layer questions recur with high consistency
- **Wireshark**: free, and the single best tool for making networking concepts concrete through real packet capture
- **Computer Networking: A Top-Down Approach (Kurose, Ross)**: a widely used standard reference

## Getting GATE/Interview-Ready

1. **Portfolio**: the projects in this course's Projects section — a working socket-programming project is a strong, concrete signal, especially for infrastructure/backend-adjacent roles
2. **Subnetting fluency**: practice until IP/subnet calculations are fast and automatic — this comes up constantly in both GATE and interviews
3. **GATE-specific practice**: subnetting numerical problems and OSI-layer mapping questions are consistently high-yield
4. **Interview readiness**: be ready to explain the TCP handshake, a DNS lookup, and TCP-vs-UDP trade-offs with concrete detail, not textbook definitions
5. **Use packet capture to build real intuition**: having actually looked at real TCP handshake or DNS query packets makes your explanations noticeably more credible and concrete in an interview
