// JEE Main — Full Mock Paper 1
// Official pattern (verified via NTA sources, re-confirmed 2026-09-02):
// Physics/Chemistry/Mathematics, each with Section A (20 MCQs, compulsory)
// + Section B (5 Numerical Value Questions, compulsory) = 25 Q/subject,
// 75 Q total, 300 marks, 180-minute limit. Marking: +4 correct / -1
// incorrect, UNIFORM across MCQ and NVQ alike (NTA changed this starting
// the 2025 cycle — the older +4/0 no-penalty-on-NVQ rule no longer
// applies; multiple independent sources confirm this uniform scheme holds
// for both 2026 sessions).
// SOURCE: authored from NCERT Class 11/12 Physics, Chemistry and
// Mathematics textbooks (the syllabus JEE Main is explicitly based on) and
// NTA's publicly released JEE Main information bulletins describing exam
// pattern/topic weightage — NOT copied from any official NTA question
// paper, which this build deliberately does not reproduce verbatim.

export const HEADER_LABEL = "JEE Main — Full Mock Paper 1";

export const PAPER = {
  slug: "jee-main-practice-1",
  title: "JEE Main Full Mock Paper 1",
  examType: "jee-main",
  focusTags: ["Physics", "Chemistry", "Mathematics", "NCERT", "JEE Main"],
  questionCount: 75,
  difficulty: "mixed",
  sortOrder: 1,
  timeLimitMinutes: 180,
  positiveMarks: 4,
  negativeMarks: 1,
};

const SRC_PHYSICS = "Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.";
const SRC_CHEMISTRY = "Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.";
const SRC_MATHS = "Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.";

