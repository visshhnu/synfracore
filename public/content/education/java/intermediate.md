# Java — Intermediate

## Inheritance

```java
// Base class (parent / superclass)
class Animal {
    String name;
    int age;

    Animal(String name, int age) {
        this.name = name;
        this.age  = age;
    }

    void eat() {
        System.out.println(name + " is eating");
    }

    void makeSound() {
        System.out.println("Some generic sound");
    }
}

// Derived class (child / subclass)
class Dog extends Animal {
    String breed;

    Dog(String name, int age, String breed) {
        super(name, age);   // call parent constructor FIRST
        this.breed = breed;
    }

    @Override
    void makeSound() {      // method overriding
        System.out.println(name + " says: Woof!");
    }

    void fetch() {
        System.out.println(name + " fetches the ball");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog d = new Dog("Bruno", 3, "Labrador");
        d.eat();        // inherited from Animal
        d.makeSound();  // overridden — prints "Bruno says: Woof!"
        d.fetch();      // Dog-specific
    }
}
```

## Polymorphism

**Runtime Polymorphism (Dynamic Method Dispatch):**

```java
class Shape {
    void draw() { System.out.println("Drawing a shape"); }
}

class Circle extends Shape {
    @Override
    void draw() { System.out.println("Drawing a circle"); }
}

class Rectangle extends Shape {
    @Override
    void draw() { System.out.println("Drawing a rectangle"); }
}

public class Main {
    public static void main(String[] args) {
        // Parent reference pointing to child object
        Shape s1 = new Circle();        // valid: IS-A relationship
        Shape s2 = new Rectangle();

        s1.draw();   // "Drawing a circle"    — determined at RUNTIME
        s2.draw();   // "Drawing a rectangle" — this is polymorphism

        // Array of shapes
        Shape[] shapes = { new Circle(), new Rectangle(), new Circle() };
        for (Shape s : shapes) {
            s.draw();   // each calls its own version
        }
    }
}
```

**Super-Sub Relationship rules (from notes):**
- Base class object reference can hold derived class object: `Shape s = new Circle()` ✅
- Derived class reference CANNOT hold base class object: `Circle c = new Shape()` ❌
- To access derived class specific methods via parent reference — use `instanceof` + casting

## Abstract Classes and Interfaces

```java
// Abstract class — cannot be instantiated, can have abstract + concrete methods
abstract class Vehicle {
    String brand;

    Vehicle(String brand) { this.brand = brand; }

    // Abstract method — no body, MUST be implemented by subclass
    abstract void start();

    // Concrete method — has body
    void stop() {
        System.out.println(brand + " stopped");
    }
}

class Car extends Vehicle {
    Car(String brand) { super(brand); }

    @Override
    void start() {
        System.out.println(brand + " car started with ignition key");
    }
}

// Interface — pure abstraction (Java 8+: can have default methods)
interface Flyable {
    void fly();   // implicitly public abstract

    default void land() {    // Java 8+ default method
        System.out.println("Landing safely");
    }
}

interface Swimmable {
    void swim();
}

// A class can implement multiple interfaces (not possible with abstract class)
class Duck extends Animal implements Flyable, Swimmable {
    @Override public void fly()  { System.out.println("Duck flying"); }
    @Override public void swim() { System.out.println("Duck swimming"); }
}
```

**Abstract class vs Interface:**
- Use **abstract class** when classes share code (common base implementation)
- Use **interface** when unrelated classes need to share a contract (can implement multiple)

## Exception Handling

From the original Microsoft SDE notes — Exception Handling is critical for building robust applications.

### Error Types in Java Development
1. **Compile time errors** — syntax errors, detected at compile time, fixed by programmer
2. **Logical errors** — wrong output due to misinterpretation of logic, detected at runtime
3. **Runtime errors** — invalid input or unexpected conditions at runtime

### Exception Hierarchy
```
Throwable
├── Error (JVM level — don't catch these)
│   ├── StackOverflowError
│   ├── OutOfMemoryError
│   └── ...
└── Exception
    ├── Checked Exceptions (must handle or declare)
    │   ├── FileNotFoundException
    │   ├── ClassNotFoundException
    │   ├── InterruptedException
    │   └── IOException
    └── Unchecked Exceptions (RuntimeException)
        ├── ArithmeticException    (division by zero)
        ├── NullPointerException
        ├── ArrayIndexOutOfBoundsException
        ├── NumberFormatException
        └── ClassCastException
```

