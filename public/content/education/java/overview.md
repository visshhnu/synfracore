# Java — Overview

## What is Java?

Java is a class-based, object-oriented programming language designed around "write once, run anywhere" (WORA). Java source code compiles to an intermediate form called **bytecode**, which runs on the **Java Virtual Machine (JVM)** rather than directly on the underlying hardware — that's what makes the same compiled `.class` file run unchanged on Windows, Linux, or macOS, as long as each has a JVM installed.

Released in 1995 by Sun Microsystems (now owned by Oracle), Java remains one of the most widely used languages in the world — enterprise backend systems, Android apps, and large parts of the big-data ecosystem (Hadoop, Spark) are built on it.

## JDK vs. JRE vs. JVM — A Distinction Worth Getting Right

These three terms get confused constantly, and interviewers ask about the distinction specifically because it reveals whether you actually understand the Java toolchain, not just the language:

| Term | What It Is |
|---|---|
| **JVM (Java Virtual Machine)** | The runtime engine that executes bytecode. Platform-specific — a Windows JVM and a Linux JVM are different programs, but both run the same `.class` files. |
| **JRE (Java Runtime Environment)** | JVM + the standard class libraries needed to *run* Java programs. If you only need to run compiled Java programs, JRE is enough. |
| **JDK (Java Development Kit)** | JRE + the compiler (`javac`), debugger, and other tools needed to *write and build* Java programs. If you're developing, you need the JDK. |

In practice today, most installations just ship the JDK (which includes everything), so this distinction matters more for understanding *what each tool does* than for choosing what to install.

## Why Learn Java?

- **Large, stable job market** — banking, insurance, and enterprise software companies run heavily on Java, and that demand has stayed consistent for decades
- **Android development** — Java (alongside Kotlin) is a primary language for native Android apps
- **Enterprise frameworks** — Spring Boot and Jakarta EE power a large share of production backend systems
- **Strong static typing** — the compiler catches many classes of errors before the program ever runs, which matters a lot when you're learning
- **DSA and placement interviews** — Java is one of the most commonly used languages for data structures and algorithms practice and coding-round interviews, alongside C++ and Python
- **Mature tooling** — IntelliJ IDEA, Eclipse, Maven, and Gradle give you a genuinely productive development environment, not just a text editor and a compiler

## Java Versions

| Version | Year | Key Features |
|---|---|---|
| Java 8 LTS | 2014 | Lambda expressions, Stream API, `Optional` |
| Java 11 LTS | 2018 | HTTP client, local variable type inference (`var`) |
| Java 17 LTS | 2021 | Records, sealed classes, pattern matching for `switch` |
| Java 21 LTS | 2023 | Virtual threads, sequenced collections |

**LTS (Long-Term Support) versions** — 8, 11, 17, 21 — receive updates and security patches for years after release, which is why production systems standardize on them rather than every new release. For new learning and new projects, Java 17 or 21 is the reasonable default.

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

# Verify both are installed correctly
javac -version   # Java compiler (part of the JDK)
java -version    # Java runtime (JVM)
```

## Hello World, With the Compile-Then-Run Cycle Made Explicit

```java
// HelloWorld.java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        // Variables
        String name = "SynfraCore";
        int year = 2026;
        double price = 99.99;

        // String formatting
        System.out.printf("Learning Java at %s in %d%n", name, year);
        System.out.println("Price: ₹" + price);
    }
}
```

```bash
# Compile and run — two separate steps, unlike an interpreted language
javac HelloWorld.java    # Compiles source -> HelloWorld.class (bytecode)
java HelloWorld          # JVM loads and executes the bytecode
# Output: Hello, World!
```

This two-step compile-then-run cycle is worth internalizing early: `javac` never produces something directly executable by your OS — it produces bytecode, which only the JVM (invoked via the `java` command) can run. This is the mechanical reason Java code is portable across operating systems.

## Where Java Is Actually Used

- **Enterprise backend systems** — most large banks, insurers, and e-commerce platforms run significant Java backends, often via Spring Boot
- **Android app development** — Java remains a first-class Android language alongside Kotlin
- **Big data tooling** — Hadoop and large parts of the Spark ecosystem are written in or built for the JVM
- **Competitive programming and coding interviews** — Java's standard library (especially the Collections Framework) makes it a common choice for DSA practice and placement interview rounds, right alongside C++ and Python

## Course Sections
- **Fundamentals** — variables, control flow, methods, OOP basics (classes, objects, encapsulation)
- **Intermediate** — inheritance, polymorphism, interfaces, abstract classes, exception handling, Collections Framework
- **Advanced** — multithreading, Spring Boot, JVM tuning, design patterns
- **Labs** — coding exercises with JUnit testing
- **Interview** — the most commonly asked Java interview questions, with real explanations, not just answers to memorize
