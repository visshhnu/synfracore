// Standalone Reasoning Ability practice paper 4 of 5. Same
// disclosure/sourcing discipline as paper 1 -- see that file's header
// comment for the full rationale.

export const HEADER_LABEL = "Reasoning Ability — Practice Paper 4";

export const PAPER = {
  slug: "reasoning-ability-practice-4",
  title: "Reasoning Ability Practice Paper 4",
  examType: "reasoning-ability",
  focusTags: ["Reasoning Ability", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 4,
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
      { topic: "Puzzles & Seating", stem: "Five people sit around a circular table facing the center. H sits immediately clockwise of (to the right of) G. I sits immediately clockwise of H. If G is at position 1 (numbered clockwise 1-5), find I's position.", options: ["Position 2", "Position 3", "Position 4", "Position 5"], correct: 1, explanation: "H is at position 2 (immediately clockwise of G); I is at position 3 (immediately clockwise of H)." },
      { topic: "Puzzles & Seating", stem: "In a row of 7 people, K sits exactly in the middle. L sits second to the right of K. Find L's position from the left end.", options: ["6th from left", "5th from left", "7th from left", "4th from left"], correct: 0, explanation: "The middle of 7 is position 4; second to the right of K is position 6." },
      { topic: "Syllogism", stem: "Statements: All rivers are water bodies. Some water bodies are polluted. Conclusion: Some rivers are polluted. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 1, explanation: "The polluted water bodies may not overlap with the ones that are rivers -- the conclusion isn't guaranteed." },
      { topic: "Syllogism", stem: "Statements: No fish are mammals. All whales are mammals. Conclusion: No whales are fish. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only partially"], correct: 0, explanation: "Since whales are a subset of mammals, and mammals share no overlap with fish, whales cannot overlap with fish either." },
      { topic: "Coding-Decoding", stem: "If HORSE is written as IPSTF (each letter shifted forward by 1), how is CAMEL coded?", options: ["DBNFM", "DBNFN", "DANFM", "DBMFM"], correct: 0, explanation: "Shifting each letter forward by 1: C->D, A->B, M->N, E->F, L->M, giving DBNFM." },
      { topic: "Coding-Decoding", stem: "In a code, CHAIR is written as 3-8-1-9-18 (each letter's position in the alphabet). What is the code for TABLE?", options: ["20-1-2-12-5", "20-1-2-11-5", "19-1-2-12-5", "20-2-1-12-5"], correct: 0, explanation: "T=20, A=1, B=2, L=12, E=5, giving the code 20-1-2-12-5." },
      { topic: "Blood Relations", stem: "M is N's mother. O is N's brother. P is O's son. How is P related to M?", options: ["Grandson", "Son", "Nephew", "Grandfather"], correct: 0, explanation: "O is M's child (N's brother), and P, being O's son, is M's grandson." },
      { topic: "Blood Relations", stem: "Introducing a girl, a man says, \"She is the daughter of my wife's brother.\" How is the girl related to the man?", options: ["Niece", "Daughter", "Sister", "Cousin"], correct: 0, explanation: "The wife's brother is the man's brother-in-law; his daughter is the man's niece by marriage." },
      { topic: "Direction Sense", stem: "A man walks 9km south, then 12km west. Find his distance from the starting point.", options: ["15km", "18km", "20km", "14km"], correct: 0, explanation: "Right triangle with legs 9 and 12; distance = sqrt(9^2+12^2) = sqrt(225) = 15km." },
      { topic: "Direction Sense", stem: "A man is facing north-west. He turns 135 degrees clockwise. Which direction is he facing now?", options: ["East", "South-East", "North", "West"], correct: 0, explanation: "North-West is 315 degrees on a compass bearing; adding 135 degrees clockwise gives 450 mod 360 = 90 degrees, which is East." },
      { topic: "Inequality", stem: "Statements: X <= Y < Z, Z <= W. Conclusion: X < W. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if X=Y"], correct: 0, explanation: "Since Y<Z strictly, even at the loosest bounds (X=Y and Z=W), X=Y<Z=W gives X<W." },
      { topic: "Inequality", stem: "Statements: A = B, B < C, C = D. Conclusions: I. A < D. II. A = D. Which follows?", options: ["Only I follows", "Only II follows", "Both follow", "Neither follows"], correct: 0, explanation: "A=B<C=D gives A<D (I); II can never hold since A is always strictly less than D." },
      { topic: "Series & Analogy", stem: "Find the next term: 1, 1, 2, 3, 5, 8, ?", options: ["13", "12", "14", "11"], correct: 0, explanation: "This is the Fibonacci sequence, where each term is the sum of the two before it: 5+8 = 13." },
      { topic: "Series & Analogy", stem: "Fish is to Water as Bird is to?", options: ["Air", "Nest", "Feather", "Tree"], correct: 0, explanation: "A fish's natural medium of movement is water; a bird's natural medium of movement is air." },
      { topic: "Classification", stem: "Find the odd one out: Guitar, Violin, Sitar, Flute.", options: ["Guitar", "Violin", "Sitar", "Flute"], correct: 3, explanation: "Guitar, Violin, and Sitar are string instruments; Flute is a wind instrument." },
      { topic: "Classification", stem: "Find the odd pair: (3,9), (4,16), (5,20), (6,36).", options: ["(3,9)", "(4,16)", "(5,20)", "(6,36)"], correct: 2, explanation: "The pattern is (n, n^2): 3^2=9, 4^2=16, 6^2=36 all fit, but 5^2=25, not 20." },
      { topic: "Venn & Statement-Conclusion", stem: "Statements: All pilots are trained. Some trained people are certified. Conclusion: Some pilots are certified. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 1, explanation: "The certified trained people might not overlap with the ones who are pilots -- the conclusion isn't guaranteed." },
      { topic: "Venn & Statement-Conclusion", stem: "Set A (Cricketers) and Set B (Left-handed people) overlap partially. Set C (Professionals) completely contains Set A. Which statement is definitely true?", options: ["All cricketers are professionals", "All professionals are cricketers", "No cricketer is left-handed", "All left-handed people are professionals"], correct: 0, explanation: "Since Set A is entirely contained within Set C, every cricketer is necessarily a professional." },
      { topic: "Input-Output", stem: "Input: 63 zebra 8 ant 41 monkey. Step 1 arranges numbers in ascending order, keeping words' relative positions. What is the output?", options: ["8 zebra 41 ant 63 monkey", "63 zebra 8 ant 41 monkey (unchanged)", "ant monkey zebra 8 41 63", "8 ant 41 monkey 63 zebra"], correct: 0, explanation: "The numbers 63, 8, 41 are rearranged in ascending order (8, 41, 63), keeping each word in its original relative slot." },
      { topic: "Input-Output", stem: "Using the same machine, Step 2 rearranges the words alphabetically, keeping the Step 1 numbers attached to their sequence position (not the words). Given Step 1 was \"8 zebra 41 ant 63 monkey\", what is the Step 2 output?", options: ["8 ant 41 monkey 63 zebra", "63 ant 41 monkey 8 zebra", "ant 8 monkey 41 zebra 63", "8 zebra 41 ant 63 monkey"], correct: 0, explanation: "Alphabetically, the words become ant, monkey, zebra; the Step 1 numbers (8, 41, 63) stay attached to their sequence position." },
    ],
  },
];
