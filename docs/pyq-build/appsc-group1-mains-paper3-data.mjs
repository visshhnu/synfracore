// APPSC Group 1 Mains Paper III (Polity, Constitution, Governance, Law &
// Ethics) -- PYQ + Model Answer data file. 8 of the 16 real questions from
// the actual APPSC Group 1 Mains 2020 Paper III -- a disclosed subset,
// chosen to cover Constitution/Polity and Governance/Ethics sections in
// reasonable proportion.
//
// SOURCING: primary verbatim source is EduRev's "APPSC Group-1 Mains-2020
// Polity Constitution Governance Law Ethics Paper-III" page (fetched
// directly, full text reproduced). Independently corroborated -- both the
// exact question text and existence of this paper -- by two further
// independent sites carrying the same paper: rajamudra.com's dedicated
// model-answer page for "Define Judicial Review... Justice Syed Shah
// Mohamed Quadri" (Q1b below), and andhrapradesh.pscnotes.com's dedicated
// notes page for the same question. This is a stronger verification bar
// than KPSC's Mains GS-I collection (topic-level-only secondary
// corroboration) since here a second site independently reproduces the
// same specific question text, not just the topic.
import { readFileSync } from "node:fs";

const PRIMARY = "EduRev, \"APPSC Group-1 Mains-2020 Polity Constitution Governance Law Ethics Paper-III\" (edurev.in/p/347911) -- verbatim source, fetched directly.";
const SECONDARY = "Independently corroborated by rajamudra.com and andhrapradesh.pscnotes.com, both of which carry dedicated pages reproducing this same paper's questions.";
const SOURCE = (n) => `APPSC Group 1 Mains 2020, Paper III, Q${n}. ${PRIMARY} ${SECONDARY}`;

export const COLLECTION = {
  slug: "appsc-group1-mains-paper3-2020-pyq",
  subject: "appsc",
  title: "APPSC Group 1 Mains Paper III — PYQ & Model Answers (2020)",
  examPaper: "paper-3",
  year: 2020,
  questionCount: 8,
  sortOrder: 1,
};

