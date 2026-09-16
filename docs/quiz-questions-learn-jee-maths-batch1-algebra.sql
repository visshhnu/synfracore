-- ============================================================
-- /learn quiz: JEE Maths -- batch 1 (Algebra): Sets Relations and
-- Functions, Complex Numbers and Quadratic Equations, Matrices and
-- Determinants, Permutations and Combinations, Binomial Theorem,
-- Sequences and Series. First 6 of the subject's 13 chapters.
--
-- SOURCING: same disclosed limitation as the CBSE Class 10 batches --
-- authored to match real JEE Main single-correct-MCQ style, topic
-- distribution, and difficulty for each chapter; NOT copied from any
-- official JEE question paper (JEE Main's own real PYQs, unlike this
-- /learn quiz feature, are already served separately and correctly as
-- sourced content via the academy's question-bank system -- see the
-- 2026-09-02 JEE Main build, 5 papers/375 questions). Every
-- mathematical claim below was independently checked before writing.
--
-- Applied via @supabase/supabase-js, upsert(rows, { onConflict:
-- "academy_slug,technology_slug,section_slug,question", ignoreDuplicates:
-- true }) -- functionally identical to this file's ON CONFLICT clause.
-- ============================================================

INSERT INTO quiz_questions (academy_slug, technology_slug, section_slug, question, options, correct_index, explanation, difficulty) VALUES
('education', 'jee/maths', 'sets-relations', 'If A = {1,2,3} and B = {2,3,4}, then A ∩ B equals:', '["{2,3}", "{1,2,3,4}", "{1}", "{4}"]', 0, 'The intersection A ∩ B contains only the elements common to both sets: 2 and 3.', 'beginner'),
('education', 'jee/maths', 'sets-relations', 'A relation R on a set A is called reflexive if:', '["(a,a) is in R for every a in A", "(a,b) in R implies (b,a) in R", "(a,b) and (b,c) in R implies (a,c) in R", "R contains no pairs of the form (a,a)"]', 0, 'Reflexivity requires every element to be related to itself: (a,a) is in R for all a in A.', 'beginner'),
('education', 'jee/maths', 'sets-relations', 'A function f: A -> B is called a bijection if it is:', '["Both one-one (injective) and onto (surjective)", "Only one-one, not necessarily onto", "Only onto, not necessarily one-one", "Neither one-one nor onto"]', 0, 'A bijective function is both injective (distinct inputs map to distinct outputs) and surjective (every element of B is mapped to), giving a perfect pairing between A and B.', 'beginner'),
('education', 'jee/maths', 'sets-relations', 'If f(x) = 2x+3 and g(x) = x^2, then (f o g)(x) equals:', '["2x^2 + 3", "2x^2 + 6x + 9", "4x^2 + 3", "x^2 + 2x + 3"]', 0, '(f o g)(x) = f(g(x)) = f(x^2) = 2(x^2) + 3 = 2x^2 + 3.', 'intermediate'),
('education', 'jee/maths', 'sets-relations', 'The number of subsets of a set containing n elements is:', '["2^n", "n^2", "n!", "2n"]', 0, 'A set with n elements has exactly 2^n subsets, since each element independently is either included or excluded.', 'beginner'),
('education', 'jee/maths', 'complex-numbers', 'The modulus of the complex number z = 3 + 4i is:', '["5", "7", "25", "1"]', 0, '|z| = sqrt(3^2 + 4^2) = sqrt(9+16) = sqrt(25) = 5.', 'beginner'),
('education', 'jee/maths', 'complex-numbers', 'The value of i^4 (where i = sqrt(-1)) is:', '["1", "-1", "i", "-i"]', 0, 'Since i^2 = -1, i^4 = (i^2)^2 = (-1)^2 = 1.', 'beginner'),
('education', 'jee/maths', 'complex-numbers', 'For the quadratic equation ax^2 + bx + c = 0 (a != 0), the sum of the roots is given by:', '["-b/a", "b/a", "c/a", "-c/a"]', 0, 'For a quadratic ax^2+bx+c=0, the sum of roots equals -b/a (a standard consequence of Vieta''s formulas).', 'beginner'),
('education', 'jee/maths', 'complex-numbers', 'The conjugate of the complex number z = a + bi is:', '["a - bi", "-a + bi", "-a - bi", "b + ai"]', 0, 'The complex conjugate reverses the sign of the imaginary part while keeping the real part unchanged: z-bar = a - bi.', 'beginner'),
('education', 'jee/maths', 'complex-numbers', 'De Moivre''s Theorem states that (cos(theta) + i sin(theta))^n equals:', '["cos(n theta) + i sin(n theta)", "n cos(theta) + i n sin(theta)", "cos(theta)^n + i sin(theta)", "cos(n theta) - i sin(n theta)"]', 0, 'De Moivre''s Theorem: (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta), for any integer n.', 'intermediate'),
('education', 'jee/maths', 'matrices-determinants', 'For the matrix product AB to be defined, the number of columns of A must equal the:', '["Number of rows of B", "Number of columns of B", "Number of rows of A", "Determinant of B"]', 0, 'Matrix multiplication AB requires the number of columns of A to match the number of rows of B.', 'beginner'),
('education', 'jee/maths', 'matrices-determinants', 'The determinant of the 2x2 matrix [[a,b],[c,d]] is:', '["ad - bc", "ac - bd", "ad + bc", "ab - cd"]', 0, 'For a 2x2 matrix, the determinant is calculated as (product of the main diagonal) minus (product of the off-diagonal): ad - bc.', 'beginner'),
('education', 'jee/maths', 'matrices-determinants', 'A square matrix A is called singular if:', '["Its determinant is zero (|A| = 0)", "It has no real entries", "It is the identity matrix", "It has an equal number of rows and columns only"]', 0, 'A singular matrix has determinant zero, which means it has no inverse.', 'beginner'),
('education', 'jee/maths', 'matrices-determinants', 'For any matrix A and the identity matrix I of compatible size:', '["AI = IA = A", "AI = 0", "AI is undefined", "AI = A^2"]', 0, 'The identity matrix acts as the multiplicative identity: multiplying by I leaves any compatible matrix unchanged.', 'beginner'),
('education', 'jee/maths', 'matrices-determinants', 'The determinant of the matrix [[2,3],[1,4]] is:', '["5", "11", "8", "-5"]', 0, 'Determinant = (2)(4) - (3)(1) = 8 - 3 = 5.', 'intermediate'),
('education', 'jee/maths', 'permutation-combination', 'The formula for the number of permutations of n distinct objects taken r at a time (nPr) is:', '["n! / (n-r)!", "n! / (r!(n-r)!)", "n! / r!", "r! / (n-r)!"]', 0, 'nPr = n! / (n-r)!, counting ordered selections of r objects from n distinct objects.', 'beginner'),
('education', 'jee/maths', 'permutation-combination', 'The formula for the number of combinations of n distinct objects taken r at a time (nCr) is:', '["n! / (r!(n-r)!)", "n! / (n-r)!", "n! / r!", "r! (n-r)!"]', 0, 'nCr = n! / (r!(n-r)!), counting unordered selections of r objects from n distinct objects.', 'beginner'),
('education', 'jee/maths', 'permutation-combination', 'The number of ways to arrange 5 distinct books on a shelf is:', '["120", "20", "60", "25"]', 0, 'The number of arrangements (permutations) of 5 distinct objects is 5! = 120.', 'beginner'),
('education', 'jee/maths', 'permutation-combination', 'For any valid n and r, nCr is always equal to:', '["nC(n-r)", "nPr", "nC(r-1)", "(n-r)Cr"]', 0, 'The symmetry property of combinations states nCr = nC(n-r), since choosing r objects to include is equivalent to choosing (n-r) objects to exclude.', 'intermediate'),
('education', 'jee/maths', 'permutation-combination', 'The number of ways to select 3 people from a group of 5 is:', '["10", "20", "15", "5"]', 0, '5C3 = 5! / (3! x 2!) = (5x4)/(2x1) = 10.', 'intermediate'),
('education', 'jee/maths', 'binomial-theorem', 'In the binomial expansion of (x+y)^n, the general term T(r+1) is given by:', '["nCr x^(n-r) y^r", "nCr x^r y^(n-r)", "nPr x^(n-r) y^r", "r! x^(n-r) y^r"]', 0, 'The general (r+1)th term of the binomial expansion (x+y)^n is nCr x^(n-r) y^r.', 'intermediate'),
('education', 'jee/maths', 'binomial-theorem', 'The total number of terms in the binomial expansion of (x+y)^n is:', '["n + 1", "n", "n - 1", "2n"]', 0, 'The expansion of (x+y)^n has exactly n+1 terms, with r ranging from 0 to n.', 'beginner'),
('education', 'jee/maths', 'binomial-theorem', 'The sum of all binomial coefficients in the expansion of (1+x)^n is:', '["2^n", "n^2", "n!", "2n"]', 0, 'Setting x=1 in (1+x)^n = sum of nCr x^r gives sum of nCr = 2^n.', 'intermediate'),
('education', 'jee/maths', 'binomial-theorem', 'The expansion of (x+y)^n has a single middle term when n is:', '["Even", "Odd", "Prime", "A perfect square"]', 0, 'When n is even, (x+y)^n has n+1 (odd number of) terms, giving one single middle term; when n is odd, there are two middle terms.', 'intermediate'),
('education', 'jee/maths', 'binomial-theorem', 'The coefficient of x^2 in the expansion of (1+x)^5 is:', '["10", "5", "20", "15"]', 0, 'The coefficient of x^2 is 5C2 = (5x4)/(2x1) = 10.', 'intermediate'),
('education', 'jee/maths', 'sequences-series', 'The nth term of a geometric progression (GP) with first term a and common ratio r is given by:', '["a x r^(n-1)", "a + (n-1)r", "a x r^n", "a/(r^(n-1))"]', 0, 'The nth term of a GP is a_n = a x r^(n-1), analogous to but multiplicative rather than additive like an AP.', 'beginner'),
('education', 'jee/maths', 'sequences-series', 'The sum of an infinite GP with first term a and common ratio r, where |r| < 1, is:', '["a / (1-r)", "a / (1+r)", "a x r / (1-r)", "a(1-r)"]', 0, 'For an infinite GP with |r|<1, the sum converges to S = a/(1-r).', 'intermediate'),
('education', 'jee/maths', 'sequences-series', 'The sum of an infinite GP with first term 2 and common ratio 1/2 is:', '["4", "2", "1", "8"]', 0, 'S = a/(1-r) = 2/(1-0.5) = 2/0.5 = 4.', 'intermediate'),
('education', 'jee/maths', 'sequences-series', 'The Harmonic Mean (HM) of two positive numbers a and b is given by:', '["2ab / (a+b)", "(a+b)/2", "sqrt(ab)", "(a+b)/(2ab)"]', 0, 'The harmonic mean of two numbers a and b is HM = 2ab/(a+b), the reciprocal of the average of their reciprocals.', 'intermediate'),
('education', 'jee/maths', 'sequences-series', 'If a, b, c are in geometric progression (GP), then:', '["b^2 = ac", "2b = a+c", "b = (a+c)/2", "a+b = b+c"]', 0, 'In a GP, the middle term is the geometric mean of its neighbours, so b/a = c/b, giving b^2 = ac.', 'beginner')
ON CONFLICT (academy_slug, technology_slug, section_slug, question) DO NOTHING;
