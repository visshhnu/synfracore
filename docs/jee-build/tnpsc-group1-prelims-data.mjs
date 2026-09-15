// TNPSC Group I Prelims -- Practice Paper 1. Real exam structure
// confirmed for the 2026 sitting (rescheduled to 27 September 2026):
// 200 objective questions, 300 marks (1.5 marks/question), 3 hours,
// ZERO negative marking, purely QUALIFYING (Prelims marks do not count
// toward final merit -- only Mains + Interview do). Syllabus: General
// Studies (degree level) + Aptitude & Mental Ability (SSLC level), with
// Indian Polity, Indian Economy, Modern History, Tamil Nadu History &
// Culture, and Current Affairs forming the largest real share.
//
// SOURCING: authored from TNPSC's own published syllabus topics --
// same zero-copyright-risk, not-copied-from-any-official-paper
// discipline already established for SSC CGL/IBPS PO/JEE/NEET on this
// platform, appropriate here since TNPSC Prelims content (static GK +
// aptitude) is genuinely the same content-type category as those exams,
// not a descriptive/essay format requiring real PYQ+model-answer
// treatment the way UPSC/TNPSC Mains does.

export const HEADER_LABEL = "TNPSC Group I Prelims — Practice Paper 1";

export const PAPER = {
  slug: "tnpsc-group1-prelims-practice-1",
  title: "TNPSC Group I Prelims Practice Paper 1",
  examType: "tnpsc-group1",
  focusTags: ["TNPSC", "Group I", "Prelims", "Tamil Nadu", "Indian Polity", "Economy", "History", "Aptitude"],
  questionCount: 40,
  difficulty: "standard",
  sortOrder: 1,
  timeLimitMinutes: 36,
  positiveMarks: 1.5,
  negativeMarks: 0,
};

const GS_SRC = "General Studies — authored from TNPSC Group I's own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.";
const APT_SRC = "Aptitude & Mental Ability — authored from TNPSC's own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.";

