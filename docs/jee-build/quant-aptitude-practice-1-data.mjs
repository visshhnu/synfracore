// Standalone Quantitative Aptitude practice paper 1 of 5. Not tied to
// any single exam's citation -- authored to match the real quant
// sections tested across Banking (SBI/IBPS), SSC, Railways, and State
// PSC exams generically, mixed-topic per paper (matching how these
// exams actually structure their quant sections), same discipline as
// every authored practice paper this session (SSC CGL/IBPS PO/JEE):
// not copied from any official question paper, explicit disclosure.

export const HEADER_LABEL = "Quantitative Aptitude — Practice Paper 1";

export const PAPER = {
  slug: "quant-aptitude-practice-1",
  title: "Quantitative Aptitude Practice Paper 1",
  examType: "quant-aptitude",
  focusTags: ["Quantitative Aptitude", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 15,
  positiveMarks: 1,
  negativeMarks: 0.25,
};

const QUANT_SRC = "Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam's specific paper.";

export const SECTIONS = [
  {
    name: "Quantitative Aptitude",
    subject: "Quantitative Aptitude",
    sourceNote: QUANT_SRC,
    questions: [
      { topic: "Number System", stem: "Find the sum of the first 15 natural numbers.", options: ["120", "110", "105", "125"], correct: 0, explanation: "Sum = n(n+1)/2 = 15x16/2 = 120." },
      { topic: "Simplification", stem: "Simplify: 15% of 240 + 20% of 150.", options: ["66", "60", "72", "56"], correct: 0, explanation: "15% of 240 = 36; 20% of 150 = 30; sum = 66." },
      { topic: "Percentage", stem: "If a number is increased by 25%, it becomes 150. Find the original number.", options: ["120", "125", "110", "100"], correct: 0, explanation: "Original = 150/1.25 = 120." },
      { topic: "Profit & Loss", stem: "A shopkeeper buys an item for Rs. 800 and sells it for Rs. 960. Find the profit percentage.", options: ["20%", "15%", "25%", "18%"], correct: 0, explanation: "Profit = 160; profit% = 160/800 x 100 = 20%." },
      { topic: "Simple Interest", stem: "Find the simple interest on Rs. 5000 at 8% p.a. for 3 years.", options: ["Rs. 1200", "Rs. 1000", "Rs. 1500", "Rs. 1300"], correct: 0, explanation: "SI = PRT/100 = 5000x8x3/100 = 1200." },
      { topic: "Compound Interest", stem: "Find the compound interest on Rs. 2000 at 10% p.a. for 2 years, compounded annually.", options: ["Rs. 420", "Rs. 400", "Rs. 440", "Rs. 200"], correct: 0, explanation: "Amount = 2000x(1.1)^2 = 2420; CI = 420." },
      { topic: "Averages", stem: "Find the average of 12, 18, 24, 30, 36.", options: ["24", "22", "26", "20"], correct: 0, explanation: "Sum = 120; average = 120/5 = 24." },
      { topic: "Ratio & Proportion", stem: "Divide Rs. 1200 between A and B in the ratio 3:5. Find A's share.", options: ["Rs. 450", "Rs. 500", "Rs. 400", "Rs. 600"], correct: 0, explanation: "A's share = 1200 x 3/8 = 450." },
      { topic: "Time & Work", stem: "A can do a work in 10 days, B in 15 days. In how many days will they finish it together?", options: ["6 days", "8 days", "7 days", "5 days"], correct: 0, explanation: "Combined rate = 1/10+1/15 = 1/6; time = 6 days." },
      { topic: "Time, Speed & Distance", stem: "A car travels 180 km in 3 hours. Find its speed.", options: ["60 km/h", "50 km/h", "70 km/h", "65 km/h"], correct: 0, explanation: "Speed = 180/3 = 60 km/h." },
      { topic: "Number Series", stem: "Find the next term: 3, 6, 12, 24, ?", options: ["48", "36", "42", "54"], correct: 0, explanation: "Each term doubles the previous: 24x2 = 48." },
      { topic: "Number System", stem: "Find the HCF of 18 and 24.", options: ["6", "4", "8", "12"], correct: 0, explanation: "18=2x3^2, 24=2^3x3; HCF = 2x3 = 6." },
      { topic: "Simplification", stem: "Simplify: (25x4) + (36 / 6).", options: ["106", "100", "110", "96"], correct: 0, explanation: "25x4=100; 36/6=6; sum = 106." },
      { topic: "Percentage", stem: "60 is what percent of 240?", options: ["25%", "20%", "30%", "15%"], correct: 0, explanation: "60/240 x 100 = 25%." },
      { topic: "Profit & Loss", stem: "An article marked at Rs. 500 is sold at a 10% discount. Find the selling price.", options: ["Rs. 450", "Rs. 480", "Rs. 400", "Rs. 460"], correct: 0, explanation: "SP = 500x0.9 = 450." },
      { topic: "Simple Interest", stem: "Find the rate percent if the SI on Rs. 4000 for 2 years is Rs. 800.", options: ["10%", "8%", "12%", "15%"], correct: 0, explanation: "Rate = SIx100/(PxT) = 800x100/8000 = 10%." },
      { topic: "Averages", stem: "The average of 5 numbers is 20. If one number is excluded, the average of the remaining 4 becomes 18. Find the excluded number.", options: ["28", "20", "24", "32"], correct: 0, explanation: "Total5=100, total4=72; excluded = 100-72 = 28." },
      { topic: "Ratio & Proportion", stem: "If a:b = 2:3 and b:c = 4:5, find a:b:c.", options: ["8:12:15", "2:3:5", "2:4:5", "6:9:15"], correct: 0, explanation: "Scale a:b by 4 and b:c by 3 to match b=12: a:b:c = 8:12:15." },
      { topic: "Time & Work", stem: "Pipe A fills a tank in 6 hours; pipe B empties it in 8 hours. If both are opened together, how long to fill the tank?", options: ["24 hours", "20 hours", "18 hours", "28 hours"], correct: 0, explanation: "Net rate = 1/6-1/8 = 1/24; time = 24 hours." },
      { topic: "Time, Speed & Distance", stem: "Two trains 150m and 100m long run in opposite directions at 30 km/h and 20 km/h. Find the time taken to cross each other.", options: ["18 sec", "20 sec", "15 sec", "22 sec"], correct: 0, explanation: "Relative speed = 50 km/h = 125/9 m/s; total distance = 250m; time = 250/(125/9) = 18 sec." },
    ],
  },
];
