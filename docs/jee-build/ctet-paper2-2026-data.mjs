// CTET (Central Teacher Eligibility Test) Paper II -- Practice Paper 1.
// Real exam structure: 150 MCQs, 150 marks, 1 mark/correct, ZERO negative
// marking, 2.5 hours, offline OMR (same overall mechanics as Paper I;
// Paper II targets Classes VI-VIII, elementary level). This paper is a
// real, meaningfully-sized first paper (24 questions: CDP + Language
// Pedagogy, shared theory with Paper I's own sections since pedagogy
// principles genuinely overlap across primary/elementary levels, plus
// Science Pedagogy as Paper II's specific differentiator) rather than
// the full 150 -- Social Studies and Mathematics-for-upper-primary are a
// natural next batch, not built here.
//
// SOURCING: same real-PYQ discipline and same honest limitation as
// ctet-paper1-2026-data.mjs -- these are real, previously-appeared CTET
// questions (Science Pedagogy sourced from testbook.com's dedicated
// solved-question set; CDP/Language reused from the same verified
// sources as Paper I, since both papers draw on the same underlying
// pedagogy syllabus), but no available source attributed them to a
// specific exam session/date -- disclosed rather than invented.

export const HEADER_LABEL = "CTET Paper II — Practice Paper 1";

export const PAPER = {
  slug: "ctet-paper2-practice-1",
  title: "CTET Paper II Practice Paper 1",
  examType: "ctet-paper2",
  focusTags: ["CTET", "Paper 2", "Child Development", "Pedagogy", "Language", "Science", "Elementary Teaching"],
  questionCount: 24,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 35,
  positiveMarks: 1,
  negativeMarks: 0,
};

const SRC_CDP = "Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com's CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.";
const SRC_LANG = "Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com's CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.";
const SRC_SCI = "Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com's dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.";

