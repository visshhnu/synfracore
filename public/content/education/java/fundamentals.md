# Java — Fundamentals

## Java Program Structure

Every Java program has one class with a `main` method. The JVM starts execution from `main`.

```java
// HelloWorld.java  ← filename must match class name exactly
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

```bash
javac HelloWorld.java   # Compile → creates HelloWorld.class (bytecode)
java HelloWorld         # Run (JVM executes the bytecode)
```

**Important rules (from real engineer notes):**
- File name MUST match the public class name — `HelloWorld.java` contains `class HelloWorld`
- `main` must always take `String[] args` (args[0], args[1] etc. are command-line inputs)
- Each statement ends with `;`
- Java is case-sensitive — `String` and `string` are different

## Data Types

```java
// Primitive types
int    age  = 25;           // 4 bytes, range: -2,147,483,648 to 2,147,483,647
long   big  = 9876543210L;  // 8 bytes — use 'L' suffix
double pi   = 3.14159;      // 8 bytes, decimal
float  temp = 98.6f;        // 4 bytes — use 'f' suffix
char   ch   = 'A';          // single character in single quotes
boolean flag = true;        // true or false only
byte   b    = 127;          // 1 byte, range: -128 to 127
short  s    = 32000;        // 2 bytes

// Reference types
String name = "Alice";      // String is a class, not primitive
int[]  arr  = {1, 2, 3};   // arrays
```

## Control Flow

```java
// if-else
int salary = 50000;
if (salary > 100000) {
    System.out.println("High salary");
} else if (salary > 50000) {
    System.out.println("Medium salary");
} else {
    System.out.println("Entry level");
}

// for loop
for (int i = 0; i < 10; i++) {
    System.out.println("Value of i = " + i);
}

// while loop
int count = 0;
while (count < 5) {
    count++;
}

// Enhanced for loop (for-each)
int[] numbers = {10, 20, 30, 40};
for (int n : numbers) {
    System.out.println(n);
}

// switch
int day = 2;
switch (day) {
    case 1: System.out.println("Monday"); break;
    case 2: System.out.println("Tuesday"); break;
    default: System.out.println("Other day");
}
```

## Methods

```java
public class Calculator {
    // Method with return type
    public int add(int a, int b) {
        return a + b;
    }

    // void method — no return value
    public void printMessage(String msg) {
        System.out.println(msg);
    }

    // Static method — called without creating an object
    public static int multiply(int a, int b) {
        return a * b;
    }

    public static void main(String[] args) {
        Calculator calc = new Calculator();      // create object
        int sum = calc.add(10, 20);             // call instance method
        calc.printMessage("Sum is: " + sum);

        int product = Calculator.multiply(5, 6); // call static method
        System.out.println("Product: " + product);
    }
}
```

## Object-Oriented Programming (OOP)

### Classes and Objects

```java
// Class = blueprint, Object = instance
class Employee {
    // Instance variables (attributes)
    private String name;
    private int empId;
    private double salary;

    // Constructor — called when object is created
    public Employee(String name, int empId, double salary) {
        this.name   = name;      // 'this' refers to current object
        this.empId  = empId;
        this.salary = salary;
    }

    // Getter methods
    public String getName()   { return name; }
    public int    getEmpId()  { return empId; }
    public double getSalary() { return salary; }

    // Setter method
    public void setSalary(double salary) {
        if (salary > 0) {        // validation
            this.salary = salary;
        }
    }

    // Instance method
    public void displayInfo() {
        System.out.println("Employee: " + name + " | ID: " + empId + " | Salary: " + salary);
    }
}

public class Main {
    public static void main(String[] args) {
        Employee e1 = new Employee("Alice", 101, 75000);
        Employee e2 = new Employee("Bob", 102, 85000);

        e1.displayInfo();
        e2.displayInfo();
        e1.setSalary(80000);    // update salary
        System.out.println(e1.getSalary());
    }
}
```

## Access Specifiers

From the original notes — the Access Specifier Protection Matrix:

| Access Modifier | Same Class | Same Package (Sub) | Same Package (Non-Sub) | Different Package (Sub) | Different Package (Non-Sub) |
|---|---|---|---|---|---|
| **private**   | ✅ | ❌ | ❌ | ❌ | ❌ |
| **default**   | ✅ | ✅ | ✅ | ❌ | ❌ |
| **protected** | ✅ | ✅ | ✅ | ✅ | ❌ |
| **public**    | ✅ | ✅ | ✅ | ✅ | ✅ |

Key rule: use `private` for all fields, `public` for getters/setters. This is **encapsulation**.

## String Class

```java
String s1 = "Hello";
String s2 = "World";

// Common methods
System.out.println(s1.length());           // 5
System.out.println(s1.toUpperCase());      // HELLO
System.out.println(s1.toLowerCase());      // hello
System.out.println(s1.charAt(0));          // H
System.out.println(s1.contains("ell"));   // true
System.out.println(s1.replace("H","J"));  // Jello
System.out.println(s1 + " " + s2);        // Hello World (concatenation)
System.out.println(s1.equals(s2));        // false
System.out.println(s1.substring(1, 4));   // ell (index 1 to 3)

// String comparison — ALWAYS use .equals(), never ==
String a = new String("test");
String b = new String("test");
System.out.println(a == b);       // false (compares references)
System.out.println(a.equals(b)); // true  (compares content)
```

## Arrays

```java
// Declare and initialize
int[] scores = new int[5];         // creates array of 5 zeros
int[] marks  = {90, 85, 78, 92, 88};  // initialize with values

// Access elements (0-indexed)
System.out.println(marks[0]);   // 90
System.out.println(marks.length); // 5

// Iterate
for (int i = 0; i < marks.length; i++) {
    System.out.println("marks[" + i + "] = " + marks[i]);
}

// 2D array
int[][] matrix = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
System.out.println(matrix[1][2]);  // 6 (row 1, col 2)
```

## Packages and Imports

Packages are namespaces that organize related classes.

```java
// Creating a package (first line of file)
package com.mycompany.util;

public class MathUtils {
    public static int square(int n) { return n * n; }
}
```

```java
// Using a package
import com.mycompany.util.MathUtils;     // import specific class
import java.util.*;                       // import all classes in java.util
import static java.lang.Math.PI;         // static import — use PI directly

public class Main {
    public static void main(String[] args) {
        System.out.println(MathUtils.square(5));   // 25
        System.out.println(PI);                    // 3.14159...
    }
}
```

**Static Import (added in JDK 1.5):**
- Eliminates redundant referencing of class names before static data members
- Before: `System.out.println(Math.PI)` → After: `println(PI)` (after static import)

## The Java Development Environment

```bash
# Check Java version
java -version
javac -version

# Compile
javac MyProgram.java       # creates MyProgram.class

# Run
java MyProgram             # do NOT include .class extension

# Compile with classpath
javac -cp . MyProgram.java

# JAR file (archive of .class files)
jar cf myapp.jar *.class
java -jar myapp.jar
```

## Next Steps

Move to **Intermediate** to learn: Inheritance, Polymorphism, Interfaces, Abstract Classes, Exception Handling, and Collections Framework.
