# Java — Fundamentals

## Data Types and Variables

```java
// Primitive types (stored directly on stack)
int    count = 42;           // 32-bit integer (-2B to 2B), most common
long   bigNum = 9876543210L; // 64-bit (add L suffix)
double price  = 99.99;       // 64-bit decimal (default)
float  tax    = 0.18f;       // 32-bit decimal (add f suffix)
boolean isActive = true;     // true / false
char   grade  = 'A';         // Single character (Unicode)
byte   small  = 100;         // -128 to 127
short  medium = 30000;       // -32768 to 32767

// Reference types (stored as pointers to heap objects)
String name = "Alice";                    // Immutable
int[]  arr  = {1, 2, 3};                 // Array
List<String> list = new ArrayList<>();    // Collection

// Constants
final double PI = 3.14159;              // Cannot be reassigned
```

## Control Flow

```java
// If-else
int score = 85;
if (score >= 90)      System.out.println("A");
else if (score >= 80) System.out.println("B");
else                  System.out.println("C");

// Ternary
String result = score >= 60 ? "Pass" : "Fail";

// Switch expression (Java 14+) — preferred
String grade = switch (score / 10) {
    case 10, 9 -> "A";
    case 8     -> "B";
    case 7     -> "C";
    default    -> "F";
};

// For loop
for (int i = 0; i < 5; i++) System.out.println(i);

// Enhanced for (for-each)
String[] fruits = {"apple", "banana", "cherry"};
for (String fruit : fruits) System.out.println(fruit);

// While
int n = 10;
while (n > 0) { System.out.print(n + " "); n -= 3; }

// break and continue
for (int i = 0; i < 10; i++) {
    if (i == 5) break;       // Exit loop entirely
    if (i % 2 == 0) continue; // Skip even numbers
    System.out.println(i);   // Prints: 1, 3
}
```

## Methods

```java
public class Calculator {
    // Instance method
    public int add(int a, int b) {
        return a + b;
    }

    // Static method — call without creating object
    public static double circleArea(double radius) {
        return Math.PI * radius * radius;
    }

    // Method overloading — same name, different parameters
    public int multiply(int a, int b) { return a * b; }
    public double multiply(double a, double b) { return a * b; }
    public int multiply(int a, int b, int c) { return a * b * c; }

    // Varargs — variable number of args
    public int sum(int... numbers) {
        int total = 0;
        for (int n : numbers) total += n;
        return total;
    }
}

// Usage
Calculator calc = new Calculator();
System.out.println(calc.add(3, 4));         // 7
System.out.println(Calculator.circleArea(5)); // 78.53...
System.out.println(calc.sum(1, 2, 3, 4, 5)); // 15
```

## Object-Oriented Programming Basics

```java
// Class with encapsulation
public class Student {
    private String name;    // private = only accessible within class
    private int age;
    private double cgpa;

    // Constructor
    public Student(String name, int age, double cgpa) {
        this.name = name;   // "this" distinguishes field from parameter
        this.age  = age;
        this.cgpa = cgpa;
    }

    // Getters and Setters
    public String getName() { return name; }
    public int    getAge()  { return age; }
    public double getCgpa() { return cgpa; }

    public void setCgpa(double cgpa) {
        if (cgpa < 0 || cgpa > 10)
            throw new IllegalArgumentException("CGPA must be 0-10");
        this.cgpa = cgpa;
    }

    // Override toString for readable output
    @Override
    public String toString() {
        return String.format("Student{name='%s', age=%d, cgpa=%.2f}",
                             name, age, cgpa);
    }
}

// Usage
Student s = new Student("Alice", 20, 8.5);
System.out.println(s);           // Student{name='Alice', age=20, cgpa=8.50}
s.setCgpa(9.0);
System.out.println(s.getCgpa()); // 9.0
```
