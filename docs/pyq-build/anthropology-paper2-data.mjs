// UPSC Civil Services Mains Anthropology Optional Paper II -- PYQ + Model
// Answer data file. All 16 questions below are real questions from the 2023
// UPSC CSE Mains Anthropology Optional Paper II (exam held 24 September 2023).
//
// Sourcing method (deliberately weaker tier than Paper I -- disclosed
// honestly): no independent scanned-official-PDF mirror of Paper II could be
// located this session (unlike Paper I, for which a pwonlyias-hosted PDF
// reproduction of the actual printed paper was found and extracted directly
// via pdftotext). Instead, the question text used here was extracted from a
// PDF hosted by Vishnu IAS Academy ("UPSC-ANTHROPOLOGY-2023-PAPER-2-MODEL-
// ANSWERS.pdf", vishnuias.com/wp-content/uploads/2023/09/) via pdftotext,
// which reproduces each question's exact number, wording and marks
// immediately before its own (separately-authored, NOT used here) attempted
// model answer. That question text was cross-checked word-for-word against
// TWO independent sources: Edukemy's full question-paper transcription
// (edukemy.com/blog/upsc-mains-2023-anthropology-optional-previous-year-paper/),
// which matched every question number, wording and marks value exactly, and
// Anthroholic's bilingual (Hindi/English) reproduction of the Section A/B
// Q1/Q5 note-writing questions (anthroholic.com/anthropology-optional-
// question-papers-for-upsc-ias), which matched on the sub-parts it covered.
// This is a multi-source text-cross-corroboration tier, not a
// verified-against-a-scanned-official-paper tier -- reported honestly here
// as distinct from Paper I's stronger sourcing. IMPORTANT: the Vishnu IAS
// PDF's own model answers were NOT used or relied upon anywhere in this file
// -- they contain clearly unreliable, unverifiable and in places fabricated
// content (e.g. citing "Kongka La village...UFO sightings" as an example
// under "village as little republic," and irrelevant boilerplate bleeding
// between answers) and were used only to locate and extract the real
// question text, exactly as a raw source document, never as content.
// All model answers, examiner notes and analysis in this file are original.
//
// All 16 questions on the real paper are text-based (no image, map, or
// artifact-identification diagram question), so all 16 are included -- no
// exclusions were required for this paper.
//
// Word-limit note: as with Paper I, Q1 and Q5 (10 marks per sub-part) carry
// UPSC's standard "about 150 words each" instruction (confirmed by
// Anthroholic's bilingual excerpt, matching Paper I's identical phrasing and
// marks structure). Q2-4/Q6-8 follow the identical 20/15/15 marks-per-
// question pattern as Paper I, so this file applies the same UPSC general
// convention (approx. 350 words for 20 marks, approx. 250 words for 15
// marks) used throughout Paper I and the already-published Public
// Administration Paper I file.

const SOURCE_A = (q) =>
  `UPSC CSE Mains 2023, Anthropology Optional Paper II, Section A, Q${q}. Question text extracted via pdftotext from a PDF hosted by Vishnu IAS Academy (vishnuias.com/wp-content/uploads/2023/09/UPSC-ANTHROPOLOGY-2023-PAPER-2-MODEL-ANSWERS.pdf), cross-checked word-for-word against Edukemy's independent full question-paper transcription (edukemy.com) and, for note-writing sub-parts, Anthroholic's bilingual reproduction (anthroholic.com). No independent scanned-official-PDF mirror of Paper II was located this session (contrast Paper I's stronger sourcing tier); this file's own model answer, examiner notes and analysis are original and do not rely on the Vishnu IAS source's own (unreliable) model answers.`;

const SOURCE_B = (q) =>
  `UPSC CSE Mains 2023, Anthropology Optional Paper II, Section B, Q${q}. Question text extracted via pdftotext from a PDF hosted by Vishnu IAS Academy (vishnuias.com/wp-content/uploads/2023/09/UPSC-ANTHROPOLOGY-2023-PAPER-2-MODEL-ANSWERS.pdf), cross-checked word-for-word against Edukemy's independent full question-paper transcription (edukemy.com) and, for note-writing sub-parts, Anthroholic's bilingual reproduction (anthroholic.com). No independent scanned-official-PDF mirror of Paper II was located this session (contrast Paper I's stronger sourcing tier); this file's own model answer, examiner notes and analysis are original and do not rely on the Vishnu IAS source's own (unreliable) model answers.`;

export const COLLECTION = {
  slug: "upsc-anthropology-optional-paper-2-pyq",
  subject: "anthropology",
  title: "UPSC Anthropology Optional Paper II — PYQ & Model Answers (2023)",
  examPaper: "paper-2",
  year: 2023,
  questionCount: 28,
  sortOrder: 2,
};

