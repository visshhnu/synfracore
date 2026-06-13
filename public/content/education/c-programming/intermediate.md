# C Programming — Intermediate

## Arrays and Strings

```c
#include <stdio.h>
#include <string.h>

// Arrays
int arr[5] = {10, 20, 30, 40, 50};
int n = sizeof(arr) / sizeof(arr[0]);  // 5 — length of array

// 2D arrays (matrix)
int matrix[3][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Print matrix
for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++)
        printf("%d ", matrix[i][j]);
    printf("\n");
}

// Strings in C
char str1[] = "Hello";            // Array of chars + null terminator
char str2[20];                    // Buffer for input
scanf("%s", str2);                // Read word (stops at space)
fgets(str2, sizeof(str2), stdin); // Read line (safer)

// String functions
printf("%zu\n", strlen(str1));       // 5 (length, excluding \0)
strcpy(str2, str1);                  // Copy str1 into str2
strcat(str2, " World");              // Append to str2
strcmp("abc", "abd");                // <0 (lexicographic compare)
strstr(str2, "World");               // Pointer to first occurrence

// String to number
int num = atoi("42");               // string to int
double d = atof("3.14");            // string to double
char buf[20];
sprintf(buf, "%d", num);            // int to string
```

## Structures

```c
#include <stdio.h>
#include <string.h>

// Define a structure (user-defined data type)
struct Student {
    char name[50];
    int rollNo;
    float cgpa;
};

// typedef for convenience
typedef struct {
    char brand[30];
    int year;
    float price;
} Car;

int main() {
    // Create struct variable
    struct Student s1;
    strcpy(s1.name, "Alice");
    s1.rollNo = 101;
    s1.cgpa = 8.7f;

    printf("%s: Roll %d, CGPA %.2f\n", s1.name, s1.rollNo, s1.cgpa);

    // Struct initialization
    struct Student s2 = {"Bob", 102, 9.1f};

    // Array of structs
    Car cars[] = {{"Toyota", 2020, 850000}, {"Honda", 2022, 1200000}};
    for (int i = 0; i < 2; i++)
        printf("%s (%d): Rs %.0f\n", cars[i].brand, cars[i].year, cars[i].price);

    // Pointer to struct
    struct Student *ptr = &s1;
    printf("%s\n", ptr->name);   // Use -> to access via pointer
    printf("%.2f\n", (*ptr).cgpa); // Equivalent but verbose

    return 0;
}
```

## Dynamic Memory Allocation

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int n = 5;

    // malloc — allocate n integers, returns void* (uninitialized)
    int *arr = (int*)malloc(n * sizeof(int));
    if (arr == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    for (int i = 0; i < n; i++) arr[i] = i * 10;

    // realloc — resize allocation
    n = 10;
    arr = (int*)realloc(arr, n * sizeof(int));
    for (int i = 5; i < n; i++) arr[i] = i * 10;

    // calloc — allocate AND zero-initialize
    int *zeroed = (int*)calloc(n, sizeof(int)); // all zeros

    // ALWAYS free what you malloc
    free(arr);
    free(zeroed);
    arr = NULL;    // Good practice: null after free

    return 0;
}

// Linked list using dynamic allocation
typedef struct Node {
    int data;
    struct Node *next;
} Node;

Node* createNode(int data) {
    Node *node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    return node;
}

void printList(Node *head) {
    while (head) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}
