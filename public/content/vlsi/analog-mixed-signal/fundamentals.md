# Analog & Mixed-Signal Design — Fundamentals

Overview introduced op-amp gain equations and the ADC/DAC concept. This page works through the actual numbers: computing an ADC's resolution and quantization error, converting a real digital code to its analog output through a DAC, and the standard formula relating an ADC's bit resolution to its theoretical best-case signal quality (SNR). All three examples connect directly back to Digital Logic Fundamentals' binary number-system material — an ADC/DAC's "N-bit code" is exactly the same binary representation covered there, just now tied to a real physical voltage instead of an abstract decimal-to-binary exercise.

**Analogy** — Think of an ADC as a ruler with a fixed number of tick marks. A ruler with only 4 tick marks per inch can only report a measurement as "closest to this tick mark," even if the real length falls between two ticks — the more tick marks the ruler has (the more bits the ADC has), the smaller that unavoidable rounding error gets, but it never disappears completely with a finite number of ticks. Quantization error is exactly that unavoidable "which tick mark is closest" rounding, and it's a fundamental, unavoidable property of converting anything continuous into a fixed number of discrete steps — not a flaw specific to any one ADC design.

## ADC Resolution and Quantization Error

```
An N-bit ADC with reference voltage Vref divides its full input
range into 2^N discrete steps. The size of ONE step -- the smallest
voltage change the ADC can distinguish -- is called the LSB (Least
Significant Bit) size:

  LSB = Vref / 2^N

Because any input voltage gets rounded to the NEAREST step, the
maximum possible rounding error (quantization error) is HALF a step:

  Max quantization error = LSB / 2
```

### Annotated Example — Computing Resolution for a Real ADC

An 8-bit ADC with a 5V reference voltage:

```
LSB = Vref / 2^N
    = 5V / 2^8
    = 5V / 256
    = 0.01953125 V
    = 19.53 mV

Max quantization error = LSB / 2
                        = 19.53 mV / 2
                        = 9.77 mV
```

Verified computationally: 5V / 256 = 19.53 mV per step, exactly. This means the ADC can never report a voltage more precisely than to within about ±9.77 mV of the true value — no matter how good the rest of the circuit is, this rounding error is a hard mathematical floor set purely by the bit count and reference voltage, the same "fixed number of discrete steps" limitation that applies to any N-bit binary representation from Digital Logic Fundamentals, just now expressed as a voltage instead of an integer count.

## DAC: Converting a Digital Code Back to a Voltage

```
A DAC does the reverse operation: given an N-bit binary code
(exactly the kind of binary number Digital Logic Fundamentals
taught you to convert to and from decimal), it outputs

  Vout = code x (Vref / 2^N)

where "code" is the DECIMAL VALUE of the binary input -- the exact
same binary-to-decimal conversion skill from Digital Logic
Fundamentals, now feeding directly into a physical circuit
computation instead of standing alone.
```

### Annotated Example — Converting an 8-Bit Code to an Analog Voltage

An 8-bit DAC with Vref = 5V receives the digital code `10110100`.

```
Step 1: Convert the binary code to decimal (Digital Logic
Fundamentals' binary-to-decimal skill, reused directly)
  10110100 = 128 + 32 + 16 + 4 = 180 (decimal)

Step 2: Apply the DAC formula
  Vout = code x (Vref / 2^N)
       = 180 x (5V / 256)
       = 180 x 0.01953125 V
       = 3.515625 V
```

Verified computationally: binary `10110100` correctly converts to decimal 180 (128+32+16+4 = 180), and 180 × (5/256) = 3.515625 V exactly. This is a direct, concrete link back to Digital Logic Fundamentals' number-system material — the exact same decimal↔binary conversion process, now the literal first step of a real DAC circuit computation rather than an isolated exercise.

## SNR: How Bit Resolution Limits Signal Quality

```
An ADC's theoretical best-case Signal-to-Noise Ratio (SNR), assuming
quantization error is the ONLY noise source (a simplification -- real
ADCs have additional noise sources too), follows a standard formula:

  SNR (dB) = 6.02 x N + 1.76

where N is the number of bits. Each additional bit improves SNR by
about 6 dB -- a well-known industry rule of thumb ("6 dB per bit")
that follows directly from this formula.
```

```
8-bit ADC:  SNR = 6.02(8)  + 1.76 = 49.92 dB
10-bit ADC: SNR = 6.02(10) + 1.76 = 61.96 dB
12-bit ADC: SNR = 6.02(12) + 1.76 = 74.00 dB
16-bit ADC: SNR = 6.02(16) + 1.76 = 98.08 dB

Verified computationally for all four cases. Notice each +2 bits
adds roughly +12 dB (2 x 6.02 ≈ 12.04), confirming the "6 dB per
bit" rule of thumb directly from the formula rather than needing to
memorize it separately.
```

## Try It (2 Minutes)

A 10-bit DAC with Vref = 3.3V receives the digital code `0110010101` (binary).

1. What is this code's decimal value?
2. What is the DAC's output voltage?
3. Using the SNR formula, what is this DAC's theoretical SNR in dB (same formula applies to DACs as ADCs, since both share the same 2^N discrete-step limitation)?

You should land on: `0110010101` = 128+64+16+4+1 = 213 (decimal); Vout = 213 × (3.3V/1024) = 213 × 0.003223V ≈ 0.6866 V; SNR = 6.02(10) + 1.76 = 61.96 dB — the same 10-bit SNR value computed above, since SNR depends only on bit count and reference voltage choice, not on which specific code happens to be converted.

## Study Resources
- **Sedra & Smith, *Microelectronic Circuits*** — covers ADC/DAC fundamentals and quantization error in the same style used above
- **Analog Devices — "MT-001: Taking the Mystery out of the Infamous Formula" (Analog Dialogue)** — the standard reference explaining the SNR = 6.02N + 1.76 formula's derivation
- **Texas Instruments — ADC/DAC Fundamentals application notes** — free reference material on resolution, quantization error, and conversion examples
