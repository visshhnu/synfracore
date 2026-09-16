// MPSC (Maharashtra Rajyaseva) Prelims -- Practice Paper 1. Real exam
// structure: 2 papers on one day -- Paper I General Studies (100 Q, 200
// marks, 2 hrs), Paper II CSAT (80 Q, 200 marks, 2 hrs), -0.25/wrong on
// both, purely QUALIFYING (Prelims marks never count toward final merit,
// only used to shortlist for Mains). Mains: 4 GS papers + 2 language
// papers, fully descriptive, 800 marks total.
//
// SOURCING: authored from MPSC's own published syllabus topics -- same
// discipline as SSC CGL/IBPS PO/TNPSC Prelims. Real, disclosed
// limitation: MPSC's Mains descriptive papers were checked (official
// mpsc.gov.in previous-papers page, EduRev, and several coaching
// aggregators) and, unlike KPSC and APPSC, none offered real Mains
// question text as fetchable web content -- only PDF downloads or
// paywalled/purchase pages. Mains is therefore NOT built for MPSC, same
// as TNPSC and TSPSC -- disclosed here and in the technology's overview
// page, not silently skipped.

export const HEADER_LABEL = "MPSC Rajyaseva Prelims — Practice Paper 1";

export const PAPER = {
  slug: "mpsc-prelims-practice-1",
  title: "MPSC Rajyaseva Prelims Practice Paper 1",
  examType: "mpsc",
  focusTags: ["MPSC", "Rajyaseva", "Prelims", "Maharashtra", "General Studies", "CSAT"],
  questionCount: 20,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 18,
  positiveMarks: 2,
  negativeMarks: 0.25,
};

const GS_SRC = "General Studies — authored from MPSC Rajyaseva's own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.";
const CSAT_SRC = "CSAT — authored from MPSC's own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.";

