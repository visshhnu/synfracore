# Python — Fundamentals

## Python Overview

Python is a high-level, interpreted, dynamically typed programming language. Named after "Monty Python's Flying Circus" (not the snake). Created by Guido Van Rossum, first released in 1991.

**Which Python to learn?**
- **Python for DevOps** (this path) — boto3, subprocess, Kubernetes SDK, automation scripts
- **Python for Data/MIS** — Pandas, Excel automation, data cleaning, reports → see Data Academy
- **Both start here** — these fundamentals are the common foundation for all Python paths

## Identifiers — Naming Rules

From Durga Software Solutions course:

```python
# Rules for Python identifiers (variable/function/class names):
# 1. Alphabet symbols only (upper or lower case)
# 2. If identifier starts with _ → indicates it is private
# 3. Cannot start with a digit
# 4. Case sensitive (name ≠ Name ≠ NAME)
# 5. Cannot use reserved keywords (if, for, def, class, etc.)
# 6. No length limit (but keep them short and meaningful)
# 7. Dollar ($) symbol is NOT allowed

# Valid identifiers:
total123 = 10      # ✅
java2share = "hi"  # ✅
_abc_abc_ = True   # ✅ (private by convention)
__init__ = None    # ✅ magic method (language defined)

# Invalid identifiers:
# 123total = 10    # ❌ starts with digit
# ca$h = 100       # ❌ dollar sign not allowed
# def = "hello"    # ❌ reserved keyword
# if = True        # ❌ reserved keyword

# Special naming conventions:
# _name    → private variable (single underscore)
# __name   → strongly private (double underscore = name mangling)
# __name__ → magic method (double underscore both sides)
# Eg: __add__, __init__, __str__
```

## Data Types

Python provides the following fundamental data types:

```python
# Numeric types
a = 10          # int
b = 10.5        # float
c = 10 + 2j     # complex (j = imaginary unit)

# Boolean
flag = True
done = False
print(type(flag))  # <class 'bool'>

# String (str)
s1 = "Hello"
s2 = 'World'
s3 = """Multi
line string"""

# None
result = None   # absence of value

# Check type
print(type(10))     # <class 'int'>
print(type(10.5))   # <class 'float'>
print(type("hi"))   # <class 'str'>
```

### Number Literal Forms

```python
# Decimal (default)
a = 10
b = 123456

# Binary (prefix 0b or 0B)
b1 = 0b1111    # = 15
b2 = 0B10      # = 2

# Octal (prefix 0o or 0O) — Base-8, digits 0 to 7
o1 = 0o123     # = 83
o2 = 0O786     # ERROR! 8 and 9 not allowed in octal

# Hexadecimal (prefix 0x or 0X) — Base-16
h1 = 0xFACE    # valid
h2 = 0XBeef    # valid
h3 = 0XBeer    # ERROR! 'r' not a hex digit

# PVM always displays in decimal form:
a = 10; b = 0b010; c = 0X10; d = 0B10
print(a, b, c, d)   # 10 2 16 2

# Base conversion functions:
print(bin(15))   # '0b1111'
print(oct(15))   # '0o17'
print(hex(15))   # '0xf'
print(bin(0o11)) # '0b1001'
```

## Operators

Python provides 6 types of operators:

```python
# 1. Arithmetic Operators
a = 10
b = 2
print('a+b=',  a+b)    # 12   Addition
print('a-b=',  a-b)    # 8    Subtraction
print('a*b=',  a*b)    # 20   Multiplication
print('a/b=',  a/b)    # 5.0  Division (always returns float)
print('a//b=', a//b)   # 5    Floor Division (drops decimal)
print('a%b=',  a%b)    # 0    Modulo (remainder)
print('a**b=', a**b)   # 100  Exponent (Power)

# 2. Relational/Comparison Operators
print(10 > 20)   # False
print(10 < 20)   # True
print(10 >= 10)  # True
print(10 == 20)  # False
print(10 != 20)  # True

# 3. Logical Operators
print(True and False)   # False
print(True or False)    # True
print(not True)         # False

# 4. Assignment Operators
x = 10
x += 5   # x = x + 5 = 15
x -= 3   # x = x - 3 = 12
x *= 2   # x = x * 2 = 24
x //= 5  # x = x // 5 = 4
x **= 3  # x = x ** 3 = 64

# 5. Bitwise Operators
print(4 & 5)    # 4  (AND)
print(4 | 5)    # 5  (OR)
print(4 ^ 5)    # 1  (XOR)
print(~4)       # -5 (bitwise NOT)
print(2 << 2)   # 8  (left shift)
print(8 >> 2)   # 2  (right shift)

# 6. Special Operators
# Identity operators
a = [1,2,3]
b = [1,2,3]
c = a
print(a is b)    # False (different objects)
print(a is c)    # True  (same object)
print(a is not b) # True

# Membership operators
fruits = ['apple', 'banana', 'cherry']
print('apple' in fruits)     # True
print('mango' not in fruits) # True
```

