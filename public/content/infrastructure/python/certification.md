# Python Certification Guide

## Certifications Available

| Cert | Full Name | Level | Format |
|------|-----------|-------|--------|
| **PCEP** | Certified Entry-Level Python Programmer | Beginner | MCQ, 45 min |
| **PCAP** | Certified Associate in Python Programming | Intermediate | MCQ, 65 min |
| **PCPP** | Certified Professional in Python | Advanced | MCQ, 65 min |
| **Google IT Automation with Python** | Coursera Certificate | Intro | Projects |

Python also heavily tested in: AWS DevOps, Lambda development, data engineering certs.

---

## PCAP Exam Topics

```python
# ─── CORE PYTHON (must know) ──────────────────────────────────────────────────
# Data types and operators
x = 42          # int
y = 3.14        # float
s = "hello"     # str (immutable)
b = True        # bool
n = None        # NoneType

# String methods (frequently tested)
s = "  Hello, World!  "
s.strip()           # "Hello, World!"
s.lower()           # "  hello, world!  "
s.split(", ")       # ["  Hello", "World!  "]
s.replace("World", "Python")
",".join(["a", "b", "c"])   # "a,b,c"
f"Hello {name}!"    # f-string (preferred over .format())
"Hello {name}!".format(name="Alice")

# Lists, tuples, dicts, sets
lst = [1, 2, 3]
lst.append(4)           # [1,2,3,4]
lst.extend([5,6])       # [1,2,3,4,5,6]
lst.insert(0, 0)        # insert at index
lst.pop()               # Remove and return last
lst.sort(reverse=True)
lst[1:3]                # slice [2,3]
lst[::-1]               # reverse

tup = (1, 2, 3)         # Immutable list
a, b, c = tup           # Unpacking

d = {"key": "value"}
d["new_key"] = 123
d.get("missing", "default")   # Safe get
d.items() / .keys() / .values()
{k: v for k, v in d.items() if v > 0}  # Dict comprehension

s = {1, 2, 3}
s.add(4) / s.remove(2) / s.discard(99)  # discard doesn't error if missing
s1 | s2   # Union | s1 & s2  Intersection | s1 - s2  Difference
```

```python
# ─── OOP (core PCAP topic) ────────────────────────────────────────────────────
class Animal:
    species_count = 0           # Class variable (shared)

    def __init__(self, name, sound):
        self.name = name        # Instance variable
        self.sound = sound
        Animal.species_count += 1

    def speak(self):            # Instance method
        return f"{self.name} says {self.sound}"

    @classmethod
    def get_count(cls):         # Class method
        return cls.species_count

    @staticmethod
    def is_animal():            # Static method (no self/cls)
        return True

    def __str__(self):          # String representation
        return f"Animal({self.name})"

    def __repr__(self):         # Developer representation
        return f"Animal(name={self.name!r}, sound={self.sound!r})"

class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name, "Woof")   # Call parent __init__
        self.breed = breed

    def speak(self):            # Override parent method
        return f"{self.name} barks!"

# Special/dunder methods
class Vector:
    def __init__(self, x, y): self.x, self.y = x, y
    def __add__(self, other): return Vector(self.x + other.x, self.y + other.y)
    def __len__(self): return 2
    def __getitem__(self, idx): return (self.x, self.y)[idx]
```

```python
# ─── ERROR HANDLING ────────────────────────────────────────────────────────────
try:
    result = 10 / int(input())
except ZeroDivisionError:
    print("Cannot divide by zero")
except ValueError as e:
    print(f"Invalid input: {e}")
except (TypeError, AttributeError) as e:
    print(f"Type error: {e}")
else:
    print(f"Result: {result}")    # Only if no exception
finally:
    print("Always runs")

# Context managers
with open("file.txt", "r") as f:
    content = f.read()
# File auto-closed even if exception

# Custom exception
class AppError(Exception):
    def __init__(self, message, code):
        super().__init__(message)
        self.code = code
```

```python
# ─── MODULES & PACKAGES ────────────────────────────────────────────────────────
import os
import sys
from pathlib import Path
from typing import List, Dict, Optional, Union

# Standard library essentials
os.getcwd() / os.listdir() / os.makedirs() / os.environ.get()
sys.argv / sys.exit() / sys.path
Path("file.txt").read_text() / .write_text() / .exists() / .suffix

import json
json.dumps({"key": "value"}, indent=2)
json.loads('{"key": "value"}')

import re
re.search(r"\d+", "abc123")    # Find first match
re.findall(r"\d+", "a1b2c3")  # All matches → ['1','2','3']
re.sub(r"\s+", " ", text)      # Replace pattern

from datetime import datetime, timedelta
datetime.now() / datetime.utcnow()
datetime.strptime("2024-01-15", "%Y-%m-%d")
datetime.now() + timedelta(days=7)
```

---

## DevOps-Relevant Python (Beyond Certs)

```python
import boto3           # AWS SDK
import requests        # HTTP
import paramiko        # SSH
import subprocess      # System commands
import yaml            # YAML parsing (pip install pyyaml)

# Run shell command safely
result = subprocess.run(
    ["kubectl", "get", "pods", "-n", "production"],
    capture_output=True, text=True, check=True
)
print(result.stdout)

# AWS S3 example
s3 = boto3.client('s3', region_name='us-east-1')
s3.upload_file('local.txt', 'my-bucket', 'remote.txt')
s3.download_file('my-bucket', 'remote.txt', 'local.txt')
response = s3.list_objects_v2(Bucket='my-bucket', Prefix='data/')
```

## Revision Notes
```
PCAP EXAM: 40 questions, 65 minutes, 70% pass, ~$295

HIGHEST-TESTED TOPICS:
  String methods: strip/split/join/replace/format/f-strings
  List: append/extend/insert/pop/sort/slice/comprehension
  Dict: get/items/keys/values/comprehension
  OOP: __init__, inheritance, super(), special methods
  Exceptions: try/except/else/finally, custom exceptions
  Modules: import, from-import, __name__ == "__main__"
  File I/O: open/read/write, with statement (context manager)

OOP SPECIAL METHODS (dunder):
  __init__ | __str__ | __repr__ | __len__ | __getitem__
  __add__ | __eq__ | __lt__ | __enter__/__exit__ (context manager)

SCOPE: LEGB rule — Local, Enclosing, Global, Built-in
  global keyword: modify global from function
  nonlocal keyword: modify enclosing scope from nested function
```
