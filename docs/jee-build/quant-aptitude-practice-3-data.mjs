// Standalone Quantitative Aptitude practice paper 3 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Quantitative Aptitude — Practice Paper 3";

export const PAPER = {
  slug: "quant-aptitude-practice-3",
  title: "Quantitative Aptitude Practice Paper 3",
  examType: "quant-aptitude",
  focusTags: ["Quantitative Aptitude", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 3,
  timeLimitMinutes: 15,
  positiveMarks: 1,
  negativeMarks: 0.25,
};

const QUANT_SRC = "Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper.";

export const SECTIONS = [
  {
    name: "Quantitative Aptitude",
    subject: "Quantitative Aptitude",
    sourceNote: QUANT_SRC,
    questions: [
      { topic: "Number System", stem: "Find the smallest 4-digit number divisible by 6.", options: ["1002", "1000", "1004", "1006"], correct: 0, explanation: "1000/6 = 166.67; next multiple of 6 is 167x6 = 1002." },
      { topic: "Simplification", stem: "Simplify: 45% of 300 - 15% of 200.", options: ["105", "110", "100", "120"], correct: 0, explanation: "45% of 300=135; 15% of 200=30; difference = 105." },
      { topic: "Percentage", stem: "If 30% of a number is 90, find 50% of the same number.", options: ["150", "120", "180", "160"], correct: 0, explanation: "Number = 90/0.3 = 300; 50% of 300 = 150." },
      { topic: "Profit & Loss", stem: "A man sells two articles at Rs. 1000 each -- one at 20% profit, the other at 20% loss. Find his overall profit or loss percentage.", options: ["4% loss", "4% profit", "No profit no loss", "5% loss"], correct: 0, explanation: "CP1=1000/1.2=833.33, CP2=1000/0.8=1250; total CP=2083.33, total SP=2000; loss = 83.33, loss% = 4%." },
      { topic: "Simple Interest", stem: "Find the time required for a sum to double itself at 8% p.a. simple interest.", options: ["12.5 years", "10 years", "15 years", "8 years"], correct: 0, explanation: "SI=P means P=Px8xT/100; T = 100/8 = 12.5 years." },
      { topic: "Compound Interest", stem: "A sum becomes Rs. 1210 in 2 years at 10% p.a. compound interest. Find the sum.", options: ["Rs. 1000", "Rs. 1100", "Rs. 1050", "Rs. 950"], correct: 0, explanation: "P = 1210/(1.1)^2 = 1210/1.21 = 1000." },
      { topic: "Time & Work", stem: "A, B, C can complete a work in 6, 8, 12 days respectively. Find the time for all three working together.", options: ["8/3 days (approx 2.67 days)", "3 days", "2.5 days", "3.5 days"], correct: 0, explanation: "Combined rate = 1/6+1/8+1/12 = 9/24 = 3/8; time = 8/3 days." },
      { topic: "Time, Speed & Distance", stem: "Convert a speed of 90 km/h into m/s.", options: ["25 m/s", "20 m/s", "30 m/s", "22.5 m/s"], correct: 0, explanation: "90 x 5/18 = 25 m/s." },
      { topic: "Averages", stem: "Average age of a class of 20 students is 15 years. Including the teacher, the average becomes 16 years. Find the teacher's age.", options: ["36 years", "40 years", "35 years", "38 years"], correct: 0, explanation: "Students total = 300; new total (21 people) = 21x16 = 336; teacher's age = 336-300 = 36." },
      { topic: "Ratio & Proportion", stem: "Two numbers are in the ratio 4:5. If each is increased by 10, the ratio becomes 5:6. Find the numbers.", options: ["40 and 50", "30 and 40", "44 and 55", "36 and 45"], correct: 0, explanation: "Let numbers be 4x,5x. (4x+10)/(5x+10)=5/6 gives x=10; numbers = 40, 50." },
      { topic: "Number Series", stem: "Find the number that doesn't fit the pattern: 3, 6, 9, 15, 24, 38.", options: ["38", "24", "15", "9"], correct: 0, explanation: "Pattern is each term = sum of previous two (Fibonacci-like): 3,6,9,15,24, then 15+24=39, not 38 -- 38 is the outlier." },
      { topic: "Data Interpretation", stem: "A pie chart shows 25% of students prefer Math out of 200 total students. How many prefer Math?", options: ["50", "40", "60", "45"], correct: 0, explanation: "25% of 200 = 50." },
      { topic: "Number System", stem: "Find the unit digit of 7^45.", options: ["7", "9", "3", "1"], correct: 0, explanation: "Unit digits of 7 cycle every 4: 7,9,3,1. 45 mod 4 = 1, so unit digit = 7 (first in the cycle)." },
      { topic: "Percentage", stem: "The population of a town increases by 10% annually. If the current population is 22000, find the population 1 year ago.", options: ["20000", "21000", "19000", "20500"], correct: 0, explanation: "22000/1.1 = 20000." },
      { topic: "Profit & Loss", stem: "A retailer buys 20 pens for Rs. 200 and sells them at Rs. 12 each. Find the profit percentage.", options: ["20%", "15%", "25%", "18%"], correct: 0, explanation: "CP/pen = 10, SP/pen = 12; profit = 2; profit% = 20%." },
      { topic: "Compound Interest", stem: "Find the CI on Rs. 8000 for 1 year at 10% p.a., compounded half-yearly.", options: ["Rs. 820", "Rs. 800", "Rs. 840", "Rs. 880"], correct: 0, explanation: "Rate/half-year = 5%, 2 periods; Amount = 8000x1.05^2 = 8820; CI = 820." },
      { topic: "Averages", stem: "The average of 6 consecutive numbers is 15.5. Find the largest number.", options: ["18", "17", "19", "20"], correct: 0, explanation: "Numbers n to n+5 average to n+2.5=15.5, so n=13; largest = 18." },
      { topic: "Ratio & Proportion", stem: "A sum of Rs. 2700 is divided among A, B, C in the ratio 2:3:4. Find C's share.", options: ["Rs. 1200", "Rs. 1000", "Rs. 1100", "Rs. 1300"], correct: 0, explanation: "9 parts = 2700, each = 300; C's share = 4x300 = 1200." },
      { topic: "Time & Work", stem: "15 workers can complete a task in 20 days. After 5 days, 5 more workers join. Find the total time to complete the work.", options: ["16.25 days", "15 days", "17 days", "18 days"], correct: 0, explanation: "Total work = 300 man-days; 5 days by 15 workers = 75; remaining = 225; with 20 workers, remaining time = 11.25 days; total = 16.25 days." },
      { topic: "Time, Speed & Distance", stem: "A train travels at 60 km/h and covers a distance in 45 minutes. Find the distance.", options: ["45 km", "50 km", "40 km", "48 km"], correct: 0, explanation: "Distance = 60 x (45/60) = 45 km." },
    ],
  },
];
