# Functional Verification — Fundamentals

Overview built a self-checking testbench for one module (`seq_detector_101`) using plain Verilog, checking a handful of hand-picked bit patterns. Real verification needs two things plain directed testing doesn't give you: a way to know how much of the design's actual behavior you've tested (functional coverage), and a way to catch bugs continuously during simulation rather than only at the end (assertions). This page introduces both, using the `counter_4bit` module from RTL Design & Computer Architecture as the running example — the exact same wraparound behavior (0 through 15, then back to 0) already verified there.

**Analogy** — Directed testing (Overview's approach) is studying only the exact past exam questions a teacher handed out — you'll pass if the real exam matches those exactly, but you have no idea whether you understand the material broadly. Functional coverage is a checklist of every *topic* the exam could draw from, tracked as you study, so you can see exactly which topics you've covered and which you haven't — even if you never see the exact same practice question twice. Assertions are a tutor watching you work through problems in real time, immediately flagging a wrong step the moment it happens, rather than only grading the final answer at the end.

## Functional Coverage: Measuring How Much You've Actually Tested

```
A directed test (like Overview's single 7-bit stimulus) proves the
design works for THAT specific input sequence. It says nothing
about whether every count value the counter_4bit module can reach
(0 through 15) was ever actually exercised during simulation.

Functional coverage answers exactly that question: define the space
of values/scenarios that matter, then track which ones simulation
actually hit.

For counter_4bit, the natural coverage goal is: "was every count
value 0-15 observed at least once during simulation?"
```

### Annotated Example — Computing Coverage for a Partial Test

Suppose a test suite for `counter_4bit` only ran long enough to observe count values 0 through 9 (10 distinct values), never reaching 10 through 15.

```
Values in the full coverage space: {0,1,2,...,15}  -- 16 values
Values actually observed:          {0,1,2,...,9}   -- 10 values

Coverage = (values observed) / (total values in space) x 100
         = 10 / 16 x 100
         = 62.5%
```

Verified computationally: 10 observed values out of 16 possible values gives exactly 62.5% coverage. This is a real, common outcome — not a hypothetical — because a test that only runs a counter for a short, fixed number of clock cycles (rather than deliberately running it long enough to wrap around, the way RTL Design's 18-edge trace did) will systematically miss the high end of the range. A coverage report showing 62.5% here is a direct, actionable signal: extend the test to run at least 16 clock edges to reach full coverage, rather than guessing whether "enough" testing has been done.

```systemverilog
// SystemVerilog covergroup -- the actual construct that produces
// the 62.5% number above automatically during simulation, rather
// than requiring it to be computed by hand afterward
covergroup counter_cg @(posedge clk);
    count_cp: coverpoint count {
        bins all_values[] = {[0:15]};  // one bin per possible value
    }
endgroup
```

## Assertions: Catching Bugs the Moment They Happen

```
A coverage report tells you WHAT was tested. An assertion tells you,
continuously during simulation, whether a specific property was
EVER violated -- checked automatically every cycle, not just at a
final comparison point the way Overview's testbench checked outputs
only after each bit was applied.

For counter_4bit, a natural property to assert: "the count value
must always increase by exactly 1 each cycle, EXCEPT when it wraps
from 15 back to 0, or when reset is asserted."
```

```systemverilog
// SystemVerilog Assertion (SVA) -- fires an error immediately if
// violated, at the exact clock edge it happens, rather than only
// being caught by a later output comparison
property count_increments_correctly;
    @(posedge clk) disable iff (rst)
    (count != 4'b1111) |=> (count == $past(count) + 1);
    // reads: unless count was 15 last cycle, this cycle's count
    // must equal last cycle's count + 1
endproperty

assert property (count_increments_correctly)
    else $error("counter skipped or repeated a value");
```

### Tracing the Assertion Against RTL Design's Verified Counter Trace

RTL Design & Computer Architecture traced `counter_4bit` over 18 clock edges: `0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,1`. Checking the assertion's rule (`count == previous count + 1`, except after 15) against every consecutive pair in that exact trace:

```
  0->1: 0+1=1  OK        8->9: 8+1=9   OK
  1->2: 1+1=2  OK        9->10: 9+1=10 OK
  2->3: 2+1=3  OK        10->11: OK
  3->4: OK                11->12: OK
  4->5: OK                12->13: OK
  5->6: OK                13->14: OK
  6->7: OK                14->15: OK
  7->8: OK                15->0: exempted (wraparound case, not a violation)
                           0->1: 0+1=1  OK
```

Every one of the 17 consecutive pairs in RTL Design's exact verified trace either satisfies `count == previous + 1` or falls under the explicit wraparound exemption — confirming the assertion correctly describes the real, already-verified behavior of this exact module, rather than describing a different or idealized counter.

## Try It (2 Minutes)

A modified counter design has a bug: it skips the value 8 every time (goes ...6, 7, 9, 10... instead of ...6, 7, 8, 9, 10...).

1. At which specific transition would the assertion `count == $past(count) + 1` fire an error?
2. Would the earlier functional-coverage covergroup (tracking bins 0-15) also catch this bug, and if so, how would it show up in the coverage report?

You should land on: the assertion fires exactly at the 7→9 transition, since `$past(count) + 1` would be `7 + 1 = 8`, but the actual count is 9 — an immediate, precisely-located error at that exact cycle. The coverage report would also catch it, differently: the bin for value 8 would show 0 hits (0% coverage for that one specific bin) even though overall coverage might look reasonably high otherwise — which is exactly why coverage and assertions are used together rather than as substitutes for each other: the assertion catches the bug the instant it happens, while coverage independently confirms which specific values were never reached, which is useful even for scenarios that aren't bugs, just under-tested.

## Study Resources
- **Chris Spear & Greg Tumbush, *SystemVerilog for Verification*** — covers functional coverage and SVA assertions in the same style used above
- **Ben Cohen, *SystemVerilog Assertions Handbook*** — the standard deep-dive reference for SVA syntax and property construction
- **ASIC World — SystemVerilog Coverage** (asic-world.com) — free walkthroughs of covergroup/coverpoint/bins syntax
