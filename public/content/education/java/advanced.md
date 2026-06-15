# Java — Advanced

## IO Streams

Java uses streams to read/write data. Two stream families:
- **Byte streams** — `InputStream` / `OutputStream` — for binary data (images, audio)
- **Character streams** — `Reader` / `Writer` — for text data

```java
import java.io.*;

// Reading a file — FileInputStream (byte stream)
public class FileReadDemo {
    public static void main(String[] args) throws IOException {
        FileInputStream fis = new FileInputStream("data.txt");
        int ch;
        while ((ch = fis.read()) != -1) {
            System.out.print((char) ch);
        }
        fis.close();
    }
}

// Writing a file — FileOutputStream
public class FileWriteDemo {
    public static void main(String[] args) throws IOException {
        FileOutputStream fos = new FileOutputStream("output.txt");
        String data = "Hello, Java IO!";
        fos.write(data.getBytes());
        fos.close();
        System.out.println("File written successfully");
    }
}

// Buffered reading — much faster for large files
public class BufferedReadDemo {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader("data.txt"));
        String line;
        while ((line = br.readLine()) != null) {
            System.out.println(line);
        }
        br.close();
    }
}

// Try-with-resources (Java 7+) — auto-closes streams
public class ModernIO {
    public static void main(String[] args) throws IOException {
        try (BufferedReader br = new BufferedReader(new FileReader("data.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }
        }  // br.close() called automatically
    }
}
```

### DataInputStream

**DataInputStream** has two purposes (from notes):
1. Read data from keyboard (local reading)
2. Read data between multiple machines in same/different network (remote reading)

```java
// Constructor: DataInputStream(InputStream)
// Instance methods:
//   public XXX readXXX()   — reads any fundamental data type
//   public String readLine() — reads data as String

DataInputStream dis = new DataInputStream(System.in);
System.out.println("Enter your name: ");
String name = dis.readLine();
System.out.println("Hello, " + name);
```

### Properties File

Steps to read data from a `.properties` file:
1. Create the property file in any text editor, save with `.prop` or `.rbf` extension
2. Open the property file in read mode using `FileInputStream`
3. Create an object of `Properties` class
4. Load/Transfer content from property file into Properties object (secondary → main memory)
5. Obtain property values by passing property names
6. Close the property file

```java
import java.io.*;
import java.util.Properties;

public class PropDemo {
    public static void main(String[] args) throws IOException {
        // Step 1: Create result.prop with content:
        // sno=8
        // sname=Alice
        // marks=85.58

        Properties p = new Properties();

        // Step 2-4: Load the file
        FileInputStream fis = new FileInputStream("result.prop");
        p.load(fis);
        fis.close();

        // Step 5: Retrieve values
        String sno   = p.getProperty("sno");
        String sname = p.getProperty("sname");
        String marks = p.getProperty("marks");

        System.out.println("Student No: " + sno);
        System.out.println("Name: " + sname);
        System.out.println("Marks: " + marks);
    }
}
```

## Network Programming (java.net)

From notes — **Basic aim of network programming is to share data between multiple machines.**

In client-server application development, two types of programs:
- **Client side programs / Client Application** — makes requests to server
- **Server side programs / Server Application** — receives client request, processes, returns response

For a client-server app — client must be developed on one machine and server on another (both connected to same network).

