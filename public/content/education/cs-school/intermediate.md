# Computer Science Basics — Intermediate

The Fundamentals section deepened what you already knew from the Overview. This section introduces genuinely new tools: three more ways to store data (tuples, dictionaries, sets), handling errors gracefully, recursion, and a first look at organizing code with classes.

## Tuples — Lists That Can't Change

A tuple looks like a list but is **immutable** — once created, you can't add, remove, or change its elements. This isn't a limitation for its own sake; it's useful specifically when data shouldn't change.

```python
coordinates = (10, 20)          # tuple -- parentheses, not square brackets
print(coordinates[0])           # 10
# coordinates[0] = 15           # this would crash -- TypeError, tuples are immutable

# Common real use: a function returning multiple values as a tuple
def get_min_max(numbers):
    return min(numbers), max(numbers)   # returns a tuple: (min, max)

low, high = get_min_max([4, 8, 2, 9, 5])   # unpacking the tuple into two variables
print(low, high)   # 2 9
```

**Why use a tuple instead of a list?** When the data represents a fixed structure (a coordinate pair, a date as day/month/year) that shouldn't accidentally be modified elsewhere in your program, immutability is a feature, not a restriction.

## Dictionaries — Storing Data by Key, Not Position

A list finds things by position (`marks[0]`). A dictionary finds things by a meaningful key instead:

```python
student = {
    "name": "Rahul",
    "age": 16,
    "marks": [85, 92, 78]
}

print(student["name"])          # Rahul
print(student["marks"][1])      # 92 -- a list can live inside a dictionary value

student["grade"] = "A"          # add a new key
student["age"] = 17             # update an existing key

for key, value in student.items():
    print(key, ":", value)

print("name" in student)        # True -- check if a key exists
print(student.get("height", "Not recorded"))  # "Not recorded" -- safe lookup,
                                                # no crash if key is missing
```

**Compare to a list**: if you had 5 separate lists (`names`, `ages`, `marks`...) all indexed by the same position, a dictionary per student is usually clearer and less error-prone than keeping several parallel lists in sync by hand.

## Sets — Only Unique Values, No Order

```python
numbers = [1, 2, 2, 3, 3, 3, 4]
unique_numbers = set(numbers)
print(unique_numbers)   # {1, 2, 3, 4} -- duplicates automatically removed

a = {1, 2, 3}
b = {2, 3, 4}
print(a | b)   # {1, 2, 3, 4} -- union (all elements from both)
print(a & b)   # {2, 3}       -- intersection (elements in both)
print(a - b)   # {1}          -- difference (in a, not in b)
```

Sets are the natural tool whenever "remove duplicates" or "what's common between these two groups" is the actual problem you're solving.

## Handling Errors With try/except

So far, an error (dividing by zero, converting `"abc"` to a number) has crashed your program. `try`/`except` lets you handle that gracefully instead:

```python
try:
    num = int(input("Enter a number: "))
    result = 100 / num
    print("Result:", result)
except ValueError:
    print("That wasn't a valid number.")
except ZeroDivisionError:
    print("Can't divide by zero.")
else:
    print("No errors occurred.")   # runs only if the try block succeeded
finally:
    print("Done attempting the calculation.")  # always runs, error or not
```

Catching specific exception types (`ValueError`, `ZeroDivisionError`) rather than a bare `except:` is worth building as a habit — a bare `except` silently catches *any* error, including genuine bugs you'd want to know about.

## Recursion — A Function That Calls Itself

Recursion solves a problem by breaking it into a smaller version of the same problem, until it reaches a case simple enough to answer directly:

```python
def factorial(n):
    if n <= 1:            # base case -- stops the recursion
        return 1
    return n * factorial(n - 1)   # recursive case -- calls itself with a smaller problem

print(factorial(5))   # 5 * 4 * 3 * 2 * 1 = 120
```

Tracing through `factorial(3)`:
```
factorial(3) = 3 * factorial(2)
             = 3 * (2 * factorial(1))
             = 3 * (2 * 1)
             = 6
```

**Every recursive function needs a base case.** Without one (a condition where it stops calling itself), it recurses forever until Python raises a `RecursionError`. This is the single most common recursion bug.

## Classes — A First Look at Organizing Related Data and Behavior

A class is a template for creating objects that bundle data and the functions that operate on that data together:

```python
class Student:
    def __init__(self, name, marks):
        self.name = name        # self.name stores data ON this specific object
        self.marks = marks

    def average(self):
        return sum(self.marks) / len(self.marks)

    def grade(self):
        avg = self.average()
        if avg >= 90:
            return "A"
        elif avg >= 75:
            return "B"
        else:
            return "C"

# Creating objects (instances) from the class
s1 = Student("Priya", [95, 88, 92])
s2 = Student("Rahul", [70, 65, 80])

print(s1.name, s1.average(), s1.grade())   # Priya 91.67 A
print(s2.name, s2.average(), s2.grade())   # Rahul 71.67 C
```

`self` refers to the specific object the method is being called on — `s1.average()` uses `s1`'s own `marks`, and `s2.average()` uses `s2`'s, even though both were created from the exact same class.

## Next Steps

Move to **Advanced** for implementing a stack data structure, working with modules, and combining recursion with searching/sorting — the topics that come up most in CBSE Class 12 practicals and board exams.
