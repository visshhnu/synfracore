# Physical Design & Fabrication — Installation

## What You're Setting Up

Overview's multi-path STA calculation is closed-form and hand-calculable. This section sets up a Python-based STA calculator, plus OpenROAD — the standard free, open-source, actively maintained RTL-to-GDSII flow, for actually running floorplanning, placement, routing, and STA on a real design rather than only the simplified 3-path example.

## Install Python

```bash
python3 --version
```

No extra packages needed for the STA calculator itself.

## Verify Your Setup — Recompute Overview's Critical Path Example

This reproduces Overview's worked 3-path STA calculation.

```python
def path_delay(clock_to_q, combinational, setup):
    return clock_to_q + combinational + setup

paths = {
    "A (ALU output -> register)":     path_delay(1.0, 7.0, 1.0),
    "B (memory read -> register)":    path_delay(1.0, 9.5, 1.2),
    "C (control logic -> register)":  path_delay(0.8, 4.0, 0.9),
}

for name, delay in paths.items():
    print(f"Path {name}: {delay:.1f} ns")

critical_path = max(paths, key=paths.get)
critical_delay = paths[critical_path]
max_freq_mhz = 1000 / critical_delay

print(f"\nCritical path: {critical_path} at {critical_delay:.1f} ns")
print(f"Max clock frequency: {max_freq_mhz:.1f} MHz")
```

```
Expected output:
Path A (ALU output -> register): 9.0 ns
Path B (memory read -> register): 11.7 ns
Path C (control logic -> register): 5.7 ns

Critical path: B (memory read -> register) at 11.7 ns
Max clock frequency: 85.5 MHz

Matches Overview's hand-computed result exactly -- Path B is
correctly identified as the worst-case path, and the resulting
85.5 MHz matches Overview's claim.
```

## A Second Check — the Try It Fourth Path

Reproducing Overview's Try It exercise (adding Path D) as a second, independent check:

```python
paths["D (I/O buffer -> register)"] = path_delay(1.2, 10.0, 1.5)

for name, delay in paths.items():
    print(f"Path {name}: {delay:.1f} ns")

critical_path = max(paths, key=paths.get)
critical_delay = paths[critical_path]
max_freq_mhz = 1000 / critical_delay
print(f"\nNew critical path: {critical_path} at {critical_delay:.1f} ns")
print(f"New max clock frequency: {max_freq_mhz:.1f} MHz")
```

```
Expected output: Path D = 12.7 ns, becomes the new critical path,
new max frequency ~78.7 MHz -- matches Overview's Try It answer
exactly, confirming that adding one new slow path can only hurt (or
leave unchanged) the chip's overall maximum frequency, never help it.
```

## Install OpenROAD for a Real Physical Design Flow

OpenROAD is a free, open-source, actively maintained RTL-to-GDSII flow — floorplanning, placement, routing, and STA on an actual design, going well beyond this guide's simplified 3-path example into a complete, automated physical design flow. OpenLane wraps OpenROAD (plus Yosys for synthesis, Magic and Netgen for layout/verification) into a single end-to-end flow.

```bash
# Recommended: Docker (avoids building the full toolchain from source)
docker pull openroad/orfs:latest

# Alternative: OpenROAD-flow-scripts, for a local (non-Docker) install
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
cd OpenROAD-flow-scripts
# Follow the repository's own build instructions
```

`(needs verification — recheck against current source: OpenROAD/OpenROAD-flow-scripts build instructions and dependencies are actively maintained and can change between releases — confirm current steps directly at the repository's own documentation before relying on a fixed set of commands.)`

## Verify Everything Works

```bash
# 1. Confirm the STA calculator reproduces Overview's 85.5 MHz result

# 2. Confirm the second check correctly identifies Path D as new
#    critical, at ~78.7 MHz

# 3. Run OpenROAD-flow-scripts' own built-in example design (the
#    repository ships with sample designs specifically for this
#    purpose) through the full flow and confirm it produces a real
#    GDSII layout output — the concrete proof that floorplanning,
#    placement, routing, and STA are real, runnable steps, not just
#    a diagram
```

## Common Setup Issues

**STA calculator picks the wrong path as critical**
Confirm you're using `max()` (worst-case, longest delay), not `min()` — a common mistake when this pattern is first introduced, since "critical" intuitively might sound like it should mean "smallest" or "most important" rather than specifically "longest delay, the one that limits the whole chip's frequency."

**OpenROAD Docker image fails to pull or run**
Confirm Docker itself is installed and running (`docker --version`) before troubleshooting OpenROAD specifically — a Docker daemon that isn't running produces an error that can look OpenROAD-specific but is actually a Docker prerequisite issue.

**OpenROAD-flow-scripts build from source fails partway through**
This toolchain has a real, substantial dependency list (Yosys, Magic, Netgen, and OpenROAD itself, each with their own build requirements) — confirm you're following the repository's current documented build instructions exactly, since a partial or out-of-order build is a common source of failures that look like a bug but are actually a missed setup step.

## What's Set Up

- **Python 3** — for STA calculations throughout this guide
- **OpenROAD (via Docker or OpenROAD-flow-scripts)** — for a real, complete floorplanning-through-GDSII physical design flow beyond this guide's simplified examples

## Next Steps

Go to the **Fundamentals** section to continue with floorplanning and placement in more depth.
