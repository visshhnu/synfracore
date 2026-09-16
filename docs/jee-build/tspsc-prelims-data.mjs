// TSPSC (Telangana) Group I Prelims -- Practice Paper 1. Real exam
// structure: single paper, 150 objective questions, 150 marks (1 mark
// each), 2.5 hours, purely QUALIFYING (Prelims marks never count toward
// final merit). Negative marking has genuinely conflicting information
// across sources checked (some state 1/3 mark deducted per wrong answer,
// others state none) -- disclosed honestly below rather than picking one
// arbitrarily. Mains: 6 descriptive papers + a qualifying English paper.
//
// SOURCING: authored from TSPSC's own published Prelims syllabus
// (General Studies & Mental Ability) -- same discipline as SSC CGL/
// TNPSC/MPSC Prelims. Real, disclosed limitation: TSPSC's Mains
// descriptive papers were checked (official pattern searches, coaching
// aggregators, a paid civiccentre.in product listing) and, like TNPSC
// and MPSC, none offered real Mains question text as fetchable web
// content -- only PDF downloads or a paywalled product page with no
// preview text. Mains is therefore NOT built for TSPSC -- disclosed
// here and in the technology's overview page, not silently skipped.

export const HEADER_LABEL = "TSPSC Group I Prelims — Practice Paper 1";

