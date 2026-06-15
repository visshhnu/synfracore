# Java — Interview Questions

Interview questions collected from real placements and a Microsoft SDE's notes. These are what interviewers actually ask.

---

## OOP & Class Design

**What are the 4 pillars of OOP?**
1. **Encapsulation** — binding data and methods together, hiding internal state (use private fields + public getters/setters)
2. **Inheritance** — child class acquires properties of parent class (`extends` keyword)
3. **Polymorphism** — one interface, multiple implementations (method overloading + overriding)
4. **Abstraction** — hiding implementation details, showing only necessary information (abstract classes, interfaces)

**Difference between method overloading and overriding?**
Overloading: same method name, different parameters — resolved at **compile time** (static polymorphism). Overriding: child class redefines parent method with same signature — resolved at **runtime** (dynamic polymorphism). Override rules: same name, same return type, same parameters, cannot reduce access modifier.

**What is the difference between abstract class and interface?**
Abstract class: can have constructors, instance variables, concrete methods + abstract methods, single inheritance only. Interface: no constructors, all fields are `public static final`, methods are `public abstract` by default (Java 8+ allows `default` and `static` methods), supports multiple implementation. Use abstract class when classes share common code; use interface when unrelated classes share a contract.

**What is `super` keyword?**
`super` refers to the parent class. Uses: `super()` calls parent constructor (must be first statement), `super.method()` calls parent method, `super.variable` accesses parent variable. Cannot use `super` in static context.

**What is `this` keyword?**
`this` refers to current object instance. Uses: distinguish instance variables from parameters (`this.name = name`), call another constructor in same class (`this()`), pass current object as argument.

---

## Exception Handling

