// Standalone Reasoning Ability practice paper 5 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Reasoning Ability — Practice Paper 5";

export const PAPER = {
  slug: "reasoning-ability-practice-5",
  title: "Reasoning Ability Practice Paper 5",
  examType: "reasoning-ability",
  focusTags: ["Reasoning Ability", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 5,
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
      { topic: "Puzzles & Seating", stem: "Seven people sit in a row facing north. A sits fourth from the left. How many people sit to the right of A?", options: ["3", "2", "4", "5"], correct: 0, explanation: "With 7 people and A at position 4, the people to the right occupy positions 5, 6, 7 -- 3 people." },
      { topic: "Puzzles & Seating", stem: "In a circular arrangement of 8 people facing the center, B sits second to the right of A. If A is at position 1 (numbered clockwise 1-8), find B's position.", options: ["Position 2", "Position 3", "Position 4", "Position 5"], correct: 1, explanation: "Moving 2 positions clockwise (to the right) from position 1 gives position 3." },
      { topic: "Syllogism", stem: "Statements: All actors are famous. Some famous people are wealthy. Conclusion: Some actors are wealthy. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 1, explanation: "The wealthy famous people might not overlap with the ones who are actors -- the conclusion isn't guaranteed." },
      { topic: "Syllogism", stem: "Statements: Some artists are musicians. All musicians are creative. Conclusion: Some artists are creative. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 0, explanation: "The artists who are musicians must be creative (since all musicians are creative), so some artists are indeed creative." },
      { topic: "Coding-Decoding", stem: "If SILVER is written as TJMWFS (each letter shifted forward by 1), how is BRONZE coded?", options: ["CSPOAF", "CSPOAE", "CSPOAG", "BSPOAF"], correct: 0, explanation: "Shifting each letter forward by 1: B->C, R->S, O->P, N->O, Z->A (wraps around), E->F, giving CSPOAF." },
      { topic: "Coding-Decoding", stem: "If FRIEND is coded as HTKGPF (each letter shifted forward by 2), how is MOTHER coded?", options: ["OQVJGT", "OQVJGS", "NQVJGT", "OQVIGT"], correct: 0, explanation: "Shifting each letter forward by 2: M->O, O->Q, T->V, H->J, E->G, R->T, giving OQVJGT." },
      { topic: "Blood Relations", stem: "A is B's son. C is A's sister. D is C's husband. How is D related to B?", options: ["Son-in-law", "Son", "Brother-in-law", "Nephew"], correct: 0, explanation: "C is B's daughter (A's sister); D, being C's husband, is B's son-in-law." },
      { topic: "Blood Relations", stem: "Pointing to a photograph, a man said, \"Her son is my son's father.\" How is the woman in the photograph related to the man?", options: ["Grandmother", "Mother", "Aunt", "Sister"], correct: 0, explanation: "\"Her son is my son's father\" means her son is the man's father, making the woman the man's grandmother." },
      { topic: "Direction Sense", stem: "A person walks 20km north, then 15km east, then 20km south. Find his distance from the starting point.", options: ["15km", "20km", "25km", "10km"], correct: 0, explanation: "The north and south movements (20km each) cancel out, leaving only the 15km eastward displacement." },
      { topic: "Direction Sense", stem: "A man starts facing east, turns 180 degrees, then turns 90 degrees anticlockwise. Which direction does he face now?", options: ["South", "North", "East", "West"], correct: 0, explanation: "East (90 deg) + 180 = West (270 deg); turning 90 anticlockwise gives 270-90 = 180 deg, which is South." },
      { topic: "Inequality", stem: "Statements: A > B >= C, C > D. Conclusion: A > D. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if B=C"], correct: 0, explanation: "A>B>=C gives A>C, and combined with C>D, we get A>C>D, so A>D holds." },
      { topic: "Inequality", stem: "Statements: P >= Q, Q >= R, R >= S. Conclusion: P >= S. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if all equal"], correct: 0, explanation: "This follows directly from the transitivity of the >= relation across the whole chain." },
      { topic: "Series & Analogy", stem: "Find the next term: 4, 9, 16, 25, 36, ?", options: ["49", "42", "45", "48"], correct: 0, explanation: "These are perfect squares (2^2 to 6^2); the next is 7^2 = 49." },
      { topic: "Series & Analogy", stem: "Key is to Lock as Password is to?", options: ["Account", "Computer", "Screen", "Internet"], correct: 0, explanation: "A key opens a lock; a password grants access to an account, the closest functional parallel." },
      { topic: "Classification", stem: "Find the odd one out: Rose, Lily, Lotus, Mango.", options: ["Rose", "Lily", "Lotus", "Mango"], correct: 3, explanation: "Mango is a fruit; the others are all flowers." },
      { topic: "Classification", stem: "Find the odd pair: (2,8), (3,27), (4,64), (5,100).", options: ["(2,8)", "(3,27)", "(4,64)", "(5,100)"], correct: 3, explanation: "The pattern is (n, n^3): 2^3=8, 3^3=27, 4^3=64 all fit, but 5^3=125, not 100." },
      { topic: "Venn & Statement-Conclusion", stem: "Statements: All squares are quadrilaterals. All quadrilaterals are polygons. Conclusion: All squares are polygons. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only partially"], correct: 0, explanation: "This follows directly by transitivity: squares are quadrilaterals, and all quadrilaterals are polygons." },
      { topic: "Venn & Statement-Conclusion", stem: "Three circles represent Singers, Dancers, and Actors. The region common to all three represents:", options: ["People who are singers, dancers, and actors all at once", "People who are only singers", "People who are neither singers, dancers, nor actors", "People who are dancers but not singers"], correct: 0, explanation: "The region where all three circles overlap represents members belonging to all three sets simultaneously." },
      { topic: "Input-Output", stem: "Input: 90 kite 5 ball 27 doll. Step 1 arranges numbers in descending order, keeping words' relative positions. What is the output?", options: ["90 kite 27 ball 5 doll", "5 kite 27 ball 90 doll", "ball doll kite 90 27 5", "90 kite 5 ball 27 doll (unchanged)"], correct: 0, explanation: "The numbers 90, 5, 27 are rearranged in descending order (90, 27, 5), keeping each word in its original relative slot." },
      { topic: "Input-Output", stem: "Using the same machine, Step 2 arranges the words alphabetically, keeping the Step 1 numbers attached to their sequence position. Given Step 1 was \"90 kite 27 ball 5 doll\", what is the Step 2 output?", options: ["90 ball 27 doll 5 kite", "5 ball 27 doll 90 kite", "90 kite 27 doll 5 ball", "ball 90 doll 27 kite 5"], correct: 0, explanation: "Alphabetically, the words become ball, doll, kite; the Step 1 numbers (90, 27, 5) stay attached to their sequence position." },
    ],
  },
];
