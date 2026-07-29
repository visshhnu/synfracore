# Fiber Optics — Overview

## What this technology covers

Fiber Optics covers optical networking as the physical-layer backbone of modern telecom: fiber types (single-mode vs. multi-mode) and how they differ in use case, wavelength-division multiplexing (WDM/DWDM) for multiplying a single fiber's capacity, fiber splicing and connectorization as practical field skills, and FTTH/FTTX access-network architectures for last-mile fiber deployment, including passive optical network (PON) design. Where Telecom Fundamentals and Wireless Tech cover the radio/wireless side of telecom, Fiber Optics covers the wired optical side — the two are complementary, not competing: even a 5G network's radio towers are typically fiber-backhauled, meaning fiber is the physical link connecting most cell sites back to the core network.

## Why it matters

Fiber optic cable is the highest-capacity, longest-distance transmission medium telecom networks use — long-haul national and international backbone links, metro aggregation networks, and increasingly last-mile residential/business connections (FTTH) all run on fiber, because copper-based alternatives can't match fiber's combination of bandwidth and distance without signal degradation. Understanding fiber's physical properties (why single-mode outperforms multi-mode over distance, why WDM multiplies capacity without laying new cable) explains real network-design and cost decisions telecom engineers and planners make daily.

## Fiber types — a quick map

| Type | Core diameter | Typical use | Distance |
|---|---|---|---|
| Single-mode fiber (SMF) | Small (~9 microns) | Long-haul, backbone, FTTH | Long (tens of km+) |
| Multi-mode fiber (MMF) | Larger (~50-62.5 microns) | Short-distance, data center, campus | Short (typically under 2km) |

## WDM — multiplying fiber capacity

Wavelength-division multiplexing sends multiple independent data channels over a single fiber simultaneously, each on a different wavelength (color) of light — conceptually similar to FDMA's frequency-division principle (Telecom Fundamentals), but applied to optical wavelengths instead of radio frequencies. **DWDM (Dense WDM)** packs many more, more closely-spaced wavelengths onto a single fiber than basic WDM, dramatically increasing a single fiber strand's usable capacity without requiring additional physical cable — a major reason long-haul fiber backbone capacity has scaled so far past what laying new fiber alone would explain.

## Exam and career relevance

Fiber Optics is core syllabus for GATE ECE's optical communication sections, BSNL JTO/JE recruitment's transmission-network components, and directly relevant to network planning, field engineering, and optical transport roles at telecom operators and equipment vendors.

## How to use this technology's sections

Fundamentals covers fiber types and basic light-transmission principles. Intermediate applies these to WDM/DWDM system design and splicing/connectorization practice. Advanced covers FTTH/FTTX access-network architecture and PON design in depth. Interview and Cheatsheets provide exam-format practice and quick reference.
