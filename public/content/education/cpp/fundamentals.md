# C++ — Fundamentals

## Key Additions Over C

```cpp
#include <iostream>   // cin/cout
#include <string>     // std::string (safer than char arrays)
#include <vector>     // dynamic array
using namespace std;  // avoid writing std:: everywhere

int main() {
    // cin/cout instead of printf/scanf
    int age;
    string name;
    cout << "Enter name and age: ";
    cin >> name >> age;
    cout << "Hello " << name << ", age " << age << endl;

    // string (object, not char array)
    string s = "Hello";
    s += " World";              // Concatenation
    cout << s.length() << endl; // 11
    cout << s.substr(0, 5);     // "Hello"
    s.find("World");            // 6

    // References (alias — unlike pointers, always valid)
    int x = 10;
    int& ref = x;   // ref IS x — not a copy
    ref = 20;
    cout << x;      // 20 — x changed!

    // Default parameters
    return 0;
}

// Function with default parameters
void greet(string name, string greeting = "Hello") {
    cout << greeting << ", " << name << "!\n";
}
// greet("Alice") → "Hello, Alice!"
// greet("Bob", "Hi") → "Hi, Bob!"
```

## Control Flow

C++'s control flow is syntactically identical to C's — this is one of the parts of the "superset" relationship that's most literal:

```cpp
#include <iostream>
using namespace std;

int main() {
    // if-else
    int marks = 78;
    if (marks >= 90) {
        cout << "Grade A\n";
    } else if (marks >= 75) {
        cout << "Grade B\n";
    } else {
        cout << "Grade C\n";
    }

    // for loop
    for (int i = 1; i <= 5; i++) {
        cout << i << " ";
    }
    cout << endl;

    // Range-based for loop (C++11) — cleaner than C's index-based loop
    // when you don't need the index itself
    int scores[] = {90, 85, 78, 92};
    for (int s : scores) {
        cout << s << " ";
    }
    cout << endl;

    // while loop
    int n = 5;
    while (n > 0) {
        cout << n << " ";
        n--;
    }
    cout << endl;

    // do-while — body runs at least once, condition checked after
    int x = 10;
    do {
        cout << x << " ";
        x += 5;
    } while (x < 10);  // condition is false immediately, but "10 " still prints once

    // switch
    int day = 3;
    switch (day) {
        case 1: cout << "Monday\n"; break;
        case 2: cout << "Tuesday\n"; break;
        case 3: cout << "Wednesday\n"; break;
        default: cout << "Other day\n";
    }

    return 0;
}
```

**The one control-flow addition C++ brings**: range-based `for` (`for (int s : scores)`), which C doesn't have. Everything else — `if`/`else`, `for`, `while`, `do-while`, `switch` — is identical syntax and identical behavior to C.

## Classes and OOP

```cpp
#include <iostream>
#include <string>
using namespace std;

class BankAccount {
private:             // Only accessible within class
    string owner;
    double balance;

public:              // Accessible from anywhere
    // Constructor
    BankAccount(string owner, double initialBalance)
        : owner(owner), balance(initialBalance) {}  // Initializer list (efficient)

    // Destructor (called when object destroyed)
    ~BankAccount() {
        cout << "Account for " << owner << " closed\n";
    }

    // Member functions
    void deposit(double amount) {
        if (amount <= 0) throw invalid_argument("Amount must be positive");
        balance += amount;
    }

    bool withdraw(double amount) {
        if (amount > balance) return false;
        balance -= amount;
        return true;
    }

    // Getters
    double getBalance() const { return balance; }  // const = doesn't modify object
    string getOwner()   const { return owner; }

    // Operator overloading
    friend ostream& operator<<(ostream& os, const BankAccount& acc) {
        os << "Account[" << acc.owner << ", Rs " << acc.balance << "]";
        return os;
    }
};

int main() {
    BankAccount acc("Alice", 10000);
    acc.deposit(5000);
    acc.withdraw(2000);
    cout << acc << endl;  // Account[Alice, Rs 13000]
    return 0;
}
```

**Why the initializer list (`: owner(owner), balance(initialBalance)`) instead of assigning inside the constructor body?** For simple types like these it's mostly a style convention, but for members that are references, `const`, or objects without a default constructor, the initializer list is the *only* way to initialize them — assignment inside the body happens too late (the member would already need to exist first). Getting used to initializer-list syntax early avoids a confusing error later when you hit a case where assignment-in-body simply won't compile.

## Inheritance Basics

Inheritance lets one class (the derived/child class) reuse and extend another class's (the base/parent class's) members:

```cpp
#include <iostream>
#include <string>
using namespace std;

class Animal {
protected:              // Accessible in this class AND derived classes
                        // (private would NOT be accessible in Dog below)
    string name;

public:
    Animal(string n) : name(n) {}

    virtual void speak() {   // virtual enables runtime polymorphism —
        cout << name << " makes a sound\n";  // see below
    }

    void showName() {
        cout << "Name: " << name << "\n";
    }
};

class Dog : public Animal {   // Dog "is-a" Animal — public inheritance
public:
    Dog(string n) : Animal(n) {}  // Must call the base class constructor

    void speak() override {        // Overrides Animal::speak()
        cout << name << " says Woof!\n";  // 'name' is accessible because
                                            // it's protected, not private
    }
};

int main() {
    Dog d("Rex");
    d.showName();   // Inherited from Animal, unchanged
    d.speak();       // Dog's own override: "Rex says Woof!"

    Animal* a = &d;  // A base-class pointer can point to a derived object
    a->speak();       // Still calls Dog::speak() -- this is runtime
                       // polymorphism, and it ONLY works because speak()
                       // was declared virtual in Animal. Without virtual,
                       // this would call Animal::speak() instead, which
                       // is almost never what you actually want.
    return 0;
}
```

**The single most important rule to internalize here**: if you intend a derived class to override a base class's method and have that override respected even when accessed through a base-class pointer/reference, the base class method **must** be declared `virtual`. This is a genuinely common source of bugs for people new to C++ OOP — code that "should" call the derived class's version silently calls the base class's version instead, because `virtual` was left off.

## Next Steps

Move to **Intermediate** to go deeper into the STL (`vector`, `map`, `set` and their real-world usage patterns), templates, and exception handling — the tools that make C++ genuinely productive rather than just "C with classes."
