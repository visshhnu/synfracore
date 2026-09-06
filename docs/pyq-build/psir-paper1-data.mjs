// UPSC Civil Services Mains PSIR (Political Science & International Relations)
// Optional Paper I -- PYQ + Model Answer data file.
// All 28 questions below are real questions from the 2023 UPSC CSE Mains PSIR
// Optional Paper I (exam held 24 September 2023, morning session). Verified
// verbatim against TWO INDEPENDENT full-paper transcriptions that matched each
// other exactly in wording, question numbering and marks: (1) a bilingual
// (Hindi/English) official-format scanned reproduction published by PW OnlyIAS
// (pwonlyias.com, "PSIR Optional Paper-01"), and (2) an English-only
// reproduction published by Next IAS (next-ias.com, "UPSC Mains 2023 PSIR
// (Optional) Paper-I"). Both were further cross-checked against independent
// topic summaries on Synopsis IAS (synopsisias.com, which publishes one blog
// post per sub-question titled with the near-verbatim question text) and
// Edukemy (edukemy.com/blog), which matched in content, wording and marks.
// See gen.mjs header for the required data shape.
//
// Word-limit note: the official paper prints "in about 150 words each" only
// for the two five-part "Comment on the following" questions (Q1 and Q5, 10
// marks per sub-part). It does not print a word limit for the 15- and
// 20-mark questions (Q2-4, Q6-8); this file applies UPSC's well-documented
// general convention for those (approx. 250 words for 15 marks, approx. 350
// words for 20 marks), the same convention used in the Geography Paper I
// PYQ file -- these values are the convention, not literal paper text.

const SOURCE_A = (q) =>
  `UPSC CSE Mains 2023, PSIR Optional Paper I, Section A, Q${q}. Verified verbatim against two independent full-paper transcriptions matching each other exactly: a bilingual (Hindi/English) official-format scanned reproduction (PW OnlyIAS archive, pwonlyias.com) and an English-only reproduction (Next IAS archive, next-ias.com). Cross-checked further against topic-wise question summaries on Synopsis IAS (synopsisias.com) and Edukemy (edukemy.com), which matched in content, wording and marks.`;

const SOURCE_B = (q) =>
  `UPSC CSE Mains 2023, PSIR Optional Paper I, Section B, Q${q}. Verified verbatim against two independent full-paper transcriptions matching each other exactly: a bilingual (Hindi/English) official-format scanned reproduction (PW OnlyIAS archive, pwonlyias.com) and an English-only reproduction (Next IAS archive, next-ias.com). Cross-checked further against topic-wise question summaries on Synopsis IAS (synopsisias.com) and Edukemy (edukemy.com), which matched in content, wording and marks.`;

