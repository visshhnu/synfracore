# Functional Verification — Interview Q&A

## Common Questions and Answers

**Q: What's the practical difference between directed testing and constrained-random testing?**

A: Directed testing writes specific, hand-picked stimulus for specific scenarios — Overview's testbench feeding the exact bit stream "1011010" into `seq_detector_101` is a directed test, chosen because it's known to contain two overlapping "101" occurrences. Constrained-random testing instead generates stimulus randomly, but within defined legal boundaries (constraints), letting the simulator explore combinations a human wouldn't necessarily think to write by hand — useful for finding corner-case bugs directed tests miss simply because nobody thought to write that specific case. In practice, real verification environments use both: directed tests to confirm specific known-important scenarios work exactly as expected (like RTL Design's exact traced sequence), and constrained-random testing layered with functional coverage (Fundamentals) to find what directed tests didn't anticipate.

---

**Q: What are the core UVM (Universal Verification Methodology) components, and what does each one do?**

A: A UVM testbench is built from a standard set of reusable component types: the **driver** converts high-level transactions into the actual pin-level signals applied to the DUT (the equivalent of Overview's `bit_in` stimulus loop, but reusable and randomizable); the **monitor** passively observes DUT signals without driving anything, converting pin-level activity back into transactions for checking; the **scoreboard** compares actual DUT outputs against an independently computed expected result — the automated version of the pass/fail comparison Overview's testbench did inline; the **sequencer** generates the stream of transactions (directed or constrained-random) that the driver applies; and an **agent** bundles a driver, monitor, and sequencer together as one reusable unit per interface. UVM's main value is that these components are standardized and reusable across projects, rather than every testbench reinventing its own ad hoc stimulus/checking code.

---

**Q: What's the difference between code coverage and functional coverage?**

A: Code coverage measures how much of the RTL *source code itself* was exercised during simulation — did every line execute, every branch of every `if`/`case` get taken, every FSM state get visited — and is typically generated automatically by the simulation tool without the verification engineer writing anything extra. Functional coverage (Fundamentals' covergroup example) measures whether specific *scenarios or values the engineer cares about* were exercised — the 0-15 coverage bins for `counter_4bit`, for instance — and must be explicitly written by the verification engineer, because a tool has no way to know which scenarios matter without being told. The two are complementary and neither substitutes for the other: 100% code coverage only proves every line ran at least once, not that every meaningful combination of values or sequence of events was tested — a test could execute every line of `seq_detector_101` without ever testing the overlapping-detection case from Overview's example.

---

**Q: If an assertion and a functional coverage bin can both catch the same class of bug, why use both instead of just one?**

A: They answer different questions and fail differently, as the Fundamentals "missing value 8" example showed directly: an assertion catches a violation the instant it happens, at the precise cycle, which is invaluable for debugging (you know exactly where and when things went wrong). A coverage bin doesn't catch a violation at all by itself — it only reports, after the fact, that a particular value or scenario was never exercised, which is useful even when nothing is actually broken (e.g., confirming a rare-but-legal input combination was tested at least once). Using only assertions risks silently under-testing rare legal scenarios that never happen to trigger a violation; using only coverage risks noticing a gap in testing without ever having caught the actual bug that gap was hiding. Verification environments use them together specifically because of this complementary, not redundant, relationship.

---

**Q: Why is functional verification often described as consuming a large majority of total chip design effort and schedule?**

A: (needs verification — recheck against current source) The reasoning commonly given is straightforward even if the exact percentage cited varies by source, company, and design complexity: writing RTL for a module is a comparatively bounded task, but *proving* that RTL is correct across the enormous space of possible input sequences, corner cases, and interacting modules scales far less predictably — a single FSM like `seq_detector_101` has a small, hand-traceable state space, but a real chip's full state space (many FSMs, datapaths, and interfaces interacting) is vastly larger, and constrained-random testing plus coverage closure (Fundamentals) is inherently an iterative, open-ended process rather than a fixed checklist. Specific industry-wide percentage figures for verification's share of total effort should be treated as approximate and sourced fresh at interview-prep time rather than quoted as a fixed, current statistic — this is exactly the kind of Volatile Core claim (industry-wide effort/cost breakdowns) that shifts over time and by source, unlike the FSM/coverage/assertion mechanics above, which are stable technical facts.

---

**Q: What does a "self-checking" testbench actually require, beyond just applying stimulus and observing outputs?**

A: It requires an independently-derived expected result to compare against — not just watching whether the design produces *some* output, but confirming it produces the *correct* output, computed some way other than trusting the design under test itself. Overview's testbench qualifies because the expected sequence (`0,0,1,0,0,1,0`) was derived independently, by manually scanning the bit stream "1011010" for literal occurrences of "101," not by running the DUT and assuming its output was correct. The "buggy DUT" verification in Overview demonstrates why this distinction matters concretely: a testbench that only checks "did the design run without crashing" would have passed the broken DUT that never asserts `detected` at all — only a testbench with a genuinely independent expected result catches that class of bug.

## Study Resources
- **Chris Spear & Greg Tumbush, *SystemVerilog for Verification*** — the standard reference for directed/constrained-random testing and self-checking testbench design
- **UVM Cookbook (Mentor/Siemens EDA, verificationacademy.com)** — free, widely used reference for UVM component roles (driver, monitor, scoreboard, sequencer, agent)
- **Janick Bergeron, *Writing Testbenches*** — the widely cited reference on code vs. functional coverage and verification methodology tradeoffs
