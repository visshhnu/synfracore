// KPSC KAS Mains GS-I -- PYQ + Model Answer data file. 12 of the 21 real
// questions from the actual KPSC KAS Mains 2021 GS-I paper -- a disclosed
// subset (not all 21), chosen to cover History, Sociology, and Karnataka/
// Indian Economy in reasonable proportion, matching the pacing precedent
// set for UPSC/CTET/TNPSC collections built earlier this session.
//
// SOURCING: primary verbatim source is EduRev's "KPSC KAS (Mains GS I):
// Previous Year Question Paper - 2021" page (fetched directly, full text
// reproduced, re-fetched a second time and matched word-for-word both
// times). Secondary corroboration is topic/existence-level, not a second
// full verbatim transcription: independent coaching sites (topperias.com's
// "KPSC Mains previous year questions GS1" discussion thread and
// karnataka.pscnotes.com's dedicated notes page) both independently
// reference these same topics as real 2021 KAS Mains GS-I content. This is
// weaker than the two-independent-verbatim-source bar used for UPSC Mains
// 2026 (where two full transcriptions matched word-for-word) -- disclosed
// honestly here rather than overstating the verification as equivalent.
import { readFileSync } from "node:fs";

const PRIMARY = "EduRev, \"KPSC KAS (Mains GS I): Previous Year Question Paper - 2021\" (edurev.in/p/383653) -- verbatim source, fetched and re-confirmed word-for-word on a second fetch.";
const SECONDARY = "Topic/existence independently corroborated (not a second verbatim transcription) by topperias.com's \"KPSC Mains previous year questions GS1\" discussion thread and karnataka.pscnotes.com's dedicated notes page.";
const SOURCE = (n) => `KPSC KAS Mains 2021, GS Paper I, Q${n}. ${PRIMARY} ${SECONDARY}`;

export const COLLECTION = {
  slug: "kpsc-kas-mains-gs1-2021-pyq",
  subject: "kpsc",
  title: "KPSC KAS Mains GS-I — PYQ & Model Answers (2021)",
  examPaper: "gs1",
  year: 2021,
  questionCount: 12,
  sortOrder: 1,
};

