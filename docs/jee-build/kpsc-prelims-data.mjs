// KPSC (Karnataka) KAS Prelims -- Practice Paper 1. Real exam structure:
// 2 papers (Paper I and II), 100 Q each, 2 marks/question, 200 marks
// each (400 total), 2 hours each, -0.25/wrong, purely QUALIFYING
// (Prelims marks never count toward final merit). Mains: qualifying
// Kannada + English papers, plus 5 merit papers (Essay, GS I-IV, 250
// marks each = 1250 total), fully descriptive, zero negative marking.
//
// SOURCING: authored from KPSC's own published Prelims syllabus -- same
// discipline as SSC CGL/TNPSC/MPSC/TSPSC Prelims. KPSC's real Mains PYQs
// ARE separately sourced with full verbatim verification -- see
// kpsc-kas-mains-gs1-data.mjs.

export const HEADER_LABEL = "KPSC KAS Prelims — Practice Paper 1";

export const PAPER = {
  slug: "kpsc-kas-prelims-practice-1",
  title: "KPSC KAS Prelims Practice Paper 1",
  examType: "kpsc",
  focusTags: ["KPSC", "KAS", "Prelims", "Karnataka", "General Studies"],
  questionCount: 10,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 9,
  positiveMarks: 2,
  negativeMarks: 0.25,
};

const GS_SRC = "General Studies — authored from KPSC KAS's own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.";

export const SECTIONS = [
  {
    name: "General Studies",
    subject: "General Studies",
    sourceNote: GS_SRC,
    questions: [
      { topic: "Karnataka History", stem: "The Vijayanagara Empire, one of South India's greatest medieval empires, had its capital at:", options: ["Mysuru", "Hampi", "Belur", "Badami"], correct: 1, explanation: "Hampi served as the capital of the Vijayanagara Empire (14th-17th century), now a UNESCO World Heritage Site." },
      { topic: "Karnataka Geography", stem: "The Western Ghats section running through Karnataka, known for coffee cultivation and biodiversity, is locally called:", options: ["Nilgiris", "Malnad", "Deccan Plateau", "Coorg Hills only"], correct: 1, explanation: "The Western Ghats region in Karnataka is locally referred to as Malnad ('land of hills'), known for its high rainfall, coffee cultivation, and biodiversity." },
      { topic: "Indian Polity", stem: "The Union Public Service Commission's members are appointed by:", options: ["The Prime Minister", "The President of India", "The Parliament", "The Chief Justice of India"], correct: 1, explanation: "Members of the UPSC (and similarly, State PSCs by the Governor) are appointed by the President of India." },
      { topic: "Karnataka Economy", stem: "Bengaluru is often referred to as the 'Silicon Valley of India' primarily due to its concentration of which industry?", options: ["Textile manufacturing", "Information Technology", "Automobile manufacturing", "Steel production"], correct: 1, explanation: "Bengaluru hosts a major concentration of IT and software companies, earning it the nickname 'Silicon Valley of India'." },
      { topic: "Science & Technology", stem: "The Indian Institute of Science (IISc), one of India's premier research institutions, is located in:", options: ["Mysuru", "Bengaluru", "Mangaluru", "Hubballi"], correct: 1, explanation: "IISc is located in Bengaluru, established in 1909, and remains one of India's foremost research and higher-education institutions." },
      { topic: "Karnataka Culture", stem: "Yakshagana, a traditional theatre form combining dance, music, and dialogue, is native to which region of Karnataka?", options: ["Coastal Karnataka (Karavali/Malnad)", "North Karnataka only", "Bengaluru urban region", "Kodagu exclusively"], correct: 0, explanation: "Yakshagana is a traditional theatre form native to coastal Karnataka (Karavali) and the adjoining Malnad region." },
      { topic: "Indian Economy", stem: "Which of the following best describes 'Repo Rate'?", options: ["The rate at which RBI lends to commercial banks", "The rate at which commercial banks lend to RBI", "The interest rate on savings accounts", "The rate of GST on essential goods"], correct: 0, explanation: "The Repo Rate is the rate at which the RBI lends short-term funds to commercial banks against government securities." },
      { topic: "Karnataka Polity", stem: "Karnataka's state legislature, like Maharashtra's, has which structure?", options: ["Unicameral (only Vidhan Sabha)", "Bicameral (Vidhan Sabha and Vidhan Parishad)", "Tricameral", "No elected legislature"], correct: 1, explanation: "Karnataka has a bicameral legislature, with both a Legislative Assembly (Vidhan Sabha) and a Legislative Council (Vidhan Parishad)." },
      { topic: "Karnataka History — Freedom Struggle", stem: "The Kittur Rebellion (1824), an early armed uprising against British annexation, was led by:", options: ["Rani Chennamma", "Rani Abbakka", "Onake Obavva", "Kittur Chennabasavanna alone"], correct: 0, explanation: "Rani Chennamma of Kittur led an armed rebellion against the British East India Company in 1824, one of the earliest armed resistances to British rule in India." },
      { topic: "Current Affairs — Schemes", stem: "The 'Anna Bhagya' scheme, providing free rice to below-poverty-line families, is a flagship initiative of which state government?", options: ["Tamil Nadu", "Karnataka", "Andhra Pradesh", "Telangana"], correct: 1, explanation: "Anna Bhagya is a Karnataka state government scheme providing free rice to BPL families." },
    ],
  },
];