### try-catch-finally

```java
public class Division {
    public static void main(String[] args) {
        try {
            // Code that might throw exception
            String s1 = args[0];       // get dividend from command line
            String s2 = args[1];       // get divisor
            int a = Integer.parseInt(s1);
            int b = Integer.parseInt(s2);
            int result = a / b;
            System.out.println("Result = " + result);

        } catch (ArithmeticException ae) {
            System.out.println("Don't enter zero as divisor");
        } catch (NumberFormatException nfe) {
            System.out.println("Don't enter alphanumeric values");
        } catch (ArrayIndexOutOfBoundsException ab) {
            System.out.println("Please enter two numbers");
        } finally {
            // Always executes — use to close files, DB connections, etc.
            System.out.println("Program execution complete");
        }
    }
}
```

**finally block rules (from notes):**
1. Use `finally` to write cleanup code — release files, databases, network connections
2. `finally` executes compulsorily — whether or not exception occurs
3. Writing `finally` is optional but highly recommended for every Java program
4. Case 1: If exception occurs → part of try runs → catch block runs → finally runs
5. Case 2: No exception → complete try block runs → finally runs

### Custom Exceptions

```java
// Step 1: Create custom exception classes
class NegativeSalaryException extends Exception {
    NegativeSalaryException(String msg) {
        super(msg);
    }
}

class PsalException extends Exception {
    PsalException(String msg) {
        super(msg);
    }
}

// Step 2: Use them in your business logic
class Employee {
    void checkSalary(int salary) throws NegativeSalaryException, PsalException {
        if (salary < 0) {
            throw new NegativeSalaryException("Salary cannot be negative");
        }
        if (salary > 10000000) {
            throw new PsalException("Salary exceeds maximum limit");
        }
        System.out.println("Valid salary: " + salary);
    }
}

// Step 3: Handle them
public class SalaryChecker {
    public static void main(String[] args) {
        Employee emp = new Employee();
        try {
            emp.checkSalary(-5000);
        } catch (NegativeSalaryException nse) {
            System.out.println("Error: " + nse.getMessage());
        } catch (PsalException pe) {
            System.out.println("Error: " + pe.getMessage());
        }
    }
}
```

## Multithreading

From notes — multithreading allows multiple threads to execute simultaneously.

### Thread Lifecycle (State Chart Diagram)
```
New State → Ready State → Running State → Halted State
                ↑               ↓
                ←── Waiting State ──←
```

1. **New State** — Thread object created, memory not yet allocated
2. **Ready State** — Thread enters main memory, waiting for CPU
3. **Running State** — Thread currently executing under CPU control
4. **Waiting State** — Thread temporarily paused (sleep, wait, I/O)
5. **Halted State** — Thread completed execution

**CPU Burst Time:** The amount of time required by the thread from CPU for complete execution of user defined methods.

### Creating Threads

```java
// Method 1: Extend Thread class
class MyThread extends Thread {
    private String threadName;

    MyThread(String name) { this.threadName = name; }

    @Override
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println(threadName + " — count: " + i);
            try {
                Thread.sleep(1000);   // pause 1 second
            } catch (InterruptedException ie) {
                System.out.println("Thread interrupted");
            }
        }
    }
}

// Method 2: Implement Runnable interface (PREFERRED — allows extending another class)
class PrintTask implements Runnable {
    @Override
    public void run() {
        for (int i = 1; i <= 10; i++) {
            System.out.println("Value of i = " + i);
            try { Thread.sleep(1000); } catch (InterruptedException ie) {}
        }
    }
}

public class ThreadDemo {
    public static void main(String[] args) {
        // Method 1
        MyThread t1 = new MyThread("Thread-A");
        MyThread t2 = new MyThread("Thread-B");

        System.out.println("t1 alive before start: " + t1.isAlive());
        t1.start();   // DO NOT call run() directly — it won't create new thread
        t2.start();
        System.out.println("t1 alive after start: " + t1.isAlive());

        // Method 2
        Runnable task = new PrintTask();
        Thread t3 = new Thread(task);
        t3.start();
    }
}
```

