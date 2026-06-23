# Java Programming Certification Guide

## Certifications Available

| Cert | Code | Cost | Format |
|------|------|------|--------|
| **Oracle Java SE 17 Foundations** | 1Z0-811 | $245 | MCQ |
| **Oracle Java SE 17 Associate** | 1Z0-829 | $245 | MCQ |
| **Spring Professional** | VMware | $200 | MCQ |
| **NPTEL Java MOOC** | NPTEL | Free | Proctored exam |

Path: 1Z0-811 (Foundations) -> 1Z0-829 (Associate) -> 1Z0-830 (Professional).

---

## Core Topics

```java
// OOP
public abstract class Shape {
    protected String color;
    public Shape(String color) { this.color = color; }
    public abstract double area();
}
public class Circle extends Shape {
    private double radius;
    public Circle(String color, double r) { super(color); this.radius = r; }
    @Override public double area() { return Math.PI * radius * radius; }
}

// INTERFACES AND GENERICS
public interface Repository<T, ID> {
    T findById(ID id);
    void save(T entity);
    List<T> findAll();
}

// COLLECTIONS
List<String> list = new ArrayList<>(Arrays.asList("c","a","b"));
Collections.sort(list);
Map<String,Integer> freq = new HashMap<>();
freq.merge("word", 1, Integer::sum);
Set<String> unique = new LinkedHashSet<>(list); // ordered

// STREAMS (Java 8+)
List<Integer> evens = IntStream.rangeClosed(1,100)
    .filter(n -> n % 2 == 0).boxed().collect(Collectors.toList());

Map<String,Long> countByCity = people.stream()
    .collect(Collectors.groupingBy(Person::getCity, Collectors.counting()));

OptionalDouble avg = numbers.stream().mapToInt(Integer::intValue).average();

// EXCEPTION HANDLING
try {
    int result = Integer.parseInt(input);
} catch (NumberFormatException e) {
    System.err.println("Not a number: " + e.getMessage());
} finally {
    System.out.println("always runs");
}

// TRY-WITH-RESOURCES (auto-close)
try (var br = new BufferedReader(new FileReader("file.txt"))) {
    String line;
    while ((line = br.readLine()) != null) System.out.println(line);
}

// RECORDS (Java 16+)
public record Point(double x, double y) {
    public double distance() { return Math.sqrt(x*x + y*y); }
}

// OPTIONAL (avoid null)
Optional<String> name = Optional.ofNullable(getName());
String result = name.map(String::toUpperCase).orElse("Unknown");

// CONCURRENCY
ExecutorService pool = Executors.newFixedThreadPool(4);
Future<String> future = pool.submit(() -> expensiveTask());
CompletableFuture.supplyAsync(() -> getData())
    .thenApply(d -> transform(d))
    .thenAccept(System.out::println);
```

---

## Study Resources

- **Oracle Java Tutorials** (docs.oracle.com/javase/tutorial) — official, free
- **Effective Java** (Joshua Bloch) — essential for serious Java developers
- **Head First Java** — visual, beginner-friendly introduction
- **NPTEL Java MOOC** — free IIT course with certification

## Revision Notes
```
OOP: class/object | extends (inheritance) | implements (interface) | abstract class
COLLECTIONS: List (ordered, dup OK) | Set (no dup) | Map (key-value) | Queue
STREAMS: filter | map | reduce | collect | flatMap | distinct | sorted
CHECKED vs UNCHECKED: checked = must handle | unchecked = RuntimeException
JVM: .java -> javac -> .class (bytecode) -> JVM (platform-independent)
GENERICS: compile-time type safety | type erasure at runtime | wildcards <? extends T>
```
