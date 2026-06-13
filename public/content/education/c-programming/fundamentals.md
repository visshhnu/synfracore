# C Programming — Fundamentals

## Basic Structure and Syntax

```c
#include <stdio.h>    // Standard Input/Output library
#include <stdlib.h>   // Memory allocation, conversions
#include <string.h>   // String operations

int main() {          // Entry point — every C program starts here
    // Variables
    int age = 20;
    float gpa = 8.5f;
    double pi = 3.14159265358979;
    char grade = 'A';
    char name[] = "Alice";   // String = char array + null terminator

    // Print formatted output
    printf("Name: %s, Age: %d, GPA: %.2f\n", name, age, gpa);
    // Format specifiers: %d=int %f=float %lf=double %c=char %s=string

    // Input
    int num;
    scanf("%d", &num);   // & is the address-of operator

    return 0;   // 0 = success, non-zero = error
}
```

## Operators and Control Flow

```c
// Arithmetic: + - * / % (modulo)
int a = 17, b = 5;
printf("%d %d %d\n", a/b, a%b, -a%b);  // 3 2 -2

// Comparison: == != < > <= >=
// Logical: && (AND) || (OR) ! (NOT)
// Bitwise: & | ^ ~ << >>
printf("%d\n", 5 & 3);   // 001 = 1 (AND)
printf("%d\n", 5 | 3);   // 111 = 7 (OR)
printf("%d\n", 1 << 3);  // 8 (left shift = multiply by 2^3)

// If-else
if (a > b) printf("a is larger\n");
else if (a == b) printf("equal\n");
else printf("b is larger\n");

// Switch
int day = 3;
switch (day) {
    case 1: printf("Monday\n"); break;
    case 2: printf("Tuesday\n"); break;
    case 3: printf("Wednesday\n"); break;
    default: printf("Other\n");
}

// Loops
for (int i = 1; i <= 5; i++) printf("%d ", i);  // 1 2 3 4 5

int n = 10;
while (n > 0) { printf("%d ", n); n -= 3; }  // 10 7 4 1

int x = 0;
do { printf("%d ", x); x++; } while (x < 3); // runs once minimum
```

## Pointers — The Heart of C

```c
int value = 42;
int *ptr = &value;   // ptr holds the ADDRESS of value
                     // & = address-of operator
                     // * = dereference (get value at address)

printf("Value: %d\n",  value);   // 42
printf("Address: %p\n", ptr);    // e.g., 0x7fff5fbff5ac
printf("Via ptr: %d\n", *ptr);   // 42 (dereference)

*ptr = 100;          // Modify value THROUGH the pointer
printf("%d\n", value); // 100 — value changed!

// Pointer arithmetic
int arr[] = {10, 20, 30, 40, 50};
int *p = arr;        // Points to arr[0]
printf("%d\n", *p);        // 10
printf("%d\n", *(p + 1));  // 20 — next int in memory
printf("%d\n", *(p + 2));  // 30

p++;                 // Move pointer to next element
printf("%d\n", *p); // 20

// NULL pointer — pointer to nothing (safe default)
int *safe = NULL;
if (safe != NULL) *safe = 5;  // Safe check before dereference
```

## Functions and Scope

```c
#include <stdio.h>

// Function prototype (declare before use)
int factorial(int n);
void swap(int *a, int *b);

int main() {
    printf("%d\n", factorial(5));  // 120

    int x = 10, y = 20;
    swap(&x, &y);  // Pass addresses to modify originals
    printf("x=%d y=%d\n", x, y);  // x=20 y=10

    return 0;
}

// Recursive function
int factorial(int n) {
    if (n <= 1) return 1;     // Base case
    return n * factorial(n-1); // Recursive case
}

// Pass by reference using pointers
void swap(int *a, int *b) {
    int temp = *a;  // Save value at address a
    *a = *b;        // Put value of b into address a
    *b = temp;      // Put saved value into address b
}
```
