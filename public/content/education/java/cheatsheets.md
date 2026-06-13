# Java — Cheatsheet

```java
// ── STRINGS ───────────────────────────────────────────────
String s = "Hello World";
s.length()                        // 11
s.charAt(0)                       // 'H'
s.substring(6)                    // "World"
s.substring(0, 5)                 // "Hello"
s.toLowerCase() / toUpperCase()
s.trim()                          // remove leading/trailing whitespace
s.strip()                         // Unicode-aware trim (Java 11+)
s.contains("World")               // true
s.startsWith("Hello") / endsWith("ld")
s.replace("World", "Java")        // "Hello Java"
s.replaceAll("\\d", "#")           // regex replace
s.split("\\s+")                    // split by whitespace
s.isEmpty()                       // true if ""
s.isBlank()                       // true if whitespace only (Java 11+)
s.indexOf("o")                    // 4 (first occurrence)
s.lastIndexOf("o")                // 7
String.format("Hi %s, you are %d", name, age)
String.join(", ", "a", "b", "c")  // "a, b, c"
String.valueOf(42)                // "42"
Integer.parseInt("42")            // 42
Integer.toBinaryString(10)        // "1010"
new StringBuilder().append("a").append("b").toString() // string building

// ── ARRAYS ────────────────────────────────────────────────
int[] arr = new int[5];           // [0, 0, 0, 0, 0]
int[] arr = {1, 2, 3, 4, 5};
arr.length                        // 5
Arrays.sort(arr)                  // in-place sort
Arrays.fill(arr, 0)               // set all to 0
Arrays.copyOf(arr, 3)             // [1, 2, 3]
Arrays.copyOfRange(arr, 1, 4)     // [2, 3, 4]
Arrays.toString(arr)              // "[1, 2, 3, 4, 5]"
Arrays.binarySearch(arr, 3)       // 2 (index, array must be sorted)
int[][] matrix = new int[3][4];   // 3 rows, 4 cols

// ── MATH ──────────────────────────────────────────────────
Math.abs(-5)                      // 5
Math.max(3, 7)                    // 7
Math.min(3, 7)                    // 3
Math.pow(2, 10)                   // 1024.0
Math.sqrt(16)                     // 4.0
Math.floor(3.7)                   // 3.0
Math.ceil(3.2)                    // 4.0
Math.round(3.5)                   // 4
Math.random()                     // 0.0 to 1.0
(int)(Math.random() * 100)        // 0 to 99

// ── COLLECTIONS QUICK REFERENCE ───────────────────────────
// List (ordered, duplicates allowed)
List<T> list = new ArrayList<>();
list.add(x); list.get(i); list.size(); list.remove(i);
Collections.sort(list); Collections.reverse(list);

// Map (key-value)
Map<K,V> map = new HashMap<>();
map.put(k,v); map.get(k); map.containsKey(k);
map.getOrDefault(k, def); map.remove(k);
for(Map.Entry<K,V> e : map.entrySet()) { e.getKey(); e.getValue(); }

// Set (unique)
Set<T> set = new HashSet<>();
set.add(x); set.contains(x); set.remove(x); set.size();

// Stack / Queue
Deque<T> stack = new ArrayDeque<>();  stack.push(x); stack.pop(); stack.peek();
Deque<T> queue = new ArrayDeque<>();  queue.offer(x); queue.poll(); queue.peek();
PriorityQueue<T> pq = new PriorityQueue<>();  // min heap

// ── STREAMS QUICK REFERENCE ───────────────────────────────
stream.filter(predicate)           // keep elements matching condition
stream.map(function)               // transform each element
stream.flatMap(f)                  // flatten nested collections
stream.sorted()                    // natural sort
stream.sorted(Comparator.comparing(T::getField))
stream.distinct()                  // remove duplicates
stream.limit(n) / skip(n)
stream.reduce(identity, accumulator)
stream.collect(Collectors.toList())
stream.collect(Collectors.joining(", "))
stream.collect(Collectors.groupingBy(T::getField))
stream.count() / sum() / max() / min() / average()
stream.anyMatch(p) / allMatch(p) / noneMatch(p)
stream.findFirst() / findAny()     // returns Optional<T>
```