**Critical note from notes:** It is NOT recommended to call `run()` directly. Call `start()` — it creates a new thread and then calls `run()` internally. Calling `run()` directly just executes it in the current thread without any multithreading benefit.

### Synchronization

Without synchronization, multiple threads accessing shared data cause **race conditions**:

```java
// Problem — without synchronization (inconsistent results)
class Account {
    private int balance = 0;

    // synchronized keyword ensures only one thread executes at a time
    synchronized void deposit(int amount) {
        balance = balance + amount;
        System.out.println("Current balance = " + balance);
    }

    int getBalance() { return balance; }
}

class Customer extends Thread {
    Account account;

    Customer(Account ac) { this.account = ac; }

    @Override
    public void run() {
        account.deposit(10);   // each customer deposits Rs.10
    }
}

public class BankDemo {
    public static void main(String[] args) throws InterruptedException {
        Account acc = new Account();

        // Create n customers (threads) all depositing into same account
        Customer c1 = new Customer(acc);
        Customer c2 = new Customer(acc);
        Customer c3 = new Customer(acc);

        c1.start(); c2.start(); c3.start();

        // Wait for all threads to complete
        c1.join(); c2.join(); c3.join();

        System.out.println("Final balance = " + acc.getBalance());  // 30 (correct)
    }
}
```

## Collections Framework

```java
import java.util.*;

// ArrayList — dynamic array
List<String> names = new ArrayList<>();
names.add("Alice");
names.add("Bob");
names.add("Charlie");
names.remove("Bob");
System.out.println(names.size());         // 2
System.out.println(names.get(0));         // Alice
System.out.println(names.contains("Bob")); // false

// LinkedList — doubly linked list
LinkedList<Integer> ll = new LinkedList<>();
ll.add(10);          // add to end
ll.addFirst(5);      // add to front
ll.addLast(20);      // add to back
System.out.println(ll.getFirst());  // 5
System.out.println(ll.getLast());   // 20
ll.removeFirst();

// LinkedList constructors:
// LinkedList() — creates empty list
// LinkedList(int size) — creates list with initial capacity

// HashMap — key-value pairs (no order)
Map<String, Integer> scores = new HashMap<>();
scores.put("Alice", 95);
scores.put("Bob", 87);
scores.put("Charlie", 92);
System.out.println(scores.get("Alice"));   // 95
System.out.println(scores.containsKey("Bob")); // true
scores.remove("Bob");

for (Map.Entry<String, Integer> entry : scores.entrySet()) {
    System.out.println(entry.getKey() + " : " + entry.getValue());
}

// HashSet — unique elements, no order
Set<String> tags = new HashSet<>();
tags.add("java");
tags.add("python");
tags.add("java");  // duplicate — ignored
System.out.println(tags.size());  // 2

// Stack — LIFO
Stack<Integer> stack = new Stack<>();
stack.push(1); stack.push(2); stack.push(3);
System.out.println(stack.pop());   // 3 (last in, first out)
System.out.println(stack.peek());  // 2 (view without removing)
```

### Generics

Before generics (1D collection flow variable): internally JVM treated all entries as `java.lang.Object`. This caused issues — you could add any type, and getting it back required manual casting.

```java
// Without generics (old way) — unsafe
List list = new ArrayList();
list.add("hello");
list.add(42);    // no error at compile time
String s = (String) list.get(1);  // ClassCastException at runtime!

// With generics (modern) — type-safe
List<String> strings = new ArrayList<>();
strings.add("hello");
// strings.add(42);  // compile error — caught early!
String s = strings.get(0);  // no cast needed

// Generic method
public static <T extends Comparable<T>> T findMax(T[] arr) {
    T max = arr[0];
    for (T item : arr) {
        if (item.compareTo(max) > 0) max = item;
    }
    return max;
}
```

**Object Type Casting:**
- Converting base class object reference into derived class object reference
- Syntax: `SubclassName subObj = (SubclassName) baseClassObj;`
- Dynamic Object Type Casting: converting `java.lang.Object` reference into required derived class reference dynamically

## Next Steps

Move to **Advanced** for: IO Streams, Network Programming (java.net), JDBC, Design Patterns, JVM internals, and Java 8+ features (Lambda, Stream API).
