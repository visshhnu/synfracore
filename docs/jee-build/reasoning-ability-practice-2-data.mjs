// Standalone Reasoning Ability practice paper 2 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Reasoning Ability — Practice Paper 2";

export const PAPER = {
  slug: "reasoning-ability-practice-2",
  title: "Reasoning Ability Practice Paper 2",
  examType: "reasoning-ability",
  focusTags: ["Reasoning Ability", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 2,
  timeLimitMinutes: 15,
  positiveMarks: 1,
  negativeMarks: 0.25,
};

const REASONING_SRC = "Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper.";

export const SECTIONS = [
  {
    name: "Reasoning Ability",
    subject: "Reasoning",
    sourceNote: REASONING_SRC,
    questions: [
      { topic: "Puzzles & Seating", stem: "Seven people sit in a row. F sits at one end. G sits fourth from F. How many people are between F and G?", options: ["2", "3", "4", "1"], correct: 0, explanation: "F is at position 1, G is at position 4; the people between them are at positions 2 and 3 -- 2 people." },
      { topic: "Puzzles & Seating", stem: "In a circular arrangement of 8 people facing the center, X sits fourth to the left of Y. If Y is at position 3 (numbered clockwise 1-8), find X's position.", options: ["Position 6", "Position 7", "Position 8", "Position 5"], correct: 1, explanation: "Moving 4 positions counter-clockwise (to the left) from position 3 gives position 7 (3-4 = -1, wrapping to 8-1+1... i.e. position 7)." },
      { topic: "Syllogism", stem: "Statements: Some fruits are vegetables. All vegetables are healthy. Conclusion: Some fruits are healthy. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 0, explanation: "The fruits that are vegetables must be healthy (since all vegetables are healthy), so some fruits are indeed healthy." },
      { topic: "Syllogism", stem: "Statements: All squares are rectangles. No rectangle is a triangle. Conclusion: No square is a triangle. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only partially"], correct: 0, explanation: "Since squares are a subset of rectangles, and rectangles share no overlap with triangles, squares cannot overlap with triangles either." },
      { topic: "Coding-Decoding", stem: "If WATER is written as XBUFS (each letter shifted forward by 1), how is EARTH coded?", options: ["FBSUI", "FBSUJ", "EBSUI", "FBSTI"], correct: 0, explanation: "Shifting each letter forward by 1: E->F, A->B, R->S, T->U, H->I, giving FBSUI." },
      { topic: "Coding-Decoding", stem: "If TIGER is coded as UJHFS (each letter shifted forward by 1), how is LION coded?", options: ["MJPO", "MJPP", "MIPO", "MJOP"], correct: 0, explanation: "Shifting each letter forward by 1: L->M, I->J, O->P, N->O, giving MJPO." },
      { topic: "Blood Relations", stem: "A woman says, \"B's mother is the only daughter of my mother.\" How is A related to B, if the woman is A?", options: ["Mother", "Grandmother", "Aunt", "Sister"], correct: 0, explanation: "\"My mother's only daughter\" refers to A herself, meaning B's mother is A -- so A is B's mother." },
      { topic: "Blood Relations", stem: "P is Q's brother. R is P's mother. S is R's father. How is S related to Q?", options: ["Grandfather", "Father", "Uncle", "Great-grandfather"], correct: 0, explanation: "R is P's mother and, since P and Q are siblings, also Q's mother; S, being R's father, is Q's maternal grandfather." },
      { topic: "Direction Sense", stem: "A person starts from point A, walks 12km north to B, then 5km east to C. Find the distance between A and C.", options: ["13km", "15km", "17km", "10km"], correct: 0, explanation: "Right triangle with legs 12 and 5; distance = sqrt(12^2+5^2) = sqrt(169) = 13km." },
      { topic: "Direction Sense", stem: "A man is facing east. He turns 45 degrees clockwise, then 90 degrees clockwise. Which direction is he facing now (approximately)?", options: ["South-West", "North-West", "South-East", "North-East"], correct: 0, explanation: "East (90 deg bearing) + 45 = 135 deg (South-East) + 90 = 225 deg (South-West)." },
      { topic: "Inequality", stem: "Statements: M <= N, N < O, O <= P. Conclusion: M < P. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if M=N"], correct: 0, explanation: "Since N<O strictly, even at the loosest bounds (M=N and O=P), M=N<O=P gives M<P -- valid in every case." },
      { topic: "Inequality", stem: "Statements: A > B, B = C, C > D. Conclusions: I. A > D. II. A = D. Which follow?", options: ["Only I follows", "Only II follows", "Both follow", "Neither follows"], correct: 0, explanation: "A>B=C>D gives A>D (I), and II can never hold since A is always strictly greater than D." },
      { topic: "Series & Analogy", stem: "Find the next term: 2, 6, 12, 20, 30, ?", options: ["42", "40", "36", "44"], correct: 0, explanation: "Each term is n(n+1): 1x2, 2x3, 3x4, 4x5, 5x6, next is 6x7 = 42." },
      { topic: "Series & Analogy", stem: "Doctor is to Hospital as Teacher is to?", options: ["School", "Book", "Student", "Classroom"], correct: 0, explanation: "A hospital is a doctor's primary workplace; a school serves the same role for a teacher." },
      { topic: "Classification", stem: "Find the odd one out: Triangle, Square, Circle, Cube.", options: ["Triangle", "Square", "Circle", "Cube"], correct: 3, explanation: "Cube is a three-dimensional solid; the others are all two-dimensional shapes." },
      { topic: "Classification", stem: "Find the odd pair: (4,16), (5,25), (6,35), (7,49).", options: ["(4,16)", "(5,25)", "(6,35)", "(7,49)"], correct: 2, explanation: "The pattern is (n, n^2): 4^2=16, 5^2=25, 7^2=49 all fit, but 6^2=36, not 35." },
      { topic: "Venn & Statement-Conclusion", stem: "Statements: No pens are pencils. All pencils are stationery. Conclusion: No pens are stationery. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 1, explanation: "Pens could still be stationery through a category other than 'pencils' -- the premises don't rule that out." },
      { topic: "Venn & Statement-Conclusion", stem: "Three circles represent Athletes, Students, and Married persons. If some athletes are students, some students are married, but no athlete is married, what is the three-way overlap (Athletes, Students, Married all at once)?", options: ["Zero (no common region among all three)", "One large overlapping region", "Two separate regions", "Cannot be determined"], correct: 0, explanation: "Since no athlete is married, there can be no region where Athletes, Students, and Married all overlap." },
      { topic: "Input-Output", stem: "Input: 18 fox 33 lion 7 tiger. Step 1 arranges numbers in ascending order, keeping words' relative positions. What is the output?", options: ["7 fox 18 lion 33 tiger", "33 fox 18 lion 7 tiger", "fox lion tiger 7 18 33", "18 fox 33 lion 7 tiger (unchanged)"], correct: 0, explanation: "The numbers 18, 33, 7 are rearranged in ascending order (7, 18, 33), keeping each word in its original relative slot." },
      { topic: "Input-Output", stem: "Using the same machine, Step 2 arranges the words in reverse alphabetical order, while the numbers stay in their Step 1 sequence (7, 18, 33) attached to the new word order. Given Step 1 was \"7 fox 18 lion 33 tiger\", what is the Step 2 output?", options: ["7 tiger 18 lion 33 fox", "33 tiger 18 lion 7 fox", "tiger lion fox 33 18 7", "7 fox 18 lion 33 tiger"], correct: 0, explanation: "Reverse alphabetical order of fox, lion, tiger is tiger, lion, fox; the Step 1 numbers (7, 18, 33) stay attached to their sequence position." },
    ],
  },
];
