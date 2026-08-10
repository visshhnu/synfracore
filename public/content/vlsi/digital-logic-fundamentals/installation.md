# Digital Logic & Design Fundamentals — Installation

## What You're Setting Up

This guide's Boolean simplifications are hand-verifiable by truth table, and Overview's own examples are already "verified computationally against all N input combinations" — this section sets up the two tools that make that pattern real: a small Python truth-table checker (the exact technique Overview's examples use, now as a reusable tool), and Logisim Evolution, a free circuit simulator for actually building and testing gate circuits visually.

## Install Python

```bash
python3 --version
```

No extra packages needed — a truth-table checker over a handful of Boolean variables is simple enough for plain Python, no NumPy required.

## Verify Your Setup — Recompute Overview's Boolean Simplification

This reproduces Overview's worked simplification (F = AB + AB' + A'B, simplifying to A + B) as an exhaustive, programmatic truth-table check.

```python
import itertools

def f_original(A, B):
    return (A and B) or (A and not B) or (not A and B)

def f_simplified(A, B):
    return A or B

print("A B | original simplified match")
for A, B in itertools.product([0, 1], repeat=2):
    orig = int(f_original(A, B))
    simp = int(f_simplified(A, B))
    print(f"{A} {B} |    {orig}         {simp}       {orig == simp}")
```

```
Expected output — all 4 rows should show match=True:
A B | original simplified match
0 0 |    0         0       True
0 1 |    1         1       True
1 0 |    1         1       True
1 1 |    1         1       True

Matches Overview's claim exactly — the 3-term original and the
1-term simplified expression produce identical outputs across every
possible input, confirming the simplification is correct, not just
plausible-looking algebra.
```

## A Second Check — the Try It Consensus Theorem Example

Reproducing Overview's Try It exercise (F = AB + A'C + BC simplifying to AB + A'C, with the BC term proven redundant) as a second, independent, 8-row check:

```python
def g_original(A, B, C):
    return (A and B) or (not A and C) or (B and C)

def g_simplified(A, B, C):
    return (A and B) or (not A and C)

print("A B C | original simplified match")
for A, B, C in itertools.product([0, 1], repeat=3):
    orig = int(g_original(A, B, C))
    simp = int(g_simplified(A, B, C))
    print(f"{A} {B} {C} |    {orig}         {simp}       {orig == simp}")
```

```
Expected output: all 8 rows show match=True — confirming the BC term
is genuinely redundant across every one of the 8 possible input
combinations, exactly as Overview's Try It answer claims.
```

## Install Logisim Evolution for Visual Circuit Building

Logisim Evolution is a free, actively maintained circuit design and simulation tool — build the actual AND/OR/NOT gate circuits from Overview visually, wire them together, and simulate real signal behavior, rather than only checking truth tables in Python.

```bash
# Requires Java 21 or newer
java -version

# Download the current release for your OS from the official
# GitHub repository:
# https://github.com/logisim-evolution/logisim-evolution/releases
```

`(needs verification — recheck against current source: exact current release version and Java version requirement change with each release — confirm both at the GitHub releases page above before downloading.)`

**Important naming note:** search results for "Logisim" (without "Evolution") often surface the original Logisim project by Carl Burch, which **ceased active maintenance around 2014**. Logisim Evolution is the actively maintained successor (maintained by REDS Institute, HEIG-VD) and is the correct, current tool to install — if a tutorial or download link references plain "Logisim," confirm it's actually pointing at Logisim Evolution before using it.

## Verify Everything Works

```bash
# 1. Confirm the Boolean-simplification check prints match=True for
#    all 4 rows

# 2. Confirm the consensus-theorem check prints match=True for all
#    8 rows

# 3. Open Logisim Evolution, build a simple AND-OR-NOT circuit
#    implementing F = A + B (Overview's simplified result), wire up
#    input toggles and an output indicator, and confirm it produces
#    the same 4-row truth table as the Python check above
```

## Common Setup Issues

**Python truth-table check shows `match=False` for at least one row**
This means the "simplified" expression you're testing is NOT actually equivalent to the original — treat this as the check correctly catching an invalid simplification, not a script bug. Re-derive the simplification algebraically and re-run the check rather than assuming the checker is wrong.

**Logisim Evolution won't launch after installing**
Confirm your Java version meets the current requirement (`java -version`) — Logisim Evolution is a Java application and the most common launch failure is an outdated or missing Java runtime, not a corrupted download.

**Downloaded "Logisim" (not Evolution) and it looks outdated or unmaintained**
This is expected — the original Logisim project stopped active maintenance around 2014. Uninstall it and get Logisim Evolution from the link above instead; the two are easy to confuse by name, but only one is currently maintained.

## What's Set Up

- **Python 3** — for exhaustive truth-table verification of Boolean simplifications throughout this guide
- **Logisim Evolution** — for building and simulating real gate circuits visually

## Next Steps

Go to the **Fundamentals** section to continue with number systems and more advanced gate combinations (K-maps, combinational circuit design), using the same verification tools set up here.
