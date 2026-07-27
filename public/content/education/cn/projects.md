# Computer Networks — Portfolio Projects

Build these to actually work with networking concepts at the packet/socket level — the difference between "I know the OSI model" and "I built a working client-server chat app and can explain exactly which layer each part operates at."

## Project 1: TCP Client-Server Chat Application (Beginner)

**Time:** 3-4 days

Build a basic multi-client chat application using raw TCP sockets — no frameworks, so the networking mechanics are actually visible in your code.

### Steps

1. Implement a TCP server that accepts multiple client connections (using threads or an event loop — either is fine for this scope)
2. Implement a TCP client that connects, sends messages, and receives broadcasts from other clients
3. Handle a client disconnecting gracefully — what happens to the server's view of that connection?
4. Add a simple protocol on top of raw TCP: how does your app distinguish "this is a username" from "this is a chat message"? (Even a simple delimiter-based format counts.)

### Skills Demonstrated
- Socket programming fundamentals (bind, listen, accept, connect, send, recv)
- Handling multiple concurrent connections
- Designing a minimal application-layer protocol on top of TCP

### Repository Name
`cn-tcp-chat-app`

---

## Project 2: UDP vs. TCP Reliability Demonstration (Intermediate)

**Time:** 4-5 days

Build two versions of a simple file-transfer or messaging tool — one over UDP, one over TCP — and deliberately demonstrate the reliability difference (packet loss, ordering) that the protocols handle differently.

### Steps

1. Implement basic file transfer over TCP (should "just work" reliably, since TCP handles ordering/retransmission)
2. Implement the same transfer over UDP (no built-in reliability — you'll likely see missing or out-of-order data under real network conditions, or you can simulate loss deliberately)
3. On the UDP version, implement a basic reliability layer yourself: sequence numbers and acknowledgments, so you understand concretely what TCP is doing for you automatically
4. Document, with actual test results, what happens differently between the TCP and raw UDP versions under simulated packet loss

### Skills Demonstrated
- Understanding the real, concrete difference between TCP and UDP, not just the textbook definitions
- Implementing basic reliability mechanisms (sequence numbers, ACKs) yourself
- Testing network code under adverse conditions, not just the happy path

---

## Project 3: Packet Capture and Protocol Analysis (Advanced)

**Time:** 1-2 weeks

Use a packet capture tool (Wireshark, or `tcpdump` with your own parsing) to capture and analyze real network traffic, then write up a detailed protocol-level walkthrough of what's actually happening during a common operation (a DNS lookup, a TCP handshake, an HTTPS connection setup).

### Steps

1. Capture traffic for a specific, well-defined operation (e.g., visiting a website you haven't cached DNS for)
2. Identify and trace: the DNS query/response, the TCP three-way handshake, and (if HTTPS) the TLS handshake
3. For each captured packet relevant to your trace, identify what layer it belongs to and what specific information it carries
4. Write a clear, illustrated walkthrough — screenshots or packet excerpts with your own explanation of what's happening and why
5. Optionally: write a simple script (Python + `scapy`, or similar) that parses a capture file and extracts the same information programmatically

### Skills Demonstrated
- Real packet-level analysis, connecting theory (OSI/TCP-IP layers) to actual captured traffic
- Understanding real-world protocol interactions (DNS, TCP handshake, TLS) concretely
- Technical writing that makes a complex process genuinely understandable

### Repository Name
`cn-packet-analysis-writeup`

---

## Tips for Great Projects

**Work with raw sockets, not a high-level networking library, at least once.** Frameworks hide exactly the mechanics you're trying to learn — building something with raw sockets (even something simple) teaches far more than using a library that handles connections for you.

**Test under real or simulated adverse conditions.** A chat app that only works on localhost with perfect conditions doesn't demonstrate understanding of what actually makes networking hard (latency, loss, reordering).

**Connect your project explicitly to the OSI/TCP-IP model.** For every project, be able to say precisely which layer each part of your code corresponds to — this connects hands-on work back to the theory that GATE and interviews actually test.

**For interviews specifically:** be ready to explain what actually happens during a TCP three-way handshake and a DNS lookup, step by step — these are extremely common CN interview questions, and having actually captured and analyzed one yourself makes the explanation far more concrete.

## Project Checklist
- [ ] At least one project using raw socket programming (not just a high-level networking library)
- [ ] At least one project directly demonstrating a TCP vs. UDP behavioral difference
- [ ] At least one project involving real packet capture/analysis
- [ ] Comfortable mapping any project component to its specific OSI/TCP-IP layer
- [ ] Clear documentation connecting what was built to the underlying networking concept
