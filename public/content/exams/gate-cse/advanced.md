# GATE Computer Science — Advanced

## GATE CSE — Advanced Topics

### Theory of Computation

```
AUTOMATA HIERARCHY:
  Finite Automata (DFA/NFA) → recognize Regular Languages
  Pushdown Automata (PDA) → recognize Context-Free Languages
  Turing Machine → recognize Recursively Enumerable Languages
  
  Closure properties:
    Regular: closed under union, intersection, complement, concatenation, Kleene star
    CFL: closed under union, concatenation, Kleene star
    CFL: NOT closed under intersection, complement

PUMPING LEMMA:
  Regular: for L regular, ∃ p such that any w in L with |w|≥p can be split into xyz
    where |xy|≤p, |y|≥1, and xy^iz ∈ L for all i≥0
  Use: to PROVE language is NOT regular

TURING MACHINE:
  Decidable: TM always halts and accepts or rejects
  Recognizable: TM may loop on some inputs
  
  Undecidable problems:
    Halting Problem: does TM M halt on input w? — UNDECIDABLE
    Post Correspondence Problem (PCP)
    Emptiness of CFL is decidable; intersection of two CFLs is undecidable

COMPILER DESIGN — PARSING:
  LL(k): Left-to-right, Leftmost derivation, k lookahead
    LL(1): parse using FIRST and FOLLOW sets
    First(A): set of terminals that begin strings derived from A
    Follow(A): set of terminals that can appear after A
  
  LR parsers: more powerful than LL
    LR(0) ⊂ SLR(1) ⊂ LALR(1) ⊂ LR(1)
    Most compilers use LALR(1) (yacc/bison use this)

DATABASE — CONCURRENCY:
  Serializability: schedule equivalent to some serial schedule
  Conflict serializable: check with precedence graph (cycle = not serializable)
  View serializable: weaker, harder to test
  
  2PL (Two-Phase Locking):
    Growing phase: only acquire locks
    Shrinking phase: only release locks
    Strict 2PL: release all locks at commit/abort
    Guarantees conflict serializability
```

## Revision Notes
```
REGULAR LANGUAGES: DFA/NFA | closed under all set operations
CFL: PDA | NOT closed under intersection/complement
HALTING PROBLEM: undecidable — fundamental result in computation theory
LL(1) vs LR(1): LR more powerful | LALR(1) used in practice (yacc/bison)
SERIALIZABLE: conflict serializable ⊂ view serializable | precedence graph for testing
2PL: growing then shrinking phases | guarantees conflict serializability
```
