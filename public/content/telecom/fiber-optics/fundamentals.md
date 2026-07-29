# Fiber Optics — Fundamentals

## How fiber transmits data

Optical fiber carries data as pulses of light traveling through a thin glass (or occasionally plastic) core, using **total internal reflection** to keep light confined within the core rather than escaping into the surrounding cladding — light hitting the core-cladding boundary at a sufficiently shallow angle reflects back into the core entirely rather than refracting out, allowing the signal to travel long distances with minimal loss. This is fundamentally different from copper cable, which carries data as electrical signals subject to much greater distance-dependent attenuation and electromagnetic interference.

## Single-mode vs. multi-mode fiber

- **Single-mode fiber (SMF)** has a very small core diameter (~9 microns), narrow enough that light can only travel one path ("mode") straight down the fiber. This eliminates a distortion effect called modal dispersion (different light paths arriving at slightly different times), making SMF suitable for very long distances — the standard choice for backbone, long-haul, and increasingly FTTH deployment.
- **Multi-mode fiber (MMF)** has a larger core (~50-62.5 microns), allowing light to travel multiple paths simultaneously. This is cheaper to manufacture and easier to work with (larger core tolerates less precise alignment), but modal dispersion limits its effective distance — typically used for short-distance links like data-center or campus networking, where distance is short enough that modal dispersion doesn't meaningfully degrade the signal.

## Attenuation and dispersion — the two limits on distance

Every fiber link faces two distance-limiting factors: **attenuation** (signal power loss over distance, due to absorption and scattering within the glass) and **dispersion** (signal spreading/distortion over distance, from modal dispersion in MMF or chromatic dispersion — different wavelengths traveling at slightly different speeds — in both fiber types). Long-haul fiber links manage both through a combination of fiber-type choice (SMF for dispersion control), wavelength selection (certain wavelength windows have inherently lower attenuation in glass), and periodic optical amplification to restore signal strength before it degrades below a usable threshold.

## Wavelength-division multiplexing (WDM)

Rather than running one data channel per fiber strand, WDM transmits multiple independent channels simultaneously over a single fiber, each modulated onto a different wavelength of light. A receiver at the far end separates the wavelengths back into individual channels using optical filters. This is the fiber-optic equivalent of frequency-division multiplexing (Telecom Fundamentals' FDMA concept) applied to light instead of radio waves — the core mechanism (dividing a shared medium by frequency/wavelength) is the same underlying principle in a different physical domain.

## Getting started

1. Master total internal reflection as the physical mechanism making fiber transmission possible at all — everything else in this technology builds on understanding why light stays confined to the core.
2. Learn single-mode vs. multi-mode as a distance/cost tradeoff, not "one is simply better" — the correct choice depends entirely on the deployment's distance requirement.
3. Treat WDM's frequency-division parallel to FDMA as a genuine conceptual bridge, not a coincidence — recognizing shared principles across the radio and optical domains will make Intermediate's DWDM material significantly faster to absorb.
