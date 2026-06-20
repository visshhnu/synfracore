// SynfraCore Education Section — /learn
// Separate from /academies (professional) — this is academic (school to PhD)

export type Chapter = {
  slug: string;
  title: string;
  description: string;
  topics: string[];           // key concepts in this chapter
  pyqYears?: string[];        // which years had PYQs from this chapter
};

export type Subject = {
  slug: string;
  name: string;
  icon: string;
  description: string;
  chapters: Chapter[];
};

export type Board = {
  slug: string;
  name: string;
  shortName: string;
  icon: string;
  color: string;
  description: string;
  subjects: Subject[];
};

// ── SCHOOL: CLASS 9 & 10 ──────────────────────────────────────────────────

export const class10Subjects: Subject[] = [
  {
    slug: "maths",
    name: "Mathematics",
    icon: "📐",
    description: "CBSE Class 10 Mathematics — complete chapter-wise study material, solved examples, PYQs, and MCQ practice",
    chapters: [
      { slug: "real-numbers", title: "Real Numbers", description: "Euclid's division lemma, fundamental theorem of arithmetic, irrational numbers", topics: ["Euclid's Algorithm","HCF and LCM","Irrational Numbers","Decimal Expansions"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "polynomials", title: "Polynomials", description: "Zeroes of polynomials, relationship between zeroes and coefficients", topics: ["Zeroes of Polynomial","Graphical Meaning","Division Algorithm"], pyqYears: ["2023","2022","2021"] },
      { slug: "linear-equations", title: "Pair of Linear Equations in Two Variables", description: "Graphical and algebraic methods, consistency conditions", topics: ["Substitution Method","Elimination Method","Cross Multiplication","Graphical Method"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "quadratic-equations", title: "Quadratic Equations", description: "Standard form, methods of solving, nature of roots", topics: ["Factorisation","Completing the Square","Quadratic Formula","Discriminant"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "arithmetic-progressions", title: "Arithmetic Progressions", description: "nth term, sum of n terms, applications", topics: ["General Term","Sum of AP","Arithmetic Mean","Applications"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "triangles", title: "Triangles", description: "Similarity criteria, Pythagoras theorem, areas of similar triangles", topics: ["Basic Proportionality Theorem","AA/SSS/SAS Similarity","Pythagoras Theorem","Areas of Similar Triangles"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "coordinate-geometry", title: "Coordinate Geometry", description: "Distance formula, section formula, area of triangle", topics: ["Distance Formula","Section Formula","Midpoint Formula","Area of Triangle"], pyqYears: ["2023","2022","2021"] },
      { slug: "trigonometry", title: "Introduction to Trigonometry", description: "Trigonometric ratios, identities, complementary angles", topics: ["Trigonometric Ratios","Reciprocal Relations","Trigonometric Identities","Complementary Angles"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "heights-distances", title: "Some Applications of Trigonometry", description: "Heights and distances problems with angles of elevation/depression", topics: ["Angle of Elevation","Angle of Depression","Heights and Distances","Real Applications"], pyqYears: ["2023","2022","2021"] },
      { slug: "circles", title: "Circles", description: "Tangents to a circle, properties and theorems", topics: ["Tangent from External Point","Length of Tangent","Chord and Tangent","Number of Tangents"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "constructions", title: "Constructions", description: "Division of line segment, construction of tangents", topics: ["Division of Line Segment","Similar Triangles","Tangent to Circle","Geometric Constructions"], pyqYears: ["2023","2022"] },
      { slug: "areas-related-circles", title: "Areas Related to Circles", description: "Area and perimeter of circular figures, sector, segment", topics: ["Area of Circle","Area of Sector","Area of Segment","Combination Figures"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "surface-areas-volumes", title: "Surface Areas and Volumes", description: "Combination of solids, conversion of solids, frustum", topics: ["Combination of Solids","Volume of Combinations","Frustum of Cone","Conversion Problems"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "statistics", title: "Statistics", description: "Mean, median, mode for grouped data, cumulative frequency", topics: ["Mean of Grouped Data","Mode of Grouped Data","Median","Ogive (Cumulative Frequency)"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "probability", title: "Probability", description: "Classical probability, theoretical approach", topics: ["Classical Definition","Complementary Events","Cards Problems","Dice Problems"], pyqYears: ["2023","2022","2021","2020"] },
    ],
  },
  {
    slug: "science",
    name: "Science",
    icon: "🔬",
    description: "CBSE Class 10 Science — Physics, Chemistry, Biology with NCERT solutions, experiments, and board exam prep",
    chapters: [
      { slug: "chemical-reactions", title: "Chemical Reactions and Equations", description: "Types of chemical reactions, balancing equations", topics: ["Combination Reaction","Decomposition","Displacement","Double Displacement","Redox","Balancing Equations"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "acids-bases-salts", title: "Acids, Bases and Salts", description: "Properties, pH scale, important salts", topics: ["Properties of Acids","Properties of Bases","pH Scale","Salts","Baking Soda","Washing Soda"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "metals-nonmetals", title: "Metals and Non-metals", description: "Physical and chemical properties, reactivity series, extraction", topics: ["Physical Properties","Chemical Properties","Reactivity Series","Extraction of Metals","Corrosion"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "carbon-compounds", title: "Carbon and Its Compounds", description: "Covalent bonds, organic compounds, chemical reactions", topics: ["Covalent Bonding","Versatile Nature of Carbon","Homologous Series","Ethanol","Ethanoic Acid","Soaps and Detergents"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "periodic-classification", title: "Periodic Classification of Elements", description: "Mendeleev's table, modern periodic table, trends", topics: ["Mendeleev's Periodic Law","Modern Periodic Table","Periods and Groups","Periodic Trends","Dobereiner's Triads","Newlands Law of Octaves"], pyqYears: ["2023","2022","2021"] },
      { slug: "life-processes", title: "Life Processes", description: "Nutrition, respiration, transportation, excretion", topics: ["Autotrophic Nutrition","Heterotrophic Nutrition","Aerobic Respiration","Anaerobic Respiration","Transportation in Plants","Transportation in Animals","Excretion in Plants","Excretion in Humans"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "control-coordination", title: "Control and Coordination", description: "Nervous system, hormones, tropic movements", topics: ["Nervous System","Brain","Reflex Action","Hormones","Tropic Movements","Chemical Coordination"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "reproduction", title: "How Do Organisms Reproduce?", description: "Asexual and sexual reproduction, reproductive health", topics: ["Asexual Reproduction","Sexual Reproduction in Plants","Sexual Reproduction in Animals","Human Reproductive System","Reproductive Health"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "heredity-evolution", title: "Heredity and Evolution", description: "Mendel's laws, evolution, natural selection", topics: ["Heredity","Mendel's Laws","Sex Determination","Evolution","Natural Selection","Speciation"], pyqYears: ["2023","2022","2021"] },
      { slug: "light", title: "Light - Reflection and Refraction", description: "Laws of reflection, refraction, lenses and mirrors", topics: ["Reflection","Laws of Reflection","Mirrors (Concave/Convex)","Mirror Formula","Refraction","Snell's Law","Total Internal Reflection","Lenses"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "human-eye", title: "Human Eye and The Colourful World", description: "Structure of eye, defects, atmospheric phenomena", topics: ["Human Eye","Power of Accommodation","Defects of Vision","Atmospheric Refraction","Tyndall Effect","Scattering of Light"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "electricity", title: "Electricity", description: "Ohm's law, electric circuits, power, heating effect", topics: ["Electric Current","Ohm's Law","Resistance","Combination of Resistors","Heating Effect","Electric Power"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "magnetic-effects", title: "Magnetic Effects of Electric Current", description: "Magnetic field, electromagnets, motors, generators", topics: ["Magnetic Field","Oersted Experiment","Electromagnet","Electric Motor","Electromagnetic Induction","Electric Generator","Domestic Circuits"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "environment", title: "Our Environment", description: "Ecosystem, food chains, ozone depletion", topics: ["Ecosystem","Food Chain","Food Web","Trophic Levels","Biodegradable Waste","Ozone Layer"], pyqYears: ["2023","2022","2021"] },
    ],
  },
  {
    slug: "english",
    name: "English",
    icon: "📚",
    description: "CBSE Class 10 English — First Flight, Footprints without Feet, grammar, writing skills",
    chapters: [
      { slug: "a-letter-to-god", title: "A Letter to God", description: "Short story about faith and humanity by G.L. Fuentes", topics: ["Summary","Character Sketch","Themes","Important Questions","Vocabulary"] },
      { slug: "nelson-mandela", title: "Nelson Mandela: Long Walk to Freedom", description: "Autobiography extract about freedom and dignity", topics: ["Summary","Character Analysis","Freedom Struggle","Important Questions","Vocabulary"] },
      { slug: "two-stories-flying", title: "Two Stories About Flying", description: "His First Flight and Black Aeroplane", topics: ["His First Flight — Summary","Black Aeroplane — Summary","Themes","Comparison","Important Questions"] },
      { slug: "grammar-writing", title: "Grammar and Writing Skills", description: "Formal letters, articles, speech, grammar rules", topics: ["Formal Letter Writing","Notice Writing","Article Writing","Speech Writing","Gap Filling","Editing"] },
    ],
  },
  {
    slug: "social",
    name: "Social Science",
    icon: "🌍",
    description: "CBSE Class 10 Social Science — History, Geography, Political Science, Economics",
    chapters: [
      { slug: "rise-of-nationalism", title: "The Rise of Nationalism in Europe", description: "French Revolution, rise of nation states, nationalist movements", topics: ["French Revolution","Idea of Nation","Nationalism and Imperialism","Major Events","Important Dates"] },
      { slug: "nationalism-india", title: "Nationalism in India", description: "Non-Cooperation Movement, Civil Disobedience, Quit India", topics: ["Non-Cooperation Movement","Civil Disobedience","Salt March","Quit India Movement","Timeline"] },
      { slug: "resources-development", title: "Resources and Development", description: "Types of resources, land resources, soil types", topics: ["Types of Resources","Land Utilisation","Soil Types","Soil Erosion","Conservation"] },
      { slug: "power-sharing", title: "Power Sharing", description: "Belgium and Sri Lanka case studies, forms of power sharing", topics: ["Belgium Model","Sri Lanka Case","Horizontal Power Sharing","Vertical Power Sharing","Importance"] },
      { slug: "development", title: "Development", description: "Economic development, per capita income, HDI", topics: ["Development Goals","Per Capita Income","HDI","Sectoral Development","Sustainability"] },
      { slug: "money-credit", title: "Money and Credit", description: "Formal and informal credit, RBI, banks", topics: ["Barter System","Money","Credit","Banks","RBI","Self Help Groups","Formal vs Informal Credit"] },
    ],
  },
];

// ── JEE ──────────────────────────────────────────────────────────────────────

export const jeeSubjects: Subject[] = [
  {
    slug: "maths",
    name: "Mathematics",
    icon: "📐",
    description: "JEE Maths — complete chapter-wise coverage with PYQs, tricks, and problem-solving techniques",
    chapters: [
      { slug: "sets-relations", title: "Sets, Relations and Functions", description: "Foundation of JEE Maths", topics: ["Sets","Types of Relations","Functions","Composition of Functions","Inverse Functions"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "complex-numbers", title: "Complex Numbers and Quadratic Equations", description: "Argand plane, modulus, argument, roots", topics: ["Algebraic Operations","Modulus and Argument","Polar Form","De Moivre's Theorem","Roots of Unity","Quadratic Equations"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "matrices-determinants", title: "Matrices and Determinants", description: "Types of matrices, operations, properties of determinants", topics: ["Types of Matrices","Matrix Operations","Determinant","Properties","Inverse","System of Equations","Cramer's Rule"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "permutation-combination", title: "Permutations and Combinations", description: "Fundamental counting, arrangements, selections", topics: ["Fundamental Principle","Permutations","Combinations","Circular Permutations","Applications"], pyqYears: ["2024","2023","2022","2021"] },
      { slug: "binomial-theorem", title: "Binomial Theorem", description: "Expansion, general term, middle term, properties", topics: ["Binomial Expansion","General Term","Middle Term","Properties","Applications"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "sequences-series", title: "Sequences and Series", description: "AP, GP, HP, special series, sum formulas", topics: ["AP and GP","Arithmetic Mean","Geometric Mean","Harmonic Progression","Sum of Special Series"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "limits-derivatives", title: "Limits and Derivatives", description: "Limits, continuity, differentiation techniques", topics: ["Algebra of Limits","Standard Limits","L'Hopital Rule","Derivatives","Chain Rule","Product Rule","Quotient Rule"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "applications-derivatives", title: "Applications of Derivatives", description: "Rate of change, tangents, maxima, minima", topics: ["Rate of Change","Tangent and Normal","Increasing/Decreasing Functions","Maxima and Minima","Rolle's Theorem","LMVT"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "integrals", title: "Integrals", description: "Integration techniques, definite integrals, properties", topics: ["Standard Integrals","Integration by Parts","Substitution","Partial Fractions","Definite Integrals","Properties of Definite Integrals"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "coordinate-geometry", title: "Coordinate Geometry", description: "Straight lines, circles, parabola, ellipse, hyperbola", topics: ["Straight Lines","Circles","Parabola","Ellipse","Hyperbola","Family of Circles"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "vectors-3d", title: "Vectors and 3D Geometry", description: "Vector algebra, lines and planes in 3D", topics: ["Vectors","Dot Product","Cross Product","Triple Product","3D Lines","Planes","Distance Formulas"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "probability", title: "Probability", description: "Classical, conditional, Bayes theorem, distributions", topics: ["Classical Probability","Conditional Probability","Bayes Theorem","Binomial Distribution","Random Variables"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "statistics", title: "Statistics", description: "Measures of central tendency, variance, standard deviation", topics: ["Mean Median Mode","Variance","Standard Deviation","Skewness","Covariance","Correlation Coefficient"], pyqYears: ["2024","2023","2022"] },
    ],
  },
  {
    slug: "physics",
    name: "Physics",
    icon: "⚡",
    description: "JEE Physics — mechanics to modern physics with conceptual clarity and numerical practice",
    chapters: [
      { slug: "units-dimensions", title: "Units and Dimensions", description: "SI units, dimensional analysis, significant figures", topics: ["Fundamental Units","Dimensional Analysis","Significant Figures","Error Analysis"], pyqYears: ["2024","2023","2022"] },
      { slug: "kinematics", title: "Kinematics", description: "Motion in 1D, 2D, projectile, relative motion", topics: ["Equations of Motion","Projectile Motion","Circular Motion","Relative Motion","Graphs"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "laws-of-motion", title: "Laws of Motion", description: "Newton's laws, friction, circular motion dynamics", topics: ["Newton's Laws","Friction","Circular Motion","Pseudoforce","Applications"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "work-energy", title: "Work, Energy and Power", description: "Work-energy theorem, conservation, collisions", topics: ["Work-Energy Theorem","Conservation of Energy","Potential Energy","Power","Collisions"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "rotation", title: "Rotational Motion", description: "Torque, angular momentum, moment of inertia", topics: ["Torque","Moment of Inertia","Angular Momentum","Rolling Motion","Parallel Axis Theorem"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "gravitation", title: "Gravitation", description: "Universal law, Kepler's laws, satellites", topics: ["Universal Law","Gravitational Field","Kepler's Laws","Orbital Velocity","Escape Velocity","Satellites"], pyqYears: ["2024","2023","2022","2021"] },
      { slug: "thermodynamics", title: "Thermodynamics", description: "Laws of thermodynamics, processes, heat engines", topics: ["First Law","Second Law","Carnot Engine","Heat Capacity","Processes (Isothermal/Adiabatic)"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "electrostatics", title: "Electrostatics", description: "Coulomb's law, electric field, potential, capacitors", topics: ["Coulomb's Law","Electric Field","Gauss Law","Electric Potential","Capacitors","Dielectrics"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "current-electricity", title: "Current Electricity", description: "Ohm's law, Kirchhoff's laws, circuits", topics: ["Ohm's Law","Kirchhoff's Laws","Wheatstone Bridge","Potentiometer","Cells"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "magnetic-effects", title: "Magnetic Effects of Current", description: "Biot-Savart law, Ampere's law, force on current", topics: ["Biot-Savart Law","Ampere's Law","Solenoid","Moving Coil Galvanometer","Force on Current"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "modern-physics", title: "Modern Physics", description: "Photoelectric effect, atomic structure, nuclear physics", topics: ["Photoelectric Effect","Bohr Model","X-Rays","Radioactivity","Nuclear Reactions","Semiconductors"], pyqYears: ["2024","2023","2022","2021","2020"] },
    ],
  },
  {
    slug: "chemistry",
    name: "Chemistry",
    icon: "🧪",
    description: "JEE Chemistry — physical, organic, inorganic with all important reactions and mechanisms",
    chapters: [
      { slug: "atomic-structure", title: "Atomic Structure", description: "Quantum numbers, electronic configuration, orbitals", topics: ["Bohr Model","Quantum Numbers","Aufbau Principle","Electronic Configuration","Orbitals"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "chemical-bonding", title: "Chemical Bonding", description: "Ionic, covalent, coordinate bonds, VSEPR, hybridisation", topics: ["Ionic Bond","Covalent Bond","VSEPR Theory","Hybridisation","Molecular Orbital Theory","Hydrogen Bond"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "equilibrium", title: "Chemical Equilibrium", description: "Equilibrium constant, Le Chatelier's principle, ionic equilibrium", topics: ["Kc and Kp","Le Chatelier's Principle","Ionic Product of Water","pH","Buffer Solutions","Solubility Product"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "thermodynamics-chem", title: "Thermodynamics (Chemistry)", description: "Enthalpy, entropy, Gibbs free energy", topics: ["Enthalpy","Hess's Law","Entropy","Gibbs Free Energy","Spontaneity"], pyqYears: ["2024","2023","2022","2021"] },
      { slug: "organic-basic", title: "Organic Chemistry — Basics", description: "Nomenclature, isomerism, reaction mechanisms", topics: ["IUPAC Nomenclature","Isomerism","Inductive Effect","Resonance","Hyperconjugation","Reaction Mechanisms"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "hydrocarbons", title: "Hydrocarbons", description: "Alkanes, alkenes, alkynes, aromatic compounds", topics: ["Alkanes — IUPAC and Reactions","Alkenes — Electrophilic Addition","Alkynes","Benzene — Electrophilic Substitution","Aromaticity"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "carbonyl-compounds", title: "Carbonyl Compounds", description: "Aldehydes, ketones, carboxylic acids, derivatives", topics: ["Aldehydes and Ketones","Nucleophilic Addition","Carboxylic Acids","Acid Derivatives","Named Reactions"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "periodic-table", title: "Periodic Table and Periodicity", description: "Trends in periodic table, s, p, d, f block elements", topics: ["Periodicity","s-Block Elements","p-Block Elements","d-Block Elements","f-Block Elements","Trends"], pyqYears: ["2024","2023","2022","2021","2020"] },
    ],
  },
];

// ── GATE CSE ─────────────────────────────────────────────────────────────────

export const gateCseSubjects: Subject[] = [
  {
    slug: "dsa",
    name: "Data Structures & Algorithms",
    icon: "🌲",
    description: "GATE CSE DSA — arrays, linked lists, trees, graphs, sorting with GATE PYQs",
    chapters: [
      { slug: "arrays-strings", title: "Arrays and Strings", description: "Operations, searching, sorting, 2D arrays", topics: ["Array Operations","Searching","Sorting Algorithms","2D Arrays","String Operations","Pattern Matching"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "linked-lists", title: "Linked Lists", description: "Singly, doubly, circular linked lists and operations", topics: ["Singly Linked List","Doubly Linked List","Circular Linked List","Reversal","Cycle Detection"], pyqYears: ["2024","2023","2022","2021"] },
      { slug: "stacks-queues", title: "Stacks and Queues", description: "LIFO, FIFO, applications, priority queues", topics: ["Stack Operations","Queue Operations","Circular Queue","Priority Queue","Infix to Postfix","Applications"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "trees", title: "Trees", description: "Binary trees, BST, AVL, heaps, B-trees", topics: ["Binary Tree","BST Operations","AVL Tree","Heap","B-Tree","Trie","Tree Traversals"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "graphs", title: "Graphs", description: "Representations, BFS, DFS, shortest paths, spanning trees", topics: ["Graph Representations","BFS","DFS","Dijkstra's Algorithm","Floyd-Warshall","Prim's","Kruskal's","Topological Sort"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "sorting", title: "Sorting and Searching", description: "All sorting algorithms, analysis, searching techniques", topics: ["Bubble Sort","Insertion Sort","Selection Sort","Merge Sort","Quick Sort","Heap Sort","Radix Sort","Binary Search"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "dynamic-programming", title: "Dynamic Programming", description: "Memoisation, tabulation, classical DP problems", topics: ["Overlapping Subproblems","Optimal Substructure","LCS","LIS","0/1 Knapsack","Matrix Chain","Edit Distance"], pyqYears: ["2024","2023","2022","2021","2020"] },
    ],
  },
  {
    slug: "os",
    name: "Operating Systems",
    icon: "⚙️",
    description: "GATE CSE OS — processes, memory, file systems, synchronisation",
    chapters: [
      { slug: "process-management", title: "Process Management", description: "Process states, PCB, scheduling algorithms", topics: ["Process States","PCB","Context Switch","Scheduling Algorithms","FCFS","SJF","Round Robin","Priority"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "synchronisation", title: "Process Synchronisation", description: "Critical section, mutex, semaphores, deadlock", topics: ["Critical Section","Peterson's Solution","Mutex","Semaphores","Monitors","Deadlock","Banker's Algorithm"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "memory-management", title: "Memory Management", description: "Paging, segmentation, virtual memory, page replacement", topics: ["Contiguous Allocation","Paging","Segmentation","Virtual Memory","Page Replacement Algorithms","Thrashing"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "file-systems", title: "File Systems", description: "File organisation, directory structures, disk scheduling", topics: ["File Organisation","Directory Structure","Disk Scheduling","FCFS/SSTF/SCAN/C-SCAN","File Allocation"], pyqYears: ["2024","2023","2022","2021"] },
    ],
  },
  {
    slug: "dbms",
    name: "DBMS",
    icon: "🗄️",
    description: "GATE CSE DBMS — ER model, relational algebra, SQL, normalisation, transactions",
    chapters: [
      { slug: "er-model", title: "ER Model", description: "Entities, relationships, attributes, mapping to tables", topics: ["Entities and Attributes","Relationships","Cardinality","ER to Relational Mapping","Weak Entities"], pyqYears: ["2024","2023","2022","2021"] },
      { slug: "relational-algebra", title: "Relational Algebra", description: "Operations on relations — select, project, join", topics: ["Selection","Projection","Cartesian Product","Join Types","Division","Set Operations"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "sql", title: "SQL", description: "DDL, DML, queries, joins, subqueries, views", topics: ["DDL Commands","DML Commands","SELECT Query","Joins","Subqueries","Views","Aggregate Functions","Group By"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "normalisation", title: "Normalisation", description: "Functional dependencies, 1NF to BCNF, lossless decomposition", topics: ["Functional Dependencies","1NF","2NF","3NF","BCNF","Lossless Decomposition","Dependency Preservation"], pyqYears: ["2024","2023","2022","2021","2020"] },
      { slug: "transactions", title: "Transactions and Concurrency", description: "ACID, schedules, serializability, locking", topics: ["ACID Properties","Schedules","Conflict Serializability","Two-Phase Locking","Timestamp Protocol","Deadlock Handling"], pyqYears: ["2024","2023","2022","2021","2020"] },
    ],
  },
];

// ── BANKING ───────────────────────────────────────────────────────────────────

export const bankingSubjects: Subject[] = [
  {
    slug: "quant",
    name: "Quantitative Aptitude",
    icon: "🔢",
    description: "Banking Quant — Number System to Data Interpretation with 500+ practice questions",
    chapters: [
      { slug: "number-system", title: "Number System", description: "Types of numbers, divisibility, LCM, HCF", topics: ["Types of Numbers","Divisibility Rules","LCM and HCF","Fractions","Decimals","Surds and Indices"], pyqYears: ["2024","2023","2022","2021"] },
      { slug: "percentage", title: "Percentage", description: "Percentage calculations, increase/decrease, applications", topics: ["Percentage Basics","Percentage Change","Successive Change","Applications in Profit/Loss","Applications in Interest"] },
      { slug: "profit-loss", title: "Profit and Loss", description: "Cost price, selling price, profit percentage, discount", topics: ["Basic Concepts","Profit Percentage","Loss Percentage","Discount","Marked Price","False Weight"] },
      { slug: "simple-compound-interest", title: "Simple and Compound Interest", description: "Interest calculations, EMI concept", topics: ["Simple Interest","Compound Interest","Effective Rate","EMI Concept","Installments"] },
      { slug: "time-work", title: "Time and Work", description: "Work done, efficiency, pipes and cisterns", topics: ["Work and Time","Efficiency","Pipes and Cisterns","Work Equivalence","LCM Method"] },
      { slug: "time-speed-distance", title: "Time, Speed and Distance", description: "Relative speed, trains, boats and streams", topics: ["Speed and Time","Relative Speed","Trains","Boats and Streams","Circular Motion"] },
      { slug: "data-interpretation", title: "Data Interpretation", description: "Bar graphs, pie charts, line graphs, tables", topics: ["Bar Graph","Pie Chart","Line Graph","Table DI","Mixed Graph","Radar Chart"] },
      { slug: "series-sequence", title: "Number Series", description: "Missing terms, wrong terms, pattern recognition", topics: ["Arithmetic Series","Geometric Series","Difference Series","Mixed Series","Wrong Number Series"] },
    ],
  },
  {
    slug: "reasoning",
    name: "Reasoning Ability",
    icon: "🧠",
    description: "Banking Reasoning — Puzzles to syllogisms with exam-pattern practice",
    chapters: [
      { slug: "puzzles-seating", title: "Puzzles and Seating Arrangement", description: "Linear, circular, complex arrangements — highest weightage topic", topics: ["Linear Arrangement","Circular Arrangement","Floor Puzzle","Box Puzzle","Month/Day Puzzle","Complex Puzzles"] },
      { slug: "syllogism", title: "Syllogism", description: "Possibility cases, direct conclusions, all/some/no statements", topics: ["Basic Syllogism","Possibility Cases","Coded Syllogism","Old Pattern","New Pattern"] },
      { slug: "blood-relations", title: "Blood Relations", description: "Family tree, coded blood relations", topics: ["Direct Questions","Coded Relations","Family Tree","Mixed Questions","Gender-Based Problems"] },
      { slug: "direction-distance", title: "Direction and Distance", description: "Compass directions, shortest distance, displacement", topics: ["Basic Directions","Displacement","Shadow Problems","Coded Directions","Complex Paths"] },
      { slug: "inequality", title: "Inequalities", description: "Symbol-based, coded inequalities, conclusions", topics: ["Direct Inequality","Coded Inequality","Either/Or Cases","Conclusions"] },
      { slug: "coding-decoding", title: "Coding and Decoding", description: "Letter coding, number coding, new pattern", topics: ["Letter Coding","Number Coding","Mixed Coding","New Pattern (Row/Column/Grid)"] },
    ],
  },
  {
    slug: "english",
    name: "English Language",
    icon: "📝",
    description: "Banking English — Reading comprehension, grammar, vocabulary",
    chapters: [
      { slug: "reading-comprehension", title: "Reading Comprehension", description: "Main idea, inference, vocabulary from context", topics: ["Main Idea","Tone and Attitude","Inference","Vocabulary in Context","Title","Factual Questions"] },
      { slug: "cloze-test", title: "Cloze Test", description: "Fill in the blanks — single and double filler", topics: ["Single Filler","Double Filler","New Pattern Cloze","Vocabulary-Based"] },
      { slug: "error-detection", title: "Error Detection", description: "Spotting grammatical errors in sentences", topics: ["Subject-Verb Agreement","Tense Errors","Preposition Errors","Article Errors","Conjunction Errors"] },
      { slug: "sentence-improvement", title: "Sentence Improvement and Rearrangement", description: "Phrase replacement, para jumbles", topics: ["Phrase Replacement","Sentence Correction","Para Jumbles","Odd Sentence Out","New Pattern"] },
    ],
  },
  {
    slug: "awareness",
    name: "Banking Awareness and GA",
    icon: "🏦",
    description: "Banking and Financial Awareness — RBI, types of banks, current affairs",
    chapters: [
      { slug: "banking-basics", title: "Banking Basics", description: "Types of banks, RBI functions, monetary policy", topics: ["Types of Banks","RBI Functions","Monetary Policy Tools (Repo/CRR/SLR)","SEBI","NABARD","NHB"] },
      { slug: "financial-awareness", title: "Financial Awareness", description: "Budget, GDP, economic indicators, government schemes", topics: ["Union Budget","GDP Concepts","Inflation","Government Schemes","Financial Institutions"] },
      { slug: "current-affairs", title: "Current Affairs for Banking", description: "Monthly current affairs — appointments, summits, awards, reports", topics: ["Monthly Appointments","National News","International News","Summits","Awards","Reports and Indices"] },
    ],
  },
];


// ── NEET ─────────────────────────────────────────────────────────────────────

export const neetSubjects = [
  {
    slug: "biology",
    name: "Biology",
    icon: "🧬",
    description: "NEET Biology — Botany and Zoology with NCERT-based chapter-wise content, PYQs, and MCQs",
    chapters: [
      { slug: "cell-biology", title: "Cell — The Unit of Life", description: "Cell theory, prokaryotic vs eukaryotic, organelles, plasma membrane", topics: ["Cell Theory","Prokaryotic Cell","Eukaryotic Cell","Plasma Membrane","Nucleus","Mitochondria","Chloroplast","ER","Golgi","Lysosome"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "biomolecules", title: "Biomolecules", description: "Carbohydrates, proteins, lipids, nucleic acids, and enzymes", topics: ["Carbohydrates","Proteins","Lipids","Nucleic Acids","Enzymes","Cofactors","Enzyme Inhibition","Km and Vmax"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "genetics-principles", title: "Principles of Inheritance and Variation", description: "Mendel's laws, dihybrid cross, codominance, sex-linked traits, chromosomal disorders", topics: ["Mendel Laws","Monohybrid Cross","Dihybrid Cross","Incomplete Dominance","Codominance","Sex Determination","Sex-linked Traits","Chromosomal Disorders"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "plant-physiology", title: "Transport in Plants and Mineral Nutrition", description: "Water relations, osmosis, mineral nutrition, nitrogen fixation, transpiration", topics: ["Water Potential","Osmosis","Plasmolysis","Mineral Nutrition","Nitrogen Fixation","Transpiration","Guard Cells","Cohesion-Tension Theory"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "human-physiology", title: "Human Physiology", description: "Digestion, breathing, circulation, excretion, and neural coordination", topics: ["Digestion Enzymes","Lung Volumes","Gas Transport","Cardiac Cycle","Nephron","ADH","Neural Coordination"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "plant-kingdom", title: "Plant Kingdom", description: "Algae, bryophytes, pteridophytes, gymnosperms, angiosperms — classification and life cycles", topics: ["Algae","Bryophytes","Pteridophytes","Gymnosperms","Angiosperms","Alternation of Generations","Monocot vs Dicot"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "ecology", title: "Ecology and Environment", description: "Ecosystem, food chains, biodiversity, biogeochemical cycles, and environmental issues", topics: ["Population Interactions","Food Chain","Energy Flow","Biodiversity","Hotspots","Biogeochemical Cycles","Environmental Issues"], pyqYears: ["2023","2022","2021","2020","2019"] },
    ],
  },
  {
    slug: "physics",
    name: "Physics",
    icon: "⚡",
    description: "NEET Physics — all chapters from Class 11 and 12 with NEET-pattern MCQs and PYQs",
    chapters: [
      { slug: "laws-of-motion", title: "Laws of Motion", description: "Newton's laws, friction, circular motion, Lami's theorem", topics: ["Newton's Laws","Friction","Circular Motion","Lami's Theorem","Impulse","Momentum"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "gravitation", title: "Gravitation", description: "Kepler's laws, orbital velocity, escape velocity, satellite energy", topics: ["Gravitation Law","Kepler's Laws","Orbital Velocity","Escape Velocity","Satellite Motion","Geostationary Orbit"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "thermodynamics", title: "Thermodynamics", description: "Laws of thermodynamics, gas processes, Carnot engine", topics: ["Laws of Thermodynamics","Gas Processes","Specific Heats","Carnot Engine","Entropy","Heat Engines"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "optics", title: "Optics", description: "Ray optics, wave optics, optical instruments, YDSE, diffraction", topics: ["Mirrors","Lenses","Refraction","TIR","Young Double Slit","Diffraction","Optical Instruments"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "electrostatics-magnetism", title: "Electrostatics and Magnetism", description: "Coulomb law, capacitors, magnetic force, EMI, transformers", topics: ["Coulomb Law","Electric Field","Capacitors","Magnetic Force","Faraday Law","Lenz Law","Transformer"], pyqYears: ["2023","2022","2021","2020","2019"] },
    ],
  },
  {
    slug: "chemistry",
    name: "Chemistry",
    icon: "🧪",
    description: "NEET Chemistry — Physical, Organic, and Inorganic with NEET PYQs",
    chapters: [
      { slug: "chemical-bonding", title: "Chemical Bonding and Molecular Structure", description: "VSEPR theory, hybridisation, molecular orbital theory, bond parameters", topics: ["Ionic Bond","Covalent Bond","VSEPR Theory","Hybridisation","MO Theory","Hydrogen Bond","Bond Parameters"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "equilibrium", title: "Equilibrium", description: "Chemical and ionic equilibrium, pH, buffer, Ksp", topics: ["Equilibrium Constant","Le Chatelier","pH Scale","Weak Acid/Base","Buffer Solutions","Ksp","Common Ion Effect"], pyqYears: ["2023","2022","2021","2020"] },
      { slug: "organic-reaction-mechanisms", title: "Organic Reaction Mechanisms", description: "Named reactions, SN1/SN2, EAS, polymers — all major organic reactions", topics: ["Aldol Condensation","Cannizzaro","Sandmeyer","Hoffmann","Lucas Test","SN1 vs SN2","EAS","Polymers"], pyqYears: ["2023","2022","2021","2020","2019"] },
      { slug: "solutions-electrochemistry", title: "Solutions and Electrochemistry", description: "Colligative properties, Raoult's law, Faraday's laws, cell EMF", topics: ["Raoult Law","Colligative Properties","Van't Hoff Factor","Cell EMF","Nernst Equation","Faraday Laws","Molar Conductance"], pyqYears: ["2023","2022","2021","2020","2019"] },
    ],
  },
];

// ── MAIN EDUCATION STRUCTURE ──────────────────────────────────────────────────

export type EducationBoard = {
  slug: string;
  name: string;
  shortName: string;
  icon: string;
  color: string;
  tagline: string;
  description: string;
  phases: string[];
  subjects: Subject[];
};

export const educationBoards: EducationBoard[] = [
  {
    slug: "class-10",
    name: "Class 10 (CBSE/ICSE)",
    shortName: "Class 10",
    icon: "📘",
    color: "#10B981",
    tagline: "Board Exam Preparation",
    description: "Complete CBSE Class 10 preparation — all subjects chapter-wise with NCERT solutions, PYQs 2020-2024, MCQ practice, and revision notes",
    phases: ["Learn Concept","Solve Examples","Practice PYQs","Take MCQ Test","Revise Notes"],
    subjects: class10Subjects,
  },
  {
    slug: "jee",
    name: "JEE Main & Advanced",
    shortName: "JEE",
    icon: "⚗️",
    color: "#F59E0B",
    tagline: "IIT Entrance Preparation",
    description: "Comprehensive JEE preparation — Physics, Chemistry, Maths with chapter-wise PYQs from 2015-2024, concept clarity, and problem-solving techniques",
    phases: ["NCERT First","Concept Building","PYQ Practice","Mock Tests","Revision"],
    subjects: jeeSubjects,
  },
  {
    slug: "gate-cse",
    name: "GATE CSE",
    shortName: "GATE CSE",
    icon: "💻",
    color: "#8B5CF6",
    tagline: "IIT M.Tech & PSU Jobs",
    description: "GATE Computer Science preparation — DSA, OS, DBMS, CN, Algorithms, TOC, COA with PYQs 2014-2024 and subject-wise mock tests",
    phases: ["Standard Books","Topic Practice","PYQ Analysis","Mock Tests","Revision"],
    subjects: gateCseSubjects,
  },
  {
    slug: "banking",
    name: "Banking Exams (SBI/IBPS)",
    shortName: "Banking",
    icon: "🏦",
    color: "#3B82F6",
    tagline: "SBI PO, IBPS PO/Clerk, RRB",
    description: "Complete Banking exam preparation — Quantitative Aptitude, Reasoning, English, and Banking Awareness with sectional mock tests",
    phases: ["Learn Basics","Topic-wise Practice","Mock Tests","Error Analysis","Revision"],
    subjects: bankingSubjects,
  },
  {
    slug: "upsc",
    name: "UPSC Civil Services",
    shortName: "UPSC",
    icon: "🏛️",
    color: "#EF4444",
    tagline: "IAS, IPS, IFS Preparation",
    description: "UPSC Prelims and Mains preparation — GS Paper 1 & 2 (CSAT), essay writing, current affairs with structured chapter-wise content",
    phases: ["NCERT Foundation","Standard References","Current Affairs","PYQ Practice","Answer Writing"],
    subjects: [],  // content added progressively
  },
  {
    slug: "neet",
    name: "NEET",
    shortName: "NEET",
    icon: "🧬",
    color: "#EC4899",
    tagline: "MBBS/BDS Medical Entrance",
    description: "NEET preparation — Biology (Botany + Zoology), Physics, Chemistry with NCERT-focused chapter-wise content and PYQs 2015-2024",
    phases: ["NCERT Mastery","Topic Practice","PYQ Analysis","Mock Tests","Final Revision"],
    subjects: neetSubjects, // content added progressively
  },
  {
    slug: "ssc",
    name: "SSC CGL/CHSL",
    shortName: "SSC",
    icon: "📋",
    color: "#14B8A6",
    tagline: "Government Job Preparation",
    description: "SSC CGL and CHSL preparation — Quant, English, Reasoning, GK for Tier I and Tier II",
    phases: ["Basics","Topic Practice","Previous Papers","Mock Tests","Revision"],
    subjects: [],  // content added progressively
  },
  {
    slug: "class-12",
    name: "Class 12 (CBSE/ICSE)",
    shortName: "Class 12",
    icon: "📗",
    color: "#6366F1",
    tagline: "Board + JEE/NEET Foundation",
    description: "Class 12 board preparation aligned with JEE/NEET — Maths, Physics, Chemistry, Biology, CS",
    phases: ["NCERT","Solved Examples","Board PYQs","MCQ Practice","Revision"],
    subjects: [],  // content added progressively
  },
];

export function getBoard(slug: string): EducationBoard | undefined {
  return educationBoards.find(b => b.slug === slug);
}

export function getSubject(boardSlug: string, subjectSlug: string): Subject | undefined {
  const board = getBoard(boardSlug);
  return board?.subjects.find(s => s.slug === subjectSlug);
}

export function getChapter(boardSlug: string, subjectSlug: string, chapterSlug: string): Chapter | undefined {
  return getSubject(boardSlug, subjectSlug)?.chapters.find(c => c.slug === chapterSlug);
}
