# Java — Cheatsheet

## Quick Reference — From Real Engineer Notes

```java
// ── COMPILE & RUN ──────────────────────────────────────────
javac MyProgram.java          // compile
java MyProgram                // run (no .class extension)
java -cp . MyProgram          // with classpath
jar cf app.jar *.class        // create JAR
java -jar app.jar             // run JAR

// ── DATA TYPES ─────────────────────────────────────────────
int    i = 10;          // -2B to +2B
long   l = 10L;         // -9.2E18 to +9.2E18 — need 'L'
double d = 3.14;        // 64-bit decimal
float  f = 3.14f;       // 32-bit decimal — need 'f'
char   c = 'A';         // single quotes
boolean b = true;
String s = "hello";     // reference type

// ── STRING METHODS ─────────────────────────────────────────
s.length()              // length
s.charAt(0)             // first char
s.substring(1, 4)       // chars at index 1,2,3
s.toUpperCase()         // HELLO
s.toLowerCase()         // hello
s.trim()                // remove leading/trailing spaces
s.replace("a","b")      // replace all occurrences
s.contains("ell")       // true/false
s.startsWith("He")      // true/false
s.endsWith("lo")        // true/false
s.equals(other)         // compare content (NOT ==)
s.equalsIgnoreCase(o)   // case-insensitive compare
s.split(",")            // split into array
String.valueOf(42)      // int to String
Integer.parseInt("42")  // String to int

// ── ACCESS SPECIFIERS ──────────────────────────────────────
// private   → same class only
// default   → same package
// protected → same package + subclasses
// public    → everywhere

// ── EXCEPTION HANDLING ─────────────────────────────────────
try {
    // risky code
} catch (SpecificException e) {
    // handle
} catch (Exception e) {       // catch-all (put last)
    e.getMessage();           // error message
    e.printStackTrace();      // full stack trace
} finally {
    // ALWAYS runs — close files/DB connections here
}

// throw vs throws
throw new IllegalArgumentException("Invalid input");   // inside method
void myMethod() throws IOException { ... }             // method signature

// Custom exception
class MyException extends Exception {
    MyException(String msg) { super(msg); }
}

// ── COLLECTIONS ────────────────────────────────────────────
// ArrayList
List<String> list = new ArrayList<>();
list.add("item");
list.add(0, "first");       // insert at index
list.get(0);                // retrieve
list.remove(0);             // remove by index
list.remove("item");        // remove by value
list.size();                // count
list.contains("item");      // true/false
list.isEmpty();             // true/false
Collections.sort(list);     // sort
list.clear();               // remove all

// HashMap
Map<String, Integer> map = new HashMap<>();
map.put("key", value);
map.get("key");             // returns null if not found
map.getOrDefault("k", 0);  // return 0 if not found
map.containsKey("key");
map.containsValue(42);
map.remove("key");
map.size();
for (Map.Entry<K,V> e : map.entrySet()) { e.getKey(); e.getValue(); }
map.keySet();               // Set of all keys
map.values();               // Collection of all values

// HashSet
Set<String> set = new HashSet<>();
set.add("item");
set.remove("item");
set.contains("item");
set.size();

// Stack (LIFO)
Stack<Integer> stack = new Stack<>();
stack.push(1);
stack.pop();    // remove + return top
stack.peek();   // view top without removing
stack.isEmpty();

// Queue (FIFO)
Queue<Integer> q = new LinkedList<>();
q.offer(1);    // add to tail
q.poll();      // remove from head
q.peek();      // view head without removing

// ── MULTITHREADING ─────────────────────────────────────────
// Method 1: Extend Thread
class MyThread extends Thread {
    public void run() { /* thread code */ }
}
MyThread t = new MyThread();
t.start();     // start() not run()!
t.sleep(1000); // pause 1 second
t.isAlive();   // is thread still running?
t.join();      // wait for thread to finish

// Method 2: Implement Runnable (preferred)
Runnable task = () -> { /* thread code */ };
Thread t = new Thread(task);
t.start();

// Synchronization
synchronized void method() { }    // method-level lock
synchronized (this) { }           // block-level lock

// Thread states: New → Ready → Running → Waiting → Halted

// ── JAVA 8+ LAMBDA ─────────────────────────────────────────
// Old anonymous class
Runnable r = new Runnable() { public void run() { } };
// Lambda equivalent
Runnable r = () -> { };

list.forEach(item -> System.out.println(item));
list.forEach(System.out::println);   // method reference
list.sort((a, b) -> a.compareTo(b));

// ── STREAM API ─────────────────────────────────────────────
list.stream()
    .filter(x -> x > 0)
    .map(x -> x * 2)
    .sorted()
    .distinct()
    .limit(10)
    .collect(Collectors.toList());

list.stream().count();
list.stream().min(Comparator.naturalOrder()).get();
list.stream().max(Comparator.naturalOrder()).get();
list.stream().reduce(0, Integer::sum);
list.stream().mapToInt(Integer::intValue).sum();
list.stream().mapToInt(Integer::intValue).average().getAsDouble();
list.stream().anyMatch(x -> x > 5);   // any element matches?
list.stream().allMatch(x -> x > 0);   // all elements match?
list.stream().noneMatch(x -> x < 0);  // no element matches?

// ── IO STREAMS ─────────────────────────────────────────────
// Read file (modern)
try (BufferedReader br = new BufferedReader(new FileReader("file.txt"))) {
    br.lines().forEach(System.out::println);
}

// Read all bytes (Java 11+)
byte[] bytes = Files.readAllBytes(Path.of("file.txt"));
String content = new String(bytes);

// Write file
Files.write(Path.of("out.txt"), "content".getBytes());

// ── NETWORK ────────────────────────────────────────────────
// Server
ServerSocket ss = new ServerSocket(9999);
Socket client = ss.accept();           // blocks until connection

// Client
Socket s = new Socket("localhost", 9999);
DataInputStream  dis = new DataInputStream(s.getInputStream());
DataOutputStream dos = new DataOutputStream(s.getOutputStream());
dos.writeUTF("Hello Server");
String response = dis.readUTF();

// ── USEFUL PATTERNS ────────────────────────────────────────
// Null check
if (obj != null) { ... }
Objects.requireNonNull(obj, "obj cannot be null");

// StringBuilder (mutable String)
StringBuilder sb = new StringBuilder();
sb.append("Hello").append(" ").append("World");
sb.insert(5, ",");
sb.delete(0, 5);
sb.reverse();
String result = sb.toString();

// Ternary
String status = salary > 50000 ? "High" : "Low";

// var (Java 10+)
var list = new ArrayList<String>();
var name = "Alice";
```

## Access Specifier Matrix (from Microsoft SDE notes)

```
                Same Class  SamePkg-Sub  SamePkg-INDC  DiffPkg-Sub  DiffPkg-INDC
private            ✅           ❌            ❌             ❌            ❌
default            ✅           ✅            ✅             ❌            ❌
protected          ✅           ✅            ✅             ✅            ❌
public             ✅           ✅            ✅             ✅            ✅

BC = Base Class, DC = Derived Class, INDC = Independent Class
✅ = accessible, ❌ = not accessible
```
