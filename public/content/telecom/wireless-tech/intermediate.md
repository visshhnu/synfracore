# 4G/5G & Wireless — Intermediate

## Network slicing in practice

Applying Fundamentals' network-slicing concept: a 5G operator might configure one slice tuned for eMBB (high throughput, moderate latency tolerance — consumer video streaming), a second tuned for URLLC (very low latency, high reliability, lower throughput requirement — a factory automation customer), and a third tuned for mMTC (high device density, low per-device throughput, power-efficiency-optimized — a smart-meter IoT deployment), all running over the same physical radio and core infrastructure. The 5G Core's slicing mechanism handles this by allocating differentiated resources and QoS policies per slice rather than treating all traffic uniformly — the practical business value is that an operator can offer differentiated, SLA-backed services (e.g., a guaranteed-latency industrial slice) without deploying separate physical networks per customer segment.

## Massive MIMO — spatial multiplexing in practice

Fundamentals introduces massive MIMO's larger antenna-element count; Intermediate covers what that enables: with enough antenna elements, a base station can transmit multiple independent data streams to multiple users simultaneously on the same time-frequency resource, distinguishing them spatially rather than through time, frequency, or code division. This is a genuinely different capacity lever than the multiple-access techniques covered in Telecom Fundamentals — instead of dividing a fixed resource among users, massive MIMO effectively creates additional usable capacity through spatial separation, which is why 5G capacity gains substantially outpace what OFDMA's efficiency improvement over TDMA/CDMA alone would predict.

## The FR1/FR2 deployment tradeoff, applied

An operator planning 5G rollout applies Fundamentals' FR1/FR2 split directly: FR1 (sub-6 GHz) provides the wide-area coverage layer most subscribers actually connect to most of the time, while FR2 (mmWave) is deployed selectively — dense small-cell installations in high-demand locations (stadiums, transit hubs, dense downtown cores) where the extreme capacity justifies FR2's short range and line-of-sight sensitivity. This mirrors Telecom Fundamentals' rural-vs-urban spectrum planning example, but with the coverage/capacity gap between the two options much wider than any 4G-era band comparison.

## Beamforming's role in making massive MIMO practical

Beamforming (introduced conceptually in Telecom Fundamentals' Advanced) is what makes massive MIMO's large antenna arrays actually useful rather than just numerous: by controlling the phase and amplitude of the signal at each antenna element, a base station can concentrate radio energy directionally toward a specific device's location rather than broadcasting uniformly — this both improves the effective signal strength reaching a target device (extending FR2's short range somewhat) and reduces interference toward other devices, since energy isn't wastefully broadcast toward locations with no active user.

## NR numerology and latency

5G's flexible sub-carrier spacing (Fundamentals) is applied differently depending on use case: URLLC deployments typically use wider sub-carrier spacing, which shortens the transmission time interval and reduces latency, at the cost of somewhat reduced spectral efficiency and robustness to certain channel conditions — a direct engineering tradeoff, not a free improvement. eMBB deployments, less latency-sensitive, can use narrower spacing optimized more for throughput and robustness. This flexibility — choosing the numerology per deployment scenario — is a genuinely new NR capability LTE's fixed structure didn't offer.
