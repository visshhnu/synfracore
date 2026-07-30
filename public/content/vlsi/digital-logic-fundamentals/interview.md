# Digital Logic & Design Fundamentals — Interview Q&A

## Common Questions and Answers

**Q: Why are NAND and NOR called "universal gates"?**

A: Because either one, by itself, can implement AND, OR, and NOT — the three basic building blocks of Boolean algebra — with no other gate types needed. For example, tying both inputs of a NAND gate together produces a NOT gate; feeding a NOT's output into another NAND produces AND; combining a few NANDs produces OR. This matters practically because standard-cell fabrication libraries are built almost entirely around NAND/NOR-style cells rather than a full mixed set of gate types — it's cheaper and more uniform to manufacture one or two well-characterized cell shapes repeated billions of times than many different ones (a point Physical Design & Fabrication returns to when discussing standard-cell libraries).

---

**Q: What's the practical difference between a latch and a flip-flop?**

A: A latch is level-triggered — it passes its input through to the output continuously whenever its enable/clock signal is at the active level (e.g., high), so the output can keep changing as long as that level holds. A flip-flop is edge-triggered — it only captures its input at the instant the clock transitions (e.g., low-to-high), and holds that value steady for the rest of the clock cycle regardless of further input changes. Real digital chips are built almost entirely from flip-flops, not latches, specifically because edge-triggering gives a single unambiguous moment per clock cycle when state updates — which is what makes synchronous digital design (the entire premise of RTL Design & Computer Architecture) predictable and analyzable.

---

**Q: Why does two's complement, rather than a simple sign bit, dominate how negative numbers are stored in hardware?**

A: A simple "sign-magnitude" scheme (one bit for sign, the rest for magnitude) requires separate addition/subtraction logic depending on the signs involved, and produces two representations of zero (+0 and -0). Two's complement lets the exact same binary adder circuit correctly add positive and negative numbers with no special-casing — the carry-out of the top bit is simply discarded, and the arithmetic works out correctly by construction (see the -37 + 37 = 0 worked example on the Fundamentals page). Fewer circuit variants, one representation of zero, and hardware reuse are why virtually every real processor uses two's complement rather than sign-magnitude.

---

**Q: When would you choose a K-map over straight Boolean algebra to simplify an expression?**

A: K-maps are a visual pattern-matching tool that scales well up to about 4–5 variables (beyond that, the grid becomes hard to read reliably and algorithmic methods like Quine-McCluskey take over). For a small number of variables, a K-map is usually faster and less error-prone than algebraic simplification because you're recognizing adjacent-cell groupings visually rather than tracking which Boolean identity (absorption, consensus, De Morgan's) applies at each step. For 2–3 variables, either approach works fine and it's mostly a matter of preference — the K-map's real advantage shows up once an expression has enough terms that manually spotting redundant ones (like the Consensus Theorem example on the Overview page) becomes error-prone by hand.

---

**Q: What does it mean for a function to be implemented with "minimum literals" and why does a chip designer care?**

A: A literal is a single occurrence of a variable or its complement (A, B', C, etc.) in a Boolean expression — the C'D' result from the Fundamentals K-map example has 2 literals; the original Σ(0,4,8,12) sum-of-products form, written out fully, would have far more. Fewer literals generally means fewer physical gates and fewer transistors to implement the same function, which directly affects chip area, power consumption, and propagation delay (fewer gate stages a signal has to pass through). This is the entire motivation for simplification technologies (Boolean algebra, K-maps, and automated logic synthesis tools covered later in RTL Design & Computer Architecture) — it's not an academic exercise, it's a direct lever on real silicon cost.

---

**Q: What's the difference between a combinational circuit's propagation delay and a sequential circuit's clock period, and why can't a clock just run as fast as the fastest gate?**

A: Propagation delay is how long it takes a signal to ripple through a chain of combinational logic gates from input change to stable output. A sequential circuit's clock period must be long enough for the slowest combinational path between two flip-flops (the "critical path") to fully settle before the next clock edge captures the result — if the clock is faster than that, the flip-flop can capture a value that hasn't finished changing yet, producing incorrect, unpredictable results. This is why clock frequency isn't just "how fast can one gate switch" — it's bounded by the longest chain of logic between any two sequential elements in the whole design, a constraint that becomes central once timing closure is covered in Physical Design & Fabrication.

## Study Resources
- **Morris Mano, *Digital Design*** — the standard textbook reference for the gate, latch/flip-flop, and simplification concepts referenced throughout this Q&A set
- **All About Circuits — Digital Logic** (allaboutcircuits.com) — free walkthroughs covering universal gates, latches vs. flip-flops, and timing basics
