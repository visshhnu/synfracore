# C Programming — Advanced

## File I/O

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    // Write to file
    FILE *fp = fopen("data.txt", "w");  // "w"=write, "r"=read, "a"=append
    if (!fp) { perror("fopen"); return 1; }

    fprintf(fp, "Name: Alice\nAge: 20\n");
    fclose(fp);

    // Read from file
    fp = fopen("data.txt", "r");
    char buffer[100];
    while (fgets(buffer, sizeof(buffer), fp)) {
        printf("%s", buffer);
    }
    fclose(fp);

    // Binary file I/O
    typedef struct { int id; float score; } Record;
    Record rec = {1, 95.5f};

    fp = fopen("data.bin", "wb");
    fwrite(&rec, sizeof(Record), 1, fp);
    fclose(fp);

    Record read_rec;
    fp = fopen("data.bin", "rb");
    fread(&read_rec, sizeof(Record), 1, fp);
    printf("ID: %d, Score: %.1f\n", read_rec.id, read_rec.score);
    fclose(fp);

    return 0;
}
```

## C Cheatsheet + Interview

```c
// ── PRINTF FORMAT SPECIFIERS ──────────────────────────────
%d   int          %ld   long         %lld  long long
%f   float        %lf   double       %Lf   long double
%c   char         %s    string       %p    pointer
%x   hex          %o    octal        %e    scientific
%zu  size_t       %-10d left-align   %05d  zero-pad

// ── COMMON PATTERNS ───────────────────────────────────────
// Swap
temp = a; a = b; b = temp;
// Or: a ^= b; b ^= a; a ^= b; (XOR swap, no temp)

// Check bit n
if (num & (1 << n)) { /* bit n is set */ }

// Set bit n
num |= (1 << n);

// Clear bit n
num &= ~(1 << n);
```

**Interview: What is a dangling pointer?**
A pointer that points to memory that has been freed. Accessing it causes undefined behavior (crash, data corruption). Prevent by: setting pointer to NULL after free, not returning pointers to local variables, using tools like valgrind to detect memory errors.

**Interview: What is the difference between `malloc` and `calloc`?**
`malloc(n)` allocates n bytes — uninitialized (contains garbage). `calloc(count, size)` allocates count*size bytes AND initializes all to zero. `calloc` is safer but slightly slower. `realloc(ptr, new_size)` resizes an existing allocation.

**Interview: What is a memory leak?**
When allocated memory is never freed. The process uses more and more memory until it crashes or is killed. In C: every `malloc`/`calloc`/`realloc` must have a corresponding `free`. Use valgrind or AddressSanitizer to detect leaks.
