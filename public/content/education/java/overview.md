# Java — Overview

## What is Java?

Java is a class-based, object-oriented programming language designed to be "write once, run anywhere" (WORA). Java code compiles to bytecode that runs on the Java Virtual Machine (JVM), making it platform-independent.

Released in 1995 by Sun Microsystems (now Oracle), Java remains one of the most popular languages in the world — used for enterprise backend systems, Android apps, big data (Hadoop, Spark), and financial systems.

## Why Learn Java?

- **Huge job market** — most banking, insurance, and enterprise companies use Java
- **Android development** — primary language for Android (alongside Kotlin)
- **Enterprise frameworks** — Spring Boot, Jakarta EE power millions of applications
- **Strong typing** — catches errors at compile time
- **Excellent tooling** — IntelliJ IDEA, Eclipse, Maven, Gradle

## Java Versions

| Version | Year | Key Features |
|---|---|---|
| Java 8 LTS | 2014 | Lambda expressions, Stream API, Optional |
| Java 11 LTS | 2018 | HTTP client, local variable type inference |
| Java 17 LTS | 2021 | Records, sealed classes, pattern matching |
| Java 21 LTS | 2023 | Virtual threads, sequenced collections |

**LTS versions (8, 11, 17, 21)** are supported for years — use Java 17 or 21 for new projects.

## Install Java

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install openjdk-21-jdk
java -version

# macOS (Homebrew)
brew install openjdk@21
java -version

# Windows: download from adoptium.net (Temurin OpenJDK)

# Verify
javac -version   # Java compiler
java -version    # Java runtime
```

## Hello World

```java
// HelloWorld.java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        // Variables
        String name = "SynfraCore";
        int year = 2025;
        double price = 99.99;

        // String formatting
        System.out.printf("Learning Java at %s in %d%n", name, year);
        System.out.println("Price: ₹" + price);
    }
}
```

```bash
# Compile and run
javac HelloWorld.java    # Creates HelloWorld.class
java HelloWorld          # Runs the bytecode
# Output: Hello, World!
```

## Java in the DevOps World

Java is everywhere in the infrastructure you manage:
- **Jenkins** is written in Java — understanding Java helps customize it
- **Elasticsearch** is Java — JVM tuning is critical for performance
- **Kafka** is Java/Scala — understanding the JVM helps with heap tuning
- **Spring Boot microservices** — most enterprise microservices are Spring Boot

## Course Sections
- **Fundamentals** — variables, control flow, methods, OOP basics
- **Intermediate** — collections, generics, exception handling, file I/O
- **Advanced** — multithreading, Spring Boot, JVM tuning, design patterns
- **Labs** — coding exercises with JUnit testing
- **Interview** — 50 most asked Java interview questions
