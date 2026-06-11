# Placement Preparation — Complete Campus & Off-Campus Guide

Getting placed at a top tech company requires strategy. This guide covers the full journey — aptitude rounds, coding tests, technical interviews, and HR — with what actually works.

## The Hiring Process

```
Most companies follow this funnel:

1. Resume Screening (ATS + Human)
2. Online Assessment (Aptitude + Coding)
3. Technical Interview Round 1 (DSA)
4. Technical Interview Round 2 (DSA + CS fundamentals)
5. Technical Interview Round 3 (System Design — for senior roles)
6. HR/Managerial Round
7. Offer

Campus placement timeline (India):
  August–October: PSU, core companies
  October–December: Product companies (Tier 1)
  November–February: Service companies (TCS, Infosys, Wipro, etc.)
  Year-round: Startups via LinkedIn/referrals
```

## Resume — Getting Past ATS

```
One page rule: For freshers, strictly one page
Format: Simple, ATS-friendly (no tables, columns, graphics)

Sections:
  1. Contact (name, email, phone, LinkedIn, GitHub)
  2. Education (CGPA if > 7.5)
  3. Skills (Technologies you actually know)
  4. Projects (2-3 strong ones)
  5. Internships (if any)
  6. Achievements (coding competitions, hackathons)

Project descriptions — use STAR format:
  Bad:  "Made an e-commerce website"
  Good: "Built full-stack e-commerce app with React + Node.js, 
        handling 1000+ products, JWT auth, Razorpay integration.
        Reduced page load by 40% with Redis caching."

Skills section — be specific:
  Languages: Python, Java, JavaScript, C++
  Frameworks: React, Node.js, Spring Boot, Django
  Databases: PostgreSQL, MongoDB, Redis
  Tools: Git, Docker, AWS (EC2, S3), Linux
  DO NOT list: MS Word, PowerPoint, "good communication"

ATS keywords: Match the job description language
  JD says "proficient in Java" → your resume says "Java"
  JD says "REST APIs" → your resume mentions "REST APIs"
```

## Aptitude Test Strategy

```
Tests usually 60-90 min, 3 sections:

QUANTITATIVE APTITUDE (30-40 min, 20-25 questions)
  Speed: 70-90 seconds per question
  
  Formulae to memorize:
  
  Time & Work:
    Work = 1/n per day (person finishing in n days)
    Together: 1/a + 1/b = 1/T → T = ab/(a+b)
  
  Time Speed Distance:
    D = S × T, Average speed = 2xy/(x+y) for equal distances
    Train problems: Add lengths, use relative speed
  
  Percentage:
    % change = (new-old)/old × 100
    Successive: a% then b% = a+b+ab/100
  
  Probability:
    P(A) = favorable outcomes / total outcomes
    P(A∩B) = P(A) × P(B) for independent events
  
  Permutation & Combination:
    nPr = n!/(n-r)!   nCr = n!/[r!(n-r)!]
    Arrange n items = n!
    Select r from n = nCr

LOGICAL REASONING (20-30 min)
  Directions, Blood relations, Syllogisms, Puzzles
  
  Syllogism approach:
    Draw Venn diagrams mentally
    "All A are B, Some B are C"
    → Some A are C (not definite), Some C are A (not definite)
  
  Blood relations: Draw a family tree, always

VERBAL ABILITY (15-20 min)
  Reading Comprehension: Read passage → answer ONLY from passage
  Error identification: Subject-verb agreement, tenses, prepositions
  Fill in the blanks: Context clues
```

## Coding Round Strategy

```
Most common: 2-3 coding problems in 60-90 minutes (HackerRank/HackerEarth/Codility)

Difficulty:
  Service companies (TCS, Infosys): Easy — loops, arrays, strings
  Product MNC (Amazon, Microsoft, Adobe): Medium — DSA
  Top product (Google, Atlassian): Medium-Hard — advanced DSA

How to approach each problem:
  1. Read COMPLETELY before coding
  2. Check constraints: n ≤ 10⁶ → O(n log n) at worst
  3. Write brute force first, then optimize
  4. Test with examples on paper
  5. Handle edge cases: empty input, single element, max value

Constraints → expected time complexity:
  n ≤ 10:      O(n!) — backtracking, permutations
  n ≤ 20:      O(2ⁿ) — DP with bitmask
  n ≤ 500:     O(n³) — 3 nested loops
  n ≤ 5000:    O(n²) — 2 nested loops  
  n ≤ 10⁵:     O(n log n) — sorting, binary search, heap
  n ≤ 10⁶:     O(n) — single pass, hash map
  n ≤ 10⁸:     O(log n) — binary search only
  n ≤ 10¹⁸:    O(1) — math formula

Must-know patterns:
  Arrays: Two pointers, sliding window, prefix sum, sorting
  Strings: Two pointers, hashing, KMP, sliding window
  Linked Lists: Two pointers (fast/slow), reversal, merge
  Trees: DFS/BFS, recursion, level order
  Graphs: BFS (shortest path), DFS (connected components), Dijkstra
  DP: 1D (Fibonacci variants), 2D (LCS, LIS), interval DP
```

