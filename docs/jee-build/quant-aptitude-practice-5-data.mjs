// Standalone Quantitative Aptitude practice paper 5 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Quantitative Aptitude — Practice Paper 5";

export const PAPER = {
  slug: "quant-aptitude-practice-5",
  title: "Quantitative Aptitude Practice Paper 5",
  examType: "quant-aptitude",
  focusTags: ["Quantitative Aptitude", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 5,
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
      { topic: "Number System", stem: "Find the remainder when 2^50 is divided by 7.", options: ["4", "2", "1", "6"], correct: 0, explanation: "Powers of 2 mod 7 cycle every 3 (2,4,1). 50 mod 3 = 2, giving remainder 4." },
      { topic: "Simplification", stem: "Simplify: (12x8) - (15x4) + 20.", options: ["56", "60", "50", "64"], correct: 0, explanation: "96 - 60 + 20 = 56." },
      { topic: "Percentage", stem: "A's salary is 25% more than B's. By what percent is B's salary less than A's?", options: ["20%", "25%", "15%", "22%"], correct: 0, explanation: "If B=100, A=125; B is less than A by 25/125 x 100 = 20%." },
      { topic: "Profit & Loss", stem: "By selling an article for Rs. 720, a man loses 10%. Find the cost price.", options: ["Rs. 800", "Rs. 750", "Rs. 850", "Rs. 780"], correct: 0, explanation: "CP = 720/0.9 = 800." },
      { topic: "Compound Interest", stem: "A sum of Rs. 10000 amounts to Rs. 12100 in 2 years at compound interest. Find the rate percent per annum.", options: ["10%", "8%", "12%", "9%"], correct: 0, explanation: "12100/10000 = 1.21 = (1+r)^2; 1+r = 1.1; r = 10%." },
      { topic: "Averages", stem: "The average of 3 numbers is 45. If one of the numbers is 55, find the average of the other two.", options: ["40", "35", "45", "38"], correct: 0, explanation: "Total3 = 135; remaining sum = 80; average = 40." },
      { topic: "Ratio & Proportion", stem: "Two vessels contain milk and water in ratios 3:1 and 5:2 respectively. Which vessel has a higher proportion of milk?", options: ["Vessel 1 (3:1)", "Vessel 2 (5:2)", "Both equal", "Cannot be determined"], correct: 0, explanation: "Vessel 1: 3/4 = 0.75; Vessel 2: 5/7 approx 0.714; Vessel 1 has the higher milk proportion." },
      { topic: "Time & Work", stem: "A is twice as efficient as B. If B alone can complete a work in 24 days, find the time taken by A and B working together.", options: ["8 days", "10 days", "6 days", "12 days"], correct: 0, explanation: "A's rate = 2/24 = 1/12; combined rate = 1/12+1/24 = 1/8; time = 8 days." },
      { topic: "Time, Speed & Distance", stem: "A cyclist covers 15 km in 45 minutes. Find his speed in km/h.", options: ["20 km/h", "18 km/h", "22 km/h", "25 km/h"], correct: 0, explanation: "Speed = 15/(45/60) = 15/0.75 = 20 km/h." },
      { topic: "Time, Speed & Distance", stem: "A train 100m long crosses a pole in 5 seconds. Find its speed in km/h.", options: ["72 km/h", "60 km/h", "80 km/h", "65 km/h"], correct: 0, explanation: "Speed = 100/5 = 20 m/s = 20x18/5 = 72 km/h." },
      { topic: "Number Series", stem: "Find the next term: 100, 90, 81, 73, ?", options: ["66", "65", "68", "70"], correct: 0, explanation: "Differences decrease by 1 each time (10,9,8,7): next term = 73-7 = 66." },
      { topic: "Data Interpretation", stem: "In a survey of 1000 people, 45% like Product A, 35% like Product B, and the rest like neither. How many like neither?", options: ["200", "150", "250", "180"], correct: 0, explanation: "1000 - 450 - 350 = 200." },
      { topic: "Number System", stem: "Find the sum of all odd numbers from 1 to 50.", options: ["625", "600", "650", "575"], correct: 0, explanation: "There are 25 odd numbers from 1 to 49; sum = 25^2 = 625." },
      { topic: "Percentage", stem: "If the length of a rectangle is increased by 20% and the breadth decreased by 20%, find the net percentage change in area.", options: ["4% decrease", "No change", "4% increase", "8% decrease"], correct: 0, explanation: "Net% = x+y+xy/100 = 20-20+(20x-20)/100 = -4%, i.e. a 4% decrease." },
      { topic: "Profit & Loss", stem: "A dishonest dealer professes to sell his goods at cost price but uses a weight of 800g instead of 1kg. Find his profit percentage.", options: ["25%", "20%", "15%", "30%"], correct: 0, explanation: "Profit% = (1000-800)/800 x 100 = 25%." },
      { topic: "Simple Interest", stem: "A sum triples itself in 20 years at simple interest. Find the rate percent per annum.", options: ["10%", "15%", "8%", "12%"], correct: 0, explanation: "If P triples, SI=2P over 20 years; rate = 2Px100/(Px20) = 10%." },
      { topic: "Averages", stem: "The average height of 30 students is 150cm. The average height of 18 of them is 155cm. Find the average height of the remaining 12.", options: ["142.5 cm", "145 cm", "140 cm", "144 cm"], correct: 0, explanation: "Total30=4500; total18=2790; remaining12=1710; average = 1710/12 = 142.5 cm." },
      { topic: "Ratio & Proportion", stem: "The sum of three numbers is 98. The ratio between the first and second is 2:3, and between the second and third is 5:8. Find the second number.", options: ["30", "28", "32", "35"], correct: 0, explanation: "Setting second=x: first=2x/3, third=8x/5; 2x/3+x+8x/5=98 gives 49x/15=98, x=30." },
      { topic: "Time & Work", stem: "6 men and 8 women can complete a work in 10 days. In how many days can 3 men and 4 women (half the workforce) complete the same work?", options: ["20 days", "15 days", "18 days", "25 days"], correct: 0, explanation: "Half the workforce works at half the rate, so it takes double the time: 20 days." },
      { topic: "Time, Speed & Distance", stem: "A boat's speed in still water is 15 km/h. It travels 30 km upstream in 3 hours. Find the speed of the stream.", options: ["5 km/h", "4 km/h", "6 km/h", "3 km/h"], correct: 0, explanation: "Upstream speed = 30/3 = 10 km/h = 15 - stream speed; stream speed = 5 km/h." },
    ],
  },
];
