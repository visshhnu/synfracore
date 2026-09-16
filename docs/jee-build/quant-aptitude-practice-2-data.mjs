// Standalone Quantitative Aptitude practice paper 2 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Quantitative Aptitude — Practice Paper 2";

export const PAPER = {
  slug: "quant-aptitude-practice-2",
  title: "Quantitative Aptitude Practice Paper 2",
  examType: "quant-aptitude",
  focusTags: ["Quantitative Aptitude", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 2,
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
      { topic: "Number System", stem: "Find the LCM of 15 and 20.", options: ["60", "30", "45", "75"], correct: 0, explanation: "15=3x5, 20=2^2x5; LCM = 2^2x3x5 = 60." },
      { topic: "Simplification", stem: "Simplify: 18^2 - 12^2.", options: ["180", "216", "144", "196"], correct: 0, explanation: "(18-12)(18+12) = 6x30 = 180." },
      { topic: "Percentage", stem: "A number decreased by 20% gives 160. Find the original number.", options: ["200", "192", "180", "210"], correct: 0, explanation: "Original = 160/0.8 = 200." },
      { topic: "Profit & Loss", stem: "Cost price is Rs. 1200 and loss is 15%. Find the selling price.", options: ["Rs. 1020", "Rs. 1080", "Rs. 1000", "Rs. 1050"], correct: 0, explanation: "SP = 1200x0.85 = 1020." },
      { topic: "Simple Interest", stem: "Find the principal that yields SI of Rs. 900 in 3 years at 6% p.a.", options: ["Rs. 5000", "Rs. 4500", "Rs. 5500", "Rs. 4000"], correct: 0, explanation: "P = SIx100/(RxT) = 900x100/18 = 5000." },
      { topic: "Compound Interest", stem: "Find the compound interest on Rs. 3000 for 2 years at 5% p.a.", options: ["Rs. 307.50", "Rs. 300", "Rs. 315", "Rs. 320"], correct: 0, explanation: "Amount = 3000x1.05^2 = 3307.50; CI = 307.50." },
      { topic: "Time & Work", stem: "A alone can finish a work in 12 days, B alone in 18 days. In how many days will both finish it together?", options: ["7.2 days", "8 days", "7.5 days", "6.5 days"], correct: 0, explanation: "Combined rate = 1/12+1/18 = 5/36; time = 36/5 = 7.2 days." },
      { topic: "Time, Speed & Distance", stem: "A man walks at 5 km/h and covers a distance in 3 hours. Find the distance.", options: ["15 km", "12 km", "18 km", "20 km"], correct: 0, explanation: "Distance = 5x3 = 15 km." },
      { topic: "Averages", stem: "The average weight of 4 people is 65 kg. A fifth person weighing 75 kg joins. Find the new average.", options: ["67 kg", "68 kg", "66 kg", "70 kg"], correct: 0, explanation: "Total4=260, +75=335; new average = 335/5 = 67 kg." },
      { topic: "Ratio & Proportion", stem: "The ratio of two numbers is 5:7 and their sum is 96. Find the smaller number.", options: ["40", "45", "35", "48"], correct: 0, explanation: "12 parts = 96, each part = 8; smaller = 5x8 = 40." },
      { topic: "Number Series", stem: "Find the missing term: 5, 10, 20, 40, ?", options: ["80", "70", "75", "60"], correct: 0, explanation: "Each term doubles the previous: 40x2 = 80." },
      { topic: "Data Interpretation", stem: "In a class, 40% of 50 students play cricket. Find the number playing cricket.", options: ["20", "15", "25", "18"], correct: 0, explanation: "40% of 50 = 20." },
      { topic: "Number System", stem: "The sum of two consecutive even numbers is 74. Find the larger number.", options: ["38", "36", "40", "42"], correct: 0, explanation: "x+(x+2)=74; x=36; larger = 38." },
      { topic: "Percentage", stem: "In an election, a candidate got 60% of votes and won by 4000 votes. Find the total votes.", options: ["20000", "18000", "22000", "24000"], correct: 0, explanation: "Winning margin = 20% of total = 4000; total = 20000." },
      { topic: "Profit & Loss", stem: "A trader marks goods 20% above cost price and gives a 10% discount. Find his profit percentage.", options: ["8%", "10%", "12%", "6%"], correct: 0, explanation: "CP=100, MP=120, SP=120x0.9=108; profit = 8%." },
      { topic: "Simple/Compound Interest", stem: "The difference between CI and SI on a sum for 2 years at 10% p.a. is Rs. 50. Find the sum.", options: ["Rs. 5000", "Rs. 4500", "Rs. 5500", "Rs. 6000"], correct: 0, explanation: "For 2 years, CI-SI = P(r/100)^2; 50 = Px0.01; P = 5000." },
      { topic: "Averages", stem: "Find the average of the first 10 odd numbers.", options: ["10", "9", "11", "12"], correct: 0, explanation: "Sum of first n odd numbers = n^2 = 100; average = 100/10 = 10." },
      { topic: "Ratio & Proportion", stem: "If x:y = 3:4, find (2x+3y):(3x+2y).", options: ["18:17", "17:18", "3:4", "4:3"], correct: 0, explanation: "Let x=3,y=4: 2x+3y=18; 3x+2y=17; ratio = 18:17." },
      { topic: "Time & Work", stem: "12 men can complete a job in 8 days. How many days will 16 men take?", options: ["6 days", "8 days", "5 days", "7 days"], correct: 0, explanation: "Men x days = constant = 96; 96/16 = 6 days." },
      { topic: "Time, Speed & Distance", stem: "A boat goes 24 km upstream in 6 hours. Find the boat's upstream speed.", options: ["4 km/h", "6 km/h", "5 km/h", "8 km/h"], correct: 0, explanation: "Speed = 24/6 = 4 km/h." },
    ],
  },
];
