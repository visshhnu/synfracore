# Computer Science Basics — Fundamentals

This section goes deeper into the basics from the Overview — not new topics, but the details and reasoning you need to actually use them confidently, not just recognize them.

## Variables: What's Actually Happening

When you write `age = 16`, Python does two things: creates an integer object holding the value 16, and makes the name `age` point to it. This matters because of how assignment behaves with existing variables:

```python
a = 10
b = a       # b now points to the same value as a
a = 20      # a now points to a NEW value; b is unaffected

print(a)    # 20
print(b)    # 10 — b didn't change just because a did
```

This trips up beginners constantly: `b = a` copies the *value at that moment*, not a permanent link between the two variables.

## Type Conversion — Moving Between Types Deliberately

Python won't automatically combine incompatible types — this is why `print("Age: " + age)` fails if `age` is a number, but `print("Age:", age)` works fine (the comma-separated form converts automatically for display; direct `+` concatenation does not).

```python
age = 16
print("Age: " + str(age))     # convert int -> str explicitly, works
# print("Age: " + age)        # this line would crash — TypeError

age_text = "16"
age_number = int(age_text)    # convert str -> int
print(age_number + 1)         # 17

price_text = "99.99"
price = float(price_text)     # convert str -> float
print(price * 2)              # 199.98
```

**Rule worth memorizing**: `+` between a string and a number always fails. Convert one side deliberately with `str()`, `int()`, or `float()` before combining them.

## Operators, All Four Categories

```python
# Arithmetic
print(7 + 3, 7 - 3, 7 * 3, 7 / 3, 7 // 3, 7 % 3, 7 ** 2)
# 10 4 21 2.333... 2 1 49

# Comparison — always produce True/False
print(5 > 3, 5 == 5, 5 != 3, 5 <= 4)
# True True True False

# Logical — combine True/False values
age = 16
has_id = True
print(age >= 18 and has_id)   # False (age condition fails)
print(age >= 18 or has_id)    # True (has_id alone makes it True)
print(not has_id)             # False

# Assignment shortcuts
score = 10
score += 5   # same as: score = score + 5   -> 15
score -= 2   # -> 13
score *= 2   # -> 26
```

**Common mistake**: confusing `=` (assignment — "make this equal to") with `==` (comparison — "is this equal to"). `if score = 10:` is a syntax error in Python precisely to catch this mistake early; the correct form is `if score == 10:`.

## Nested Conditions and Loops

Once a single `if` or `for` isn't enough, you nest them — one inside another. This is where indentation (which you've been using without much thought so far) actually starts to matter for logic, not just style:

```python
# Nested if: check age, then check a second condition only if the first passes
age = 20
has_license = True

if age >= 18:
    if has_license:
        print("Can drive")
    else:
        print("Can't drive yet -- no license")
else:
    print("Too young to drive")

# Nested loop: a multiplication grid
for i in range(1, 4):
    for j in range(1, 4):
        print(f"{i} x {j} = {i*j}", end="  ")
    print()   # new line after each row
# Output:
# 1 x 1 = 1  1 x 2 = 2  1 x 3 = 3
# 2 x 1 = 2  2 x 2 = 4  2 x 3 = 6
# 3 x 1 = 3  3 x 2 = 6  3 x 3 = 9
```

The inner loop completes fully for every single pass of the outer loop — that's why the grid fills row by row.

## break, continue, and pass

Three keywords that change a loop's normal flow, each doing something different:

```python
# break: exit the loop immediately, entirely
for i in range(1, 10):
    if i == 5:
        break
    print(i, end=" ")
# Output: 1 2 3 4  (stops before 5, loop ends completely)

# continue: skip just this iteration, keep looping
for i in range(1, 6):
    if i == 3:
        continue
    print(i, end=" ")
# Output: 1 2 4 5  (3 is skipped, but the loop continues)

# pass: does nothing -- a placeholder when syntax requires a
# statement but you don't have one yet
for i in range(5):
    if i == 2:
        pass   # "handle this later" -- doesn't stop or skip anything
    print(i)
# Output: 0 1 2 3 4  (pass didn't change the loop's behavior at all)
```

`break` and `continue` are genuinely different — `break` ends the loop, `continue` just skips ahead to the next round of it. Confusing the two is a common source of logic bugs.

## String Methods You'll Use Constantly

```python
name = "  Priya Sharma  "

print(name.strip())          # "Priya Sharma" -- removes leading/trailing spaces
print(name.strip().upper())  # "PRIYA SHARMA"
print(name.strip().split())  # ['Priya', 'Sharma'] -- splits into a list of words
print("-".join(["a", "b", "c"]))  # "a-b-c" -- opposite of split

text = "Computer Science"
print(text.replace("Science", "Basics"))  # "Computer Basics"
print(text.find("Science"))               # 9 -- index where it starts
print("science" in text.lower())          # True -- membership check
```

## Next Steps

Move to **Intermediate** for tuples, dictionaries, sets, exception handling, and a proper introduction to recursion and simple functions with classes — the tools that let you organize larger programs instead of writing everything as one script.
