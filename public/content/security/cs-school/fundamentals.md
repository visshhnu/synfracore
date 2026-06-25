# Computer Science for Schools — Fundamentals

## Introduction to Computers
- **Hardware**: Physical components — CPU, RAM, storage, I/O devices
- **Software**: Programs — system software (OS) and application software
- **CPU**: Processes instructions; speed in GHz; cores for parallelism
- **RAM**: Temporary memory for running programs; volatile
- **Storage**: HDD (magnetic), SSD (flash); permanent storage
- **I/O**: Input (keyboard, mouse, camera) and Output (monitor, printer, speaker)

## Number Systems
- **Decimal**: Base 10, digits 0-9 (human use)
- **Binary**: Base 2, digits 0-1 (computers use)
- **Octal**: Base 8, digits 0-7
- **Hexadecimal**: Base 16, digits 0-9 and A-F

### Conversions
```
Decimal to Binary: divide by 2, collect remainders (read upward)
  13 ÷ 2 = 6 R 1
   6 ÷ 2 = 3 R 0
   3 ÷ 2 = 1 R 1
   1 ÷ 2 = 0 R 1 → 1101

Binary to Decimal: multiply each bit by 2^position, sum up
  1101 = 1×8 + 1×4 + 0×2 + 1×1 = 13
```

## Programming Basics
- **Algorithm**: Step-by-step instructions to solve a problem
- **Flowchart**: Visual representation of an algorithm
- **Pseudocode**: Plain English description of algorithm steps

### Programming Concepts
- **Variable**: Named storage location for data
- **Data types**: int, float, string, boolean
- **Operators**: arithmetic (+,-,×,÷), comparison (==,!=,<,>), logical (AND,OR,NOT)
- **Input/Output**: Getting data from user, displaying results
- **Comments**: Documentation in code, ignored by compiler

### Control Structures
```python
# Sequence: statements execute one after another

# Selection (if-else):
if temperature > 100:
    print("Boiling!")
elif temperature > 37:
    print("Warm")
else:
    print("Cool")

# Iteration (loops):
for i in range(1, 6):
    print(i)  # prints 1 2 3 4 5

while count < 10:
    count = count + 1
```

## Internet and Networking
- **Internet**: Global network of interconnected computers
- **WWW**: Web pages and websites accessed via internet
- **URL**: Web address (https://www.example.com)
- **IP address**: Unique identifier for each device (IPv4: 192.168.1.1)
- **Browser**: Software to access web (Chrome, Firefox, Safari)
- **Search engine**: Indexes web pages (Google, Bing)

## Data Representation
- **Text**: ASCII and Unicode encode characters as numbers
- **Images**: Grid of pixels, each pixel has RGB color values
- **Audio**: Samples of sound wave amplitude over time
- **Video**: Sequence of image frames + audio

## Cyber Safety
- Strong passwords: length, mix of characters, unique per site
- Phishing: fake emails/sites to steal credentials
- Malware: viruses, worms, ransomware, spyware
- Antivirus software: detects and removes malware
- Privacy: be careful what personal info you share online
