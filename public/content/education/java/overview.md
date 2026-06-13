# Java Programming

Java is one of the most widely used programming languages in the world — powering Android apps, enterprise backends, financial systems, and big data tools. It runs on the JVM (Java Virtual Machine), making it platform-independent: "write once, run anywhere."

## Why Learn Java

- **Highest job demand** in India — banking, insurance, e-commerce, IT services (TCS, Infosys, Wipro, HCL all use Java heavily)
- **Android development** — primary language for Android apps
- **Spring Boot** — most popular backend framework for building REST APIs
- **Placement interviews** — widely accepted for DSA coding rounds
- **Big Data** — Hadoop, Kafka, Spark all written in Java

## JVM Architecture

```
Java Source (.java)
       ↓ javac compiler
Java Bytecode (.class)
       ↓ JVM loads and executes
   JVM (any OS)
  ├── Class Loader
  ├── JIT Compiler (bytecode → native machine code at runtime)
  ├── Heap (objects live here)
  └── Stack (method calls, local variables)
```

## Hello World

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

```bash
javac HelloWorld.java   # Compile → HelloWorld.class
java HelloWorld         # Run: prints Hello, World!
```