export const SECTIONS = [
  {
    name: "Physics",
    subject: "Physics",
    sourceNote: SRC_PHYSICS,
    questions: [
      { topic: "Units and Measurements", stem: "The dimensional formula of Planck's constant is the same as that of:", options: ["Energy", "Angular momentum", "Force", "Power"], correct: 1, explanation: "Planck's constant h has units of J.s, identical to the dimensional formula of angular momentum [ML^2T^-1]." },
      { topic: "Kinematics", stem: "A particle moves along a straight line such that its displacement varies as s = t^3 - 6t^2 + 9t. The time at which its velocity is zero is:", options: ["t=1s only", "t=1s and t=3s", "t=0 only", "t=2s only"], correct: 1, explanation: "v = ds/dt = 3t^2 - 12t + 9 = 3(t-1)(t-3); v=0 at t=1s and t=3s." },
      { topic: "Laws of Motion", stem: "A block of mass 2 kg rests on a frictionless surface and is acted on by a horizontal force of 10 N. The acceleration of the block is:", options: ["2 m/s^2", "5 m/s^2", "10 m/s^2", "20 m/s^2"], correct: 1, explanation: "a = F/m = 10/2 = 5 m/s^2, by Newton's second law." },
      { topic: "Work, Energy and Power", stem: "A body of mass 1 kg is dropped from a height of 5 m. Its kinetic energy just before hitting the ground (taking g=10 m/s^2) is:", options: ["25 J", "50 J", "100 J", "10 J"], correct: 1, explanation: "By conservation of energy, KE = mgh = 1*10*5 = 50 J." },
      { topic: "System of Particles and Rotational Motion", stem: "The moment of inertia of a solid sphere of mass M and radius R about a tangent to its surface is:", options: ["(2/5)MR^2", "(7/5)MR^2", "(2/3)MR^2", "MR^2"], correct: 1, explanation: "Using the parallel axis theorem: I_tangent = I_center + MR^2 = (2/5)MR^2 + MR^2 = (7/5)MR^2." },
      { topic: "Gravitation", stem: "If the radius of the Earth were to shrink by 1% while its mass remains constant, the acceleration due to gravity on its surface would:", options: ["Decrease by about 1%", "Decrease by about 2%", "Increase by about 2%", "Remain unchanged"], correct: 2, explanation: "g = GM/R^2; since g is inversely proportional to R^2, a 1% decrease in R increases g by approximately 2% (differentiating: dg/g = -2dR/R)." },
      { topic: "Mechanical Properties of Solids", stem: "A wire of length L and cross-sectional area A is stretched by a force F, producing an extension x. Young's modulus of the wire's material is given by:", options: ["FL/(Ax)", "Fx/(AL)", "FA/(Lx)", "F/(ALx)"], correct: 0, explanation: "Y = (F/A)/(x/L) = FL/(Ax), the standard definition of Young's modulus." },
      { topic: "Thermal Properties of Matter", stem: "Two rods of the same material and cross-sectional area but different lengths L and 2L are connected in series between two heat reservoirs at different temperatures. In steady state, the ratio of the temperature drop across the shorter rod to that across the longer rod is:", options: ["1:2", "2:1", "1:1", "1:4"], correct: 0, explanation: "In steady-state series conduction, the same heat current flows through both rods; since thermal resistance is proportional to length, the temperature drop is also proportional to length, giving a ratio of L:2L = 1:2." },
      { topic: "Thermodynamics", stem: "For an ideal monatomic gas undergoing an adiabatic process, the relationship between pressure P and volume V is given by PV^gamma = constant, where gamma equals:", options: ["1.4", "1.67", "1.33", "1.0"], correct: 1, explanation: "For a monatomic ideal gas, gamma = Cp/Cv = (5/2R)/(3/2R) = 5/3 ≈ 1.67." },
      { topic: "Kinetic Theory", stem: "At what temperature will the root mean square speed of oxygen molecules be double its value at 27 degrees Celsius, all other conditions remaining constant?", options: ["1200 K", "927 degrees Celsius", "600 K", "54 degrees Celsius"], correct: 1, explanation: "v_rms is proportional to sqrt(T); to double v_rms, T must quadruple. 27C = 300K, so 4*300K = 1200K = 927 degrees Celsius." },
      { topic: "Oscillations", stem: "A particle executes SHM with amplitude A and angular frequency omega. Its speed at a displacement of A/2 from the mean position is:", options: ["omega*A*sqrt(3)/2", "omega*A/2", "omega*A", "omega*A*sqrt(3)"], correct: 0, explanation: "v = omega*sqrt(A^2 - x^2); at x=A/2, v = omega*sqrt(A^2 - A^2/4) = omega*A*sqrt(3)/2." },
      { topic: "Waves", stem: "Two sound waves of frequencies 256 Hz and 260 Hz are sounded together. The number of beats heard per second is:", options: ["2", "4", "256", "516"], correct: 1, explanation: "Beat frequency = |f1 - f2| = |260 - 256| = 4 beats per second." },
      { topic: "Electric Charges and Fields", stem: "Two point charges of +4 microC and +9 microC are placed at a distance d apart. At what distance from the +4 microC charge, on the line joining them, is the net electric field zero?", options: ["0.4d", "0.5d", "0.6d", "2d/3"], correct: 0, explanation: "Setting the fields equal: k(4)/x^2 = k(9)/(d-x)^2, giving 2/x = 3/(d-x) (taking square roots, since both charges are positive the null point lies between them), so 2(d-x) = 3x, 2d = 5x, x = 0.4d." },
      { topic: "Current Electricity", stem: "Three resistors of 2 ohm, 3 ohm, and 6 ohm are connected in parallel. The equivalent resistance of the combination is:", options: ["1 ohm", "11 ohm", "2 ohm", "0.5 ohm"], correct: 0, explanation: "1/R_eq = 1/2 + 1/3 + 1/6 = 3/6 + 2/6 + 1/6 = 6/6 = 1, so R_eq = 1 ohm." },
      { topic: "Moving Charges and Magnetism", stem: "A charged particle moving with velocity v enters a uniform magnetic field B perpendicular to its velocity. The radius of its circular path is given by:", options: ["r = mv/(qB)", "r = qB/(mv)", "r = mB/(qv)", "r = qv/(mB)"], correct: 0, explanation: "Setting magnetic force equal to centripetal force: qvB = mv^2/r, giving r = mv/(qB)." },
      { topic: "Electromagnetic Induction", stem: "A conducting rod of length L moves with velocity v perpendicular to a uniform magnetic field B, and also perpendicular to its own length. The EMF induced across the ends of the rod is:", options: ["BLv", "BL/v", "Bv/L", "BLv^2"], correct: 0, explanation: "Motional EMF induced in a rod moving perpendicular to a magnetic field: EMF = BLv." },
      { topic: "Alternating Current", stem: "In an AC circuit, the peak value of the voltage is 220*sqrt(2) volts. The rms value of the voltage is:", options: ["110 V", "220 V", "220*sqrt(2) V", "440 V"], correct: 1, explanation: "V_rms = V_peak/sqrt(2) = 220*sqrt(2)/sqrt(2) = 220 V." },
      { topic: "Ray Optics", stem: "An object is placed at a distance of 20 cm from a convex lens of focal length 10 cm. The image is formed at a distance from the lens of:", options: ["10 cm", "20 cm", "30 cm", "40 cm"], correct: 1, explanation: "Using 1/v - 1/u = 1/f with u=-20cm, f=10cm: 1/v = 1/10 - 1/20 = 1/20, so v=20cm." },
      { topic: "Dual Nature of Radiation and Matter", stem: "The de Broglie wavelength of an electron accelerated through a potential difference V is inversely proportional to:", options: ["V", "sqrt(V)", "V^2", "1/V"], correct: 1, explanation: "KE = qV = p^2/2m, so p is proportional to sqrt(V); since lambda = h/p, lambda is inversely proportional to sqrt(V)." },
      { topic: "Atoms and Nuclei", stem: "The half-life of a radioactive sample is 10 days. The fraction of the sample remaining undecayed after 30 days is:", options: ["1/2", "1/4", "1/8", "1/16"], correct: 2, explanation: "30 days = 3 half-lives, so the remaining fraction is (1/2)^3 = 1/8." },
      { topic: "Kinematics — NVQ", stem: "A car starts from rest and accelerates uniformly at 2 m/s^2 for 5 seconds. The distance (in metres) covered by the car in this time is:", answerType: "numeric", numericAnswer: 25, explanation: "s = ut + (1/2)at^2 = 0 + (1/2)(2)(5^2) = 25 m." },
      { topic: "Work, Energy and Power — NVQ", stem: "A spring with force constant 200 N/m is compressed by 0.1 m. The elastic potential energy (in joules) stored in the spring is:", answerType: "numeric", numericAnswer: 1, explanation: "PE = (1/2)kx^2 = (1/2)(200)(0.1)^2 = (1/2)(200)(0.01) = 1 J." },
      { topic: "Current Electricity — NVQ", stem: "A cell of EMF 6 V and internal resistance 1 ohm is connected to an external resistance of 2 ohm. The current (in amperes) flowing in the circuit is:", answerType: "numeric", numericAnswer: 2, explanation: "I = EMF/(R+r) = 6/(2+1) = 2 A." },
      { topic: "Ray Optics — NVQ", stem: "A concave mirror has a radius of curvature of 20 cm. Its focal length (in centimetres) is:", answerType: "numeric", numericAnswer: 10, explanation: "f = R/2 = 20/2 = 10 cm." },
      { topic: "Thermodynamics — NVQ", stem: "An ideal gas absorbs 500 J of heat and does 200 J of work on its surroundings. The change in internal energy (in joules) of the gas is:", answerType: "numeric", numericAnswer: 300, explanation: "By the first law, delta U = Q - W = 500 - 200 = 300 J." },
    ],
  },
  {
    name: "Chemistry",
    subject: "Chemistry",
    sourceNote: SRC_CHEMISTRY,
    questions: [
      { topic: "Some Basic Concepts of Chemistry", stem: "The number of moles of oxygen atoms present in 1 mole of Ca(NO3)2 is:", options: ["2", "3", "6", "9"], correct: 2, explanation: "Ca(NO3)2 has 2 nitrate groups, each with 3 oxygen atoms, giving 6 oxygen atoms per formula unit, hence 6 moles of oxygen atoms per mole of compound." },
      { topic: "Structure of Atom", stem: "The number of unpaired electrons in the ground-state electronic configuration of chromium (Z=24, [Ar]3d5 4s1) is:", options: ["4", "5", "6", "1"], correct: 2, explanation: "Chromium's anomalous configuration [Ar]3d5 4s1 places one electron in each of the five 3d orbitals plus one in the 4s orbital, all with parallel spin per Hund's rule, giving 6 unpaired electrons total." },
      { topic: "Classification of Elements and Periodicity", stem: "The correct order of increasing atomic radius for the elements Na, Mg, Al, Si (all Period 3) is:", options: ["Na < Mg < Al < Si", "Si < Al < Mg < Na", "Mg < Na < Si < Al", "Al < Si < Na < Mg"], correct: 1, explanation: "Atomic radius decreases across a period due to increasing effective nuclear charge, so the increasing order is Si < Al < Mg < Na." },
      { topic: "Chemical Bonding and Molecular Structure", stem: "The hybridization of the central sulfur atom in SF6 is:", options: ["sp3", "sp3d", "sp3d2", "sp2"], correct: 2, explanation: "SF6 has 6 bond pairs and 0 lone pairs around sulfur, requiring sp3d2 hybridization for an octahedral geometry." },
      { topic: "States of Matter", stem: "At STP, the volume occupied by 1 mole of an ideal gas is approximately:", options: ["11.2 L", "22.4 L", "44.8 L", "1 L"], correct: 1, explanation: "At STP (0 degrees C, 1 atm), 1 mole of an ideal gas occupies 22.4 L, the molar volume." },
      { topic: "Thermodynamics", stem: "For a reaction to be spontaneous at all temperatures, the signs of delta H and delta S must be:", options: ["delta H negative, delta S positive", "delta H positive, delta S negative", "delta H positive, delta S positive", "delta H negative, delta S negative"], correct: 0, explanation: "delta G = delta H - T*delta S; if delta H is negative and delta S is positive, delta G is negative at every temperature, guaranteeing spontaneity at all T." },
      { topic: "Equilibrium", stem: "For the reaction N2 + 3H2 <-> 2NH3, if the equilibrium concentrations are [N2]=1M, [H2]=2M, [NH3]=4M, the equilibrium constant Kc is:", options: ["2", "4", "8", "16"], correct: 0, explanation: "Kc = [NH3]^2 / ([N2][H2]^3) = (4)^2 / (1 * 2^3) = 16/8 = 2." },
      { topic: "Redox Reactions", stem: "The oxidation number of chromium in K2Cr2O7 is:", options: ["+3", "+6", "+7", "+2"], correct: 1, explanation: "K is +1 (x2=+2), O is -2 (x7=-14); for neutrality, 2 + 2x - 14 = 0, giving x = +6 for each chromium atom." },
      { topic: "s-Block Elements", stem: "Among the alkali metals, the one with the highest first ionization enthalpy is:", options: ["Li", "Na", "K", "Cs"], correct: 0, explanation: "Ionization enthalpy decreases down a group as atomic size increases; lithium, the smallest alkali metal, has the highest first ionization enthalpy among them." },
      { topic: "Organic Chemistry — Basic Principles", stem: "The IUPAC name of the compound CH3-CH(CH3)-CH2-CH3 is:", options: ["n-Butane", "2-Methylbutane", "2,2-Dimethylpropane", "Pentane"], correct: 1, explanation: "The longest chain has 4 carbons with a methyl substituent at position 2, giving the IUPAC name 2-methylbutane." },
      { topic: "Hydrocarbons", stem: "The reaction of an alkene with HBr in the presence of peroxides follows anti-Markovnikov addition, known as the:", options: ["Wurtz reaction", "Kharasch effect (peroxide effect)", "Friedel-Crafts reaction", "Cannizzaro reaction"], correct: 1, explanation: "The Kharasch (peroxide) effect describes anti-Markovnikov addition of HBr to alkenes in the presence of peroxides, proceeding via a free-radical mechanism — notably, this reversal is observed only for HBr, not HCl or HI." },
      { topic: "Environmental Chemistry", stem: "The primary pollutant responsible for the formation of classical (London-type) smog is:", options: ["Ozone", "Sulfur dioxide, combined with fog and smoke", "Nitrogen dioxide", "Carbon monoxide"], correct: 1, explanation: "Classical/London smog forms from a combination of smoke, fog, and sulfur dioxide, common in cold, humid climates with high coal combustion — distinct from photochemical smog, which forms from NOx/hydrocarbons under sunlight." },
      { topic: "Solid State", stem: "In a simple cubic unit cell, the number of atoms per unit cell is:", options: ["1", "2", "4", "8"], correct: 0, explanation: "A simple cubic cell has 8 corner atoms, each shared among 8 unit cells, contributing 8*(1/8) = 1 atom per unit cell." },
      { topic: "Solutions", stem: "The boiling point of a solution is always _____ the boiling point of the pure solvent, for a non-volatile solute.", options: ["Lower than", "Higher than", "Equal to", "Unrelated to"], correct: 1, explanation: "Dissolving a non-volatile solute lowers the solvent's vapour pressure, requiring a higher temperature to reach the external pressure needed for boiling — hence boiling point elevation." },
      { topic: "Electrochemistry", stem: "The standard EMF of a cell is related to its equilibrium constant K by the equation:", options: ["E-cell = (RT/nF) ln K", "E-cell = -(RT/nF) ln K", "E-cell = nF ln K", "E-cell = RT/K"], correct: 0, explanation: "At equilibrium, delta G = -nFE-cell = -RT ln K, giving E-cell = (RT/nF) ln K." },
      { topic: "Chemical Kinetics", stem: "For a first-order reaction, a plot of ln[A] versus time gives a straight line with slope:", options: ["+k", "-k", "k^2", "1/k"], correct: 1, explanation: "The integrated first-order rate law is ln[A] = ln[A]0 - kt, so a plot of ln[A] vs t is linear with slope -k." },
      { topic: "d and f Block Elements", stem: "Which of the following ions is expected to be colorless in aqueous solution?", options: ["Cu2+", "Fe2+", "Zn2+", "Ti3+"], correct: 2, explanation: "Zn2+ has a completely filled 3d10 configuration, so no d-d electronic transitions are possible, making it colorless — unlike Cu2+, Fe2+, and Ti3+, which have partially filled d-orbitals." },
      { topic: "Coordination Compounds", stem: "The coordination number of the central metal ion in [Co(en)3]3+ (en = ethylenediamine, a bidentate ligand) is:", options: ["3", "6", "2", "9"], correct: 1, explanation: "Each ethylenediamine (en) ligand is bidentate, binding through 2 donor atoms; 3 en ligands contribute 3*2 = 6, giving a coordination number of 6." },
      { topic: "Aldehydes, Ketones and Carboxylic Acids", stem: "The reagent used to distinguish between an aldehyde and a ketone via a positive/negative color-change test is:", options: ["Tollens' reagent", "Sodium hydroxide", "Dilute HCl", "Bromine water only"], correct: 0, explanation: "Tollens' reagent gives a positive silver-mirror test with aldehydes (which are oxidized) but generally not with ketones, providing a reliable distinguishing test." },
      { topic: "Amines", stem: "Aniline reacts with acetic anhydride to form:", options: ["Acetanilide, via acetylation of the amine group", "Aniline hydrochloride", "Benzene", "Nitrobenzene"], correct: 0, explanation: "Acetylation of aniline's -NH2 group with acetic anhydride produces acetanilide (N-phenylacetamide), releasing acetic acid as a byproduct." },
      { topic: "Some Basic Concepts of Chemistry — NVQ", stem: "The number of moles of NaOH (molar mass 40 g/mol) present in 4 grams of NaOH is:", answerType: "numeric", numericAnswer: 0.1, explanation: "Moles = mass/molar mass = 4/40 = 0.1 mol." },
      { topic: "Equilibrium — NVQ", stem: "The pH of a solution with hydrogen ion concentration [H+] = 10^-3 M is:", answerType: "numeric", numericAnswer: 3, explanation: "pH = -log[H+] = -log(10^-3) = 3." },
      { topic: "Thermodynamics — NVQ", stem: "If 2 moles of an ideal gas expand isothermally and reversibly, doing 1000 J of work, and no heat is lost to friction, the heat absorbed by the gas (in joules) is:", answerType: "numeric", numericAnswer: 1000, explanation: "For an isothermal process, delta U = 0, so by the first law, Q = W = 1000 J." },
      { topic: "Solutions — NVQ", stem: "A solution is prepared by dissolving 0.5 mole of solute in 500 mL of solution. The molarity (in mol/L) of the solution is:", answerType: "numeric", numericAnswer: 1, explanation: "Molarity = moles/volume(L) = 0.5/0.5 = 1 mol/L." },
      { topic: "Electrochemistry — NVQ", stem: "A current of 2 amperes is passed through a solution for 500 seconds. The total charge (in coulombs) passed is:", answerType: "numeric", numericAnswer: 1000, explanation: "Q = I*t = 2*500 = 1000 coulombs." },
    ],
  },
  {
    name: "Mathematics",
    subject: "Mathematics",
    sourceNote: SRC_MATHS,
    questions: [
      { topic: "Sets, Relations and Functions", stem: "If A = {1,2,3} and B = {3,4}, then the number of elements in A union B is:", options: ["3", "4", "5", "6"], correct: 1, explanation: "A union B = {1,2,3,4}, which has 4 distinct elements." },
      { topic: "Complex Numbers", stem: "The modulus of the complex number z = 3 + 4i is:", options: ["3", "4", "5", "7"], correct: 2, explanation: "|z| = sqrt(3^2 + 4^2) = sqrt(9+16) = sqrt(25) = 5." },
      { topic: "Quadratic Equations", stem: "The sum of the roots of the quadratic equation 2x^2 - 6x + 3 = 0 is:", options: ["3", "-3", "3/2", "-3/2"], correct: 0, explanation: "For ax^2+bx+c=0, sum of roots = -b/a = -(-6)/2 = 3." },
      { topic: "Permutations and Combinations", stem: "The number of ways to select 3 objects out of 6 distinct objects is:", options: ["18", "20", "120", "216"], correct: 1, explanation: "C(6,3) = 6!/(3!3!) = 720/(6*6) = 20." },
      { topic: "Binomial Theorem", stem: "The number of terms in the binomial expansion of (x+y)^10 is:", options: ["9", "10", "11", "20"], correct: 2, explanation: "The expansion of (x+y)^n has (n+1) terms, so (x+y)^10 has 11 terms." },
      { topic: "Sequences and Series", stem: "The sum of the first 10 terms of the arithmetic progression 2, 4, 6, 8, ... is:", options: ["100", "110", "90", "120"], correct: 1, explanation: "S_n = n/2 * (2a + (n-1)d) = 10/2 * (4 + 9*2) = 5*22 = 110." },
      { topic: "Limits, Continuity and Differentiability", stem: "The value of the limit as x approaches 0 of (sin x)/x is:", options: ["0", "1", "infinity", "undefined"], correct: 1, explanation: "This is a standard limit: lim(x->0) sin(x)/x = 1." },
      { topic: "Integral Calculus", stem: "The value of the definite integral of x from 0 to 2 (i.e., integral of x dx from 0 to 2) is:", options: ["1", "2", "4", "8"], correct: 1, explanation: "Integral of x dx = x^2/2; evaluating from 0 to 2 gives 4/2 - 0 = 2." },
      { topic: "Differential Equations", stem: "The order of the differential equation (d^2y/dx^2) + (dy/dx)^3 + y = 0 is:", options: ["1", "2", "3", "4"], correct: 1, explanation: "The order of a differential equation is the order of the highest derivative present; here it is the second derivative, so the order is 2." },
      { topic: "Coordinate Geometry — Straight Lines", stem: "The slope of the line passing through the points (1,2) and (3,8) is:", options: ["2", "3", "4", "6"], correct: 1, explanation: "Slope = (y2-y1)/(x2-x1) = (8-2)/(3-1) = 6/2 = 3." },
      { topic: "Coordinate Geometry — Circles", stem: "The equation of a circle with center at the origin and radius 5 is:", options: ["x^2+y^2=5", "x^2+y^2=25", "x+y=25", "x^2-y^2=25"], correct: 1, explanation: "The standard equation of a circle centered at the origin is x^2+y^2=r^2; with r=5, this is x^2+y^2=25." },
      { topic: "Conic Sections — Parabola", stem: "The equation y^2 = 8x represents a parabola with the length of its latus rectum equal to:", options: ["2", "4", "8", "16"], correct: 2, explanation: "For y^2=4ax, the latus rectum length is 4a. Here 4a=8, so a=2, and the latus rectum itself is 4a=8." },
      { topic: "3D Geometry", stem: "The distance between the points (1,2,3) and (4,6,3) in three-dimensional space is:", options: ["3", "4", "5", "7"], correct: 2, explanation: "Distance = sqrt((4-1)^2+(6-2)^2+(3-3)^2) = sqrt(9+16+0) = sqrt(25) = 5." },
      { topic: "Vector Algebra", stem: "If vector a = 3i + 4j and vector b = 4i + 3j, the dot product a.b is:", options: ["12", "24", "25", "7"], correct: 1, explanation: "a.b = (3)(4) + (4)(3) = 12 + 12 = 24." },
      { topic: "Statistics and Probability", stem: "The probability of getting an even number when a fair six-sided die is rolled once is:", options: ["1/6", "1/3", "1/2", "2/3"], correct: 2, explanation: "There are 3 even numbers (2,4,6) out of 6 equally likely outcomes, giving a probability of 3/6 = 1/2." },
      { topic: "Trigonometry", stem: "The value of sin(30 degrees) + cos(60 degrees) is:", options: ["0", "1", "1.5", "2"], correct: 1, explanation: "sin(30) = 0.5 and cos(60) = 0.5, so their sum is 0.5+0.5 = 1." },
      { topic: "Matrices and Determinants", stem: "The determinant of the 2x2 matrix [[2,3],[1,4]] is:", options: ["5", "8", "11", "6"], correct: 0, explanation: "Determinant = (2)(4) - (3)(1) = 8 - 3 = 5." },
      { topic: "Mathematical Reasoning", stem: "The negation of the statement 'All students passed the exam' is:", options: ["All students failed the exam", "No student passed the exam", "At least one student did not pass the exam", "Every student did not pass the exam"], correct: 2, explanation: "The negation of a universal statement 'All X are Y' is 'There exists at least one X that is not Y' — i.e., at least one student did not pass." },
      { topic: "Application of Derivatives", stem: "The function f(x) = x^2 has a minimum value at x equal to:", options: ["-1", "0", "1", "2"], correct: 1, explanation: "f'(x) = 2x = 0 at x=0; f''(x)=2>0, confirming a minimum at x=0." },
      { topic: "Application of Integrals", stem: "The area under the curve y=x from x=0 to x=4, bounded by the x-axis, is:", options: ["4", "8", "16", "2"], correct: 1, explanation: "Area = integral of x dx from 0 to 4 = [x^2/2] from 0 to 4 = 16/2 - 0 = 8." },
      { topic: "Sequences and Series — NVQ", stem: "The 10th term of the arithmetic progression with first term 3 and common difference 2 is:", answerType: "numeric", numericAnswer: 21, explanation: "a_n = a + (n-1)d = 3 + 9*2 = 3 + 18 = 21." },
      { topic: "Permutations and Combinations — NVQ", stem: "The number of ways to arrange 4 distinct books on a shelf is:", answerType: "numeric", numericAnswer: 24, explanation: "Number of arrangements = 4! = 4*3*2*1 = 24." },
      { topic: "Integral Calculus — NVQ", stem: "The value of the definite integral of 2x dx from 1 to 3 is:", answerType: "numeric", numericAnswer: 8, explanation: "Integral of 2x dx = x^2; evaluating from 1 to 3 gives 9 - 1 = 8." },
      { topic: "Trigonometry — NVQ", stem: "The value of tan(45 degrees) is:", answerType: "numeric", numericAnswer: 1, explanation: "tan(45 degrees) = 1, a standard trigonometric value." },
      { topic: "Statistics and Probability — NVQ", stem: "The mean of the numbers 2, 4, 6, 8, 10 is:", answerType: "numeric", numericAnswer: 6, explanation: "Mean = (2+4+6+8+10)/5 = 30/5 = 6." },
    ],
  },
];
