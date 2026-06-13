# Java — Advanced

## Multithreading and Concurrency

```java
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

// ExecutorService — managed thread pool (never use raw Thread in production)
ExecutorService pool = Executors.newFixedThreadPool(
    Runtime.getRuntime().availableProcessors()
);

// Submit tasks
Future<Integer> future = pool.submit(() -> {
    // Expensive computation
    return computeResult();
});

int result = future.get(5, TimeUnit.SECONDS); // timeout after 5s
pool.shutdown();
pool.awaitTermination(10, TimeUnit.SECONDS);

// CompletableFuture — non-blocking async pipeline
CompletableFuture<String> cf = CompletableFuture
    .supplyAsync(() -> fetchUserFromDB(userId))     // async task 1
    .thenApply(user -> enrichWithMetadata(user))    // transform result
    .thenCompose(user -> fetchOrdersAsync(user))    // chain another async
    .exceptionally(ex -> handleError(ex))           // error handler
    .thenApply(orders -> formatResponse(orders));   // final transform

// Atomic operations (lock-free thread safety)
AtomicInteger counter = new AtomicInteger(0);
counter.incrementAndGet();                  // thread-safe ++
counter.compareAndSet(expected, newValue);  // CAS operation

// Synchronized — only one thread at a time
public synchronized void safeMethod() { /* critical section */ }

// ReentrantLock — more control than synchronized
ReentrantLock lock = new ReentrantLock();
if (lock.tryLock(100, TimeUnit.MILLISECONDS)) {
    try {
        // critical section
    } finally {
        lock.unlock(); // always in finally!
    }
}
```

## Design Patterns

```java
// ── SINGLETON ─────────────────────────────────────────────
// Thread-safe lazy initialization
public class DatabaseConnection {
    private static volatile DatabaseConnection instance;

    private DatabaseConnection() {}  // private constructor

    public static DatabaseConnection getInstance() {
        if (instance == null) {
            synchronized (DatabaseConnection.class) {
                if (instance == null) {  // double-checked locking
                    instance = new DatabaseConnection();
                }
            }
        }
        return instance;
    }
}

// ── BUILDER ───────────────────────────────────────────────
public class HttpRequest {
    private final String url;
    private final String method;
    private final Map<String, String> headers;
    private final String body;
    private final int timeout;

    private HttpRequest(Builder b) {
        this.url     = b.url;
        this.method  = b.method;
        this.headers = b.headers;
        this.body    = b.body;
        this.timeout = b.timeout;
    }

    public static class Builder {
        private String url;
        private String method = "GET";
        private Map<String, String> headers = new HashMap<>();
        private String body;
        private int timeout = 30;

        public Builder url(String url)       { this.url = url; return this; }
        public Builder method(String method) { this.method = method; return this; }
        public Builder header(String k, String v) { headers.put(k, v); return this; }
        public Builder body(String body)     { this.body = body; return this; }
        public Builder timeout(int t)        { this.timeout = t; return this; }
        public HttpRequest build()           { return new HttpRequest(this); }
    }
}

// Usage
HttpRequest req = new HttpRequest.Builder()
    .url("https://api.example.com/users")
    .method("POST")
    .header("Content-Type", "application/json")
    .header("Authorization", "Bearer " + token)
    .body(jsonBody)
    .timeout(60)
    .build();
```
