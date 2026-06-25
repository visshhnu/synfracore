# CS for Schools Cheatsheet

## Python Quick Reference
```python
# Variables and Types
x = 10          # int
y = 3.14        # float
name = "Alice"  # string
flag = True     # boolean
nums = [1,2,3]  # list
tup = (1,2,3)   # tuple (immutable)
d = {"a":1}     # dictionary

# String methods
s = "Hello World"
s.upper()        # "HELLO WORLD"
s.lower()        # "hello world"
s.split(" ")     # ["Hello", "World"]
s.replace("o","0")  # "Hell0 W0rld"
len(s)           # 11

# List methods
lst = [3,1,2]
lst.sort()       # [1,2,3]
lst.append(4)    # [1,2,3,4]
lst.pop()        # removes last: [1,2,3]
lst.index(2)     # 1 (position of 2)

# Math operations
import math
math.sqrt(16)    # 4.0
math.pi          # 3.14159...
abs(-5)          # 5
round(3.7)       # 4
```

## Number System Conversions
```
Decimal 15 → Binary: 1111
Decimal 15 → Hex: F
Hex A = 10, B=11, C=12, D=13, E=14, F=15
Hex to Binary: each hex digit = 4 bits
  F = 1111, A = 1010 → FA = 11111010
```

## Data Sizes
| Unit | Size |
|------|------|
| 1 Byte | 8 bits |
| 1 KB | 1024 bytes |
| 1 MB | 1024 KB |
| 1 GB | 1024 MB |
| 1 TB | 1024 GB |

## Big O Quick Reference
| Operation | Array | Linked List | Hash Table |
|-----------|-------|------------|-----------|
| Access | O(1) | O(n) | N/A |
| Search | O(n) | O(n) | O(1) avg |
| Insert | O(n) | O(1) | O(1) avg |
| Delete | O(n) | O(1) | O(1) avg |
