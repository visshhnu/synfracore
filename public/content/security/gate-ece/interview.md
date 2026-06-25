# GATE ECE Interview Q&A

## Signals and Systems

**Q: State Nyquist sampling theorem and consequences of violation.**
For perfect reconstruction of a bandlimited signal, sampling frequency fs must be ≥ 2W, where W is the maximum frequency component. Sampling below 2W causes aliasing: high-frequency components fold back and appear as lower frequencies, permanently corrupting the signal. Recovery requires an ideal low-pass filter with cutoff at W.

**Q: Energy signal vs power signal?**
Energy signal: Total energy E = ∫|x(t)|²dt is finite and non-zero; average power = 0. Finite-duration signals — pulses, decaying exponentials.
Power signal: Average power P = lim(1/2T)∫|x(t)|²dt is finite and non-zero; total energy = ∞. Periodic signals — sinusoids, square waves.
A signal cannot be both an energy and a power signal simultaneously.

**Q: Why is linear phase important in FIR filters?**
Linear phase means constant group delay — all frequency components experience the same time delay. Waveform shape is preserved (no phase distortion). Achieved with symmetric FIR coefficients h[n] = h[N-n]. Essential for: audio processing (avoids perceptible distortion), communications (preserves pulse shapes), biomedical signals (ECG, EEG waveform integrity).

## Control Systems

**Q: Gain margin and phase margin — definitions?**
Gain Margin (GM): Additional gain that can be applied before instability. Measured at phase crossover frequency ωpc where ∠G = -180°. GM (dB) = -20log|G(jωpc)|. Positive GM = stable.
Phase Margin (PM): Additional phase lag tolerable before instability. Measured at gain crossover frequency ωgc where |G(jω)| = 0 dB. PM = 180° + ∠G(jωgc). Positive PM = stable. Design targets: GM > 6 dB, PM > 30-45°.

**Q: Significance of damping ratio ζ?**
ζ = 0: Undamped — sustained oscillations at natural frequency (unstable practically).
0 < ζ < 1: Underdamped — decaying oscillations, overshoot present.
ζ = 1: Critically damped — fastest settling without overshoot.
ζ > 1: Overdamped — no overshoot, sluggish response.
Typical design target: ζ = 0.4–0.8 (acceptable overshoot with reasonable speed).

## Devices and Communications

**Q: Why does MOSFET drain current saturate?**
When VDS = VGS − Vth (pinch-off), the channel at the drain end vanishes. Further increases in VDS drop across the depletion region, not the channel — channel current stays nearly constant at ID(sat) = (μnCox/2)(W/L)(VGS−Vth)². This creates the flat saturation region in the ID-VDS characteristic.

**Q: What is the Early effect in BJT?**
Base-width modulation: as VCE increases, the collector-base depletion region widens into the base, reducing effective base width and increasing collector current slightly. Extrapolating IC-VCE curves in the active region meets the VCE axis at −VA (Early voltage). Higher VA = better current source behaviour = higher output resistance ro = VA/IC.

**Q: FM vs AM noise performance?**
FM uses wideband modulation — exchanges bandwidth for SNR improvement. FM demodulator (limiter → discriminator) suppresses amplitude noise through limiting. Above the threshold, FM exhibits capture effect (strong signal captures demodulator). Wideband FM figure of merit: 3β²(β+1) >> 1 vs AM maximum SNR of 1 (DSB-SC) or less (conventional AM).

**Q: Shannon-Hartley theorem — state and explain.**
C = B log₂(1 + SNR) bits/second. The theoretical maximum error-free data rate for an AWGN channel with bandwidth B Hz and signal-to-noise ratio SNR. This is a fundamental physical limit — no modulation or coding scheme can exceed it. Increasing bandwidth shows diminishing returns (log relationship); SNR improvements also show diminishing returns at high values.

**Q: Characteristic impedance and why it matters?**
Z₀ = √(L/C) per unit length — the impedance seen by a travelling wave in one direction. When load ZL = Z₀: zero reflection (Γ = 0, SWR = 1), maximum power transfer. Mismatch causes standing waves, reflected power, and signal integrity problems. Standard values: 50Ω (RF systems), 75Ω (cable TV), 300Ω (TV folded dipole antenna).

**Q: What is quantisation noise in ADC?**
When a continuous analogue signal is converted to digital, the signal must be rounded to the nearest quantisation level. The difference between the actual value and the quantised value is quantisation error. For uniform quantisation with n-bit ADC, step size Δ = V_range / 2ⁿ. Quantisation noise power = Δ²/12. Signal-to-Quantisation-Noise Ratio (SQNR): SQNR (dB) ≈ 6.02n + 1.76 dB for sinusoidal input. Each additional bit improves SQNR by ~6 dB. This limits ADC dynamic range.

**Q: Explain pulse-width modulation (PWM) and its applications.**
PWM: the duty cycle (ratio of ON time to total period) of a digital pulse is varied to encode information or control power. Duty cycle = t_ON / T. Average output voltage = Duty cycle × V_supply. Applications: motor speed control (vary average voltage to motor), LED dimming (vary average light output), switch-mode power supplies (regulate output voltage), servo motor control (pulse width encodes angular position), audio class-D amplifiers (high efficiency). Advantages: digital control, high efficiency (switch is either fully ON or fully OFF — minimal power dissipation).

**Q: What is the difference between FM and PM (phase modulation)?**
In FM: instantaneous frequency varies proportionally with the message signal. fi = fc + kf × m(t). Frequency deviation proportional to message amplitude.
In PM: instantaneous phase varies proportionally with the message signal. φ(t) = kp × m(t). Phase deviation proportional to message amplitude.
Relationship: FM and PM are closely related — FM of m(t) is equivalent to PM of the integral of m(t). For sinusoidal message m(t) = Am cos(2πfmt): FM modulation index β = kf × Am / fm (depends on message frequency); PM modulation index η = kp × Am (independent of message frequency). In practice, commercial FM radio uses FM; some digital schemes use phase modulation (BPSK, QPSK).

**Q: What is the difference between half-wave and full-wave rectification?**
Half-wave rectifier: uses one diode; conducts only during positive (or negative) half-cycle; output DC appears only 50% of the time; ripple factor = 1.21 (very high); DC output = Vm/π ≈ 0.318Vm; very inefficient.
Full-wave rectifier: Two types: Centre-tap (2 diodes, centre-tapped transformer) and Bridge (4 diodes, no centre tap needed). Conducts during BOTH half-cycles; ripple factor = 0.48 (much better); DC output = 2Vm/π ≈ 0.636Vm; more efficient; ripple frequency = 2× supply frequency (easier to filter). Bridge rectifier preferred in practice: no centre-tap transformer needed, better transformer utilisation. PIV: each diode in bridge = Vm (vs 2Vm for centre-tap).

**Q: What is noise figure and why does it matter in RF receivers?**
Noise Figure (NF): measure of noise added by a device or system relative to the noise at its input. NF = SNR_in/SNR_out (in dB: NF = 10 log(SNR_in/SNR_out)). An ideal noiseless device has NF = 0 dB. Real amplifiers, mixers, and filters add noise → NF > 0 dB. In a cascade of stages: total NF dominated by the first stage (Friis formula: NF_total ≈ NF₁ + (NF₂-1)/G₁ + ...). This is why the Low Noise Amplifier (LNA) — the first stage in a receiver — must have low NF. NF determines receiver sensitivity: lower NF → can receive weaker signals → better range.