export const SECTIONS = [
  {
    name: "General Studies",
    subject: "General Studies",
    sourceNote: GS_SRC,
    questions: [
      { topic: "Tamil Nadu History", stem: "The Vandiyur Mariamman Teppakulam, a large temple tank, is located in which Tamil Nadu city?", options: ["Madurai", "Thanjavur", "Tiruchirappalli", "Kanchipuram"], correct: 0, explanation: "The Vandiyur Mariamman Teppakulam is located in Madurai, built during the Nayak period and associated with the annual Teppam (float) Festival." },
      { topic: "Indian Polity", stem: "Under which Schedule of the Constitution are the powers, authority, and responsibilities of Panchayats specified?", options: ["Ninth Schedule", "Tenth Schedule", "Eleventh Schedule", "Twelfth Schedule"], correct: 2, explanation: "The Eleventh Schedule (added by the 73rd Amendment) lists the 29 subjects within the purview of Panchayati Raj Institutions." },
      { topic: "Modern History", stem: "The Vaikom Satyagraha (1924-25), a movement against untouchability and for temple-road access, took place in which present-day state?", options: ["Tamil Nadu", "Kerala", "Karnataka", "Andhra Pradesh"], correct: 1, explanation: "The Vaikom Satyagraha took place in Vaikom, in present-day Kerala, protesting the ban on lower castes using roads near the Vaikom temple." },
      { topic: "Tamil Nadu Economy", stem: "Which Tamil Nadu city is often referred to as the 'Detroit of India' due to its automobile manufacturing hub?", options: ["Coimbatore", "Chennai", "Madurai", "Salem"], correct: 1, explanation: "Chennai hosts a major concentration of automobile manufacturing plants, earning it the nickname 'Detroit of India'." },
      { topic: "Indian Polity", stem: "The concept of 'Constitutional Morality' has been particularly emphasized by the Supreme Court of India in judgments relating to which of the following?", options: ["Fundamental Rights interpretation broadly, including recent personal-liberty judgments", "Only Directive Principles", "Only Fundamental Duties", "Only Money Bills"], correct: 0, explanation: "Constitutional morality — adherence to the Constitution's core values even against popular sentiment — has been invoked by the Supreme Court in several landmark judgments expanding fundamental-rights interpretation." },
      { topic: "Geography of Tamil Nadu", stem: "The Palar, Ponnaiyar, and Cauvery are all examples of which type of river system in Tamil Nadu?", options: ["West-flowing rivers", "East-flowing rivers originating in the Western Ghats", "Rivers originating outside India", "Glacier-fed Himalayan rivers"], correct: 1, explanation: "Palar, Ponnaiyar, and Cauvery are all east-flowing peninsular rivers originating in the Western Ghats, draining into the Bay of Bengal." },
      { topic: "Science & Technology", stem: "ISRO's Satish Dhawan Space Centre, the country's primary satellite launch site, is located at:", options: ["Thumba, Kerala", "Sriharikota, Andhra Pradesh", "Bengaluru, Karnataka", "Mahendragiri, Tamil Nadu"], correct: 1, explanation: "The Satish Dhawan Space Centre is located at Sriharikota, Andhra Pradesh, though ISRO also has a major liquid-propulsion testing facility at Mahendragiri, Tamil Nadu." },
      { topic: "Modern History — Tamil Nadu", stem: "The Self-Respect Movement, which challenged caste hierarchy and Brahmanical dominance in Tamil society, was founded by:", options: ["C. N. Annadurai", "Periyar E. V. Ramasamy", "Kamaraj", "V. O. Chidambaram Pillai"], correct: 1, explanation: "Periyar E. V. Ramasamy founded the Self-Respect Movement in 1925, a foundational influence on Dravidian politics in Tamil Nadu." },
      { topic: "Indian Economy", stem: "The Goods and Services Tax (GST) Council, which recommends GST rates and rules, is chaired by:", options: ["The Prime Minister", "The Finance Minister of India", "The RBI Governor", "The Chief Economic Advisor"], correct: 1, explanation: "The GST Council is chaired by the Union Finance Minister, with state finance ministers as members." },
      { topic: "Current Affairs — Governance", stem: "The 'Ease of Doing Business' rankings, historically published by the World Bank, assessed countries on parameters including:", options: ["Only tax rates", "Starting a business, construction permits, credit access, contract enforcement, among others", "Only labor law flexibility", "Only foreign investment caps"], correct: 1, explanation: "The Ease of Doing Business index assessed multiple parameters including starting a business, construction permits, getting credit, and contract enforcement, among others." },
      { topic: "Tamil Nadu Culture", stem: "Bharatanatyam, one of India's oldest classical dance forms, originated in which state's temple tradition?", options: ["Kerala", "Tamil Nadu", "Odisha", "Andhra Pradesh"], correct: 1, explanation: "Bharatanatyam originated in Tamil Nadu's temple dance tradition (Sadir), later codified and popularized in the 20th century." },
      { topic: "Indian Polity — Emergency Provisions", stem: "Under which Article can the President declare a National Emergency on grounds of war, external aggression, or armed rebellion?", options: ["Article 352", "Article 356", "Article 360", "Article 368"], correct: 0, explanation: "Article 352 provides for the President's declaration of a National Emergency on grounds of war, external aggression, or armed rebellion." },
      { topic: "Geography — Climate", stem: "Tamil Nadu receives a significant share of its annual rainfall from which monsoon, unlike most of the rest of India?", options: ["Southwest monsoon only", "Northeast monsoon (retreating monsoon)", "Western disturbances", "No monsoon influence at all"], correct: 1, explanation: "Unlike most of India (which depends primarily on the southwest monsoon), Tamil Nadu receives a substantial share of its rainfall from the Northeast (retreating) monsoon, October-December." },
      { topic: "Modern History", stem: "The Champaran Satyagraha (1917), Gandhi's first major civil disobedience campaign in India, addressed the grievances of which group?", options: ["Salt traders", "Indigo cultivators", "Textile mill workers", "Railway employees"], correct: 1, explanation: "The Champaran Satyagraha addressed the exploitative conditions faced by indigo cultivators in Bihar under British planters." },
      { topic: "Indian Economy — Planning", stem: "NITI Aayog, which replaced the Planning Commission in 2015, functions primarily as a:", options: ["Statutory financial regulator", "Policy think tank and advisory body", "Constitutional body with veto power over state budgets", "Judicial appellate body"], correct: 1, explanation: "NITI Aayog functions as a policy think tank and advisory body to the government, unlike the Planning Commission's more directive, fund-allocating role." },
      { topic: "Tamil Nadu Government Schemes", stem: "The 'Amma Unavagam' initiative, a subsidized meal scheme launched in Tamil Nadu, primarily provides:", options: ["Free school uniforms", "Subsidized nutritious meals to the public at low cost", "Free healthcare checkups", "Housing subsidies"], correct: 1, explanation: "Amma Unavagam ('Amma Canteens') provided subsidized, hygienic meals to the general public at very low cost, a flagship Tamil Nadu welfare initiative." },
      { topic: "Science & Technology", stem: "India's indigenous GPS-equivalent satellite navigation system is called:", options: ["INSAT", "NavIC", "IRNSS-Only", "GAGAN-Prime"], correct: 1, explanation: "NavIC (Navigation with Indian Constellation), built on the IRNSS satellite constellation, is India's own regional satellite navigation system." },
      { topic: "Indian Polity — Judiciary", stem: "Public Interest Litigation (PIL) in India allows:", options: ["Only the aggrieved party to approach courts", "Any public-spirited citizen to approach courts on behalf of those unable to do so themselves", "Only government bodies to file cases", "Only registered NGOs to file cases"], correct: 1, explanation: "PIL relaxed the traditional standing requirement, allowing any public-spirited person or organization to approach courts on behalf of those unable to access justice themselves." },
      { topic: "Geography — Tamil Nadu", stem: "The Nilgiri Biosphere Reserve, one of India's first biosphere reserves, spans parts of Tamil Nadu, Kerala, and which other state?", options: ["Andhra Pradesh", "Karnataka", "Telangana", "Goa"], correct: 1, explanation: "The Nilgiri Biosphere Reserve spans parts of Tamil Nadu, Kerala, and Karnataka, covering the Western Ghats' Nilgiri hill range." },
      { topic: "Modern History — Freedom Struggle", stem: "V. O. Chidambaram Pillai, a prominent Tamil freedom fighter, is particularly remembered for founding:", options: ["The Swadeshi Steam Navigation Company", "The Indian National Army", "The Ghadar Party", "The Home Rule League"], correct: 0, explanation: "V. O. Chidambaram Pillai founded the Swadeshi Steam Navigation Company (1906) to compete with British shipping monopolies, a significant swadeshi-era economic initiative." },
    ],
  },
  {
    name: "Aptitude and Mental Ability",
    subject: "Aptitude",
    sourceNote: APT_SRC,
    questions: [
      { topic: "Percentage", stem: "If 30% of a number is 90, what is 60% of the same number?", options: ["150", "160", "170", "180"], correct: 3, explanation: "30% of x=90 means x=300; 60% of 300=180." },
      { topic: "Simplification", stem: "Simplify: 25 × 4 − 15 ÷ 3", options: ["90", "95", "100", "105"], correct: 1, explanation: "25×4=100; 15/3=5; 100−5=95." },
      { topic: "HCF and LCM", stem: "Find the LCM of 15 and 20.", options: ["30", "45", "60", "75"], correct: 2, explanation: "Multiples of 15: 15,30,45,60; multiples of 20: 20,40,60 — LCM=60." },
      { topic: "Ratio and Proportion", stem: "If the ratio of two numbers is 5:7 and their sum is 144, find the larger number.", options: ["60", "72", "84", "90"], correct: 2, explanation: "Total parts=5+7=12; larger number = (7/12)×144 = 84." },
      { topic: "Simple Interest", stem: "Find the simple interest on ₹4000 at 6% per annum for 2 years.", options: ["₹360", "₹420", "₹480", "₹540"], correct: 2, explanation: "SI = (P×R×T)/100 = (4000×6×2)/100 = ₹480." },
      { topic: "Time and Work", stem: "A can finish a job in 8 days, B in 12 days. Together, how many days will they take?", options: ["4.5", "4.8", "5.2", "5.6"], correct: 1, explanation: "Combined rate = 1/8+1/12 = 3/24+2/24=5/24 per day; time = 24/5 = 4.8 days." },
      { topic: "Mensuration", stem: "Find the area of a rectangle with length 14m and breadth 9m.", options: ["112 sq m", "126 sq m", "136 sq m", "144 sq m"], correct: 1, explanation: "Area = length × breadth = 14×9 = 126 sq m." },
      { topic: "Average", stem: "Find the average of 12, 18, 24, 30, and 36.", options: ["22", "24", "26", "28"], correct: 1, explanation: "Sum = 12+18+24+30+36=120; average = 120/5=24." },
      { topic: "Compound Interest", stem: "Find the compound interest on ₹5000 at 8% per annum for 2 years, compounded annually.", options: ["₹800", "₹832", "₹850", "₹864"], correct: 1, explanation: "Amount = 5000×(1.08)² = 5000×1.1664 = ₹5832; CI = 5832−5000 = ₹832." },
      { topic: "Speed, Distance, Time", stem: "A cyclist covers 45km in 3 hours. What is the speed in km/h?", options: ["12", "13", "14", "15"], correct: 3, explanation: "Speed = distance/time = 45/3 = 15 km/h." },
      { topic: "Number Series", stem: "Find the next term: 4, 9, 16, 25, 36, ?", options: ["42", "45", "49", "52"], correct: 2, explanation: "These are perfect squares (2²,3²,4²,5²,6²); next is 7²=49." },
      { topic: "Profit and Loss", stem: "An item bought for ₹500 is sold for ₹575. What is the profit percentage?", options: ["12%", "15%", "18%", "20%"], correct: 1, explanation: "Profit = 575−500=75; profit% = (75/500)×100 = 15%." },
      { topic: "Blood Relations", stem: "If A is B's father and C is A's mother, how is C related to B?", options: ["Mother", "Grandmother", "Aunt", "Sister"], correct: 1, explanation: "C is A's mother, and A is B's father — so C is B's paternal grandmother." },
      { topic: "Direction Sense", stem: "A person walks 5km east, then 5km south. What is the shortest distance to the starting point?", options: ["5√2 km", "10km", "7.5km", "5km"], correct: 0, explanation: "This forms a right triangle with equal legs of 5km; distance = sqrt(5²+5²) = 5√2 km ≈ 7.07km." },
      { topic: "Coding-Decoding", stem: "If in a code, CAT is written as DBU (each letter shifted forward by 1), how is DOG written?", options: ["EPH", "EPI", "FPH", "EOH"], correct: 0, explanation: "Shifting each letter forward by 1: D→E, O→P, G→H, giving EPH." },
      { topic: "Number System", stem: "What is the smallest number that, when divided by 4, 5, and 6, leaves a remainder of 3 in each case?", options: ["60", "63", "65", "67"], correct: 1, explanation: "LCM of 4,5,6 = 60; adding the common remainder 3 gives 63." },
      { topic: "Mensuration — Circle", stem: "Find the area of a circle with radius 14cm (use π=22/7).", options: ["576 sq cm", "600 sq cm", "616 sq cm", "630 sq cm"], correct: 2, explanation: "Area = πr² = (22/7)×14×14 = 616 sq cm." },
      { topic: "Ranking", stem: "In a queue of 50 people, a person is 22nd from the front. What is his position from the back?", options: ["28", "29", "30", "31"], correct: 1, explanation: "Position from back = total − position from front + 1 = 50−22+1 = 29." },
      { topic: "Percentage — Successive", stem: "A price is increased by 25% and then decreased by 20%. What is the net percentage change?", options: ["No change", "5% increase", "5% decrease", "2% increase"], correct: 0, explanation: "Net change = 25 − 20 − (25×20)/100 = 5 − 5 = 0% — no net change." },
      { topic: "Age Puzzle", stem: "A father is 4 times as old as his son. After 5 years, the father will be 3 times as old as the son. Find the son's present age.", options: ["8", "10", "12", "14"], correct: 1, explanation: "Let son=x, father=4x. After 5 years: 4x+5=3(x+5) → 4x+5=3x+15 → x=10." },
    ],
  },
];