## Strings — Most Important Data Type

```python
# String definition
s = "Hello World"
s2 = 'Python'

# Indexing (0-based)
print(s[0])    # H  (first)
print(s[-1])   # d  (last, negative index from end)
print(s[6])    # W

# Slicing: s[start:stop:step]
print(s[0:5])    # Hello
print(s[6:])     # World
print(s[:5])     # Hello
print(s[::2])    # HloWrd (every 2nd char)
print(s[::-1])   # dlroW olleH (reversed!)

# String immutable — cannot change characters
# s[0] = 'h'  # TypeError!

# String functions
print(len(s))            # 11
print(s.upper())         # HELLO WORLD
print(s.lower())         # hello world
print(s.title())         # Hello World
print(s.count('l'))      # 3
print(s.replace('l','L')) # HeLLo WorLd
print(s.split(' '))      # ['Hello', 'World']
print('  hello  '.strip()) # 'hello'
print(s.find('World'))   # 6 (index where found, -1 if not)
print(s.startswith('Hello')) # True
print(s.endswith('World'))   # True

# String formatting
name = "Durga"
marks = 90
print(f"Hi {name}, Your Marks are: {marks}")        # f-string (Python 3.6+)
print("Hi {}, Your Marks are: {}".format(name, marks))  # .format()
print("Hi %s, Your Marks are: %d" % (name, marks))  # % formatting

# String concatenation
s1 = "Hello"
s2 = "World"
s3 = s1 + " " + s2    # Hello World
s4 = s1 * 3            # HelloHelloHello
```

## Lists — Ordered, Mutable Collection

```python
# Create
nums = [10, 20, 30, 40, 50]
mixed = [1, "hello", 3.14, True, None]
nested = [[1,2], [3,4], [5,6]]

# Access
print(nums[0])    # 10
print(nums[-1])   # 50
print(nums[1:4])  # [20, 30, 40]

# Modify (lists are mutable)
nums[0] = 100
nums.append(60)       # add to end
nums.insert(1, 15)    # insert at index 1
nums.remove(30)       # remove first occurrence
popped = nums.pop()   # remove and return last
popped = nums.pop(0)  # remove and return at index 0
nums.sort()           # sort in place
nums.reverse()        # reverse in place
nums.extend([70, 80]) # add multiple elements
nums.clear()          # remove all

# Useful functions
print(len(nums))      # length
print(min(nums))      # minimum
print(max(nums))      # maximum
print(sum(nums))      # sum
print(nums.count(20)) # count occurrences
print(nums.index(20)) # index of first occurrence

# List comprehensions — powerful Python feature
squares = [x**2 for x in range(1, 11)]
# [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

evens = [x for x in range(1, 21) if x % 2 == 0]
# [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# From the Durga course:
num1 = [10, 20, 30, 40, 50]
num2 = [30, 40, 50, 60, 70]
# Common elements using comprehension:
num4 = [i for i in num1 if i in num2]
print(num4)  # [30, 40, 50]

# Word processing with list comprehension:
words = "the quick brown fox jumps over the lazy dog".split()
l = [[w.upper(), len(w)] for w in words]
# [['THE', 3], ['QUICK', 5], ['BROWN', 5], ...]
```

## Tuples — Ordered, Immutable Collection

```python
# Tuples are like lists but CANNOT be modified after creation
t = (10, 20, 30, 40)
t2 = (1,)        # single element tuple needs trailing comma
t3 = 1, 2, 3     # parentheses optional

# Access (same as list)
print(t[0])      # 10
print(t[-1])     # 40
print(t[1:3])    # (20, 30)

# Tuple unpacking
a, b, c, d = t
print(a, b, c, d)  # 10 20 30 40

# Cannot modify
# t[0] = 100  # TypeError: tuple object does not support item assignment

# When to use tuple vs list:
# Tuple — fixed data that should not change (coordinates, RGB colors, DB rows)
# List — data that will be modified (shopping cart, to-do items)
```