```java
// SERVER — waits for connections
import java.net.*;
import java.io.*;

public class Server {
    public static void main(String[] args) throws IOException {
        // Create ServerSocket listening on port 9999
        ServerSocket ss = new ServerSocket(9999);
        System.out.println("Server started. Waiting for client...");

        // accept() blocks until a client connects
        Socket clientSocket = ss.accept();
        System.out.println("Client connected: " + clientSocket.getInetAddress());

        // Get input stream from client
        DataInputStream dis = new DataInputStream(clientSocket.getInputStream());

        // Get output stream to send response
        DataOutputStream dos = new DataOutputStream(clientSocket.getOutputStream());

        // Read client message
        String msg = dis.readUTF();
        System.out.println("Client says: " + msg);

        // Send response
        dos.writeUTF("Hello Client! Got your message: " + msg);

        dis.close(); dos.close();
        clientSocket.close(); ss.close();
    }
}

// CLIENT — connects to server
public class Client {
    public static void main(String[] args) throws IOException {
        // Connect to server at localhost:9999
        Socket socket = new Socket("localhost", 9999);
        System.out.println("Connected to server");

        DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
        DataInputStream  dis = new DataInputStream(socket.getInputStream());

        // Send message to server
        dos.writeUTF("Hello Server!");

        // Read server response
        String response = dis.readUTF();
        System.out.println("Server says: " + response);

        dos.close(); dis.close();
        socket.close();
    }
}
```

**URL class for HTTP:**
```java
import java.net.*;
import java.io.*;

URL url = new URL("https://api.example.com/data");
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
int responseCode = conn.getResponseCode();
System.out.println("Response Code: " + responseCode);

BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
String line;
StringBuilder response = new StringBuilder();
while ((line = br.readLine()) != null) {
    response.append(line);
}
System.out.println("Response: " + response.toString());
```

## Java 8+ Features

### Lambda Expressions

```java
import java.util.*;
import java.util.stream.*;

// Before Java 8 — anonymous class
Runnable r1 = new Runnable() {
    @Override
    public void run() {
        System.out.println("Running...");
    }
};

// Java 8 — lambda expression (shorter)
Runnable r2 = () -> System.out.println("Running...");

// Lambda with parameters
List<String> names = Arrays.asList("Charlie", "Alice", "Bob");

// Sort with lambda
names.sort((a, b) -> a.compareTo(b));

// forEach with lambda
names.forEach(name -> System.out.println(name));

// Method reference (even shorter)
names.forEach(System.out::println);
```

### Stream API

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

// Filter even numbers, square them, collect to list
List<Integer> result = numbers.stream()
    .filter(n -> n % 2 == 0)       // keep even numbers
    .map(n -> n * n)               // square each
    .collect(Collectors.toList()); // collect result

System.out.println(result);  // [4, 16, 36, 64, 100]

// Sum of all elements
int sum = numbers.stream().reduce(0, Integer::sum);

// Find max
Optional<Integer> max = numbers.stream().max(Integer::compareTo);
max.ifPresent(m -> System.out.println("Max: " + m));

// Count elements greater than 5
long count = numbers.stream().filter(n -> n > 5).count();
System.out.println("Count > 5: " + count);   // 5

// Stream from a list of strings — find names starting with A
List<String> names = Arrays.asList("Alice", "Bob", "Andrew", "Charlie");
List<String> aNames = names.stream()
    .filter(name -> name.startsWith("A"))
    .sorted()
    .collect(Collectors.toList());
System.out.println(aNames);  // [Alice, Andrew]
```

### Optional

```java
// Avoids NullPointerException
Optional<String> opt1 = Optional.of("Hello");
Optional<String> opt2 = Optional.empty();

System.out.println(opt1.isPresent());              // true
System.out.println(opt1.get());                    // Hello
System.out.println(opt2.orElse("Default"));        // Default
opt1.ifPresent(s -> System.out.println(s.toUpperCase()));  // HELLO
```

## Design Patterns

### Singleton Pattern

```java
// Only ONE instance of the class can exist
public class DatabaseConnection {
    private static DatabaseConnection instance;
    private String connectionString;

    private DatabaseConnection(String connStr) {
        this.connectionString = connStr;
        System.out.println("Database connected: " + connStr);
    }

    // Synchronized to prevent race conditions in multithreaded environment
    public static synchronized DatabaseConnection getInstance(String connStr) {
        if (instance == null) {
            instance = new DatabaseConnection(connStr);
        }
        return instance;
    }

