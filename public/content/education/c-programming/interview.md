# C Programming Interview Questions

## Core Concepts

**Q: Explain pointers in C.**

A pointer stores the memory address of another variable. The foundation of C's power and complexity.

```c
int x = 42;
int *ptr = &x;    // ptr holds address of x (&x = "address of x")

printf("%d", x);   // 42  (value of x)
printf("%p", ptr); // 0x7fff... (address stored in ptr)
printf("%d", *ptr);// 42  (*ptr = "dereference" = value at address)

*ptr = 100;        // Modifies x through pointer
printf("%d", x);   // 100

// Pointer arithmetic
int arr[] = {10, 20, 30, 40};
int *p = arr;      // Points to arr[0]
printf("%d", *(p+1)); // 20 (arr[1])
p++;               // Now points to arr[1]
```

**Null pointer**: `int *p = NULL;` — pointer that points to nothing. Always check before dereferencing.
**Dangling pointer**: Pointer to freed/stack memory. Use-after-free bug. Set to NULL after freeing.
**Void pointer**: `void *ptr` — generic pointer. Must cast before dereferencing.

---

**Q: Memory management — stack vs heap.**

```c
// Stack allocation: automatic, fast, limited (~1-8MB)
void function() {
    int x = 10;     // Stack allocated, freed when function returns
    int arr[100];   // Stack array
}   // x and arr automatically freed here

// Heap allocation: manual, large, persistent
int *ptr = malloc(10 * sizeof(int));  // Allocate array of 10 ints
if (ptr == NULL) { /* handle allocation failure */ }

ptr[0] = 42;       // Use the allocated memory
free(ptr);         // MUST manually free! Memory leak if forgotten
ptr = NULL;        // Prevent dangling pointer

// calloc: allocate + zero-initialise
int *arr = calloc(10, sizeof(int));  // 10 ints, all zero

// realloc: resize existing allocation
int *bigger = realloc(ptr, 20 * sizeof(int));
```

**Common memory bugs:**
- Memory leak: malloc without free
- Buffer overflow: write beyond allocated size
- Double free: free() called twice on same pointer
- Use-after-free: access memory after free()

---

**Q: Structures and typedef.**

```c
// Struct: group related variables
struct Student {
    char name[50];
    int age;
    float gpa;
};

// typedef: create type alias
typedef struct Student Student;
// Or combined:
typedef struct {
    char name[50];
    int age;
    float gpa;
} Student;

// Usage
Student s1;
strcpy(s1.name, "Alice");
s1.age = 20;
s1.gpa = 9.5;

// Pointer to struct
Student *sp = &s1;
printf("%s", sp->name);  // Arrow (->) for pointer to struct
printf("%d", (*sp).age); // Equivalent but arrow is conventional
```

---

**Q: Functions — pass by value vs pass by reference.**

```c
// C is always pass-by-value
// To modify caller's variable, pass its address (pointer)

void modify_by_value(int x) {
    x = 100;  // Modifies local copy only
}

void modify_by_reference(int *x) {
    *x = 100;  // Modifies the original variable
}

int main() {
    int n = 50;
    modify_by_value(n);      // n is still 50
    modify_by_reference(&n); // n is now 100
}
```

---

**Q: Preprocessor directives and header files.**

```c
#include <stdio.h>    // System header (angle brackets)
#include "myheader.h" // User header (quotes)

#define MAX_SIZE 100         // Constant (no type, no memory)
#define SQUARE(x) ((x)*(x)) // Macro function (use parentheses!)

#ifdef DEBUG
    printf("Debug mode
");
#endif

// Header guards (prevent double inclusion)
#ifndef MYHEADER_H
#define MYHEADER_H
// declarations...
#endif
```

## Revision Notes
```
POINTERS: store addresses. & = address-of. * = dereference.
Null pointer: points to nothing. Dangling: points to freed memory.
Pointer arithmetic: ptr++ moves by sizeof(type)

MEMORY:
Stack: automatic, limited size. Functions, local vars.
Heap: manual malloc/free, unlimited. Must free every malloc!
Memory bugs: leak (no free), overflow (write beyond), double-free, use-after-free

STRUCTS: group related data. Access with . (direct) or -> (pointer to struct)
PASS BY VALUE: C always copies. To modify: pass &var (pointer)

PREPROCESSOR: #define, #include, #ifdef
Header guards: #ifndef / #define / #endif (prevent double inclusion)

KEY FUNCTIONS:
malloc/calloc/realloc/free | strcpy/strcat/strlen/strcmp | printf/scanf
```