**What is the exception hierarchy in Java?**
`Throwable` is the root. Two children: `Error` (JVM-level, don't catch) and `Exception`. Under Exception: Checked (FileNotFoundException, IOException, ClassNotFoundException, InterruptedException) and Unchecked/RuntimeException (NullPointerException, ArrayIndexOutOfBoundsException, ArithmeticException, ClassCastException, NumberFormatException).

**What is the difference between `throw` and `throws`?**
`throw` is used inside a method to explicitly throw an exception object: `throw new ArithmeticException("message")`. `throws` is used in method signature to declare that the method may throw a checked exception: `void readFile() throws IOException`. You `throw` ONE exception; you declare MULTIPLE with `throws`.

**Can we have try without catch?**
Yes — `try` with `finally` (no catch) is valid. The finally block always runs.

**What happens if exception is thrown in `finally` block?**
The original exception is lost and the finally block exception propagates. Avoid throwing exceptions in `finally`.

**When does `finally` NOT execute?**
When `System.exit()` is called, or when JVM crashes (OutOfMemoryError, kill -9).

---

## Multithreading

**What is the difference between Process and Thread?**
Process: independent program with its own memory space. Thread: lightweight unit within a process, shares memory with other threads of same process. Threads are faster to create/destroy, communicate easier but need synchronization.

**What is race condition and how do you prevent it?**
Race condition: two threads read/modify shared data simultaneously, giving inconsistent results. Prevention: use `synchronized` keyword on methods or blocks. Synchronized ensures only one thread executes that block at a time.

**Difference between `sleep()` and `wait()`?**
`sleep(ms)` pauses the thread for given milliseconds — does NOT release lock. `wait()` pauses thread AND releases the lock — thread stays in waiting state until `notify()` or `notifyAll()` is called. `sleep()` is in `Thread` class; `wait()` is in `Object` class.

**What is deadlock?**
Two or more threads blocked forever, each waiting for a resource held by the other. Example: Thread 1 holds Lock A, waiting for Lock B. Thread 2 holds Lock B, waiting for Lock A. Prevention: always acquire locks in the same order.

**What does `volatile` keyword do?**
Variables declared `volatile` are read directly from main memory (not thread's local cache). Ensures visibility of changes across threads. Does NOT ensure atomicity — use `synchronized` or `AtomicInteger` for compound operations.

---

## Collections

**Difference between ArrayList and LinkedList?**
ArrayList: backed by dynamic array, O(1) random access, O(n) insert/delete in middle. LinkedList: doubly linked list, O(n) random access, O(1) insert/delete if you have the node. Use ArrayList for frequent reads, LinkedList for frequent inserts/deletes at ends.

**Difference between HashMap and Hashtable?**
HashMap: not synchronized, allows one null key and multiple null values, faster. Hashtable: synchronized, no null keys or values, legacy class. For thread-safe needs, use `ConcurrentHashMap` over Hashtable.

**What is the difference between Set, List, and Map?**
List: ordered, allows duplicates (ArrayList, LinkedList). Set: unordered, no duplicates (HashSet, TreeSet). Map: key-value pairs, no duplicate keys (HashMap, TreeMap, LinkedHashMap).

**How does HashMap work internally?**
Uses an array of buckets. Key's `hashCode()` determines the bucket index. Within a bucket, entries are stored as a linked list (Java 8+: converts to balanced tree when list > 8). For retrieval: compute hash → find bucket → search by `equals()`. Load factor (default 0.75) triggers resize when 75% full.

---

## Java 8+ Features

**What is a functional interface?**
An interface with exactly ONE abstract method. Can be used as lambda expression target. Example: `Runnable`, `Comparator`, `Predicate`. `@FunctionalInterface` annotation enforces this.

**What is Stream API?**
Allows functional-style processing of collections. Operations are lazy (nothing runs until terminal operation). Pipeline: `stream()` → zero or more intermediate ops (filter, map, sorted) → terminal op (collect, count, reduce, forEach).

**What is Optional?**
A container object that may or may not contain a value — avoids `NullPointerException`. Methods: `isPresent()`, `get()`, `orElse(default)`, `orElseGet(supplier)`, `orElseThrow()`, `ifPresent(consumer)`.

---

## Common Coding Questions

**Reverse a String:**
```java
String str = "Hello";
String reversed = new StringBuilder(str).reverse().toString();
// or manually:
char[] chars = str.toCharArray();
for (int i = 0, j = chars.length-1; i < j; i++, j--) {
    char temp = chars[i]; chars[i] = chars[j]; chars[j] = temp;
}
System.out.println(new String(chars));  // olleH
```

**Check if String is palindrome:**
```java
public boolean isPalindrome(String s) {
    s = s.toLowerCase().replaceAll("[^a-z0-9]", "");
    int i = 0, j = s.length() - 1;
    while (i < j) {
        if (s.charAt(i++) != s.charAt(j--)) return false;
    }
    return true;
}
```

**Find factorial recursively:**
```java
public int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}
```

**Convert Roman numeral to number (common interview Q from notes):**
```java
public int romanToInt(String s) {
    Map<Character, Integer> map = new HashMap<>();
    map.put('I',1); map.put('V',5); map.put('X',10);
    map.put('L',50); map.put('C',100); map.put('D',500); map.put('M',1000);

    int result = 0;
    for (int i = 0; i < s.length(); i++) {
        int curr = map.get(s.charAt(i));
        int next = (i+1 < s.length()) ? map.get(s.charAt(i+1)) : 0;
        if (curr < next) result -= curr;
        else result += curr;
    }
    return result;
}
```

**Thread-based app: print numbers with delay (from original notes):**
```java
class NumberPrinter extends Thread {
    public void run() {
        for (int i = 1; i <= 10; i++) {
            try {
                System.out.println("Val of i = " + i);
                Thread.sleep(1000);  // wait 1 second
            } catch (InterruptedException ie) {
                System.out.println("Problem in thread execution");
            }
        }
    }
}
// Create and start:
NumberPrinter np = new NumberPrinter();
np.start();
```