export const SECTIONS = [
  {
    name: "General Studies",
    subject: "General Studies",
    sourceNote: GS_SRC,
    questions: [
      { topic: "Maharashtra History", stem: "The Battle of Palkhed (1728), a decisive early victory establishing Maratha military reputation, was fought by which Peshwa?", options: ["Balaji Vishwanath", "Baji Rao I", "Balaji Baji Rao", "Madhav Rao I"], correct: 1, explanation: "Baji Rao I decisively defeated the Nizam of Hyderabad at the Battle of Palkhed (1728), an early demonstration of Maratha military strategy under Peshwa leadership." },
      { topic: "Maharashtra Geography", stem: "The Western Ghats, running along Maharashtra's western edge, are also known locally as:", options: ["Sahyadri", "Vindhyachal", "Aravalli", "Satpura"], correct: 0, explanation: "The Western Ghats in Maharashtra are locally known as the Sahyadri range." },
      { topic: "Indian Polity", stem: "The 74th Constitutional Amendment Act (1992) specifically pertains to:", options: ["Panchayati Raj Institutions", "Urban Local Bodies (Municipalities)", "Judicial reforms", "Election Commission powers"], correct: 1, explanation: "The 74th Amendment established the constitutional framework for Urban Local Bodies (Nagar Panchayats, Municipal Councils, Municipal Corporations), parallel to the 73rd Amendment's Panchayati Raj provisions." },
      { topic: "Maharashtra Economy", stem: "Which city is often referred to as the financial capital of India, contributing significantly to Maharashtra's and India's GDP?", options: ["Pune", "Nagpur", "Mumbai", "Nashik"], correct: 2, explanation: "Mumbai, hosting the RBI, BSE, NSE, and numerous corporate headquarters, is commonly referred to as India's financial capital." },
      { topic: "Science & Technology", stem: "The Bhabha Atomic Research Centre (BARC), India's premier nuclear research facility, is located in:", options: ["Pune", "Trombay, Mumbai", "Kalpakkam", "Tarapur"], correct: 1, explanation: "BARC is located at Trombay in Mumbai, established in 1954 as India's foremost nuclear research institution." },
      { topic: "Current Affairs — Governance", stem: "The Jal Jeevan Mission, a central government scheme, primarily aims to provide:", options: ["Free electricity to rural households", "Functional household tap water connections to every rural home", "Free housing under PMAY", "Crop insurance"], correct: 1, explanation: "Jal Jeevan Mission aims to provide functional household tap connections (Har Ghar Jal) to every rural household in India." },
      { topic: "Maharashtra Culture", stem: "The Ajanta and Ellora caves, UNESCO World Heritage Sites known for rock-cut architecture, are located in which Maharashtra district?", options: ["Pune", "Aurangabad (Chhatrapati Sambhajinagar)", "Nashik", "Kolhapur"], correct: 1, explanation: "The Ajanta and Ellora caves are located in the Aurangabad district (renamed Chhatrapati Sambhajinagar) of Maharashtra." },
      { topic: "Indian Economy", stem: "The Micro, Small and Medium Enterprises (MSME) sector in India is classified based on which two criteria under the revised 2020 definition?", options: ["Only investment in plant and machinery", "Investment in plant/machinery/equipment AND annual turnover", "Only annual turnover", "Number of employees only"], correct: 1, explanation: "The 2020 revised MSME definition uses a composite criterion of both investment (in plant/machinery/equipment) and annual turnover, replacing the earlier investment-only criterion." },
      { topic: "Maharashtra Polity", stem: "The Vidhan Parishad (Legislative Council) of Maharashtra is an example of which kind of legislative structure?", options: ["Unicameral", "Bicameral upper house", "Judicial body", "Executive council"], correct: 1, explanation: "Maharashtra has a bicameral legislature; the Vidhan Parishad is the upper house, alongside the directly-elected Vidhan Sabha (lower house)." },
      { topic: "Geography — Rivers", stem: "The Godavari river, one of the longest rivers in peninsular India, originates in which Maharashtra location?", options: ["Mahabaleshwar", "Trimbakeshwar (near Nashik)", "Satara", "Aurangabad"], correct: 1, explanation: "The Godavari river originates at Trimbakeshwar near Nashik, Maharashtra, and flows across peninsular India to the Bay of Bengal." },
    ],
  },
  {
    name: "CSAT",
    subject: "CSAT",
    sourceNote: CSAT_SRC,
    questions: [
      { topic: "Logical Reasoning", stem: "If all Zips are Zops, and all Zops are Zaps, which of the following must be true?", options: ["All Zaps are Zips", "All Zips are Zaps", "No Zips are Zaps", "Cannot be determined"], correct: 1, explanation: "By transitivity, if all Zips are Zops and all Zops are Zaps, then all Zips must be Zaps." },
      { topic: "Decision Making", stem: "You are a manager and discover a team member has been consistently missing minor deadlines due to personal issues they haven't disclosed. What is the most appropriate first step?", options: ["Immediately report them to HR for disciplinary action", "Have a private, supportive conversation to understand the situation", "Publicly reassign their tasks to others", "Ignore the issue since deadlines are minor"], correct: 1, explanation: "A supportive, private conversation to understand the underlying cause is the most constructive first step before considering any disciplinary or reassignment action." },
      { topic: "Basic Numeracy", stem: "If a train travels 180km in 3 hours, what is its speed in m/s?", options: ["15 m/s", "16.67 m/s", "18 m/s", "20 m/s"], correct: 1, explanation: "Speed = 180km/3hr = 60 km/h = 60×(5/18) m/s ≈ 16.67 m/s." },
      { topic: "Comprehension", stem: "\"Urban green spaces not only improve air quality but also provide measurable mental health benefits to city residents.\" What two benefits does the passage attribute to urban green spaces?", options: ["Reduced crime and increased property value", "Improved air quality and mental health benefits", "Increased tourism and revenue", "Better traffic flow and safety"], correct: 1, explanation: "The passage explicitly names improved air quality and mental health benefits as the two attributed benefits." },
      { topic: "Data Interpretation", stem: "If a company's expenses increased from ₹50 lakh to ₹65 lakh in a year, what is the percentage increase?", options: ["25%", "30%", "35%", "40%"], correct: 1, explanation: "Increase = 65-50=15 lakh; percentage = (15/50)×100 = 30%." },
      { topic: "Logical Reasoning — Series", stem: "Find the next term: 2, 5, 11, 23, 47, ?", options: ["93", "94", "95", "96"], correct: 2, explanation: "Each term is roughly double the previous plus 1 (2×2+1=5, 5×2+1=11, 11×2+1=23, 23×2+1=47); next is 47×2+1=95." },
      { topic: "Decision Making — Ethics", stem: "As a government officer, you discover a minor procedural error in a colleague's completed work that doesn't affect the final outcome. What is the most appropriate action?", options: ["Ignore it since the outcome is unaffected", "Quietly inform the colleague so they can learn and avoid it in future", "Report it formally to superiors immediately", "Publicly point it out in a team meeting"], correct: 1, explanation: "Quietly informing the colleague directly supports learning and correction without unnecessary escalation or public embarrassment, appropriate given the error's minor, outcome-neutral nature." },
      { topic: "Basic Numeracy — Averages", stem: "The average of 6 numbers is 25. If one number is removed, the average of the remaining 5 becomes 24. What was the removed number?", options: ["28", "29", "30", "31"], correct: 2, explanation: "Total of 6 numbers = 150; total of 5 numbers = 120; removed number = 150-120 = 30." },
      { topic: "Comprehension", stem: "\"While electric vehicles reduce tailpipe emissions, their environmental benefit depends significantly on the source of electricity used for charging.\" What does the passage suggest determines EVs' real environmental benefit?", options: ["Vehicle price", "The electricity source used for charging", "Battery size", "Driving range"], correct: 1, explanation: "The passage explicitly attributes the real environmental benefit to the electricity source used for charging, not price, battery size, or range." },
      { topic: "Logical Reasoning", stem: "Five people A, B, C, D, E are seated in a row. B is to the immediate right of A. C is at one end. If D is exactly in the middle, which of the following could be true?", options: ["A is at an end", "B is at an end", "E must be adjacent to C", "C and D are adjacent"], correct: 0, explanation: "Given B is immediately right of A, and C is at one end with D in the middle, A being at the other end (or a position allowing B beside it) is a consistent possible arrangement." },
    ],
  },
];
