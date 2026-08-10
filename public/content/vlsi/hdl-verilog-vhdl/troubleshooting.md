# HDL — Verilog & VHDL — Troubleshooting

## "My testbench runs but prints nothing, or hangs forever"

Almost always a missing `$finish` (or `$stop`) call. Simulation time doesn't end on its own just because the interesting stimulus has been applied — without an explicit `$finish`, `vvp` can sit indefinitely, especially if the testbench also has an always-running clock generator with no termination condition.

```verilog
initial begin
    clk = 0;
    forever #5 clk = ~clk;   // this loop NEVER ends on its own
end

initial begin
    // ... apply stimulus ...
    #100;
    $finish;   // without this, the clock generator above keeps
               // the simulation running forever
end
```

## "Simulation output looks right, but the synthesized design behaves differently on real hardware"

This is the sensitivity-list mismatch category from Advanced, but it also commonly shows up as an unintended latch (Interview's latch-inference question) that a synthesis tool inferred correctly from incomplete `if`/`case` coverage, while your testbench happened to only exercise the paths where the missing `else` branch never mattered. The fix isn't in the testbench — it's checking the synthesis tool's own lint/inference warnings (`latch inferred`, `incomplete sensitivity list`) rather than trusting a clean simulation run alone, since simulation only proves the paths you actually tested, not every path synthesis will build hardware for.

## "`Y === expected` always shows FAIL, even though the values look identical when printed"

Check for an `X` (unknown) value hiding in one of the signals — an uninitialized `reg` in Verilog starts as `X`, not `0`, and `$display` with `%b` will print the `X` clearly if you look, but it's easy to skim past. `===` treats `X` as a real, distinct value (unlike `==`, which would return an ambiguous `X` result rather than a clear pass/fail), so a signal that never got properly initialized or driven will reliably fail an `===` check against an expected `0` or `1` — this is usually the testbench correctly catching a real bug (an unconnected or unreset signal), not a testbench malfunction.

## "Two back-to-back non-blocking assignments to the same signal in the same block — which one wins?"

```verilog
always @(posedge clk) begin
    Q <= 1'b0;
    Q <= 1'b1;   // this is the one that actually takes effect
end
```

The LAST non-blocking assignment to a given signal within the same `always` block, in the same time step, is the one that wins — both are scheduled, but the second one overwrites the first before either takes effect at the end of the time step. This pattern (multiple assignments to the same signal in one block) is usually accidental — often the result of a `case` statement's default assignment being followed by a later, conditional override — and worth treating as a code-review flag even when the "last one wins" behavior happens to produce the intended result, since it's easy to get wrong when the block is edited later.

## "The `generate` block compiles but the instance names look wrong or collide"

Every iteration of a `generate for` loop needs a named block label (the `: adder_stage` in Intermediate's ripple-adder example) — without it, some tools either reject the generate block outright or produce ambiguous/inaccessible hierarchical instance names, which matters specifically when trying to reference a specific generated instance later (in a testbench, or in a synthesis constraint file) by its hierarchical path.

## "A clock-domain-crossing signal works fine in simulation but fails intermittently on real hardware"

This is expected, not a contradiction — simulation, unless specifically modeling metastability injection (most standard testbenches don't), treats a signal as either cleanly `0` or `1` at every point in time, with no concept of a real, physically metastable intermediate state. Real silicon can genuinely go metastable at a clock-domain crossing without a synchronizer, in a way ordinary RTL simulation structurally cannot reproduce — which is exactly why Advanced's double-flop synchronizer pattern is a mandatory design practice at every CDC boundary, not an optional defensive habit; simulation alone will not catch its absence.

## "VHDL: `signal` updates seem to lag by a full process execution, unlike a normal variable"

This is VHDL's delta-cycle semantics working as designed, not a bug — a `signal` assignment inside a process schedules the update to take effect only after the current process finishes executing, meaning every read of that signal within the same process invocation sees the *old* value (Interview's signal-vs-variable question covers this directly). If you need a value that updates immediately within the same process for a local, non-hardware-representing calculation, use a `variable` instead — using `signal` where `variable` semantics were actually intended is a common source of VHDL logic that "looks right" in the code but produces one-cycle-delayed behavior in simulation.
