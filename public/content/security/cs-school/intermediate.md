# CS for Schools — Intermediate

## Functions and Modular Programming
```python
# Define a function
def greet(name):
    message = "Hello, " + name + "!"
    return message

# Call a function
result = greet("Alice")
print(result)  # Hello, Alice!

# Default parameters
def power(base, exponent=2):
    return base ** exponent

print(power(3))     # 9 (3²)
print(power(3, 3))  # 27 (3³)
```

## Lists and Arrays
```python
fruits = ["apple", "banana", "cherry"]
print(fruits[0])        # apple
fruits.append("date")   # add to end
fruits.remove("banana") # remove by value
print(len(fruits))      # 3

# List comprehension
squares = [x**2 for x in range(1, 6)]  # [1, 4, 9, 16, 25]
```

## Sorting and Searching
- **Linear Search**: Check each element; O(n)
- **Binary Search**: Sorted array, halve search space each step; O(log n)
- **Bubble Sort**: Compare adjacent, swap if out of order; O(n²)
- **Selection Sort**: Find minimum, place at front; O(n²)
- **Insertion Sort**: Insert each element in correct position; O(n²) worst, O(n) best

## Databases
- **Database**: Organized collection of structured data
- **Table**: Rows and columns (like a spreadsheet)
- **Primary key**: Unique identifier for each row
- **SQL basics**:
```sql
SELECT name, age FROM students WHERE age > 15;
INSERT INTO students VALUES (101, 'Alice', 16);
UPDATE students SET age = 17 WHERE name = 'Alice';
DELETE FROM students WHERE name = 'Alice';
```

## Object-Oriented Programming (OOP)
```python
class Animal:
    def __init__(self, name, species):
        self.name = name
        self.species = species

    def speak(self):
        return f"{self.name} makes a sound"

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"

dog = Dog("Rex", "Canine")
print(dog.speak())  # Rex says Woof!
```

**OOP Concepts:**
- **Class**: Blueprint for objects
- **Object**: Instance of a class
- **Inheritance**: Child class inherits from parent class
- **Encapsulation**: Data and methods bundled together
- **Polymorphism**: Same interface, different implementations

## Binary and Data Representation
- **Bit**: 0 or 1; **Byte**: 8 bits
- **ASCII**: 7-bit encoding for English characters
- **Unicode**: 16/32-bit encoding for all world characters
- **Compression**: Lossless (ZIP, PNG) vs Lossy (JPEG, MP3)
- **Encryption**: Caesar cipher, XOR cipher, RSA basics
