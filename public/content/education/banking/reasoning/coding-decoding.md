# Coding and Decoding

## Why This Chapter Matters
Coding-Decoding has 3-5 marks in Banking exams. The new pattern (grid/row-column based) is more complex than traditional letter coding. Master both old and new patterns.

## Types of Coding

### 1. Letter Substitution (Old Pattern)
Each letter → another letter by a fixed rule.
Example: If CAT = FDW (each letter +3), then DOG = GRJ

**Common rules:**
+1 to each letter (A→B, B→C)
Reverse alphabet (A→Z, B→Y, C→X...) where A=1, Z=26 and reversed letter = 27-position
Specific pattern: alternate letters, skip letters, mirror pairs

**Approach:**
Find the relationship between each letter in code word and original word.
Check if it's +N, -N, reversed, or other pattern.
Apply same pattern to find answer.

### 2. Number Coding
Words → numbers based on position, word length, vowel count, etc.
Example: if BALL = 3122 and each letter coded as its position in word...
Or: BIRD = 2914 (B=2nd letter, I=9th, R=18th, D=4th)

**Approach:** Find relationship between word and number code.

### 3. New Pattern — Row/Column Grid Coding
Table with rows and columns. Row number + Column number gives a digit.

Example grid:
```
     0   1   2   3   4
0    P   Q   R   S   T
1    U   V   W   X   Y
2    Z   A   B   C   D
```
To code letter Q: it's at Row 0, Column 1 → 01.
Letter B: Row 2, Column 2 → 22.

To decode 14: Row 1, Column 4 → Y.

**Approach:**
1. Locate the letter in the grid.
2. Record row number then column number.

### 4. Sentence/Word Coding
If "sky is blue" = "la mi ro" and "blue is water" = "ro mi ka", then:
"blue" = "ro" (appears in both with same code word)
"is" = "mi" (appears in both)
"sky" = "la", "water" = "ka"

**Approach:** Find common words and their common codes.

### 5. Mixed Coding
Symbols, numbers, and letters combined.
Example: if P means ÷, Q means ×, R means +, S means -, then:
15 Q 4 R 5 P 5 S 10 = ?
= 15 × 4 + 5 ÷ 5 - 10 = 60 + 1 - 10 = 51

## Solved Examples

**Q1 (Letter coding):** If COMPUTER = RFUVQNOB, what is INTERNET?
C→R, O→F, M→U, P→V, U→Q, T→N, E→O, R→B
Positions: C=3→R=18 (reverse alphabet: 26-3+1=24=X? No...)
Try: COMPUTER reversed is RETUPMOC. R=R, E=F? No.
Check: C(3)→R(18)=+15? O(15)→F(6)=-9? No consistent rule.
Try: C→R is 3→18 (diff=15), O→F is 15→6 (diff=-9). Not consistent.
Alternate: each letter replaces with its mirror (A↔Z, B↔Y): C→X, O→L. Doesn't match R,F.
COMPUTER = RFUVQNOB: R(18)←C(3): 3+15=18. F(6)←O(15): 15-9=6? 15÷..? Pattern may be position specific.
In exam: write pairs and find pattern systematically.

**Q2 (Sentence coding):** "birds can fly" = "la ko mi", "fish can swim" = "da ko ri", "birds can swim" = "la ko ri". Code for "fly"?
"birds" appears in statements 1,3 → "la" (common code in 1,3)
"can" appears in all → "ko" (common in all three)
"swim" in 2,3 → "ri" (common in 2,3). "fly" = "mi" (only in statement 1, not matched)

## Revision Notes
```
LETTER CODING PATTERNS:
+N: each letter shifted forward by N positions
-N: each letter shifted backward
Reverse: A=Z, B=Y... (26-pos+1 or use 27-pos)
Mirror: reflect around middle

SENTENCE CODING:
Find common words across statements → same code word in both
Process of elimination: what's left after common ones identified = code for unique word

NEW PATTERN (Grid):
Locate letter → Row number + Column number = code
Given code → Row = first digit, Column = second digit → find letter

MIXED CODING:
Decode all symbols first, then compute BODMAS
```
