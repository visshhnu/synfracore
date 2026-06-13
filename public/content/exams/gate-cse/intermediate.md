# GATE CSE — Intermediate Topics

## Theory of Computation

```
Finite Automata (FA):
  DFA: deterministic, exactly one transition per symbol per state
  NFA: non-deterministic, multiple transitions possible
  NFA → DFA via subset construction
  Regular languages: closed under union, intersection, complement

Regular Expressions:
  a*: zero or more a's
  a+: one or more a's
  a|b: a or b
  (ab)*: zero or more "ab"

Context-Free Grammars:
  Productions: S → aSb | ε (palindromes)
  Push-down automata (PDA) recognize CFGs
  Ambiguity: multiple parse trees for same string

Turing Machines:
  Most powerful computational model
  Recognizable (RE) vs Decidable (recursive) languages
  Halting problem: UNDECIDABLE
  
Pumping Lemma:
  For regular: in any long enough string, middle part can be pumped
  For CFL: similar but with uvwxy decomposition
  Use to PROVE a language is NOT regular/CFL
```

## Computer Organization

```
Number Systems:
  Binary, Octal, Hex conversions
  2's complement: negate = flip bits + 1
  Overflow detection: carry into MSB ≠ carry out

Instruction Set Architecture:
  RISC vs CISC
  Addressing modes: immediate, direct, indirect, register, indexed
  
Pipeline:
  IF → ID → EX → MEM → WB (5-stage)
  Hazards: structural (resource conflict), data (dependency), control (branch)
  Data hazard solution: forwarding (bypass), stall (bubble)
  Branch prediction: static (always not taken) vs dynamic

Cache:
  Direct mapped: address mod cache_size
  Fully associative: any block anywhere
  Set associative: compromise
  Replacement: LRU, FIFO, Random
  Write: write-through vs write-back
```
