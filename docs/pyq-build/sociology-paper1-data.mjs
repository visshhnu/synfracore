// UPSC Civil Services Mains Sociology Optional Paper I -- PYQ + Model Answer
// data file. All 28 questions below are real questions from the 2023 UPSC
// CSE Mains Sociology Optional Paper I (exam held 24 September 2023, morning
// session, per Triumph IAS's and IASbaba's exam-day coverage).
//
// Sourcing method: no single site publishes one clean verbatim transcription
// of this paper the way PW OnlyIAS/Next IAS did for PSIR, so each question
// here was cross-checked against THREE independent sources that had to
// agree in wording, numbering and marks before inclusion:
//   (1) Insights IAS's topic-wise PYQ compilation PDF (insightsonindia.com,
//       "UPSC Sociology Optional Previous Year Questions -- Topic-wise
//       Paper 1, 2013 to 2025"), which tags each question by year;
//   (2) Synopsis IAS's per-question solution blog (synopsisias.com), which
//       titles each individual post with the near-verbatim question text,
//       exam year and marks (e.g. "Sociology 2c. What are variables? How do
//       they facilitate research? UPSC 2023, 10 Marks");
//   (3) Triumph IAS's full paper-structure summary (triumphias.com,
//       "Sociology Paper 1 2023 | 24 SEP 2023"), which independently lists
//       every question's topic, section, question number and marks.
// All 28 questions below matched across all three sources. See gen.mjs
// header for the required data shape.
//
// Word-limit note: UPSC's official convention prints "in about 150 words
// each" only for the five-part Q1 and Q5 "answer in 150 words each"
// instructions (10 marks per sub-part) -- confirmed by Triumph IAS's
// structure summary and the Insights IAS compilation. It does not print a
// word limit for the 20-mark questions (Q2-4, Q6-8) or for the other
// 10-mark sub-parts embedded inside them (2c, 3c, 4c, 6c, 7c, 8c); this file
// applies UPSC's well-documented general convention for those (approx. 150
// words for 10 marks, approx. 350 words for 20 marks), the same convention
// used in the Geography and PSIR Paper I PYQ files -- these values are the
// convention, not literal paper text, except for Q1/Q5 where 150 words is
// the literal printed instruction.

const SOURCE_A = (q) =>
  `UPSC CSE Mains 2023, Sociology Optional Paper I, Section A, Q${q}. Verified against three independent sources that matched in wording, numbering and marks: Insights IAS's topic-wise PYQ compilation (insightsonindia.com, "UPSC Sociology Optional Previous Year Questions -- Topic-wise Paper 1, 2013 to 2025", tagged by exam year), Synopsis IAS's per-question solution blog (synopsisias.com, titled with near-verbatim question text, year and marks), and Triumph IAS's full paper-structure summary (triumphias.com, "Sociology Paper 1 2023 | 24 SEP 2023").`;

const SOURCE_B = (q) =>
  `UPSC CSE Mains 2023, Sociology Optional Paper I, Section B, Q${q}. Verified against three independent sources that matched in wording, numbering and marks: Insights IAS's topic-wise PYQ compilation (insightsonindia.com, "UPSC Sociology Optional Previous Year Questions -- Topic-wise Paper 1, 2013 to 2025", tagged by exam year), Synopsis IAS's per-question solution blog (synopsisias.com, titled with near-verbatim question text, year and marks), and Triumph IAS's full paper-structure summary (triumphias.com, "Sociology Paper 1 2023 | 24 SEP 2023").`;

export const COLLECTION = {
  slug: "upsc-sociology-optional-paper-1-pyq",
  subject: "sociology",
  title: "UPSC Sociology Optional Paper I — PYQ & Model Answers (2023)",
  examPaper: "paper-1",
  year: 2023,
  questionCount: 28,
  sortOrder: 1,
};