export const QUESTIONS = [
  {
    section: "Constitution & Polity",
    questionNumber: "1(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "How was the Constituent Assembly formed that framed the Indian constitution? Critically evaluate the Constitution of India as framed by the Constituent Assembly.",
    modelAnswer:
      "The Constituent Assembly was constituted under the Cabinet Mission Plan (1946), with members indirectly elected by the provincial legislative assemblies (roughly 1 member per million population) plus nominated representatives of the princely states, giving it a broadly representative but not directly-elected character. It first met on 9 December 1946, with Dr. Rajendra Prasad as President, and took nearly three years (finalized 26 November 1949, effective 26 January 1950) to draft the Constitution, working through a Drafting Committee chaired by Dr. B.R. Ambedkar.\n\nCritical evaluation: on the positive side, it was genuinely deliberative and inclusive within the constraints of the time -- diverse regional, religious, and ideological viewpoints were represented and debated at length (nearly 12 sittings' worth of debate on many contested provisions), producing a Constitution combining borrowed best practices (British parliamentary form, US fundamental rights, Irish DPSPs) with indigenous adaptations. Its main criticism is representativeness: members were not directly elected by universal adult franchise (impossible logistically at that point), and princely-state representation was often nominated rather than elected, meaning the Assembly's democratic legitimacy rests more on its deliberative process and eventual popular acceptance than on a strictly electoral mandate -- a distinction worth noting rather than treating the Assembly as a directly-elected body.",
    examinerNotes: "Reward answers that separate the FORMATION process (Cabinet Mission, indirect election) from the EVALUATION (deliberative strength vs. representativeness limitation) as two distinct parts, matching the question's two-part structure.",
    sourceNote: SOURCE("1(a)"),
  },
  {
    section: "Constitution & Polity",
    questionNumber: "1(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Define Judicial Review with special reference to the classification given by Justice Syed Shah Mohamed Quadri. Describe the importance and scope of Judicial Review.",
    modelAnswer:
      "Judicial Review is the power of courts (Supreme Court under Article 32, High Courts under Article 226) to examine the constitutionality of legislative enactments and executive actions, and to strike down those found inconsistent with the Constitution.\n\nJustice Syed Shah Mohamed Quadri classified Judicial Review into three categories: (1) judicial review of constitutional amendments, to test whether they violate the basic structure doctrine (Kesavananda Bharati, 1973); (2) judicial review of legislation passed by Parliament, State Legislatures, and subordinate/delegated legislation, to test conformity with constitutional provisions including fundamental rights; and (3) judicial review of administrative action of Union and State authorities, to test against constitutional provisions, statutory limits, and principles of natural justice.\n\nIts importance and scope: Judicial Review is a basic feature of the Constitution (per Kesavananda Bharati and later Indira Nehru Gandhi v. Raj Narain, 1975) and cannot be removed even by constitutional amendment; it protects fundamental rights against legislative or executive overreach, maintains the federal balance by adjudicating Centre-State disputes, and upholds the rule of law by ensuring state action stays within constitutional and statutory bounds. Its scope, however, is not unlimited -- courts generally avoid reviewing pure policy choices, deferring to legislative/executive discretion on matters of policy wisdom rather than legality.",
    examinerNotes: "Correctly naming all three of Quadri's categories, in the right order, is the key differentiator between a strong and a merely adequate answer here.",
    sourceNote: SOURCE("1(b)"),
  },
  {
    section: "Constitution & Polity",
    questionNumber: "3(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Describe the main features of the 73rd and 74th amendment of the Indian Constitution.",
    modelAnswer:
      "The 73rd Amendment (1992) constitutionalized Panchayati Raj Institutions (rural local self-government) by adding Part IX and the Eleventh Schedule (29 subjects). Its main features: a three-tier structure (Gram, Panchayat Samiti/intermediate, Zilla Parishad); direct elections to all seats with a fixed five-year term; mandatory reservation for SC/ST proportionate to population and not less than one-third (now often 50% in many states) for women; a State Election Commission for conducting panchayat elections; and State Finance Commissions to review panchayats' financial position.\n\nThe 74th Amendment (1992), its urban counterpart, added Part IXA and the Twelfth Schedule (18 subjects) constitutionalizing Urban Local Bodies. Its main features parallel the 73rd's: three categories of municipalities (Nagar Panchayat for transitional areas, Municipal Council for smaller urban areas, Municipal Corporation for larger urban areas) based on population and urbanization; similar reservation provisions for SC/ST/women; a State Election Commission (shared with the 73rd Amendment's mechanism); District Planning Committees and Metropolitan Planning Committees for consolidated area planning; and similarly mandated State Finance Commissions.\n\nTogether, both amendments represent the constitutional foundation of India's three-tier federal structure, extending genuine self-government below the state level for the first time with constitutional (not merely statutory) protection.",
    examinerNotes: "Strong answers name the specific Schedules (Eleventh/Twelfth) and Parts (IX/IXA) rather than describing the amendments only in general terms.",
    sourceNote: SOURCE("3(a)"),
  },
  {
    section: "Constitution & Polity",
    questionNumber: "4(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Explain any five salient features of the Indian Constitution.",
    modelAnswer:
      "Five salient features of the Indian Constitution: (1) It is the lengthiest written constitution in the world, comprehensively detailing the structure of government, fundamental rights, and administrative provisions rather than leaving these to convention alone. (2) It establishes a federal structure with a strong unitary bias -- residuary powers with the Centre, a single citizenship, an integrated judiciary, and emergency provisions allowing centralization, distinguishing it from a purely federal system like the US. (3) It combines a parliamentary form of government (drawn from the British model) with a written, rigid-in-parts amendment process and an independent judiciary exercising judicial review (drawn partly from the US model), making it a deliberate hybrid rather than a copy of either. (4) It guarantees Fundamental Rights (Part III) that are justiciable and enforceable directly through the Supreme Court (Article 32), alongside non-justiciable Directive Principles of State Policy (Part IV) meant to guide governance without being court-enforceable. (5) It establishes universal adult suffrage from the outset (Article 326), a significant step for a newly independent, largely illiterate and economically unequal society at the time, rather than phasing in franchise gradually as several Western democracies had historically done.",
    examinerNotes: "Any five well-explained, correctly-named features suffice -- reward specificity (e.g., naming Article 32 or Article 326) over generic description.",
    sourceNote: SOURCE("4(b)"),
  },
  {
    section: "Governance & Ethics",
    questionNumber: "6(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Define public administration and explain its evolution in India.",
    modelAnswer:
      "Public Administration is the implementation of government policy through the organization, management, and coordination of public services and institutions -- broadly, the machinery by which the state translates law and policy into action affecting citizens.\n\nIts evolution in India traces through distinct phases: the ancient period, with Kautilya's Arthashastra laying out a detailed, centralized administrative-fiscal system under the Mauryan state; the medieval period, with Mughal administration organizing revenue (through the mansabdari and jagirdari systems) and provincial governance under a centralized emperor; the colonial period, where the British built a professionalized, rule-bound bureaucracy (the Indian Civil Service, district administration under Collectors, codified law) primarily oriented toward revenue collection and law-and-order rather than welfare; and the post-independence period, where public administration was reoriented toward developmental and welfare goals -- five-year planning, public-sector enterprises, and later, since the 1990s liberalization, a shift toward regulatory and facilitative roles (e-governance, RTI-driven transparency, New Public Management-influenced reforms) alongside its traditional regulatory core.\n\nThis evolution reflects a broad shift from primarily extractive/regulatory colonial administration to a developmental, and now increasingly citizen-service-oriented, administrative model.",
    examinerNotes: "Reward answers that trace distinct historical phases (ancient/medieval/colonial/post-independence) rather than describing 'evolution' only in the post-1947 period.",
    sourceNote: SOURCE("6(a)"),
  },
  {
    section: "Governance & Ethics",
    questionNumber: "7(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Define 'development' as explained by Prof. Amartya Sen. Explain the characteristics of the new development thinking, and also mention the four areas where the government has to play a crucial role.",
    modelAnswer:
      "Amartya Sen defines development as \"Development as Freedom\" -- the expansion of real freedoms and capabilities people enjoy, not merely growth in GDP or income. Development, in this view, is judged by whether people are actually able to lead the lives they value (adequate health, education, political participation, economic opportunity), not by aggregate output alone.\n\nCharacteristics of this \"new development thinking\": it treats development as multidimensional (health, education, freedom, and agency, not income alone); it treats people as agents/ends of development, not merely instruments/means to growth; it emphasizes the removal of \"unfreedoms\" (poverty, tyranny, poor economic opportunity, social deprivation, neglect of public facilities, intolerance) as development's actual substance; and it links economic, social, and political freedoms as mutually reinforcing rather than treating economic growth as a sufficient precondition for the others.\n\nSen identifies four crucial areas for government action: (1) provision of public goods (health, education, infrastructure) that markets under-provide; (2) social security and safety nets protecting the vulnerable from destitution; (3) regulatory functions preventing market failures and abuse of market power; and (4) fostering an enabling environment for participatory governance and civil/political freedoms that let citizens hold the state accountable.",
    examinerNotes: "Correctly attributing \"Development as Freedom\" to Sen and naming all four government-role areas is what separates a strong answer from a generic 'development means growth plus welfare' response.",
    sourceNote: SOURCE("7(a)"),
  },
  {
    section: "Governance & Ethics",
    questionNumber: "8(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Give the reason for the UN to partner with the civil society. Explain the importance of civil societies. Under which Acts are the NGOs in India legally registered?",
    modelAnswer:
      "The UN partners with civil society primarily because governments alone cannot reach every community, monitor ground-level implementation, or represent marginalized voices as effectively as locally-rooted organizations -- civil society partnerships extend the UN's reach, bring grassroots legitimacy and local knowledge, and support monitoring/accountability for development goals (such as the SDGs) at the community level.\n\nThe importance of civil society organizations lies in several functions: they fill service-delivery gaps in areas of state capacity limitation (health, education, disaster relief); they act as a check on government and corporate power through advocacy, transparency campaigns, and public-interest litigation; they represent and organize marginalized or minority interests that may lack direct political voice; and they contribute to democratic deepening by fostering civic participation beyond periodic elections.\n\nIn India, NGOs are legally registered under one of several Acts depending on their structure: the Societies Registration Act, 1860 (for societies); the Indian Trusts Act, 1882 (for charitable/religious trusts); and Section 8 of the Companies Act, 2013 (for non-profit companies, replacing the earlier Section 25 of the Companies Act, 1956). Additionally, NGOs receiving foreign funding must separately register under the Foreign Contribution (Regulation) Act (FCRA), 2010.",
    examinerNotes: "Naming all the specific Acts (Societies Registration Act 1860, Indian Trusts Act 1882, Companies Act 2013 Section 8, and FCRA 2010 for foreign funding) is the concrete, checkable part examiners look for here.",
    sourceNote: SOURCE("8(a)"),
  },
  {
    section: "Governance & Ethics",
    questionNumber: "8(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "What is RTI? What rights are available under RTI Act 2005? If RTI is a Fundamental Right, then why do we need an Act to give us this Right?",
    modelAnswer:
      "The Right to Information (RTI) Act, 2005 gives Indian citizens a statutory right to request and obtain information held by public authorities, promoting transparency and accountability in governance.\n\nRights available under the Act include: the right to request any information held by or under the control of a public authority; the right to inspect documents, works, and records; the right to take notes, extracts, or certified copies of documents; and the right to obtain certified samples of material. Public authorities must respond within 30 days (48 hours if the matter concerns life or liberty), with a two-tier appeal mechanism (First Appellate Authority, then the Central/State Information Commission) if information is wrongly denied.\n\nOn why an Act was needed despite RTI's constitutional roots: the Supreme Court had already held (in cases such as State of U.P. v. Raj Narain, 1975, and later judgments) that the right to know is implicit within Article 19(1)(a)'s freedom of speech and expression, since meaningful expression requires access to information. However, this judicially-derived right was general and unenforceable in practice without a concrete procedural mechanism -- specifying which authorities must respond, within what time limit, through what appeal process, and with what exemptions (national security, personal privacy). The RTI Act, 2005 was needed precisely to operationalize this implicit constitutional right into a practically enforceable, time-bound statutory entitlement with a defined administrative and appellate machinery.",
    examinerNotes: "The third part is the differentiator -- strong answers explain WHY a judicially-recognized implicit right still needed statutory machinery (enforceability, timelines, appeal process), not just restate that RTI 'is' a fundamental right.",
    sourceNote: SOURCE("8(b)"),
  },
];
