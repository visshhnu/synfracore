# Functional Verification — Troubleshooting

## "My testbench reports PASS, but I'm not confident it would actually catch a real bug"

Deliberately mutate the design under test (change one line, exactly as Installation's buggy-DUT exercise does) and re-run the same testbench — if it still reports PASS against a design you know is broken, the testbench isn't actually self-checking, regardless of what it reports against the correct design. A testbench's real trustworthiness is proven by what it catches, not by what it passes.

## "My random-testing coverage isn't reaching 100% even after far more trials than the Coupon Collector estimate predicted"

Confirm the random stimulus is actually uniformly distributed across the full value space, not accidentally biased toward a subset — Intermediate's formula assumes each trial is equally likely to land on any value; a random-number generator seeded, constrained, or masked incorrectly (producing values skewed toward a smaller range) will take far longer than the Coupon Collector's expected trial count to reach full coverage, since some cells become effectively unreachable rather than just less likely.

## "My single-dimension coverage shows 100%, but I suspect real gaps still exist"

This is exactly the scenario Advanced's cross-coverage material addresses directly — 100% on each individual coverpoint (state fully visited, every input value applied at least once) does NOT guarantee every meaningful COMBINATION of state and input was tested. Add a cross-coverage construct across the relevant coverpoints before concluding testing is actually complete.

## "My assertion fires immediately on the very first clock cycle, even before I've applied any real stimulus"

Check whether the assertion's `disable iff (rst)` clause (Fundamentals' pattern) is present and correctly wired — an assertion checking a property like `count == $past(count) + 1` will spuriously fire during and immediately after reset, when `$past(count)` reflects an arbitrary pre-reset value rather than a meaningful prior state, unless reset explicitly disables the property during that window.

## "My cross-coverage grid shows some cells as permanently unreachable, no matter how much stimulus I add"

Confirm the combination is actually legal for the design being tested — not every cell in a cross-coverage grid necessarily corresponds to a reachable real-world scenario (an FSM might structurally never allow certain state+input combinations at all, depending on its transition logic). Treat a persistently-unreachable cell as a signal to re-examine whether the coverage model itself is asking about a genuinely impossible case, rather than assuming more stimulus will eventually fill it.

## "My UVM scoreboard mismatch doesn't point to an obvious location in the design"

Confirm the scoreboard's expected-value model is independently derived from the design's specification, not accidentally copied from (or subtly dependent on) the DUT's own behavior — a scoreboard that unintentionally re-derives its expected value FROM the DUT under test (rather than from an independent reference model) can silently pass even when the DUT is wrong, since it's effectively comparing the DUT against itself.
