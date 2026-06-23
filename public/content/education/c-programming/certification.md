# C Programming Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **C Programming Certificate** | NPTEL | Free | Proctored exam |
| **C Programming Specialist** | Certiport | $130 | MCQ + coding |
| **IBM C/C++ Developer** | IBM/Coursera | ~$300 | Project-based |
| **GATE CS** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |

C is foundational — tested heavily in GATE CS, placements, and embedded systems roles.

---

## Core Topics

```c
// POINTERS AND MEMORY
int x = 10;
int *p = &x;        // p holds address of x
printf("%d", *p);   // dereference: prints 10
*p = 20;            // modifies x through pointer

// POINTER ARITHMETIC
int arr[] = {10, 20, 30, 40};
int *p = arr;        // points to arr[0]
printf("%d", *(p+2)); // arr[2] = 30
p++;                  // now points to arr[1]

// DYNAMIC MEMORY
int *arr = (int*)malloc(n * sizeof(int));
if (arr == NULL) { perror("malloc"); exit(1); }
arr[0] = 10;
free(arr);   // always free to avoid memory leaks
arr = NULL;  // prevent dangling pointer

int *arr2 = (int*)calloc(n, sizeof(int));  // zero-initialized
arr2 = (int*)realloc(arr2, 2*n * sizeof(int));  // resize

// STRUCTURES
struct Student {
    char name[50];
    int roll;
    float gpa;
};
struct Student s1 = {"Alice", 101, 9.2};
struct Student *sp = &s1;
printf("%s", sp->name);   // arrow operator for pointer to struct

// LINKED LIST (common exam topic)
struct Node {
    int data;
    struct Node *next;
};

struct Node* createNode(int data) {
    struct Node* n = (struct Node*)malloc(sizeof(struct Node));
    n->data = data;
    n->next = NULL;
    return n;
}

// FILE I/O
FILE *fp = fopen("data.txt", "r");
if (fp == NULL) { perror("fopen"); return 1; }
char line[256];
while (fgets(line, sizeof(line), fp)) {
    printf("%s", line);
}
fclose(fp);

// STRINGS
char s[] = "hello";
strlen(s);      // 5 (not including null)
strcpy(dst, s); // unsafe — use strncpy
strcmp(s1, s2); // 0=equal, <0=s1<s2, >0=s1>s2
strcat(s1, s2); // append s2 to s1 (ensure s1 has space)

// COMMON PITFALLS
// 1. sizeof(arr)/sizeof(arr[0])  — find array length
// 2. int *p; *p = 5;             — uninitialized pointer (segfault)
// 3. double free                 — undefined behaviour
// 4. off-by-one in loops         — i < n, not i <= n
// 5. integer overflow            — use long or check before arithmetic
```

---

## GATE CS Important Topics

```
POINTERS: address arithmetic, pointer to pointer, function pointers
MEMORY: stack vs heap, malloc/calloc/realloc/free, memory leaks
STORAGE CLASSES: auto | register | static | extern
SCOPE AND LIFETIME: block scope, file scope, static variables
STRUCTURES AND UNIONS: size, padding, bit fields
BIT MANIPULATION: AND(&) OR(|) XOR(^) NOT(~) shifts(<< >>)
  x & (x-1): clear lowest set bit  |  x & (-x): isolate lowest bit
  Check bit n: (x >> n) & 1        |  Set bit n: x | (1 << n)
RECURSION: base case + recursive case, stack depth
FILE I/O: fopen/fclose/fread/fwrite/fprintf/fscanf/fgets
PREPROCESSOR: #define #include #ifdef #ifndef #endif
```

---

## Study Resources

- **NPTEL C Programming** — free IIT course with certification
- **The C Programming Language** (Kernighan & Ritchie) — the definitive book
- **GFG C Programming** (geeksforgeeks.org/c-programming-language) — free, exam-oriented
- **CS50x** (cs50.harvard.edu) — free Harvard course, starts with C

## Revision Notes
```
POINTER BASICS: int *p = &x | *p = dereference | p++ = next element
MEMORY: malloc (uninitialized) | calloc (zero-init) | realloc (resize) | free
ALWAYS: check NULL after malloc | free every malloc | set pointer NULL after free

STRUCTURES: struct s; s.field or sp->field (pointer)
STRINGS: null-terminated char arrays | strlen excludes null | strcpy is unsafe

GATE FOCUS: pointer arithmetic | sizeof | storage classes | bit manipulation
PLACEMENT FOCUS: linked lists | sorting | string manipulation | recursion
```
