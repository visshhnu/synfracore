# Computer Science Basics — School-Level Programming with Python

**Before you start:** no prior programming experience is required — basic comfort with a computer (typing, running an application) is the only assumption.

This guide introduces programming for school students (Class 9-12, CBSE/ICSE). Python is the ideal first language — readable, powerful, and the same language used by Google, Instagram, and data scientists worldwide.

## Why This Exists (The Hook)

Every app on your phone, every website you visit, every game you play is a list of precise instructions a computer follows exactly, in order — nothing more mysterious than that. Programming exists to let you write those instructions yourself instead of only using instructions someone else wrote. The gap between "I use apps" and "I can build one" is smaller than it looks — the same `if`/`for`/function building blocks you'll learn here are what every app, from a calculator to a search engine, is ultimately built from.

**Analogy** — Think of learning to program like learning to write a recipe, not learning a foreign spell language. A recipe is a precise sequence of steps — "chop the onion, then heat the oil, then add the onion" — where the order matters and each step is unambiguous enough that anyone following it gets the same result. A Python program is the exact same idea: a precise, ordered sequence of steps ("get user input, then check a condition, then print a result") that the computer follows exactly as written, in order, every single time.

**Try it (2 minutes)** — Reason through why `if/elif/else` needs to check conditions in a specific top-to-bottom order, without looking anything up: in the grading example below, marks ≥ 90 is checked before marks ≥ 75. If you swapped the order — checking `marks >= 75` first — what would happen to a student who scored 95? Would they still correctly get "Grade A," or would the reordered code stop at the first condition that happens to be true and give the wrong grade?

## Python Basics

### Your First Program
```python
print("Hello, World!")
print("My name is:", "Priya")
print(2 + 3)           # Output: 5
print("Python" * 3)    # Output: PythonPythonPython
```

### Variables and Data Types
```python
# Variables store data
name = "Rahul"          # String (text)
age = 16                # Integer (whole number)
height = 5.8            # Float (decimal number)
is_student = True       # Boolean (True or False)

# Check the type
print(type(name))       # <class 'str'>
print(type(age))        # <class 'int'>

# String operations
first = "Hello"
second = "World"
print(first + " " + second)    # Hello World
print(len("Python"))           # 6
print("PYTHON".lower())        # python
print("  spaces  ".strip())    # spaces

# Number operations
print(10 / 3)    # 3.3333 (float division)
print(10 // 3)   # 3 (floor division)
print(10 % 3)    # 1 (remainder/modulus)
print(2 ** 10)   # 1024 (power)
```

### Input from User
```python
name = input("Enter your name: ")
age = int(input("Enter your age: "))  # Convert string to integer

print("Hello,", name)
print("You will be", age + 1, "next year")
```

### Conditions — Making Decisions
```python
marks = int(input("Enter your marks: "))

if marks >= 90:
    print("Grade A — Excellent!")
elif marks >= 75:
    print("Grade B — Good")
elif marks >= 60:
    print("Grade C — Average")
elif marks >= 35:
    print("Grade D — Pass")
else:
    print("Fail — Please work harder")

# Short form for simple conditions
status = "Adult" if age >= 18 else "Minor"
```

### Loops — Repeating Tasks
```python
# for loop — repeat a fixed number of times
for i in range(1, 6):
    print(i, end=" ")  # Output: 1 2 3 4 5

# Print multiplication table
n = int(input("Enter number: "))
for i in range(1, 11):
    print(f"{n} × {i} = {n * i}")

# while loop — repeat while condition is true
count = 1
while count <= 5:
    print(count)
    count = count + 1

# Loop with list
fruits = ["apple", "banana", "mango", "grapes"]
for fruit in fruits:
    print(fruit.upper())
```

