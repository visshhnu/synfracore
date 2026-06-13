# Java — Intermediate

## Inheritance and Polymorphism

```java
// Parent (base) class
public abstract class Animal {
    protected String name;
    protected String sound;

    public Animal(String name, String sound) {
        this.name  = name;
        this.sound = sound;
    }

    // Concrete method — inherited as-is
    public void breathe() {
        System.out.println(name + " breathes air");
    }

    // Abstract method — each subclass MUST override
    public abstract String makeSound();
}

// Child classes
public class Dog extends Animal {
    private String breed;

    public Dog(String name, String breed) {
        super(name, "Woof");  // Call parent constructor
        this.breed = breed;
    }

    @Override
    public String makeSound() {
        return name + " says: " + sound + "!";
    }

    // Additional method only in Dog
    public void fetch() {
        System.out.println(name + " fetches the ball!");
    }
}

public class Cat extends Animal {
    public Cat(String name) { super(name, "Meow"); }

    @Override
    public String makeSound() { return name + " says: " + sound + "..."; }
}

// Polymorphism — one interface, many implementations
List<Animal> animals = List.of(new Dog("Rex", "German Shepherd"), new Cat("Whiskers"));
for (Animal a : animals) {
    System.out.println(a.makeSound()); // Correct makeSound() called for each
    a.breathe();
}
```

## Interfaces

```java
// Interface — defines a contract (what to do, not how)
public interface Payable {
    double calculatePay();        // implicitly public abstract
    default String getPayType() { // default method (Java 8+)
        return "Standard";
    }
}

public interface Taxable {
    double TAX_RATE = 0.18;  // implicitly public static final
    double calculateTax();
}

// A class can implement MULTIPLE interfaces
public class Employee implements Payable, Taxable {
    private String name;
    private double baseSalary;

    public Employee(String name, double baseSalary) {
        this.name = name;
        this.baseSalary = baseSalary;
    }

    @Override
    public double calculatePay() { return baseSalary; }

    @Override
    public double calculateTax() { return baseSalary * TAX_RATE; }

    public double netPay() { return calculatePay() - calculateTax(); }
}
```

## Collections Framework

```java
import java.util.*;

// ── LISTS ─────────────────────────────────────────────────
List<String> list = new ArrayList<>();
list.add("Alice"); list.add("Bob"); list.add("Charlie");
list.get(0);                    // "Alice"
list.size();                    // 3
list.contains("Bob");           // true
list.remove("Bob");             // removes by value
list.remove(0);                 // removes by index
Collections.sort(list);         // sort alphabetically

// ── MAPS ──────────────────────────────────────────────────
Map<String, Integer> scores = new HashMap<>();
scores.put("Alice", 95);
scores.put("Bob", 87);
scores.getOrDefault("Charlie", 0);  // 0 if not found
scores.putIfAbsent("Diana", 75);    // only adds if key absent
scores.merge("Alice", 5, Integer::sum); // Alice: 95+5=100

// Iterate map
for (Map.Entry<String, Integer> entry : scores.entrySet()) {
    System.out.println(entry.getKey() + ": " + entry.getValue());
}

// ── SETS ──────────────────────────────────────────────────
Set<String> set = new HashSet<>(List.of("a", "b", "c", "a")); // {"a","b","c"}
set.add("d");
set.contains("b");   // true O(1)
Set<String> sorted = new TreeSet<>(set); // alphabetically sorted

// ── PRIORITY QUEUE (HEAP) ─────────────────────────────────
PriorityQueue<Integer> minHeap = new PriorityQueue<>();
minHeap.offer(5); minHeap.offer(1); minHeap.offer(3);
minHeap.poll();  // 1 (smallest removed)

PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Comparator.reverseOrder());
```

## Streams API (Java 8+)

```java
import java.util.stream.*;

List<Integer> numbers = Arrays.asList(5, 3, 8, 1, 9, 2, 7, 4, 6);

// Filter + Map + Collect
List<Integer> result = numbers.stream()
    .filter(n -> n > 4)            // keep: 5, 8, 9, 7, 6
    .map(n -> n * 2)               // double each: 10, 16, 18, 14, 12
    .sorted()                      // sort: 10, 12, 14, 16, 18
    .collect(Collectors.toList()); // → [10, 12, 14, 16, 18]

// Aggregation
int sum     = numbers.stream().reduce(0, Integer::sum);
int max     = numbers.stream().max(Integer::compareTo).orElse(0);
long count  = numbers.stream().filter(n -> n % 2 == 0).count();
double avg  = numbers.stream().mapToInt(Integer::intValue).average().orElse(0);

// Group by (very useful for data analysis)
List<String> words = List.of("apple", "ant", "banana", "bear", "cherry", "cat");
Map<Character, List<String>> grouped = words.stream()
    .collect(Collectors.groupingBy(w -> w.charAt(0)));
// {a: [apple, ant], b: [banana, bear], c: [cherry, cat]}
```