export const SECTIONS = [
  {
    name: "Child Development and Pedagogy",
    subject: "CDP",
    sourceNote: SRC_CDP,
    questions: [
      { topic: "Attribution Theory", stem: "Mastery-oriented learners typically attribute success to ________ and failure to ________.", options: ["Ability and good luck; task difficulty", "Ability and effort; bad luck", "Ability and good luck; low ability", "Ability and effort; insufficient effort"], correct: 3, explanation: "Mastery-oriented learners attribute success to ability and effort, and failure to insufficient (fixable) effort rather than fixed low ability -- what sustains their motivation to keep trying." },
      { topic: "Gifted Learners", stem: "Which of the following is a characteristic of a gifted learner?", options: ["He gets aggressive and frustrated", "He can feel under-stimulated and bored if class activities are not challenging enough", "He is highly temperamental", "He engages in ritualistic behaviour like hand flapping, rocking, etc."], correct: 1, explanation: "Under-stimulation and boredom with insufficiently challenging work is a well-documented real characteristic of gifted learners specifically -- the other options describe unrelated or different conditions." },
      { topic: "Diverse Classrooms", stem: "\"Having a diverse classroom with varied social, economic and cultural backgrounds enriches the learning experiences of all students.\" This statement is", options: ["incorrect, because it can confuse the children and they may feel lost", "correct, because children learn many skills from their peers", "correct, because it makes the classroom more hierarchical", "incorrect, because it leads to unnecessary competition"], correct: 1, explanation: "Genuine diversity enriches learning because students learn real skills and perspectives from peer interaction across difference -- not because it creates hierarchy or confusion." },
      { topic: "Inclusive Education — Hearing Impairment", stem: "A child with hearing impairment:", options: ["should be sent only to a school for the hearing impaired and not to a regular school", "will not benefit from academic education only and should be given vocational training instead", "can do very well in a regular school if suitable facilitation and resources are provided", "will never be able to perform on a par with classmates in a regular school"], correct: 2, explanation: "With appropriate facilitation and resources, a child with hearing impairment can genuinely succeed in a regular (inclusive) school setting -- segregation or assuming permanent underperformance are not supported inclusive-education positions." },
      { topic: "Enhancing Learning", stem: "A teacher can enhance learning in her effective elementary classroom by:", options: ["offering rewards for small steps in learning", "drill and practice competition", "encouraging amongst her students", "connecting the content to the lives of the students"], correct: 3, explanation: "Connecting content to students' real lives is a genuinely effective, well-supported pedagogical strategy for elementary learning -- more so than reward-for-small-steps, drilling, or vague 'encouragement' alone." },
      { topic: "Vygotsky — Assessment Methods", stem: "As a teacher who firmly believes in the social constructivist theory of Lev Vygotsky, which of the following methods would you prefer for assessing your students?", options: ["Collaborative projects", "Standardized tests", "Fact-based recall questions", "Objective multiple-choice type questions"], correct: 0, explanation: "Social constructivism holds knowledge is built through social interaction -- collaborative projects assess learning consistent with that theory, unlike isolated individual recall-based testing." },
      { topic: "Purpose of Assessment", stem: "Assessment is purposeful if:", options: ["it induces fear and stress among the students", "it serves as feedback for the students as well as the teachers", "it is done only once at the end of the year", "comparative evaluations are made to differentiate between students' achievements"], correct: 1, explanation: "Purposeful assessment functions as two-way feedback for both learner and teacher, not as a one-time, fear-inducing, or purely comparative exercise." },
    ],
  },
  {
    name: "Language Pedagogy",
    subject: "Language Pedagogy",
    sourceNote: SRC_LANG,
    questions: [
      { topic: "Language through Literature", stem: "In language learning, the 'Language through Literature' approach helps learners achieve their main aim of improving knowledge and proficiency in English. Literary texts stimulate language activities because:", options: ["Literature provides learners with concrete context for language use", "They present different aspects of humanity, broadening learners' perspective", "Literary language suits development of learners' language abilities", "All of the above"], correct: 3, explanation: "All three reasons genuinely contribute to why literary texts are pedagogically effective -- concrete context, broadened perspective, and developmentally appropriate language, together." },
      { topic: "Pedagogical Grammar", stem: "'Pedagogical Grammar' means:", options: ["Begin from form and move on to use", "Teaching through immersion", "All grammar teaching should be rule focused", "Teaching grammar in context"], correct: 3, explanation: "Pedagogical grammar specifically means teaching grammar embedded in meaningful context, not as isolated rules divorced from actual use." },
      { topic: "Acquisition Definition", stem: "When a child learns language naturally, without much conscious effort or practice, it is called:", options: ["Language adaptation", "Language learning", "Language acquisition", "Language generalization"], correct: 2, explanation: "Natural, low-effort language development is termed language acquisition, distinct from deliberate, effortful 'learning' in language-pedagogy theory." },
      { topic: "Continuous Comprehensive Evaluation", stem: "Continuous comprehensive evaluation is:", options: ["Continuous testing", "Continuous assessment", "Assessment of learners while learning", "Periodic conduct of exams"], correct: 2, explanation: "CCE means genuinely ongoing assessment integrated into the learning process, not more frequent testing or periodic formal exams." },
      { topic: "Language Across the Curriculum", stem: "A language teacher asks learners to write a paragraph on 'scarcity of water.' Learners gather information from science and social science books before writing. This task aims at:", options: ["Developing scientific attitude", "Completing syllabus of other subjects simultaneously", "Achieving language learning across the curriculum", "Enhancing co-curricular skills"], correct: 2, explanation: "Drawing content from other subject areas into a language-writing task exemplifies 'language across the curriculum' -- language as a vehicle across subjects, not covering other syllabi." },
      { topic: "Good Language Textbooks", stem: "A good language textbook should: (A) Contain learner-centered materials (B) Contain teacher-friendly instruction (C) Incorporate language skills throughout (D) Have more syntactical items. Which statements are true?", options: ["A, C and D", "B, C and D", "A, B and C", "A, B and D"], correct: 2, explanation: "A, B, and C describe genuine desirable textbook qualities; D (heavy isolated syntactical items) is not a marker of a good language textbook." },
      { topic: "Diagnostic Observation", stem: "When a teacher quietly observes students during a collaborative grammar activity, the activity plays a ________ role.", options: ["Diagnostic", "Evaluative", "Interactive", "Record keeping"], correct: 0, explanation: "Quiet observation to understand where students currently stand functions diagnostically -- identifying needs/gaps -- rather than formally evaluative." },
    ],
  },
  {
    name: "Science and Pedagogy",
    subject: "Science Pedagogy",
    sourceNote: SRC_SCI,
    questions: [
      { topic: "Local Resources in Science Teaching", stem: "Why is it important to use a child's immediate surroundings and local resources in teaching science?", options: ["Because it limits science learning to only local examples and immediate environment", "Because it reduces the need for textbooks and laboratories", "Because children's daily life experiences and interactions help develop scientific attitudes", "Because it allows teachers to avoid planning lessons and teaching materials in advance"], correct: 2, explanation: "Using local, familiar experiences genuinely helps children develop scientific attitudes by grounding abstract concepts in what they already know, not as a shortcut around lesson planning or a limitation on scope." },
      { topic: "Science Clubs", stem: "Which of the following best describes the approach of a Science Club?", options: ["Ignoring new ideas", "Learning Science with fun", "Focusing on rote learning", "Discouraging questions"], correct: 1, explanation: "Science clubs are pedagogically meant to make science engaging and enjoyable, explicitly the opposite of rote learning or discouraging curiosity." },
      { topic: "Science Kits", stem: "A science kit in school education is primarily needed to:", options: ["Emphasise memorisation of scientific definitions", "Replace classroom teaching and teacher guidance", "Support hands-on learning of basic scientific concepts", "Limit learning to textbook-based instruction"], correct: 2, explanation: "A science kit's real pedagogical purpose is enabling hands-on, experiential learning of concepts -- not replacing the teacher or promoting rote memorization." },
      { topic: "Nature of Science", stem: "Which of the following best describes the nature of science as a discipline?", options: ["Science never changes its theories", "Science is based on myths and beliefs", "Science only studies living things", "Science is based on observation and experimentation"], correct: 3, explanation: "The defining nature of science as a discipline is its grounding in observation and experimentation -- not fixed, unchanging theory, myth, or a restriction to living things only." },
      { topic: "Self-Correcting Nature of Science", stem: "Which aspect best demonstrates the self-correcting nature of science as a discipline?", options: ["Personal opinions of scientists", "Peer review and replication of studies", "Use of traditional beliefs", "Random selection of observations"], correct: 1, explanation: "Peer review and replication are the actual mechanisms by which science corrects its own errors over time -- not personal opinion, tradition, or unsystematic observation." },
      { topic: "Social Nature of Science", stem: "Which of the following statements best describes the nature of science?", options: ["Scientists are totally objective in their work", "The scientific method is the only guide for conducting research", "Science is a system of beliefs", "Science is social in nature"], correct: 3, explanation: "Contemporary understanding of science's nature emphasizes its social character (collaborative, community-validated), rather than claiming scientists are perfectly objective or that there's one single rigid 'scientific method.'" },
      { topic: "Continuous and Comprehensive Evaluation in Science", stem: "Continuous and comprehensive evaluation in science means—", options: ["Summative and formative assessment", "More frequent tests and examinations", "Routine activities and exercises to assess learning", "Evaluation of all aspects of science"], correct: 3, explanation: "CCE in science is meant to evaluate all aspects of a learner's engagement with science (concepts, skills, attitudes), not just more frequent testing or a narrow routine-exercise view." },
      { topic: "Values of Science", stem: "The value of Science for nature is", options: ["Possibility", "Reality", "Interim", "Uncertainty"], correct: 1, explanation: "Science's value in relation to nature is grounded in seeking an accurate account of reality -- the actual, verifiable state of the natural world." },
      { topic: "GSM Technology", stem: "The full form of 'GSM' technology used in mobile phones is", options: ["Geo Satellite for Mobile", "Global System for Mobility", "Global System for Mobile", "Geo Station for Mobility"], correct: 2, explanation: "GSM stands for Global System for Mobile (Communications) -- a factual technology-general-knowledge item within the Science section." },
      { topic: "Co-Scholastic Assessment Tools", stem: "Shyam informs his teacher in an online class that he was asked by his father to provide food to neighboring poor children during the Covid lockdown. This behaviour will be recorded in which of the following tools to assess the co-scholastic aspect?", options: ["Rating scale", "Observation schedule", "Portfolio", "Anecdotal Record"], correct: 3, explanation: "A specific, spontaneously-reported incident of a child's behaviour is recorded as an anecdotal record -- a narrative account of a specific event, not a rating scale, observation schedule, or portfolio (which serve different assessment purposes)." },
    ],
  },
];