## Technical Interview — What They Really Ask

```
Round 1 typically: 1 medium DSA problem + discussion

FORMAT:
  "Tell me about yourself" — 2 minute pitch, not your whole life
  "Explain this project" — pick your strongest project, know it deeply
  DSA problem — think aloud, code cleanly, test it
  "Any questions for me?" — always have 2-3 questions ready

DSA Interview Approach:
  1. Clarify edge cases and constraints (2-3 min)
  2. Describe your approach before coding
  3. Write clean code with good variable names
  4. Test with the example input
  5. State time and space complexity

Common mistakes:
  → Jumping to code without thinking
  → Using single-letter variable names (x, y, z)
  → Not testing your code
  → Saying "I don't know" without attempting

When stuck:
  Start with brute force — "Naively this would be O(n²) by..."
  Think aloud — interviewer may give hints
  Draw an example — concrete often reveals pattern
  Consider patterns: is this a BFS? sliding window? DP?

Projects — questions you WILL be asked:
  "What was the most challenging part?"
  "How would you scale this to 1 million users?"
  "What would you do differently now?"
  "Explain your database schema"
  "Why did you choose X technology over Y?"

CS Fundamentals they test:
  OOP: Polymorphism, Encapsulation, Inheritance, Abstraction
  OS: Process vs Thread, Deadlock, Virtual Memory
  DBMS: Normalization, SQL queries, Indexing, Transactions
  Networks: TCP vs UDP, HTTP vs HTTPS, REST API
```

## HR Round

```
HR isn't formality — it CAN eliminate you

Questions and what they're really asking:

"Tell me about yourself" — Can you communicate professionally?
  Template: "I'm a [year] student at [college] studying [branch].
  I've been focusing on [your specialty]. I built [project] which [impact].
  Most recently I [recent achievement]. I'm excited about [specific thing 
  about this company]."

"Why our company?" — Did you research us or are you spray applying?
  Research: Company's recent work, products, culture, what they solve
  Bad: "Great company, good package, great opportunity"
  Good: "I've been using [product] and was impressed by how it handles [X].
  I'd love to work on [specific team/problem]."

"Weakness" — Self-awareness + growth mindset
  Bad: "I work too hard" (cliché)
  Bad: "I don't have weaknesses" (arrogant)
  Good: "I sometimes get too detail-oriented and lose track of deadline.
  I've been working on this by setting time-boxes for each task."

"Where do you see yourself in 5 years?" — Ambitious but committed?
  "I want to grow into a strong engineer, contributing to meaningful products.
  I'd like to take on more responsibility as I build expertise. I see [company]
  as a place where that growth is possible."

Salary negotiation:
  Never be first to name a number
  Research market rate first (LinkedIn Salary, Glassdoor, Levels.fyi)
  "I'm flexible and open to discussing based on the role and responsibilities"
  If pressed: give a range with your target at the bottom
```

## Company-Wise Preparation

```
FAANG (Google, Amazon, Microsoft, Meta, Apple):
  Focus: DSA excellence (Leetcode Medium/Hard), System Design
  Timeline: 3-6 months preparation
  Platform: Leetcode (company-tagged questions)
  Books: CTCI, EPI

Indian Product Companies (Flipkart, Swiggy, Razorpay, CRED, Zepto):
  Focus: DSA (Medium), system design basics, 1 good project
  Timeline: 2-3 months
  
MNC (Adobe, Atlassian, Intuit, ThoughtWorks):
  Focus: DSA (Easy-Medium), CS fundamentals, projects
  
Service Companies (TCS, Infosys, Wipro, HCL, Cognizant):
  Focus: Aptitude, verbal, basic coding
  Timeline: 2-4 weeks
  Note: Large intake, most CS graduates who apply get offers

Startups:
  Focus: Can you ship features? Projects matter more than competitive DSA
  Interview: More practical — take-home project, code review
  Upside: More responsibility, equity, learning
  Downside: Risk, may not have strong mentorship
```
