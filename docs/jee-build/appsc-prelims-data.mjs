// APPSC (Andhra Pradesh) Group 1 Prelims -- Practice Paper 1. Real exam
// structure: 2 papers, 120 objective questions/120 marks each (1 mark
// each), 120 minutes each, -1/3 per wrong answer, purely QUALIFYING
// (Prelims marks never count toward final merit). Mains: 7 descriptive
// papers x 150 marks each (150 min each) -- Paper I (Telugu) and Paper II
// (English) are qualifying only, Papers III-VII (General Studies +
// Essay) determine merit, zero negative marking.
//
// SOURCING: authored from APPSC Group 1's own published Prelims syllabus
// -- same discipline as SSC CGL/TNPSC/KPSC/MPSC/TSPSC Prelims. APPSC's
// real Mains PYQs ARE separately sourced with verbatim verification --
// see appsc-group1-mains-paper3-data.mjs.

export const HEADER_LABEL = "APPSC Group 1 Prelims — Practice Paper 1";

export const PAPER = {
  slug: "appsc-group1-prelims-practice-1",
  title: "APPSC Group 1 Prelims Practice Paper 1",
  examType: "appsc",
  focusTags: ["APPSC", "Group 1", "Prelims", "Andhra Pradesh", "General Studies"],
  questionCount: 10,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 9,
  positiveMarks: 1,
  negativeMarks: 0.33,
};

const GS_SRC = "General Studies — authored from APPSC Group 1's own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.";

export const SECTIONS = [
  {
    name: "General Studies",
    subject: "General Studies",
    sourceNote: GS_SRC,
    questions: [
      { topic: "Andhra Pradesh History", stem: "The Amaravati Stupa, a major centre of early Buddhist art and architecture, flourished under the patronage of which dynasty?", options: ["Chalukyas", "Satavahanas", "Kakatiyas", "Vijayanagara Empire"], correct: 1, explanation: "The Amaravati Stupa developed under the Satavahana dynasty, becoming one of the most important centres of early Buddhist sculpture in India." },
      { topic: "Andhra Pradesh Geography", stem: "Andhra Pradesh's new capital region, Amaravati, is situated on the banks of which river?", options: ["Godavari", "Krishna", "Penna", "Tungabhadra"], correct: 1, explanation: "Amaravati, Andhra Pradesh's planned capital, is located on the banks of the Krishna river." },
      { topic: "Indian Polity", stem: "The bifurcation of Andhra Pradesh to create Telangana was enacted under which Act?", options: ["States Reorganisation Act, 1956", "Andhra Pradesh Reorganisation Act, 2014", "Andhra State Act, 1953", "Telangana Formation Act, 2013"], correct: 1, explanation: "The Andhra Pradesh Reorganisation Act, 2014 formally created Telangana as a separate state from 2 June 2014." },
      { topic: "Andhra Pradesh Economy", stem: "Visakhapatnam's economy is particularly notable for which major industry, alongside its status as a major port?", options: ["Textile manufacturing", "Steel and shipbuilding", "Automobile assembly", "Software/IT exclusively"], correct: 1, explanation: "Visakhapatnam hosts a major steel plant (RINL) and shipbuilding facilities, alongside being one of India's major ports." },
      { topic: "Science & Technology", stem: "Sriharikota, home to India's primary satellite launch centre, is located in which Andhra Pradesh district?", options: ["Krishna", "Sri Potti Sriramulu Nellore", "East Godavari", "Guntur"], correct: 1, explanation: "The Satish Dhawan Space Centre at Sriharikota is located in Sri Potti Sriramulu Nellore district, Andhra Pradesh." },
      { topic: "Andhra Pradesh Culture", stem: "Kuchipudi, a classical Indian dance form, originated in a village of the same name located in which Andhra Pradesh district?", options: ["Krishna", "Guntur", "Godavari", "Chittoor"], correct: 0, explanation: "Kuchipudi originated in a village of that name in Krishna district, Andhra Pradesh." },
      { topic: "Indian Economy", stem: "The Goods and Services Tax (GST), which subsumed most indirect taxes, was implemented in India from which date?", options: ["1 April 2016", "1 July 2017", "1 January 2018", "1 April 2019"], correct: 1, explanation: "GST was implemented across India from 1 July 2017." },
      { topic: "Andhra Pradesh Polity", stem: "Andhra Pradesh's state legislature currently has which structure?", options: ["Bicameral (Vidhan Sabha and Vidhan Parishad)", "Unicameral (only Legislative Assembly)", "Tricameral", "No elected legislature"], correct: 0, explanation: "Andhra Pradesh has a bicameral legislature, with both a Legislative Assembly and a Legislative Council." },
      { topic: "Andhra Pradesh History — Freedom Struggle", stem: "Alluri Sitarama Raju, who led the Rampa Rebellion against British forest laws, operated primarily in which region?", options: ["Coastal Andhra plains", "Agency tracts of the Eastern Ghats (Godavari region)", "Rayalaseema", "Nellore coast"], correct: 1, explanation: "Alluri Sitarama Raju led the Rampa Rebellion (1922-24) among tribal communities in the Agency tracts of the Eastern Ghats in the Godavari region." },
      { topic: "Current Affairs — Schemes", stem: "The 'Amma Vodi' scheme, providing financial assistance to mothers for their children's education, is a flagship initiative of which state government?", options: ["Telangana", "Andhra Pradesh", "Tamil Nadu", "Karnataka"], correct: 1, explanation: "Amma Vodi is an Andhra Pradesh state government scheme providing financial assistance to mothers linked to their children's school attendance." },
    ],
  },
];
