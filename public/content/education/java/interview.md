# Java — Interview Questions

**What is the difference between JDK, JRE, and JVM?**
JVM (Java Virtual Machine) is the runtime engine that executes Java bytecode — it's what makes Java platform-independent. JRE (Java Runtime Environment) = JVM + standard libraries — needed to run Java programs. JDK (Java Development Kit) = JRE + compiler (javac) + debugger + tools — needed to develop Java programs. End users install JRE. Developers install JDK.

**What is the difference between `==` and `.equals()`?**
For primitives (`int`, `double`, etc.), `==` compares values: `5 == 5` is true. For objects, `==` compares memory references (are they the same object?). `.equals()` compares the actual content. `new String("hello") == new String("hello")` is false (different objects). `new String("hello").equals("hello")` is true (same content). Always use `.equals()` for String comparison, or `Objects.equals(a, b)` to safely handle nulls.

**What is the difference between ArrayList and LinkedList?**
ArrayList uses a dynamic array internally — O(1) random access by index, O(n) insertion/deletion in the middle (shifts elements). LinkedList uses a doubly-linked list — O(n) random access, O(1) insertion/deletion at a known position. In practice, ArrayList is almost always preferred because: cache-friendly memory layout, random access is much faster, and modern hardware favors sequential memory access. Use LinkedList only when you frequently add/remove from the beginning.

**Explain method overloading vs method overriding.**
Overloading (compile-time polymorphism): same method name, different parameters in the SAME class. `add(int a, int b)` and `add(double a, double b)` coexist. The compiler picks the right one. Overriding (runtime polymorphism): child class provides a different implementation of a parent method with the SAME signature. `@Override` annotation is recommended. The JVM decides at runtime which implementation to call based on the actual object type, not the reference type.

**What is an interface vs abstract class?**
Abstract class: can have concrete methods, constructors, instance variables. A class can only extend ONE abstract class. Use for IS-A relationship with shared code. Interface: pure contract — no instance variables (only constants), no constructors. Since Java 8, can have `default` and `static` methods. A class can implement MULTIPLE interfaces. Use for CAN-DO capabilities (Runnable, Comparable, Serializable). Choose interface when you want to define behavior that unrelated classes can share; abstract class when sharing code between closely related classes.

**What is garbage collection in Java?**
Java manages memory automatically — you don't call `free()`. The GC finds objects no longer reachable from any live thread and reclaims their heap memory. Modern JVMs use generational GC: newly created objects go to Young Generation (small, collected frequently). Surviving objects are promoted to Old Generation (larger, collected rarely). G1GC is the default since Java 9, balancing throughput and pause time. You can hint the GC with `System.gc()` but can't force it. Avoid memory leaks by: closing streams/connections, removing listeners, not holding unnecessary references in static fields.

**What are checked vs unchecked exceptions?**
Checked exceptions extend `Exception` — the compiler forces you to either catch them or declare them with `throws`. Examples: `IOException`, `SQLException`. Forces callers to handle error conditions explicitly. Unchecked exceptions extend `RuntimeException` — no compile-time requirement to handle them. Examples: `NullPointerException`, `ArrayIndexOutOfBoundsException`, `IllegalArgumentException`. Best practice: use unchecked exceptions for programming errors (bugs); use checked exceptions for recoverable conditions the caller should explicitly handle (file not found, network timeout).
