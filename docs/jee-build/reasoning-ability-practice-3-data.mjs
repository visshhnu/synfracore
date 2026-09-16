// Standalone Reasoning Ability practice paper 3 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Reasoning Ability — Practice Paper 3";

export const PAPER = {
  slug: "reasoning-ability-practice-3",
  title: "Reasoning Ability Practice Paper 3",
  examType: "reasoning-ability",
  focusTags: ["Reasoning Ability", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 3,
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
      { topic: "Puzzles & Seating", stem: "Six people sit in a row facing north. C sits at the left end. D sits at the right end. How many people sit between C and D?", options: ["4", "3", "5", "2"], correct: 0, explanation: "With 6 people in a row and C, D at the two ends (positions 1 and 6), the people between them occupy positions 2, 3, 4, 5 -- 4 people." },
      { topic: "Puzzles & Seating", stem: "In a row of 5 people facing north, E is immediately left of F. G is at the right end. If F is third from the left, where does E sit?", options: ["Position 1", "Position 2", "Position 3", "Position 4"], correct: 1, explanation: "F is at position 3; E, immediately left of F, is at position 2." },
      { topic: "Syllogism", stem: "Statements: All lions are carnivores. All carnivores are animals. Conclusion: All lions are animals. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only partially"], correct: 0, explanation: "This follows directly by transitivity: lions are carnivores, and all carnivores are animals." },
      { topic: "Syllogism", stem: "Statements: Some birds can fly. All flying creatures are agile. Conclusion: Some birds are agile. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 0, explanation: "The birds that can fly must be agile (since all flying creatures are agile), so some birds are indeed agile." },
      { topic: "Coding-Decoding", stem: "If APPLE is coded as 1-16-16-12-5 (using A=1, B=2, ...), what is the code for GRAPE?", options: ["7-18-1-16-5", "7-17-1-16-5", "7-18-1-15-5", "6-18-1-16-5"], correct: 0, explanation: "G=7, R=18, A=1, P=16, E=5, giving the code 7-18-1-16-5." },
      { topic: "Coding-Decoding", stem: "If CAT is coded as DBU (each letter shifted forward by 1), how is DOG coded?", options: ["EPH", "EPG", "DPH", "EOH"], correct: 0, explanation: "Shifting each letter forward by 1: D->E, O->P, G->H, giving EPH." },
      { topic: "Blood Relations", stem: "A is B's father. C is B's son. D is C's sister. How is D related to A?", options: ["Granddaughter", "Daughter", "Niece", "Grandmother"], correct: 0, explanation: "D is C's sister, so D is also B's daughter; since B is A's child, D is A's granddaughter." },
      { topic: "Blood Relations", stem: "P is the brother of Q. Q is the daughter of R. S is R's husband. How is S related to P?", options: ["Father", "Uncle", "Grandfather", "Brother-in-law"], correct: 0, explanation: "R is Q's parent and, since P is Q's brother, also P's parent; S, being R's husband, is P's father." },
      { topic: "Direction Sense", stem: "A person walks 7km east, then 24km north. Find his distance from the starting point.", options: ["25km", "28km", "30km", "22km"], correct: 0, explanation: "Right triangle with legs 7 and 24; distance = sqrt(7^2+24^2) = sqrt(625) = 25km." },
      { topic: "Direction Sense", stem: "Facing south, a person turns 90 degrees anticlockwise. Which direction is he facing now?", options: ["East", "West", "North", "South"], correct: 0, explanation: "South is 180 degrees on a compass; turning 90 anticlockwise gives 90 degrees, which is East." },
      { topic: "Inequality", stem: "Statements: A >= B > C >= D. Conclusion: A > D. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if A=B"], correct: 0, explanation: "Since B>C strictly, even at the loosest bounds (A=B and C=D), A=B>C=D gives A>D." },
      { topic: "Inequality", stem: "Statements: P < Q, Q <= R, R < S. Conclusions: I. P < S. II. P < R. Which follow?", options: ["Both I and II follow", "Only I follows", "Only II follows", "Neither follows"], correct: 0, explanation: "P<Q<=R<S gives P<S (I); and P<Q<=R means P<R also holds (II), since even at Q=R, P<Q=R." },
      { topic: "Series & Analogy", stem: "Find the next term: Z, Y, X, W, ?", options: ["V", "U", "T", "W"], correct: 0, explanation: "This is the alphabet in reverse order; after W comes V." },
      { topic: "Series & Analogy", stem: "Pen is to Write as Knife is to?", options: ["Cut", "Sharp", "Kitchen", "Blade"], correct: 0, explanation: "A pen's primary function is to write; a knife's primary function is to cut." },
      { topic: "Classification", stem: "Find the odd one out: Delhi, Mumbai, Chennai, India.", options: ["Delhi", "Mumbai", "Chennai", "India"], correct: 3, explanation: "India is a country; the others are all cities." },
      { topic: "Classification", stem: "Find the odd one out: 121, 144, 169, 200.", options: ["121", "144", "169", "200"], correct: 3, explanation: "121, 144, and 169 are perfect squares (11^2, 12^2, 13^2); 200 is not." },
      { topic: "Venn & Statement-Conclusion", stem: "Statements: All roses are flowers. Some flowers fade quickly. Conclusion: Some roses fade quickly. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 1, explanation: "The flowers that fade quickly might not overlap with the flowers that are roses -- the conclusion isn't guaranteed." },
      { topic: "Venn & Statement-Conclusion", stem: "Two overlapping circles represent \"Employed\" and \"Graduates.\" The overlapping region represents:", options: ["People who are both employed and graduates", "People who are neither employed nor graduates", "People who are only employed", "People who are only graduates"], correct: 0, explanation: "The overlapping region of a Venn diagram always represents members common to both sets." },
      { topic: "Input-Output", stem: "Input: 50 apple 12 ball 77 cat. Step 1 arranges numbers in descending order, keeping words' relative positions. What is the output?", options: ["77 apple 50 ball 12 cat", "12 apple 50 ball 77 cat", "apple ball cat 77 50 12", "50 apple 12 ball 77 cat (unchanged)"], correct: 0, explanation: "The numbers 50, 12, 77 are rearranged in descending order (77, 50, 12), keeping each word in its original relative slot." },
      { topic: "Input-Output", stem: "Using the same machine, Step 2 arranges the words in alphabetical order, keeping the Step 1 numbers attached to their original word. Given Step 1 was \"77 apple 50 ball 12 cat\", what is the Step 2 output?", options: ["77 apple 50 ball 12 cat (unchanged)", "12 apple 50 ball 77 cat", "apple 77 ball 50 cat 12", "50 apple 12 ball 77 cat"], correct: 0, explanation: "The words apple, ball, cat are already in alphabetical order, so Step 2 produces no change from Step 1." },
    ],
  },
];
