# RTL Design & Computer Architecture — Interview Q&A

## Common Questions and Answers

**Q: What's the practical tradeoff between a Moore machine and a Mealy machine, and how would you choose?**

A: A Moore machine's output depends only on the current state, so the output only changes on a clock edge (when the state changes) — this makes it more predictable and glitch-free, but usually needs one extra state compared to an equivalent Mealy design (a dedicated state just to hold the output value). A Mealy machine's output depends on state AND the current input together, so it typically needs fewer states — the "101" sequence detector from Overview asserts `detected` directly on the transition out of S2 rather than needing a fourth state just to hold that output — but the output can glitch mid-cycle if the input is noisy, since it reacts immediately rather than waiting for a clock edge. In practice: Mealy for area-constrained designs where state count matters, Moore when output timing predictability matters more than state count.

---

**Q: What are the three classic types of pipeline hazards, and which one does forwarding solve?**

A: Structural hazards occur when two instructions in different pipeline stages need the same physical hardware resource simultaneously (e.g., both wanting to access memory in the same cycle) — solved by duplicating resources or stalling. Data hazards occur when an instruction needs a result that a previous, still-in-flight instruction hasn't finished computing yet — the primary fix is forwarding (also called bypassing): routing the result directly from the producing stage to the consuming stage before it's officially written back, rather than waiting for the full pipeline to drain. Control hazards occur when the pipeline doesn't yet know which instruction to fetch next because a branch hasn't been resolved — handled with branch prediction (used in the next question) or pipeline stalling until the branch resolves.

---

**Q: How do you calculate the CPI (cycles per instruction) cost of branch misprediction, and why does pipeline depth make it worse?**

A: The extra CPI from misprediction is: (fraction of instructions that are branches) × (misprediction rate) × (misprediction penalty in cycles). For a processor where 20% of instructions are branches, 10% of those are mispredicted, and each misprediction costs 2 flushed cycles (a 4-stage pipeline resolving branches in the Execute stage, so the 2 already-fetched instructions behind it must be discarded): extra CPI = 0.20 × 0.10 × 2 = 0.04, giving an effective CPI of 1.0 + 0.04 = 1.04 instead of an ideal 1.0. Deeper pipelines make this worse because the misprediction penalty (the number of stages that must be flushed) scales with how many stages sit between instruction fetch and branch resolution — a 20-stage pipeline resolving branches late pays a far larger penalty per misprediction than a shallow 4-stage one, even at the identical misprediction rate.

---

**Q: What's the difference between setup time and hold time, and what happens if either is violated?**

A: Setup time is how long before the clock edge a flip-flop's input must already be stable; hold time is how long after the clock edge the input must remain stable. A setup violation happens when the combinational logic feeding a flip-flop is too slow (the critical-path/timing-closure scenario from Fundamentals) — the input hasn't settled by the time the clock edge arrives, and the flip-flop may capture an incorrect or metastable value. A hold violation happens when a signal changes too soon after the clock edge — typically because a path between two flip-flops is too fast with too little delay, letting a new value race through before the receiving flip-flop has finished capturing the previous one. Setup violations are usually fixed by speeding up logic (or slowing the clock); hold violations are counterintuitively fixed by adding delay to a path that's too fast — both are core deliverables of static timing analysis, covered in depth in Physical Design & Fabrication.

---

**Q: Why does RTL code need to be synthesizable, and what does the synthesis process actually do to the "101" detector or the counter from Overview/Fundamentals?**

A: Synthesizable RTL is a description a tool can mechanically translate into an actual gate-level netlist — real AND/OR/flip-flop instances wired together, ready for the Physical Design & Fabrication steps that turn that netlist into silicon. Synthesis takes the state register (`always @(posedge clk) state <= next_state;`) and maps it to a bank of real flip-flops, and takes the next-state/output combinational logic (the `case` statement) and maps it to real gates implementing that logic — conceptually the same kind of gate network you'd get by hand-deriving K-maps for every state transition in Digital Logic Fundamentals, just done automatically and at a scale (millions of gates) no human would attempt by hand. This is also exactly why the blocking-vs-non-blocking and latch-inference rules from HDL — Verilog & VHDL matter so much: a synthesis tool interprets RTL code literally, so a coding mistake there becomes a real, physically wrong circuit, not just a simulation quirk.

---

**Q: What's the practical difference between latency and throughput, and why can pipelining improve one without improving the other?**

A: Latency is how long a single instruction (or single unit of work) takes from start to finish; throughput is how many instructions finish per unit of time once the pipeline is running steadily. Pipelining doesn't make any individual instruction move through its 4 stages any faster — a single instruction still takes exactly 4 cycles start to finish, so latency is unchanged. What improves is throughput: once the pipeline is full, a new instruction completes every single cycle instead of every 4 cycles, because multiple instructions are in different stages simultaneously (the car-wash analogy from Fundamentals). The 5-instruction example — 20 cycles unpipelined vs. 8 cycles pipelined — is entirely a throughput improvement; the first instruction through the pipeline still personally takes 4 cycles either way.

## Study Resources
- **David Harris & Sarah Harris, *Digital Design and Computer Architecture*** — the standard reference for FSM design, pipelining, and hazards referenced throughout this Q&A set
- **John Hennessy & David Patterson, *Computer Organization and Design*** — the standard deeper reference for CPI, pipeline hazards, and branch prediction
- **ASIC World — Static Timing Analysis Basics** (asic-world.com) — free reference for the setup/hold-violation mechanics referenced above
