# JTO Fundamentals — Electronics & Communication

## Electronic Devices — Quick Reference

### BJT vs MOSFET

| Parameter | BJT | MOSFET |
|-----------|-----|--------|
| Control | Current-controlled | Voltage-controlled |
| Input impedance | Low | Very high |
| Switching speed | Moderate | Very fast |
| Power dissipation | Higher | Lower |
| Application | Analog amplifiers | Digital ICs, power electronics |

### Op-Amp Configurations (Ideal Op-Amp: A = ∞, Rin = ∞, Rout = 0)

**Inverting amplifier:** Gain = -Rf/R1
**Non-inverting amplifier:** Gain = 1 + Rf/R1
**Voltage follower:** Gain = 1 (buffer)
**Differentiator:** Output = -RC × d(Vin)/dt
**Integrator:** Output = -(1/RC) × ∫Vin dt
**Summing amplifier:** Vout = -(Rf/R1 × V1 + Rf/R2 × V2)

---

## Digital Electronics — Key Concepts

### Number Systems
- Binary to Decimal: 1101₂ = 8+4+0+1 = 13₁₀
- BCD: Each decimal digit encoded in 4-bit binary. 9 = 1001, max valid BCD = 1001
- 2's complement: For negative numbers. -5 in 8-bit = 11111011

### K-Map Rules
- Group sizes: 1, 2, 4, 8, 16 (powers of 2 only)
- Groups must be rectangular, can wrap around
- Essential prime implicants must be covered
- Minimize terms

### Flip-Flops
- **SR:** Set-Reset. Invalid state: S=R=1
- **D:** Data/Delay. Q(t+1) = D
- **JK:** Master-slave. J=K=1 → Toggle. No invalid state
- **T:** Toggle. T=0 → Hold, T=1 → Toggle

### Microprocessor 8085 — Key for BSNL JTO
- 8-bit data bus, 16-bit address bus
- Registers: A (accumulator), B, C, D, E, H, L, PC, SP
- Addressing modes: Register, Register indirect, Immediate, Direct, Implicit
- Interrupts: TRAP (highest), RST 7.5, RST 6.5, RST 5.5, INTR (lowest)

---

## Communication Systems — Modulation

### Amplitude Modulation (AM)
- DSB-FC: Modulation index m = Am/Ac. Bandwidth = 2fm
- DSB-SC: No carrier. Better power efficiency
- SSB: Half bandwidth of DSB. Used in shortwave radio
- Power: Total = Pc(1 + m²/2). Efficiency = m²/(2 + m²)

### Frequency Modulation (FM)
- Modulation index β = Δf/fm (Δf = max freq deviation)
- Carson's rule: BW = 2(Δf + fm) = 2fm(1 + β)
- Capture effect: FM locks onto stronger signal
- Pre-emphasis/de-emphasis: Boost/reduce high frequencies to reduce noise

### Digital Modulation (for 4G/5G exams)
- **BPSK:** 1 bit/symbol. Most robust.
- **QPSK:** 2 bits/symbol.
- **16-QAM:** 4 bits/symbol.
- **64-QAM:** 6 bits/symbol.
- **256-QAM:** 8 bits/symbol. Used in 5G. Requires best SNR.
- LTE uses OFDM: divides channel into many narrow subcarriers (15 kHz each)

---

## Transmission Lines

**Key parameters:**
- Characteristic impedance Z₀ = √(L/C) for lossless line
- Reflection coefficient Γ = (ZL - Z₀)/(ZL + Z₀)
- VSWR = (1 + |Γ|)/(1 - |Γ|)
- Perfect match: ZL = Z₀, Γ = 0, VSWR = 1
- Short circuit: ZL = 0, Γ = -1, VSWR = ∞
- Open circuit: ZL = ∞, Γ = +1, VSWR = ∞

**Quarter-wave transformer:** Input impedance = Z₀²/ZL. Used to match impedances.

**Smith Chart:** Graphical tool for transmission line calculations. Normalized impedance plotted. Used to find matching networks.

---

## Antenna Theory

**Fundamental parameters:**
- **Gain:** Ratio of power radiated in best direction vs isotropic radiator (dBi)
- **Directivity:** Ratio of max radiation intensity vs average (for lossless antenna = gain)
- **Radiation resistance:** Power radiated / I² (for half-wave dipole = 73.2 Ω)
- **Bandwidth:** Range of frequencies over which antenna performs acceptably (VSWR < 2)
- **Polarization:** Orientation of E-field. Linear, circular, elliptical

**Common antennas:**
| Antenna | Gain | Application |
|---------|------|-------------|
| Isotropic | 0 dBi | Reference |
| Half-wave dipole | 2.15 dBi | Reference for dBd |
| Yagi-Uda | 7–20 dBi | TV reception, point-to-point |
| Parabolic dish | 25–45 dBi | Satellite, microwave backhaul |
| Patch/Microstrip | 5–9 dBi | Mobile base stations, WiFi |
| Phased array | 15–30+ dBi | 5G massive MIMO, radar |
