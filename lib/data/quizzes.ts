export const runtime = "edge";

export type QuizQuestion = {
  id: string;
  question: string;
  options: string[];
  correct: number;
  explanation: string;
  topic?: string;
  difficulty?: "Easy" | "Medium" | "Hard";
};

export type Flashcard = {
  id: string;
  front: string;
  back: string;
  category?: string;
};

export type QuizSet = {
  id: string;
  title: string;
  type: "mcq" | "flashcard" | "fillblank";
  description: string;
  questions?: QuizQuestion[];
  flashcards?: Flashcard[];
  timeLimit?: number;
};

export type TechQuizzes = { [techSlug: string]: QuizSet[]; };

export const allQuizzes: TechQuizzes = {

// ═══════════════════════════════════════════════════════
// GATE CSE
// ═══════════════════════════════════════════════════════
"gate-cse": [
  {
    id: "gate-cse-ds-q1",
    title: "Data Structures & Algorithms",
    type: "mcq",
    description: "Previous year GATE questions on DS&A — sorting, trees, graphs, complexity",
    timeLimit: 90,
    questions: [
      { id: "g1", topic: "Sorting", difficulty: "Medium",
        question: "Which sorting algorithm has the best worst-case time complexity?",
        options: ["Quick Sort", "Merge Sort", "Heap Sort", "Bubble Sort"],
        correct: 1,
        explanation: "Merge Sort guarantees O(n log n) in all cases. Quick Sort is O(n²) worst case (already sorted). Heap Sort is also O(n log n) worst case but Merge Sort is more commonly cited." },
      { id: "g2", topic: "Trees", difficulty: "Hard",
        question: "In an AVL tree with n nodes, what is the maximum height?",
        options: ["O(n)", "O(log n)", "O(n log n)", "O(√n)"],
        correct: 1,
        explanation: "AVL trees maintain balance: height is O(log n). The balance factor (height difference of subtrees) is at most 1 at every node, guaranteeing logarithmic height." },
      { id: "g3", topic: "Graphs", difficulty: "Medium",
        question: "Which algorithm finds shortest path in a weighted directed graph with negative edge weights?",
        options: ["Dijkstra", "Bellman-Ford", "Floyd-Warshall", "BFS"],
        correct: 1,
        explanation: "Bellman-Ford handles negative edges and can detect negative cycles. Dijkstra fails with negative weights. Floyd-Warshall finds ALL pairs shortest paths (O(V³)). BFS only works on unweighted graphs." },
      { id: "g4", topic: "Hashing", difficulty: "Easy",
        question: "What is the average time complexity of search in a hash table?",
        options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
        correct: 0,
        explanation: "Hash tables provide O(1) average-case search, insertion, and deletion. The hash function maps keys directly to indices. Worst case (all collisions) is O(n)." },
      { id: "g5", topic: "Dynamic Programming", difficulty: "Hard",
        question: "What is the time complexity of the matrix chain multiplication DP solution?",
        options: ["O(n²)", "O(n³)", "O(2ⁿ)", "O(n log n)"],
        correct: 1,
        explanation: "Matrix chain multiplication DP is O(n³) where n is the number of matrices. We fill an n×n table, and each cell takes O(n) time to compute." },
      { id: "g6", topic: "Trees", difficulty: "Medium",
        question: "The number of binary trees with n nodes where every node has 0 or 2 children is:",
        options: ["2ⁿ⁻¹", "C(2n,n)/(n+1)", "C(2(n-1),(n-1))/n", "2ⁿ"],
        correct: 2,
        explanation: "The count of full binary trees (every node has 0 or 2 children) with n internal nodes is the Catalan number C(n) = C(2n,n)/(n+1). For n leaves, there are n-1 internal nodes, so count = C(n-1)." },
      { id: "g7", topic: "Complexity", difficulty: "Medium",
        question: "If T(n) = 2T(n/2) + n, what is the solution by Master Theorem?",
        options: ["O(n)", "O(n log n)", "O(n²)", "O(log n)"],
        correct: 1,
        explanation: "a=2, b=2, f(n)=n. n^(log_b a) = n^(log_2 2) = n¹ = n. Since f(n) = Θ(n^log_b a), we're in Case 2: T(n) = Θ(n log n). This is the recurrence for Merge Sort." },
      { id: "g8", topic: "Graphs", difficulty: "Hard",
        question: "A graph with n vertices and (n-1) edges is a tree if and only if it is:",
        options: ["Complete", "Connected", "Bipartite", "Planar"],
        correct: 1,
        explanation: "A tree is a connected acyclic graph. Having n vertices and exactly n-1 edges is necessary but not sufficient — you also need connectivity. A connected graph with n vertices and n-1 edges is always a tree (no cycles possible)." },
    ],
  },
  {
    id: "gate-cse-os-q1",
    title: "Operating Systems",
    type: "mcq",
    description: "OS concepts for GATE — processes, scheduling, memory, deadlocks",
    timeLimit: 90,
    questions: [
      { id: "os1", topic: "Scheduling", difficulty: "Medium",
        question: "Round Robin scheduling with time quantum q has context switch overhead c. Effective CPU utilization is approximately:",
        options: ["q/(q+c)", "c/(q+c)", "(q-c)/q", "q/c"],
        correct: 0,
        explanation: "Each time slice q, there's a context switch overhead c. So useful time = q, total time per slice = q+c. Utilization = q/(q+c). Larger q → better utilization but worse response time." },
      { id: "os2", topic: "Deadlock", difficulty: "Hard",
        question: "In the Banker's algorithm, a state is safe if:",
        options: ["All processes can finish", "There exists a sequence in which all processes can finish", "No circular wait exists", "Resources exceed demands"],
        correct: 1,
        explanation: "Safety: a sequence of all processes exists where each can acquire needed resources, execute, and release them. Not 'all at once' — they execute one by one. The Banker's algorithm finds this safe sequence." },
      { id: "os3", topic: "Memory", difficulty: "Medium",
        question: "Which page replacement algorithm guarantees the minimum number of page faults?",
        options: ["LRU", "FIFO", "Optimal (OPT)", "Clock"],
        correct: 2,
        explanation: "Belady's Optimal algorithm replaces the page that won't be used for the longest time in the future. It's theoretically optimal but practically impossible (needs future knowledge). Used as a benchmark." },
      { id: "os4", topic: "Processes", difficulty: "Easy",
        question: "A process is in the 'waiting' state when it is:",
        options: ["Ready to run", "Waiting for I/O or an event", "Currently executing on CPU", "Terminated"],
        correct: 1,
        explanation: "Waiting (blocked) state: process is waiting for an event — I/O completion, semaphore, message. Ready state: has all resources except CPU. Running: on CPU. This distinction is key for scheduling." },
      { id: "os5", topic: "Synchronization", difficulty: "Hard",
        question: "The 'test-and-set' instruction is used to:",
        options: ["Switch processes", "Implement mutual exclusion hardware primitives", "Handle interrupts", "Manage memory"],
        correct: 1,
        explanation: "Test-and-set is an atomic hardware instruction — reads a memory location, sets it to 1, returns old value. All in one uninterruptible step. Used to implement spin locks and mutex without race conditions." },
    ],
  },
  {
    id: "gate-cse-dbms-flash",
    title: "DBMS Key Concepts — Flashcards",
    type: "flashcard",
    description: "Quick revision flashcards for DBMS normalization, transactions, relational algebra",
    flashcards: [
      { id: "db1", category: "Normalization", front: "What is 2NF?", back: "A relation is in 2NF if it is in 1NF AND every non-prime attribute is fully functionally dependent on every candidate key (no partial dependencies). Partial dependency: non-key attribute depends on PART of a composite key." },
      { id: "db2", category: "Normalization", front: "What is 3NF?", back: "3NF: In 1NF, 2NF, AND no transitive dependencies. For every FD X→Y, either X is a superkey, OR Y is a prime attribute (part of candidate key)." },
      { id: "db3", category: "Normalization", front: "What is BCNF?", back: "Boyce-Codd Normal Form: For every non-trivial FD X→Y, X must be a superkey. Stronger than 3NF. BCNF ⊂ 3NF. BCNF may lose some FDs during decomposition." },
      { id: "db4", category: "Transactions", front: "What are the ACID properties?", back: "Atomicity: all or nothing. Consistency: DB moves from one valid state to another. Isolation: concurrent transactions appear serial. Durability: committed transactions persist even after crashes." },
      { id: "db5", category: "Transactions", front: "Difference between conflict serializable and view serializable?", back: "Conflict serializable: equivalent to a serial schedule by swapping non-conflicting operations. View serializable: produces same final result. View serializable ⊇ Conflict serializable (conflict serializable is stricter but easier to check)." },
      { id: "db6", category: "Indexing", front: "Dense index vs Sparse index?", back: "Dense: one index entry per record. Sparse: one index entry per block. Dense uses more space but can answer queries directly. Sparse requires fetching the block. Sparse only works for ordered data." },
      { id: "db7", category: "SQL", front: "HAVING vs WHERE in SQL", back: "WHERE filters rows BEFORE grouping. HAVING filters groups AFTER GROUP BY. You cannot use aggregate functions in WHERE. Example: WHERE salary > 50000 (row filter). HAVING AVG(salary) > 60000 (group filter)." },
      { id: "db8", category: "Relational", front: "What is lossless join decomposition?", back: "A decomposition of R into R1 and R2 is lossless if R1 ⋈ R2 = R. Condition: R1 ∩ R2 → R1 OR R1 ∩ R2 → R2. The common attribute must be a key in at least one of the decomposed relations." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// JEE MATHS
// ═══════════════════════════════════════════════════════
"jee-maths": [
  {
    id: "jee-maths-q1",
    title: "Calculus & Algebra Practice",
    type: "mcq",
    description: "JEE-level MCQs on limits, derivatives, integration, and sequences",
    timeLimit: 120,
    questions: [
      { id: "jm1", topic: "Limits", difficulty: "Medium",
        question: "lim(x→0) (sin x)/x equals:",
        options: ["0", "1", "∞", "undefined"],
        correct: 1,
        explanation: "This is a fundamental limit: lim(x→0) sin(x)/x = 1 (x in radians). Proof via L'Hôpital or geometric argument. This is used extensively in trigonometric derivatives." },
      { id: "jm2", topic: "Derivatives", difficulty: "Medium",
        question: "If y = x^x, then dy/dx equals:",
        options: ["x·x^(x-1)", "x^x·ln x", "x^x(1 + ln x)", "x^x/ln x"],
        correct: 2,
        explanation: "Take ln: ln y = x·ln x. Differentiate: (1/y)·dy/dx = ln x + x·(1/x) = ln x + 1. So dy/dx = y(ln x + 1) = x^x(1 + ln x)." },
      { id: "jm3", topic: "Integration", difficulty: "Hard",
        question: "∫(0 to π/2) sin²x dx equals:",
        options: ["π/4", "π/2", "1", "π/8"],
        correct: 0,
        explanation: "Use identity: sin²x = (1 - cos 2x)/2. Integral = ∫(0 to π/2)(1-cos2x)/2 dx = [x/2 - sin2x/4] from 0 to π/2 = π/4 - 0 - 0 = π/4." },
      { id: "jm4", topic: "Sequences", difficulty: "Easy",
        question: "The sum of the first n terms of AP with first term a and common difference d is:",
        options: ["n(a + nd)/2", "n(2a + (n-1)d)/2", "na + n(n-1)d", "n(a + l)/2 where l is last term"],
        correct: 1,
        explanation: "Sₙ = n/2 × [2a + (n-1)d]. Also written as n(a+l)/2 where l = last term. Both are correct. The formula n(a + nd)/2 is wrong — it should be (n-1)d not nd." },
      { id: "jm5", topic: "Complex Numbers", difficulty: "Hard",
        question: "If ω is a complex cube root of unity, then 1 + ω + ω² equals:",
        options: ["3", "0", "1", "-1"],
        correct: 1,
        explanation: "Cube roots of unity: 1, ω, ω² where ω = e^(2πi/3). They're roots of x³-1 = 0, i.e., (x-1)(x²+x+1) = 0. For ω ≠ 1: ω²+ω+1 = 0. So 1+ω+ω² = 0." },
      { id: "jm6", topic: "Binomial", difficulty: "Medium",
        question: "The middle term in the expansion of (x + 1/x)^10 is:",
        options: ["C(10,4)x²", "C(10,5)", "C(10,5)x⁰", "C(10,6)x²"],
        correct: 2,
        explanation: "For (x+1/x)^10, n=10, middle term is T(6) = C(10,5)·x^5·(1/x)^5 = C(10,5)·x⁰ = 252. The middle term (5th+1=6th) has no x (x-independent term)." },
    ],
  },
  {
    id: "jee-maths-formulas",
    title: "Key Formulas Flashcards",
    type: "flashcard",
    description: "Essential JEE Maths formulas — quick revision before exam",
    flashcards: [
      { id: "jmf1", category: "Trigonometry", front: "sin(A+B) = ?", back: "sin(A+B) = sinA·cosB + cosA·sinB\nsin(A-B) = sinA·cosB - cosA·sinB\n\ncos(A+B) = cosA·cosB - sinA·sinB\ncos(A-B) = cosA·cosB + sinA·sinB" },
      { id: "jmf2", category: "Differentiation", front: "d/dx of tan x, sec x, cosec x, cot x", back: "d/dx(tan x) = sec²x\nd/dx(cot x) = -cosec²x\nd/dx(sec x) = sec x · tan x\nd/dx(cosec x) = -cosec x · cot x" },
      { id: "jmf3", category: "Integration", front: "∫sec²x dx, ∫cosec²x dx, ∫sec x·tan x dx", back: "∫sec²x dx = tan x + C\n∫cosec²x dx = -cot x + C\n∫sec x·tan x dx = sec x + C\n∫cosec x·cot x dx = -cosec x + C" },
      { id: "jmf4", category: "Sequences", front: "Sum of GP with first term a, ratio r, n terms", back: "Sₙ = a(rⁿ-1)/(r-1) for r≠1\nSₙ = na for r=1\nSum of infinite GP: S∞ = a/(1-r) for |r| < 1" },
      { id: "jmf5", category: "Permutation", front: "nCr formula and Pascal's identity", back: "nCr = n! / (r!(n-r)!)\nnPr = n! / (n-r)!\n\nPascal's: nCr = (n-1)C(r-1) + (n-1)Cr\nnC0 = nCn = 1\nnCr = nC(n-r)" },
      { id: "jmf6", category: "Coordinate", front: "Equation of circle with center (h,k) and radius r", back: "(x-h)² + (y-k)² = r²\n\nGeneral form: x²+y²+2gx+2fy+c = 0\nCenter: (-g,-f)\nRadius: √(g²+f²-c)" },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// JEE PHYSICS
// ═══════════════════════════════════════════════════════
"jee-physics": [
  {
    id: "jee-phy-q1",
    title: "Mechanics & Electrostatics MCQ",
    type: "mcq",
    description: "JEE-level questions on Newton's laws, energy, electrostatics, circuits",
    timeLimit: 120,
    questions: [
      { id: "jp1", topic: "Projectile", difficulty: "Medium",
        question: "A projectile is thrown at angle θ for maximum range. The angle θ is:",
        options: ["30°", "45°", "60°", "90°"],
        correct: 1,
        explanation: "Range R = u²sin2θ/g. Maximum when sin2θ = 1, i.e., 2θ = 90°, θ = 45°. Max range = u²/g." },
      { id: "jp2", topic: "Work-Energy", difficulty: "Medium",
        question: "A body of mass m moving with velocity v has kinetic energy:",
        options: ["mv", "mv²", "mv²/2", "2mv²"],
        correct: 2,
        explanation: "KE = ½mv². This is derived from work-energy theorem. Work done = force × distance = ma·s = m(v²-u²)/2 = ΔKE." },
      { id: "jp3", topic: "Electrostatics", difficulty: "Hard",
        question: "Two point charges +q and -q are placed at distance d. The electric field at the midpoint is:",
        options: ["Zero", "kq/d²", "4kq/d²", "2kq/d²"],
        correct: 2,
        explanation: "At midpoint (d/2 from each): E from +q = kq/(d/2)² = 4kq/d² (pointing away from +q). E from -q = 4kq/d² (also pointing toward -q, same direction!). Total = 4kq/d² + 4kq/d² = 8kq/d²... wait: both point in SAME direction → add: 4kq/d² total in one direction. Net E = 4kq/d²." },
      { id: "jp4", topic: "Circular Motion", difficulty: "Medium",
        question: "A particle moves in a circle of radius r with constant speed v. Its acceleration is:",
        options: ["Zero", "v²/r directed outward", "v²/r directed inward", "v/r"],
        correct: 2,
        explanation: "Centripetal (center-seeking) acceleration = v²/r, directed toward center. Despite constant speed, velocity direction changes → acceleration exists. This centripetal acceleration is provided by centripetal force (tension, gravity, normal, etc.)." },
      { id: "jp5", topic: "Thermodynamics", difficulty: "Hard",
        question: "In an adiabatic process for an ideal gas, which relation holds?",
        options: ["PV = constant", "TV^γ = constant", "TV^(γ-1) = constant", "PV^γ = constant"],
        correct: 3,
        explanation: "Adiabatic process: PV^γ = constant (γ = Cp/Cv). Also: TV^(γ-1) = constant and T^γP^(1-γ) = constant. These all follow from PV^γ = const + ideal gas law PV = nRT." },
    ],
  },
  {
    id: "jee-phy-formulas",
    title: "Physics Formula Cards",
    type: "flashcard",
    description: "Must-know JEE Physics formulas — mechanics, electrostatics, modern physics",
    flashcards: [
      { id: "jpf1", category: "Mechanics", front: "Equations of motion (constant acceleration)", back: "v = u + at\ns = ut + ½at²\nv² = u² + 2as\ns_nth = u + a(2n-1)/2\n\n(u=initial velocity, v=final, a=acceleration, s=displacement)" },
      { id: "jpf2", category: "Rotational", front: "Moment of inertia formulas", back: "Rod (center): ML²/12\nRod (end): ML²/3\nDisk: MR²/2\nSolid sphere: 2MR²/5\nHollow sphere: 2MR²/3\nRing: MR²\nParallel axis: I = Icm + Md²" },
      { id: "jpf3", category: "Waves", front: "Speed of sound and Doppler effect", back: "v = √(γP/ρ) = √(γRT/M)\nDoppler: f' = f × (v ± v_observer)/(v ∓ v_source)\n+ when approaching, - when receding\nObserver: + in numerator if moving toward source\nSource: - in denominator if moving toward observer" },
      { id: "jpf4", category: "Modern Physics", front: "de Broglie wavelength and Bohr radius", back: "λ = h/mv = h/p\nFor electron: λ = 12.27/√V Å (V in volts)\nBohr radius: a₀ = 0.529 Å\nrₙ = n²a₀/Z = 0.529n²/Z Å\nEₙ = -13.6Z²/n² eV" },
      { id: "jpf5", category: "Electrostatics", front: "Coulomb's law and electric field of common shapes", back: "F = kq₁q₂/r² (k = 9×10⁹)\nPoint charge: E = kq/r²\nUniform infinite sheet: E = σ/2ε₀\nBetween parallel plates: E = σ/ε₀\nInside conductor: E = 0\nCapacitor: C = ε₀A/d" },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// JEE CHEMISTRY
// ═══════════════════════════════════════════════════════
"jee-chemistry": [
  {
    id: "jee-chem-q1",
    title: "Physical & Organic Chemistry MCQ",
    type: "mcq",
    description: "JEE Chemistry questions — mole concept, equilibrium, organic reactions",
    timeLimit: 120,
    questions: [
      { id: "jc1", topic: "Mole Concept", difficulty: "Easy",
        question: "Number of molecules in 18g of water is:",
        options: ["6.022×10²³", "6.022×10²² × 2", "6.022×10²³ × 3", "18×6.022×10²³"],
        correct: 0,
        explanation: "Molar mass of water (H₂O) = 18 g/mol. 18g = 1 mole = 6.022×10²³ molecules. Note: 18g contains 6.022×10²³ MOLECULES (not atoms). Atoms = 3×6.022×10²³ (2H + 1O per molecule)." },
      { id: "jc2", topic: "Equilibrium", difficulty: "Medium",
        question: "For N₂ + 3H₂ ⇌ 2NH₃, Kp = Kc × (RT)^Δn where Δn equals:",
        options: ["2", "-2", "1", "-1"],
        correct: 1,
        explanation: "Δn = moles of products - moles of reactants (gas phase only). = 2 - (1+3) = 2-4 = -2. So Kp = Kc(RT)^(-2) = Kc/(RT)². Since Δn < 0, Kp < Kc at high T." },
      { id: "jc3", topic: "Organic", difficulty: "Hard",
        question: "CH₃CH=CH₂ + HBr in presence of peroxide gives:",
        options: ["CH₃CHBrCH₃", "CH₃CH₂CH₂Br", "CH₂BrCH=CH₂", "CH₃CHBrCH₂Br"],
        correct: 1,
        explanation: "Anti-Markovnikov addition with peroxide: HBr adds via free radical mechanism. H goes to more substituted C. Product: 1-bromopropane (CH₃CH₂CH₂Br). Without peroxide: Markovnikov → 2-bromopropane." },
      { id: "jc4", topic: "Atomic Structure", difficulty: "Medium",
        question: "The set of quantum numbers n=3, l=1, m=0 represents which orbital?",
        options: ["3s", "3p", "3d", "4p"],
        correct: 1,
        explanation: "n=3 (3rd shell), l=1 (p subshell, since l=0→s, 1→p, 2→d), m=0 (one of the 2p orbitals: -1, 0, +1). This is 3pz (or any of the 3p orbitals with m=0)." },
      { id: "jc5", topic: "Electrochemistry", difficulty: "Hard",
        question: "Standard cell potential E° of Zn-Cu Daniell cell, given E°(Zn²⁺/Zn) = -0.76V and E°(Cu²⁺/Cu) = +0.34V, is:",
        options: ["-0.42 V", "0.42 V", "1.10 V", "-1.10 V"],
        correct: 2,
        explanation: "E°cell = E°cathode - E°anode. Cu is cathode (reduction), Zn is anode (oxidation). E°cell = 0.34 - (-0.76) = 1.10V. Always: cathode - anode. Positive EMF means spontaneous." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// NEET BIOLOGY
// ═══════════════════════════════════════════════════════
"neet-biology": [
  {
    id: "neet-bio-q1",
    title: "Cell Biology & Photosynthesis MCQ",
    type: "mcq",
    description: "High-priority NEET Biology — cell structure, photosynthesis, genetics",
    timeLimit: 60,
    questions: [
      { id: "nb1", topic: "Cell Biology", difficulty: "Easy",
        question: "Which organelle is called the 'powerhouse of the cell'?",
        options: ["Nucleus", "Ribosome", "Mitochondria", "Golgi apparatus"],
        correct: 2,
        explanation: "Mitochondria synthesize ATP via oxidative phosphorylation. They have a double membrane (inner membrane has cristae for large surface area), their own DNA, and 70S ribosomes." },
      { id: "nb2", topic: "Cell Biology", difficulty: "Medium",
        question: "Which organelle is absent in plant cells but present in animal cells?",
        options: ["Mitochondria", "Ribosome", "Lysosome", "Endoplasmic reticulum"],
        correct: 2,
        explanation: "Lysosome ('suicide bag') is present only in animal cells. It contains hydrolytic enzymes for intracellular digestion at pH 5. Plant cells use the vacuole for similar functions." },
      { id: "nb3", topic: "Photosynthesis", difficulty: "Medium",
        question: "The site of light-dependent reactions in photosynthesis is:",
        options: ["Stroma", "Thylakoid membrane", "Outer membrane", "Cytoplasm"],
        correct: 1,
        explanation: "Light reactions occur on thylakoid membranes: photosystems, electron transport chain, ATP synthase. Dark reactions (Calvin cycle) occur in stroma. Remember: Light=thylakoid (has chlorophyll), Dark=stroma." },
      { id: "nb4", topic: "Genetics", difficulty: "Hard",
        question: "In a dihybrid cross (TtRr × TtRr), the ratio of offspring with at least one dominant allele at each locus is:",
        options: ["9:7", "9:3:3:1", "3:1", "1:1:1:1"],
        correct: 0,
        explanation: "9:7 is the ratio when we combine 'at least one T AND at least one R' = 9 (TTRR + TTRr + TtRR + TtRr). The remaining 7 lack dominant at one or both loci. Standard 9:3:3:1 gives 4 phenotypic classes." },
      { id: "nb5", topic: "DNA", difficulty: "Medium",
        question: "Chargaff's rule states that in DNA:",
        options: ["A+G = T+C", "A = T and G = C", "A+T = G+C", "A = G and T = C"],
        correct: 1,
        explanation: "Chargaff's rules: A = T (paired by 2 H-bonds), G = C (paired by 3 H-bonds). Therefore A+G = T+C (purines = pyrimidines). Also: (A+T)/(G+C) varies between species." },
      { id: "nb6", topic: "Ecology", difficulty: "Easy",
        question: "Which pyramid is ALWAYS upright (can never be inverted)?",
        options: ["Pyramid of numbers", "Pyramid of biomass", "Pyramid of energy", "All three"],
        correct: 2,
        explanation: "Energy pyramid is ALWAYS upright — 10% law: only 10% energy passes to next trophic level, so each level has less energy. Numbers and biomass pyramids can be inverted (e.g., many insects on one tree)." },
      { id: "nb7", topic: "Human Physiology", difficulty: "Medium",
        question: "Which enzyme in the stomach converts pepsinogen to pepsin?",
        options: ["Amylase", "HCl", "Enterokinase", "Trypsin"],
        correct: 1,
        explanation: "HCl (hydrochloric acid) in stomach activates pepsinogen → pepsin. HCl also denatures proteins and kills bacteria. Pepsin then digests proteins to peptides at pH 1-2." },
      { id: "nb8", topic: "Cell Division", difficulty: "Hard",
        question: "Crossing over (genetic recombination) occurs during:",
        options: ["Leptotene", "Zygotene", "Pachytene", "Diplotene"],
        correct: 2,
        explanation: "Prophase I stages: Leptotene (chromosomes condense), Zygotene (synapsis begins), Pachytene (crossing over occurs at chiasmata), Diplotene (chromosomes separate but held by chiasmata), Diakinesis." },
    ],
  },
  {
    id: "neet-bio-flash",
    title: "Biology Quick Facts Flashcards",
    type: "flashcard",
    description: "Essential NEET Biology facts — must memorize for 340+ score",
    flashcards: [
      { id: "nbf1", category: "Cell", front: "What are the differences between 70S and 80S ribosomes?", back: "70S ribosomes: found in prokaryotes, mitochondria, chloroplasts. Made of 50S + 30S subunits. 80S ribosomes: found in eukaryotic cytoplasm. Made of 60S + 40S subunits. S = Svedberg unit (sedimentation coefficient, not additive)." },
      { id: "nbf2", category: "Genetics", front: "What is the phenotype ratio in incomplete dominance?", back: "Incomplete dominance gives 1:2:1 phenotype ratio (same as genotype).\nExample: RR (red) × rr (white) → Rr (pink)\nF2: RR:Rr:rr = 1:2:1\nPhenotype = Genotype ratio (unlike complete dominance which is 3:1)." },
      { id: "nbf3", category: "Photosynthesis", front: "Cyclic vs Non-cyclic photophosphorylation", back: "Cyclic: Only PSI. Produces only ATP. No NADPH, no O₂. Electrons cycle back to PSI.\nNon-cyclic: Both PSII and PSI. Produces ATP + NADPH + O₂. Water splits at PSII, O₂ released." },
      { id: "nbf4", category: "Human Body", front: "Universal donor and universal recipient blood groups", back: "Universal DONOR (RBCs): O negative (no A, B antigens, no Rh)\nUniversal RECIPIENT: AB positive (no antibodies, has Rh)\n\nFor plasma donation: AB is universal donor (no antibodies)\nO is universal plasma recipient" },
      { id: "nbf5", category: "Ecology", front: "10% law in ecology — who proposed it?", back: "Proposed by Lindemann (1942). Only 10% of energy at one trophic level is available to the next. Also called the Law of Energy Transfer. Energy is lost as heat at each level. Hence food chains rarely exceed 4-5 levels." },
      { id: "nbf6", category: "Biotechnology", front: "What is PCR and who invented it?", back: "PCR = Polymerase Chain Reaction. Invented by Kary Mullis (Nobel Prize 1993).\nSteps: Denaturation (94°C) → Annealing (~55°C) → Extension (72°C by Taq polymerase)\nUses: Disease diagnosis, forensics, paternity testing, cloning genes, detecting COVID-19." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// NEET PHYSICS
// ═══════════════════════════════════════════════════════
"neet-physics": [
  {
    id: "neet-phy-q1",
    title: "NEET Physics MCQ Practice",
    type: "mcq",
    description: "Important NEET Physics questions — mechanics, electricity, optics, modern physics",
    timeLimit: 60,
    questions: [
      { id: "np1", topic: "Mechanics", difficulty: "Easy",
        question: "A body thrown vertically up with velocity u reaches maximum height. That height is:",
        options: ["u/g", "u²/g", "u²/2g", "2u²/g"],
        correct: 2,
        explanation: "At max height, v=0. Using v²=u²-2gh: 0=u²-2gh → h=u²/2g. Or using time: t=u/g (time to reach top), h=ut-½gt²=u²/g-u²/2g=u²/2g." },
      { id: "np2", topic: "Optics", difficulty: "Medium",
        question: "A convex lens of focal length 20cm forms a real image of an object placed at 30cm. Image distance is:",
        options: ["60 cm", "-60 cm", "12 cm", "-12 cm"],
        correct: 0,
        explanation: "Lens formula: 1/v - 1/u = 1/f. Sign convention: object at -30cm (left). 1/v = 1/f + 1/u = 1/20 + 1/(-30) = 3/60 - 2/60 = 1/60. So v = +60cm (real image, same side as light direction)." },
      { id: "np3", topic: "Electrostatics", difficulty: "Medium",
        question: "Work done to move a charge q through potential difference V is:",
        options: ["V/q", "q/V", "qV", "q²V"],
        correct: 2,
        explanation: "W = qV. Potential difference V = W/q → W = qV. Electric potential is work done per unit charge. If V is in volts and q in coulombs, W is in joules." },
      { id: "np4", topic: "Modern Physics", difficulty: "Hard",
        question: "Which phenomenon proves wave nature of light?",
        options: ["Photoelectric effect", "Compton effect", "Polarization", "Pair production"],
        correct: 2,
        explanation: "Polarization proves TRANSVERSE wave nature of light. Interference and diffraction prove wave nature but not necessarily transverse. Photoelectric effect and Compton effect prove PARTICLE nature. This distinction is important for NEET." },
      { id: "np5", topic: "Nuclear Physics", difficulty: "Medium",
        question: "In radioactive decay, emission of α-particle decreases atomic number by:",
        options: ["1", "2", "4", "0"],
        correct: 1,
        explanation: "α particle = ₂He⁴ (2 protons + 2 neutrons). So α emission: mass number decreases by 4, atomic number decreases by 2. β⁻ decay: Z increases by 1, A unchanged. γ decay: neither Z nor A changes." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// NEET CHEMISTRY
// ═══════════════════════════════════════════════════════
"neet-chemistry": [
  {
    id: "neet-chem-q1",
    title: "NEET Chemistry MCQ Practice",
    type: "mcq",
    description: "NEET Chemistry — GOC, named reactions, biomolecules, periodic trends",
    timeLimit: 60,
    questions: [
      { id: "nc1", topic: "Organic", difficulty: "Easy",
        question: "Fehling's solution is used to test for:",
        options: ["Ketones", "Aldehydes only", "Aliphatic aldehydes", "All carbonyls"],
        correct: 2,
        explanation: "Fehling's solution (Cu²⁺ complex) is reduced by aliphatic aldehydes to give brick-red Cu₂O precipitate. Aromatic aldehydes (benzaldehyde) DON'T react. Ketones don't react. Tollen's test: all aldehydes (silver mirror)." },
      { id: "nc2", topic: "Periodic Table", difficulty: "Medium",
        question: "Which element has the highest electronegativity?",
        options: ["Oxygen", "Nitrogen", "Chlorine", "Fluorine"],
        correct: 3,
        explanation: "Fluorine has highest electronegativity (4.0 Pauling scale). Electronegativity: F>O>N>Cl. Increases across period (left to right), decreases down group. Fluorine's small size + high Zeff makes it most electronegative." },
      { id: "nc3", topic: "Organic", difficulty: "Hard",
        question: "Carbylamine reaction is given by:",
        options: ["Primary amines only", "Secondary amines only", "Both primary and secondary", "Tertiary amines only"],
        correct: 0,
        explanation: "Carbylamine test: Primary amines + CHCl₃ + KOH → foul-smelling isocyanide (R-NC). Only primary amines (both aliphatic and aromatic). Secondary and tertiary amines don't react. Used to distinguish 1° from 2° and 3° amines." },
      { id: "nc4", topic: "Physical", difficulty: "Medium",
        question: "pH of a buffer solution changes by how much when diluted 10 times?",
        options: ["0", "1", "0.5", "Changes significantly"],
        correct: 0,
        explanation: "Buffer resists pH change on dilution! The Henderson-Hasselbalch equation pH = pKa + log([A⁻]/[HA]). Dilution doesn't change the RATIO [A⁻]/[HA], so pH stays constant. This is the defining property of a buffer." },
      { id: "nc5", topic: "Biomolecules", difficulty: "Medium",
        question: "Which carbohydrate is a non-reducing sugar?",
        options: ["Glucose", "Fructose", "Sucrose", "Lactose"],
        correct: 2,
        explanation: "Sucrose is a non-reducing sugar — no free aldehyde or ketone group (both are involved in glycosidic bond between glucose and fructose). Glucose, fructose, lactose, maltose are all reducing sugars." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// BANKING EXAMS
// ═══════════════════════════════════════════════════════
"banking-exams": [
  {
    id: "banking-quant-q1",
    title: "Quantitative Aptitude — Banking",
    type: "mcq",
    description: "Key aptitude questions for IBPS PO, SBI PO — SI/CI, profit/loss, time-work",
    timeLimit: 60,
    questions: [
      { id: "bq1", topic: "SI/CI", difficulty: "Medium",
        question: "A sum of ₹10,000 at 10% p.a. CI for 2 years gives interest of:",
        options: ["₹2,000", "₹2,100", "₹1,900", "₹2,200"],
        correct: 1,
        explanation: "CI = P[(1+r/100)ⁿ - 1] = 10000[(1.1)² - 1] = 10000[1.21-1] = 10000×0.21 = ₹2,100. SI would be ₹2,000. Difference = ₹100 (interest on first year's interest: 1000×10%=100)." },
      { id: "bq2", topic: "Profit/Loss", difficulty: "Easy",
        question: "An article bought at ₹800 is sold at 25% profit. Selling price is:",
        options: ["₹900", "₹1,000", "₹1,100", "₹800"],
        correct: 1,
        explanation: "SP = CP × (100+Profit%)/100 = 800 × 125/100 = 800 × 1.25 = ₹1,000. Profit = SP - CP = 1000 - 800 = ₹200. Profit% = 200/800 × 100 = 25%." },
      { id: "bq3", topic: "Time-Work", difficulty: "Medium",
        question: "A can do a work in 10 days, B in 15 days. Working together, they finish in:",
        options: ["6 days", "5 days", "8 days", "12 days"],
        correct: 0,
        explanation: "A's rate: 1/10 per day. B's rate: 1/15 per day. Combined: 1/10+1/15 = 3/30+2/30 = 5/30 = 1/6 per day. Time = 6 days. Formula: AB/(A+B) = 10×15/(10+15) = 150/25 = 6." },
      { id: "bq4", topic: "Percentage", difficulty: "Medium",
        question: "If price of an item increases by 25%, by what % should consumption decrease to maintain same expenditure?",
        options: ["20%", "25%", "15%", "30%"],
        correct: 0,
        explanation: "Formula: required decrease = [r/(100+r)]×100 = [25/125]×100 = 20%. Explanation: new price = 125, new quantity = x. 125x = 100×100. x = 80. Decrease = 20%." },
      { id: "bq5", topic: "Speed-Distance", difficulty: "Hard",
        question: "Train A (100m long, 60 km/h) crosses Train B (150m long, 40 km/h) going in opposite direction. Time to cross:",
        options: ["9 sec", "10 sec", "12 sec", "15 sec"],
        correct: 0,
        explanation: "Opposite direction: relative speed = 60+40 = 100 km/h = 100×1000/3600 = 250/9 m/s. Total distance = 100+150 = 250m. Time = 250/(250/9) = 9 seconds." },
      { id: "bq6", topic: "Ratio", difficulty: "Easy",
        question: "The ratio of ages of A and B is 3:5. After 6 years, ratio is 2:3. Present age of B:",
        options: ["25", "30", "20", "35"],
        correct: 1,
        explanation: "Let ages: 3x and 5x. After 6 years: (3x+6)/(5x+6) = 2/3. Cross multiply: 9x+18 = 10x+12. x=6. B's age = 5×6 = 30. Check: (18+6)/(30+6) = 24/36 = 2:3 ✓" },
    ],
  },
  {
    id: "banking-reasoning-flash",
    title: "Reasoning Shortcuts Flashcards",
    type: "flashcard",
    description: "Tricks and shortcuts for banking exam reasoning section",
    flashcards: [
      { id: "brf1", category: "Syllogism", front: "All A are B, Some B are C → what can we conclude?", back: "Possible conclusions:\n1. Some A are C → POSSIBLE (not definite)\n2. Some C are A → POSSIBLE\n3. All A are C → NOT definite\n4. No A are C → NOT definite\nRule: In syllogism, 'Some' + 'All' = 'Some' (possibility, not certainty)" },
      { id: "brf2", category: "Blood Relations", front: "How to solve blood relation problems?", back: "Step 1: Draw a family tree on paper\nStep 2: Use symbols: ○=female, □=male, —=married, |=children\nStep 3: Solve generation by generation\n\nKey: 'Nephew' = brother's son. 'Niece' = brother's/sister's daughter.\n'Maternal' = mother's side. 'Paternal' = father's side." },
      { id: "brf3", category: "Clocks", front: "Clock angle formula", back: "Angle between hands at H hours M minutes:\n= |30H - 5.5M| degrees\n\nHour hand moves: 0.5°/min\nMinute hand moves: 6°/min\nRelative speed: 5.5°/min\n\nHands coincide: every 65.45 minutes (not 60!)\nHands perpendicular: every 32.73 minutes" },
      { id: "brf4", category: "Coding", front: "Common coding patterns in banking exams", back: "Pattern 1: Letters shifted by N (A→C = shifted by 2)\nPattern 2: Reverse alphabet (A↔Z, B↔Y...)\nPattern 3: Alternate letters (ABCDE → BDFHJ, odd→even)\nPattern 4: Number-letter (A=1, B=2... or A=26, Z=1)\nAlways check all letters in the example to find the pattern." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// SSC CGL
// ═══════════════════════════════════════════════════════
"ssc-cgl": [
  {
    id: "ssc-quant-q1",
    title: "SSC CGL Quantitative Aptitude",
    type: "mcq",
    description: "SSC CGL Tier 1 & 2 mathematics questions — geometry, algebra, number system",
    timeLimit: 60,
    questions: [
      { id: "sc1", topic: "Geometry", difficulty: "Medium",
        question: "In a triangle, the sum of two sides is 10 and their difference is 4. Third side can be:",
        options: ["Any value", "Less than 10", "Greater than 4 and less than 10", "Between 4 and 10"],
        correct: 3,
        explanation: "Sides: (10+4)/2=7 and (10-4)/2=3. Sum of any two sides > third side. Third side < 7+3=10. Third side > 7-3=4. So third side is strictly between 4 and 10." },
      { id: "sc2", topic: "Number System", difficulty: "Easy",
        question: "The LCM of 12, 18, and 24 is:",
        options: ["36", "48", "72", "144"],
        correct: 2,
        explanation: "12=2²×3, 18=2×3², 24=2³×3. LCM = highest powers = 2³×3² = 8×9 = 72. HCF = lowest powers = 2¹×3¹ = 6. Check: LCM×HCF = 72×6 = 432 ≠ 12×18×24 (formula applies only for 2 numbers)." },
      { id: "sc3", topic: "Algebra", difficulty: "Medium",
        question: "If x + 1/x = 3, then x² + 1/x² equals:",
        options: ["7", "9", "11", "6"],
        correct: 0,
        explanation: "Square both sides: (x+1/x)² = 9. x²+2+1/x² = 9. x²+1/x² = 7. Key identity: (x+1/x)² = x²+1/x²+2. Similarly (x-1/x)² = x²+1/x²-2." },
      { id: "sc4", topic: "Mensuration", difficulty: "Medium",
        question: "The area of a circle inscribed in a square of side 10cm is:",
        options: ["25π cm²", "100π cm²", "50π cm²", "10π cm²"],
        correct: 0,
        explanation: "Circle inscribed in square: diameter = side of square = 10cm. Radius = 5cm. Area = π×5² = 25π cm². Circumscribed circle (around square): diagonal = 10√2, radius = 5√2, area = 50π." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// UPSC PRELIMS
// ═══════════════════════════════════════════════════════
"upsc-prelims": [
  {
    id: "upsc-gs1-q1",
    title: "GS Paper 1 — Polity & History",
    type: "mcq",
    description: "UPSC Prelims standard GS Paper 1 questions — Indian polity, history, geography",
    timeLimit: 120,
    questions: [
      { id: "up1", topic: "Indian Polity", difficulty: "Medium",
        question: "Which Article of the Constitution provides for the appointment of the Prime Minister?",
        options: ["Article 74", "Article 75", "Article 76", "Article 77"],
        correct: 1,
        explanation: "Article 75: The Prime Minister shall be appointed by the President and other ministers shall be appointed on the advice of the PM. Article 74: Council of Ministers to aid and advise President." },
      { id: "up2", topic: "Indian Polity", difficulty: "Hard",
        question: "The concept of 'Judicial Review' in India is derived from the Constitution of:",
        options: ["UK", "USA", "Australia", "Canada"],
        correct: 1,
        explanation: "Judicial review was borrowed from the USA. But Indian judicial review is narrower — courts can invalidate laws only if they violate the Constitution, not on grounds of policy. DR BR Ambedkar was influenced by the US model." },
      { id: "up3", topic: "Modern History", difficulty: "Medium",
        question: "The 'Doctrine of Lapse' was introduced by:",
        options: ["Lord Wellesley", "Lord Dalhousie", "Lord Cornwallis", "Lord Ripon"],
        correct: 1,
        explanation: "Lord Dalhousie (1848-1856) introduced Doctrine of Lapse: if a native ruler died without a natural heir, their state was annexed. States lapsed: Satara, Jhansi, Nagpur. This angered Indian princes and contributed to 1857 revolt." },
      { id: "up4", topic: "Geography", difficulty: "Easy",
        question: "The Brahmaputra river enters India through which state?",
        options: ["Sikkim", "Arunachal Pradesh", "Assam", "Meghalaya"],
        correct: 1,
        explanation: "Brahmaputra (called Yarlung Tsangpo in Tibet) enters India through Arunachal Pradesh, flowing through a narrow gorge (Dihang). It then flows through Assam. It's one of the largest rivers by discharge in the world." },
      { id: "up5", topic: "Current Affairs", difficulty: "Medium",
        question: "Which Constitutional Amendment lowered the voting age from 21 to 18 years?",
        options: ["61st Amendment", "42nd Amendment", "44th Amendment", "73rd Amendment"],
        correct: 0,
        explanation: "61st Constitutional Amendment Act (1989) reduced voting age from 21 to 18. 42nd (1976): mini-Constitution, added Fundamental Duties. 44th (1978): restored some rights. 73rd/74th: Panchayati Raj." },
    ],
  },
  {
    id: "upsc-flash",
    title: "Indian Polity Flashcards",
    type: "flashcard",
    description: "Important constitutional articles and facts for UPSC Prelims",
    flashcards: [
      { id: "upf1", category: "Fundamental Rights", front: "What do Articles 12-35 cover?", back: "Part III: Fundamental Rights\nArt 12: Definition of State\nArt 13: Laws inconsistent with FR are void\nArt 14: Equality before law\nArt 15: No discrimination (religion, race, caste, sex, birthplace)\nArt 16: Equal opportunity in public employment\nArt 17: Abolition of untouchability\nArt 19: 6 freedoms (speech, assembly, movement...)\nArt 21: Right to life and personal liberty\nArt 32: Right to move Supreme Court" },
      { id: "upf2", category: "DPSP", front: "Difference between Fundamental Rights and DPSPs?", back: "Fundamental Rights (Part III): Justiciable (enforceable by court), negative obligations (state must NOT do)\nDPSPs (Part IV, Art 36-51): Non-justiciable, positive obligations (state SHOULD do), socialist, Gandhian, liberal-intellectual categories. DPSP cannot override FR (after Art 13), but Parliament can amend FR to implement DPSP (Art 368)." },
      { id: "upf3", category: "Parliament", front: "Money Bill vs Financial Bill vs Ordinary Bill", back: "Money Bill (Art 110): Only Lok Sabha, RS can't amend/reject (returns in 14 days). Speaker certifies.\nFinancial Bill: Both Houses, RS has full powers.\nOrdinary Bill: Both Houses, joint sitting if deadlock.\n\nBudget = Annual Financial Statement (Art 112), presented in Lok Sabha only." },
      { id: "upf4", category: "Emergency", front: "Three types of emergencies in India", back: "1. National Emergency (Art 352): War, external aggression, armed rebellion. FC relations change.\n2. State Emergency/President's Rule (Art 356): Constitutional breakdown in state. PM's pleasure.\n3. Financial Emergency (Art 360): Financial stability threatened. Never proclaimed.\n\nProclamation: Cabinet in writing (352), Council of Ministers (356)." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// HEALTHCARE — ICD-10-CM
// ═══════════════════════════════════════════════════════
"icd-10-cm": [
  {
    id: "icd-q1",
    title: "ICD-10-CM Coding Practice",
    type: "mcq",
    description: "ICD-10-CM coding scenarios — select the most accurate code",
    timeLimit: 90,
    questions: [
      { id: "ic1", topic: "Coding Guidelines", difficulty: "Medium",
        question: "A patient presents with acute-on-chronic heart failure. How should this be coded?",
        options: ["Only acute heart failure", "Only chronic heart failure", "Acute first, then chronic", "Chronic first, then acute"],
        correct: 2,
        explanation: "ICD-10-CM guidelines: When a patient has both acute and chronic conditions, the acute condition is sequenced first. Code the acute heart failure (I50.2x) as principal, then the chronic (if needed separately)." },
      { id: "ic2", topic: "Code Structure", difficulty: "Easy",
        question: "In ICD-10-CM, the 7th character 'A' in injury codes means:",
        options: ["Subsequent encounter", "Initial encounter", "Sequela", "Active treatment"],
        correct: 1,
        explanation: "'A' = Initial encounter: patient is receiving ACTIVE treatment for the condition. 'D' = Subsequent encounter: routine care after active treatment phase. 'S' = Sequela: late effects. Use 'A' while patient is under active treatment, not just for first visit." },
      { id: "ic3", topic: "Combination Codes", difficulty: "Hard",
        question: "A patient has Type 2 diabetes with diabetic chronic kidney disease stage 3. Which approach is correct?",
        options: ["Code diabetes only", "Code CKD only", "Use combination code E11.65 + N18.3", "Use E11.9 + N18.3"],
        correct: 2,
        explanation: "ICD-10-CM has combination codes for diabetes + complications. E11.65 = Type 2 DM with hyperglycemia (combination code for T2DM with CKD). Add N18.3 for CKD stage 3. The TABULAR LIST must be checked — use the most specific combination code available." },
      { id: "ic4", topic: "External Causes", difficulty: "Medium",
        question: "External cause codes (V00-Y99) should be sequenced as:",
        options: ["Principal diagnosis", "Secondary to condition codes", "Either primary or secondary", "Only on outpatient claims"],
        correct: 1,
        explanation: "External cause codes are NEVER the principal/first-listed diagnosis. They're supplementary codes added after the injury/condition code. Example: S52.501A (radius fracture) is principal, W17.8XXA (fall from height) is secondary." },
      { id: "ic5", topic: "Laterality", difficulty: "Easy",
        question: "In ICD-10-CM, when laterality is documented for a fracture but the specific side is unknown, the coder should:",
        options: ["Use 'right' as default", "Use 'left' as default", "Use unspecified laterality code", "Query the physician"],
        correct: 3,
        explanation: "Query the physician! Coders should NEVER assume laterality. If documentation is unclear or missing, query the physician for clarification. Do not default to right or left. Use the unspecified code only when physician cannot or does not document laterality." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// ESSENTIALS — PERSONAL FINANCE
// ═══════════════════════════════════════════════════════
"personal-finance": [
  {
    id: "fin-q1",
    title: "Personal Finance Quiz",
    type: "mcq",
    description: "Test your personal finance knowledge — budgeting, investing, insurance",
    questions: [
      { id: "pf1", topic: "Budgeting", difficulty: "Easy",
        question: "The 50/30/20 rule allocates your income as:",
        options: ["50% savings, 30% needs, 20% wants", "50% needs, 30% wants, 20% savings", "50% wants, 30% needs, 20% savings", "50% needs, 30% savings, 20% wants"],
        correct: 1,
        explanation: "50% Needs (rent, food, utilities, minimum debt), 30% Wants (dining, entertainment, travel), 20% Savings/Investment/Debt payoff. Adjust based on situation: high-income earners should save more." },
      { id: "pf2", topic: "Emergency Fund", difficulty: "Easy",
        question: "An emergency fund should ideally cover how many months of expenses?",
        options: ["1-2 months", "3-6 months", "12 months", "24 months"],
        correct: 1,
        explanation: "3-6 months is the standard recommendation. Stable job/dual income → 3 months. Self-employed/single income → 6 months. During job search, most people find employment within 3-6 months. Store in liquid savings, not investments." },
      { id: "pf3", topic: "Investing", difficulty: "Medium",
        question: "Why do experts recommend index funds over actively managed funds?",
        options: ["Higher guaranteed returns", "Lower costs + historically better returns", "More excitement", "Government backed"],
        correct: 1,
        explanation: "Index funds: lower expense ratio (0.1% vs 1-2%), no stock-picking risk, historically 80% of active funds underperform their benchmark over 10+ years. Over 30 years, a 1% difference in fees can reduce wealth by 25-30%." },
      { id: "pf4", topic: "Insurance", difficulty: "Medium",
        question: "Which type of life insurance is recommended for most people?",
        options: ["Whole life insurance", "Endowment plans", "Term insurance", "ULIP"],
        correct: 2,
        explanation: "Term insurance: pure life cover, low premium, high coverage (₹1 crore for ~₹1000/month). Don't mix insurance and investment. Endowment/ULIP/Whole life have very poor returns (4-6%) compared to MFs (12%+). Buy term insurance + invest the rest separately." },
    ],
  },
  {
    id: "fin-flash",
    title: "Financial Terms Flashcards",
    type: "flashcard",
    description: "Key personal finance concepts every Indian should know",
    flashcards: [
      { id: "fff1", category: "Investing", front: "What is NAV in mutual funds?", back: "NAV = Net Asset Value = (Total Assets - Liabilities) / Number of units\nThis is the per-unit price of the mutual fund. Calculated daily.\nBuying at high NAV is not bad — it just means more valuable fund. Total return depends on % change in NAV, not absolute NAV value." },
      { id: "fff2", category: "Tax", front: "80C deduction — what qualifies?", back: "Section 80C: Max ₹1.5 lakh deduction\n• PPF (Public Provident Fund)\n• ELSS (Equity Linked Savings Scheme) — 3-yr lock-in\n• Life insurance premiums\n• EPF employee contribution\n• NSC, Sukanya Samriddhi, 5-yr FD\n• Home loan principal repayment\n• Tuition fees (up to 2 children)" },
      { id: "fff3", category: "Investing", front: "What is the difference between SIP and lump sum?", back: "SIP (Systematic Investment Plan): invest fixed amount monthly. Benefits from rupee cost averaging — buy more units when market is low, fewer when high. Reduces timing risk. Better for salaried individuals.\n\nLump sum: invest entire amount at once. Better if market is at a bottom. Needs market timing ability. Better for windfall money." },
      { id: "fff4", category: "Insurance", front: "Health insurance — what is co-payment and deductible?", back: "Co-payment: you pay X% of each claim (e.g., 20% co-pay means insurance pays 80%). Avoid co-pay policies if possible.\nDeductible: first X rupees of each claim paid by you. Lower premium but more out-of-pocket.\nFamily floater: one sum insured shared by family. Cheaper but risky if multiple claims in same year." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// ESSENTIALS — NUTRITION
// ═══════════════════════════════════════════════════════
"nutrition": [
  {
    id: "nutrition-q1",
    title: "Nutrition Knowledge Check",
    type: "mcq",
    description: "Test your nutrition knowledge — macros, micronutrients, healthy eating",
    questions: [
      { id: "nq1", topic: "Macronutrients", difficulty: "Easy",
        question: "Which macronutrient provides 9 calories per gram?",
        options: ["Protein", "Carbohydrates", "Fat", "Fiber"],
        correct: 2,
        explanation: "Fat provides 9 kcal/g — more than double protein or carbs (both 4 kcal/g). Fiber provides ~2 kcal/g (partially digestible). Alcohol provides 7 kcal/g. This is why high-fat foods are calorie-dense." },
      { id: "nq2", topic: "Vitamins", difficulty: "Medium",
        question: "Vitamin D deficiency causes:",
        options: ["Scurvy", "Rickets in children", "Night blindness", "Pellagra"],
        correct: 1,
        explanation: "Vitamin D deficiency → Rickets (children: soft, bowing bones) and Osteomalacia (adults: bone pain). Scurvy = Vitamin C deficiency. Night blindness = Vitamin A deficiency. Pellagra = Niacin (B3) deficiency." },
      { id: "nq3", topic: "Protein", difficulty: "Easy",
        question: "For muscle building, how much protein per kg body weight is recommended?",
        options: ["0.5 g/kg", "0.8 g/kg", "1.6-2.2 g/kg", "3-4 g/kg"],
        correct: 2,
        explanation: "For muscle growth: 1.6-2.2 g/kg/day (research consensus). Sedentary adults: 0.8 g/kg sufficient. More than 2.2 g/kg shows no additional benefit. Complete sources: eggs, meat, dairy. Plant sources: combine legumes + grains for all essential amino acids." },
    ],
  },
  {
    id: "nutrition-flash",
    title: "Nutrient Facts Flashcards",
    type: "flashcard",
    description: "Key nutrition facts — vitamins, minerals, food sources",
    flashcards: [
      { id: "nff1", category: "Vitamins", front: "Fat-soluble vs water-soluble vitamins", back: "Fat-soluble (stored in body, can overdose): A, D, E, K\nWater-soluble (excreted daily, need regular intake): B1(thiamine), B2(riboflavin), B3(niacin), B5, B6, B7(biotin), B9(folate), B12, C\n\nMnemonic: 'ADEK' are fat-soluble. All B vitamins + C are water-soluble." },
      { id: "nff2", category: "Minerals", front: "Best food sources for iron absorption", back: "Heme iron (better absorbed, 15-35%): red meat, poultry, fish\nNon-heme iron (2-20%): lentils, spinach, tofu, fortified cereals\n\nEnhance absorption: Vitamin C (orange juice with iron-rich foods)\nInhibit absorption: Tea, coffee (tannins), calcium, phytates in whole grains\n\nCombine: dal (iron) + lemon (Vitamin C) = smart pairing" },
      { id: "nff3", category: "Hydration", front: "Signs of dehydration and daily water needs", back: "Daily needs: 2-3 liters (varies with activity, climate)\nSigns of dehydration:\n• Dark yellow/amber urine\n• Dry mouth, headache\n• Fatigue, poor concentration\n• Decreased urine output\n\nGoal: pale yellow urine\nNote: fruits, vegetables contribute ~20% of daily water intake" },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// ESSENTIALS — MENTAL HEALTH
// ═══════════════════════════════════════════════════════
"mental-health": [
  {
    id: "mental-q1",
    title: "Mental Wellness Knowledge Check",
    type: "mcq",
    description: "Evidence-based mental health facts and coping strategies",
    questions: [
      { id: "mhq1", topic: "Self-care", difficulty: "Easy",
        question: "How much sleep do most adults need for optimal mental health?",
        options: ["5-6 hours", "6-7 hours", "7-9 hours", "10+ hours"],
        correct: 2,
        explanation: "7-9 hours is the adult recommendation (National Sleep Foundation). Chronic sleep deprivation increases risk of depression and anxiety by 2-3x. Even one poor night impairs emotional regulation significantly." },
      { id: "mhq2", topic: "Exercise", difficulty: "Easy",
        question: "The minimum weekly physical activity recommended for mental health benefits is:",
        options: ["30 minutes total", "75 minutes", "150 minutes moderate", "300 minutes"],
        correct: 2,
        explanation: "150 minutes of moderate activity (brisk walking, cycling) OR 75 minutes vigorous. Research shows this is equivalent to antidepressants for mild-moderate depression. Any movement is better than none — even 10-minute walks help." },
    ],
  },
  {
    id: "mental-flash",
    title: "Mental Wellness Strategies",
    type: "flashcard",
    description: "Evidence-based strategies for anxiety, stress, and better mental health",
    flashcards: [
      { id: "mhf1", category: "Anxiety", front: "The 4-7-8 breathing technique", back: "4-7-8 breathing (Dr. Andrew Weil):\n1. Empty lungs completely\n2. Inhale through nose for 4 seconds\n3. Hold breath for 7 seconds\n4. Exhale through mouth for 8 seconds\n\nWhy it works: Activates parasympathetic nervous system (rest-and-digest), counteracting stress response. The long exhale slows heart rate. Do 4 cycles." },
      { id: "mhf2", category: "Stress", front: "CBT thought challenging — 4 steps", back: "Cognitive Behavioral Therapy thought record:\n1. Identify the thought ('I'm going to fail this interview')\n2. Evidence FOR the thought\n3. Evidence AGAINST (have you succeeded before?)\n4. Balanced thought ('I may be nervous but I've prepared')\n\nKey insight: Thoughts are not facts. Question automatic negative thoughts." },
      { id: "mhf3", category: "Habits", front: "5-4-3-2-1 grounding technique for anxiety", back: "For acute anxiety/panic:\nName 5 things you can SEE\nName 4 things you can TOUCH\nName 3 things you can HEAR\nName 2 things you can SMELL\nName 1 thing you can TASTE\n\nThis technique anchors you to the present moment, interrupting the anxiety spiral." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// EDUCATION — DSA
// ═══════════════════════════════════════════════════════
"dsa": [
  {
    id: "dsa-q1",
    title: "Data Structures & Algorithms Quiz",
    type: "mcq",
    description: "LeetCode-style conceptual questions on arrays, trees, graphs, DP",
    questions: [
      { id: "dq1", topic: "Arrays", difficulty: "Easy",
        question: "What is the time complexity of accessing an element in an array by index?",
        options: ["O(n)", "O(log n)", "O(1)", "O(n²)"],
        correct: 2,
        explanation: "Array access by index is O(1) — constant time. Arrays store elements in contiguous memory, so element at index i is at memory_start + i × element_size. No iteration needed." },
      { id: "dq2", topic: "Sorting", difficulty: "Medium",
        question: "Which sorting algorithm is best for nearly-sorted data?",
        options: ["Merge Sort", "Quick Sort", "Insertion Sort", "Selection Sort"],
        correct: 2,
        explanation: "Insertion Sort is O(n) for nearly-sorted data — it makes very few swaps when elements are nearly in place. Tim Sort (Python/Java's built-in) uses Insertion Sort for small subarrays for this reason." },
      { id: "dq3", topic: "Trees", difficulty: "Medium",
        question: "In a BST, which traversal gives elements in sorted order?",
        options: ["Preorder", "Postorder", "Inorder", "Level order"],
        correct: 2,
        explanation: "Inorder traversal (Left → Root → Right) of a BST produces elements in ascending sorted order. This is a fundamental property of BST." },
      { id: "dq4", topic: "DP", difficulty: "Hard",
        question: "The 0/1 Knapsack problem with n items and capacity W has time complexity:",
        options: ["O(n)", "O(nW)", "O(n²)", "O(2ⁿ)"],
        correct: 1,
        explanation: "DP solution: O(nW) time and space. We fill an n×W table. Naive recursive is O(2ⁿ). DP avoids recomputation by memoization. Space can be optimized to O(W) with 1D DP array." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// EDUCATION — OS
// ═══════════════════════════════════════════════════════
"os": [
  {
    id: "os-q1",
    title: "Operating Systems Concepts Quiz",
    type: "mcq",
    description: "OS fundamentals — processes, scheduling, memory, synchronization",
    questions: [
      { id: "oq1", topic: "Processes", difficulty: "Easy",
        question: "A process moves from Running to Waiting state when:",
        options: ["A higher priority process arrives", "Its time quantum expires", "It waits for I/O", "It terminates"],
        correct: 2,
        explanation: "Running → Waiting: process waits for I/O or event (blocks voluntarily). Running → Ready: preempted (time quantum expires, higher priority arrives). Running → Terminated: process completes." },
      { id: "oq2", topic: "Scheduling", difficulty: "Medium",
        question: "Which scheduling algorithm can cause starvation?",
        options: ["Round Robin", "FCFS", "Priority Scheduling", "SJF"],
        correct: 2,
        explanation: "Priority scheduling can cause starvation: low-priority processes may never get CPU if high-priority processes keep arriving. Fix: aging (gradually increase priority of waiting processes). FCFS/RR cannot cause starvation." },
      { id: "oq3", topic: "Memory", difficulty: "Medium",
        question: "Internal fragmentation occurs in:",
        options: ["Paging", "Segmentation", "Contiguous allocation", "Dynamic partitioning"],
        correct: 0,
        explanation: "Paging: pages are fixed size; process may not fully use last page → internal fragmentation. Segmentation: variable sizes, no internal fragmentation but external fragmentation. Contiguous allocation → external fragmentation." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// EDUCATION — SYSTEM DESIGN
// ═══════════════════════════════════════════════════════
"system-design": [
  {
    id: "sd-q1",
    title: "System Design Concepts Quiz",
    type: "mcq",
    description: "HLD and LLD concepts — scalability, databases, caching, load balancing",
    questions: [
      { id: "sdq1", topic: "Scalability", difficulty: "Medium",
        question: "Horizontal scaling means:",
        options: ["Upgrading to a more powerful single server", "Adding more servers to a system", "Increasing RAM/CPU on one machine", "Optimizing database queries"],
        correct: 1,
        explanation: "Horizontal (scale out): add more identical servers → distribute load. Vertical (scale up): bigger single machine. Horizontal is preferred for modern distributed systems — cheaper, no single point of failure." },
      { id: "sdq2", topic: "Databases", difficulty: "Hard",
        question: "In the CAP theorem, during a network partition, a system must choose between:",
        options: ["Consistency and Availability", "Speed and Reliability", "Scalability and Cost", "Latency and Throughput"],
        correct: 0,
        explanation: "CAP: Consistency (all nodes same data), Availability (always respond), Partition Tolerance (work despite failures). During partition, choose: CP (consistent but may be unavailable) or AP (available but maybe stale). CA systems can't exist in distributed systems." },
      { id: "sdq3", topic: "Caching", difficulty: "Medium",
        question: "Which cache eviction policy is used when you want to keep frequently accessed items?",
        options: ["FIFO", "LRU (Least Recently Used)", "LFU (Least Frequently Used)", "Random"],
        correct: 2,
        explanation: "LFU evicts items with lowest access frequency — keeps frequently accessed items. LRU evicts least recently accessed — good for temporal locality. LFU is better when access patterns are more stable." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// EDUCATION — PLACEMENT PREP
// ═══════════════════════════════════════════════════════
"placement-prep": [
  {
    id: "placement-q1",
    title: "Placement Aptitude Quiz",
    type: "mcq",
    description: "Common placement test questions — quantitative, logical, verbal reasoning",
    questions: [
      { id: "plq1", topic: "Quantitative", difficulty: "Easy",
        question: "A train 150m long passes a pole in 15 seconds. Its speed in km/h is:",
        options: ["36 km/h", "54 km/h", "72 km/h", "90 km/h"],
        correct: 0,
        explanation: "Speed = distance/time = 150/15 = 10 m/s. Convert: 10 × 18/5 = 36 km/h. (Multiply m/s by 18/5 to get km/h)" },
      { id: "plq2", topic: "Logical", difficulty: "Medium",
        question: "All doctors are qualified. Some qualified people are rich. Which conclusion follows?",
        options: ["All doctors are rich", "Some doctors may be rich", "No doctors are rich", "All rich people are doctors"],
        correct: 1,
        explanation: "From the given statements, we can POSSIBLY conclude that some doctors may be rich (they are qualified, and some qualified are rich). But we cannot say ALL doctors are rich — only POSSIBLE." },
      { id: "plq3", topic: "Verbal", difficulty: "Easy",
        question: "Choose the word most similar in meaning to 'ELOQUENT':",
        options: ["Quiet", "Articulate", "Confused", "Hesitant"],
        correct: 1,
        explanation: "Eloquent means fluent and persuasive in speech. Articulate means able to express ideas clearly. Both describe effective verbal communication. Antonym would be inarticulate, hesitant, or mumbling." },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// EDUCATION — MATHS (School Level)
// ═══════════════════════════════════════════════════════
"maths": [
  {
    id: "school-maths-q1",
    title: "Class 10-12 Mathematics Practice",
    type: "mcq",
    description: "CBSE/ICSE maths — algebra, coordinate geometry, probability",
    questions: [
      { id: "smq1", topic: "Quadratics", difficulty: "Easy",
        question: "The discriminant of ax²+bx+c=0 is b²-4ac. If it equals zero, roots are:",
        options: ["Distinct real roots", "Equal real roots", "Complex roots", "No roots"],
        correct: 1,
        explanation: "D = b²-4ac: D>0 → 2 distinct real roots, D=0 → 2 equal real roots (repeated root), D<0 → 2 complex conjugate roots (no real roots). Equal roots: x = -b/2a." },
      { id: "smq2", topic: "Coordinate Geometry", difficulty: "Medium",
        question: "Distance between points (3,4) and (0,0) is:",
        options: ["5", "7", "√7", "3+4"],
        correct: 0,
        explanation: "Distance = √((x₂-x₁)² + (y₂-y₁)²) = √(9+16) = √25 = 5. This is a 3-4-5 Pythagorean triple. Remember: don't add coordinates (not 3+4=7)." },
    ],
  },
  {
    id: "school-maths-flash",
    title: "Maths Formulas Flashcards",
    type: "flashcard",
    description: "Key Class 10-12 maths formulas",
    flashcards: [
      { id: "smf1", category: "Algebra", front: "Factor theorem and remainder theorem", back: "Remainder theorem: When f(x) is divided by (x-a), remainder = f(a).\nFactor theorem: (x-a) is a factor of f(x) if and only if f(a) = 0.\n\nExample: Is (x-2) a factor of x³-6x²+11x-6?\nf(2) = 8-24+22-6 = 0. Yes, it is a factor!" },
      { id: "smf2", category: "Statistics", front: "Mean, Median, Mode for grouped data", back: "Mean = Σf·x / Σf (weighted average)\nMedian = L + [(n/2 - CF)/f] × h\n  L=lower boundary, CF=cumulative freq before, f=freq of median class, h=class width\nMode = L + [(f₁-f₀)/(2f₁-f₀-f₂)] × h\n  f₁=modal class freq, f₀=preceding, f₂=following" },
    ],
  },
],

};

export function getQuizSetsForTech(academy: string, tech: string): QuizSet[] {
  return allQuizzes[tech] || [];
}

// ══════════════════════════════════════════════
// HEALTHCARE — CPT
// ══════════════════════════════════════════════
const _healthcareExtra: TechQuizzes = {
"cpt": [
  { id: "cpt-q1", title: "CPT Coding Practice", type: "mcq",
    description: "Current Procedural Terminology — evaluation and management, surgery, radiology",
    questions: [
      { id: "cpt1", topic: "E/M", difficulty: "Medium",
        question: "A new patient visits for a minor problem with straightforward medical decision making. Visit lasted 20 minutes. Which CPT code?",
        options: ["99201","99202","99203","99211"],
        correct: 1,
        explanation: "99202: New patient, straightforward MDM OR 15-29 min total time. 99201 was deleted in 2021. 99203 = low complexity MDM or 30-44 min. 99211 = established patient minimal visit (often nurse visit)." },
      { id: "cpt2", topic: "Modifiers", difficulty: "Hard",
        question: "Modifier -25 is used when:",
        options: ["Two surgeons perform one procedure","A significant E/M is on the same day as a procedure","A procedure is incomplete","Bilateral procedure is performed"],
        correct: 1,
        explanation: "Modifier -25: Significant, separately identifiable E/M service same day as a procedure. Both the E/M AND the procedure can be billed. Without -25, payers bundle the E/M into the procedure payment." },
      { id: "cpt3", topic: "Surgery", difficulty: "Medium",
        question: "The global surgical package typically includes:",
        options: ["Preoperative visits only","Preoperative, intraoperative, and postoperative care","Postoperative care for 1 year","Only the surgery itself"],
        correct: 1,
        explanation: "Global surgical package: all services related to surgery — preop E/M (day before/day of), surgery itself, postop care (0, 10, or 90 days depending on code). Comorbidity management billed separately." },
    ],
  },
  { id: "cpt-flash", title: "CPT Key Facts Flashcards", type: "flashcard",
    description: "CPT modifiers, E/M levels, and surgery global periods",
    flashcards: [
      { id: "cptf1", category: "Modifiers", front: "What is Modifier -51?", back: "Multiple procedures — appended to second and subsequent procedures when multiple performed same session. Reduces payment (usually 50%). Do NOT use with add-on codes (designated with +) or modifier -51 exempt codes." },
      { id: "cptf2", category: "E/M", front: "What determines E/M level under 2021 guidelines?", back: "For Office/Outpatient visits (99202-99215): level determined by EITHER Medical Decision Making (MDM) complexity OR Total Time spent. Key MDM elements: number/complexity of problems, amount/complexity of data reviewed, risk of complications." },
      { id: "cptf3", category: "Surgery", front: "Global period lengths for major vs minor surgery", back: "Major surgery (most procedures): 90-day global period. Minor surgery/endoscopy: 10-day global (some 0-day). Postop complications/unrelated conditions can be billed separately. Use -79 for unrelated procedure during global, -78 for related return to OR." },
    ],
  },
],

// ══════════════════════════════════════════════
// HEALTHCARE — HCPCS
// ══════════════════════════════════════════════
"hcpcs": [
  { id: "hcpcs-q1", title: "HCPCS Level II Coding", type: "mcq",
    description: "Healthcare Common Procedure Coding System — DME, drugs, ambulance",
    questions: [
      { id: "hq1", topic: "DME", difficulty: "Easy",
        question: "HCPCS Level II codes are used to report:",
        options: ["Physician services only","Physician and outpatient services","Non-physician services like DME, supplies, and drugs","Hospital inpatient services"],
        correct: 2,
        explanation: "HCPCS Level II: products, supplies, and services NOT in CPT. Primarily for Medicare/Medicaid. Includes DME (E codes), drugs administered non-orally (J codes), ambulance (A codes), orthotics/prosthetics (L codes)." },
      { id: "hq2", topic: "Modifiers", difficulty: "Medium",
        question: "HCPCS modifier GY is used when:",
        options: ["Item meets medical necessity","Item is excluded by statute and not covered","Item is covered but documentation incomplete","Service provided in facility setting"],
        correct: 1,
        explanation: "GY: Item or service is a non-covered/statutory exclusion. Tells Medicare 'we know this isn't covered.' GZ: expected to be denied as not medically necessary (no ABN obtained). KX: documentation on file supporting medical necessity." },
    ],
  },
],

// ══════════════════════════════════════════════
// HEALTHCARE — CODING GUIDELINES
// ══════════════════════════════════════════════
"coding-guidelines": [
  { id: "cg-q1", title: "ICD-10-CM Coding Guidelines MCQ", type: "mcq",
    description: "Official ICD-10-CM coding rules — sequencing, combination codes, signs and symptoms",
    questions: [
      { id: "cgq1", topic: "Sequencing", difficulty: "Medium",
        question: "For outpatient visits, what is coded as the principal/first-listed diagnosis?",
        options: ["The most severe condition","The condition established after study to be chiefly responsible for the visit","The patient's chief complaint","The chronic condition always listed first"],
        correct: 1,
        explanation: "Outpatient: code the condition established to be chiefly responsible for the visit (after workup). If uncertain, code the sign/symptom — do NOT code 'probable' or 'suspected' diagnoses in outpatient (unlike inpatient)." },
      { id: "cgq2", topic: "Combination Codes", difficulty: "Hard",
        question: "When a combination code fully describes the manifestation and the underlying condition, you should:",
        options: ["Code each condition separately","Use only the combination code","Code the combination code plus manifestation code","Code the underlying condition only"],
        correct: 1,
        explanation: "Use the combination code only — do not add additional codes for manifestations already included in the combination code. Example: E11.40 (Type 2 DM with diabetic neuropathy) — do not separately code the neuropathy." },
    ],
  },
  { id: "cg-flash", title: "Coding Guidelines Flashcards", type: "flashcard",
    description: "Essential ICD-10 guidelines every coder must know",
    flashcards: [
      { id: "cgf1", category: "General", front: "What is the difference between 'Code first' and 'Use additional code'?", back: "'Code first' — appears under manifestation codes. The underlying condition is sequenced first, then this code. Example: Diabetic neuropathy — code diabetes first, neuropathy second.\n'Use additional code' — appears under etiology codes. Add another code for the manifestation. Example: Streptococcal infection — code strep first, then the additional code for the manifestation." },
      { id: "cgf2", category: "Inpatient vs Outpatient", front: "Can you code 'probable' diagnoses for inpatient stays?", back: "INPATIENT: Yes — code conditions documented as 'probable,' 'suspected,' 'likely,' 'questionable,' or 'consistent with' as if confirmed.\nOUTPATIENT: No — code signs, symptoms, and test results. Only code confirmed diagnoses. This is one of the biggest inpatient vs outpatient differences." },
    ],
  },
],

// ══════════════════════════════════════════════
// HEALTHCARE — OTHER
// ══════════════════════════════════════════════
"mock-exams": [
  { id: "mock-q1", title: "Medical Coding Mock Exam", type: "mcq",
    description: "Full-length practice exam mixing ICD-10, CPT, and HCPCS coding scenarios",
    questions: [
      { id: "mq1", topic: "ICD-10", difficulty: "Medium",
        question: "Patient with Type 1 diabetes admitted for DKA (diabetic ketoacidosis without coma). Principal diagnosis?",
        options: ["E10.9","E10.10","E10.65","E10.641"],
        correct: 1,
        explanation: "E10.10: Type 1 DM with ketoacidosis without coma. E10.9 = Type 1 DM unspecified. E10.65 = Type 1 DM with hyperglycemia. Always use the most specific code — the ketoacidosis is the reason for admission." },
      { id: "mq2", topic: "CPT", difficulty: "Hard",
        question: "Physician performs an appendectomy, then separately removes a small lipoma on same day under same anesthesia. How should this be coded?",
        options: ["Only appendectomy","Appendectomy + lipoma removal without modifier","Appendectomy + lipoma removal with modifier -51","Only lipoma removal"],
        correct: 2,
        explanation: "Multiple procedures same session: primary procedure (appendectomy) coded first, secondary procedure (lipoma removal) coded with modifier -51 (multiple procedures). Payer typically reduces payment for subsequent procedures." },
      { id: "mq3", topic: "Sequencing", difficulty: "Medium",
        question: "Patient presents with chest pain. After workup, diagnosed with unstable angina. What do you code?",
        options: ["Chest pain only","Unstable angina only","Both chest pain and unstable angina","Angina with chest pain as additional"],
        correct: 1,
        explanation: "When a definitive diagnosis is established, code the diagnosis — not the presenting sign/symptom. Chest pain (R07.x) is NOT coded when angina is the confirmed diagnosis, because chest pain is integral to angina." },
    ],
  },
],
"home-health-coding": [
  { id: "hh-q1", title: "Home Health Coding", type: "mcq",
    description: "ICD-10 coding specific to home health setting — OASIS, primary diagnosis sequencing",
    questions: [
      { id: "hhq1", topic: "Primary Diagnosis", difficulty: "Hard",
        question: "In home health, the primary diagnosis is:",
        options: ["The most life-threatening condition","The condition most related to the plan of care","The admitting diagnosis","The chronic condition"],
        correct: 1,
        explanation: "Home health primary diagnosis: condition most related to the current home health plan of care. NOT necessarily the most severe. If patient is receiving PT for a hip fracture, that's the primary diagnosis even if they have uncontrolled diabetes." },
    ],
  },
],
"patient-documentation": [
  { id: "pd-q1", title: "Clinical Documentation Improvement", type: "flashcard",
    description: "Documentation requirements for accurate and complete medical coding",
    flashcards: [
      { id: "pdf1", category: "Documentation", front: "What is a CDI specialist and what do they do?", back: "CDI (Clinical Documentation Improvement) specialist reviews medical records concurrently (during the stay) to ensure physician documentation supports the actual clinical picture. They query physicians when documentation is vague (e.g., 'malnutrition' vs 'severe malnutrition'), incomplete, or missing. Goal: accurate coding, appropriate reimbursement, quality metrics." },
      { id: "pdf2", category: "Queries", front: "When should a coder query a physician?", back: "Query when: documentation is unclear, conflicting, or insufficient for accurate coding. Common examples: 'anemia' — what type? 'respiratory failure' — acute or chronic? 'UTI' — with or without urosepsis? Query format: compliant, non-leading, offers multiple options including 'clinically undetermined.' Never tell physician what to document." },
    ],
  },
],
"healthcare-admin": [
  { id: "ha-q1", title: "Healthcare Administration Fundamentals", type: "mcq",
    description: "Healthcare billing, revenue cycle, payer types, and compliance",
    questions: [
      { id: "haq1", topic: "Revenue Cycle", difficulty: "Easy",
        question: "The revenue cycle in healthcare begins with:",
        options: ["Claim submission","Patient registration/scheduling","Collections","Charge capture"],
        correct: 1,
        explanation: "Revenue cycle starts at patient registration/scheduling (pre-authorization, insurance verification) and ends when payment is received and posted. Key steps: Registration → Encounter → Charge Capture → Coding → Claim Submission → Payment → Denial Management." },
      { id: "haq2", topic: "Payers", difficulty: "Medium",
        question: "Medicare Part B covers:",
        options: ["Inpatient hospital stays","Physician services and outpatient care","Prescription drugs","Long-term care"],
        correct: 1,
        explanation: "Medicare: Part A = inpatient hospital, SNF, hospice, home health. Part B = physician services, outpatient, preventive care, durable medical equipment. Part C = Medicare Advantage (private). Part D = prescription drugs." },
    ],
  },
],

// ══════════════════════════════════════════════
// ESSENTIALS — GUT HEALTH
// ══════════════════════════════════════════════
"gut-health": [
  { id: "gh-q1", title: "Gut Health Knowledge Check", type: "mcq",
    description: "Microbiome, probiotics, digestive health, and nutrition",
    questions: [
      { id: "ghq1", topic: "Microbiome", difficulty: "Easy",
        question: "Approximately how many bacteria live in the human gut?",
        options: ["1 million","1 billion","38 trillion","38 quadrillion"],
        correct: 2,
        explanation: "The gut microbiome contains ~38 trillion bacteria — roughly equal to the number of human cells. These bacteria help digest food, produce vitamins (K, B12), train the immune system, and even communicate with the brain via the gut-brain axis." },
      { id: "ghq2", topic: "Probiotics", difficulty: "Medium",
        question: "Which of these is a prebiotic (food for gut bacteria), not a probiotic (live bacteria)?",
        options: ["Yogurt (dahi)","Kimchi","Garlic","Kefir"],
        correct: 2,
        explanation: "Prebiotics: non-digestible fibers that feed gut bacteria. Examples: garlic, onion, banana, oats, asparagus. Probiotics: live beneficial bacteria. Examples: yogurt, kefir, kimchi, sauerkraut, kombucha. Think: prebiotics = the food, probiotics = the bacteria." },
    ],
  },
  { id: "gh-flash", title: "Gut Health Flashcards", type: "flashcard",
    description: "Key gut health concepts — microbiome, digestion, diet",
    flashcards: [
      { id: "ghf1", category: "Digestion", front: "What is the difference between soluble and insoluble fiber?", back: "Soluble fiber: dissolves in water, forms gel. Slows digestion, lowers cholesterol, feeds gut bacteria. Sources: oats, apples, lentils, psyllium.\n\nInsoluble fiber: doesn't dissolve, adds bulk. Speeds movement through intestines, prevents constipation. Sources: wheat bran, vegetables, whole grains.\n\nBoth are important. Aim 25-35g total fiber/day." },
      { id: "ghf2", category: "Microbiome", front: "How does stress affect gut health?", back: "Gut-brain axis: bidirectional communication via vagus nerve, hormones, immune signals.\n\nStress effects: reduces beneficial bacteria, increases harmful bacteria, increases intestinal permeability ('leaky gut'), worsens IBS symptoms, alters motility (diarrhea or constipation).\n\n90% of serotonin is made in the gut — gut health directly affects mood." },
    ],
  },
],

// ══════════════════════════════════════════════
// ESSENTIALS — HYGIENE
// ══════════════════════════════════════════════
"hygiene": [
  { id: "hy-q1", title: "Hygiene Essentials Quiz", type: "mcq",
    description: "Hand hygiene, oral health, food safety, and personal care",
    questions: [
      { id: "hyq1", topic: "Hand Hygiene", difficulty: "Easy",
        question: "How long should effective handwashing take?",
        options: ["5 seconds","10 seconds","20-30 seconds (with soap, rubbing)","60 seconds"],
        correct: 2,
        explanation: "WHO recommends 40-60 seconds for soap and water. The 20 seconds is the minimum rubbing time after applying soap. 'Happy Birthday' sung twice ≈ 20 seconds of rubbing. Soap + friction mechanically removes pathogens — water alone is insufficient." },
      { id: "hyq2", topic: "Oral Health", difficulty: "Easy",
        question: "Which is more important: brushing in the morning or brushing before bed?",
        options: ["Morning (freshen breath)","Before bed (more important)","Equal importance","Neither matters with mouthwash"],
        correct: 1,
        explanation: "Before bed is MORE critical. Saliva production drops during sleep, reducing natural cleaning. Bacteria left on teeth for 8 hours cause significantly more damage. Morning brushing removes overnight bacterial buildup. Floss at night — most cavities form between teeth." },
    ],
  },
  { id: "hy-flash", title: "Hygiene Best Practices", type: "flashcard",
    description: "Evidence-based hygiene practices for daily life",
    flashcards: [
      { id: "hyf1", category: "Hand Hygiene", front: "Soap vs hand sanitizer — when to use each?", back: "Soap and water: BETTER for — visible dirt, C. difficile (spores), norovirus, cryptosporidium, before eating/cooking, after toilet. Minimum 20 seconds scrubbing.\n\nHand sanitizer (≥60% alcohol): BETTER for — when no sink available, COVID-19/flu, quick sanitization between patients (healthcare). Less effective against spores and some viruses.\n\nRule: soap for food/illness prevention, sanitizer for convenience." },
    ],
  },
],

// ══════════════════════════════════════════════
// ESSENTIALS — FIRST AID
// ══════════════════════════════════════════════
"first-aid": [
  { id: "fa-q1", title: "First Aid Knowledge Check", type: "mcq",
    description: "CPR, choking, burns, bleeding, and emergency response",
    questions: [
      { id: "faq1", topic: "CPR", difficulty: "Medium",
        question: "The correct compression rate for adult CPR is:",
        options: ["60 per minute","72 per minute","100-120 per minute","150 per minute"],
        correct: 2,
        explanation: "100-120 compressions per minute. The song 'Stayin' Alive' by Bee Gees is 103 BPM — often used as a reference. Compress 5-6 cm deep on the lower half of the sternum. Allow full chest recoil between compressions." },
      { id: "faq2", topic: "Burns", difficulty: "Easy",
        question: "The correct first aid for a burn is:",
        options: ["Apply butter or oil","Apply toothpaste","Cool under running water for 20 minutes","Apply ice directly"],
        correct: 2,
        explanation: "Cool under RUNNING water for 20 minutes — removes heat from tissue and reduces damage. Do NOT use ice (causes frostbite on damaged skin), butter, toothpaste, or any home remedies. Cover with cling film or clean wrap after cooling." },
      { id: "faq3", topic: "Choking", difficulty: "Medium",
        question: "For a conscious adult who is choking and cannot speak or cough, you should:",
        options: ["Give them water","Perform 5 back blows, then 5 abdominal thrusts, alternating","Perform abdominal thrusts only","Put fingers in mouth to remove object"],
        correct: 1,
        explanation: "5 back blows (heel of hand between shoulder blades) then 5 abdominal thrusts (Heimlich: fist above navel, pull up and in). Alternate until object dislodges or person becomes unconscious. Do NOT perform blind finger sweeps — may push object deeper." },
    ],
  },
  { id: "fa-flash", title: "First Aid Quick Reference", type: "flashcard",
    description: "Emergency first aid protocols for common situations",
    flashcards: [
      { id: "faf1", category: "CPR", front: "DRSABCD — Emergency action protocol", back: "D — Danger: Is the scene safe for you?\nR — Response: Tap shoulders, shout — conscious?\nS — Send for help: Call 112 / 108\nA — Airway: Tilt head, lift chin\nB — Breathing: Look, listen, feel 10 seconds\nC — CPR: 30 compressions : 2 breaths (or hands-only)\nD — Defibrillator: Use AED if available" },
      { id: "faf2", category: "Bleeding", front: "How to control severe bleeding", back: "1. Apply DIRECT PRESSURE with clean cloth — most important step\n2. Maintain pressure — don't lift to check (breaks clot)\n3. Elevate limb above heart if possible\n4. If cloth soaks through — add more ON TOP, don't remove\n5. Tourniquet: ONLY for life-threatening limb bleeding when pressure fails\n   Apply 5-7cm above wound, note time applied\n6. Call 108 for severe bleeding" },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — SCIENCE (School level)
// ══════════════════════════════════════════════
"science": [
  { id: "sci-q1", title: "Science Fundamentals Quiz", type: "mcq",
    description: "Physics, Chemistry, Biology — Class 9-10 level concepts",
    questions: [
      { id: "sciq1", topic: "Physics", difficulty: "Easy",
        question: "Newton's second law of motion states that force equals:",
        options: ["Mass × Velocity","Mass × Acceleration","Mass × Distance","Velocity / Time"],
        correct: 1,
        explanation: "F = ma (Force = mass × acceleration). This is Newton's Second Law. First Law: object at rest stays at rest unless force applied. Third Law: every action has equal and opposite reaction. SI unit of force: Newton (N) = kg⋅m/s²." },
      { id: "sciq2", topic: "Chemistry", difficulty: "Easy",
        question: "What is the chemical formula for water?",
        options: ["HO","H2O","H2O2","OH"],
        correct: 1,
        explanation: "H2O: 2 hydrogen atoms + 1 oxygen atom. H2O2 = hydrogen peroxide. Water has bent molecular geometry (104.5°) due to 2 lone pairs on oxygen. Boils at 100°C, freezes at 0°C at 1 atm." },
      { id: "sciq3", topic: "Biology", difficulty: "Easy",
        question: "Which organelle is responsible for photosynthesis in plants?",
        options: ["Mitochondria","Nucleus","Chloroplast","Ribosome"],
        correct: 2,
        explanation: "Chloroplasts perform photosynthesis: 6CO₂ + 6H₂O → C₆H₁₂O₆ + 6O₂ (using sunlight). Mitochondria perform cellular respiration (reverse process). Chloroplasts contain green pigment chlorophyll." },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — CS SCHOOL
// ══════════════════════════════════════════════
"cs-school": [
  { id: "css-q1", title: "Computer Science Fundamentals", type: "mcq",
    description: "Class 11-12 Computer Science — Python, data structures, networking basics",
    questions: [
      { id: "cssq1", topic: "Python", difficulty: "Easy",
        question: "What is the output of: print(type(5/2)) in Python 3?",
        options: ["<class 'int'>","<class 'float'>","<class 'double'>","Error"],
        correct: 1,
        explanation: "Python 3: 5/2 = 2.5 (float). Division always returns float in Python 3. Use // for integer division: 5//2 = 2. In Python 2, 5/2 = 2 (integer) — a common source of bugs." },
      { id: "cssq2", topic: "Data Structures", difficulty: "Medium",
        question: "Which data structure works on LIFO (Last In First Out) principle?",
        options: ["Queue","Stack","Array","Linked List"],
        correct: 1,
        explanation: "Stack: LIFO — last item pushed is first popped. Like a stack of plates. Operations: push (add), pop (remove top), peek (see top). Queue: FIFO — first in, first out. Like a line at a ticket counter." },
    ],
  },
  { id: "css-flash", title: "CS Concepts Flashcards", type: "flashcard",
    description: "Key computer science terms and concepts",
    flashcards: [
      { id: "cssf1", category: "Networks", front: "What is the difference between TCP and UDP?", back: "TCP (Transmission Control Protocol): Connection-oriented, reliable, ordered, error-checked. Uses 3-way handshake (SYN→SYN-ACK→ACK). Slower but guaranteed delivery. Used for: HTTP, email, file transfer.\n\nUDP (User Datagram Protocol): Connectionless, unreliable, faster, no error recovery. Used for: video streaming, gaming, DNS (where speed > reliability)." },
      { id: "cssf2", category: "Database", front: "What is SQL and name 4 key commands", back: "SQL = Structured Query Language — used to manage relational databases.\n\nDML (Data Manipulation): SELECT, INSERT, UPDATE, DELETE\nDDL (Data Definition): CREATE TABLE, ALTER TABLE, DROP TABLE\nDCL (Data Control): GRANT, REVOKE\n\nMost used: SELECT * FROM table WHERE condition ORDER BY column LIMIT n" },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — DBMS (College level)
// ══════════════════════════════════════════════
"dbms": [
  { id: "dbms-q1", title: "DBMS Concepts Quiz", type: "mcq",
    description: "Database Management Systems — normalization, transactions, SQL, indexing",
    questions: [
      { id: "dbq1", topic: "Normalization", difficulty: "Hard",
        question: "A table has FD: {A,B} → C and B → D. Which normal form is violated?",
        options: ["1NF","2NF","3NF","BCNF"],
        correct: 1,
        explanation: "2NF violation: B → D is a partial dependency (D depends only on B, not on the full composite key {A,B}). To fix 2NF: decompose into R1(A,B,C) and R2(B,D). 3NF violation would be a transitive dependency. This is 2NF violation because D is partially dependent on the composite key." },
      { id: "dbq2", topic: "Transactions", difficulty: "Medium",
        question: "Which isolation level allows 'dirty reads'?",
        options: ["Serializable","Repeatable Read","Read Committed","Read Uncommitted"],
        correct: 3,
        explanation: "Read Uncommitted: reads uncommitted changes of other transactions (dirty reads). Read Committed: no dirty reads but allows non-repeatable reads. Repeatable Read: no non-repeatable reads but allows phantom reads. Serializable: strictest, no anomalies, slowest." },
      { id: "dbq3", topic: "Indexing", difficulty: "Medium",
        question: "A B+ tree index on a column with 1 million records typically has height of:",
        options: ["1,000,000","1000","4-5","10,000"],
        correct: 2,
        explanation: "B+ tree height = log_d(n) where d is node degree (typically 100-1000 pointers per node). For 1M records with degree 100: height ≈ log₁₀₀(1,000,000) = 3. Most databases reach any record in 3-5 disk reads regardless of table size." },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — CN (Computer Networks)
// ══════════════════════════════════════════════
"cn": [
  { id: "cn-q1", title: "Computer Networks Quiz", type: "mcq",
    description: "Networking fundamentals — OSI, TCP/IP, routing, protocols",
    questions: [
      { id: "cnq1", topic: "OSI Model", difficulty: "Medium",
        question: "Which OSI layer is responsible for end-to-end error detection and flow control?",
        options: ["Network (L3)","Transport (L4)","Data Link (L2)","Session (L5)"],
        correct: 1,
        explanation: "Transport layer (L4): TCP provides reliable end-to-end delivery with error detection, flow control, and congestion control. UDP is also L4 but unreliable. Data Link (L2) handles hop-by-hop error detection (within one network segment). Network (L3) handles routing between networks." },
      { id: "cnq2", topic: "Subnetting", difficulty: "Hard",
        question: "A subnet mask of 255.255.255.192 (/26) allows how many usable host addresses?",
        options: ["64","62","30","126"],
        correct: 1,
        explanation: "/26 = 26 network bits, 6 host bits. 2⁶ = 64 total addresses. Subtract 2 (network address + broadcast) = 62 usable hosts. /24 = 254 usable, /25 = 126 usable, /26 = 62 usable, /27 = 30 usable, /28 = 14 usable." },
      { id: "cnq3", topic: "Protocols", difficulty: "Easy",
        question: "DNS primarily uses which port?",
        options: ["80","443","53","22"],
        correct: 2,
        explanation: "DNS: port 53 (UDP for queries, TCP for zone transfers >512 bytes). HTTP: 80. HTTPS: 443. SSH: 22. SMTP: 25. FTP: 21. RDP: 3389. DHCP: 67/68." },
    ],
  },
  { id: "cn-flash", title: "Networking Flashcards", type: "flashcard",
    description: "OSI layers, protocols, IP addressing quick reference",
    flashcards: [
      { id: "cnf1", category: "OSI", front: "What are the 7 OSI layers? (bottom to top)", back: "1. Physical — cables, signals, bits\n2. Data Link — MAC addresses, frames, switches\n3. Network — IP addresses, routing, packets\n4. Transport — TCP/UDP, ports, end-to-end reliability\n5. Session — sessions, dialog control\n6. Presentation — encryption, compression, encoding\n7. Application — HTTP, FTP, DNS, SMTP\n\nMnemonic: 'Please Do Not Throw Sausage Pizza Away'" },
      { id: "cnf2", category: "Routing", front: "Difference between static and dynamic routing", back: "Static routing: Manually configured routes. Simple, secure, no overhead. Use for: small networks, specific routes, default gateway.\nDynamic routing: Routers exchange routing info automatically. Protocols: RIP (distance vector, max 15 hops), OSPF (link state, large networks), BGP (path vector, internet backbone).\n\nOSPF: used inside organizations. BGP: used between ISPs and autonomous systems." },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — JAVA
// ══════════════════════════════════════════════
"java": [
  { id: "java-q1", title: "Java Programming Quiz", type: "mcq",
    description: "Core Java — OOP, collections, exceptions, multithreading",
    questions: [
      { id: "jvq1", topic: "OOP", difficulty: "Medium",
        question: "Which keyword prevents a method from being overridden in Java?",
        options: ["static","private","final","abstract"],
        correct: 2,
        explanation: "final method cannot be overridden by subclasses. final class cannot be extended (e.g., String class). final variable cannot be reassigned. abstract is the opposite — must be overridden. private methods can't be overridden (not inherited)." },
      { id: "jvq2", topic: "Collections", difficulty: "Medium",
        question: "Which Java collection maintains insertion order and allows duplicates?",
        options: ["HashSet","TreeSet","ArrayList","HashMap"],
        correct: 2,
        explanation: "ArrayList: maintains insertion order, allows duplicates, index-based access O(1). LinkedList: also ordered + duplicates, better for frequent inserts/deletes. HashSet: no order, no duplicates. TreeSet: sorted, no duplicates." },
      { id: "jvq3", topic: "Exceptions", difficulty: "Easy",
        question: "NullPointerException is a:",
        options: ["Checked exception","Unchecked exception","Error","Compile-time exception"],
        correct: 1,
        explanation: "NullPointerException extends RuntimeException = unchecked exception. Unchecked: don't need try-catch (compiler doesn't require it). Checked: must catch or declare throws (IOException, SQLException). Errors: serious JVM issues (OutOfMemoryError, StackOverflowError)." },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — C PROGRAMMING
// ══════════════════════════════════════════════
"c-programming": [
  { id: "c-q1", title: "C Programming Quiz", type: "mcq",
    description: "C language — pointers, memory, structs, file I/O",
    questions: [
      { id: "cq1", topic: "Pointers", difficulty: "Hard",
        question: "What does the expression *ptr++ do?",
        options: ["Increments ptr, then dereferences","Dereferences ptr, then increments ptr","Dereferences the incremented address","Syntax error"],
        correct: 1,
        explanation: "Operator precedence: ++ (postfix) > * (dereference). *ptr++ means: dereference ptr (get value at ptr), THEN increment ptr to next element. Same as *(ptr++) but written more concisely. Used for iterating through arrays." },
      { id: "cq2", topic: "Memory", difficulty: "Medium",
        question: "malloc() differs from calloc() in that malloc:",
        options: ["Allocates more memory","Does not initialize memory to zero","Only allocates for one element","Automatically frees memory"],
        correct: 1,
        explanation: "malloc(n): allocates n bytes, uninitialized (contains garbage values). calloc(count, size): allocates count*size bytes, initializes ALL to zero. calloc is safer (no uninitialized reads) but slightly slower. Use calloc when you need zero-initialized memory." },
    ],
  },
],

// ══════════════════════════════════════════════
// EDUCATION — CPP
// ══════════════════════════════════════════════
"cpp": [
  { id: "cpp-q1", title: "C++ Programming Quiz", type: "mcq",
    description: "C++ features — STL, OOP, templates, memory management",
    questions: [
      { id: "cppq1", topic: "STL", difficulty: "Medium",
        question: "What is the time complexity of std::map::find()?",
        options: ["O(1)","O(log n)","O(n)","O(n log n)"],
        correct: 1,
        explanation: "std::map uses a balanced BST (Red-Black Tree): O(log n) for find, insert, erase. std::unordered_map uses hash table: O(1) average. Use map when you need sorted order; unordered_map when you need speed." },
      { id: "cppq2", topic: "Memory", difficulty: "Hard",
        question: "Which smart pointer should be used when multiple objects need shared ownership?",
        options: ["unique_ptr","weak_ptr","shared_ptr","auto_ptr"],
        correct: 2,
        explanation: "shared_ptr: reference-counted, multiple owners. Freed when last owner is destroyed. weak_ptr: non-owning observer of shared_ptr (breaks circular references). unique_ptr: single owner, cheaper than shared_ptr. auto_ptr: deprecated in C++11, removed in C++17." },
    ],
  },
],

// ══════════════════════════════════════════════
// EXAMS — GATE ECE
// ══════════════════════════════════════════════
"gate-ece": [
  { id: "gate-ece-q1", title: "GATE ECE: Electronics & Communication", type: "mcq",
    description: "GATE ECE key topics — signals, circuits, communications, electromagnetics",
    timeLimit: 90,
    questions: [
      { id: "ge1", topic: "Signals", difficulty: "Medium",
        question: "The Fourier transform of a rectangular pulse of width T is a:",
        options: ["Rectangular function","Sinc function","Gaussian function","Triangular function"],
        correct: 1,
        explanation: "FT of rect(t/T) = T⋅sinc(fT). The sinc function = sin(πx)/(πx). Key property: narrower pulse in time → wider bandwidth in frequency. This is the time-frequency uncertainty principle. Widely used in DSP and communication theory." },
      { id: "ge2", topic: "Circuits", difficulty: "Hard",
        question: "In a series RLC circuit at resonance, the impedance is:",
        options: ["Maximum","Minimum (= R only)","Zero","Infinite"],
        correct: 1,
        explanation: "At resonance (ω₀ = 1/√LC): inductive reactance (jωL) and capacitive reactance (-j/ωC) cancel. Net impedance = R only. Current is maximum. Q factor = ω₀L/R = bandwidth measure. For parallel RLC at resonance: impedance is maximum." },
      { id: "ge3", topic: "Communications", difficulty: "Medium",
        question: "Shannon's channel capacity formula is:",
        options: ["C = B log₂(1+SNR)","C = B × SNR","C = 2B log₂(M)","C = B/SNR"],
        correct: 0,
        explanation: "Shannon-Hartley: C = B log₂(1 + S/N) where C = capacity (bps), B = bandwidth (Hz), S/N = signal-to-noise ratio (linear, not dB). Doubling bandwidth doubles capacity. Doubling SNR adds only log₂(2) = 1 bit/Hz. Bandwidth is more valuable than SNR." },
      { id: "ge4", topic: "Semiconductors", difficulty: "Medium",
        question: "The built-in potential of a p-n junction is due to:",
        options: ["Applied voltage","Diffusion of majority carriers creating a depletion region","Minority carriers only","Avalanche breakdown"],
        correct: 1,
        explanation: "At p-n junction: holes from p-side diffuse to n-side, electrons from n-side diffuse to p-side. This creates a depletion region with fixed charges → built-in electric field → built-in potential Vbi. Drift current balances diffusion current at equilibrium." },
    ],
  },
  { id: "gate-ece-flash", title: "ECE Key Formulas Flashcards", type: "flashcard",
    description: "Must-know GATE ECE formulas and concepts",
    flashcards: [
      { id: "gef1", category: "Signals", front: "Key Fourier Transform pairs to memorize", back: "1. rect(t) ↔ sinc(f)\n2. δ(t) ↔ 1 (impulse has flat spectrum)\n3. e^(-at)u(t) ↔ 1/(a+j2πf)\n4. cos(2πf₀t) ↔ ½[δ(f-f₀) + δ(f+f₀)]\n5. e^(j2πf₀t) ↔ δ(f-f₀)\n6. Convolution in time ↔ Multiplication in frequency\n7. Multiplication in time ↔ Convolution in frequency" },
      { id: "gef2", category: "Control Systems", front: "Transfer function and stability criteria", back: "Transfer function H(s) = Y(s)/X(s) = N(s)/D(s)\nPoles: roots of D(s). Zeros: roots of N(s).\n\nStability:\n• BIBO stable: all poles have negative real parts (left half s-plane)\n• Marginally stable: poles on imaginary axis\n• Routh-Hurwitz: all coefficients of char. polynomial positive (necessary, not sufficient)\n• Gain margin, Phase margin: from Bode plot" },
    ],
  },
],

// ══════════════════════════════════════════════
// EXAMS — RRB NTPC
// ══════════════════════════════════════════════
"rrb-ntpc": [
  { id: "rrb-q1", title: "RRB NTPC Practice Test", type: "mcq",
    description: "Railways NTPC — Mathematics, Reasoning, General Awareness",
    timeLimit: 60,
    questions: [
      { id: "rq1", topic: "Maths", difficulty: "Easy",
        question: "A train travels 360 km in 4 hours. Its speed in m/s is:",
        options: ["25 m/s","90 m/s","100 m/s","36 m/s"],
        correct: 0,
        explanation: "Speed = 360/4 = 90 km/h. Convert: 90 × 1000/3600 = 90 × 5/18 = 25 m/s. Rule: km/h to m/s: multiply by 5/18. m/s to km/h: multiply by 18/5." },
      { id: "rq2", topic: "Reasoning", difficulty: "Medium",
        question: "Series: 2, 6, 18, 54, ?",
        options: ["108","162","180","216"],
        correct: 1,
        explanation: "Each term multiplied by 3: 2×3=6, 6×3=18, 18×3=54, 54×3=162. This is a GP with ratio 3. Always check: is it AP (constant difference) or GP (constant ratio) or mixed pattern?" },
      { id: "rq3", topic: "GK", difficulty: "Easy",
        question: "Which is the longest railway platform in the world (as of 2024)?",
        options: ["New Jalpaiguri","Kharagpur","Gorakhpur","Hubli"],
        correct: 2,
        explanation: "Gorakhpur Junction in UP holds the Guinness record for world's longest railway platform at ~1.3 km. Hubli is the longest single railway platform in India at 1.5 km (in some records). Check latest for exam — records get updated." },
      { id: "rq4", topic: "Maths", difficulty: "Medium",
        question: "What is 15% of 80% of 500?",
        options: ["50","60","75","80"],
        correct: 1,
        explanation: "80% of 500 = 400. 15% of 400 = 60. Alternative: 500 × 0.80 × 0.15 = 500 × 0.12 = 60. For 'X% of Y% of Z': multiply all together: Z × X/100 × Y/100." },
    ],
  },
  { id: "rrb-flash", title: "RRB NTPC Quick Revision", type: "flashcard",
    description: "Railway GK and shortcut formulas for RRB NTPC",
    flashcards: [
      { id: "rrbf1", category: "Indian Railways", front: "Key Indian Railways facts for RRB exams", back: "Zones: 18 railway zones (Southern, Northern, Western, etc.)\nHeadquarters: Railway Board = New Delhi\nFirst railway: 1853 Bombay to Thane (34 km, Great Indian Peninsula Railway)\nLongest train: Vivek Express (Dibrugarh to Kanyakumari, 4273 km)\nFastest train: Vande Bharat Express (180 km/h design speed)\nRailway Day: 16 April (commemorate first train 1853)" },
      { id: "rrbf2", category: "Aptitude Tricks", front: "Quick percentage calculation tricks", back: "10% of X: move decimal left 1 place\n5% of X: half of 10%\n15% of X: 10% + 5%\n25% of X: divide by 4\n33.33% ≈ divide by 3\n\nPercentage increase: (new - old)/old × 100\nIf price increases by r%, quantity decrease to maintain expenditure: 100r/(100+r)%\n\nTrick: 15% of 80 = 80% of 15 = 12 (commutative)" },
    ],
  },
],

// ══════════════════════════════════════════════
// EXAMS — UPSC MAINS
// ══════════════════════════════════════════════
"upsc-mains": [
  { id: "upsc-mains-q1", title: "UPSC Mains GS Papers Practice", type: "mcq",
    description: "UPSC Mains GS 1-4 — History, Polity, Economy, Ethics scenarios",
    timeLimit: 180,
    questions: [
      { id: "umq1", topic: "GS2 Polity", difficulty: "Hard",
        question: "Which schedule of the Constitution contains the oath/affirmations for constitutional offices?",
        options: ["Second Schedule","Third Schedule","Fourth Schedule","Fifth Schedule"],
        correct: 1,
        explanation: "Third Schedule: Oaths and affirmations for President, Vice-President, Ministers, MPs, Judges, etc. Second Schedule: emoluments for constitutional office holders. Fourth Schedule: allocation of Rajya Sabha seats. Fifth Schedule: administration of scheduled areas." },
      { id: "umq2", topic: "GS3 Economy", difficulty: "Hard",
        question: "Fiscal deficit is defined as:",
        options: ["Revenue receipts minus revenue expenditure","Total expenditure minus total receipts excluding borrowings","Revenue expenditure minus capital expenditure","Tax revenues minus total expenditure"],
        correct: 1,
        explanation: "Fiscal deficit = Total expenditure – Total receipts excluding borrowings. Shows the extent to which government borrows. Revenue deficit = Revenue expenditure – Revenue receipts (only current operations). Primary deficit = Fiscal deficit – Interest payments (shows current borrowing excluding past debt servicing)." },
      { id: "umq3", topic: "GS4 Ethics", difficulty: "Medium",
        question: "Which philosopher argued for the 'Greatest Happiness of Greatest Number' as the moral principle?",
        options: ["Immanuel Kant","Jeremy Bentham","John Rawls","Aristotle"],
        correct: 1,
        explanation: "Jeremy Bentham: founder of Utilitarianism — the right action maximizes total happiness. John Stuart Mill refined it. Kant: Categorical Imperative (duty-based ethics, deontology). Rawls: Theory of Justice (veil of ignorance). Aristotle: Virtue ethics (eudaimonia)." },
    ],
  },
  { id: "upsc-mains-flash", title: "UPSC Mains Answer Writing Tips", type: "flashcard",
    description: "Structure, keywords, and strategy for UPSC Mains answers",
    flashcards: [
      { id: "umf1", category: "Answer Writing", front: "Structure for a 15-mark UPSC Mains answer (200 words)", back: "Introduction (2-3 sentences): Define/contextualize the topic. Quote a committee, article, or current event.\n\nMain body (4-6 paragraphs):\n• Present ALL dimensions: economic, social, political, environmental, international\n• Use subheadings for long answers\n• Give examples: India-specific, global comparisons\n• Mention government schemes, committees, constitutional provisions\n\nConclusion (2-3 sentences):\n• Way forward, balanced view, future prospects\n• Never just summarize — add something new" },
      { id: "umf2", category: "GS4 Ethics", front: "Key ethical theories for UPSC GS4", back: "Consequentialism: judge actions by outcomes. Utilitarianism: maximize total happiness (Bentham, Mill).\n\nDeontology: judge actions by rules/duties regardless of outcome (Kant's Categorical Imperative: 'Act only as you would will it to be universal law')\n\nVirtue Ethics: focus on character, not rules (Aristotle — cultivate virtues: honesty, courage, justice)\n\nCase Studies: Apply ALL three perspectives. Show you understand trade-offs between them." },
    ],
  },
],
};

// Merge the extra quizzes into allQuizzes
Object.assign(allQuizzes, _healthcareExtra);
