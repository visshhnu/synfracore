export const runtime = "edge";

export type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

export type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

export type TechLabs = {
  [techSlug: string]: Lab[];
};

export const labs_education: TechLabs = {
"java": [
  {
    id: "java-lab-1",
    title: "Java Basics: Variables, Control Flow, Methods",
    difficulty: "Beginner",
    duration: "20 min",
    tools: ["java", "javac"],
    objective: "Write and run a Java program covering core syntax — types, loops, methods, OOP",
    interface: "code-editor",
    steps: [
      {
        id: "j1-1", title: "Create and run HelloWorld", type: "code",
        description: "The classic first program. Notice Java requires a class, a main method, and matching filename.",
        language: "java",
        code: `public class HelloWorld {
    public static void main(String[] args) {
        // Print to console
        System.out.println("Hello, World!");
        
        // Variables
        int age = 20;
        double gpa = 8.5;
        String name = "Alice";
        boolean isActive = true;
        
        // String formatting
        System.out.printf("Name: %s, Age: %d, GPA: %.2f%n", name, age, gpa);
        
        // String concatenation
        System.out.println("Student: " + name + " (GPA: " + gpa + ")");
        
        // Math operations
        int a = 17, b = 5;
        System.out.println("17 / 5 = " + (a / b));       // Integer division: 3
        System.out.println("17 % 5 = " + (a % b));       // Modulo: 2
        System.out.println("17.0 / 5 = " + (17.0 / b)); // Float division: 3.4
    }
}`,
        explanation: "Java is strongly typed — every variable has a declared type. main() is the entry point. System.out.println adds a newline; System.out.print does not.",
      },
      {
        id: "j1-2", title: "Control flow: if, for, while", type: "code",
        description: "Java's control flow is similar to C/C++ — curly braces, semicolons.",
        language: "java",
        code: `public class ControlFlow {
    public static void main(String[] args) {
        // If-else
        int score = 85;
        String grade;
        if (score >= 90)      grade = "A";
        else if (score >= 80) grade = "B";
        else if (score >= 70) grade = "C";
        else                  grade = "F";
        System.out.println("Grade: " + grade);  // B
        
        // For loop: print FizzBuzz
        System.out.print("FizzBuzz: ");
        for (int i = 1; i <= 20; i++) {
            if (i % 15 == 0)      System.out.print("FizzBuzz ");
            else if (i % 3 == 0)  System.out.print("Fizz ");
            else if (i % 5 == 0)  System.out.print("Buzz ");
            else                  System.out.print(i + " ");
        }
        System.out.println();
        
        // Arrays
        int[] numbers = {5, 3, 8, 1, 9, 2, 7};
        int max = numbers[0];
        int sum = 0;
        for (int num : numbers) {   // Enhanced for loop
            if (num > max) max = num;
            sum += num;
        }
        System.out.println("Max: " + max + ", Sum: " + sum + ", Avg: " + (double)sum/numbers.length);
    }
}`,
      },
      {
        id: "j1-3", title: "Classes and Objects", type: "code",
        description: "Define a class with fields, constructors, methods — the core of OOP.",
        language: "java",
        code: `class BankAccount {
    // Fields
    private String owner;
    private double balance;
    private int transactions;
    
    // Constructor
    public BankAccount(String owner, double initialBalance) {
        this.owner = owner;
        this.balance = initialBalance;
        this.transactions = 0;
    }
    
    // Methods
    public void deposit(double amount) {
        if (amount <= 0) throw new IllegalArgumentException("Amount must be positive");
        balance += amount;
        transactions++;
        System.out.printf("Deposited %.2f → Balance: %.2f%n", amount, balance);
    }
    
    public boolean withdraw(double amount) {
        if (amount > balance) {
            System.out.println("Insufficient funds");
            return false;
        }
        balance -= amount;
        transactions++;
        System.out.printf("Withdrew %.2f → Balance: %.2f%n", amount, balance);
        return true;
    }
    
    @Override
    public String toString() {
        return String.format("Account[owner=%s, balance=%.2f, txns=%d]", owner, balance, transactions);
    }
}

public class OOPDemo {
    public static void main(String[] args) {
        BankAccount alice = new BankAccount("Alice", 10000);
        alice.deposit(5000);
        alice.withdraw(2000);
        alice.withdraw(20000);  // Fails
        System.out.println(alice);
    }
}`,
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// C PROGRAMMING
// ═══════════════════════════════════════════════════════

"c-programming": [
  {
    id: "c-lab-1",
    title: "C Pointers and Memory — The Core of C",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["gcc", "valgrind"],
    objective: "Understand pointers, pass-by-reference, and dynamic memory allocation",
    interface: "code-editor",
    steps: [
      {
        id: "c1-1", title: "Pointer basics", type: "code",
        description: "A pointer stores a memory address. This is C's most unique and powerful feature.",
        language: "c",
        code: `#include <stdio.h>

int main() {
    int x = 42;
    int *ptr = &x;     // ptr stores ADDRESS of x (&x = address-of x)
    
    printf("Value of x:        %d\\n",  x);
    printf("Address of x:      %p\\n",  (void*)&x);
    printf("Value of ptr:      %p\\n",  (void*)ptr);  // Same as &x
    printf("Dereferenced ptr:  %d\\n",  *ptr);         // *ptr = value AT that address
    
    // Modify x through the pointer
    *ptr = 100;    // Dereference and assign
    printf("x after *ptr=100: %d\\n", x);  // x is now 100!
    
    // Pointer arithmetic
    int arr[] = {10, 20, 30, 40, 50};
    int *p = arr;   // Points to arr[0]
    
    for (int i = 0; i < 5; i++) {
        printf("arr[%d] = %d (address: %p)\\n", i, *(p+i), (void*)(p+i));
    }
    // Notice each address is 4 bytes apart (size of int)
    
    return 0;
}`,
        explanation: "& = address-of (gives you the pointer). * = dereference (follow the pointer). p+1 moves 4 bytes forward for an int array — pointer arithmetic is aware of the type size.",
      },
      {
        id: "c1-2", title: "Pass by reference with pointers", type: "code",
        description: "C passes everything by value. To modify a variable, pass a pointer to it.",
        language: "c",
        code: `#include <stdio.h>
#include <stdlib.h>

// WRONG: this swap doesn't work (local copies)
void wrong_swap(int a, int b) {
    int temp = a; a = b; b = temp;
}

// CORRECT: pass pointers, modify through them
void swap(int *a, int *b) {
    int temp = *a;  // Save value at address a
    *a = *b;        // Write value at address b into address a
    *b = temp;      // Write saved value into address b
}

// Return multiple values via output parameters
void divide(int numerator, int denominator, int *quotient, int *remainder) {
    *quotient  = numerator / denominator;
    *remainder = numerator % denominator;
}

int main() {
    int x = 10, y = 20;
    
    wrong_swap(x, y);
    printf("After wrong_swap: x=%d, y=%d\\n", x, y);  // Unchanged!
    
    swap(&x, &y);    // Pass addresses
    printf("After swap:       x=%d, y=%d\\n", x, y);  // x=20, y=10
    
    // Multiple return values
    int q, r;
    divide(17, 5, &q, &r);
    printf("17 / 5 = %d remainder %d\\n", q, r);  // 3 remainder 2
    
    return 0;
}`,
      },
      {
        id: "c1-3", title: "Dynamic memory allocation", type: "code",
        description: "malloc/free for manual memory management — power with responsibility.",
        language: "c",
        code: `#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Dynamic array
int* create_array(int size, int init_value) {
    int *arr = (int*)malloc(size * sizeof(int));
    if (arr == NULL) {
        fprintf(stderr, "malloc failed!\\n");
        exit(1);
    }
    for (int i = 0; i < size; i++) arr[i] = init_value;
    return arr;   // Caller MUST free this
}

int main() {
    // Create dynamic array
    int n = 5;
    int *arr = create_array(n, 0);
    
    // Fill with squares
    for (int i = 0; i < n; i++) arr[i] = i * i;
    
    printf("Array: ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\\n");  // 0 1 4 9 16
    
    // Resize with realloc
    n = 8;
    arr = (int*)realloc(arr, n * sizeof(int));
    for (int i = 5; i < n; i++) arr[i] = i * i;
    
    printf("After realloc: ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\\n");  // 0 1 4 9 16 25 36 49
    
    // MUST free — no garbage collector in C
    free(arr);
    arr = NULL;   // Prevent dangling pointer
    
    // Dynamic string
    char *name = (char*)malloc(50 * sizeof(char));
    strcpy(name, "Alice");
    printf("Name: %s\\n", name);
    strcat(name, " Smith");
    printf("Full name: %s\\n", name);
    free(name);
    
    return 0;
}`,
        hint: "Every malloc needs a free. Use valgrind to detect memory leaks: valgrind --leak-check=full ./program",
        explanation: "Memory leak: allocate but never free. Dangling pointer: access after free. Buffer overflow: write past allocated size. Use valgrind or AddressSanitizer to find these.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// C++
// ═══════════════════════════════════════════════════════

"cpp": [
  {
    id: "cpp-lab-1",
    title: "STL: Mastering the Standard Template Library",
    difficulty: "Intermediate",
    duration: "30 min",
    tools: ["g++", "C++17"],
    objective: "Use vector, map, set, priority_queue, and algorithms to solve real problems",
    interface: "code-editor",
    steps: [
      {
        id: "cpp1-1", title: "vector and sorting", type: "code",
        description: "vector is the most-used STL container. Master it completely.",
        language: "cpp",
        code: `#include <bits/stdc++.h>
using namespace std;

int main() {
    // Create and populate vector
    vector<int> nums = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    
    // STL algorithms
    sort(nums.begin(), nums.end());       // Ascending
    cout << "Sorted: ";
    for (int n : nums) cout << n << " "; // 1 2 3 4 5 6 7 8 9
    cout << "\\n";
    
    // Common operations
    cout << "Min: " << *min_element(nums.begin(), nums.end()) << "\\n";
    cout << "Max: " << *max_element(nums.begin(), nums.end()) << "\\n";
    cout << "Sum: " << accumulate(nums.begin(), nums.end(), 0) << "\\n";
    
    // Binary search (on sorted vector)
    int target = 7;
    auto it = lower_bound(nums.begin(), nums.end(), target);
    cout << "Position of " << target << ": " << (it - nums.begin()) << "\\n";
    cout << "Found: " << (binary_search(nums.begin(), nums.end(), target) ? "yes" : "no") << "\\n";
    
    // Vector of pairs: sort by second element
    vector<pair<string,int>> scores = {{"Alice",95}, {"Bob",87}, {"Charlie",92}};
    sort(scores.begin(), scores.end(), [](const auto& a, const auto& b){
        return a.second > b.second;  // Sort by score descending
    });
    
    cout << "\\nLeaderboard:\\n";
    for (int i = 0; i < scores.size(); i++) {
        cout << i+1 << ". " << scores[i].first << ": " << scores[i].second << "\\n";
    }
    
    return 0;
}`,
        explanation: "bits/stdc++.h includes everything (for competitive programming). In production, include only what you need. Lambda [](auto& a, auto& b){ return ...; } is an inline comparator.",
      },
      {
        id: "cpp1-2", title: "map, set, and unordered variants", type: "code",
        description: "Choose the right associative container for your use case.",
        language: "cpp",
        code: `#include <bits/stdc++.h>
using namespace std;

int main() {
    // map: sorted, O(log n) operations
    map<string, int> wordCount;
    string text = "the quick brown fox jumps over the lazy dog the";
    istringstream iss(text);
    string word;
    while (iss >> word) wordCount[word]++;  // auto-initializes to 0
    
    cout << "Word frequencies (sorted):\\n";
    for (auto& [word, count] : wordCount)  // C++17 structured bindings
        cout << "  " << word << ": " << count << "\\n";
    
    // unordered_map: hash, O(1) average — faster for large datasets
    unordered_map<string, int> umap;
    umap["key1"] = 42;
    umap["key2"] = 99;
    cout << "\\numap lookup: " << umap["key1"] << "\\n";
    
    // set: sorted unique elements
    set<int> primes = {2, 3, 5, 7, 11, 13};
    primes.insert(17);
    primes.insert(5);  // Duplicate ignored
    cout << "\\nPrimes: ";
    for (int p : primes) cout << p << " ";
    
    // Find and erase
    if (primes.count(7)) {
        primes.erase(7);
        cout << "\\nRemoved 7. Size: " << primes.size() << "\\n";
    }
    
    // priority_queue: max-heap by default
    priority_queue<int> maxHeap;
    for (int x : {3,1,4,1,5,9,2,6}) maxHeap.push(x);
    
    cout << "\\nTop 3 largest: ";
    for (int i = 0; i < 3; i++) {
        cout << maxHeap.top() << " ";
        maxHeap.pop();
    }
    cout << "\\n";
    
    return 0;
}`,
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// SHELL SCRIPTING
// ═══════════════════════════════════════════════════════
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_education[tech] || [];
}
