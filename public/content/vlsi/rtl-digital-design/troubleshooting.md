# RTL Design & Computer Architecture — Troubleshooting

## "My control unit and datapath are tangled together and hard to reason about"

Check whether the control unit's FSM is directly manipulating data values (like computing accumulator + addend inside the state-transition logic) instead of only watching status signals and issuing control signals — Intermediate's `mult_by_add` example deliberately keeps the FSM's `next_state` logic free of any actual arithmetic, doing all of that inside the datapath's own `always` block, driven by which state the control unit is currently in. If arithmetic and state-transition logic are mixed into one block, the design will still simulate correctly but becomes much harder to debug and modify — worth refactoring back into the clean separation even if functionally equivalent.

## "My datapath/control-unit design works in simulation but my stall count doesn't match Advanced's model"

Confirm exactly which hazard type is present — a plain ALU-to-ALU RAW hazard resolves to 0 stalls with full forwarding, but a load-use hazard requires 1 stall even with forwarding, a genuinely different case covered explicitly in Advanced. A mismatch is often simply hazard-type misclassification, not an error in the stall-counting logic itself.

## "My FSM-controlled datapath seems to skip an iteration or repeat one"

Check the exact cycle at which the exit condition (`iter_count == count_target`) is evaluated relative to when `iter_count` itself updates — a common off-by-one bug is comparing the OLD value of `iter_count` against `count_target` in the same cycle it's being incremented, versus comparing the NEW value, which shifts the exit point by exactly one iteration. Trace the iteration-by-iteration table (as in Intermediate's worked example) by hand against your actual simulation output to isolate which cycle the discrepancy first appears in.

## "My pipeline stall count assumes forwarding fixes every hazard, but my simulation still shows a bubble"

Before assuming a forwarding-logic bug, re-check whether the hazard in question is a load-use hazard rather than a standard ALU-to-ALU RAW hazard — this is the one hazard type where even textbook-correct, fully-implemented forwarding hardware cannot eliminate every stall, as covered in Advanced. A single unavoidable bubble on a load-use pair is expected behavior, not a design flaw.

## "My multiply-by-repeated-addition datapath produces the wrong result only when count_target = 0"

This is worth testing explicitly as an edge case, not assuming it "shouldn't happen" — check whether the ADD state's exit condition is evaluated on ENTRY to the state (before any addition happens) or only after at least one iteration. Intermediate's Try It exercise covers exactly this edge case: a correctly-designed FSM should reach DONE immediately with `result = 0` when `count_target = 0`, without ever getting stuck or performing a spurious first addition.
