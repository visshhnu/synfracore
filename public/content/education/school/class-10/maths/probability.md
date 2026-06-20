# Probability

## Why This Chapter Matters

Probability is the last chapter and has a guaranteed 3-5 marks in every board exam. The questions are logical rather than formula-heavy — they test whether you can identify sample spaces and favourable outcomes. With practice, this chapter becomes very scoring.

## Prerequisites

- Basic probability from Class 9
- Fractions and simplification
- Counting methods

---

## Core Concepts

### 1. Theoretical (Classical) Probability

$$P(E) = \frac{\text{Number of favourable outcomes}}{\text{Total number of outcomes}}$$

**Important range:** 0 ≤ P(E) ≤ 1

- P(E) = 0 → Impossible event (will never happen)
- P(E) = 1 → Sure event (will always happen)

---

### 2. Complementary Events

If E is an event, then NOT E (written as Ē or E') is its complement.

$$P(E) + P(\bar{E}) = 1 \ \Rightarrow \ P(\bar{E}) = 1 - P(E)$$

---

### 3. Sample Space for Common Problems

#### Coin
- Single coin: {H, T} → 2 outcomes
- Two coins: {HH, HT, TH, TT} → 4 outcomes
- Three coins: {HHH, HHT, HTH, HTT, THH, THT, TTH, TTT} → 8 outcomes

**Note:** HT and TH are different (order matters)

#### Dice
- Single die: {1, 2, 3, 4, 5, 6} → 6 outcomes
- Two dice: 6 × 6 = 36 outcomes (all ordered pairs)

**Common two-dice events:**

| Event | Favourable outcomes | Probability |
|---|---|---|
| Sum = 2 | (1,1) | 1/36 |
| Sum = 7 | (1,6),(2,5),(3,4),(4,3),(5,2),(6,1) | 6/36 = 1/6 |
| Sum = 12 | (6,6) | 1/36 |
| Doubles | (1,1),(2,2),...,(6,6) | 6/36 = 1/6 |

#### Cards (Standard Deck = 52 cards)

```
52 cards = 4 suits × 13 cards each

Suits: Hearts ♥ (red), Diamonds ♦ (red), Clubs ♣ (black), Spades ♠ (black)

Each suit: A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K

Face cards (court cards): J, Q, K → 12 total (3 per suit)
Aces: 4 total (one per suit)
Honours: A, J, Q, K → 16 total
```

---

## Solved Examples

### Example 1 — Basic
**Q:** A die is thrown. Find P(prime number).

Prime numbers on die: 2, 3, 5 → 3 favourable outcomes
Total outcomes: 6
P(prime) = 3/6 = **1/2**

### Example 2 — Cards
**Q:** A card is drawn from a well-shuffled deck. Find:
(a) P(red ace) (b) P(face card) (c) P(neither jack nor king)

(a) Red aces: Ace of Hearts, Ace of Diamonds = 2 → P = 2/52 = **1/26**
(b) Face cards: 12 → P = 12/52 = **3/13**
(c) Jacks = 4, Kings = 4, total to exclude = 8. Favourable = 52−8 = 44 → P = 44/52 = **11/13**

### Example 3 — Two Dice
**Q:** Two dice are thrown. Find P(sum ≤ 5).

List outcomes where sum ≤ 5:
Sum=2: (1,1) → 1
Sum=3: (1,2),(2,1) → 2
Sum=4: (1,3),(2,2),(3,1) → 3
Sum=5: (1,4),(2,3),(3,2),(4,1) → 4
Total favourable = 10
P = 10/36 = **5/18**

### Example 4 — Word Problem
**Q:** A bag contains 5 red, 3 black, and 2 white balls. One ball is drawn at random. Find P(not black).

Total = 10, Black = 3
P(not black) = 1 − 3/10 = **7/10**

Or directly: non-black balls = 7 → P = 7/10 ✓

---

## PYQs

### 2023
**Q:** A box contains 3 blue, 2 white, and 4 red marbles. A marble is drawn randomly. Find P(not red).
Total = 9, Red = 4, Not red = 5
P(not red) = **5/9**

### 2022
**Q:** Two players A and B take turns. A wins if he gets a 6 on his throw. B wins if she gets a sum of 7 on two dice. Who has a better chance?
P(A wins) = 1/6
P(B wins) = 6/36 = 1/6
**Equal chances**

### 2021
**Q:** What is the probability that a leap year chosen at random will have 53 Sundays?

A leap year = 366 days = 52 weeks + 2 extra days
The 2 extra days can be: (Mon,Tue), (Tue,Wed), (Wed,Thu), (Thu,Fri), (Fri,Sat), (Sat,Sun), (Sun,Mon)
Total = 7 possibilities. Sundays in 53 → 2 cases include Sunday: (Sat,Sun) and (Sun,Mon)
P = **2/7**

### 2020
**Q:** A card is drawn from a shuffled deck. What is the probability of drawing a card that is not a face card?

Face cards = 12 (J, Q, K of 4 suits)
Not face cards = 52 − 12 = 40
P = 40/52 = **10/13**

---

## MCQ Practice

**Q1.** P(impossible event) = (A) 1 (B) 0.5 (C) 0 ✓ (D) Undefined

**Q2.** From digits 1-9, probability of picking a perfect square:
Perfect squares: 1, 4, 9 → 3 numbers
P = 3/9 = **1/3** ✓

**Q3 (Hard).** Cards numbered 1 to 20 are shuffled. Find P(number is prime OR divisible by 3).
Primes (1-20): 2,3,5,7,11,13,17,19 → 8
Divisible by 3: 3,6,9,12,15,18 → 6
Both (prime AND div by 3): just 3 → 1
P = (8 + 6 − 1)/20 = 13/20

---

## Revision Notes

```
FUNDAMENTAL FORMULA:
  P(E) = Favourable outcomes / Total outcomes
  0 ≤ P(E) ≤ 1

COMPLEMENT:
  P(E) + P(Ē) = 1

IMPORTANT COUNTS (memorise!):
  Deck: 52 cards, 4 suits, 13 per suit
  Face cards: 12 (J, Q, K in all 4 suits)
  Aces: 4 | Red cards: 26 | Black cards: 26
  
  Single die: 6 outcomes
  Two dice: 36 outcomes
  
  Single coin: 2 | Two coins: 4 | Three coins: 8

CLASSIC ANSWERS:
  P(sum=7 on two dice) = 6/36 = 1/6 (most likely sum)
  P(getting 6 on die) = 1/6
  P(red card from deck) = 26/52 = 1/2
```

**Common Mistakes:**
❌ Not listing ALL outcomes for two-dice problems (36, not 11)
❌ Counting HT and TH as the same (they're not!)
❌ Writing probability > 1 or < 0 (always check: 0 ≤ P ≤ 1)
❌ For "not" events, always use P(Ē) = 1 − P(E) instead of counting manually

## Related Topics
- Chapter 14 — Statistics (experimental probability)
- JEE: Probability theory, Bayes theorem, probability distributions
