// Standalone Quantitative Aptitude practice paper 4 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Quantitative Aptitude — Practice Paper 4";

export const PAPER = {
  slug: "quant-aptitude-practice-4",
  title: "Quantitative Aptitude Practice Paper 4",
  examType: "quant-aptitude",
  focusTags: ["Quantitative Aptitude", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 4,
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
      { topic: "Data Interpretation", stem: "Total sales of a company over 4 months were 100, 150, 200, 150 (in lakh Rs.). Find the average monthly sales.", options: ["Rs. 150 lakh", "Rs. 140 lakh", "Rs. 160 lakh", "Rs. 145 lakh"], correct: 0, explanation: "Sum = 600; average = 600/4 = 150 lakh." },
      { topic: "Data Interpretation", stem: "In a survey of 500 people, 60% prefer tea and the rest prefer coffee. How many prefer coffee?", options: ["200", "180", "220", "250"], correct: 0, explanation: "40% of 500 = 200." },
      { topic: "Data Interpretation", stem: "A bar graph shows production (in thousand units): Jan-40, Feb-55, Mar-45, Apr-60. Find the percentage increase from Jan to Apr.", options: ["50%", "40%", "45%", "60%"], correct: 0, explanation: "(60-40)/40 x 100 = 50%." },
      { topic: "Ratio & Proportion", stem: "Ages of A and B are in ratio 3:4. Five years hence, the ratio becomes 4:5. Find A's present age.", options: ["15 years", "20 years", "12 years", "18 years"], correct: 0, explanation: "Let ages be 3x,4x. (3x+5)/(4x+5)=4/5 gives x=5; A's age = 15." },
      { topic: "Ratio & Proportion", stem: "If a:b:c = 2:3:4 and a+b+c = 54, find b.", options: ["18", "12", "24", "16"], correct: 0, explanation: "9 parts = 54, each = 6; b = 3x6 = 18." },
      { topic: "Number Series", stem: "Find the next term: 1, 4, 9, 16, 25, ?", options: ["36", "30", "32", "49"], correct: 0, explanation: "These are perfect squares (1^2 to 5^2); next is 6^2 = 36." },
      { topic: "Number Series", stem: "Find the missing term: 7, 14, 28, 56, ?", options: ["112", "98", "120", "100"], correct: 0, explanation: "Each term doubles the previous: 56x2 = 112." },
      { topic: "Averages", stem: "Average marks of 25 students is 60. If 5 students with average 40 are excluded, find the new average of the remaining 20.", options: ["65", "62", "68", "60"], correct: 0, explanation: "Total25=1500; excluded5 total=200; remaining=1300; new average = 1300/20 = 65." },
      { topic: "Percentage", stem: "The price of an item increases from Rs. 80 to Rs. 100. Find the percentage increase.", options: ["25%", "20%", "30%", "22%"], correct: 0, explanation: "(20/80) x 100 = 25%." },
      { topic: "Percentage", stem: "A 20% reduction in the price of sugar enables a person to buy 5 kg more for Rs. 800. Find the reduced price per kg.", options: ["Rs. 32", "Rs. 36", "Rs. 30", "Rs. 34"], correct: 0, explanation: "Let original price=p. 800/(0.8p) - 800/p = 5 gives 200/p = 5, p=40; reduced price = 0.8x40 = 32." },
      { topic: "Profit & Loss", stem: "A man buys an article for Rs. 500 and sells it for Rs. 575. Find the gain percentage.", options: ["15%", "12%", "18%", "10%"], correct: 0, explanation: "Gain = 75; gain% = 75/500 x 100 = 15%." },
      { topic: "Simple Interest", stem: "Find the amount on Rs. 6000 at 5% p.a. simple interest for 4 years.", options: ["Rs. 7200", "Rs. 7000", "Rs. 7500", "Rs. 6800"], correct: 0, explanation: "SI = 6000x5x4/100 = 1200; amount = 7200." },
      { topic: "Time & Work", stem: "8 men or 12 women can complete a work in 10 days. Find the time taken by 4 men and 6 women working together.", options: ["10 days", "8 days", "12 days", "15 days"], correct: 0, explanation: "1 man's rate=1/80, 1 woman's rate=1/120; 4 men+6 women rate = 4/80+6/120 = 1/20+1/20 = 1/10; time = 10 days." },
      { topic: "Time, Speed & Distance", stem: "Two cars start from the same point at the same time in opposite directions at 40 km/h and 60 km/h. Find the distance between them after 2 hours.", options: ["200 km", "180 km", "220 km", "240 km"], correct: 0, explanation: "Relative speed (opposite directions) = 100 km/h; distance = 100x2 = 200 km." },
      { topic: "Time, Speed & Distance", stem: "A man covers a distance at 40 km/h and returns at 60 km/h. Find his average speed for the entire journey.", options: ["48 km/h", "50 km/h", "45 km/h", "52 km/h"], correct: 0, explanation: "Average speed = 2xy/(x+y) = 2x40x60/100 = 48 km/h." },
      { topic: "Number System", stem: "Find the number of factors of 36.", options: ["9", "6", "8", "10"], correct: 0, explanation: "36=2^2x3^2; number of factors = (2+1)(2+1) = 9." },
      { topic: "Ratio & Proportion", stem: "The ratio of incomes of A and B is 5:4, and the ratio of their expenditures is 3:2. If each saves Rs. 1000, find A's income.", options: ["Rs. 2500", "Rs. 2000", "Rs. 3000", "Rs. 2800"], correct: 0, explanation: "Solving 5x-3y=1000 and 4x-2y=1000 gives x=500; A's income = 5x500 = 2500." },
      { topic: "Averages", stem: "Average of 11 results is 50. Average of the first 6 is 49 and the last 6 is 52. Find the 6th result.", options: ["56", "52", "58", "54"], correct: 0, explanation: "Sum11=550; sum(first6)=294; sum(last6)=312; 6th = 294+312-550 = 56." },
      { topic: "Data Interpretation", stem: "In a school of 800 students, the ratio of boys to girls is 3:5. Find the number of girls.", options: ["500", "480", "520", "450"], correct: 0, explanation: "8 parts=800; girls = 5x100 = 500." },
      { topic: "Number Series", stem: "Find the wrong number in the series: 2, 5, 10, 17, 26, 36.", options: ["36", "26", "17", "10"], correct: 0, explanation: "Differences follow odd numbers 3,5,7,9,11: 2,5,10,17,26,37 expected -- 36 is wrong (should be 37)." },
    ],
  },
];