## Dictionaries — Key-Value Pairs

```python
# Create
student = {"name": "Durga", "marks": 90, "grade": "A"}
empty = {}

# Access
print(student["name"])          # Durga
print(student.get("marks"))     # 90
print(student.get("age", 0))    # 0 (default if key missing)

# Modify
student["marks"] = 95           # update
student["email"] = "d@test.com" # add new key

# Delete
del student["grade"]
popped = student.pop("email")   # remove and return

# Iterate
for key in student:
    print(key, ":", student[key])

for key, value in student.items():
    print(f"{key} = {value}")

print(student.keys())    # dict_keys(['name', 'marks'])
print(student.values())  # dict_values(['Durga', 95])
print(student.items())   # dict_items([('name','Durga'), ('marks',95)])

# Character frequency count (Durga course Q10):
s = input("Enter Some String: ")   # "ABCABCABBCDE"
d = {}
for x in s:
    if x in d.keys():
        d[x] = d[x] + 1
    else:
        d[x] = 1
for k, v in d.items():
    print("{} = {} Times".format(k, v))
# Output: A = 3 Times, B = 4 Times, C = 3 Times, D = 1 Times, E = 1 Times
```

## Sets — Unique Elements, Unordered

```python
s = {10, 20, 30, 40, 10, 20}  # duplicates removed
print(s)  # {40, 10, 20, 30}  — order not guaranteed

s.add(50)
s.remove(20)
s.discard(99)   # doesn't raise error if not found

s1 = {1, 2, 3, 4}
s2 = {3, 4, 5, 6}
print(s1 | s2)   # {1,2,3,4,5,6}  union
print(s1 & s2)   # {3,4}           intersection
print(s1 - s2)   # {1,2}           difference
print(s1 ^ s2)   # {1,2,5,6}       symmetric difference
```

## Control Flow

```python
# if-elif-else
marks = int(input("Enter marks: "))
if marks >= 60:
    print("You got First Grade")
elif marks >= 50:
    print("You got Second Grade")
elif marks >= 35:
    print("You got Third Grade")
else:
    print("You are Failed")

# for loop
for i in range(10):        # 0 to 9
    print(i, end=" ")

for i in range(1, 11, 2):  # 1,3,5,7,9 (step=2)
    print(i)

for fruit in ["apple", "banana", "cherry"]:
    print(fruit)

# while loop
i = 1
while i <= 10:
    print(i)
    i += 1

# break and continue
for i in range(1, 11):
    if i == 5:
        break      # exit loop
    print(i)       # prints 1 2 3 4

for i in range(1, 11):
    if i % 2 == 0:
        continue   # skip even numbers
    print(i)       # prints 1 3 5 7 9
```

## Functions

```python
# Basic function
def greet(name):
    print(f"Hello, {name}!")

greet("Durga")    # Hello, Durga!

# Function with return
def add(a, b):
    return a + b

result = add(10, 20)   # 30

# Default arguments
def wish(name="Guest", msg="Good Morning"):
    print(f"Hello {name} {msg}")

wish("Durga")            # Hello Durga Good Morning
wish("Durga", "Good Evening")  # Hello Durga Good Evening
wish()                   # Hello Guest Good Morning

# Rules: default arguments must come AFTER non-default arguments
# def wish(name="Guest", msg):  # INVALID!
# def wish(msg, name="Guest"):  # valid

# Keyword arguments (order doesn't matter)
wish(msg="Good Evening", name="Ravi")  # Hello Ravi Good Evening

# Variable length arguments (*args)
def f1(*n):
    print(type(n))   # <class 'tuple'>
    for x in n:
        print(x)

f1(10)               # works
f1(10, 20, 30, 40)   # works with any number of args

# Variable keyword arguments (**kwargs)
def display(**details):
    for k, v in details.items():
        print(f"{k} = {v}")

display(name="Durga", rollno=101, marks=90)
# name = Durga
# rollno = 101
# marks = 90

# Lambda (anonymous function)
square = lambda x: x ** 2
print(square(5))    # 25

add = lambda a, b: a + b
print(add(10, 20))  # 30

# With sorted/filter/map
nums = [3, 1, 4, 1, 5, 9, 2, 6]
sorted_nums = sorted(nums, key=lambda x: -x)  # reverse sort
evens = list(filter(lambda x: x % 2 == 0, nums))
squares = list(map(lambda x: x**2, nums))
```

