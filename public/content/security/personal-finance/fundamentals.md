# Personal Finance Fundamentals

## Why Financial Literacy Matters
Financial literacy enables: long-term security and independence, ability to handle emergencies without debt, freedom to make life choices without financial constraint, and wealth building over time. Poor financial management leads to debt spirals, stress, and missed opportunities. The fundamentals are straightforward but require consistent habits.

## Income and Budgeting

### Types of Income
Active income: salary, wages, self-employment — requires ongoing time and effort.
Passive income: rental income, dividends, interest, royalties — earned with minimal ongoing effort once set up.
Portfolio income: capital gains from selling investments.

### The 50/30/20 Budget Rule
Take-home salary divided as: 50% for needs (rent, food, utilities, transport, insurance, EMIs), 30% for wants (dining out, entertainment, hobbies, travel), 20% for savings and investments (emergency fund, mutual funds, extra debt repayment).
Adjust ratios for high rent cities or aggressive savings goals.

### Zero-Based Budgeting
Assign every rupee of income a specific purpose — income minus all assigned amounts = 0. Forces intentional allocation. Every item must be justified each month. Good for those with variable income or persistent overspending patterns.

## Banking and Payment Systems

### Account Types (India)
Savings account: 3-4% interest; for daily transactions and emergency fund.
Fixed Deposit (FD): 6-7.5%; locked for a term; guaranteed return; DICGC-insured up to ₹5 lakh.
Recurring Deposit (RD): 6-7%; monthly fixed deposits; forces saving discipline.
PPF (Public Provident Fund): 7.1%; government-backed; 15-year lock-in; tax-free returns.

### Digital Payments
UPI: instant bank-to-bank via mobile (BHIM, PhonePe, Google Pay, Paytm); free; 24/7.
IMPS: instant; up to ₹5 lakh per transaction; 24/7; small charge.
NEFT: batch settlement every 30 minutes; 24/7 since 2019; free; any amount.
RTGS: real-time; minimum ₹2 lakh; for large amounts; 24/7.

## Debt Management

### Good Debt vs Bad Debt
Good debt: borrowed money that builds wealth or earning power — home loan (asset appreciates over time), education loan (increases future income significantly).
Bad debt: borrowing for consumption that loses value — credit card balance (24-48% annual interest), personal loan for vacation, consumer EMIs for gadgets or appliances.

### Credit Card Discipline
Pay the FULL outstanding balance every month — never carry a balance.
Credit card interest: 2-4% per MONTH = 24-48% per YEAR — the most powerful wealth destroyer available.
Keep credit utilisation below 30% of credit limit (protects CIBIL score).
Benefits (cashback, rewards, lounge access, insurance) only materialise when you pay no interest.

## Insurance Basics — Non-Negotiable
Term life insurance: pure death benefit; ₹1 crore cover at age 30 costs approximately ₹10,000-15,000/year. Mandatory if anyone depends financially on your income.
Health insurance: family floater of ₹5-10 lakh minimum. Do not rely solely on employer-provided cover — it ends if you change jobs.
Vehicle third-party: legally mandatory for all motor vehicles. Covers damage you cause to others.

**Q: What is the relationship between risk and return in investing?**
Higher potential return almost always comes with higher risk — this is the fundamental risk-return tradeoff in investing. Fixed deposits: low risk, predictable 6-7% return. Government bonds: low risk, slightly higher yield. Equity (stocks/equity mutual funds): high risk (can fall 30-50% in a year), but historically 10-14% annual returns over long periods in India. The key insight: RISK is mitigated by TIME for equity investments. A 1-year equity investment is risky; a 20-year equity SIP has historically delivered positive inflation-beating returns in almost all scenarios. Match your investment risk to your TIME HORIZON — not just your comfort level.

## Fundamentals

### What You Need to Know First
These are the building blocks. Master these before moving to intermediate topics. Every expert skipped fundamentals at some point and paid for it later.

### Core Concepts

**Architecture Overview**
Understanding how a system is structured helps you reason about its behaviour. Know the main components, how they interact, and what each is responsible for. Draw it out — if you cannot sketch the architecture, you do not understand it yet.

**The Basic Unit of Work**
Every technology operates on some fundamental unit: a container, a query, a message, a record, a request. Understanding what this unit is and its lifecycle (creation → processing → completion/failure) explains most of the technology's behaviour.

**Configuration Fundamentals**
Defaults are chosen to be safe, not optimal. Know the defaults, understand what they mean, and know when to change them. Keep configuration in version control. Separate configuration from code.

**Error Handling Basics**
Read error messages completely — they almost always tell you exactly what is wrong. Know where logs are and how to read them. Understand the difference between transient errors (retry) and permanent errors (fix the code or config).

### Hands-On Exercises
1. Install and run the technology locally following the official getting-started guide
2. Run the simplest possible working example
3. Break it intentionally — introduce an error and read the error message
4. Check the logs and understand what they show
5. Change one configuration value and observe the effect

### Key Terminology
| Term | Definition |
|------|-----------|
| Node / Instance | A single running copy of the service |
| Cluster | Multiple nodes working together |
| Replica | A copy of data or a service for redundancy |
| Partition | A subdivision of data or work |
| Leader/Primary | The authoritative instance for writes |
| Follower/Replica | Secondary instance that replicates from leader |

### First 30 Minutes Checklist
- [ ] Verified installation works
- [ ] Read the architecture overview in the official docs
- [ ] Ran a hello-world example successfully
- [ ] Understood what the example actually does
- [ ] Located where logs are written
- [ ] Found the configuration file and read what the main settings do