export const QUESTIONS = [
  // ---------------- SECTION A ----------------
  {
    section: "A",
    questionNumber: "1(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Material culture and archaeology",
    modelAnswer:
      "Material culture -- the tangible objects a society produces and uses (tools, pottery, dwellings, ornaments, monuments) -- is archaeology's primary evidentiary base, since past societies without written records can be reconstructed almost entirely from what they made, used and discarded.\n\nInterdependence: archaeology supplies the excavation, stratigraphic dating and typological method needed to sequence and contextualize material remains, while material culture supplies the actual data (technology, subsistence, exchange, ritual) that archaeological interpretation works on. V. Gordon Childe's culture-historical approach treated recurring assemblages of material traits as markers of distinct 'archaeological cultures' (e.g., Harappan pottery/seal assemblages); processual archaeology (Lewis Binford) instead reads material culture as evidence of past behavioural systems and adaptation, not just chronological markers.\n\nIndian illustration: Harappan seals, weights and standardized brick sizes reveal administrative and craft organization; megalithic burial goods in peninsular India reveal Iron Age social ranking. Together, material culture and archaeology form a mutually constitutive method for reconstructing prehistoric and historic human life.",
    examinerNotes:
      "Naming both a culture-historical (Childe) and processual (Binford) framing of how material culture is interpreted, plus one concrete Indian example, distinguishes a complete answer from a bare definition.",
    sourceNote: SOURCE_A("1(a)"),
  },
  {
    section: "A",
    questionNumber: "1(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Interface between Purushartha and Ashrama",
    modelAnswer:
      "Purushartha (the four aims of human life -- Dharma, Artha, Kama, Moksha) and Ashrama (the four life-stages -- Brahmacharya, Grihastha, Vanaprastha, Sannyasa) together constitute classical Hindu social philosophy's integrated life-course model, in which each stage is normatively oriented toward a corresponding weighting of the four aims.\n\nInterface: the Brahmacharya (celibate student) stage emphasizes Dharma -- acquiring knowledge and disciplined conduct; Grihastha (householder) emphasizes Artha and Kama -- earning livelihood, raising family, within dharmic bounds, and is considered the stage that sustains the other three (since householders support students, ascetics and renunciants); Vanaprastha (forest-dweller/retiree) marks gradual detachment, transitioning toward Moksha; Sannyasa (renunciant) is wholly oriented to Moksha, having relinquished Artha and Kama entirely.\n\nSignificance: this interface reflects a structured life-course theory balancing material and spiritual pursuits sequentially rather than simultaneously, providing an indigenous Indological framework for understanding social role-transition, obligation and the relationship between individual life-stage and collective social reproduction -- though in practice, especially in modern urban India, the Ashrama-Purushartha sequence is followed only loosely, if at all.",
    examinerNotes:
      "The answer should map each Ashrama stage explicitly onto its corresponding dominant Purushartha(s) rather than describing the two schemes side by side without linking them -- that mapping is the actual 'interface' being asked for.",
    sourceNote: SOURCE_A("1(b)"),
  },
  {
    section: "A",
    questionNumber: "1(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Jajmani system: continuity and change",
    modelAnswer:
      "The jajmani system is a traditional rural Indian institution of hereditary, reciprocal exchange between landowning patron castes (jajmans) and service/artisan castes (kamins/praja) -- barbers, potters, carpenters, washermen -- who provide fixed goods/services in exchange for a customary share of the harvest or fixed payment, embedded in caste hierarchy and studied extensively by William Wiser (who coined the term) and later critically examined by scholars like T.S. Epstein and Pauline Kolenda.\n\nContinuity: in remote/rural areas the system persists in modified form, still regulating some caste-based service obligations and reinforcing village-level economic interdependence and ritual status hierarchy.\n\nChange: the system has substantially eroded due to land reforms altering landholding patterns, growth of a cash/market economy replacing produce-based payment, rural-to-urban migration providing kamins alternative livelihoods, spread of education reducing willingness to perform hereditary occupational roles, and Green Revolution-driven agricultural commercialization. Scholars increasingly note the jajmani system today survives more as diluted, negotiable, semi-monetized arrangements than the rigid hereditary system Wiser originally described, reflecting broader detribalization/de-agrarianization of the rural caste economy.",
    examinerNotes:
      "Naming Wiser as originator and citing land reform/monetization/education as the concrete drivers of change (not a vague 'modernization has changed it' statement) is the expected substantiation.",
    sourceNote: SOURCE_A("1(c)"),
  },
  {
    section: "A",
    questionNumber: "1(d)",
    marks: 10,
    wordLimit: 150,
    questionText: "Prehistoric rock arts from Uttarakhand",
    modelAnswer:
      "Uttarakhand's Kumaon and Garhwal regions preserve significant prehistoric rock-art sites, most notably Lakhudiyar (near Almora), along with sites like Petshal and Futsil Rong, generally dated across a broad span from Mesolithic through later prehistoric/protohistoric periods based on comparative stylistic and superimposition analysis.\n\nFeatures: paintings executed in ochre/red, white and occasionally black pigment on rock-shelter surfaces, depicting human figures (often in dancing or group postures), animals (deer, elephants), geometric motifs (dots, wavy lines, comb-like patterns), and handprints -- Lakhudiyar's imagery includes distinctive tailed anthropomorphic figures interpreted by some scholars as ritual/shamanic representations.\n\nSignificance: these paintings provide rare direct evidence of prehistoric symbolic behaviour, social organization (group dance/ritual scenes) and human-animal relations in the Himalayan foothills, complementing lithic evidence from the region; superimposed layers of different artistic styles at some sites suggest successive occupation phases across different prehistoric periods. They remain understudied and inadequately protected relative to better-known central Indian rock-art complexes like Bhimbetka, making their systematic documentation and conservation an ongoing concern for Indian prehistoric archaeology.",
    examinerNotes:
      "Lakhudiyar should be named specifically as the flagship site; noting the tailed/anthropomorphic dancing-figure motif and comparing (even briefly) to Bhimbetka situates Uttarakhand's rock art within the broader Indian prehistoric-art record expected of a complete answer.",
    sourceNote: SOURCE_A("1(d)"),
  },
  {
    section: "A",
    questionNumber: "1(e)",
    marks: 10,
    wordLimit: 150,
    questionText: "Religious pluralism and social solidarity",
    modelAnswer:
      "Religious pluralism -- the coexistence and mutual recognition of multiple religious traditions within a society, without one imposing dominance -- has an ambivalent relationship with social solidarity (Durkheim's shared collective conscience binding a society together).\n\nSupportive relationship: pluralism can enhance solidarity at the level of the wider (national/civic) society by fostering a shared ethic of tolerance, secular constitutional values, and cross-cutting interactions (interfaith festivals, shared civic spaces) that bind diverse religious communities into a common political community -- India's constitutional secularism and syncretic traditions (Sufi-Bhakti movements, shared shrines venerated across faiths) illustrate pluralism actively generating cross-community solidarity.\n\nTension with solidarity: Durkheim's classical model presupposed a single shared conscience collective for solidarity; genuine pluralism can also produce parallel, insulated religious solidarities (strong bonding within each community) rather than a single integrated bridging solidarity, and can be exploited for communal polarization and conflict where pluralism is managed poorly (communal riots, contested religious sites).\n\nConclusion: religious pluralism strengthens social solidarity only when institutionally managed through genuine tolerance, legal even-handedness and cross-community engagement -- absent that, plural religious identities can as easily fragment solidarity as reinforce it.",
    examinerNotes:
      "The answer should explicitly engage both directions of the relationship (pluralism can build bridging solidarity via tolerance/shared civic life, but can also entrench separate bonding solidarities or fuel conflict) rather than assuming pluralism straightforwardly produces harmony.",
    sourceNote: SOURCE_A("1(e)"),
  },
  {
    section: "A",
    questionNumber: "2(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "\"Tribes are backward Hindus.\" Critically comment with reference to the contributions of G.S. Ghurye.",
    modelAnswer:
      "Introduction: G.S. Ghurye, a foundational figure of Indian sociology/social anthropology, controversially argued in The Aborigines -- So-Called -- and Their Future (1943) that India's tribes were not fundamentally distinct from Hindu society but were 'backward Hindus,' i.e., segments of the same broad Hindu civilizational continuum that had, for various historical and geographical reasons, remained less integrated and less 'advanced.'\n\nGhurye's argument: he emphasized cultural and religious continuities between tribal and Hindu practices (worship of similar deities in localized form, overlap in ritual and belief), rejected the colonial administrative-anthropological tendency (notably associated with Verrier Elwin's early 'isolationist' position) to treat tribes as wholly separate, primitive 'noble savage' populations requiring protective isolation, and instead advocated integrationist policy -- gradual assimilation of tribes into mainstream Hindu society via education, land reform and administrative integration, viewing separate tribal reserves/protection as counter-productive and patronizing.\n\nCritique of Ghurye's position: (i) it substantially understates the genuine cultural, linguistic, religious (animism, totemism) and social-organizational distinctiveness of tribal societies, collapsing real difference into a homogenizing Hindu framework; (ii) it reflects an upper-caste Brahmanical lens that treats Hindu civilization as the normative center against which tribes are measured as 'backward,' echoing colonial evolutionary hierarchy-thinking even while opposing colonial isolationism; (iii) it underplays tribes' historical autonomy, resistance movements (Santhal, Munda rebellions) and distinct political institutions predating and independent of Hindu integration; (iv) Elwin and later scholars (Christoph von Furer-Haimendorf) countered with a middle path -- neither full isolation nor forced assimilation, but a 'via media' preserving tribal autonomy and culture while extending selective development benefits, which substantially shaped India's actual post-independence Fifth/Sixth Schedule constitutional protections.\n\nContemporary assessment: the isolation-vs-assimilation (Elwin-Ghurye) debate remains foundational to Indian tribal policy discourse; most contemporary anthropologists reject Ghurye's 'backward Hindu' framing as empirically reductive and ideologically loaded, while acknowledging genuine historical overlap and interaction between tribal and Hindu communities at India's cultural margins (Sanskritization processes among some tribal groups).\n\nConclusion: Ghurye's 'backward Hindu' thesis, while historically influential in shaping integrationist tribal policy debate, is critically assessed today as understating tribal distinctiveness and reflecting a Hindu-normative bias later substantially corrected by the Elwin-inspired 'via media' approach embedded in India's constitutional tribal protections.",
    examinerNotes:
      "The Ghurye-Elwin isolation-vs-assimilation debate is the essential frame; naming Elwin's counter-position and the eventual 'via media' policy compromise (reflected in Fifth/Sixth Schedule protections) is necessary for full marks on a 'critically comment' question.",
    sourceNote: SOURCE_A("2(a)"),
  },
  {
    section: "A",
    questionNumber: "2(b)",
    marks: 15,
    wordLimit: 250,
    questionText: "\"Indus Valley was the first settlement of the big civilization.\" Comment critically.",
    modelAnswer:
      "The claim that the Indus Valley Civilization (IVC, c. 3300-1300 BCE, mature phase c. 2600-1900 BCE) was 'the first settlement of the big civilization' requires critical qualification rather than acceptance at face value.\n\nWhat is accurate: the IVC was indeed one of the world's earliest urban civilizations, contemporaneous with (not preceding) ancient Egypt and Mesopotamia, and was geographically the largest of the three Bronze Age riverine civilizations, spanning parts of present-day Pakistan and northwest India, with over 1,000 known sites. It displayed remarkably advanced urban planning (grid layouts, standardized burnt-brick sizing at Mohenjo-daro and Harappa), sophisticated drainage/sanitation systems unmatched by its contemporaries, standardized weights and measures, and long-distance trade (Mesopotamian records mention 'Meluhha,' widely identified with the Indus region).\n\nWhat is inaccurate/needs qualification: it was not the first civilization chronologically -- Mesopotamian urbanism (Uruk period) and Egyptian state formation both predate or are broadly contemporaneous with IVC's earliest urban phase, so 'first' is not defensible; it also was not a single monolithic 'settlement' but a network of numerous cities and towns (Mohenjo-daro, Harappa, Dholavira, Rakhigarhi, Lothal) sharing common material culture, not one settlement.\n\nConclusion: the IVC is accurately characterized as one of the world's earliest, largest and most sophisticated Bronze Age urban civilizations, but the specific claim of being 'first' is a factual overstatement -- its true distinction lies in its unmatched geographic scale, planning sophistication and continuing debates (Rakhigarhi aDNA evidence) about its indigenous developmental depth, not temporal priority.",
    examinerNotes:
      "The answer must explicitly correct the 'first' claim by naming contemporaneous/earlier Mesopotamian and Egyptian urbanism, while crediting the IVC's genuine distinguishing features (scale, planning, sanitation) -- a purely descriptive praise-only answer misses the 'comment critically' instruction.",
    sourceNote: SOURCE_A("2(b)"),
  },
  {
    section: "A",
    questionNumber: "2(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "Discuss the basic tenets of Jainism and its impact on Indian society.",
    modelAnswer:
      "Jainism, founded/systematized by Mahavira (24th Tirthankara, 6th century BCE) as a shramanic tradition alongside early Buddhism, rests on core ethical-philosophical tenets: Ahimsa (non-violence toward all living beings, its central and most rigorously practiced principle), Satya (truthfulness), Asteya (non-stealing), Brahmacharya (chastity/self-restraint), and Aparigraha (non-possession/non-attachment); philosophically, Anekantavada (many-sidedness of truth, no single viewpoint is absolute) and its linguistic expression Syadvada (conditional predication) underpin Jain epistemology's pluralistic tolerance of differing perspectives.\n\nImpact on Indian society: (i) Ahimsa's influence extended far beyond Jain communities into wider Indian ethical culture, notably shaping vegetarianism norms in parts of India and directly influencing Gandhi's philosophy of non-violent resistance (satyagraha); (ii) Jain merchant and trading communities (historically significant in Gujarat, Rajasthan, Karnataka) built extensive networks of trade, banking and philanthropy, funding temple architecture, manuscript libraries and educational institutions; (iii) Jain literature contributed substantially to the development of Prakrit and regional-language literary traditions; (iv) Jainism's rejection of Vedic ritual authority and caste-based sacrificial religion offered a historically significant heterodox challenge to Brahmanical orthodoxy, contributing to India's long tradition of internal religious pluralism and reform; (v) Jain temple architecture (Dilwara temples, Shravanabelagola's Gomateshvara statue) forms a major strand of Indian art-historical heritage.\n\nConclusion: Jainism's ethical core (Ahimsa, Anekantavada) has left an impact on Indian society disproportionate to its numerically small following, shaping ethics, commerce, art and reformist political thought across two and a half millennia.",
    examinerNotes:
      "All five core vows (Ahimsa, Satya, Asteya, Brahmacharya, Aparigraha) plus Anekantavada/Syadvada should be named; the Gandhi-satyagraha linkage to Ahimsa is the standard, expected 'impact on Indian society' connection.",
    sourceNote: SOURCE_A("2(c)"),
  },
  {
    section: "A",
    questionNumber: "3(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "\"Sanskritization is a culture-bound concept.\" Critically comment to assess the strength and limitation of this concept in developing a theoretical framework to study social change.",
    modelAnswer:
      "Introduction: Sanskritization, coined by M.N. Srinivas in his study of the Coorgs (1952) and elaborated in Social Change in Modern India (1966), describes the process by which a lower caste or tribal group adopts the customs, rituals, ideology and lifestyle of a locally dominant 'twice-born'/higher caste, seeking to claim higher social status within the caste hierarchy over a generation or two.\n\nCulture-bound nature: the concept is explicitly rooted in the specific Indian caste-hierarchy context -- it presupposes a graded, hierarchically ranked social order in which upward mobility is achieved through emulation of a locally-dominant caste's ritual status markers (vegetarianism, teetotalism, particular deity worship, specific life-cycle rituals) rather than through structural/economic mobility alone, making it not straightforwardly transferable to societies organized around different stratification logics (class-based Western societies, for instance).\n\nStrengths: (i) provided the first systematic, empirically-grounded (fieldwork-based) framework explaining endogenous social mobility and change within the Indian caste system, correcting earlier colonial-administrative and textual-Indological views of caste as a rigid, unchanging structure; (ii) demonstrated agency among lower castes/tribes as active participants in status negotiation, not passive recipients of a fixed hierarchy; (iii) usefully distinguished from 'Westernization' (Srinivas's parallel concept for change via contact with Western culture/institutions), giving Indian sociology two distinct, empirically groundable vocabularies for analyzing different change processes simultaneously; (iv) generated substantial comparative fieldwork testing the concept across regions (Srinivas's own Coorg study, McKim Marriott's and others' village studies), refining and regionally qualifying it.\n\nLimitations: (i) as a culture-bound concept, it has limited cross-cultural theoretical portability outside caste-organized societies; (ii) it privileges ritual/status mobility while underplaying economic and political power as independent, sometimes more decisive, drivers of mobility; (iii) it assumes the existence of a stable 'dominant caste' reference point that Sanskritizing groups emulate, which may not hold uniformly across all regions or eras; (iv) critics (including later Srinivas revisions) note the model can understate resistance to and rejection of Sanskritization by groups asserting distinct, non-Hindu or explicitly anti-caste identities (Ambedkarite conversion to Buddhism as a directly opposed mobility strategy) rather than emulation.\n\nConclusion: Sanskritization remains a genuinely powerful, India-specific framework for theorizing endogenous caste-based social mobility, but its explicit rootedness in caste-hierarchy logic is simultaneously its defining strength (empirical fit to the Indian context) and its central limitation (restricted general theoretical applicability beyond that context).",
    examinerNotes:
      "The Srinivas-Coorg origin and the explicit Sanskritization/Westernization distinction are non-negotiable content; citing Ambedkarite Buddhist conversion as a counter-strategy to Sanskritization (rejection rather than emulation) is the expected sophisticated limitation point for full marks.",
    sourceNote: SOURCE_A("3(a)"),
  },
  {
    section: "A",
    questionNumber: "3(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Was Mesolithic culture the first step towards sedentary way of life? Illustrate your answer by citing suitable examples.",
    modelAnswer:
      "The Mesolithic (India, c. 10,000-4,000 years ago) is best understood as a transitional phase toward, rather than the outright first achievement of, sedentary life -- it represents the first significant movement away from purely mobile Paleolithic foraging, without yet reaching the fully settled agricultural village life of the Neolithic.\n\nEvidence of increasing settlement tendency: Mesolithic sites like Bagor (Rajasthan) show repeated, long-term occupation of the same location with associated burials, suggesting semi-sedentary or seasonally-recurring settlement rather than constant mobility; Sarai Nahar Rai and Mahadaha (Ganga plain, Uttar Pradesh) show substantial cemetery areas implying attachment to a fixed locale across generations; broad-spectrum foraging (fishing, small-game hunting, plant gathering) around resource-rich riverine locations reduced the need for the wide-ranging mobility characteristic of Paleolithic big-game hunting, favouring longer stays at productive sites.\n\nWhy 'first step' rather than achievement: true full sedentism, associated with year-round permanent settlement, storage and eventually agriculture/animal husbandry, is a Neolithic-era development (e.g., Mehrgarh in the Indus region, and later Indian Neolithic sites like Koldihwa/Mahagara in the Belan valley); Mesolithic communities remained substantially foraging-based, with only incipient, localized and seasonal sedentary tendencies rather than the year-round permanent villages of the Neolithic.\n\nConclusion: the Mesolithic represents the crucial first step -- via resource-rich riverine settlement, repeated site-reuse and reduced residential mobility -- toward eventual sedentary life, without itself constituting full sedentism, which was achieved only with Neolithic domestication and permanent village agriculture.",
    examinerNotes:
      "The answer should explicitly frame the Mesolithic as transitional ('first step') rather than claiming it achieved full sedentism outright, and should cite specific sites (Bagor, Sarai Nahar Rai/Mahadaha) as evidence alongside a Neolithic contrast (Mehrgarh, Koldihwa) to show where true sedentism actually emerges.",
    sourceNote: SOURCE_A("3(b)"),
  },
  {
    section: "A",
    questionNumber: "3(c)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Critically examine the impact of modern democratic institutions on contemporary tribal societies. Illustrate with suitable ethnographic examples.",
    modelAnswer:
      "Modern democratic institutions -- the Constitution, Panchayati Raj, electoral politics, judiciary -- have transformed tribal societies' political and social organization since independence, with genuinely mixed consequences.\n\nPositive impacts: reservation of seats in Parliament/State legislatures and Panchayats for Scheduled Tribes has enabled unprecedented tribal political representation and voice; the Panchayats (Extension to Scheduled Areas) Act, 1996 formally recognizes Gram Sabhas in Fifth Schedule areas with authority over customary resources, land and minor forest produce, partially reconciling customary tribal self-governance with the modern Panchayati Raj framework (though implementation is uneven, as documented among Gond and Baiga communities in Madhya Pradesh/Chhattisgarh); the Forest Rights Act, 2006, itself a product of democratic mobilization, has extended individual and community forest-rights recognition to many forest-dwelling communities.\n\nNegative/disruptive impacts: electoral politics has sometimes fractured traditional consensus-based tribal governance (village councils, headmen systems) by introducing party-political competition and factionalism, documented among Naga village-council systems under pressure from party politics; democratic institutions have in some contexts been used to legitimize land acquisition and displacement (dam and mining projects approved through formal but tribal-marginalizing consultation processes) despite constitutional safeguards; ethnic/identity-based political mobilization has occasionally fuelled inter-community conflict, as in the 2023 Manipur violence between the Meitei and Kuki-Zomi communities, partly triggered by contested Scheduled Tribe status claims.\n\nConclusion: modern democratic institutions have expanded tribal political representation and (unevenly) codified customary rights, but their interface with traditional tribal governance and identity politics has also generated genuine disruption and conflict, showing democratization's impact on tribal societies as substantively double-edged rather than uniformly beneficial.",
    examinerNotes:
      "PESA (1996) and the Forest Rights Act (2006) are the essential named legal-institutional anchors; citing the 2023 Manipur Meitei-Kuki conflict as a concrete, current ethnographic-political illustration of democratic institutions' disruptive potential is expected for a 'critically examine' answer.",
    sourceNote: SOURCE_A("3(c)"),
  },
  {
    section: "A",
    questionNumber: "4(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "Elucidate the problems faced by Particularly Vulnerable Tribal Groups and the major challenges in the formulation of special programmes for their development.",
    modelAnswer:
      "Introduction: Particularly Vulnerable Tribal Groups (PVTGs, 75 groups identified across 18 states/UTs, formerly termed Primitive Tribal Groups) are a sub-category of Scheduled Tribes identified by criteria including pre-agricultural technology, low literacy, stagnant/declining population, and extreme economic backwardness.\n\nProblems faced: (i) demographic vulnerability -- several PVTGs (Great Andamanese, Onge, Jarawa, Sentinelese) have critically small and, in some cases, declining populations, raising survival concerns; (ii) health -- high infant/maternal mortality, malnutrition, susceptibility to introduced diseases (historically devastating for isolated groups like the Andamanese), and poor healthcare access due to remote habitation; (iii) livelihood insecurity -- continued dependence on shifting cultivation, hunting-gathering or forest produce collection amid shrinking forest access, land alienation and restricted mobility; (iv) educational and literacy deficits, compounded by language barriers (many PVTG languages lack mainstream educational materials) and high dropout rates; (v) cultural erosion -- external contact, tourism (controversially, 'human safari' tourism affecting the Jarawa) and assimilationist pressure threaten distinct cultural practices and identity; (vi) displacement risk from development/conservation projects overlapping PVTG habitats.\n\nChallenges in programme formulation: (i) the extreme diversity among PVTGs (some semi-nomadic hunter-gatherers, others settled shifting cultivators) makes uniform, one-size-fits-all schemes ineffective, demanding group-specific micro-planning; (ii) balancing protection/isolation (to prevent cultural disruption and disease exposure, as with the Sentinelese) against development/integration (education, healthcare access) creates a genuine policy dilemma without easy resolution; (iii) poor baseline data and periodic Census undercounting of small, remote PVTG populations hampers accurate needs assessment; (iv) weak inter-departmental coordination between tribal welfare, forest, health and education administrations; (v) low PVTG participation in scheme design due to communication/literacy barriers, undermining genuine community ownership; (vi) inadequate, often centrally-designed budgetary allocation under schemes like the Development of PVTGs scheme failing to reach the last-mile due to weak field administration in remote habitats.\n\nConclusion: PVTGs' extreme vulnerability -- demographic, economic, cultural and health-related -- demands genuinely differentiated, community-specific programme design, but persistent data gaps, the isolation-versus-integration dilemma and weak field implementation continue to undermine effective policy delivery for this most vulnerable stratum of India's tribal population.",
    examinerNotes:
      "Naming specific PVTGs (Sentinelese, Jarawa, Great Andamanese) and the isolation-vs-integration policy dilemma these cases starkly illustrate is the expected substantive anchor distinguishing a strong answer from a generic tribal-welfare listing.",
    sourceNote: SOURCE_A("4(a)"),
  },
  {
    section: "A",
    questionNumber: "4(b)",
    marks: 15,
    wordLimit: 250,
    questionText: "Critically compare Risley's and Sarkar's approaches to the classification of peoples of India.",
    modelAnswer:
      "Herbert Risley, a colonial ethnographer, classified the peoples of India (The People of India, 1908) primarily using anthropometric criteria -- physical measurements including the nasal index (ratio of nasal breadth to height), stature, cephalic index and other cranio-facial measurements -- proposing seven broad racial types (Turko-Iranian, Indo-Aryan, Scytho-Dravidian, Aryo-Dravidian, Mongolo-Dravidian, Mongoloid, Dravidian) and controversially correlating the nasal index with caste status, effectively naturalizing caste hierarchy as biologically/racially determined -- a methodologically and ideologically colonial-racialist project since discredited.\n\nSarkar's approach: Sunit Kumar Sarkar (mid-20th century Indian physical anthropologist) shifted classification toward serological/genetic criteria -- blood group systems (ABO, Rh, MN) and other biochemical genetic markers -- alongside somatometric measures, identifying population types (Mediterranean, Alpine/Armenoid, Nordic, Mongoloid, Negrito, Proto-Australoid) based on genetic-population-distance analysis rather than external phenotype alone, representing a more objective, statistically-grounded approach less directly entangled with justifying social hierarchy.\n\nCritical comparison: Risley's approach was scientifically weaker (relying on superficial, environmentally-plastic anthropometric traits) and ideologically compromised by its colonial caste-race conflation; Sarkar's serological approach was methodologically more rigorous and better aligned with genetics as understood by his time, though it too inherited some racial-typological assumptions (discrete population 'types') that later population genetics (emphasizing clinal, continuous variation rather than discrete races) would further critique. Both approaches, despite their methodological differences, shared the now-outdated assumption that discrete racial 'types' meaningfully describe Indian population diversity, an assumption modern population genetics has substantially revised.\n\nConclusion: Sarkar's serological method represented a genuine methodological advance over Risley's colonial-era anthropometry, but both remain superseded by contemporary genomic population-genetics approaches that reject discrete racial typologies altogether.",
    examinerNotes:
      "Risley's nasal-index-to-caste correlation and its colonial-ideological function must be explicitly critiqued, not merely described; Sarkar's serological (blood-group) method should be named specifically as the key methodological contrast.",
    sourceNote: SOURCE_A("4(b)"),
  },
  {
    section: "A",
    questionNumber: "4(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "Is caste mobility a recent phenomenon? Discuss in the light of Indological and Empirical context.",
    modelAnswer:
      "Caste mobility -- change in a caste or sub-caste group's relative rank/status within the local hierarchy -- is not a recent phenomenon, though its pace, mechanisms and visibility have changed significantly over time.\n\nIndological/historical evidence: textual and historical sources (Puranic literature, epigraphic records, dynastic histories) document numerous historical instances of castes/lineages rising in status by claiming higher varna affiliation, adopting Kshatriya or Brahmin genealogical claims, or through royal patronage -- M.N. Srinivas's own Sanskritization framework was explicitly built on the observation that such status-mobility processes have operated across Indian history, not merely in the modern period; historical dynasties of tribal or otherwise non-elite origin (several regional ruling lineages) are documented to have achieved Kshatriya status through Sanskritizing genealogical and ritual claims well before colonial rule.\n\nEmpirical/modern evidence: 20th-century fieldwork (Srinivas's Coorg study, subsequent village studies) empirically documented ongoing caste mobility through Sanskritization, economic advancement (land acquisition, new occupations), education, political mobilization and affirmative-action-driven status assertion (reservation policy enabling some SC/ST/OBC groups to convert economic/political gains into enhanced social standing) -- accelerating and diversifying mobility mechanisms beyond purely ritual emulation to include constitutional/political routes unavailable in the pre-modern period.\n\nConclusion: caste mobility is a long-standing structural feature of the Indian caste system evidenced across both historical/Indological and modern empirical record, but modern India's democratic, educational and constitutional mechanisms have added genuinely new -- and in important respects faster and more assured -- channels of mobility beyond the older ritual-emulation route.",
    examinerNotes:
      "The answer should draw on both textual/historical (Indological) evidence of pre-modern caste mobility and modern fieldwork/reservation-policy evidence (empirical) as the question explicitly demands both, concluding that mobility is old but its modern mechanisms are genuinely new/expanded.",
    sourceNote: SOURCE_A("4(c)"),
  },
  // ---------------- SECTION B ----------------
  {
    section: "B",
    questionNumber: "5(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Scheduled areas",
    modelAnswer:
      "Scheduled Areas are tribal-majority regions specially designated under the Fifth Schedule of the Constitution (applicable to most tribal-concentration states other than the Northeast) for enhanced administrative protection of tribal land, customary law and welfare.\n\nMechanism: the President, in consultation with the state Governor, declares and can modify Scheduled Areas; the Governor is empowered to make regulations governing land transfer, money-lending and other matters affecting tribal welfare in these areas, and must submit an annual report to the President on their administration; the Governor may also direct that a particular central or state law not apply, or apply with modifications, to a Scheduled Area.\n\nDistinction from Sixth Schedule: Sixth Schedule areas (Assam, Meghalaya, Tripura, Mizoram) instead have Autonomous District/Regional Councils with their own legislative, judicial and executive powers -- a stronger form of self-governance than the Fifth Schedule's Governor-mediated protective-regulatory model.\n\nSignificance: Scheduled Areas, together with the Panchayats (Extension to Scheduled Areas) Act 1996, form the core constitutional-administrative framework protecting tribal land alienation, customary governance and resource rights in mainland tribal-belt India.",
    examinerNotes:
      "The Fifth vs Sixth Schedule distinction (Governor-regulation model vs Autonomous District Councils) is the key comparative point examiners expect, not just a definition of Fifth Schedule areas alone.",
    sourceNote: SOURCE_B("5(a)"),
  },
  {
    section: "B",
    questionNumber: "5(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Ramapithecus-Sivapithecus debate",
    modelAnswer:
      "Ramapithecus (fossils from the Siwalik hills, South Asia) was initially interpreted by G.E. Lewis (1930s) and later strongly championed by Elwyn Simons and David Pilbeam in the 1960s-70s as a direct early hominid ancestor, based on dental features (thick enamel, reduced canines, parabolic dental arcade) seemingly resembling later hominins more than apes.\n\nThe debate: this hominid-ancestor interpretation dominated for decades, but subsequent fossil discoveries and, crucially, molecular/biochemical evidence (Sarich and Wilson's immunological/molecular-clock studies in the 1960s-70s, later DNA-based estimates) showed the human-ape lineage split occurred much more recently (roughly 5-8 million years ago) than Ramapithecus's dated age (c. 12-14 million years) would allow if it were a true hominid ancestor. Further, more complete facial/cranial fossils recovered in the late 1970s-80s revealed that Ramapithecus's actual skull morphology closely resembled Sivapithecus, itself now recognized as an ancestor of the modern orangutan (Pongo) lineage rather than of humans.\n\nResolution: Ramapithecus was subsequently reclassified as a female/smaller specimen of Sivapithecus, resolving the debate in favour of an Asian-great-ape (orangutan) ancestry rather than a human-ancestor status, and serving as a landmark case demonstrating molecular/biochemical evidence overturning purely morphology-based paleoanthropological interpretation.",
    examinerNotes:
      "The key resolution point -- molecular-clock evidence (Sarich-Wilson) contradicting the hominid-ancestor dating, followed by fossil re-evaluation reclassifying Ramapithecus under Sivapithecus/orangutan ancestry -- is the specific content expected, not just a description of the fossils themselves.",
    sourceNote: SOURCE_B("5(b)"),
  },
  {
    section: "B",
    questionNumber: "5(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Village as little republic",
    modelAnswer:
      "The characterization of the Indian village as a 'little republic' originates from colonial administrator-scholars (notably Charles Metcalfe, 1830) who described villages as largely self-sufficient, self-governing communities -- economically autonomous (through jajmani-based internal exchange) and politically managed by their own panchayats, seemingly unaffected by the rise and fall of larger kingdoms and empires around them.\n\nCritical assessment: this image has been substantially revised by later ethnographic/sociological research (M.N. Srinivas, Louis Dumont, F.G. Bailey) which showed villages were never fully isolated or internally undifferentiated 'republics' -- they were, and are, internally stratified by caste hierarchy, unequal landholding and gender, with power concentrated in dominant castes rather than democratically distributed; villages were also always embedded in wider regional economic, political and religious networks (pilgrimage circuits, regional kingdoms' revenue systems, inter-village marriage networks) rather than truly self-contained.\n\nSignificance: the 'little republic' image, though a colonial-administrative romanticization used partly to justify indirect rule through village-level structures, nonetheless correctly identified real elements of village-level self-governance (panchayats, jajmani exchange) later formalized institutionally in India's post-independence Panchayati Raj system.",
    examinerNotes:
      "A strong answer must critique the romanticized 'little republic' image (Metcalfe's colonial framing) using later ethnographic evidence of internal caste stratification and external embeddedness (Srinivas, Dumont), not simply restate the description approvingly.",
    sourceNote: SOURCE_B("5(c)"),
  },
  {
    section: "B",
    questionNumber: "5(d)",
    marks: 10,
    wordLimit: 150,
    questionText: "Dravidian languages and their subgroups",
    modelAnswer:
      "The Dravidian language family, spoken predominantly across southern India (plus pockets in central/eastern India and Brahui in Pakistan/Afghanistan), comprises roughly 80 languages spoken by over 200 million people, and is conventionally classified into four subgroups: South Dravidian (Tamil, Malayalam, Kannada, Tulu, and several tribal languages like Toda, Kota), South-Central Dravidian (Telugu, Gondi, Kui, Konda), Central Dravidian (Kolami, Parji, Ollari), and North Dravidian (Kurukh, Malto, and the geographically isolated Brahui).\n\nSignificance: the four major literary languages (Tamil, Telugu, Kannada, Malayalam) have long, independent classical literary traditions, with Tamil-Brahmi inscriptions (c. 2nd century BCE) among the earliest attested Dravidian writing; several tribal Dravidian languages (Gondi, Kurukh, Kui) remain primarily oral, spoken by central-Indian tribal communities and increasingly endangered.\n\nBroader debate: the Dravidian family's origins and relationship to the Indus Valley Civilization's undeciphered script remain contested and unresolved, with some scholars proposing a Dravidian-Harappan linguistic connection, making Dravidian linguistic classification directly relevant to ongoing debates about South Asian population and language history.",
    examinerNotes:
      "The four-subgroup classification (South, South-Central, Central, North) with at least one named language per subgroup is the core expected content; noting Brahui's geographic isolation in Pakistan/Afghanistan is a frequently-tested specific detail.",
    sourceNote: SOURCE_B("5(d)"),
  },
  {
    section: "B",
    questionNumber: "5(e)",
    marks: 10,
    wordLimit: 150,
    questionText: "Karma and rebirth",
    modelAnswer:
      "Karma and rebirth (samsara) are foundational, interlinked concepts across Indian religious traditions (Hinduism, Buddhism, Jainism), explaining moral causation and the cycle of existence beyond a single lifetime.\n\nKarma: the principle that intentional actions (of body, speech, mind) generate consequences that shape an individual's future circumstances, understood in Hindu thought as accumulated across lifetimes (sanchita, prarabdha, kriyamana karma categories) and in Buddhism as an impersonal causal law of moral consequence rather than externally-administered divine judgment.\n\nRebirth: the doctrine that the consequences of karma are worked out across successive lives, with the specific form/circumstances of rebirth determined by one's accumulated karmic balance; Hindu philosophy generally posits a persisting atman (soul) undergoing rebirth, whereas Buddhism explicitly denies a permanent self (anatta), instead describing a causally-linked stream of consciousness continuing without a fixed, unchanging soul.\n\nAnthropological relevance: karma-rebirth beliefs function as powerful social-legitimation and moral-regulation mechanisms, historically used to explain and rationalize caste-based social position and inequality (present birth-status as the fruit of past-life karma) while also providing an ethical framework motivating moral conduct and, in the pursuit of moksha/nirvana, ultimate liberation from the cycle altogether.",
    examinerNotes:
      "The Hindu (persisting atman) vs Buddhist (anatta, no permanent self) distinction in how rebirth is understood is the key comparative-religion point expected; the caste-legitimation social function of karma doctrine is the anthropologically relevant critical dimension.",
    sourceNote: SOURCE_B("5(e)"),
  },
  {
    section: "B",
    questionNumber: "6(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "Is annihilation of caste possible? Discuss the future of caste system in the light of various proactive measures taken by the Indian State.",
    modelAnswer:
      "Introduction: B.R. Ambedkar's Annihilation of Caste (1936) remains the foundational text framing this question -- he argued caste could not be reformed piecemeal but required the destruction of its religious-scriptural sanction (rejecting Chaturvarna itself, not merely its abuses), a position that puts a hard, still-unresolved question before any assessment of caste's future: is genuine annihilation achievable, or only mitigation?\n\nProactive state measures: (i) constitutional abolition of untouchability (Article 17) and prohibition of caste discrimination (Article 15); (ii) reservation policy in education, employment and legislatures for SCs/STs (and later OBCs, per the Mandal Commission) as compensatory-mobility measures; (iii) the SC/ST (Prevention of Atrocities) Act, 1989 criminalizing caste-based violence; (iv) land reforms intended to break caste-linked land monopolies; (v) inter-caste marriage incentive schemes and Dalit welfare/scholarship programmes.\n\nAssessment of impact: these measures have produced genuine, measurable mobility -- a substantial Dalit and OBC political class, growing middle class, greater political representation -- but have not eliminated caste as a lived social reality; caste continues to structure marriage (overwhelming endogamy persists even among urban, educated Indians), residential patterns, and informal social discrimination, while caste-based violence (atrocities against Dalits) persists despite legal prohibition, and caste has if anything become more, not less, salient in electoral mobilization and identity politics.\n\nStructural obstacles to annihilation: caste's embeddedness in religious sanction, its function as an endogamous marriage-network resource, its persistence as a vehicle for democratic political mobilization and vote-bank politics, and continued economic stratification along caste lines all work against full annihilation, even as individual caste practices attenuate.\n\nConclusion: the Indian State's proactive measures have substantially reformed caste's grosser inequalities and expanded mobility channels envisioned neither by pure Sanskritization nor untouched tradition, but full 'annihilation' in Ambedkar's radical sense -- the complete dissolution of caste as a social category -- remains unrealized; caste's future is more plausibly one of continued attenuation, transformation and politicization than outright disappearance.",
    examinerNotes:
      "Ambedkar's specific Annihilation of Caste argument (destroying scriptural sanction, not just reforming abuses) must be stated as the conceptual benchmark against which state measures are then assessed; the answer should conclude with a reasoned, non-evasive position (attenuation/transformation rather than full annihilation) rather than remaining purely descriptive.",
    sourceNote: SOURCE_B("6(a)"),
  },
  {
    section: "B",
    questionNumber: "6(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Distinguishing between ethnic identity and ethnicity, discuss the factors responsible for ethnic conflict in tribal areas.",
    modelAnswer:
      "Ethnic identity is the subjective, self-ascribed sense of belonging to a group defined by shared ancestry, language, religion or culture -- an internally-felt, often situational and negotiable identification. Ethnicity, following Fredrik Barth's influential boundary-approach, is better understood as the social process of maintaining group boundaries through interaction and differentiation from other groups, rather than a fixed inventory of cultural traits -- ethnicity exists relationally, produced and reproduced at the boundary between groups, while ethnic identity is the individual/psychological dimension of belonging to a side of that boundary.\n\nFactors causing ethnic conflict in tribal areas: (i) competition over scarce resources -- land, forest, minerals -- between tribal groups themselves or between tribal and non-tribal/migrant settler populations; (ii) contested claims to Scheduled Tribe status or its associated benefits (reservation, land protection), as seen in the 2023 Meitei-Kuki conflict in Manipur, where the Meitei community's demand for ST status was fiercely opposed by Kuki-Zomi groups fearing dilution of their existing protections and resources; (iii) political mobilization along ethnic lines for electoral advantage, hardening group boundaries; (iv) historical grievances from colonial-era boundary-drawing and unequal development across different tribal communities; (v) demographic change from migration altering the ethnic balance in a region, perceived as threatening by established communities; (vi) weak or partisan state mediation, which can inflame rather than resolve boundary disputes.\n\nConclusion: ethnic conflict in tribal areas typically arises where Barth-style boundary competition intersects with material resource scarcity and state-mediated status/benefit allocation, as starkly illustrated by the ongoing Manipur conflict.",
    examinerNotes:
      "Barth's boundary-maintenance theory is the standard theoretical anchor for the ethnicity/ethnic-identity distinction; the 2023 Manipur Meitei-Kuki conflict is the specific, current and clearly expected illustrative example for the conflict-factors half.",
    sourceNote: SOURCE_B("6(b)"),
  },
  {
    section: "B",
    questionNumber: "6(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "\"Siwalik deposits show a variety of Neogene fossil primates.\" Critically examine.",
    modelAnswer:
      "The Siwalik Hills (foothills of the Himalayas spanning Pakistan, India, Nepal) preserve an exceptionally rich and long (spanning much of the Neogene, roughly 23-2.6 million years ago) fossil-bearing sedimentary sequence, making the claim substantively accurate -- the Siwaliks are indeed among the world's most important Neogene primate fossil localities.\n\nKey primate fossils: Sivapithecus (large-bodied hominoid, dated roughly 12.5-8.5 million years ago, now firmly established via craniofacial evidence as an ancestor of the modern orangutan lineage rather than of humans, resolving the earlier Ramapithecus-Sivapithecus confusion); various cercopithecoid (Old World monkey) fossils documenting the diversification of monkey lineages through the Neogene; and other hominoid remains contributing to understanding ape evolution and biogeography in Miocene Asia.\n\nCritical examination: while the diversity and richness of Siwalik primate fossils is genuinely well-established, several qualifications are necessary -- (i) precise stratigraphic dating and correlation across different Siwalik exposures remains methodologically challenging, given the sequence's considerable geographic spread and tectonic disturbance; (ii) many fossils are fragmentary (isolated teeth, jaw fragments), limiting confident taxonomic and phylogenetic assignment; (iii) taxonomic classification of the Sivapithecus-related hominoid material has itself been repeatedly revised as new material and analytical methods (including molecular-clock cross-checks) became available, indicating ongoing scientific uncertainty rather than settled consensus; (iv) the Siwalik record, while rich, is geographically limited to South Asia and cannot alone resolve broader questions of ape/hominin biogeographic dispersal across Africa and Eurasia.\n\nConclusion: the Siwalik deposits do substantiate a genuine diversity of Neogene fossil primates, most significantly Sivapithecus's contribution to resolving orangutan ancestry, but ongoing dating, fragmentary-fossil and taxonomic uncertainties mean the record should be examined critically rather than treated as a fully settled evolutionary account.",
    examinerNotes:
      "Sivapithecus's resolved orangutan-ancestor status (connecting directly to the Ramapithecus-Sivapithecus debate tested elsewhere on this paper) is the central named fossil expected; the 'critically examine' instruction requires flagging dating/fragmentary-evidence limitations, not just listing fossil diversity approvingly.",
    sourceNote: SOURCE_B("6(c)"),
  },
  {
    section: "B",
    questionNumber: "7(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "Elucidate the shifting terrains of India's tribal policies in colonial and post-colonial periods.",
    modelAnswer:
      "Introduction: Indian tribal policy has shifted substantially across the colonial and post-colonial periods, moving through phases of exploitative penetration, protective isolation, integrationist development, and finally rights-based autonomy.\n\nColonial period -- early exploitation (pre-1857): British expansion, revenue settlement and commercial penetration into tribal areas caused large-scale land alienation, forest restriction and exploitation by non-tribal moneylenders/traders, provoking major tribal rebellions -- the Santhal Hul (1855-56) and later the Munda Ulgulan led by Birsa Munda (1899-1900) -- both explicitly protesting land alienation and colonial/zamindari oppression.\n\nColonial period -- protective isolation (post-1857): chastened by these rebellions, the colonial state shifted toward creating 'Excluded' and 'Partially Excluded Areas' under the Government of India Act, 1935, restricting non-tribal entry and administering tribal areas indirectly through separate regulation -- a paternalistic protection regime that nonetheless kept tribal areas administratively and educationally isolated from mainstream development.\n\nPost-independence -- integration and the Elwin-Ghurye debate: independent India's Constitution created the Fifth and Sixth Schedules, institutionalizing a 'via media' between Verrier Elwin's protective-isolationist leanings and G.S. Ghurye's integrationist 'backward Hindu' assimilation position -- Nehru's own 'Panchsheel' for tribal policy (development without imposing external values, respecting tribal land/culture, training tribals to administer their own affairs, avoiding over-administration) reflected this deliberate middle path, operationalized through Tribal Sub-Plans, Integrated Tribal Development Agencies, and community development programmes from the 1950s-70s, though often criticized for top-down, insufficiently participatory implementation.\n\nPost-1980s -- rights and autonomy: democratic decentralization and tribal-rights movements shifted policy toward statutory recognition of self-governance and resource rights -- PESA (1996) extending Panchayati Raj with Gram Sabha primacy to Fifth Schedule areas, the Forest Rights Act (2006) recognizing individual and community forest rights, and the Land Acquisition, Rehabilitation and Resettlement Act (2013) strengthening consent and compensation safeguards -- representing a genuine shift from state-directed development toward rights-based, community-authored governance, even though implementation gaps (bureaucratic delay, inadequate awareness, resistance from vested interests) persist.\n\nConclusion: India's tribal policy terrain has shifted from colonial exploitation and subsequent protective isolation to post-independence integrationist development (the Elwin-Ghurye-shaped 'via media') and finally toward the still-unfolding, rights-and-autonomy-based framework of PESA and the Forest Rights Act -- each phase responding to the perceived failures of the one before it.",
    examinerNotes:
      "The four-phase periodization (colonial exploitation, colonial protective-isolation, post-independence integrationist 'via media', post-1980s rights/autonomy) with named legal instruments at each stage (Government of India Act 1935 exclusions, Fifth/Sixth Schedule, PESA, Forest Rights Act) is the expected comprehensive structure for full marks at 20 marks.",
    sourceNote: SOURCE_B("7(a)"),
  },
  {
    section: "B",
    questionNumber: "7(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Critically Examine how the displacement of tribal communities due to hydroelectric river dam projects has affected the women in local context. Illustrate with suitable ethnographic Examples.",
    modelAnswer:
      "Hydroelectric dam-induced displacement disproportionately burdens tribal women, whose roles, rights and resources are frequently marginalized in both displacement itself and resettlement processes.\n\nGendered impacts: (i) loss of land and forest-based livelihood -- tribal women, central to subsistence agriculture, minor-forest-produce collection and household food security, typically lose direct access to land and forest resources, since compensation/rehabilitation land titles are usually registered in male household heads' names, systematically excluding women from formal resettlement entitlements; (ii) increased domestic and unpaid labour burden in unfamiliar resettlement sites lacking accustomed water, fuelwood and food sources; (iii) loss of traditional knowledge-based economic roles (seed selection, forest-produce processing) that had given women a measure of economic autonomy within tribal households; (iv) heightened vulnerability to sexual harassment, trafficking and domestic violence in disrupted, insecure resettlement conditions, documented in studies of Sardar Sarovar (Narmada) oustee communities among Bhil and Bhilala women; (v) erosion of women's traditional decision-making roles and community standing as displacement fragments existing social-support and kinship networks.\n\nEthnographic illustration: studies of the Narmada Bachao Andolan-documented displacement (Sardar Sarovar dam) show tribal women organizing prominently in resistance movements precisely because they bore displacement's heaviest burden, while government-commissioned studies of Odisha's Hirakud and Balimela dam oustees similarly document women's exclusion from land-title-based compensation.\n\nConclusion: hydroelectric displacement's gendered impact on tribal women -- compounding loss of livelihood, land-title exclusion and heightened vulnerability -- demands gender-disaggregated resettlement policy (joint or women's-name land titling, women-inclusive rehabilitation planning) that current compensation frameworks have largely failed to provide.",
    examinerNotes:
      "The land-title-registered-in-male-name mechanism excluding women from formal compensation is the single most important specific point; citing the Narmada/Sardar Sarovar displacement and Bhil/Bhilala women's documented experience gives the required concrete ethnographic illustration.",
    sourceNote: SOURCE_B("7(b)"),
  },
  {
    section: "B",
    questionNumber: "7(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "Elucidate the role of anthropology in nation building. Illustrate with suitable examples.",
    modelAnswer:
      "Anthropology has contributed substantively to Indian nation-building since independence by supplying the empirical, culturally-grounded knowledge needed to integrate a vastly diverse population into a shared political and developmental framework.\n\nPolicy formulation: anthropological fieldwork directly shaped tribal policy (Verrier Elwin's ethnographic advocacy influencing Nehru's Panchsheel approach to tribal administration) and continues to inform PVTG development schemes, land and forest-rights legislation, and Scheduled Area administration grounded in actual community practice rather than abstract assumption.\n\nDevelopment planning and evaluation: applied anthropological studies -- L.P. Vidyarthi's studies of the social impact of industrialization and dam-building on Bihar's tribal communities, N.K. Bose's studies of Partition-refugee resettlement in West Bengal, and M.N. Srinivas-associated famine and rural-development studies -- have directly informed government understanding of development's social costs and the design of rehabilitation/welfare measures.\n\nNational integration: ethnographic documentation of India's linguistic, religious and caste diversity (the Anthropological Survey of India's People of India project, mapping thousands of communities) has provided the empirical basis for reorganizing states along linguistic lines, designing affirmative-action categories (SC/ST/OBC classification) and formulating minority and linguistic-rights protections central to India's federal, plural constitutional design.\n\nSocial cohesion and conflict resolution: anthropological understanding of ethnic-identity dynamics informs conflict-mediation efforts in situations of communal or ethnic tension (Northeast insurgency contexts, caste/communal conflict), while documentation of syncretic and shared cultural practices supports policy narratives of unity-in-diversity.\n\nConclusion: from tribal policy and development planning to state reorganization and conflict mediation, anthropology's empirical, ground-level understanding of India's social diversity has been directly instrumental to the practical work of building and sustaining a genuinely plural Indian nation.",
    examinerNotes:
      "Naming specific applied studies (Vidyarthi on Bihar dam displacement, Bose on refugee resettlement, Elwin's influence on Nehru's tribal Panchsheel) rather than a generic 'anthropology helps understand diversity' claim is the expected concrete substantiation.",
    sourceNote: SOURCE_B("7(c)"),
  },
  {
    section: "B",
    questionNumber: "8(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "Discuss the distribution of tribes in different geographical regions of India. Identify the distinct institutional features of tribal societies of these regions.",
    modelAnswer:
      "Introduction: India's roughly 700+ Scheduled Tribe communities (over 10 crore population per Census 2011, about 8.6% of India's total population) are distributed across four broad geo-cultural zones, each showing distinct racial/physical affinity, subsistence pattern and institutional organization.\n\nNorth and North-Eastern zone: spans the Himalayan belt and the entire Northeast (Nagaland, Mizoram, Meghalaya, Manipur, Arunachal Pradesh, Tripura, Sikkim); tribes here (Naga groups, Mizo, Khasi, Garo, Bhutia, Lepcha) generally show Mongoloid physical affinity, practice a mix of settled agriculture and shifting (jhum) cultivation, and are notable for distinct institutional features -- strong village-council-based self-governance (Naga village councils), several matrilineal descent/inheritance systems (Khasi, Garo, uniquely prominent among world matrilineal societies), and generally higher literacy and Christian religious conversion rates than other tribal zones, alongside historically strong ethnic-political autonomy movements.\n\nCentral/Middle Indian zone: the largest tribal-population zone, spanning Madhya Pradesh, Chhattisgarh, Jharkhand, Odisha, and adjoining parts of Maharashtra/Andhra Pradesh/West Bengal; tribes (Gond, Santhal, Munda, Ho, Oraon, Bhil, Baiga, Kondh) show predominantly Proto-Australoid physical affinity, depend heavily on forest resources and subsistence agriculture, and institutionally are marked by clan/totemic organization, village-headman (mahato/pradhan/manki-munda) based governance, and historically significant land-alienation-driven rebellions (Santhal Hul, Munda Ulgulan) that directly shaped colonial and post-colonial tribal protective legislation.\n\nSouthern zone: covers the Western Ghats and hill tracts of Kerala, Tamil Nadu, Karnataka, Andhra Pradesh (Toda, Kadar, Irula, Chenchu, Kurumba); generally smaller, more geographically confined populations showing Dravidian/Proto-Australoid affinity, historically forest-dependent hunter-gatherer or pastoral economies (Toda's distinctive buffalo-pastoralism and polyandrous kinship institution being a notable exception), now substantially affected by plantation economy and tourism-driven change.\n\nAndaman and Nicobar zone: geographically isolated island populations (Great Andamanese, Onge, Jarawa, Sentinelese, Shompen) of Negrito (Andaman) and Mongoloid (Nicobarese) affinity, among the world's most isolated hunter-gatherer/foraging societies, institutionally organized around small band-level social organization with minimal external contact -- several classified as PVTGs requiring the strongest protective, low-contact administrative approach in India.\n\nConclusion: India's tribal geography maps onto four distinct zones -- North-Eastern (Mongoloid, matrilineal/village-council institutions), Central (Proto-Australoid, clan/totemic, land-rebellion history), Southern (Dravidian/Proto-Australoid, smaller forest-dependent groups) and Andaman-Nicobar (Negrito, isolated band societies) -- each with institutional features shaped by distinct racial history, ecology and degree of external contact.",
    examinerNotes:
      "The four-zone framework with a named racial/physical-affinity label, subsistence pattern and a distinctive institutional feature (Khasi/Garo matriliny for the Northeast, Santhal/Munda clan-and-rebellion history for Central India, Toda polyandry for the South, PVTG band-isolation for Andaman-Nicobar) per zone is the expected comprehensive structure for 20 marks.",
    sourceNote: SOURCE_B("8(a)"),
  },
  {
    section: "B",
    questionNumber: "8(b)",
    marks: 15,
    wordLimit: 250,
    questionText: "Critically evaluate the contributions of S.C. Roy to Indian Anthropology?",
    modelAnswer:
      "Sarat Chandra Roy (1871-1942), widely regarded as the 'Father of Indian Ethnography,' pioneered systematic, fieldwork-based ethnographic study of Chota Nagpur's tribal communities (Munda, Oraon, Kharia, Birhor, Ho) at a time when Indian anthropology was still largely a colonial-administrative enterprise.\n\nContributions: (i) conducted detailed, empathetic monographic studies -- The Mundas and Their Country (1912), The Oraons of Chota Nagpur (1915), The Birhors (1925) -- combining ethnographic description with attention to tribal customary law, which he leveraged in his parallel career as a lawyer providing legal assistance to tribals in land and customary-rights disputes, directly linking anthropological knowledge to tribal welfare advocacy; (ii) founded and edited Man in India (1921), a still-running journal that became a crucial platform for Indian (not only colonial/foreign) anthropological scholarship, nurturing an indigenous Indian anthropological tradition; (iii) documented tribal religion, totemism, kinship and material culture with unusual ethnographic depth for his period, providing an invaluable historical-baseline record for later comparative and change-focused tribal studies.\n\nCritical limitations: Roy's work remained substantially descriptive-comparative rather than theoretically innovative -- he did not develop original analytical frameworks comparable to contemporaneous structural-functionalist or culture-historical theory, and his writing at times reflected the evolutionary and racially-inflected vocabulary common to his era (though considerably more sympathetic and less exploitative than colonial administrator-ethnographers). His focus was also geographically concentrated on Chota Nagpur, limiting the generalizability of his specific findings.\n\nConclusion: Roy's meticulous, welfare-oriented fieldwork and his founding of Man in India make him a genuinely foundational figure who indigenized Indian anthropology and linked it concretely to tribal legal advocacy, even though his contribution is better assessed as ethnographic-descriptive pioneering than as original theoretical innovation.",
    examinerNotes:
      "Naming specific monographs (The Mundas and Their Country, The Oraons of Chota Nagpur) and Man in India's founding are essential factual anchors; the 'descriptive rather than theoretically original' critique is the expected balancing element for a 'critically evaluate' question.",
    sourceNote: SOURCE_B("8(b)"),
  },
  {
    section: "B",
    questionNumber: "8(c)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "How are Other Backward Classes identified? Enumerating the important features, elucidate the recent changes in their social and economic life.",
    modelAnswer:
      "Other Backward Classes (OBCs) are castes/communities identified as socially and educationally backward, entitled to affirmative-action benefits distinct from SC/ST reservation.\n\nIdentification mechanism: the Mandal Commission (Second Backward Classes Commission, 1980 report, implemented 1990) used indicators of social backwardness (castes considered low in traditional social hierarchy, dependent on manual labour), educational backwardness (literacy/school-enrolment gaps relative to state averages), and economic backwardness (occupation, asset ownership) to identify OBC castes, recommending 27% central-government job/education reservation, subsequently upheld with the 'creamy layer' exclusion by the Supreme Court in Indra Sawhney v. Union of India (1992); the National Commission for Backward Classes (given constitutional status via the 102nd Amendment, 2018) now maintains and periodically revises the Central OBC list, with states maintaining their own separate OBC lists.\n\nImportant features: OBCs are not a homogeneous bloc but an extremely heterogeneous aggregation of numerous distinct castes/communities varying widely in actual socio-economic status; the creamy-layer criterion (income/status threshold) excludes the relatively better-off OBC sub-groups from reservation benefits, targeting relief toward the genuinely backward within the category.\n\nRecent changes in social/economic life: political assertion and representation have grown substantially (OBC-based political parties/leadership in several states), reservation has expanded access to government employment, higher education and, since 2019, entry into private unaided institutions in some contexts; economically, agrarian OBC communities have seen mixed outcomes -- some (dominant landholding OBC castes like Jats, Patels, Marathas) demanding further reservation despite relative prosperity, reflecting persistent contestation over who genuinely qualifies as 'backward' amid ongoing economic and political change.\n\nConclusion: OBC identification rests on the Mandal Commission's social-educational-economic criteria formalized through the creamy-layer-qualified reservation regime, with recent decades showing substantial political empowerment alongside continued contestation over the category's internal heterogeneity.",
    examinerNotes:
      "The Mandal Commission (1980/1990), Indra Sawhney (1992) creamy-layer ruling, and the 102nd Amendment's constitutional status for the NCBC are the three essential legal-institutional anchors; recent dominant-caste reservation-demand movements (Jat/Patel/Maratha agitations) are a strong, contemporary illustration of the category's internal contestation expected in the 'recent changes' half.",
    sourceNote: SOURCE_B("8(c)"),
  },
];
