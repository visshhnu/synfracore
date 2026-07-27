# Computer Science Basics — Practice Projects

Build these to actually apply what you've learned — small enough to finish, real enough to be satisfying, and directly useful for CBSE/ICSE practical exams and internal assessments.

## Project 1: Student Report Card Generator (Beginner)

**Time:** 1-2 days

A program that takes a student's marks in multiple subjects, calculates their total, percentage, and grade, and prints a formatted report card.

### Steps

1. Take subject-wise marks as input (use a list or dictionary to store subject-mark pairs)
2. Calculate total marks, percentage, and assign a grade using conditions (matching the grading logic from this course's Fundamentals section)
3. Format the output as a clean, readable report card — subject names aligned, percentage rounded sensibly
4. Handle a realistic edge case: what if a mark entered is above 100 or negative? Add basic validation

### Skills Demonstrated
- Variables, conditions, and basic input handling
- Working with lists/dictionaries for structured data
- Formatted output (f-strings)

### Project Name
`report-card-generator`

---

## Project 2: Simple Quiz Game (Intermediate)

**Time:** 2-3 days

A multiple-choice quiz game that asks a set of questions, tracks the score, and gives a final result — using functions to keep the code organized rather than one long script.

### Steps

1. Store questions, options, and correct answers (a list of dictionaries works well: `{"question": ..., "options": [...], "answer": ...}`)
2. Write a function that asks one question and checks the answer, returning whether it was correct
3. Loop through all questions, tracking the score using the function above
4. At the end, print the score and a message that changes based on performance (e.g., different messages for 90%+, 50-89%, below 50%)
5. Add a feature: let the player choose a difficulty level, or a topic, before starting

### Skills Demonstrated
- Functions and code organization
- Loops combined with conditions
- Working with structured data (list of dictionaries)

---

## Project 3: Student Records System With File Storage (Advanced)

**Time:** 1 week

Extend the report card idea into a system that saves student records to a file, so data isn't lost when the program closes — directly practicing the file handling covered in this course's CBSE Class 12 syllabus section.

### Steps

1. Design a simple file format for storing student records (CSV works well, and matches what's covered in this course's Fundamentals section)
2. Write functions to add a new student record, view all records, and search for a specific student by name
3. Save records to the file after every change, and load existing records when the program starts
4. Add basic statistics: class average, highest scorer, lowest scorer — computed from the stored records
5. Handle the case where the file doesn't exist yet (first run) without crashing

### Skills Demonstrated
- File handling (reading, writing, CSV)
- Combining functions into a small, organized program
- Basic data analysis (average, max, min) on real stored data

### Project Name
`student-records-file-system`

---

## Tips for Great Projects

**Test with real, varied input.** Try your report card generator with a student who fails one subject, or a quiz game where every answer is wrong — these edge cases are exactly what practical exams check for.

**Use functions once your program does more than one thing.** A single long script is harder to test and explain than a few small, clearly-named functions — this is also exactly what your practical exam viva will ask you to walk through.

**Comment your logic, not the obvious lines.** A comment explaining *why* you chose a particular grading cutoff is useful; a comment saying `# print name` above `print(name)` isn't.

**For board practicals specifically:** be ready to explain your code line by line — practical exam vivas commonly ask "what does this line do" and "why did you write it this way," so understanding your own code, not just having it work, matters.

## Project Checklist
- [ ] All 3 projects run correctly with normal input
- [ ] At least one project tested with unusual/edge-case input (invalid marks, empty answers, etc.)
- [ ] At least one project uses file handling (matching the CBSE Class 12 syllabus)
- [ ] Comfortable explaining every function's purpose without notes
- [ ] Code is organized into functions, not one long unbroken script
