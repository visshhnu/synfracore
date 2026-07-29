# Fiber Optics — Intermediate

## DWDM — scaling WDM to real backbone capacity

Fundamentals introduces WDM's basic principle; Intermediate covers **DWDM (Dense WDM)**, which packs many more wavelength channels onto a single fiber by spacing them much more closely (typically 0.8nm or even 0.4nm spacing, standardized by the ITU grid, versus WDM's wider, coarser spacing). This closer spacing requires more precise laser sources and optical filtering, but the payoff is substantial: a single DWDM-equipped fiber pair can carry dozens to (in modern systems) well over a hundred independent wavelength channels, each potentially carrying 100Gbps or more, meaning DWDM — not laying additional fiber — accounts for most of the capacity growth on existing long-haul backbone routes over the past two decades. `(needs verification — recheck against current source: per-channel data rates and maximum channel counts on commercially deployed DWDM systems continue to advance.)`

## Splicing and connectorization — the field-engineering layer

Getting light into and between fiber segments reliably requires precise physical work: **fusion splicing** permanently joins two fiber ends by melting and fusing the glass together, producing very low signal loss and used for permanent backbone/outdoor plant connections; **mechanical splicing** aligns fiber ends within a mechanical fixture without fusing them, faster and requiring less specialized equipment but with somewhat higher loss, often used for temporary or field-repair situations. **Connectorization** — terminating fiber ends with standardized connectors (common types include SC, LC, and ST) — is what allows fiber to be patched into equipment ports repeatedly rather than requiring a permanent splice at every connection point, essential wherever fiber needs to be reconfigurable (data centers, central offices, customer premises equipment).

## Optical amplification — extending reach

Fundamentals notes attenuation limits fiber distance; Intermediate covers the practical fix: **EDFAs (Erbium-Doped Fiber Amplifiers)** boost optical signal strength directly in the optical domain (without converting to electrical signal and back), typically placed at intervals along long-haul routes to restore signal power lost to attenuation before it degrades below a usable threshold. This optical-domain amplification is significantly more efficient and lower-latency than older approaches requiring optical-to-electrical-to-optical conversion at every repeater point, and is a major reason modern long-haul fiber routes can span very long distances with relatively few active regeneration points.

## Applying single-mode vs. multi-mode in real network design

A network architect applies Fundamentals' SMF/MMF distinction directly: a data center's internal server-to-switch connections (short distance, cost-sensitive, high port count) typically use MMF, while the same data center's connection out to a metro or long-haul network uses SMF. This isn't an arbitrary convention — it's the direct consequence of MMF's modal-dispersion distance limit making it unsuitable for the longer external link, and SMF's higher per-unit cost being harder to justify across the very large number of short internal links a data center needs.
