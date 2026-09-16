// Standalone Reasoning Ability practice paper 1 of 5. Not tied to any
// single exam's citation -- authored to match the real reasoning
// sections tested across Banking (SBI/IBPS), SSC, Railways, and State
// PSC exams generically, mixed-topic per paper (matching how these
// exams actually structure their reasoning sections), same discipline
// as every authored practice paper this session: not copied from any
// official question paper, explicit disclosure.

export const HEADER_LABEL = "Reasoning Ability — Practice Paper 1";

export const PAPER = {
  slug: "reasoning-ability-practice-1",
  title: "Reasoning Ability Practice Paper 1",
  examType: "reasoning-ability",
  focusTags: ["Reasoning Ability", "Banking", "SSC", "Railways", "State PSC"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 15,
  positiveMarks: 1,
  negativeMarks: 0.25,
};

const REASONING_SRC = "Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam's specific paper.";

export const SECTIONS = [
  {
    name: "Reasoning Ability",
    subject: "Reasoning",
    sourceNote: REASONING_SRC,
    questions: [
      { topic: "Puzzles & Seating", stem: "Five people A, B, C, D, E sit in a row facing north. B is second from the left. C sits immediately right of B. Who sits third from the left?", options: ["A", "B", "C", "E"], correct: 2, explanation: "B is at position 2. C sits immediately right of B, so C is at position 3." },
      { topic: "Puzzles & Seating", stem: "Six people sit around a circular table facing the center. P sits third to the right of Q. If Q is at position 1 (numbered clockwise 1-6), where does P sit?", options: ["Position 3", "Position 4", "Position 5", "Position 6"], correct: 1, explanation: "Moving 3 positions clockwise from position 1 gives position 4." },
      { topic: "Syllogism", stem: "Statements: All cats are animals. Some animals are wild. Conclusion: Some cats are wild. Is this valid?", options: ["Definitely true", "Not necessarily true", "Definitely false", "Cannot be determined"], correct: 1, explanation: "The wild animals may not overlap with the specific animals that are cats, so the conclusion is only a possibility, not a certainty." },
      { topic: "Syllogism", stem: "Statements: No teachers are students. All students are learners. Conclusion: No teachers are learners. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if reversed"], correct: 1, explanation: "Teachers could still be learners through a category other than 'students' -- the premises don't rule that out, so the conclusion doesn't necessarily follow." },
      { topic: "Coding-Decoding", stem: "If in a code, BOOK is written as CPPL (each letter shifted forward by 1), how is PAGE written?", options: ["QBHF", "QBGF", "QAHF", "PBHF"], correct: 0, explanation: "Shifting each letter forward by 1: P->Q, A->B, G->H, E->F, giving QBHF." },
      { topic: "Coding-Decoding", stem: "If MANGO is coded as NBOHP (each letter shifted forward by 1), how is APPLE coded?", options: ["BQQMF", "BQQLF", "AQQMF", "BPQMF"], correct: 0, explanation: "Shifting each letter forward by 1: A->B, P->Q, P->Q, L->M, E->F, giving BQQMF." },
      { topic: "Blood Relations", stem: "A is B's father. C is B's sister. D is C's husband. How is D related to A?", options: ["Son-in-law", "Son", "Brother-in-law", "Nephew"], correct: 0, explanation: "C is B's sister, so C is also A's daughter; D, being C's husband, is A's son-in-law." },
      { topic: "Blood Relations", stem: "Pointing to a man, a woman said, \"He is the son of my mother's only daughter.\" How is the man related to the woman?", options: ["Son", "Brother", "Nephew", "Cousin"], correct: 0, explanation: "\"My mother's only daughter\" refers to the woman herself, so the man is her son." },
      { topic: "Direction Sense", stem: "A man walks 8km west, then 6km south. How far is he from his starting point?", options: ["10km", "12km", "14km", "8km"], correct: 0, explanation: "This forms a right triangle with legs 8 and 6; distance = sqrt(8^2+6^2) = sqrt(100) = 10km." },
      { topic: "Direction Sense", stem: "Facing north, a man turns 90 degrees clockwise, then 180 degrees. Which direction is he facing now?", options: ["West", "East", "South", "North"], correct: 0, explanation: "North -> 90 clockwise -> East -> 180 degrees -> West." },
      { topic: "Inequality", stem: "Statements: P >= Q, Q > R, R >= S. Conclusion: P > S. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only if P=Q"], correct: 0, explanation: "Since Q>R strictly, even at the loosest bounds (P=Q and R=S), P=Q>R=S gives P>S -- valid in every case." },
      { topic: "Inequality", stem: "Statements: X < Y, Y < Z. Conclusions: I. X < Z. II. Z > X. Which follow?", options: ["Both I and II follow", "Only I follows", "Only II follows", "Neither follows"], correct: 0, explanation: "X<Y<Z directly gives X<Z (I), which is logically identical to Z>X (II) -- both follow." },
      { topic: "Series & Analogy", stem: "Find the next term: A, C, F, J, ?", options: ["O", "N", "P", "M"], correct: 0, explanation: "The gaps between letters increase by 1 each time (2,3,4,5): J+5 positions = O." },
      { topic: "Series & Analogy", stem: "Book is to Library as Painting is to?", options: ["Gallery", "Frame", "Artist", "Wall"], correct: 0, explanation: "A library is where books are collected and displayed; a gallery serves the same role for paintings." },
      { topic: "Classification", stem: "Find the odd one out: Apple, Banana, Carrot, Mango.", options: ["Apple", "Banana", "Carrot", "Mango"], correct: 2, explanation: "Carrot is a vegetable; the others are all fruits." },
      { topic: "Classification", stem: "Find the odd one out: 8, 27, 64, 100.", options: ["8", "27", "64", "100"], correct: 3, explanation: "8, 27, and 64 are perfect cubes (2^3, 3^3, 4^3); 100 is not a perfect cube." },
      { topic: "Venn & Statement-Conclusion", stem: "Statements: All doctors are engineers. All engineers are graduates. Conclusion: All doctors are graduates. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Valid only partially"], correct: 0, explanation: "This follows by transitivity: doctors are a subset of engineers, which are a subset of graduates." },
      { topic: "Venn & Statement-Conclusion", stem: "In a class, some students play chess, some play football, and some play both. If drawn as two overlapping circles, the overlapping region represents:", options: ["Students who play both chess and football", "Students who play neither game", "Students who play only chess", "Students who play only football"], correct: 0, explanation: "The overlapping region of a Venn diagram always represents members common to both sets." },
      { topic: "Input-Output", stem: "In a certain input-output machine, numbers in a string are rearranged in descending order while words keep their relative position unchanged. Input: 25 cat 9 dog 42 elephant. What is the output after Step 1?", options: ["42 cat 25 dog 9 elephant", "9 cat 25 dog 42 elephant", "cat dog elephant 42 25 9", "25 cat 9 dog 42 elephant (unchanged)"], correct: 0, explanation: "The numbers 25, 9, 42 are rearranged in descending order (42, 25, 9), keeping each word in its original relative slot." },
      { topic: "Input-Output", stem: "Using the same machine as above, Step 2 arranges the words in alphabetical order (numbers stay as positioned in Step 1). What is the output after Step 2, given Step 1 was \"42 cat 25 dog 9 elephant\"?", options: ["42 cat 25 dog 9 elephant", "cat 42 dog 25 elephant 9", "42 dog 25 cat 9 elephant", "9 elephant 25 dog 42 cat"], correct: 0, explanation: "The words cat, dog, elephant are already in alphabetical order, so Step 2 produces no change from Step 1." },
    ],
  },
];
