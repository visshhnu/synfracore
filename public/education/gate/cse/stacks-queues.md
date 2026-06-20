# Stacks and Queues

## Why This Chapter Matters
Stacks and queues appear in GATE every year — 4-8 marks. Infix-to-postfix conversion, expression evaluation, and queue implementations are favourite questions.

## Core Concepts

### 1. Stack (LIFO — Last In First Out)
Operations: push(x), pop(), peek()/top(), isEmpty()
All operations: O(1)

**Applications:**
- Expression evaluation (postfix)
- Infix to postfix/prefix conversion
- Function call stack / recursion
- Undo operations
- Balancing parentheses
- DFS traversal

### 2. Queue (FIFO — First In First Out)
Operations: enqueue(x), dequeue(), front(), isEmpty()
All operations: O(1)

**Circular Queue:** Front and rear wrap around array. Solves wasted space problem.
isFull: (rear+1)%n == front
isEmpty: front == rear

**Priority Queue:** Dequeue gives highest/lowest priority element.
Implemented with heap: O(log n) enqueue/dequeue.

**Deque (Double-ended queue):** Insert/delete from both ends.

### 3. Infix to Postfix Conversion (GATE FAVOURITE!)

**Algorithm:**
1. Scan left to right
2. Operand: output directly
3. '(': push to stack
4. ')': pop and output until '(' found
5. Operator: pop operators with higher/equal precedence (except '('), then push current
6. End: pop all remaining operators

Precedence: ^ > * = / > + = -

**Example:** A + B * C - D
Scan A: output A
Scan +: push +
Scan B: output B
Scan *: push * (higher than +)
Scan C: output C
Scan -: pop * (higher), pop + (equal), push -.  Output B C * A +
Scan D: output D. End: pop -
Result: A B C * + D -

### 4. Postfix Evaluation

Algorithm:
1. Scan left to right
2. Operand: push to stack
3. Operator: pop two operands (second op first, first op second), apply, push result

**Example:** 5 3 2 * + 7 -
Push 5, push 3, push 2. Operator *: pop 2,3, push 6.
Operator +: pop 6,5, push 11. Push 7. Operator -: pop 7,11, push 4.
Result: 4

## PYQs
**GATE 2024:** Convert (A+B)*C - D/E to postfix.
AB+C*DE/-

**GATE 2023:** How many stacks are needed to implement a queue?
2 stacks. Enqueue: push to stack1. Dequeue: if stack2 empty, move all from stack1 to stack2, pop from stack2.

**GATE 2022:** A stack of size n can hold at most n elements. Which application CANNOT use a bounded stack?
Recursive function calls — recursion depth may be unbounded. (Correct answer: recursion)

## Revision Notes
```
STACK: LIFO, push/pop/peek all O(1)
QUEUE: FIFO, enqueue/dequeue all O(1)

INFIX TO POSTFIX STEPS:
1. Operands: output immediately
2. Operators: manage by precedence (higher pops lower)
3. '(': push | ')': pop until '('
4. End: pop remaining stack

POSTFIX EVALUATION:
Scan left to right. Operand: push. Operator: pop two, compute, push result.

PRECEDENCE: ^ > */  > +-
ASSOCIATIVITY: ^ is right-to-left, rest are left-to-right
```
