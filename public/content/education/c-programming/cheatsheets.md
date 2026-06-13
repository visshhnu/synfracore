# C Programming — Cheatsheet

```c
// ── TYPES & SIZES ─────────────────────────────────────────
char        1 byte   (-128 to 127)
short       2 bytes  (-32768 to 32767)
int         4 bytes  (-2B to 2B)
long        8 bytes  on 64-bit systems
float       4 bytes  (~7 decimal digits)
double      8 bytes  (~15 decimal digits)
sizeof(type)         get size at compile time

// ── POINTERS ──────────────────────────────────────────────
int *p;              // Pointer to int
*p                   // Dereference (get value)
&var                 // Address-of
p++                  // Move to next int (adds 4 bytes)
NULL                 // Pointer to nothing

int **pp;            // Pointer to pointer
void *vp;            // Generic pointer (must cast before deref)

// ── MEMORY ────────────────────────────────────────────────
malloc(n*sizeof(T))  // Allocate n elements (uninitialized)
calloc(n, sizeof(T)) // Allocate n elements (zero-initialized)
realloc(ptr, new_n)  // Resize allocation
free(ptr)            // Release; set ptr = NULL after

// ── STRINGS ───────────────────────────────────────────────
strlen(s)            // Length (excludes \0)
strcpy(dst, src)     // Copy (unsafe — use strncpy)
strncpy(dst, src, n) // Safe copy (max n chars)
strcat(dst, src)     // Append (unsafe — use strncat)
strcmp(s1, s2)       // Compare: <0, 0, >0
strstr(s, sub)       // Find substring, returns pointer or NULL
sprintf(buf, fmt, …) // Write formatted string to buffer

// ── I/O ───────────────────────────────────────────────────
printf("%d %s %.2f\n", i, s, f)
scanf("%d %s", &i, buf)    // & for variables, not arrays
fgets(buf, size, stdin)    // Safe line input
getchar() / putchar(c)
FILE *f = fopen("file", "r/w/a");
fclose(f);
fprintf(f, "...") / fscanf(f, "...")
fgets(buf, n, f) / fputs(str, f)

// ── PREPROCESSOR ──────────────────────────────────────────
#define PI 3.14159
#define MAX(a,b) ((a)>(b)?(a):(b))   // macro with args
#include <stdio.h>                    // system header
#include "myfile.h"                   // local header
#ifdef DEBUG printf("debug\n"); #endif

// ── COMMON IDIOMS ─────────────────────────────────────────
// Array length
int n = sizeof(arr)/sizeof(arr[0]);

// Iterate string
for (int i = 0; str[i] != '\0'; i++) { ... }

// Read until EOF
while (fgets(line, sizeof(line), file)) { ... }

// Swap
int t = a; a = b; b = t;

// Pass array to function (decays to pointer)
void printArr(int *arr, int n) { ... }
printArr(myArr, 5);
```
