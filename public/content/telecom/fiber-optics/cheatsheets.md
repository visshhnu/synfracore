# Fiber Optics — Cheatsheets

## Fiber type comparison

| Property | Single-mode (SMF) | Multi-mode (MMF) |
|---|---|---|
| Core diameter | ~9 microns | ~50-62.5 microns |
| Light paths | One | Multiple |
| Modal dispersion | None | Present, limits distance |
| Distance | Long-haul (tens of km+) | Short (typically under 2km) |
| Cost | Higher | Lower |
| Typical use | Backbone, long-haul, FTTH | Data center, campus |

## Two distance-limiting factors

| Factor | What it is | Managed by |
|---|---|---|
| Attenuation | Signal power loss over distance | Wavelength selection, optical amplification (EDFA) |
| Dispersion | Signal spreading/distortion over distance | SMF (modal), wavelength/equipment choice (chromatic) |

## WDM vs. DWDM

| Property | WDM | DWDM |
|---|---|---|
| Channel spacing | Wider, coarser | Narrower (ITU grid, e.g. 0.8nm/0.4nm) |
| Channel count | Fewer | Many more (dozens to 100+) |
| Equipment precision required | Lower | Higher |
| Typical use | Basic multiplexing | Long-haul backbone capacity scaling |

## Splicing and connectorization

| Method | Loss | Speed | Use |
|---|---|---|---|
| Fusion splicing | Very low | Slower, specialized equipment | Permanent backbone/outdoor plant |
| Mechanical splicing | Higher | Faster | Temporary/field repair |
| Connectorization (SC/LC/ST) | Low, reconfigurable | Fast to patch | Data centers, central offices, CPE |

## FTTx architecture comparison

| Architecture | Fiber reaches | Final-leg medium | Cost | Performance |
|---|---|---|---|---|
| FTTH | Subscriber premises | Fiber | Highest | Highest |
| FTTB | Building | Existing copper/short fiber | Moderate | Good |
| FTTC | Street cabinet | VDSL (copper) | Lower | Moderate |

## PON quick reference

| Term | Meaning |
|---|---|
| PON | Passive Optical Network — unpowered splitter divides one feeder fiber to many subscribers |
| GPON / XGS-PON | PON standards, differing in per-subscriber capacity |
| Split ratio | Number of subscribers sharing one feeder fiber — higher ratio = lower cost, lower guaranteed per-subscriber bandwidth |
| EDFA | Erbium-Doped Fiber Amplifier — boosts optical signal without electrical conversion |

`(needs verification — recheck against current source: PON standard capacities and DWDM per-channel rates continue to advance.)`
