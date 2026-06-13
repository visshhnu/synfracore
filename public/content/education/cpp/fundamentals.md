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
