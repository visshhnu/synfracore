# HDL — Verilog & VHDL — Interview Q&A

## Common Questions and Answers

**Q: What's the difference between blocking (`=`) and non-blocking (`<=`) assignment, and when should each be used?**

A: Blocking assignment executes statements immediately and in order — a later statement in the same block can see an earlier statement's already-updated result. Non-blocking assignment evaluates every right-hand side using the values as they stood *before* the block ran, and applies all updates simultaneously at the end. The rule that follows: use non-blocking (`<=`) inside sequential (`always @(posedge clk)`) blocks, and blocking (`=`) inside combinational (`always @(*)`) blocks. The swap example on the Fundamentals page shows exactly why — `a = b; b = a;` with blocking assignment fails to swap (both end up equal to the original `b`), while `a <= b; b <= a;` with non-blocking assignment swaps correctly, because both right-hand sides are evaluated from the original, pre-edge values.

---

**Q: What causes a latch to be unintentionally inferred from combinational logic, and why is that usually a bug?**

A: It happens when an `always @(*)` block has a conditional path (an `if` without a matching `else`, or a `case` without a `default`) that leaves a signal unassigned under some condition. Verilog simulation semantics say an unassigned signal in a combinational block retains its previous value rather than resetting — which is level-sensitive latch behavior, not combinational logic. For example, `always @(*) begin if (sel) y = a; end` with no `else` means `y` holds its old value whenever `sel = 0`, tracing exactly like a latch across a sequence of inputs (confirmed by simulation trace: y stays at its last-assigned value through every `sel=0` event, only updating when `sel=1`). This is usually unintended and flagged by synthesis tools as a "latch inferred" warning, because real designs almost always want either a fully combinational block (every output assigned on every path) or an explicit, intentional flip-flop — not an accidental latch, which behaves unpredictably under timing analysis and is much harder to test.

---

**Q: What's the practical difference between `wire` and `reg` in Verilog, and does `reg` mean the signal is a physical register?**

A: `wire` represents a net — something continuously driven by a gate or `assign` statement, with no ability to hold a value on its own. `reg` represents a variable that holds its value between procedural assignments (inside `always` or `initial` blocks) until explicitly reassigned. Despite the name, `reg` does **not** automatically mean synthesis produces a physical flip-flop — a `reg` assigned inside a purely combinational `always @(*)` block (with all outputs covered on every path) still synthesizes to plain combinational logic, not a register. Whether a `reg` becomes a real flip-flop depends entirely on whether it's assigned inside a clocked (`posedge`/`negedge`) always block, not on the `reg` keyword itself — a common source of confusion for anyone new to the language.

---

**Q: Which Verilog constructs are synthesizable, and which are simulation-only?**

A: Constructs describing real hardware behavior — `assign`, `always` blocks with proper sensitivity lists, `case`/`if`, module instantiation — are synthesizable. Constructs meant for testbenches and simulation control — `#10` delay statements, `initial` blocks, `$display`/`$monitor` for printing, `force`/`release` — are simulation-only and have no physical hardware equivalent; a synthesis tool either ignores or errors on them if they appear in RTL meant to become a real chip. This split matters practically because RTL code (meant for synthesis, covered in RTL Design & Computer Architecture) and testbench code (meant only for simulation, covered in Functional Verification) are written with different rules even though both are technically "Verilog" — mixing simulation-only constructs into synthesizable RTL is a common early mistake.

---

**Q: In VHDL, what's the difference between a `signal` and a `variable`, and why does it matter for timing?**

A: A `signal` update is scheduled and only takes effect at the end of the current simulation delta cycle — functionally the VHDL equivalent of Verilog's non-blocking assignment, where every read within a process sees the *old* value until the process finishes. A `variable` update takes effect immediately, the same statement it's assigned in — functionally equivalent to Verilog's blocking assignment. The same swap-bug logic from the Fundamentals page applies directly: sequential VHDL logic describing registers should use `signal` assignments (`<=`), while `variable` assignments (`:=`) are typically reserved for local, immediate-effect calculations within a process, not for signals meant to represent real hardware state across clock edges.

---

**Q: Why do Verilog and VHDL both matter, if they describe the same underlying hardware concepts?**

A: Because industry adoption is regional and organizational rather than technical — the underlying concepts (nets vs. variables, blocking vs. non-blocking/signal-vs-variable timing, synthesizable vs. simulation-only constructs) are the same in both languages, just with different syntax and different strictness around typing (VHDL's strong typing catches certain mistakes at compile time that Verilog's looser typing would only catch during simulation or synthesis, if at all). A candidate who deeply understands *why* non-blocking assignment behaves the way it does in Verilog can typically pick up VHDL's `signal` timing model quickly, and vice versa — interviewers who ask about both languages are usually testing whether the underlying hardware-timing concept is understood, not just which syntax was memorized.

## Study Resources
- **Samir Palnitkar, *Verilog HDL*** and **Peter Ashenden, *The Designer's Guide to VHDL*** — the standard reference textbooks for the language-specific mechanics referenced throughout this Q&A set
- **Sunburst Design — "Nonblocking Assignments in Verilog" (Cliff Cummings paper)** — the widely cited industry-standard reference for the blocking/non-blocking distinction, referenced repeatedly above
- **ASIC World — Verilog and VHDL Tutorials** (asic-world.com) — free reference covering latch inference, synthesizable vs. simulation-only constructs, and side-by-side Verilog/VHDL comparisons