export const QUESTIONS = [
  {
    section: "History",
    questionNumber: "1",
    marks: 10,
    wordLimit: 150,
    questionText: "Explain Ashoka's concept of Dhamma.",
    modelAnswer:
      "Ashoka's Dhamma, propagated through his Major and Minor Rock and Pillar Edicts after the Kalinga war (c. 261 BCE), was not a new religion but a code of ethical and social conduct meant to bind a religiously and culturally diverse empire together.\n\nIts core elements included: respect for parents, elders, and teachers; kindness to servants, slaves, and animals (non-violence, ahimsa); truthfulness and self-control; generosity toward Brahmins, ascetics, and the poor; and religious tolerance -- explicit instructions against condemning other sects, since \"he who does so hurts his own sect most of all.\" Ashoka institutionalized Dhamma through Dhamma Mahamattas (officers appointed to spread and monitor ethical conduct), public works (wells, rest-houses, medical care for humans and animals along roads), and edicts inscribed in local scripts and languages so ordinary subjects, not just elites, could access them.\n\nDhamma's purpose was administrative and moral at once: it gave Ashoka's vast, diverse empire a shared ethical framework without imposing Buddhism as state religion, distinguishing it clearly from a purely religious conversion project.",
    examinerNotes: "Strong answers distinguish Dhamma from Buddhism explicitly and cite concrete edict content (Kalinga remorse, tolerance clause, welfare measures) rather than a vague 'code of ethics' description.",
    sourceNote: SOURCE(1),
  },
  {
    section: "History",
    questionNumber: "2",
    marks: 10,
    wordLimit: 150,
    questionText: "Discuss about the British Land Revenue System in Bengal.",
    modelAnswer:
      "The Permanent Settlement (1793), introduced by Lord Cornwallis in Bengal, Bihar, and Odisha, converted zamindars from Mughal-era revenue collectors into hereditary private landowners, fixing the revenue they owed the Company permanently regardless of actual harvest or land productivity.\n\nIts stated aim was to guarantee a stable, predictable Company income and encourage zamindars to invest in improving land (on the English landlord model). In practice, the fixed demand was set deliberately high, and the Sunset Law -- auctioning off any zamindari that defaulted by sunset on the due date -- caused mass transfers of land from old zamindar families to new revenue speculators and moneylenders, while actual cultivators (ryots) gained no security of tenure and bore rack-renting.\n\nThe system's failure to raise agricultural productivity (since revenue was fixed regardless of improvement, removing any Company incentive to invest in land) later pushed colonial administrators toward alternative systems elsewhere -- the Ryotwari system (Madras, Bombay) settling revenue directly with cultivators, and the Mahalwari system (North-Western Provinces, Punjab) settling with village communities -- both explicit departures from Permanent Settlement's zamindar-intermediary model.",
    examinerNotes: "Reward answers naming all three systems (Permanent/Ryotwari/Mahalwari) and explaining why Bengal's specific failure mode (no productivity incentive, Sunset Law dispossession) drove the later alternatives.",
    sourceNote: SOURCE(2),
  },
  {
    section: "History",
    questionNumber: "3",
    marks: 10,
    wordLimit: 150,
    questionText: "\"Raja Ram Mohan Roy inaugurated the modern age of Indian history.\" Discuss.",
    modelAnswer:
      "Raja Ram Mohan Roy (1772-1833) is widely credited as the \"Father of Modern India\" because he was the first major Indian reformer to apply rational, comparative critique -- rather than pure tradition or pure imitation of the West -- to Indian social and religious practice.\n\nHis concrete contributions: founding the Brahmo Samaj (1828), which rejected idol worship and caste in favour of monotheism drawn from Vedantic reinterpretation; his sustained campaign against Sati, using both scriptural argument (showing it lacked genuine Vedic sanction) and public advocacy, directly contributing to Governor-General Bentinck's Sati Abolition Act, 1829; and his advocacy for English and Western scientific education (his 1823 letter to Governor-General Amherst opposing a Sanskrit-only college, favouring modern science instead) alongside his own mastery of Sanskrit, Persian, Arabic, and English scripture.\n\nWhat makes this \"inaugurating the modern age\" rather than simple reform is his method: using reason and textual scholarship together to challenge orthodoxy from within Indian tradition, rather than rejecting Indian civilization wholesale or accepting British rule uncritically -- a synthesis that shaped virtually every reform movement (Arya Samaj, Prarthana Samaj, later Congress moderates) that followed him.",
    examinerNotes: "Strong answers explain HOW he inaugurated modernity (rational-textual method) rather than only listing his achievements as a bare list.",
    sourceNote: SOURCE(3),
  },
  {
    section: "History",
    questionNumber: "7",
    marks: 15,
    wordLimit: 250,
    questionText: "\"The part played by Karnataka in the 'Quit India Movement' was unique.\" Comment.",
    modelAnswer:
      "Karnataka's participation in the Quit India Movement (August 1942), particularly in the Bombay-Karnataka region (Dharwad and Belagavi districts), is considered unique for both its methods and scale relative to many other regions.\n\nIts distinctiveness lay first in what came to be called the \"Karnataka method\": alongside educated youth-led protest, ordinary peasants organized sustained, coordinated night-time subversive action -- cutting telegraph wires, damaging railway lines, and burning revenue records at village offices -- representing a genuinely grassroots, rural insurgency rather than an urban-elite-led agitation alone. Second, its scale was disproportionately large: parallel/underground governments briefly functioned in parts of Dharwad and Belagavi districts, government buildings and post offices were widely attacked, and by contemporary estimates over 15,000 people were jailed and more than 30 killed in police firing in Karnataka during 1942-43 -- a scale of repression and resistance comparable to the movement's most intense centres elsewhere in India (Bihar, Midnapore in Bengal).\n\nThird, the movement in Karnataka drew together diverse social bases -- students, peasants, and local Congress cadres -- in coordinated action, rather than remaining confined to one class or urban centre, which is what historians typically point to when calling Karnataka's Quit India experience structurally distinct from, say, a purely urban strike-and-protest pattern seen in some other provinces.",
    examinerNotes: "Reward answers naming the specific \"Karnataka method\" term and citing concrete scale indicators (parallel government, arrest/casualty figures) rather than a generic \"Karnataka also participated\" account.",
    sourceNote: SOURCE(7),
  },
  {
    section: "Sociology",
    questionNumber: "8",
    marks: 10,
    wordLimit: 150,
    questionText: "Discuss the deterministic theory of social change.",
    modelAnswer:
      "The deterministic theory of social change holds that social change is not driven primarily by human will, reason, or deliberate planning, but by specific underlying forces -- material, economic, technological, or environmental -- that operate largely independent of individual intention.\n\nIts most influential variant is Marx's historical materialism: the economic base (mode and relations of production) determines the social \"superstructure\" of politics, law, culture, and ideology, so that fundamental social change follows from changes in productive forces and relations (e.g., feudalism giving way to capitalism as productive forces outgrow feudal relations) rather than from ideas changing first. Sumner and Keller offered a related economic-determinist view, arguing conscious/rational planning has little power to effect change unless underlying \"folkways and mores\" (themselves shaped by material conditions) are already ready for it. Technological determinism (Ogburn's \"cultural lag\" thesis) is a related strand, holding that material/technological change runs ahead of non-material culture (norms, laws), which lags in adapting.\n\nThe theory's key criticism is that it understates human agency and the independent causal power of ideas (Weber's Protestant Ethic thesis is the classic counter-example) -- most sociologists today treat deterministic and idealist/agency-based explanations as complementary rather than treating either as a complete account alone.",
    examinerNotes: "Strong answers name at least two named theorists/variants (Marx, Sumner-Keller, or Ogburn) rather than describing 'determinism' only in the abstract, and note the standard Weberian counter-critique.",
    sourceNote: SOURCE(8),
  },
  {
    section: "Sociology",
    questionNumber: "10",
    marks: 10,
    wordLimit: 150,
    questionText: "Explain the concept of Sanskritization.",
    modelAnswer:
      "Sanskritization, a term coined by M.N. Srinivas from his fieldwork among the Coorgs of Karnataka, describes the process by which a lower or middle Hindu caste, or a tribal/other group, adopts the customs, rituals, ideology, and lifestyle of a higher, typically \"twice-born\" caste, in an attempt to claim higher status in the local caste hierarchy over a generation or more.\n\nTypical markers of Sanskritization include adopting vegetarianism and teetotalism, performing Sanskritic (rather than local/folk) rituals, emulating upper-caste dress, marriage, and inheritance customs, and sometimes claiming a new, higher-status caste origin myth. Srinivas emphasized that the \"model\" being emulated need not always be Brahmin specifically -- it could be the dominant caste of a given region (which may be Kshatriya or even a locally dominant \"middle\" caste), making Sanskritization a locally variable rather than uniformly Brahmin-centric process.\n\nIts significance is that it demonstrates real, if limited, mobility within a hierarchical caste framework without challenging the framework itself -- a group rises in ritual status while the overall varna/caste structure remains intact -- which is precisely why later critics (including Srinivas himself, in revisiting the concept) noted its limits as a route to genuine structural or economic equality compared to constitutional/legal mechanisms like reservation.",
    examinerNotes: "Reward answers that correctly attribute the term to Srinivas's Coorg study and note that the reference group need not always be Brahmin -- a common error is treating it as synonymous with 'Brahminization'.",
    sourceNote: SOURCE(10),
  },
  {
    section: "Sociology",
    questionNumber: "11",
    marks: 10,
    wordLimit: 150,
    questionText: "Discuss the factors that are responsible for changing status of women.",
    modelAnswer:
      "The status of women in India has changed due to a combination of legal-constitutional, educational, economic, and social-movement factors operating together over the past century.\n\nLegal and constitutional factors include Article 14/15 (equality and non-discrimination), reformist legislation from the colonial period onward (Sati Abolition 1829, Widow Remarriage Act 1856) through independent India's Hindu Code Bills (1955-56, granting women rights to property, divorce, and adoption), the 73rd/74th Amendments reserving one-third (now often 50%) of local-body seats for women, and more recent laws (Domestic Violence Act 2005, POSH Act 2013). Educational expansion -- rising female literacy and higher-education enrolment -- has independently driven change by enabling economic participation and delaying age at marriage. Economic factors include growing female workforce participation, especially in urban service-sector and government jobs, giving many women independent income and bargaining power within the household. Social-movement factors include sustained feminist and women's-rights advocacy (from early reformers through the post-1970s women's movement) that kept issues like dowry, domestic violence, and workplace harassment on the public agenda.\n\nDespite this, change remains uneven -- rural-urban and caste-class gaps in female literacy, workforce participation, and safety persist, meaning legal change has outpaced actual social transformation in many regions.",
    examinerNotes: "Strong answers organize factors by category (legal/educational/economic/movement) rather than a flat list, and note the real gap between legal change and lived social change.",
    sourceNote: SOURCE(11),
  },
  {
    section: "Sociology",
    questionNumber: "14",
    marks: 15,
    wordLimit: 250,
    questionText: "What is modernization? Explain the factors that are responsible for the process of modernization.",
    modelAnswer:
      "Modernization is the process by which a traditional society transforms toward the social, economic, political, and cultural patterns characteristic of industrialized societies -- typically marked by rationalization of thought and institutions, structural differentiation (specialized institutions replacing multi-functional traditional ones), and a shift from ascribed to achieved status as the basis of social position.\n\nKey factors driving modernization include: industrialization and technological change, which restructure occupation and settlement patterns (urbanization) and create new economic roles not bound by traditional caste/kinship rules; education, which spreads rational-scientific thinking and exposes populations to new ideas and reference groups beyond the local community; urbanization itself, which weakens joint-family and caste-based social control by placing people in anonymous, occupationally diverse settings; mass media and communication, which accelerate the spread of new values, aspirations, and information across previously isolated communities; and state policy and legal-constitutional change (universal franchise, planned development, legal abolition of untouchability), which formally reorganizes social and political participation on modern, not traditional, lines.\n\nIndian sociologists (notably Yogendra Singh) caution against treating modernization as simple Westernization -- Indian modernization has often proceeded through, rather than by replacing, traditional structures (e.g., caste associations adapting to electoral politics), producing a distinctly Indian pattern rather than a straightforward convergence toward a Western template.",
    examinerNotes: "Reward answers that explicitly distinguish modernization from Westernization (citing Yogendra Singh or an equivalent Indian-context caveat) rather than treating the two as synonymous.",
    sourceNote: SOURCE(14),
  },
  {
    section: "Economy",
    questionNumber: "15",
    marks: 10,
    wordLimit: 150,
    questionText: "How can the Digital India Programme help farmers to improve farm productivity and income? What are the steps taken by the government in this regard?",
    modelAnswer:
      "Digital India can improve farm productivity and income by closing the information and market-access gaps that traditionally left farmers dependent on local intermediaries for price and technical information.\n\nConcrete channels include: real-time market-price transparency through e-NAM (electronic National Agriculture Market), letting farmers compare mandi prices across states rather than accepting whatever a local trader offers; weather and crop-advisory apps (e.g., Kisan Suvidha, mKisan SMS advisories) enabling timely sowing, irrigation, and pest-management decisions; direct benefit transfer of subsidies and schemes (PM-KISAN) straight to farmer bank accounts, cutting leakage; and soil-health-card digitization, guiding fertilizer use to actual soil needs rather than generic over-application.\n\nGovernment steps specifically taken include the rollout of e-NAM across mandis nationwide, the Digital Agriculture Mission (building farmer databases and digital public infrastructure for agriculture, \"AgriStack\"), expansion of Common Service Centres in rural areas providing digital access points where individual smartphone/internet access is limited, and integration of Aadhaar-linked DBT for scheme payments. The persistent constraint remains uneven rural internet penetration and digital literacy, meaning digital tools' actual reach still significantly trails their designed potential.",
    examinerNotes: "Strong answers name specific programmes (e-NAM, PM-KISAN, AgriStack/Digital Agriculture Mission) rather than describing 'digital farming' only in generic terms, and note the digital-divide constraint.",
    sourceNote: SOURCE(15),
  },
  {
    section: "Economy",
    questionNumber: "17",
    marks: 10,
    wordLimit: 150,
    questionText: "Explain the defects of Agriculture market in Karnataka.",
    modelAnswer:
      "Karnataka's agricultural marketing system, structured mainly around APMC (Agricultural Produce Market Committee) mandis, suffers from several longstanding structural defects common across most Indian states, with some Karnataka-specific texture.\n\nFirst, market fragmentation and cartelization: a limited number of licensed traders/commission agents at each mandi often function as an informal cartel, suppressing the price competition the mandi system was meant to create. Second, high market fees and commission charges (market cess, commission agent fees) reduce the farmer's net realization even when the gross mandi price looks reasonable. Third, inadequate market infrastructure -- insufficient cold storage and warehousing capacity relative to perishable output (Karnataka is a major horticulture producer), forcing distress sales immediately after harvest when prices are lowest. Fourth, weak price information flow to farmers at the village level, despite e-NAM's rollout, leaving many smallholders still reliant on local traders for price discovery. Fifth, restrictive mandi-boundary rules historically limited farmers to selling within their notified market area, restricting their ability to seek better prices elsewhere (progressively eased through APMC Act amendments and e-NAM inter-mandi trading).\n\nReforms attempted include Karnataka's early and relatively extensive e-NAM integration and unified market licensing, though cartelization and post-harvest storage gaps remain the most persistent unresolved defects.",
    examinerNotes: "Reward answers naming specific defects (cartelization, storage gaps, mandi-fee burden) with Karnataka-specific texture (horticulture perishability, early e-NAM adoption) rather than a generic pan-India APMC critique.",
    sourceNote: SOURCE(17),
  },
  {
    section: "Economy",
    questionNumber: "19",
    marks: 15,
    wordLimit: 250,
    questionText: "\"The Nature of economic growth in India in recent times is often described as 'Jobless growth.'\" Do you agree with the view? Give arguments in favour of your answer.",
    modelAnswer:
      "\"Jobless growth\" describes a pattern where GDP expands at a healthy rate without a proportionate expansion in formal employment -- a pattern several economists argue has characterized much of India's post-liberalization growth, particularly its most capital-intensive and services-led phases.\n\nArguments supporting the view: growth has been concentrated in capital-intensive and skill-intensive sectors (IT services, finance, select manufacturing with high automation) that generate high value-add per worker but comparatively few jobs relative to their output share; organized manufacturing's share of total employment has grown far more slowly than its share of output, reflecting rising capital intensity rather than labour absorption; and periodic government employment survey data (PLFS) have shown periods of rising or stagnant unemployment/underemployment alongside continued GDP growth, plus a large share of employment remaining informal, self-employed, or in low-productivity agriculture -- i.e., growth without a matching shift of workers into higher-productivity formal jobs.\n\nCounter-arguments/nuance worth including: growth has not been literally jobless -- employment has grown in absolute terms in several periods, particularly in construction and low-end services -- but has been \"job-poor\" relative to the growth rate, and quality/formality of jobs created (informal, low-wage, gig-economy work) is arguably the sharper problem than a literal absence of job creation.\n\nOn balance, \"jobless growth\" is a reasonable characterization of the employment-elasticity mismatch, though \"job-poor\" or \"low-quality-job growth\" is the more analytically precise framing than a literal absence of jobs.",
    examinerNotes: "Strong answers take a reasoned position rather than a flat yes/no, distinguish 'jobless' from 'job-poor/low-quality', and cite the employment-elasticity-of-growth concept even informally.",
    sourceNote: SOURCE(19),
  },
  {
    section: "Economy",
    questionNumber: "21",
    marks: 15,
    wordLimit: 250,
    questionText: "\"Green Revolution was aimed to achieve self-reliance in food production.\" Analyze.",
    modelAnswer:
      "The Green Revolution (from the mid-1960s), centred on high-yielding variety (HYV) seeds of wheat and rice, chemical fertilizers, assured irrigation, and pesticides, was explicitly aimed at ending India's dependence on food imports (notably US PL-480 wheat aid) after the mid-1960s food crisis, and it substantially succeeded on its own core terms.\n\nEvidence of success: India moved from a food-deficit, import-dependent country to near self-sufficiency in foodgrains by the 1970s-80s, with wheat production in particular rising dramatically in Punjab, Haryana, and western Uttar Pradesh; buffer-stock policy (via the Food Corporation of India and minimum support prices) institutionalized this self-reliance by guaranteeing procurement and storage capacity for surplus years.\n\nIts limits, however, complicate a simple \"achieved self-reliance\" verdict: the Revolution was geographically and crop-concentrated (wheat/rice in irrigated northwestern states), leaving rain-fed regions and non-cereal crops (pulses, oilseeds) comparatively neglected -- India remained import-dependent on pulses and edible oils for decades after achieving cereal self-sufficiency. It also generated serious environmental costs (groundwater depletion in Punjab/Haryana, soil degradation from monocropping and fertilizer overuse) and regional/class inequality (larger, irrigation-access farmers benefited disproportionately over smallholders and rain-fed-region farmers).\n\nOn balance: the Green Revolution did achieve its narrower, explicit goal of cereal self-reliance, but at the cost of a narrower crop-and-region focus whose environmental and distributional consequences are still being managed today.",
    examinerNotes: "Reward answers that separate the narrow goal (cereal self-sufficiency, achieved) from the broader claim (full agricultural self-reliance, not fully achieved) rather than treating the Revolution as an unqualified success or failure.",
    sourceNote: SOURCE(21),
  },
];
