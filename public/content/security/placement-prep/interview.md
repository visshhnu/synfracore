# Placement Interview Q&A

**Q: What is time complexity and how do you analyse it?**
Time complexity describes how algorithm runtime grows as input size n increases. Analysis: count the dominant operations and express as Big O. O(1) constant, O(log n) logarithmic, O(n) linear, O(n log n) log-linear, O(n²) quadratic, O(2^n) exponential. Drop constants and lower-order terms — only the dominant term matters. Always provide both time AND space complexity. For recursive algorithms: write the recurrence relation and solve using the Master Theorem.

**Q: Floyd's cycle detection algorithm — how does it work?**
Use two pointers: slow (moves 1 step) and fast (moves 2 steps). Start both at head. If they meet at any point → cycle exists. If fast reaches null → no cycle. Time: O(n), Space: O(1). Optimal solution. To find cycle START: after meeting, reset one pointer to head, move both one step at a time — they meet at cycle entry. Alternative: hash set of visited addresses — O(n) time, O(n) space.

**Q: Stack vs heap memory?**
Stack: Automatic management; function frames and local variables; LIFO; contiguous; fast allocation; limited size (typically 1-8 MB per thread); thread-private.
Heap: Manual management (or garbage collector); dynamic allocation (malloc/new); larger; slower allocation; fragmentation possible; shared across threads (needs synchronisation).

**Q: The four pillars of OOP?**
Encapsulation: Bundle data + methods; restrict direct access (private fields); expose via public interface. Protects data integrity and reduces coupling.
Abstraction: Show only what's necessary; hide complexity. Reduces cognitive load.
Inheritance: Child class inherits attributes and methods from parent. Code reuse. "Is-a" relationship.
Polymorphism: Same interface, different implementations. Runtime (method overriding) and compile-time (method overloading). Enables flexible, extensible code.

**Q: What is a deadlock and how do you prevent it?**
Deadlock: two or more processes each holding a resource and waiting for a resource held by another — circular wait. Four necessary conditions (Coffman): mutual exclusion, hold-and-wait, no preemption, circular wait. Prevention: eliminate any ONE condition. Most practical: always acquire locks in a consistent global ordering (eliminates circular wait); use tryLock with timeout (enables preemption); lock only what you need then release (eliminates hold-and-wait).

**Q: How does HTTPS work?**
1. Client connects; server presents TLS certificate (contains public key, signed by trusted CA).
2. Client verifies certificate against trusted CA list.
3. Client generates symmetric session key, encrypts with server's public key, sends it.
4. Server decrypts with private key — both now share the session key.
5. All subsequent communication encrypted with symmetric session key (fast AES encryption).
Asymmetric (RSA/ECC) used only for secure key exchange; symmetric (AES-256) for actual data — best of both worlds. TLS 1.3 simplifies this handshake further.

**Q: Database indexing — when to add indexes?**
B+ tree structure on one or more columns enabling O(log n) lookup instead of O(n) full table scan. Trade-offs: faster reads, slower writes (index updated on every INSERT/UPDATE/DELETE), extra storage.
Add indexes on: primary key (automatic), foreign key columns (JOINs), columns in frequent WHERE clauses, columns in ORDER BY of slow queries, covering indexes for critical frequently-run queries.
Avoid indexes on: low-cardinality columns (boolean — index rarely helps), very frequently written tables (write overhead outweighs read benefit), small tables (full scan is fast enough anyway).

**Q: What is the CAP theorem?**
In a distributed system, you can guarantee at most two of three properties:
Consistency: every read returns the most recent write.
Availability: every request receives a response (not necessarily latest data).
Partition Tolerance: system continues operating despite network partitions.
Since network partitions are inevitable in real distributed systems, the real choice is CP or AP.
CP examples: HBase, Zookeeper, MongoDB (strong consistency mode).
AP examples: Cassandra, CouchDB, DynamoDB.
Most systems tune: strong consistency where required, eventual consistency elsewhere.

**Q: SOLID principles — what are they?**
S — Single Responsibility: Class has one reason to change; does one thing well.
O — Open/Closed: Open for extension (add behaviour); closed for modification (don't change existing working code).
L — Liskov Substitution: Subtypes must be usable wherever their parent type is expected without breaking the program.
I — Interface Segregation: Many specific interfaces > one fat general-purpose interface.
D — Dependency Inversion: Depend on abstractions (interfaces), not concrete implementations. High-level modules should not depend on low-level modules.
Result: Code that is maintainable, testable, extensible, and resistant to cascading changes.

**Q: What is the difference between REST and GraphQL?**
REST: Architectural style using HTTP methods (GET, POST, PUT, DELETE) on resource URLs. Fixed response structure — server defines what data is returned. Multiple endpoints for different resources. Over-fetching (getting more data than needed) and under-fetching (needing multiple requests) are common issues. Simple, widely understood, works well for simple CRUD APIs.
GraphQL: Query language where CLIENT specifies exactly what data it needs in a single request. Single endpoint. No over- or under-fetching. Strong typing with schema. More complex to implement; powerful for complex, highly variable data requirements. Facebook developed it to solve mobile API efficiency problems. Choose REST for simple APIs; GraphQL for complex, evolving APIs with diverse client data needs.

**Q: What is garbage collection and how does it affect application performance?**
Garbage collection (GC): automatic memory management — the runtime identifies and frees memory occupied by objects no longer reachable. Types: mark-and-sweep (find all reachable objects, delete the rest), generational (most objects die young; focus on young generation), reference counting (Python, Swift). Performance impact: GC pauses — "stop-the-world" events where application stops while GC runs. Mitigation: concurrent/incremental GC (G1, ZGC in Java), tuning heap size and GC parameters, minimising object allocation in hot paths. Trade-off: developer productivity (no manual malloc/free) vs latency predictability.

**Q: What is the difference between synchronous and asynchronous programming?**
Synchronous: operations execute sequentially — each operation must complete before the next starts. Simple to reason about but blocks execution when waiting for slow operations (file I/O, network calls). Thread sits idle during wait.
Asynchronous: operations can start and the program continues executing other work while waiting for the slow operation to complete. Results handled via callbacks, promises/futures, or async/await syntax. Essential for: web servers handling thousands of concurrent requests, UI applications (don't freeze while fetching data), microservices communication. JavaScript is single-threaded but handles concurrency through async/await + event loop. Python asyncio and Java CompletableFuture provide similar patterns.
