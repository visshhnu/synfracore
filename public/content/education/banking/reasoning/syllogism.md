# Syllogism

## Why This Chapter Matters
Syllogism has 5-10 marks in every Banking exam. The new pattern includes possibility cases which confuse many candidates. Master the rules and you can score full marks.

## Core Concepts

### 1. Basic Statements (Propositions)
Universal Affirmative (A): "All A are B"
Universal Negative (E): "No A is B"  
Particular Affirmative (I): "Some A are B"
Particular Negative (O): "Some A are not B"

### 2. Venn Diagram Approach
Draw circles representing each category. Check which arrangement(s) satisfy ALL given statements.
Conclusion is valid if it's TRUE in ALL possible Venn diagrams (not just one).

### 3. Rules for Direct Conclusions

| Premise 1 | Premise 2 | Valid Conclusion |
|---|---|---|
| All A are B | All B are C | All A are C |
| All A are B | No B is C | No A is C |
| Some A are B | All B are C | Some A are C |
| Some A are B | No B is C | Some A are not C |
| All A are B | Some B are C | Some A are C (may not always follow — check Venn) |

**Quick rule:** Universal + Universal → can give Universal or Particular
Particular + Particular → NO definite conclusion

### 4. Possibility Cases (New Pattern — Most Tricky!)

Statement: "Some A are B"
**Possibility:** "All A are B" is POSSIBLE (because "Some A are B" doesn't say anything about the rest of A)
**Not possible:** "No A is B" (contradicts the statement)

Statement: "No A is B"
**Possibility:** "Some A are not B" is POSSIBLE (in fact, it definitely follows)
**Not possible:** "Some A are B" or "All A are B"

Statement: "All A are B"  
"Some A are B" is DEFINITELY TRUE (a consequence)
"All B are A" is POSSIBLE (if circles overlap perfectly) but not definite

**Key rule for possibility:**
"All/Some A are B is possible" = the circles for A and B CAN overlap (even if not stated they do)
"No A is B is possible" = the circles CAN be separate

### 5. Common Mistakes
"Some A are B" does NOT mean "Some A are not B" (the rest of A might also be B)
"All A are B" DOES imply "Some A are B" (true if A is non-empty)
"No A is B" DOES imply "Some A are not B"

## Practice Problems

**Q1:** Statements: All cats are dogs. Some dogs are rats.
Conclusions: (I) Some cats are rats (II) Some rats are cats.
I: Not definite (some dogs are cats, some dogs are rats, but they may not overlap)
II: Same issue. Neither follows definitely. Answer: Neither follows.

**Q2:** Statements: No book is pen. All pens are bags.
Conclusions: (I) No book is bag (II) Some bags are not books.
Possible Venn: Books outside {pen,bag}. Pens inside bags.
I: Not necessary (bags could include non-pen items that might overlap with books). Actually: No pen is a book (from no book is pen, symmetric). Bags include pens, may include other things. Books may or may not be bags. I does NOT definitely follow.
II: Pens are bags. No pen is book. So pens (which are bags) are not books → Some bags are not books. II FOLLOWS.

**Q3 (Possibility):** Statements: Some apples are oranges.
Conclusion: All apples are oranges is a possibility.
True — "some" doesn't rule out "all". Possibility is valid.

## Previous Year Questions
**IBPS PO 2023:** 4-statement syllogisms with 2 conclusions + 2 possibility cases.
**SBI Clerk 2022:** New pattern with coded syllogisms (symbols replace words).

## Revision Notes
```
A = All...are... (Universal Affirmative)
E = No...is... (Universal Negative)
I = Some...are... (Particular Affirmative)
O = Some...are not... (Particular Negative)

DEFINITE CONCLUSIONS:
All A-B + All B-C → All A-C
All A-B + No B-C → No A-C  
Some A-B + All B-C → Some A-C

POSSIBILITY RULES:
"Some A are B" → All A are B is POSSIBLE (but not definite)
"No A is B" → Some A are B is NOT POSSIBLE
"All A are B" → Some A are B is DEFINITE (not just possible)

Particular + Particular → No definite conclusion
Universal Negative is symmetric: No A-B = No B-A
```