### Lists — Storing Multiple Items
```python
marks = [85, 92, 78, 96, 88]

print(marks[0])         # 85 (first element)
print(marks[-1])        # 88 (last element)
print(marks[1:3])       # [92, 78] (slicing)

marks.append(95)        # Add to end
marks.insert(0, 99)     # Insert at position
marks.remove(78)        # Remove value
sorted_marks = sorted(marks)  # Sort

# Useful functions
print(len(marks))       # Length
print(sum(marks))       # Sum
print(max(marks))       # Maximum
print(min(marks))       # Minimum

# List comprehension (elegant way to create lists)
squares = [x**2 for x in range(1, 11)]
print(squares)  # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

even = [x for x in range(1, 21) if x % 2 == 0]
print(even)  # [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```

### Functions — Reusable Code Blocks
```python
def greet(name, greeting="Hello"):
    """Greet a person with a message."""
    print(f"{greeting}, {name}!")

greet("Priya")           # Hello, Priya!
greet("Raj", "Good morning")  # Good morning, Raj!

def calculate_bmi(weight, height):
    """Calculate BMI given weight (kg) and height (m)."""
    bmi = weight / (height ** 2)
    if bmi < 18.5:
        category = "Underweight"
    elif bmi < 25:
        category = "Normal"
    elif bmi < 30:
        category = "Overweight"
    else:
        category = "Obese"
    return round(bmi, 2), category

bmi, category = calculate_bmi(60, 1.65)
print(f"BMI: {bmi} — {category}")
```

## Common School Programs (Practice These)

```python
# 1. Fibonacci Series
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        print(a, end=" ")
        a, b = b, a + b

fibonacci(10)  # 0 1 1 2 3 5 8 13 21 34

# 2. Prime number check
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

for num in range(2, 50):
    if is_prime(num):
        print(num, end=" ")

# 3. Reverse a string
def reverse_string(s):
    return s[::-1]

print(reverse_string("Python"))  # nohtyP

# 4. Count vowels
def count_vowels(text):
    return sum(1 for char in text.lower() if char in "aeiou")

print(count_vowels("Hello World"))  # 3

# 5. Simple calculator
def calculator(a, op, b):
    operations = {"+": a+b, "-": a-b, "*": a*b, "/": a/b if b!=0 else "Error"}
    return operations.get(op, "Invalid operator")
```

## File Handling (CBSE Class 12 Syllabus)

```python
# Writing to a file
with open("students.txt", "w") as f:
    f.write("Name, Marks\n")
    f.write("Priya, 95\n")
    f.write("Raj, 88\n")

# Reading from a file
with open("students.txt", "r") as f:
    content = f.read()
    print(content)

# Reading line by line
with open("students.txt", "r") as f:
    for line in f:
        print(line.strip())

# CSV files (common in data science)
import csv
with open("data.csv", "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["Name"], row["Marks"])
```

## What to Learn Next

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "1. OOP", "sublabel": "Classes, objects, inheritance", "color": "blue" },
    { "label": "2. Data Structures", "sublabel": "Lists, tuples, dicts, sets in depth", "color": "purple" },
    { "label": "3. Libraries", "sublabel": "NumPy, Pandas, Matplotlib", "color": "amber" },
    { "label": "4. Practice Platforms", "sublabel": "HackerRank, CodeChef, LeetCode Easy", "color": "green" },
    { "label": "5. Real Projects", "sublabel": "Calculator, quiz game, data analysis", "color": "red" }
  ]
}
```

```
After mastering these basics:

1. Object-Oriented Programming (OOP)
   Classes, objects, inheritance — organise large programs

2. Data Structures
   Lists, tuples, dictionaries, sets in depth
   
3. Modules and Libraries
   NumPy (numbers), Pandas (data), Matplotlib (graphs)
   
4. Problem Solving on Competitive Platforms
   HackerRank, CodeChef, LeetCode — start with Easy problems
   
5. Build Real Projects
   Calculator, quiz game, simple website, data analysis
   
Career paths from here:
   → Software Engineering (web/mobile/systems)
   → Data Science / Machine Learning
   → DevOps / Cloud Engineering
   → Cybersecurity
   → AI Research
```