## Classes and OOP

```python
# Class definition
class Student:
    # Class variable (shared across all instances)
    school = "Durga Classes"

    # Constructor
    def __init__(self, name, marks):
        # Instance variables (unique per object)
        self.name = name
        self.marks = marks

    # Instance methods
    def display(self):
        print(f"Hi {self.name}")
        print(f"Your Marks are: {self.marks}")

    def grade(self):
        if self.marks >= 60:
            print("You got First Grade")
        elif self.marks >= 50:
            print("You got Second Grade")
        elif self.marks >= 35:
            print("You got Third Grade")
        else:
            print("You are Failed")

# Create objects
n = int(input("Enter number of students: "))
for i in range(n):
    name = input("Enter Name: ")
    marks = int(input("Enter Marks: "))
    s = Student(name, marks)
    s.display()
    s.grade()
    print()

# Output:
# Enter number of students: 2
# Enter Name: Durga
# Enter Marks: 90
# Hi Durga
# Your Marks are: 90
# You got First Grade
#
# Enter Name: Ravi
# Enter Marks: 12
# Hi Ravi
# Your Marks are: 12
# You are Failed
```

### Setter and Getter Methods

```python
class Employee:
    def __init__(self, name, salary):
        self._name = name      # _name → private by convention
        self._salary = salary

    # Getter method — read the value
    def getName(self):
        return self._name

    def getSalary(self):
        return self._salary

    # Setter method (mutator) — set the value
    def setName(self, name):
        self._name = name

    def setSalary(self, salary):
        if salary > 0:         # validation in setter
            self._salary = salary
        else:
            print("Invalid salary")

emp = Employee("Alice", 75000)
print(emp.getName())    # Alice
print(emp.getSalary())  # 75000
emp.setSalary(85000)
print(emp.getSalary())  # 85000
```

### Inheritance — Types

```python
# Single inheritance
class Animal:
    def eat(self):
        print("Animal is eating")

class Dog(Animal):
    def bark(self):
        print("Dog is barking")

d = Dog()
d.eat()    # inherited from Animal
d.bark()   # Dog's own method

# Multi-level inheritance: P → C → CC
class P:
    def m1(self): print("Parent Method")

class C(P):
    def m2(self): print("Child Method")

class CC(C):
    def m3(self): print("Sub Child Method")

c = CC()
c.m1()   # Parent Method
c.m2()   # Child Method
c.m3()   # Sub Child Method

# Multiple inheritance (Python supports, Java does not)
class Father:
    def skills(self): print("Farming, Coding")

class Mother:
    def skills(self): print("Cooking, Coding")

class Child(Father, Mother):
    def skills(self):
        Father.skills(self)   # call specific parent
        Mother.skills(self)

c = Child()
c.skills()
# Farming, Coding
# Cooking, Coding
```

## OS Module — File System Operations

```python
import os

# Current working directory
print(os.getcwd())    # D:\Python_classes

# List directory contents (no sub-directories)
print(os.listdir("."))
# ['abc.py', 'demo.py', 'test.py', 'newdir', ...]

# List INCLUDING sub-directories (os.walk)
for dirpath, dirnames, filenames in os.walk('.'):
    print("Current Directory Path:", dirpath)
    print("Directories:", dirnames)
    print("Files:", filenames)
    print()
# Output shows all directories and files recursively

# os.walk parameters:
# path      → start directory
# topdown   → True = top to bottom (default)
# onerror   → function to call on error
# followlinks → True = visit symbolic link directories

# Create directory
os.mkdir("newdir")           # create single directory
os.makedirs("a/b/c")        # create nested directories

# Rename and remove
os.rename("oldname.txt", "newname.txt")
os.remove("file.txt")       # delete file
os.rmdir("emptydir")        # delete empty directory
```

## Next Steps

After these fundamentals, choose your Python path:

**For DevOps** → Go to **Intermediate** to learn: `subprocess`, `boto3` (AWS), Kubernetes SDK, `click` CLI tools, `requests` for REST APIs.

**For Data/MIS** → Go to the **Data Academy → Pandas** to learn: `pandas`, Excel automation, `groupby`, data cleaning, visualization with matplotlib.

**The foundation you just learned** (data types, functions, OOP, OS module) is used in BOTH paths.