    public void query(String sql) {
        System.out.println("Executing: " + sql);
    }
}

// Usage
DatabaseConnection db1 = DatabaseConnection.getInstance("jdbc:mysql://localhost/myapp");
DatabaseConnection db2 = DatabaseConnection.getInstance("jdbc:mysql://localhost/myapp");
System.out.println(db1 == db2);  // true — same object
```

### Factory Pattern

```java
interface Shape {
    void draw();
}

class Circle    implements Shape { @Override public void draw() { System.out.println("Drawing Circle"); } }
class Rectangle implements Shape { @Override public void draw() { System.out.println("Drawing Rectangle"); } }
class Triangle  implements Shape { @Override public void draw() { System.out.println("Drawing Triangle"); } }

// Factory — creates objects without exposing instantiation logic
class ShapeFactory {
    public static Shape createShape(String type) {
        switch (type.toLowerCase()) {
            case "circle":    return new Circle();
            case "rectangle": return new Rectangle();
            case "triangle":  return new Triangle();
            default: throw new IllegalArgumentException("Unknown shape: " + type);
        }
    }
}

// Client code doesn't know which class is instantiated
Shape s = ShapeFactory.createShape("circle");
s.draw();   // Drawing Circle
```

## JVM Internals

```
JVM Components:
  ClassLoader       → loads .class files
  Memory Areas:
    Method Area     → class metadata, static variables
    Heap            → all objects (garbage collected)
    Stack           → method calls, local variables (per thread)
    PC Register     → current instruction pointer (per thread)
    Native Stack    → native method stack (per thread)
  Execution Engine:
    Interpreter     → executes bytecode line by line
    JIT Compiler    → compiles hot code to native machine code
    Garbage Collector → automatic memory management
```

**Garbage Collection process (from notes):**
1. JVM sends **Thread Goodbye Notification (TGN)** to thread when object unreferenced
2. JVM hands over TGN to background thread (Garbage Collector)
3. GC collects unreferenced objects and frees memory
4. Java program stops execution after GC completes its work

```java
// Destructor equivalent in Java — finalize() (deprecated in Java 9+)
class Test {
    Test()  { System.out.println("Constructor Execution..."); }

    @Override
    protected void finalize() throws Throwable {
        System.out.println("Destructor Execution...");
    }
}

// Checking reference count
import java.lang.ref.*;
// sys.getrefcount(objectreference) — Python equivalent doesn't exist in Java
// Java tracks references internally for GC

// Better: use WeakReference to allow GC
WeakReference<Test> weakRef = new WeakReference<>(new Test());
System.gc();   // suggest GC run (not guaranteed)
```

## Interview Questions from Notes

**Q: What is the difference between Error and Exception?**
Error is a serious problem at JVM level (StackOverflowError, OutOfMemoryError) — should not be caught. Exception is a recoverable runtime condition — should be handled with try-catch.

**Q: What is the difference between checked and unchecked exceptions?**
Checked exceptions are direct subclasses of `java.lang.Exception` — compiler forces you to handle them. Unchecked exceptions are subclasses of `RuntimeException` — compiler does NOT force you to handle them.

**Q: Why is it not recommended to call thread.run() directly?**
Calling `run()` directly executes in the current thread — no new thread is created. Call `start()` — JVM creates a new thread, allocates memory, and then calls `run()` on that new thread.

**Q: What happens internally when an exception occurs?**
1. JVM detects the abnormal condition
2. JVM identifies the exception type (e.g., ArithmeticException for /0)
3. JVM checks if Java exception API has appropriate exception subclass
4. If yes, creates an object of that exception class
5. JVM generates system error message
6. Programmer can catch this and convert to user-friendly message

**Q: When is `finally` block NOT executed?**
When `System.exit()` is called, or when the JVM crashes (OutOfMemoryError, StackOverflowError).