export const PAPER = {
  slug: "tspsc-prelims-practice-1",
  title: "TSPSC Group I Prelims Practice Paper 1",
  examType: "tspsc",
  focusTags: ["TSPSC", "Group I", "Prelims", "Telangana", "General Studies", "Mental Ability"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 18,
  positiveMarks: 1,
  // NOTE: TSPSC's own negative-marking policy for Prelims has genuinely
  // conflicting information across the sources checked -- some state
  // 1/3 mark deducted per wrong answer, others state zero negative
  // marking. Rather than guess, this is set to 0 (matching the more
  // frequently repeated and more recently sourced claim across the
  // checked pages), with the ambiguity itself disclosed in the
  // technology's overview page for anyone relying on this for real exam
  // prep to verify against the current official notification directly.
  negativeMarks: 0,
};

const GS_SRC = "General Studies — authored from TSPSC Group I's own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.";
const MENTAL_SRC = "Mental Ability — authored from TSPSC's own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.";

export const SECTIONS = [
  {
    name: "General Studies",
    subject: "General Studies",
    sourceNote: GS_SRC,
    questions: [
      { topic: "Telangana Movement", stem: "The Telangana Rebellion (1946-51), a peasant armed struggle against feudal landlords, was significantly led by which political organization?", options: ["Indian National Congress", "Communist Party of India", "Hyderabad State Congress", "Andhra Mahasabha alone, unaffiliated with any party"], correct: 1, explanation: "The Communist Party of India played a central leadership role in the Telangana Rebellion, an armed peasant struggle against feudal landlords (Deshmukhs) and the Nizam's rule." },
      { topic: "Telangana Formation", stem: "The state of Telangana was formally carved out of Andhra Pradesh in which year?", options: ["2012", "2013", "2014", "2015"], correct: 2, explanation: "Telangana became India's 29th state on 2 June 2014, formed by bifurcating the erstwhile Andhra Pradesh." },
      { topic: "Telangana Culture", stem: "Bathukamma, a floral festival celebrated predominantly by women, is a distinctive cultural tradition of which state?", options: ["Andhra Pradesh", "Telangana", "Karnataka", "Tamil Nadu"], correct: 1, explanation: "Bathukamma is a distinctive floral festival of Telangana, celebrated over nine days, now also recognized as a state festival." },
      { topic: "Indian Polity", stem: "The Anti-Defection Law in India is contained in which Schedule of the Constitution?", options: ["Ninth Schedule", "Tenth Schedule", "Eleventh Schedule", "Twelfth Schedule"], correct: 1, explanation: "The Tenth Schedule, added by the 52nd Amendment (1985), contains the Anti-Defection provisions." },
      { topic: "Telangana Geography", stem: "The Kaleshwaram Lift Irrigation Project, one of the world's largest multi-stage lift irrigation schemes, is built primarily on which river?", options: ["Krishna", "Godavari", "Musi", "Manjira"], correct: 1, explanation: "The Kaleshwaram Lift Irrigation Project draws water from the Godavari river, lifting it across multiple stages to irrigate Telangana's drought-prone regions." },
      { topic: "Indian Economy", stem: "Which of the following best describes 'Fiscal Deficit'?", options: ["Total revenue minus total expenditure", "Total expenditure minus total receipts excluding borrowings", "Total borrowings minus total revenue", "Total exports minus total imports"], correct: 1, explanation: "Fiscal deficit is the excess of total government expenditure over total receipts (revenue plus non-debt capital receipts), excluding borrowings themselves." },
      { topic: "Science & Technology", stem: "The Defence Research and Development Organisation (DRDO) has a major missile-technology research complex located in which Telangana city?", options: ["Warangal", "Hyderabad", "Karimnagar", "Nizamabad"], correct: 1, explanation: "Hyderabad hosts several major DRDO facilities, including missile and defence research complexes." },
      { topic: "Telangana History", stem: "The Golconda Fort, a major historical fortification near Hyderabad, was the capital of which dynasty before the Mughal conquest?", options: ["Qutb Shahi dynasty", "Nizam Shahi dynasty", "Bahmani Sultanate exclusively", "Vijayanagara Empire"], correct: 0, explanation: "Golconda Fort served as the capital of the Qutb Shahi dynasty until the Mughal conquest in 1687." },
      { topic: "Indian Polity — Fundamental Rights", stem: "The Right to Education (Article 21A), making free and compulsory education a fundamental right for children aged 6-14, was added by which amendment?", options: ["42nd Amendment", "86th Amendment", "93rd Amendment", "44th Amendment"], correct: 1, explanation: "The 86th Constitutional Amendment (2002) inserted Article 21A, making education a fundamental right for children aged 6-14." },
      { topic: "Current Affairs — Schemes", stem: "The Rythu Bandhu scheme (and its successor schemes), providing direct investment support to farmers, was a flagship initiative associated with which state?", options: ["Andhra Pradesh", "Telangana", "Karnataka", "Tamil Nadu"], correct: 1, explanation: "Rythu Bandhu was Telangana's flagship farmer investment-support scheme, providing direct per-acre cash assistance." },
    ],
  },
  {
    name: "Mental Ability",
    subject: "Mental Ability",
    sourceNote: MENTAL_SRC,
    questions: [
      { topic: "Logical Reasoning", stem: "If 'PAPER' is coded as 'QBQFS' (each letter shifted forward by 1), how is 'PENCIL' coded?", options: ["QFODJM", "QEODJM", "QFOCJM", "PFODJM"], correct: 0, explanation: "Shifting each letter forward by 1: P→Q, E→F, N→O, C→D, I→J, L→M, giving QFODJM." },
      { topic: "Number Series", stem: "Find the next term: 6, 13, 27, 55, 111, ?", options: ["220", "221", "222", "223"], correct: 3, explanation: "Each term roughly doubles and adds 1 (6×2+1=13, 13×2+1=27, 27×2+1=55, 55×2+1=111); next is 111×2+1=223." },
      { topic: "Basic Numeracy", stem: "A worker earns ₹450 for 6 hours of work. What is the hourly rate?", options: ["₹65", "₹70", "₹75", "₹80"], correct: 2, explanation: "Hourly rate = 450/6 = ₹75." },
      { topic: "Data Interpretation", stem: "If a survey shows 40% of 250 respondents prefer option A, how many respondents is that?", options: ["90", "95", "100", "105"], correct: 2, explanation: "40% of 250 = 100 respondents." },
      { topic: "Blood Relations", stem: "If P is Q's mother and R is P's father, how is R related to Q?", options: ["Father", "Grandfather", "Uncle", "Brother"], correct: 1, explanation: "R is P's father, and P is Q's mother — so R is Q's maternal grandfather." },
      { topic: "Direction Sense", stem: "A person walks 8km north, then 6km east. What is the shortest distance from the starting point?", options: ["8km", "10km", "12km", "14km"], correct: 1, explanation: "Right triangle with legs 8 and 6; distance = sqrt(8²+6²) = sqrt(100) = 10km." },
      { topic: "Ranking", stem: "In a class of 35, Meera ranks 9th from the top. What is her rank from the bottom?", options: ["26", "27", "28", "29"], correct: 1, explanation: "Rank from bottom = total - rank from top + 1 = 35-9+1 = 27." },
      { topic: "Syllogism", stem: "Statements: All rivers are water bodies. Some water bodies are lakes. Conclusion: Some rivers are lakes. Is this valid?", options: ["Valid", "Invalid", "Cannot be determined", "Partially valid"], correct: 1, explanation: "The premises don't establish that rivers specifically overlap with the lake subset of water bodies — the conclusion doesn't necessarily follow." },
      { topic: "Percentage", stem: "If a number is decreased by 15% to give 340, what was the original number?", options: ["390", "400", "410", "420"], correct: 1, explanation: "Original × 0.85 = 340; original = 340/0.85 = 400." },
      { topic: "Average", stem: "The average of 4 numbers is 18. If a 5th number, 28, is added, what is the new average?", options: ["19", "20", "21", "22"], correct: 1, explanation: "Total of 4 numbers = 72; new total = 72+28=100; new average = 100/5=20." },
    ],
  },
];