export const COLLECTION = {
  slug: "upsc-psir-optional-paper-1-pyq",
  subject: "psir",
  title: "UPSC PSIR Optional Paper I — PYQ & Model Answers (2023)",
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
    questionText: "Normative approach in Political Science",
    modelAnswer:
      "The normative approach studies politics through the lens of what OUGHT to be, rather than merely describing what IS -- it is prescriptive and value-laden, concerned with justice, rights, the good life and the ideal state, tracing back to Plato and Aristotle and running through the Western political-philosophy canon (Hobbes, Locke, Rousseau, Rawls).\n\nCore features: it treats concepts like liberty, equality and justice as objects of philosophical inquiry rather than measurable variables; it uses deductive, textual and historical methods rather than statistical observation; and it explicitly makes value judgments about which arrangements are desirable.\n\nThe approach was eclipsed during the mid-20th-century Behavioural Revolution, which dismissed normative theory as unscientific and unfalsifiable, privileging empirical, value-free political science instead. David Easton's 'decline of political theory' thesis (1951) is the classic statement of this eclipse.\n\nHowever, the post-behavioural turn -- catalysed by real-world crises (Vietnam, civil rights) that value-neutral empiricism could not address -- rehabilitated normative theory. Rawls' 'A Theory of Justice' (1971) is widely credited with reviving it as a rigorous discipline. Today mainstream political science treats normative and empirical approaches as complementary: the empirical describes political reality, the normative evaluates and prescribes what political arrangements should look like.",
    examinerNotes:
      "Candidates should place the normative approach in its historical arc -- classical dominance, behavioural eclipse, post-behavioural revival (ideally naming Rawls and Easton) -- rather than only defining it in the abstract. A common gap is failing to contrast it explicitly with the empirical/behavioural approach, which the question implicitly invites.",
    sourceNote: SOURCE_A("1(a)"),
  },
  {
    section: "A",
    questionNumber: "1(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Multicultural perspective on rights",
    modelAnswer:
      "The multicultural perspective, most associated with Will Kymlicka and Bhikhu Parekh, argues that standard liberal individual rights are insufficient for genuine equality in culturally plural societies, because they treat citizens as undifferentiated individuals and ignore the disadvantages minority cultures face against a dominant majority culture.\n\nMulticulturalists therefore argue for GROUP-DIFFERENTIATED rights alongside individual rights: Kymlicka distinguishes self-government rights (autonomy for national minorities, e.g. indigenous peoples), polyethnic rights (support for immigrant groups to express cultural practices, e.g. exemptions from generally applicable laws), and special representation rights (guaranteed political representation for disadvantaged groups). The underlying claim is that formal equality (identical rights for all) can produce substantive inequality when cultures start from unequal social positions.\n\nCritics (from liberal universalists like Brian Barry) argue multicultural rights can entrench illiberal practices within minority groups, harm internal dissenters (especially women), and fragment common citizenship. India's own constitutional practice -- Articles 29-30 (minority educational/cultural rights), personal laws, and reservations for STs/SCs/OBCs -- is frequently cited as a real-world multicultural-rights framework balancing group accommodation against individual liberty.",
    examinerNotes:
      "Naming Kymlicka's threefold rights typology (self-government/polyethnic/special representation) is the key differentiator of a strong answer. Candidates should also flag the standard liberal-universalist critique (illiberalism within groups) for balance, and an Indian example strengthens the answer considerably.",
    sourceNote: SOURCE_A("1(b)"),
  },
  {
    section: "A",
    questionNumber: "1(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "State of Nature as State of War (Hobbes)",
    modelAnswer:
      "For Hobbes (Leviathan, 1651), the state of nature -- the hypothetical condition of humans without a common political authority -- is a state of war, not because humans are constantly fighting, but because of the ever-present, unregulated POSSIBILITY of violence arising from three causes: competition (scarce resources drive men to invade for gain), diffidence (fear of others' pre-emptive attack drives men to attack pre-emptively themselves), and glory (the desire for reputation drives men to demand respect through force).\n\nCrucially, Hobbes grounds this in his account of natural equality: since even the weakest can kill the strongest (through cunning or combination), no one is secure, producing a condition where 'every man is enemy to every man', and life is 'solitary, poor, nasty, brutish and short'. Without a common power to enforce agreements, no productive activity (agriculture, trade, industry, arts) is possible.\n\nThis bleak state of war is not a historical claim but a logical/analytical device to justify the necessity of the social contract: rational individuals, driven by fear of death and desire for commodious living, surrender their natural rights to an absolute sovereign (the Leviathan) in exchange for peace and security -- making Hobbes the philosophical founder of the modern absolutist justification for state authority.",
    examinerNotes:
      "Strong answers name and briefly explain all three causes of conflict (competition, diffidence, glory) rather than only quoting 'nasty, brutish and short'. Candidates should connect the state of war explicitly to the social-contract argument that follows from it -- treating it as a standalone description without its argumentative purpose is an incomplete answer.",
    sourceNote: SOURCE_A("1(c)"),
  },
  {
    section: "A",
    questionNumber: "1(d)",
    marks: 10,
    wordLimit: 150,
    questionText: "Foucault's concept of power",
    modelAnswer:
      "Michel Foucault breaks decisively from the classical (sovereignty-based) conception of power as a possession held by the state/sovereign and exercised repressively, top-down, over subjects. Instead, Foucault treats power as diffuse, relational, and productive: it is not something one 'has' but something that circulates through a capillary network of social relations, institutions and discourses (his phrase: power is 'everywhere').\n\nKey features: power is productive, not merely repressive -- it produces knowledge, subjects, truth-regimes and norms of 'normal' behaviour, rather than simply forbidding. Power and knowledge are mutually constitutive ('power/knowledge') -- disciplines like psychiatry, criminology and medicine both generate knowledge about individuals and simultaneously exercise power over them.\n\nFoucault traces the shift from sovereign power (spectacular, violent, exercised on the body, e.g. public execution) to disciplinary power (subtle, continuous, exercised through surveillance and normalization in modern institutions -- prisons, schools, hospitals, barracks). His concept of the Panopticon (Bentham's prison design, where inmates internalize the possibility of being watched) illustrates how modern power operates through self-regulation rather than external coercion -- making individuals the agents of their own discipline. This decentred, productive view of power has become foundational to post-structuralist political theory.",
    examinerNotes:
      "Candidates must show the shift Foucault makes from power-as-possession/repression to power-as-relational/productive, ideally naming power/knowledge and disciplinary power with the Panopticon example. A common mistake is describing Foucault's power purely as 'surveillance' without the deeper productive/knowledge-generating dimension the question is really testing.",
    sourceNote: SOURCE_A("1(d)"),
  },
  {
    section: "A",
    questionNumber: "1(e)",
    marks: 10,
    wordLimit: 150,
    questionText: "Decline of political theory",
    modelAnswer:
      "The 'decline of political theory' thesis, most associated with David Easton's 1951 essay of that title, describes the mid-20th-century displacement of traditional normative/speculative political theory by the rising Behavioural Revolution in American political science.\n\nCauses: the behaviouralists (Easton himself, along with figures like Lasswell) argued classical political theory was unscientific -- unfalsifiable, value-laden, historically descriptive rather than analytically rigorous -- and pushed instead for a value-free, empirical science of politics modelled on the natural sciences, using quantification, hypothesis-testing and observable behaviour (voting, elite decision-making, group activity) as its data. Political philosophy's traditional concerns (justice, the good life, the ideal state) were dismissed as metaphysical speculation outside science's proper domain.\n\nConsequence: normative theory was marginalised in university curricula and research funding through the 1950s-60s, with 'political science' increasingly equated with behavioural/empirical methodology alone.\n\nHowever, the decline proved temporary: real-world crises the value-neutral behavioural approach could not adequately address (Vietnam War, civil rights movement, urban unrest) triggered the post-behavioural revolution (Easton again, ironically, was central to this too), and Rawls' 'A Theory of Justice' (1971) is widely credited with fully reviving rigorous normative theorising, restoring it as a core, legitimate branch of political science alongside empirical approaches.",
    examinerNotes:
      "Examiners expect Easton's essay to be named explicitly, along with the behavioural-revolution cause and the post-behavioural revival that reversed the decline. A common shortfall is describing only the decline without noting its reversal, which the broader scholarly consensus treats as equally important context.",
    sourceNote: SOURCE_A("1(e)"),
  },
  {
    section: "A",
    questionNumber: "2(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "Success of contemporary democracies lies in the State limiting its own power. Explain.",
    modelAnswer:
      "Introduction: A defining feature of contemporary constitutional democracy, distinguishing it from majoritarian or authoritarian rule, is that the state voluntarily binds and limits its own power even while claiming legitimate authority -- a paradox at the heart of liberal-constitutionalist success.\n\nMechanisms of self-limitation: (i) Constitutionalism -- a written or entrenched constitution places the state's own founding act beyond ordinary legislative revision, subjecting government itself to higher law (constitutional supremacy). (ii) Separation of powers and checks and balances (Montesquieu) -- dividing authority across legislature, executive and judiciary prevents any single organ, including the state's dominant branch, from accumulating unchecked power. (iii) Independent judiciary and judicial review -- courts can strike down state action that exceeds constitutional limits, as seen in India's basic structure doctrine (Kesavananda Bharati, 1973), which even restrains Parliament's amending power. (iv) Fundamental rights as a limit on state action -- bills of rights explicitly carve out zones where the state may not intrude, regardless of majority will. (v) Federalism and decentralisation -- distributing power vertically across levels of government prevents concentration at the centre. (vi) Free press, independent election commissions and civil-society oversight function as informal checks reinforcing formal limits.\n\nWhy this produces success: unrestrained power, however well-intentioned, tends toward abuse (Lord Acton's dictum) and undermines the very legitimacy democracy depends on for stability. By committing to self-limitation, democratic states create predictable rule of law that protects minority rights against majoritarian excess (Madison's concern in the Federalist Papers), enables peaceful alternation of power (since no incumbent can entrench itself indefinitely), and sustains citizen trust and voluntary compliance rather than relying purely on coercion.\n\nCounter-considerations: excessive fragmentation of power can also produce gridlock, and some scholars (e.g., studies of 'democratic backsliding' in Hungary, Turkey, and concerns raised about India's institutional erosion) show that self-limiting mechanisms can themselves be eroded by an entrenched executive, meaning the practice of self-limitation requires continuous institutional vigilance, not a one-time constitutional design.\n\nConclusion: Contemporary democratic success rests less on the state's positive capacity than on credible, institutionalised self-restraint -- constitutionalism, separation of powers, judicial review and rights -- that converts raw political power into legitimate, accountable authority.",
    examinerNotes:
      "This is a 20-mark conceptual question; full marks require naming concrete mechanisms (constitutionalism, separation of powers, judicial review, rights, federalism) rather than a generic 'democracy is good' answer, plus at least one real example (India's basic structure doctrine is the strongest go-to). A nuanced answer should also flag the backsliding/erosion risk to show the limitation is not automatic or permanent.",
    sourceNote: SOURCE_A("2(a)"),
  },
  {
    section: "A",
    questionNumber: "2(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Rawls' idea of the 'liberal self' is too individualistic. Explain, in this context, the communitarian critique of Rawls' theory of justice.",
    modelAnswer:
      "Rawls' theory of justice (A Theory of Justice, 1971) is built on the device of the 'original position' behind a 'veil of ignorance', where rational, mutually disinterested individuals choose principles of justice without knowing their own social position, talents or conception of the good. This presupposes a conception of the self as prior to and independent of its ends, attachments and social roles -- an 'unencumbered self' capable of standing apart from its community, culture and relationships to make impartial rational choices.\n\nThe communitarian critique, led principally by Michael Sandel (Liberalism and the Limits of Justice, 1982), argues this liberal self is philosophically incoherent and empirically false: real individuals are 'situated selves', constituted BY their communal attachments (family, culture, tradition, religion) rather than merely possessing them as external attributes they could shed at will. Sandel argues Rawls' self, stripped of all particular ends to reach the original position, becomes an empty, characterless abstraction incapable of the very practical reasoning Rawls requires of it.\n\nOther communitarians extend this: Alasdair MacIntyre (After Virtue) argues morality is only intelligible within a tradition's narrative context, not from a neutral standpoint; Charles Taylor argues identity is dialogically constructed through social recognition; Michael Walzer (Spheres of Justice) argues justice itself is plural and community-relative, not a single universal formula derivable from an abstract original position.\n\nImplication: because Rawls treats the right (fair procedures) as prior to the good (substantive communal values), communitarians argue his liberalism cannot adequately value community, tradition or shared identity -- treating them merely as individual preferences rather than constitutive goods, which is precisely what critics mean by calling the Rawlsian self 'too individualistic'.",
    examinerNotes:
      "Sandel must be named as the primary critic with his 'unencumbered self' vs 'situated self' framing; MacIntyre, Taylor and Walzer as supporting voices strengthen the answer. Candidates should explicitly connect the critique back to the original position/veil of ignorance mechanism, not just assert 'communitarians disagree with Rawls' in the abstract.",
    sourceNote: SOURCE_A("2(b)"),
  },
  {
    section: "A",
    questionNumber: "2(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "'Credo of Relevance' in post-behaviouralism advocates the importance of action science. Analyze.",
    modelAnswer:
      "Post-behaviouralism emerged in the late 1960s as a corrective to the Behavioural Revolution's excessive focus on scientific rigour, quantification and value-neutrality, which critics argued had made political science irrelevant to pressing real-world crises (Vietnam War, urban riots, civil rights struggles) precisely when society needed political science's guidance most.\n\nDavid Easton, in his 1969 presidential address to the American Political Science Association ('The New Revolution in Political Science'), articulated this shift through his famous 'Credo of Relevance', built on two central slogans: 'substance must precede technique' (research questions of real social importance should drive method choice, not the reverse) and 'knowledge is not a way of postponing action but a vehicle for social change' -- political science must actively contribute to solving urgent social problems, not merely describe and predict from a detached, value-free standpoint.\n\n'Action science' is the practical expression of this credo: political scientists are urged to engage directly in social and political action -- policy advocacy, activism, public engagement -- treating scholarship as a tool for reform rather than pure observation. This directly challenged the behaviouralist ideal of the scientist as a neutral, disengaged observer.\n\nEaston's post-behavioural credo effectively rehabilitated normative and applied concerns within a discipline that behaviouralism had pushed toward narrow empiricism -- bridging the earlier 'decline of political theory' by reasserting that political science must serve human values and social betterment, not merely scientific method for its own sake.",
    examinerNotes:
      "Easton's authorship of the Credo of Relevance (1969 APSA address) and its two core slogans ('substance before technique'; knowledge as a vehicle for social change) are the specific facts examiners look for. Candidates should connect this back to the earlier 'decline of political theory' Easton himself had earlier diagnosed, showing the disciplinary arc from theory's decline to its post-behavioural revival.",
    sourceNote: SOURCE_A("2(c)"),
  },
  {
    section: "A",
    questionNumber: "3(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "Fascism displays an ambivalent stance towards parliamentary democracy. Explain.",
    modelAnswer:
      "Introduction: Fascism (Italy under Mussolini, Germany under Hitler) is conventionally understood as the outright negation of parliamentary democracy, yet its historical relationship to it was genuinely ambivalent -- fascism rose THROUGH parliamentary/electoral mechanisms even as it despised and ultimately destroyed them.\n\nThe anti-democratic core: Fascist ideology explicitly rejected liberal-parliamentary principles -- individualism, pluralism, party competition, and majority rule were denounced as decadent, divisive and productive of weak, indecisive government. Fascists championed instead the organic unity of the nation/race under a single charismatic leader (the Fuhrerprinzip), total mobilisation of society, and the one-party corporate state, viewing parliamentary debate as paralysing 'talk-shops' incapable of decisive action in a crisis.\n\nThe ambivalent, tactical use of democratic mechanisms: Despite this ideological hostility, both Mussolini (1922) and Hitler (1933) came to power through ostensibly legal, quasi-parliamentary routes -- exploiting the very institutions they intended to abolish. Mussolini was appointed Prime Minister by the King after the March on Rome, then used parliamentary majorities (secured partly through intimidation) to pass the Acerbo Law and enabling legislation that dismantled multi-party competition from within. Hitler's NSDAP contested and won seats in Weimar elections, and the Reichstag itself passed the Enabling Act (1933) that legally granted Hitler dictatorial powers -- fascism thus used parliamentary procedure as a LADDER to power, discarding it once at the top.\n\nStructural explanation for the ambivalence: fascism arose in crisis conditions (post-WWI economic collapse, fear of communism, perceived parliamentary paralysis) where existing liberal-democratic elites and institutions, weakened and desperate, often facilitated fascist entry rather than resisting it, hoping to co-opt or control fascist movements -- a miscalculation in both Italy and Germany.\n\nConclusion: Fascism's ambivalence toward parliamentary democracy is therefore not a genuine ideological accommodation but a tactical/instrumental relationship: it treats parliamentary institutions as a legitimating pathway to power to be exploited and then eliminated, revealing fascism's fundamentally anti-democratic character beneath a temporarily legalistic façade -- a pattern political scientists continue to study as a template for 'democratic backsliding' via ostensibly legal means in the contemporary era.",
    examinerNotes:
      "Full-mark answers must show BOTH sides of the ambivalence explicitly -- fascism's ideological rejection of parliamentarism AND its tactical use of legal/electoral mechanisms to gain power (Enabling Act, March on Rome) -- rather than treating fascism as simply anti-democratic throughout. Linking this historical pattern to contemporary 'democratic backsliding' debates is a strong differentiator.",
    sourceNote: SOURCE_A("3(a)"),
  },
  {
    section: "A",
    questionNumber: "3(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Affirmative Action Policies draw as much strong criticism as strong support. Analyze this statement in the context of equality.",
    modelAnswer:
      "Affirmative action -- preferential measures (reservations, quotas, targeted opportunities) for historically disadvantaged groups -- sits at a genuine fault line within the concept of equality itself, explaining the intensity of both support and opposition.\n\nCase for support (substantive equality): Formal equality (identical treatment for all) can perpetuate existing inequality when groups start from historically unequal positions -- centuries of caste discrimination, slavery or colonial exclusion cannot be undone by simply removing legal barriers going forward. Affirmative action pursues substantive/compensatory equality, correcting for structural disadvantage and ensuring genuine equality of opportunity, not just equality on paper. In India, this is constitutionally grounded (Articles 15(4), 16(4), 46) and justified by the state's duty to remedy historical caste-based exclusion for SCs/STs/OBCs.\n\nCase for criticism: Critics argue affirmative action itself violates the equality principle by discriminating on group identity (caste, race, gender) rather than individual merit -- creating 'reverse discrimination' against otherwise-qualified individuals from non-beneficiary groups (a central argument in landmark cases like India's Indra Sawhney and the US's Bakke). Critics also argue it can entrench group identities rather than transcend them, produces a 'creamy layer' problem where benefits accrue disproportionately to already-advantaged members within a reserved category, and risks stigmatising beneficiaries as having succeeded through preference rather than merit.\n\nAnalysis: the debate reflects a genuine philosophical tension between formal equality (same rules for all) and substantive equality (equal real-world outcomes/opportunity) -- there is no neutral resolution, which is precisely why affirmative action remains one of democratic theory's most persistently contested policy areas, with courts (in India and elsewhere) attempting case-by-case balancing rather than settling the underlying principle.",
    examinerNotes:
      "The question explicitly asks for analysis 'in the context of equality' -- answers that merely list pros and cons of reservation without tying them back to the formal-vs-substantive equality distinction miss the conceptual core the question is testing. Indian constitutional examples (Indra Sawhney, creamy layer) strengthen the answer.",
    sourceNote: SOURCE_A("3(b)"),
  },
  {
    section: "A",
    questionNumber: "3(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "Eurocentrism is both the target and the motive force of the post-colonial political theory. Discuss.",
    modelAnswer:
      "Post-colonial political theory (Edward Said, Homi Bhabha, Gayatri Spivak, Frantz Fanon, Partha Chatterjee) takes Eurocentrism -- the assumption that European historical experience, categories and values represent universal, normative standards against which all other societies are measured -- as its central object of critique, and simultaneously as the very provocation that gave rise to the field.\n\nEurocentrism as TARGET: Said's Orientalism (1978) exposed how Western scholarship constructed 'the Orient' as an inferior, static, irrational Other against which a rational, dynamic Europe defined itself -- knowledge production itself was implicated in colonial domination. Post-colonial theorists critique Eurocentric universalism in political concepts themselves -- the nation-state, secularism, progress, development, even 'democracy' -- as historically parochial European constructs presented falsely as neutral, universal categories, while erasing or subordinating non-Western political thought and experience (Chatterjee's critique of 'derivative discourse' nationalism in colonised societies).\n\nEurocentrism as MOTIVE FORCE: paradoxically, it was the direct experience of European colonial domination and its Eurocentric justificatory ideology (the 'civilising mission', social Darwinism, Orientalist scholarship) that provoked colonised intellectuals to develop post-colonial theory in the first place -- Fanon's Wretched of the Earth emerged directly from the violence of French colonialism in Algeria; Said's own experience as a Palestinian intellectual in the West shaped Orientalism. Post-colonial theory would not exist as a field without Eurocentrism to react against and dismantle.\n\nConclusion: this dual relationship -- Eurocentrism as both the object being dismantled and the historical condition that necessitated the dismantling project -- is precisely why the statement calls Eurocentrism both 'target' and 'motive force': post-colonial theory is constitutively defined by, even as it seeks to transcend, the Eurocentric structures it critiques.",
    examinerNotes:
      "Candidates should explicitly separate the two roles the question names (target vs motive force) with distinct evidence for each, naming Said (Orientalism) as the anchor thinker at minimum, ideally alongside Fanon and Chatterjee. A common gap is only describing Eurocentrism critique without addressing how it also generated the field historically.",
    sourceNote: SOURCE_A("3(c)"),
  },
  {
    section: "A",
    questionNumber: "4(a)",
    marks: 20,
    wordLimit: 350,
    questionText: "Buddhist thought on Dhamma facilitates the emancipation of political action. Explain.",
    modelAnswer:
      "Introduction: Buddhist political thought, centred on the concept of Dhamma (righteous law/ethical order, distinct from mere royal command or raw power), offers a normative framework that seeks to liberate ('emancipate') political action from arbitrary force and self-interest, subordinating statecraft to ethical ends.\n\nDhamma as moral constraint on political power: In classical Buddhist political thought (most fully realised historically in Emperor Ashoka's post-Kalinga reign), Dhamma functions as a higher ethical order that legitimate political authority must serve -- the ruler (Chakravartin, the 'righteous wheel-turning monarch') derives legitimacy not from conquest or coercion but from ruling in accordance with Dhamma: non-violence (ahimsa), compassion (karuna), truthfulness, welfare of subjects, and religious/social tolerance. This reframes political action away from the pursuit of power (Danda, force) as an end in itself, toward power as a means constrained by and answerable to ethical ends.\n\nAmbedkar's modern reading: B.R. Ambedkar's 'The Buddha and His Dhamma' explicitly interprets Buddhist Dhamma as a social-political emancipatory doctrine, not merely private spiritual practice -- he saw Dhamma as offering a 'universal morality that protects the weak from the strong, and safeguards the growth of the individual', a doctrine of social equality and liberation directly usable against caste oppression, which is precisely why Ambedkar embraced Buddhism as the vehicle for Dalit political emancipation (the 1956 mass conversion).\n\nEmancipatory mechanism: By grounding political legitimacy in universal ethical principles rather than force, birth-based hierarchy, or self-interest, Dhamma-based political thought de-legitimises oppressive uses of state power (arbitrary violence, exploitation, caste-based domination) and provides an internal, moral check on rulers independent of external enforcement -- a form of self-restraint analogous to (and historically prior to) later constitutionalist limits on power.\n\nLimitations: Dhamma's emancipatory potential is aspirational/moral rather than institutionally enforceable -- it depends on the ruler's voluntary ethical commitment (as with Ashoka) rather than structural checks, and critics note it does not by itself prescribe a specific political system, functioning more as a moral compass than an operational constitution.\n\nConclusion: Buddhist Dhamma facilitates emancipation of political action by re-anchoring political authority in universal ethics, welfare and non-violence rather than raw power -- a normative resource later explicitly mobilised, through Ambedkar, as a genuinely emancipatory political ideology for India's most marginalised.",
    examinerNotes:
      "Ashoka's Dhamma-based kingship and Ambedkar's political (not merely religious) reading of Buddhism are the two anchoring examples examiners expect; omitting Ambedkar in particular is a significant gap for a 20-mark PSIR (not Religious Studies) answer, since it is what makes the Dhamma-emancipation link concretely political and contemporary rather than purely classical.",
    sourceNote: SOURCE_A("4(a)"),
  },
  {
    section: "A",
    questionNumber: "4(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "\"The legal subordination of one sex to another is wrong in itself, and now one of the chief hindrances to human development.\" (J.S. Mill). Comment.",
    modelAnswer:
      "This statement, from J.S. Mill's 'The Subjection of Women' (1869), makes two distinct claims that together form one of liberal feminism's foundational arguments: first, that women's legal subordination is intrinsically wrong (a matter of justice/principle, not merely inefficiency), and second, that it is instrumentally harmful, actively obstructing overall human progress.\n\nOn the intrinsic-wrong claim: Mill argues the subjection of women rests on no rational justification -- it is a relic of the 'law of the strongest' surviving from a pre-civilised era of brute force, dressed up post hoc in claims about natural female inferiority that Mill dismisses as unproven, since women have never been allowed the freedom needed to demonstrate their actual capacities. As a committed utilitarian and liberal, Mill holds that restricting any individual's liberty and legal personhood purely on account of an ascribed characteristic (sex) violates the basic principle of equal freedom he defends in 'On Liberty'.\n\nOn the instrumental-harm claim: Mill argues excluding half of humanity from education, the professions, and public life is a colossal waste of talent and productive capacity, directly retarding social, economic and moral progress -- 'human development' in Mill's sense includes intellectual and civilisational advancement, which is stunted when women's contributions are legally foreclosed. He further argues that unequal marriage relations corrupt the character of men (accustomed to unchecked domestic power) as much as they oppress women.\n\nSignificance: this dual argument -- justice-based AND consequentialist -- made Mill's essay a landmark of 19th-century liberal feminism, prefiguring both rights-based and capability/development-based (Sen, Nussbaum) justifications for gender equality that remain central to feminist political theory today.",
    examinerNotes:
      "Strong answers separate Mill's two distinct arguments (intrinsic wrong vs instrumental hindrance to development) explicitly, since the question's quoted sentence itself makes exactly that dual claim. Linking Mill's utilitarian/liberal framework, and optionally forward to the capability approach, shows depth beyond mere paraphrase.",
    sourceNote: SOURCE_A("4(b)"),
  },
  {
    section: "A",
    questionNumber: "4(c)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Sri Aurobindo's idea of Swaraj has deep significance in the Indian social, political and cultural history. Analyze.",
    modelAnswer:
      "Sri Aurobindo's conception of Swaraj went well beyond a narrow political demand for self-government, developing instead into a civilisational and spiritual doctrine of national self-realisation that shaped multiple strands of the Indian freedom movement.\n\nPolitical significance: As a leading figure of the 'extremist'/assertive nationalist wing (alongside Tilak, Bipin Chandra Pal) during the early 20th century Swadeshi movement, Aurobindo rejected the Moderates' petition-and-reform approach, arguing Swaraj must mean genuine, complete political independence achieved through active resistance (passive resistance, boycott, self-reliance) -- radicalising the freedom movement's political demand well before Gandhi's later mass mobilisation and directly inspiring the shift from constitutional protest to assertive nationalism.\n\nCultural/spiritual significance: For Aurobindo, Swaraj was inseparable from cultural and spiritual self-recognition -- India's political subjugation was, in his view, bound up with a loss of civilisational self-confidence under colonial cultural domination. True Swaraj required India to rediscover and reassert its own spiritual and cultural genius (drawing on Vedantic philosophy) rather than merely imitating Western political forms, framing the nation itself in quasi-spiritual terms (India as 'Bharat Mata', the motherland with a sacred, evolutionary destiny -- most vividly in his Uttarpara speech, 1909, following his acquittal in the Alipore bomb case).\n\nSocial significance: this spiritually-grounded nationalism sought to unify Indians across sectarian and caste lines around a shared civilisational identity, contributing an integrative cultural-nationalist current alongside the more instrumentally political (Congress moderate) and later mass-mobilisational (Gandhian) strands of the movement.\n\nLegacy: Aurobindo's Swaraj thus operates on three simultaneous registers -- as a political goal (independence), a cultural project (civilisational self-rediscovery), and a spiritual philosophy (individual and national self-realisation as linked, evolutionary processes) -- explaining why it carries deep, lasting significance across all three dimensions of Indian history the question names.",
    examinerNotes:
      "The question explicitly asks for three dimensions (social, political, cultural) -- answers confined only to Aurobindo's political radicalism miss the spiritual/cultural register that is actually distinctive about his thought compared to other nationalist leaders. Naming the Uttarpara speech and the Swadeshi-era 'extremist' politics anchors the answer concretely.",
    sourceNote: SOURCE_A("4(c)"),
  },
  // ---------------- SECTION B ----------------
  {
    section: "B",
    questionNumber: "5(a)",
    marks: 10,
    wordLimit: 150,
    questionText: "Imprint of the British Constitution on the Indian Constitution",
    modelAnswer:
      "Despite India adopting a written, federal constitution (unlike Britain's unwritten, unitary one), the Indian Constitution borrows extensively from British constitutional practice and convention, reflecting nearly two centuries of colonial administrative and legal inheritance.\n\nKey borrowings: the parliamentary form of government itself -- a bicameral legislature, a nominal head of state (President, mirroring the Crown) versus a real executive (Council of Ministers headed by the PM, collectively responsible to the lower house); the office and functions of the Speaker; the rule of law and independence of the judiciary; the institution of a single, integrated judicial system; the concept of a unitary, professional civil service; parliamentary procedures and legislative drafting conventions; the writ jurisdiction of courts (habeas corpus, mandamus, etc., adapted from English common law); and the bicameral committee system.\n\nWhile India departed from Britain on fundamentals -- a written, rigid (though amendable) constitution with judicial review and an entrenched federal structure, absent in Britain's parliamentary sovereignty model -- the day-to-day machinery of cabinet government, ministerial responsibility, and legislative-executive relations remain deeply and recognisably British in origin, making Britain's constitution one of the most influential single sources for the Constituent Assembly's drafting choices, alongside the US, Irish, Canadian and other borrowed elements.",
    examinerNotes:
      "A crisp answer names specific borrowed features (parliamentary executive, Speaker, civil service, rule of law, writs) rather than a vague 'India copied Britain'. Noting the key DIFFERENCE (written/rigid constitution and judicial review vs British parliamentary sovereignty) shows a more complete grasp than listing similarities alone.",
    sourceNote: SOURCE_B("5(a)"),
  },
  {
    section: "B",
    questionNumber: "5(b)",
    marks: 10,
    wordLimit: 150,
    questionText: "Environmentalism of the poor",
    modelAnswer:
      "'Environmentalism of the poor' (a term associated with scholars like Ramachandra Guha, Joan Martinez-Alier and the broader environmental-justice literature) describes grassroots environmental movements led by poor, often rural or indigenous, communities whose immediate material survival -- access to forests, water, land and common-property resources -- is directly threatened by resource extraction, development projects or state/corporate encroachment.\n\nThis is distinguished from Western 'full-stomach' or 'post-material' environmentalism (wilderness preservation, wildlife conservation for aesthetic/recreational value), which typically emerges among affluent populations once basic material needs are secured. Environmentalism of the poor is instead a livelihood struggle: it links ecological conservation directly to subsistence, equity and social justice rather than abstract conservationism.\n\nIndian examples are foundational to this literature: the Chipko movement (Himalayan villagers, especially women, resisting commercial deforestation to protect subsistence forest resources), the Narmada Bachao Andolan (resisting displacement from large dam construction), and Chico Mendes-style rubber-tapper movements in Brazil internationally. These movements frame environmental protection as inseparable from questions of distributive justice, indigenous rights and resistance to unequal resource appropriation by state and capital -- making 'environmentalism of the poor' as much a social-justice movement as an ecological one.",
    examinerNotes:
      "Naming Guha/Martinez-Alier and contrasting with Western 'full-stomach' environmentalism is the key conceptual distinction examiners want. Chipko and Narmada Bachao Andolan are the standard, expected Indian illustrations -- omitting concrete examples weakens an otherwise correct conceptual answer.",
    sourceNote: SOURCE_B("5(b)"),
  },
  {
    section: "B",
    questionNumber: "5(c)",
    marks: 10,
    wordLimit: 150,
    questionText: "Functions of District Planning Committee",
    modelAnswer:
      "The District Planning Committee (DPC), mandated under Article 243ZD (inserted by the 74th Constitutional Amendment Act, 1992), is a statutory body at the district level tasked with consolidating the plans prepared by Panchayats and Municipalities within the district into one coherent District Development Plan.\n\nKey functions: (i) consolidating rural (Panchayat) and urban (Municipality) plans, harmonising overlapping or conflicting priorities into a unified spatial and developmental plan for the whole district; (ii) considering matters of common interest between Panchayats and Municipalities, including spatial planning, sharing of water and other physical/natural resources, integrated infrastructure development, and environmental conservation; (iii) forwarding the consolidated draft development plan to the State Government; (iv) ensuring balanced allocation of resources and coordinated development across both rural and urban local bodies within the district, preventing fragmented, uncoordinated local planning.\n\nComposition: at least four-fifths of DPC members are to be elected from among elected members of the district's Panchayats and Municipalities, in proportion to the rural-urban population ratio, giving local elected representatives -- not just bureaucrats -- primary control over district-level planning.\n\nIn practice, DPCs across most Indian states remain weakly institutionalised, meeting infrequently and often subordinated to state planning departments, meaning the constitutional vision of genuine bottom-up integrated district planning is only partially realised -- a frequently cited gap in the decentralisation literature.",
    examinerNotes:
      "Article 243ZD and the DPC's core function of CONSOLIDATING rural + urban plans into one district plan are the specific facts examiners check for. A strong answer also notes the composition requirement (4/5ths elected members) and the well-documented real-world gap between constitutional design and weak DPC implementation.",
    sourceNote: SOURCE_B("5(c)"),
  },
  {
    section: "B",
    questionNumber: "5(d)",
    marks: 10,
    wordLimit: 150,
    questionText: "Satyagraha and Indian Nationalism",
    modelAnswer:
      "Satyagraha ('truth-force' or 'holding firmly to truth'), Gandhi's original philosophy and method of non-violent resistance developed first in South Africa and brought to India from 1915, became the defining strategic and moral framework of Indian nationalism's mass phase.\n\nCore principles: Satyagraha combines active civil resistance to injustice (non-cooperation, civil disobedience, boycott) with an absolute commitment to non-violence (ahimsa) and truth, seeking to convert the opponent through moral suasion and self-suffering rather than defeat them through coercion -- distinguishing it from mere passive resistance, since Satyagraha is deliberately active and confrontational, just non-violently so.\n\nRole in Indian nationalism: Satyagraha transformed Indian nationalism from an elite, constitutionalist movement (the early Congress's petitions and moderate methods) into a genuine MASS movement capable of mobilising peasants, workers and ordinary citizens across religious and caste lines -- demonstrated concretely in the Champaran and Kheda Satyagrahas (1917-18), the Non-Cooperation Movement (1920-22), the Salt Satyagraha/Dandi March (1930), and the Quit India Movement (1942). It gave the movement moral legitimacy both domestically and internationally, embarrassing British colonial rule's claims to civilisational superiority by contrasting colonial violence against demonstrably non-violent resisters.\n\nSignificance: Satyagraha thus provided Indian nationalism with a uniquely effective, morally persuasive and mass-mobilisable strategic method, fundamentally shaping both the movement's character and its ultimate success, while also becoming an internationally influential model (later inspiring Martin Luther King Jr. and other civil-rights movements).",
    examinerNotes:
      "Distinguishing Satyagraha from mere 'passive resistance' (it is active, not passive) is a key conceptual point examiners check. At least two named movements (Champaran/Kheda, Salt Satyagraha, Quit India) should anchor the answer's claim about mass mobilisation.",
    sourceNote: SOURCE_B("5(d)"),
  },
  {
    section: "B",
    questionNumber: "5(e)",
    marks: 10,
    wordLimit: 150,
    questionText: "National Commission for Minorities",
    modelAnswer:
      "The National Commission for Minorities (NCM) is a statutory body established under the National Commission for Minorities Act, 1992, tasked with safeguarding and promoting the interests of India's notified religious minorities -- currently Muslims, Christians, Sikhs, Buddhists, Parsis and Jains.\n\nKey functions: evaluating the progress of minority development under the Union and states; monitoring the working of safeguards for minorities provided in the Constitution and in laws enacted by Parliament/state legislatures; investigating specific complaints regarding deprivation of minority rights; making recommendations on effective implementation of safeguards for minority protection; conducting studies on discrimination against minorities and recommending remedial measures; and reporting periodically to the Central Government on the state of minority welfare.\n\nProcedural powers: the NCM has powers akin to a civil court while investigating complaints -- summoning witnesses, requiring document production, and examining witnesses on oath -- though its recommendations are advisory, not legally binding on government, which is a frequently noted limitation.\n\nSignificance and critique: the NCM operationalises India's constitutional commitments to minority protection (Articles 29-30) at the institutional level, but critics point to its lack of binding enforcement power, limited resources, and inconsistent government follow-through on its recommendations as constraining its actual effectiveness -- a common theme in broader debates on India's rights-protection institutional architecture.",
    examinerNotes:
      "The 1992 Act, the list of notified minorities, and the advisory (non-binding) nature of NCM recommendations are the specific facts to include. A brief critical note on enforcement limitations elevates the answer above a purely descriptive listing of functions.",
    sourceNote: SOURCE_B("5(e)"),
  },
  {
    section: "B",
    questionNumber: "6(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "Discuss the major provisions of the 74th Constitutional Amendment Act. Do you think that the Act remains an 'unfulfilled dream'? Argue your case.",
    modelAnswer:
      "Introduction: The 74th Constitutional Amendment Act, 1992 constitutionalised urban local self-government in India, inserting Part IXA and the Twelfth Schedule, mirroring the parallel 73rd Amendment for rural Panchayati Raj.\n\nMajor provisions: (i) It mandates three types of urban local bodies (Municipalities) based on population/urban character -- Nagar Panchayats (transitional areas), Municipal Councils (smaller urban areas), and Municipal Corporations (larger urban areas). (ii) It mandates direct election of all Municipality members, with reservation of seats for SCs, STs (proportional to population) and women (not less than one-third), and provision for reservation of Chairperson posts. (iii) It fixes a five-year term for Municipalities, with mandatory elections before term expiry or within six months of dissolution. (iv) It establishes State Election Commissions to conduct municipal elections and State Finance Commissions to recommend devolution of finances between the state and local bodies. (v) It mandates constitution of District Planning Committees (Article 243ZD) and Metropolitan Planning Committees (Article 243ZE) for consolidated spatial planning. (vi) The Twelfth Schedule lists 18 functional items (urban planning, water supply, slum improvement, public health, etc.) that states MAY devolve to Municipalities.\n\nArgument that it remains an 'unfulfilled dream': The Amendment's central weakness is that functional, financial and functionary devolution (the '3 Fs') to Municipalities is discretionary ('may transfer'), not mandatory, on state governments -- leading to highly uneven, often minimal, actual empowerment across states. Municipalities in most Indian cities remain financially starved (heavily dependent on state grants, weak own-revenue/property-tax collection), lack administrative control over staff (who often report to state departments, not elected municipal bodies), and District/Metropolitan Planning Committees are weakly institutionalised or dormant in most states -- undermining the integrated planning vision. Parastatal agencies (Development Authorities, Water/Sewerage Boards) frequently continue to control key urban functions that should belong to elected Municipalities, diluting genuine urban self-government. Given rapid, unplanned Indian urbanisation, this gap between constitutional design and ground reality is increasingly consequential.\n\nConclusion: While the 74th Amendment created the constitutional architecture for urban local self-government and achieved genuine gains (regular elections, reservation, formal institutional existence), the discretionary nature of devolution has left real functional and fiscal empowerment incomplete in most states -- supporting the characterisation of it as, on balance, an 'unfulfilled dream' rather than a fully realised one.",
    examinerNotes:
      "The question has two explicit parts -- provisions AND the 'unfulfilled dream' judgment with reasoning -- both must be developed; a purely descriptive answer of provisions without taking and justifying a position loses significant marks. The discretionary ('may transfer') nature of the Twelfth Schedule devolution is the single most important fact for the argumentative half.",
    sourceNote: SOURCE_B("6(a)"),
  },
  {
    section: "B",
    questionNumber: "6(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "How does NITI Aayog as a 'policy think tank with shared vision' visualize the reorganization of planning in India? Justify your answer.",
    modelAnswer:
      "NITI Aayog (National Institution for Transforming India) replaced the Planning Commission in January 2015, marking a deliberate shift from centralised, top-down five-year planning to a consultative, advisory 'think tank' model built around cooperative and competitive federalism.\n\nVisualised reorganisation of planning: (i) From directive to advisory role -- unlike the Planning Commission, which allocated plan funds to states, NITI Aayog has no such financial allocation power (that shifted to the Finance Commission and direct ministry transfers); it functions purely as a knowledge and policy think tank, offering strategic and technical advice rather than commanding compliance. (ii) 'Bottom-up' federalism -- NITI Aayog's Governing Council, comprising all state Chief Ministers and Lt. Governors, is designed to give states a direct voice in shaping national development strategy, replacing the earlier more centre-driven National Development Council process, embodying 'Team India' cooperative federalism. (iii) Long-term vision documents replacing rigid Five-Year Plans -- NITI Aayog produces 15-year Vision documents, 7-year Strategy documents and 3-year Action Agendas, allowing more flexible, evolving planning responsive to changing economic conditions rather than fixed plan periods. (iv) Competitive federalism -- initiatives like the Aspirational Districts Programme and state performance indices (health, education, water) are designed to foster healthy inter-state competition and data-driven governance rather than uniform central directives. (v) Sectoral specialisation through Verticals (Agriculture, Health, Governance, etc.) generating research-based policy inputs.\n\nJustification: this reorganisation reflects the post-1991 liberalised economy's reduced reliance on centralised resource allocation, and a political recognition that India's diversity requires state-specific, flexible strategies rather than uniform central diktat -- making NITI Aayog's 'shared vision' framing a genuine (if imperfect, given continued Finance Ministry dominance over actual fund allocation) departure from the Planning Commission model.",
    examinerNotes:
      "Candidates should clearly contrast NITI Aayog's advisory-only role against the Planning Commission's fund-allocating power, and name specific mechanisms (Governing Council, Vision/Strategy/Action Agenda documents, Aspirational Districts) rather than describing it only in generic 'more cooperative' terms. A brief critical note on continued centralisation of actual financial power adds balance.",
    sourceNote: SOURCE_B("6(b)"),
  },
  {
    section: "B",
    questionNumber: "6(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "The Constitution of India is the 'cornerstone of a nation'. (Granville Austin). Analyze.",
    modelAnswer:
      "Granville Austin, in 'The Indian Constitution: Cornerstone of a Nation' (1966), argued the Indian Constitution was not merely a legal-administrative document but the foundational instrument that consciously sought to construct and hold together a new nation out of extraordinary social, religious, linguistic and regional diversity, immediately after a traumatic Partition.\n\nAustin identified three seamless, interwoven objectives the Constitution pursued simultaneously: (i) national unity and integrity -- given Partition's violence and the challenge of integrating princely states and diverse linguistic/religious communities, the Constitution had to actively construct a shared national identity, not merely assume one already existed; (ii) a democratic political framework -- universal adult franchise, parliamentary government, fundamental rights and an independent judiciary, establishing self-rule and political legitimacy for a vast, largely illiterate population at a time when this was globally exceptional for a newly independent state; (iii) social revolution -- the Constitution explicitly committed the new state to transforming an unjust, hierarchical (caste-based, feudal) social order through directive principles, abolition of untouchability, reservation provisions and land-reform enabling clauses, rather than merely preserving existing social arrangements.\n\nAnalysis: what makes the Constitution a 'cornerstone' rather than simply a legal charter, in Austin's framing, is precisely this fusion of nation-building, democracy and social transformation into a single document -- it was deliberately designed as an instrument of social engineering to construct the nation it governed, not just to organise an already-formed one. The Constituent Assembly debates reflect this consciously nation-building intent (e.g., the deliberate accommodation of linguistic and religious diversity through federalism and minority protections).\n\nSignificance today: this framing remains influential in explaining why Indian constitutionalism assigns the judiciary an unusually active nation-preserving role (e.g., the basic structure doctrine) -- the Constitution is treated not just as supreme law but as the guarantor of national coherence itself.",
    examinerNotes:
      "Austin's three-objective framework (national unity/integrity, democracy, social revolution) is the specific analytical content examiners expect verbatim in substance; a generic answer praising the Constitution without this tripartite structure misses the actual thesis being quoted. Connecting to the basic structure doctrine as a contemporary echo of 'cornerstone' status is a strong addition.",
    sourceNote: SOURCE_B("6(c)"),
  },
  {
    section: "B",
    questionNumber: "7(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "Does the actual working of Indian federalism conform to the centralizing tendencies in Indian polity? Give reasons for your answer.",
    modelAnswer:
      "Introduction: India's Constitution creates a federal structure with a pronounced unitary bias -- K.C. Wheare famously called it 'quasi-federal'; Granville Austin termed it 'cooperative federalism'. Examining actual practice since 1950 shows the working of Indian federalism has, on balance, exhibited strong centralising tendencies, though counter-trends toward decentralisation have grown since the 1990s.\n\nEvidence of centralisation: (i) Constitutional design itself favours the Centre -- residuary powers vest with the Union (unlike the US), a single integrated judiciary and All-India Services under central control, Article 356 (President's Rule) historically used to dismiss state governments for partisan reasons (notably in the 1970s-80s, though curtailed post S.R. Bommai, 1994), and Article 249/250 allowing Union legislation on State List subjects under specified conditions. (ii) Fiscal centralisation -- states remain heavily dependent on Central transfers (Finance Commission awards, GST compensation, centrally sponsored schemes with conditionalities), constraining genuine fiscal autonomy; the shift to GST (2017) further centralised indirect tax rate-setting authority in the GST Council. (iii) One-party-dominant periods (Congress system till the late 1960s, and again strong single-party majorities at the Centre in the 2010s-20s) have historically correlated with greater central assertiveness over states, including use of central agencies and Governors as perceived instruments of central control -- a live contemporary controversy in opposition-ruled states. (iv) Planning Commission-era central allocation of development funds long constrained state fiscal choices, though this has been partially reformed with NITI Aayog.\n\nCounter-evidence (decentralising trends): the rise of a genuinely multi-party, coalition-era polity since the late 1980s-1990s has forced greater bargaining with states; the 73rd/74th Amendments constitutionalised a third tier of local government; the GST Council itself, despite centralising rate-setting, operationalises formal Centre-state co-decision-making; and judicial federalism (S.R. Bommai's restraints on Article 356 misuse) has curbed the most egregious centralising practice.\n\nConclusion: the actual working of Indian federalism has predominantly conformed to centralising tendencies embedded in its constitutional design and reinforced by fiscal dependency and periods of single-party dominance, even as episodic institutional and political counter-pressures (coalition politics, judicial restraint on Article 356, local government) have periodically pushed back -- making Indian federalism best described as consistently Centre-leaning in practice, not merely on paper.",
    examinerNotes:
      "Strong answers move beyond textbook 'quasi-federal' labelling to cite specific mechanisms of centralisation (residuary powers, Article 356 history and Bommai's curtailment, fiscal dependency, GST Council, central agency/Governor controversies) with genuine 'give reasons' argumentation, and should acknowledge counter-trends for balance rather than a one-sided answer.",
    sourceNote: SOURCE_B("7(a)"),
  },
  {
    section: "B",
    questionNumber: "7(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "The main goal of the Fundamental Duties in the Indian Constitution is to generate civic responsibility among the citizens. Explain.",
    modelAnswer:
      "Fundamental Duties were inserted into the Indian Constitution as Article 51A (Part IVA) by the 42nd Constitutional Amendment Act, 1976, on the recommendation of the Swaran Singh Committee, drawing partial inspiration from the erstwhile USSR's constitutional model of citizen duties.\n\nThe eleven duties (originally ten, an eleventh -- on parental duty to provide education -- added by the 86th Amendment, 2002) include: upholding the Constitution, ideals and institutions; cherishing the freedom struggle's noble ideals; upholding sovereignty, unity and integrity; defending the country; promoting harmony and common brotherhood transcending religious, linguistic and regional diversities; renouncing practices derogatory to women's dignity; preserving composite culture; protecting the natural environment; developing scientific temper and the spirit of inquiry; safeguarding public property; and striving for excellence.\n\nHow this generates civic responsibility: unlike Fundamental Rights (justiciable, enforceable against the state), Fundamental Duties are explicitly non-justiciable moral/civic obligations owed BY citizens TO the nation and society -- they operationalise the constitutional theory that rights and duties are correlative, reminding citizens that democratic freedom carries reciprocal responsibility, not just entitlement. By constitutionally codifying duties like environmental protection, communal harmony and protection of public property, the provision seeks to cultivate civic virtue, national consciousness and voluntary responsible citizenship -- shaping public morality and education/curricular content -- rather than relying purely on legal coercion for socially responsible behaviour.\n\nLimitations: because they are unenforceable, courts have occasionally invoked them interpretively (e.g., in environmental jurisprudence) to support judgments, but Fundamental Duties largely function as an aspirational moral compass rather than an operative legal mechanism -- a frequently noted critique of their practical impact.",
    examinerNotes:
      "The 42nd Amendment/Swaran Singh Committee origin and the non-justiciable nature of Duties (distinguishing them from Rights) are the essential facts. Candidates should note at least the environmental-jurisprudence use of Duties by courts to show they are not entirely without legal effect, adding nuance beyond 'purely symbolic'.",
    sourceNote: SOURCE_B("7(b)"),
  },
  {
    section: "B",
    questionNumber: "7(c)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "Dr. Ambedkar's clarion call, \"Educate, Agitate and Organize\", strategizes the Dalit movement towards achieving civil liberty. Discuss.",
    modelAnswer:
      "B.R. Ambedkar's slogan 'Educate, Agitate, Organize' -- delivered to close his address at the All India Depressed Classes Conference (1942) -- encapsulates a coherent three-stage strategic doctrine for Dalit political emancipation, moving from individual empowerment to collective political power.\n\nEducate: Ambedkar considered education the essential precondition for social and political emancipation -- only an educated Dalit community could understand its own oppression structurally, claim its constitutional and legal rights effectively, and produce the leadership needed for sustained political struggle. His own life (Columbia and LSE-educated) exemplified this belief that knowledge was the tool to dismantle both practical disadvantage and the ideological justifications (religious/caste doctrine) underpinning untouchability.\n\nAgitate: Ambedkar paired education with direct, assertive protest against caste oppression -- exemplified in the Mahad Satyagraha (1927, asserting Dalits' right to use public water tanks) and the Kalaram Temple entry movement (1930, asserting temple-entry rights) -- rejecting passive acceptance of caste hierarchy and instead demanding rights through visible, organised confrontation with discriminatory social practice.\n\nOrganize: Ambedkar recognised that individual protest was insufficient without sustained institutional political organisation -- he founded the Independent Labour Party and later the Scheduled Castes Federation, and pushed for separate electorates/reserved political representation (the Poona Pact, 1932, after the Communal Award controversy with Gandhi) to secure durable, institutionalised Dalit political power rather than relying on episodic protest alone.\n\nAchieving civil liberty: together, this strategy moved the Dalit movement beyond mere social reform appeals to caste-Hindu conscience, toward autonomous political mobilisation and constitutional guarantee -- culminating in Ambedkar's central role drafting the Indian Constitution's fundamental rights, abolition of untouchability (Article 17), and reservation provisions, converting the slogan's strategic logic into enforceable constitutional civil liberty.",
    examinerNotes:
      "Each of the three verbs should be explained with a distinct concrete example (education -- Ambedkar's own scholarship and stress on schooling; agitate -- Mahad/Kalaram Satyagrahas; organize -- Independent Labour Party/Scheduled Castes Federation, Poona Pact) rather than treated as a generic three-word slogan. Connecting the strategy's culmination to Ambedkar's constitutional drafting role strengthens the 'achieving civil liberty' framing the question demands.",
    sourceNote: SOURCE_B("7(c)"),
  },
  {
    section: "B",
    questionNumber: "8(a)",
    marks: 20,
    wordLimit: 350,
    questionText:
      "The rise of caste politics is to be attributed to both regional aspirations and electoral manifestations. Comment.",
    modelAnswer:
      "Introduction: The prominence of caste as a political mobilising force in post-independence India is not a simple 'traditional' survival but a modern political phenomenon, shaped jointly by regional identity assertion and the specific dynamics of electoral democracy -- the two forces the question asks to be examined together.\n\nRegional aspirations dimension: Caste politics has been deeply entangled with regional/sub-national assertion against perceived North Indian or upper-caste-dominated central hegemony. The Dravidian movement in Tamil Nadu (Justice Party, later DMK/AIADMK) fused anti-Brahmin caste mobilisation with Tamil regional-linguistic identity against North Indian/Sanskritic cultural dominance. In Uttar Pradesh and Bihar, the rise of OBC-based parties (Samajwadi Party, Rashtriya Janata Dal) and Dalit-based parties (Bahujan Samaj Party) mobilised caste blocs partly as a claim to regional political power historically monopolised by upper-caste elites, converting caste identity into a vehicle for regional political assertion against a Congress-dominated, upper-caste-led central political order.\n\nElectoral manifestation dimension: India's first-past-the-post electoral system and universal adult franchise created powerful incentives for caste-based vote-bank mobilisation -- caste groups, especially numerically significant intermediate and backward castes, became attractive targets for political parties seeking winnable electoral coalitions (Rajni Kothari's 'caste in politics, politics in caste' thesis). The Mandal Commission implementation (1990) was a watershed electoral moment, converting OBC identity into a nationally salient, quota-linked political category almost overnight, catalysing a wave of OBC-based party formation and caste-based electoral arithmetic ('social engineering' coalitions, e.g. BSP's later Dalit-Brahmin alliance experiments) that persists in Indian elections today.\n\nInteraction of the two: regional aspirations provided the underlying social grievance and identity base, while the mechanics of competitive electoral democracy provided the incentive structure and opportunity for political entrepreneurs to organise, articulate and electorally monetise these caste-regional identities -- neither factor alone fully explains the phenomenon; it is their combination that produced modern Indian caste politics' particular, regionally variegated character.\n\nConclusion: Caste politics in India is thus best understood as a product of democratic modernity itself -- regional assertion providing the social content, and electoral competition the institutional mechanism -- rather than a simple residue of traditional social hierarchy.",
    examinerNotes:
      "Full marks require covering BOTH dimensions named in the question with distinct regional examples (Dravidian movement, UP/Bihar OBC-Dalit parties) AND the electoral mechanics (FPTP incentives, Mandal Commission, Kothari's thesis), plus explicit discussion of how the two interact -- a one-sided answer covering only caste-vote-bank politics or only regional identity misses half the question.",
    sourceNote: SOURCE_B("8(a)"),
  },
  {
    section: "B",
    questionNumber: "8(b)",
    marks: 15,
    wordLimit: 250,
    questionText:
      "The decade 1989-1999 has created an epochal shift in the Indian party system at the national level. Identify the major national trends in the party system during this era.",
    modelAnswer:
      "The decade 1989-1999 marks the definitive transition of the Indian party system from the long-dominant 'Congress system' (Rajni Kothari's term for single-party dominance with fragmented opposition) to a genuinely competitive multi-party, coalition-based national polity.\n\nMajor trends: (i) End of single-party majority governments -- from the 1989 general election onward, no single party won an outright Lok Sabha majority until 2014, producing a succession of coalition and minority governments (National Front 1989, various United Front coalitions 1996-98, BJP-led coalitions from 1998), fundamentally altering how national governments were formed and sustained. (ii) Rise of the BJP as a genuine national alternative to Congress -- the Ram Janmabhoomi mobilisation (Ayodhya movement, rath yatra) and Hindutva-based consolidation grew the BJP from a marginal party into a central pole of national politics by the decade's end (forming government in 1998 and 1999). (iii) Emergence and consolidation of powerful state-based/regional parties (DMK, AIADMK, Samajwadi Party, Bahujan Samaj Party, Telugu Desam Party, Shiv Sena, etc.) as indispensable coalition partners at the Centre, converting Indian politics into a genuinely federalised, multi-level party system. (iv) Institutionalisation of OBC politics following Mandal Commission implementation (1990), fracturing the earlier Congress social coalition and creating new caste-based party formations. (v) Growing ideological polarisation between Hindutva-based BJP-led coalitions and a heterogeneous, loosely Congress/Left/regional 'secular' opposition bloc, a polarisation that has structured national coalition formation ever since.\n\nSignificance: together these trends replaced the one-party-dominant system with a competitive, coalition-dependent, federally-fragmented, ideologically-polarised party system -- the structural template within which Indian national politics has operated through the 2000s and beyond, until the return of single-party majority government from 2014.",
    examinerNotes:
      "Candidates should identify multiple distinct trends (end of Congress dominance/coalition era, BJP's rise via Ayodhya mobilisation, regional party consolidation, Mandal-driven OBC politics) rather than describing only one dimension (e.g., only Hindutva rise, or only coalition politics) -- the question's plural 'trends' explicitly rewards breadth.",
    sourceNote: SOURCE_B("8(b)"),
  },
  {
    section: "B",
    questionNumber: "8(c)",
    marks: 15,
    wordLimit: 250,
    questionText: "Do you agree that over the years the Supreme Court has become a forum for policy evolution? Justify your answer.",
    modelAnswer:
      "Yes -- the Supreme Court of India has, over decades, moved substantially beyond adjudicating individual disputes to actively shaping public policy, particularly through the vehicle of Public Interest Litigation (PIL) and expansive interpretation of Article 21 (right to life and personal liberty).\n\nEvidence: (i) Environmental policy -- cases like M.C. Mehta's litigation series effectively drove vehicular pollution norms (CNG conversion in Delhi), industrial relocation, and forest conservation policy, with the Court issuing detailed, continuing operational directions functioning almost as an environmental regulator. (ii) Right to food and social welfare -- the PUCL vs Union of India (2001) 'right to food' case led the Court to mandate and monitor the Mid-Day Meal Scheme and PDS reforms nationally over many years. (iii) Governance and institutional reform -- Vishaka Guidelines (1997) on workplace sexual harassment created binding law in the absence of legislation (later codified by Parliament); the Vineet Narain case reshaped CBI/investigative agency autonomy; the collegium system for judicial appointments was itself judicially created (Second and Third Judges Cases). (iv) Economic/resource-allocation policy -- the 2G spectrum and coal-block allocation judgments effectively set policy on natural-resource allocation methodology (mandating auctions). (v) Basic structure doctrine (Kesavananda Bharati) itself represents the Court asserting a permanent supervisory role over constitutional evolution.\n\nJustification/critique: This expanded role is often justified as filling governance/legislative vacuums and enforcing fundamental rights meaningfully (judicial activism), but critics argue it represents judicial overreach into the executive/legislative domain, raising separation-of-powers and democratic-accountability concerns, since unelected judges are making resource-allocation and administrative policy choices properly belonging to elected branches.\n\nConclusion: the pattern across environment, welfare, governance and economic policy domains over several decades substantiates the claim that the Supreme Court has indeed become a significant forum for policy evolution, alongside its traditional adjudicatory role.",
    examinerNotes:
      "A strong 'yes, and justify' answer needs multiple concrete case examples spanning different policy domains (environment, food security, workplace harassment, agency autonomy, resource allocation) rather than one or two generic PIL mentions, plus the standard activism-vs-overreach critique for balance and genuine 'justify your answer' argumentation.",
    sourceNote: SOURCE_B("8(c)"),
  },
];