export const QUESTIONS = [
  // ---------------- SECTION A ----------------
  {
    section: "A",
    questionNumber: "1(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "What is the distinctiveness of the feminist method of social research? Comment.",
    modelAnswer:
      "The feminist method of social research departs from mainstream 'malestream' positivist sociology by making gender itself a central analytical category and by challenging the claim that research can or should be objective, neutral and detached.\n\nDistinctive features: (i) It rejects the researcher-researched hierarchy of positivism, favouring participatory, dialogic methods (open-ended interviews, oral histories, consciousness-raising groups) that treat women as knowing subjects, not passive objects of study. (ii) It foregrounds reflexivity -- the researcher's own gender, position and values are treated as relevant to the knowledge produced, not bracketed out. (iii) It is explicitly emancipatory in intent: research is meant to expose and challenge women's subordination, not merely describe it (standpoint theorists like Dorothy Smith and Sandra Harding argue marginalised standpoints yield more objective, not less objective, knowledge). (iv) It valorises qualitative, experience-near methods over quantification, since lived experience of patriarchy resists reduction to variables. (v) It treats the personal as political, making topics like housework, domestic violence and sexuality legitimate objects of rigorous sociological inquiry that mainstream method had ignored.\n\nThis makes feminist method as much an epistemological and ethical stance as a set of techniques.",
    examinerNotes:
      "Strong answers name standpoint theory (Smith/Harding) and explicitly contrast feminist method against positivist objectivity claims, rather than only listing 'qualitative methods' as the distinctiveness. The emancipatory intent (research as consciousness-raising, not neutral description) is the key differentiator examiners look for.",
    sourceNote: SOURCE_A("1(a)"),
  },
  {
    section: "A",
    questionNumber: "1(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Discuss the relationship between sociology and political science.",
    modelAnswer:
      "Sociology and political science share a common origin in the study of human collective life and overlap substantially, while remaining distinguished by their central focus: political science concentrates on the state, government, power and formal political institutions, while sociology studies society as a whole, of which the political system is one sub-system.\n\nPoints of convergence: both study power, but sociology extends the analysis beyond the state to power relations in families, workplaces and communities (Weber's broad definition of power as the basis for both disciplines); political sociology, a genuine hybrid sub-field, studies how social structures (class, caste, ethnicity) shape political behaviour, voting patterns, and state formation, drawing on both disciplines. Concepts like legitimacy, authority, elites and civil society are jointly theorised (Weber, Michels, Gramsci, Pareto span both fields).\n\nPoints of divergence: political science is narrower and more institution-focused (constitutions, elections, public policy), often normative/prescriptive about governance, while sociology is broader, more empirical about social causes and consequences of political phenomena, treating the state as one institution among many shaping social life.\n\nThe two disciplines are therefore complementary rather than competing, with political sociology as their most productive meeting point.",
    examinerNotes:
      "Naming political sociology explicitly as the hybrid sub-field, and at least one shared thinker (Weber, Michels, Gramsci, Pareto), is what separates a strong answer from a generic 'both study society' response. A crisp convergence/divergence structure is the expected format for a 10-mark, 150-word comparison question.",
    sourceNote: SOURCE_A("1(b)"),
  },
  {
    section: "A",
    questionNumber: "1(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "How does the dramaturgical perspective enable our understanding of everyday life?",
    modelAnswer:
      "Erving Goffman's dramaturgical perspective (The Presentation of Self in Everyday Life, 1959) treats social interaction as theatrical performance: individuals are 'actors' who manage impressions before an 'audience' across a 'front stage' (where a socially expected role is performed) and 'back stage' (where the actor can drop the performance and relax).\n\nKey concepts enabling understanding of everyday life: impression management -- individuals consciously and unconsciously control gestures, dress, and speech to project a desired self-image (e.g., a waiter's polished front-stage demeanour versus kitchen back-stage informality); role distance -- the gap between an assigned role and the self performing it; teams -- groups that cooperate to sustain a shared performance (e.g., a family presenting unity to guests); and face-work -- strategies to maintain one's own and others' 'face' during interaction, avoiding embarrassment.\n\nThis perspective reveals that everyday, mundane interactions (greetings, workplace conduct, social media self-presentation) are not spontaneous but socially staged and rule-governed, showing how social order is continuously and actively produced through micro-level performance rather than existing only in macro-structures -- a foundational insight for symbolic interactionism and micro-sociology.",
    examinerNotes:
      "Naming Goffman explicitly along with front-stage/back-stage and at least one further concept (impression management, teams, face-work) is essential. A concrete everyday example (workplace, social media) strengthens what could otherwise remain an abstract definitional answer.",
    sourceNote: SOURCE_A("1(c)"),
  },
  {
    section: "A",
    questionNumber: "1(d)",
    marks: 10,
    wordLimit: 150,
    questionText: "Is reference group theory a universally applicable model? Elucidate.",
    modelAnswer:
      "Reference group theory (Herbert Hyman, developed by Robert K. Merton and Muzafer Sherif) holds that individuals evaluate themselves, form aspirations and shape attitudes not only by their actual membership group but by reference to groups they aspire to join (positive reference group) or wish to distance themselves from (negative reference group), producing phenomena like relative deprivation.\n\nCase for universal applicability: the underlying mechanism -- comparing oneself to a group one is not a member of -- appears across contexts: caste mobility in India (Sanskritisation, lower castes emulating upper-caste practices), migrants' aspirational comparison to host-society norms, and consumer behaviour (aspirational brand reference groups) all fit the model.\n\nLimits on universality: the theory assumes a degree of social openness and awareness of alternative groups that rigid, closed stratification systems (extreme caste endogamy, strict class barriers) may suppress, muting reference-group effects. It also under-specifies WHICH group becomes a reference group and why, and can be culturally variable -- collectivist societies may generate different reference dynamics (family/community-anchored) than individualist ones.\n\nConclusion: reference group theory offers a broadly applicable mechanism, but its actual operation is conditioned by a society's degree of openness, information flow and cultural orientation, making it a widely useful but not context-free universal model.",
    examinerNotes:
      "The question directly asks for a judgment (is it universal?), so a purely descriptive answer without taking and defending a position loses marks. Sanskritisation is the standard Indian illustration examiners expect; a nuanced answer should flag the theory's limits in closed/rigid social systems.",
    sourceNote: SOURCE_A("1(d)"),
  },
  {
    section: "A",
    questionNumber: "1(e)",
    marks: 10,
    wordLimit: 150,
    questionText: "Do you think that the boundary line between ethnicity and race is blurred? Justify your answer.",
    modelAnswer:
      "Classically, race was treated as a biological category based on inherited physical traits (skin colour, phenotype), while ethnicity was treated as a cultural category based on shared language, religion, ancestry and customs. Contemporary sociology, however, largely rejects race as a valid biological construct (there is no genetic basis for discrete human 'races') and treats it instead as a socially constructed category -- which collapses much of the classical distinction.\n\nWhy the boundary is blurred: both race and ethnicity are now understood as socially and politically constructed identities used to include/exclude groups; racial categories (e.g. 'Black', 'White', 'Asian' in Western censuses) are themselves culturally and historically variable, not fixed biological facts, making them function much like ethnic categories; ethnic groups are also frequently racialised (e.g. antisemitism, Islamophobia treat religious/ethnic groups as if they were biologically distinct races); and in everyday and even administrative usage the terms are often used interchangeably or overlap heavily (e.g. 'Hispanic/Latino' in the US census straddles both).\n\nConclusion: since modern sociology treats race as a social construction rather than biological fact, the analytical boundary with ethnicity has substantially blurred, though the terms retain some practical distinctiveness in referring to physical-appearance-based versus culture-based group markers respectively.",
    examinerNotes:
      "Candidates should explicitly state that sociology rejects race as a valid biological category -- this is the pivot on which the 'blurring' argument rests. An example of racialised ethnicity (antisemitism, Islamophobia, or a census category like Hispanic/Latino) strengthens the justification the question demands.",
    sourceNote: SOURCE_A("1(e)"),
  },
  {
    section: "A",
    questionNumber: "2(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "What, according to Robert Michels, is the iron law of oligarchy? Do lions and foxes in Vilfredo Pareto's theory, essentially differ from each other? Substantiate.",
    modelAnswer:
      "Introduction: Both Robert Michels and Vilfredo Pareto, key figures of classical elite theory, argued that formal democratic and egalitarian ideals inevitably give way to rule by a small elite -- Michels through organisational necessity, Pareto through the psychological character of ruling elites.\n\nMichels' iron law of oligarchy (Political Parties, 1911): studying European socialist parties and trade unions -- organisations explicitly committed to internal democracy -- Michels found that as any large organisation grows, it develops a need for specialised leadership, technical expertise, and efficient administration, which concentrates real decision-making power in the hands of a small permanent leadership. This leadership then develops entrenched interests in retaining power (access to resources, status, continuity), using its control of information, organisational machinery and communication to perpetuate itself, marginalising rank-and-file participation. Michels concluded oligarchy is not a corruption of democratic organisation but an inevitable, structural outcome of organisation itself -- 'who says organisation, says oligarchy'.\n\nPareto's lions and foxes: Pareto (The Mind and Society) classified elites by their governing style, drawing on Machiavelli's imagery. 'Lions' rule through force, conservatism, and reliance on established norms and coercion -- stable but rigid, eventually failing to adapt to changing conditions. 'Foxes' rule through cunning, manipulation, persuasion and calculation, skilled at coalition-building and innovation, but prone to indecisiveness and lacking the resolve to use force when needed. Pareto argued political history consists of a 'circulation of elites' -- lion-type elites are eventually replaced by fox-type elites (and vice versa) as each type's characteristic weakness creates the conditions for its own displacement.\n\nDo lions and foxes essentially differ? Yes -- they represent genuinely distinct governing psychologies/strategies (force/rigidity vs cunning/adaptability), not merely stylistic variants, and Pareto's entire theory of elite circulation depends on this being a real, substantive difference, since it is precisely the persistent inadequacy of each type that drives their cyclical replacement by the other.\n\nConclusion: Michels explains WHY oligarchy is inevitable within any organisation (structural/administrative necessity), while Pareto explains HOW ruling elites differ in style and why they cyclically alternate (psychological/strategic typology) -- the two theories are complementary strands of classical elite theory challenging Marxist and democratic-participatory assumptions alike.",
    examinerNotes:
      "This is a two-part 20-mark question -- both Michels' law AND the lions/foxes distinction (with a reasoned yes/no judgment) must be developed, not just one. 'Who says organisation, says oligarchy' and the Machiavellian lion/fox imagery are the specific citations examiners expect.",
    sourceNote: SOURCE_A("2(a)"),
  },
  {
    section: "A",
    questionNumber: "2(b)",
    marks: 20,
    wordLimit: 350,
    questionText: "What is historical materialism? Examine its relevance in understanding contemporary societies.",
    modelAnswer:
      "Introduction: Historical materialism is Karl Marx's theory of social and historical change, holding that the material, economic conditions of production -- not ideas, culture or politics -- are the fundamental driving force of history and social organisation.\n\nCore propositions: society's economic 'base' -- the forces of production (technology, resources, labour) and relations of production (ownership, class relations) -- determines the 'superstructure' of politics, law, religion, culture and ideology, which primarily serves to legitimise and reproduce existing production relations. History progresses through successive modes of production (primitive communism, ancient slave society, feudalism, capitalism, and, Marx predicted, socialism/communism), each characterised by a dominant class relation and internal contradictions between forces and relations of production that eventually produce class conflict and revolutionary transformation to the next stage. The proletariat-bourgeoisie conflict under capitalism is, for Marx, the penultimate such contradiction, destined to produce socialist revolution.\n\nRelevance in understanding contemporary societies: (i) It remains a powerful lens for analysing global capitalism, inequality and class -- explaining phenomena like the gig economy, automation-driven job insecurity, and widening wealth gaps as products of capital's structural imperatives (profit maximisation, labour exploitation) rather than incidental policy failures. (ii) World-systems and dependency theorists (Wallerstein, A.G. Frank) extend historical materialism to explain global core-periphery inequality and underdevelopment as products of capitalist accumulation on a world scale. (iii) It informs contemporary critiques of neoliberal globalisation, financialisation, and corporate power. (iv) Feminist and postcolonial scholars have productively extended (while also critiquing) the framework to analyse reproductive/domestic labour and colonial extraction as forms of material exploitation historical materialism's classic base-superstructure model under-theorised.\n\nLimits: critics note historical materialism's economic determinism underplays the independent causal role of culture, ideology, religion and individual agency (a critique developed by Weber's multi-causal approach), and its predicted socialist revolution has not materialised in advanced capitalist societies as Marx expected, requiring later Marxists (Gramsci, Althusser) to substantially revise the base-superstructure relationship.\n\nConclusion: while its deterministic predictions have not been vindicated, historical materialism's core insight -- that economic structures profoundly shape social and political life -- retains significant explanatory power for understanding contemporary capitalism, inequality and globalisation.",
    examinerNotes:
      "Candidates must state the base-superstructure model and the succession of modes of production before pivoting to contemporary relevance; strong answers extend to world-systems theory (Wallerstein/Frank) and note the standard Weberian critique of economic determinism for balance.",
    sourceNote: SOURCE_A("2(b)"),
  },
  {
    section: "A",
    questionNumber: "2(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "What are variables? How do they facilitate research?",
    modelAnswer:
      "In sociological research, a variable is any concept, characteristic or attribute that can take on different values or categories across the units being studied (individuals, groups, societies) -- e.g. income, education, gender, caste, religiosity.\n\nTypes: independent variables (the presumed cause, manipulated or observed as the predictor), dependent variables (the presumed effect, what the researcher measures as the outcome), and intervening/mediating and control variables (which help explain or isolate the relationship between the two). Variables can also be classified as continuous (income, age) or categorical/discrete (gender, religion).\n\nHow they facilitate research: variables translate abstract sociological concepts into measurable, observable units, enabling operationalisation of theory (e.g. converting 'social class' into measurable indicators like income, occupation, education). They allow researchers to formulate testable hypotheses about relationships (e.g. 'education level is positively associated with income'), which can then be empirically examined through correlation, comparison or experimentation. Standardising variables across a study also enables replication, quantitative comparison across cases, and statistical analysis -- turning qualitative social reality into data that supports systematic, cumulative, falsifiable knowledge-building rather than purely impressionistic description.",
    examinerNotes:
      "A complete answer must both define variables AND explicitly address 'how they facilitate research' -- operationalisation of abstract concepts, hypothesis testing, and enabling comparison/replication are the specific mechanisms examiners expect, not just a types-of-variables list.",
    sourceNote: SOURCE_A("2(c)"),
  },
  {
    section: "A",
    questionNumber: "3(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "What are the characteristics of scientific method? Do you think that scientific method in conducting sociological research is foolproof? Elaborate.",
    modelAnswer:
      "Introduction: The scientific method -- systematic observation, hypothesis formation, testing and verification -- has been sociology's aspirational model since Comte and Durkheim sought to establish it as a 'positive science' of society, though its applicability to social phenomena remains genuinely contested.\n\nCharacteristics of scientific method: (i) Empiricism -- knowledge claims must be grounded in observable, verifiable evidence, not speculation. (ii) Objectivity -- the researcher aims for value-neutral observation, minimising personal bias (Weber's 'value-free' sociology ideal, though he himself doubted its full achievability). (iii) Systematic, replicable procedure -- following standardised, transparent methods so other researchers can repeat the study and verify findings. (iv) Falsifiability (Popper) -- hypotheses must be stated in a way that allows them to be potentially disproven by evidence, not merely confirmed. (v) Generalisability -- findings from a sample should extend to a broader population through valid sampling and inference. (vi) Cumulative, self-correcting knowledge-building through peer scrutiny and repeated testing.\n\nIs it foolproof for sociological research? Significant limitations exist: (i) The subject matter of sociology -- conscious, meaning-making human beings -- is fundamentally different from inert natural-science objects; human behaviour is reflexive (people react to being studied, the Hawthorne effect) and interpretive (Weber's Verstehen), resisting reduction to law-like generalisations the way physical phenomena can be. (ii) True experimental control and randomisation are rarely possible in real social settings for practical and ethical reasons, weakening causal inference. (iii) Complete value-neutrality is arguably impossible -- researchers' theoretical frameworks, cultural location and even choice of research topic embed values (Gunnar Myrdal, feminist standpoint critiques). (iv) Social phenomena are historically and culturally specific, limiting the universal generalisability natural-science laws claim. (v) Measurement of social concepts (class, alienation, anomie) involves inherent interpretive ambiguity that physical measurement does not.\n\nConclusion: the scientific method provides indispensable rigour, discipline and a check against pure subjectivity in sociological research, but given the reflexive, meaning-laden and value-embedded nature of social life, it cannot be considered foolproof in sociology the way it approaches being in the natural sciences -- most contemporary sociologists therefore treat it as a valuable but necessarily imperfect and supplemented (by interpretive/qualitative methods) methodological ideal.",
    examinerNotes:
      "The question has two explicit parts: characteristics (a checklist answer) AND a reasoned judgment on foolproof-ness, which must be argued, not asserted. Citing Popper's falsifiability and Weber's Verstehen/value-neutrality debate is the expected theoretical anchoring for the second half.",
    sourceNote: SOURCE_A("3(a)"),
  },
  {
    section: "A",
    questionNumber: "3(b)",
    marks: 20,
    wordLimit: 350,
    questionText: "How do you assess the changing patterns in kinship relations in societies today?",
    modelAnswer:
      "Introduction: Kinship -- relations based on blood (consanguinity), marriage (affinity) and social recognition -- is undergoing significant transformation globally and in India under the combined pressures of industrialisation, urbanisation, migration, legal change and shifting cultural values.\n\nKey changes: (i) Shift from joint/extended to nuclear family forms -- urbanisation and labour migration for employment favour smaller, geographically mobile nuclear households, though many scholars (following A.M. Shah's and Patricia Uberoi's work on the Indian joint family) note this shift is partial and functional joint-family ties (economic support, ritual obligation, emotional connection) persist even where residence is nuclear ('joint family in spirit, nuclear in structure'). (ii) Weakening of arranged-marriage/kinship-endogamy norms -- rising individual choice in partner selection, inter-caste and inter-religious marriages (still a minority but growing and increasingly visible/contested, as in honour-killing cases), and matrimonial apps/online platforms reshaping how marital kin ties form. (iii) Declining fertility and smaller sibling networks reduce the density of collateral kin (cousins, aunts/uncles) in individuals' active kinship networks. (iv) New family forms -- single-parent households, LGBTQ+ partnerships and chosen families, live-in relationships, and delayed/foregone marriage -- are gaining visibility and, in some jurisdictions, legal recognition, challenging heteronormative, marriage-centred definitions of kinship. (v) Transnational kinship -- migration creates geographically dispersed kin networks sustained through remittances, video calls and periodic visits rather than co-residence (David Morgan's 'family practices' approach captures this shift from kinship as a fixed structure to kinship as ongoing relational 'doing'). (vi) Declining significance of formal kinship obligations (bride price/dowry practices persisting in modified forms, inheritance norms) alongside continuing informal reliance on kin networks for childcare, elder care and economic support, especially where state welfare provision is weak.\n\nConclusion: kinship today is best understood not as a fixed structural system but as a fluid, actively negotiated and practised set of relationships (following Morgan and later relational sociology), shaped by the countervailing pulls of individualisation and mobility on one hand and persistent functional and emotional reliance on kin ties on the other -- a genuinely mixed, transitional pattern rather than a simple linear shift from 'traditional' to 'modern' kinship.",
    examinerNotes:
      "A strong answer avoids a simplistic 'joint family declining, nuclear family rising' narrative, citing A.M. Shah/Uberoi's finding that functional jointness persists despite nuclear residence, and ideally references David Morgan's 'family practices' shift from structure to practice -- which also directly connects to Q5(d) on Morgan in this same paper.",
    sourceNote: SOURCE_A("3(b)"),
  },
  {
    section: "A",
    questionNumber: "3(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Is Weber's idea of bureaucracy a product of the historical experiences of Europe? Comment.",
    modelAnswer:
      "Max Weber developed his ideal-typical model of bureaucracy -- hierarchical authority, fixed jurisdictional areas, rule-governed conduct, written records, appointment by technical qualification, career-based employment, and separation of office from the person -- as the organisational expression of legal-rational authority, which he saw as the distinctively modern form of domination.\n\nCase that it is Europe-specific: Weber explicitly derived this model from European historical trajectories -- the rise of centralised nation-states, Roman law's systematisation, Protestant rational asceticism (linked to his Protestant Ethic thesis), and modern capitalism's demand for calculable, predictable administration all provided the specific historical conditions for legal-rational bureaucracy to emerge and dominate in Europe.\n\nCase for broader applicability: Weber himself noted proto-bureaucratic administrative forms in ancient Egypt, China's imperial mandarin examination system, and the Roman and Ottoman empires, suggesting bureaucratic administration is not uniquely European in origin, even if Weber's fully rationalised, legal-rational ideal type crystallised specifically in the European context of capitalism and the rational-legal state.\n\nConclusion: Weber's SPECIFIC ideal-typical formulation is historically rooted in Europe's unique convergence of rationalisation, capitalism and rational-legal statehood, but bureaucratic administration as a general organisational phenomenon predates and exceeds that European context.",
    examinerNotes:
      "Candidates should distinguish between bureaucracy as a general administrative phenomenon (found in ancient China, Egypt, Rome) versus Weber's specific legal-rational ideal type (which he tied closely to European rationalisation and capitalism) -- collapsing these two produces a one-sided answer either way.",
    sourceNote: SOURCE_A("3(c)"),
  },
  {
    section: "A",
    questionNumber: "4(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "Do you think that common sense is the starting point of social research? What are its advantages and limitations? Explain.",
    modelAnswer:
      "Introduction: Common sense -- the taken-for-granted, everyday understanding of social life that all members of society possess -- has an ambiguous but genuine relationship to sociological research: sociology often begins by questioning common sense, yet cannot entirely dispense with it as a starting point.\n\nCommon sense as a starting point: sociological curiosity frequently originates in everyday observations and puzzles about social life (why do people conform, why does inequality persist) that are first noticed through ordinary, common-sense awareness before being systematically investigated. C. Wright Mills' 'sociological imagination' itself begins from common, personal troubles before connecting them to broader public issues. Early sociological concepts (family, community, class) are drawn from everyday vocabulary before being refined into technical concepts. In this sense, common sense provides the raw, pre-theoretical material and initial research questions that sociology then subjects to systematic scrutiny.\n\nAdvantages of starting from common sense: it offers accessible, culturally grounded, experience-near understanding that keeps research questions relevant to lived social reality rather than abstract or artificial; it can generate hypotheses efficiently since researchers (as social beings themselves) already possess intuitive familiarity with social patterns; and it aids communication of findings back to the public in accessible terms.\n\nLimitations: common sense is often unsystematic, internally inconsistent, and based on limited personal experience rather than representative evidence, leading to overgeneralisation and stereotyping; it tends to naturalise existing social arrangements (patriarchy, caste hierarchy) as simply 'the way things are', obscuring their socially constructed and historically contingent character -- precisely what sociology's 'defamiliarisation' function (Berger's 'seeing the strange in the familiar') seeks to counteract; it lacks the rigour, falsifiability and evidentiary standards of systematic method, and can encode biases and prejudices (about gender, caste, race) as unquestioned truths, which unreflective sociological research risks simply reproducing rather than critically examining.\n\nConclusion: common sense can legitimately provide sociology's initial questions and intuitive entry point, but sociological method exists precisely to interrogate, systematise, and where necessary overturn common-sense assumptions through rigorous, evidence-based, reflexive inquiry -- making common sense a starting point to be transcended, not a substitute for systematic research.",
    examinerNotes:
      "The question demands a judgment (do you think...) followed by structured advantages/limitations -- Peter Berger's 'defamiliarisation' idea (sociology reveals the extraordinary within the ordinary) and C. Wright Mills' sociological imagination are the standard theoretical anchors expected here.",
    sourceNote: SOURCE_A("4(a)"),
  },
  {
    section: "A",
    questionNumber: "4(b)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "How is poverty a form of social exclusion? Illustrate in this connection the different dimensions of poverty and social exclusion.",
    modelAnswer:
      "Introduction: Traditional definitions of poverty focused narrowly on income or consumption falling below a subsistence threshold; contemporary sociology, drawing on the social exclusion framework developed in Europe and extended by Amartya Sen's capability approach, understands poverty as multidimensional deprivation intertwined with exclusion from social, economic, political and cultural participation.\n\nHow poverty constitutes social exclusion: poverty is not merely a lack of income but a process by which individuals and groups are systematically shut out of the resources, rights, opportunities and relationships that enable full participation in society -- economic exclusion (from labour markets, credit, land ownership), social exclusion (from social networks, community life, stigmatisation), political exclusion (from decision-making, weak political voice/representation), and cultural exclusion (denial of recognition, dignity, and cultural participation). The poor often experience these dimensions simultaneously and reinforcing each other -- economic deprivation limits political voice, which in turn limits the ability to claim redistributive resources, forming a self-perpetuating cycle.\n\nDimensions of poverty: (i) Income/consumption poverty -- the traditional monetary measure. (ii) Capability poverty (Sen) -- lack of substantive freedoms and capabilities (health, education, agency) to lead a valued life, regardless of income. (iii) Human Development-style multidimensional poverty (education, health, living standards, as in India's Multidimensional Poverty Index). (iv) Relative poverty -- deprivation measured against prevailing societal living standards, not an absolute subsistence line. (v) Chronic vs transient poverty -- persistent, intergenerational poverty (often linked to caste, tribal status) versus temporary poverty from shocks.\n\nDimensions of social exclusion: (i) Distributional exclusion -- from material resources and services. (ii) Relational exclusion -- from social networks, community belonging, and recognition (e.g. caste-based untouchability practices, though constitutionally abolished, persist informally). (iii) Spatial exclusion -- concentration of the poor in segregated slums, remote or degraded areas with poor infrastructure access. (iv) Institutional/political exclusion -- from formal political participation, legal protection, and bureaucratic responsiveness. In India, caste, tribal status, religious minority status, gender and disability frequently compound with income poverty to produce especially severe, mutually reinforcing exclusion (Dalits and Adivasis being paradigm cases).\n\nConclusion: understanding poverty through the social exclusion lens shifts policy focus from income transfers alone toward addressing the structural, relational and political processes that keep certain groups perpetually shut out of full social participation.",
    examinerNotes:
      "Sen's capability approach and the distinction between income poverty and multidimensional/relational exclusion are essential theoretical content. An Indian illustration (caste-based exclusion compounding income poverty, e.g. Dalits/Adivasis) is expected to ground the otherwise conceptual answer.",
    sourceNote: SOURCE_A("4(b)"),
  },
  {
    section: "A",
    questionNumber: "4(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Highlight the differences and similarities between totemism and animism.",
    modelAnswer:
      "Totemism and animism are both classical anthropological categories of 'primitive'/tribal religion concerned with the sacred status of the natural world, but they differ in structure and focus.\n\nAnimism (E.B. Tylor, Primitive Culture, 1871) is the belief that natural objects, phenomena and beings (rivers, trees, mountains, animals) possess individual spirits or souls -- Tylor considered it the earliest, most minimal form of religion, arising from early humans' attempts to explain dreams, death and natural phenomena through spiritual agency.\n\nTotemism (studied by Durkheim, Frazer, and later Levi-Strauss) is the belief that a clan or social group has a special mystical/symbolic relationship with a specific totem -- usually an animal or plant species -- which serves as the group's emblem, ancestor-symbol, and object of ritual respect (often with taboos against killing/eating it), reinforcing clan identity and social solidarity (Durkheim's Elementary Forms treats totemism as the origin of the sacred/profane distinction itself).\n\nDifferences: animism is about individualised spirits in natural objects generally; totemism is about a specific, socially organised group-totem relationship tied to clan identity and social structure. Levi-Strauss further argued totems are 'good to think' -- classificatory symbols -- rather than literally believed-in kin, unlike animism's more literal spirit-belief.\n\nSimilarities: both attribute sacred, non-ordinary significance to elements of the natural world and both are foundational concepts in the sociology/anthropology of religion's account of how the sacred is constructed from nature.",
    examinerNotes:
      "Tylor for animism and Durkheim (plus Levi-Strauss's structuralist reinterpretation) for totemism are the specific theorists examiners expect named. The key structural distinction -- individualised nature-spirits versus a socially organised clan-totem relationship -- is the crux of the 'differences' half.",
    sourceNote: SOURCE_A("4(c)"),
  },
  // ---------------- SECTION B ----------------
  {
    section: "B",
    questionNumber: "5(a)",
    marks: 10,
    wordLimit: 150,
    questionText:
      "Examine the relevance of corporate social responsibility in a world marked by increasing environmental crises.",
    modelAnswer:
      "Corporate Social Responsibility (CSR) -- the voluntary (and in India, since the Companies Act 2013, partly mandatory) assumption by businesses of responsibility for their social and environmental impact beyond profit-making -- has gained heightened relevance as climate change, biodiversity loss and resource depletion intensify.\n\nRelevance: (i) Corporations are major contributors to environmental crises (carbon emissions, pollution, deforestation, resource extraction), making their voluntary or mandated environmental responsibility directly consequential for mitigation, not merely symbolic. (ii) CSR channels corporate resources and expertise into environmental remediation, renewable energy investment, and sustainable supply-chain practices that state regulation alone may be too slow or under-resourced to achieve. (iii) It reflects and responds to changing stakeholder expectations -- consumers, investors (ESG-linked investment) and employees increasingly demand environmental accountability, making CSR also a matter of reputational and market survival. (iv) India's mandatory 2% CSR spending requirement for qualifying companies has directed real resources toward environmental and sustainability projects.\n\nLimitations: critics note CSR can function as 'greenwashing' -- symbolic compliance or public-relations activity that does not address a firm's core polluting business model, and remains voluntary/inadequate relative to the scale of the crisis, meaning CSR is best understood as a necessary but insufficient complement to, not a substitute for, binding environmental regulation.",
    examinerNotes:
      "A balanced answer must include the greenwashing critique alongside CSR's genuine contributions -- an uncritically positive answer misses half the analytical content examiners expect. India's mandatory 2% CSR spend (Companies Act, 2013) is a strong concrete anchor.",
    sourceNote: SOURCE_B("5(a)"),
  },
  {
    section: "B",
    questionNumber: "5(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "How is civil society useful in deepening the roots of democracy?",
    modelAnswer:
      "Civil society -- the sphere of voluntary associations, NGOs, social movements, professional bodies and community organisations existing independently of the state and market -- performs functions that formal democratic institutions (elections, legislatures) alone cannot fully provide, thereby deepening democracy beyond its minimal, procedural form.\n\nMechanisms: (i) It aggregates and articulates diverse social interests, especially of marginalised groups (Dalits, tribal communities, women), giving them voice between elections, not just at the ballot box. (ii) It performs watchdog/accountability functions -- monitoring government performance, exposing corruption, and using RTI-style tools to hold the state accountable, supplementing formal checks and balances. (iii) It builds social capital and associational habits (Putnam, Tocqueville) -- participation in voluntary associations cultivates trust, cooperation and civic skills that translate into more engaged democratic citizenship. (iv) It mediates between citizens and the state, articulating grievances through advocacy and mobilisation (e.g. India's RTI movement, environmental and land-rights movements) rather than only through violent or purely electoral channels. (v) It fosters public deliberation and a functioning public sphere (Habermas) where policy issues are debated outside formal state control.\n\nBy enabling continuous citizen participation, accountability and deliberation beyond periodic voting, a vibrant civil society transforms procedural democracy into substantive, participatory democracy.",
    examinerNotes:
      "Naming Putnam/Tocqueville on social capital and Habermas on the public sphere elevates the answer beyond a generic 'NGOs are good for democracy' response. At least one Indian civil-society example (RTI movement, land-rights or environmental mobilisation) is expected.",
    sourceNote: SOURCE_B("5(b)"),
  },
  {
    section: "B",
    questionNumber: "5(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "What functions does religion perform in a pluralistic society?",
    modelAnswer:
      "In a pluralistic society -- one composed of multiple religious, ethnic and cultural communities coexisting under a shared political framework -- religion performs functions that can be both integrative and, if mismanaged, divisive.\n\nIntegrative functions: (i) Social cohesion within communities -- Durkheim's classic function of religion binding individual members through shared rituals, symbols and collective effervescence, reinforcing group solidarity. (ii) Providing meaning, moral order and psychological comfort (Malinowski's anxiety-reduction function) amid life's uncertainties, shared across religious lines even if content differs. (iii) Facilitating interfaith dialogue and coexistence norms -- pluralistic societies often develop institutionalised interfaith mechanisms, shared civic festivals, and constitutional secularism (as in India) that allow religion to contribute to a shared moral and civic culture rather than only a sectarian one. (iv) Religious organisations frequently provide social welfare -- education, healthcare, charity -- extending benefits across community lines.\n\nPotential dysfunctions in a plural setting: religion can also become a marker of exclusive identity, mobilised for communal conflict, majoritarian assertion or minority marginalisation when politicised (communalism), meaning its integrative potential is conditional on how religious pluralism is institutionally managed (secular constitutional design, interfaith engagement) rather than an automatic outcome.\n\nA pluralistic society's stability therefore depends on religion's cohesive functions being channelled constructively rather than allowed to harden into communal division.",
    examinerNotes:
      "Durkheim (solidarity) and Malinowski (anxiety-reduction/psychological function) are the standard functionalist citations; a complete answer also flags religion's potential dysfunction (communalism) in plural settings, since the question's framing implicitly invites that balance.",
    sourceNote: SOURCE_B("5(c)"),
  },
  {
    section: "B",
    questionNumber: "5(d)",
    marks: 10,
    wordLimit: 150,
    questionText: "Analyze critically David Morgan's views on family practices.",
    modelAnswer:
      "David H.J. Morgan's 'family practices' approach (Family Connections, 1996) marks a significant shift in family sociology: away from treating 'the family' as a fixed structure or institution to be defined and classified, and toward understanding family as an ongoing set of activities and practices that people actively 'do'.\n\nCore argument: Morgan holds that family is constituted through everyday practices -- shared meals, caregiving, communication rituals, division of household labour -- rather than existing as a pre-given structure that simply houses these activities. This reframes family as fluid, actively constructed and continuously negotiated in daily life, rather than a static unit defined by co-residence or blood ties alone. It draws attention to the FLUIDITY of family boundaries (who counts as 'family' can be practice-based, e.g. close friends performing family-like caregiving) and to the everyday, mundane micro-interactions through which family meaning and solidarity are produced.\n\nCritical assessment: Morgan's approach is valued for capturing contemporary family diversity (single-parent, blended, chosen and transnational families) that rigid structural definitions exclude, and for foregrounding agency and lived experience. Critics, however, argue it can become so fluid and practice-focused that it under-theorises the enduring structural and material constraints (economic dependency, legal/inheritance rights, gendered power) that still shape family life independent of how family is 'practised' or perceived.\n\nMorgan's contribution therefore usefully complements, without fully replacing, structural analyses of family and kinship.",
    examinerNotes:
      "The question explicitly asks for a CRITICAL analysis -- an answer that only summarises Morgan's practice-approach without noting the structural-constraint critique (his relative neglect of material/legal power structures) misses half the expected content. This question connects directly to Q3(b) on changing kinship patterns.",
    sourceNote: SOURCE_B("5(d)"),
  },
  {
    section: "B",
    questionNumber: "5(e)",
    marks: 10,
    wordLimit: 150,
    questionText: "Does women's education help to eradicate patriarchal discriminations? Reflect with illustrations.",
    modelAnswer:
      "Women's education is widely regarded as a powerful, though not automatically sufficient, lever against patriarchal discrimination, operating through several mechanisms while facing real structural limits.\n\nHow it helps: education enhances women's economic independence and bargaining power within the household (reducing dependency-driven subordination), raises critical awareness of rights and legal protections (enabling resistance to discriminatory practices like dowry, child marriage, and domestic violence), delays age at marriage and reduces fertility (per India's NFHS data, showing consistent correlation between women's education and both outcomes), and improves political and civic participation. Educated women are also better positioned to transmit egalitarian values to the next generation, gradually shifting patriarchal norms across generations. India's rising female literacy and Kerala's comparatively high gender-development indicators are frequently cited illustrations of education's association with reduced patriarchal discrimination.\n\nLimits: education alone does not automatically dismantle patriarchy where deeply entrenched cultural norms, workplace discrimination, unequal inheritance practices, and persistent gender-based violence continue regardless of educational attainment -- educated women in India still face wage gaps, workplace glass ceilings, and dowry-related violence, showing structural and cultural change (legal enforcement, workplace reform, shifting social attitudes) must accompany education for full eradication.\n\nConclusion: education is a necessary enabling condition, but not a sufficient one, for dismantling patriarchal discrimination.",
    examinerNotes:
      "A strong answer resists an uncritically positive 'education solves everything' framing, citing the persistence of dowry, workplace discrimination or violence even among educated women as the necessary critical counterpoint. Kerala's gender-development indicators are a standard, expected Indian illustration.",
    sourceNote: SOURCE_B("5(e)"),
  },
  {
    section: "B",
    questionNumber: "6(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "What are the different dimensions of qualitative method? Do you think that qualitative method helps to gain a deeper sociological insight? Give reasons for your answer.",
    modelAnswer:
      "Introduction: Qualitative method encompasses a family of research approaches concerned with understanding meaning, experience and social process in depth, rather than measuring variables quantitatively -- rooted in the interpretive tradition of Weber's Verstehen and symbolic interactionism.\n\nDimensions of qualitative method: (i) Ethnography and participant observation -- immersive, long-term fieldwork within a social setting to understand practices and meanings from within (Malinowski, the Chicago School). (ii) In-depth/unstructured interviews -- eliciting rich, open-ended narrative accounts of experience, beyond fixed-response surveys. (iii) Case study method -- intensive examination of a single case (individual, community, institution) to generate contextual, holistic understanding. (iv) Content and discourse analysis -- interpretive analysis of texts, media and symbolic communication for underlying meanings and power relations. (v) Grounded theory -- building theory inductively from data rather than testing pre-existing hypotheses (Glaser and Strauss). (vi) Life-history and oral-history methods -- capturing biographical, subjective accounts of social change over time. (vii) Focus group discussions -- capturing group-level meaning-making and interaction.\n\nDoes it enable deeper insight? Yes, on several counts: qualitative method captures the subjective meanings actors themselves attach to their action (Verstehen), which quantitative variables cannot register; it allows discovery of unanticipated themes and complexity that fixed-response quantitative instruments, designed around pre-set categories, cannot capture; it is well-suited to studying processes, context and lived experience (how caste discrimination is actually experienced day-to-day, not just its statistical incidence); and it enables reflexive, iterative research design responsive to what emerges in the field.\n\nHowever, this depth comes with trade-offs: qualitative findings are typically not statistically generalisable to larger populations, are more vulnerable to researcher subjectivity and interpretive bias, and are harder to replicate or compare systematically across studies -- limitations quantitative method is comparatively better placed to address.\n\nConclusion: qualitative method offers genuinely deeper insight into meaning, process and lived experience than quantitative method can provide alone, but this depth is complementary to, rather than a full substitute for, the breadth, generalisability and comparability quantitative method offers -- most contemporary sociological research therefore favours mixed-methods designs combining both.",
    examinerNotes:
      "A complete answer lists multiple qualitative dimensions (ethnography, interviews, case study, grounded theory, discourse analysis) AND takes a reasoned position on the depth-of-insight question, ideally concluding with the mixed-methods complementarity point rather than treating qualitative and quantitative as simply competing.",
    sourceNote: SOURCE_B("6(a)"),
  },
  {
    section: "B",
    questionNumber: "6(b)",
    marks: 20,
    wordLimit: 350,
    questionText: "Explain Max Weber's theory of social stratification. How does Weber's idea of class differ from that of Marx?",
    modelAnswer:
      "Introduction: Max Weber offered a multidimensional theory of social stratification that both built on and significantly departed from Marx's purely economic, class-centred model, arguing that social inequality operates along three analytically distinct dimensions: class, status and party.\n\nWeber's three dimensions: (i) Class -- based on 'market situation', an individual's or group's economic position determined by their command over goods, skills and opportunities for income in the market (not merely ownership of the means of production as in Marx); Weber identified multiple class situations (property classes, commercial classes, social classes) rather than a simple two-class model. (ii) Status (Stand) -- based on social honour, prestige and lifestyle, often independent of economic class -- status groups share a common style of life, social esteem and social closure (e.g. a genteel but impoverished aristocrat may have high status but low class position; a nouveau-riche businessperson may have high class but lower status). (iii) Party -- based on organised power to achieve specific goals through collective action in the political sphere (political parties, pressure groups, unions), which can operate independently of both class and status.\n\nHow Weber's class differs from Marx's: Marx defined class in strictly economic, dichotomous, structural terms -- one's relationship to the means of production (owners/bourgeoisie versus non-owning wage-labourers/proletariat) -- with class consciousness and revolutionary conflict following inevitably from this objective structural position. Weber, by contrast: (a) sees class as market-situation based (life chances in exchange relations), producing a more fluid, multiple set of class positions rather than one binary division; (b) treats class as only ONE dimension of stratification among three (adding status and party), rejecting Marx's reduction of all inequality to economic class; (c) does not see class consciousness or political action as automatically following from shared class position -- status-group identity or party affiliation may cut across and override class interest, explaining, for Weber, why working-class revolution does not automatically occur even amid clear economic class division; (d) is more historically and comparatively cautious, resisting Marx's teleological prediction of inevitable revolutionary transformation.\n\nConclusion: Weber's stratification theory offers a richer, more empirically flexible account of social inequality that can explain phenomena (status-based discrimination, party-based power independent of class, caste-like status closure) that Marx's economically deterministic class model struggles to fully capture, while still retaining class/market position as one crucial axis of inequality.",
    examinerNotes:
      "The three-dimensional class/status/party framework must be explained fully, and the Weber-Marx comparison should explicitly address why Weber rejected automatic class-consciousness/revolution -- this is the crux of what distinguishes the two theories, not just 'Weber added more categories'.",
    sourceNote: SOURCE_B("6(b)"),
  },
  {
    section: "B",
    questionNumber: "6(c)",
    marks: 10,
    wordLimit: 150,
    questionText:
      "What are the ethical issues that a researcher faces in making use of participant observation as a method of collecting data? Explain.",
    modelAnswer:
      "Participant observation -- where the researcher joins and observes a social setting from within, sometimes over extended periods -- raises distinctive ethical issues beyond those of more detached methods.\n\nKey ethical issues: (i) Informed consent -- covert participant observation (where subjects are unaware they are being studied) denies participants the ability to consent, raising serious concerns about deception, though overt observation can alter natural behaviour (the observer effect), creating a genuine methodological-ethical tension. (ii) Privacy and confidentiality -- researchers gain access to intimate, sometimes sensitive information about participants' lives that must be protected in reporting, particularly where identifiable communities could face harm from exposure. (iii) Potential harm to subjects -- publishing findings (on stigmatised or vulnerable groups, illegal activities, marginalised communities) can expose participants to social, legal or reputational harm. (iv) Role conflict and over-rapport -- prolonged immersion can create personal loyalties or emotional entanglement ('going native') that compromise the researcher's ability to report objectively or that create obligations to participants which conflict with research goals. (v) Power imbalance -- researchers, especially from privileged academic positions, may exploit or misrepresent less powerful communities being studied. (vi) Exit and post-research obligations -- responsibly withdrawing from the field and manage ongoing relationships with participants after the study concludes.\n\nEthical guidelines (institutional review boards, informed consent protocols, anonymisation) attempt to manage these tensions, though covert observation remains a persistently contested case-by-case ethical judgment.",
    examinerNotes:
      "The covert-versus-overt observation dilemma (consent versus the observer effect) is the central ethical tension examiners expect to be explicitly named, alongside at least confidentiality/harm-to-subjects and the 'going native' over-rapport risk.",
    sourceNote: SOURCE_B("6(c)"),
  },
  {
    section: "B",
    questionNumber: "7(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "Explain how economic globalization has brought changes in the patterns of employment in the 21st century.",
    modelAnswer:
      "Introduction: Economic globalisation -- the intensified cross-border integration of trade, capital, production and labour markets since the late 20th century -- has fundamentally restructured employment patterns worldwide, with especially pronounced effects in the 21st century's digital and platform economy phase.\n\nKey changes: (i) Rise of flexible, informal and precarious employment -- the standard model of stable, long-term employment with a single employer has given way to short-term contracts, outsourcing, and the 'gig economy' (ride-hailing, delivery platforms), driven by firms' pursuit of labour-cost flexibility in globally competitive markets; sociologists describe this as growing employment 'precarity' (Guy Standing's 'precariat'). (ii) Global production chains and outsourcing -- manufacturing and increasingly service-sector jobs (call centres, IT/BPO, data processing) have relocated to lower-wage economies (India, China, Southeast Asia, the Philippines) enabled by digital connectivity, transforming employment geography and creating new middle-class service employment in the Global South while displacing manufacturing jobs in developed economies (deindustrialisation, 'rust belt' decline). (iii) Feminisation of certain labour markets -- globalisation has drawn large numbers of women into export-oriented manufacturing and service employment (garment factories, call centres), reshaping gender and employment relations, often on unequal and exploitative terms. (iv) Skill polarisation -- globalisation and associated automation have increased demand for highly skilled, technology-intensive labour while eroding routine, middle-skill jobs, contributing to widening wage inequality. (v) Platform/gig work and algorithmic management -- 21st-century digital platforms (Uber, Amazon, food-delivery apps) have created a new employment category blurring the line between employee and independent contractor, often without traditional labour protections (job security, benefits, collective bargaining). (vi) Migration-linked employment -- globalisation has intensified labour migration (both skilled and low-skilled) across borders, creating transnational labour markets and remittance economies, especially significant for countries like India and the Philippines.\n\nConclusion: economic globalisation has shifted employment from stable, protected, standardised jobs toward flexible, fragmented and often precarious forms of work, generating new opportunities in some regions and sectors while eroding traditional job security and labour protections in others -- a genuinely double-edged transformation that has become a central concern of contemporary economic sociology and labour studies.",
    examinerNotes:
      "Guy Standing's 'precariat' concept and the gig/platform economy are the specific contemporary anchors examiners expect for a 21st-century-focused question; balancing the answer with both Global North deindustrialisation and Global South service-sector growth shows a genuinely global, not one-sided, analysis.",
    sourceNote: SOURCE_B("7(a)"),
  },
  {
    section: "B",
    questionNumber: "7(b)",
    marks: 20,
    wordLimit: 350,
    questionText: "Do you think that the social media has brought significant changes in the forms of protest? Argue your case.",
    modelAnswer:
      "Introduction: Social media has substantially transformed the organisational forms, speed, scale and dynamics of contemporary protest movements, representing a genuine qualitative shift from pre-digital collective-action patterns, even as scholars debate the depth and durability of these changes.\n\nChanges social media has brought: (i) Rapid, decentralised mobilisation -- movements can organise and scale up protest actions within days or hours (Arab Spring, India's anti-CAA protests, farmers' protests) without the lengthy formal organisational infrastructure (party cadres, standing organisations) that earlier movements required, exemplifying what Manuel Castells calls 'networked social movements'. (ii) Leaderless/horizontal organisation -- many social-media-driven movements (Occupy Wall Street, India's 2011 anti-corruption movement) lack centralised leadership, instead coordinating through hashtags, viral content and peer-to-peer sharing, changing both movement structure and vulnerability to co-optation or repression of leaders. (iii) Global visibility and solidarity -- protests can attract instant international attention and cross-border solidarity (e.g. #MeToo, Black Lives Matter, farmers' protests), amplifying pressure on states beyond what purely local mobilisation could achieve. (iv) New repertoires of digital-physical hybrid action -- online petitions, hashtag campaigns, crowdfunding for protest logistics, and livestreaming of protest events (increasing accountability by making state repression visible in real time) supplement traditional physical assembly. (v) Counter-mobilisation and surveillance -- states and opponents also use social media for counter-narratives, disinformation and surveillance of activists, meaning the same tools that empower protest also enable more sophisticated repression and information warfare.\n\nCritical caveats: scholars (e.g. Zeynep Tufekci) note social-media-enabled movements can mobilise quickly but often struggle with the sustained organisational capacity, negotiation infrastructure and strategic coherence that slower, more traditionally organised movements built, making some digitally mobilised protests prone to rapid demobilisation ('adapt to scale quickly but may lack the stamina to sustain pressure').\n\nConclusion: social media has significantly changed the FORM (speed, scale, organisational structure, visibility) of protest, even if it has not necessarily improved every movement's ultimate strategic effectiveness or durability -- making the change real and substantial, but double-edged rather than uniformly positive.",
    examinerNotes:
      "Castells' 'networked social movements' and Tufekci's critique of digitally-enabled movements' organisational fragility are the specific theoretical citations that distinguish a strong answer; at least one Indian example (anti-CAA protests, farmers' protests, 2011 anti-corruption movement) is expected.",
    sourceNote: SOURCE_B("7(b)"),
  },
  {
    section: "B",
    questionNumber: "7(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Assess critically A.G. Frank's 'theory of development of underdevelopment'.",
    modelAnswer:
      "Andre Gunder Frank's 'development of underdevelopment' thesis (Capitalism and Underdevelopment in Latin America, 1967), a foundational statement of dependency theory, argues that Third World underdevelopment is not a natural, original condition to be overcome through modernisation, but is itself actively PRODUCED by the same historical process that developed the First World -- through colonial and neo-colonial extraction of surplus from periphery to metropole (core capitalist countries).\n\nCore argument: Frank models the world economy as a chain of metropolis-satellite relationships, where surplus generated in peripheral regions is systematically extracted and transferred to metropolitan centres, actively impoverishing and structurally distorting peripheral economies (mono-crop export dependency, weak industrial base) rather than merely leaving them 'behind'. This directly challenged modernisation theory's assumption that all countries pass through the same developmental stages (Rostow), arguing instead that development and underdevelopment are two sides of a single, unequal global capitalist process.\n\nCritical assessment: Frank's thesis powerfully highlighted the structural, historical roots of global inequality and colonial exploitation, influencing world-systems theory (Wallerstein). Critics, however, argue it is overly deterministic (understating internal/domestic causes of underdevelopment -- corruption, governance, internal class relations), empirically weak in explaining the East Asian 'tiger' economies' successful capitalist development despite peripheral origins, and offers limited practical policy guidance beyond calling for delinking from the world capitalist system, which few states have found viable.",
    examinerNotes:
      "The metropolis-satellite/surplus-extraction mechanism must be explained, and 'critically assess' requires the standard counter-evidence (East Asian NICs) and the internal-causes critique to be included, not just a description of Frank's thesis.",
    sourceNote: SOURCE_B("7(c)"),
  },
  {
    section: "B",
    questionNumber: "8(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "What is Taylorism? Analyze its merits and demerits.",
    modelAnswer:
      "Introduction: Taylorism, or 'scientific management', developed by Frederick Winslow Taylor (The Principles of Scientific Management, 1911), is a system of industrial work organisation that applies systematic, empirical analysis to maximise labour productivity and efficiency in factory production.\n\nCore principles: (i) Time-and-motion studies -- breaking down every task into its smallest constituent movements and scientifically timing the most efficient method of performing each. (ii) Standardisation -- prescribing the 'one best way' to perform each task, with detailed instructions replacing worker discretion and rule-of-thumb methods. (iii) Separation of conception from execution -- management (not workers) determines methods, planning and pace of work, reducing workers to executors of pre-designed tasks. (iv) Scientific selection and training -- matching workers to tasks based on measured aptitude, and training them precisely in the prescribed method. (v) Differential piece-rate pay -- financial incentives tied directly to output, intended to align worker motivation with productivity goals.\n\nMerits: Taylorism produced substantial, measurable productivity gains and became foundational to 20th-century mass production (most famously combined with Henry Ford's assembly line); it introduced systematic, evidence-based methods to industrial management, reducing arbitrary supervisory authority and waste; and its principles of process optimisation persist today in logistics, manufacturing and even algorithmically managed gig work.\n\nDemerits: heavily criticised for dehumanising labour -- reducing workers to interchangeable, deskilled components of a mechanical process, stripping away craft autonomy, creativity and job satisfaction (Harry Braverman's labour-process theory describes this as 'deskilling' and the 'degradation of work' under monopoly capitalism). It generates worker alienation (echoing Marx's alienation concept -- workers separated from control over the labour process itself), increases repetitive-strain physical and psychological stress, and its rigid standardisation can be poorly suited to complex, knowledge-based or creative work. It also concentrates power and knowledge with management, weakening worker bargaining position and contributing to labour unrest historically.\n\nConclusion: Taylorism achieved genuine efficiency gains that shaped modern industrial organisation, but at a significant human cost in worker autonomy, skill and job satisfaction -- a tension contemporary work-design theory (job enrichment, worker participation models) has sought to address without abandoning Taylorism's productivity insights altogether.",
    examinerNotes:
      "Braverman's deskilling/labour-process critique is the specific theoretical counterpoint examiners expect for the 'demerits' half; a full answer names Taylor's five core mechanisms (time-motion study, standardisation, separation of conception/execution, scientific selection, differential pay) rather than a vague description.",
    sourceNote: SOURCE_B("8(a)"),
  },
  {
    section: "B",
    questionNumber: "8(b)",
    marks: 20,
    wordLimit: 350,
    questionText: "What are new religious movements? Elaborate emphasizing their forms and orientations.",
    modelAnswer:
      "Introduction: New Religious Movements (NRMs) are religious, spiritual or quasi-religious groups that have emerged relatively recently (broadly, since the 19th-20th century, with a notable surge from the 1960s-70s counterculture era onward), typically outside or in tension with mainstream established religious traditions.\n\nDefining features: NRMs are usually founded by a charismatic leader (in the Weberian sense of charismatic authority), offer distinctive doctrines or syncretic blends of existing traditions, often demand high levels of member commitment, and frequently exist in some tension with wider society (varying from mild countercultural distinctiveness to significant social friction).\n\nForms of NRMs (Roy Wallis's influential typology, based on the movement's orientation to the wider world): (i) World-rejecting movements -- reject mainstream society's values as corrupt, demand total commitment and often communal living, drawing a sharp insider/outsider boundary (e.g. the Unification Church, some millenarian groups). (ii) World-affirming movements -- accept and work within mainstream society's goals (success, wellbeing, self-improvement) but offer techniques claimed to unlock hidden human potential (e.g. Transcendental Meditation, Scientology in its self-help dimension), often lacking strong congregational structure. (iii) World-accommodating movements -- focus on personal, inner religious experience and spiritual renewal without either rejecting or fully affirming secular society, often emerging as revivalist offshoots of established religions (neo-Pentecostalism).\n\nOther classificatory dimensions: syncretic NRMs blend elements from multiple traditions (New Age spirituality combining Eastern and Western elements); some are millenarian/apocalyptic, anticipating imminent transformative or catastrophic change; others centre on a single charismatic guru-figure (common in Indian-origin globalised movements like ISKCON).\n\nSociological significance: NRMs are often explained as responses to modernity's disenchantment (Weber), anomie and the perceived inadequacy of mainstream institutional religion to address contemporary spiritual, psychological or communal needs, flourishing especially where traditional religious authority has weakened and where individuals seek more experiential, customisable forms of meaning and belonging.\n\nConclusion: NRMs represent a diverse, actively evolving category best understood not as a single phenomenon but through Wallis's world-rejecting/affirming/accommodating typology, reflecting varied responses to the tensions and opportunities of religious life under modern, pluralistic conditions.",
    examinerNotes:
      "Roy Wallis's three-fold typology (world-rejecting/affirming/accommodating) is the specific theoretical framework examiners expect for 'forms and orientations' -- a purely descriptive list of NRM examples without this classificatory structure misses the analytical core of the question.",
    sourceNote: SOURCE_B("8(b)"),
  },
  {
    section: "B",
    questionNumber: "8(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Examine the role of science and technology in addressing age-old taboos and superstitions.",
    modelAnswer:
      "Science and technology have historically played, and continue to play, a significant role in eroding taboos and superstitions rooted in ignorance of natural causation, while their impact remains partial and unevenly distributed.\n\nMechanisms of change: (i) Medical science has directly challenged superstitions around illness, death and childbirth (e.g. attributing disease to spirits/witchcraft) by providing evidence-based germ theory, vaccination and reproductive health knowledge, reducing practices like witch-hunting historically linked to blaming individuals for unexplained illness or death. (ii) Meteorological and agricultural science have reduced superstitions tied to weather and crop failure (rain-rituals, sacrifice practices) by offering scientific explanation and forecasting. (iii) Mass media, internet access and digital literacy have accelerated the spread of scientific information, exposing superstitious claims (godmen, black magic) to public scrutiny and rationalist counter-movements (India's anti-superstition legislation in Maharashtra and Karnataka, and rationalist organisations, exemplify this). (iv) Education, particularly scientific literacy, cultivates a rational-empirical worldview that directly competes with supernatural explanation for everyday misfortune.\n\nLimits: technology diffusion is uneven (rural-urban, class, education gaps), and deeply embedded cultural/religious taboos (menstruation taboos, caste-linked purity-pollution beliefs) often persist even amid technological modernisation, since they are sustained by social and religious structures, not merely factual ignorance -- showing science alone is necessary but not sufficient to dislodge socially entrenched superstition.",
    examinerNotes:
      "A complete answer must include the limitation half -- persistence of purity-pollution and menstruation-linked taboos despite technological modernisation -- showing science's role is real but partial, since such taboos are socially/religiously sustained rather than purely factual misunderstanding.",
    sourceNote: SOURCE_B("8(c)"),
  },
];
