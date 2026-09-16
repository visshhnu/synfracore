-- ============================================================
-- /learn quiz: CBSE Class 10 Maths -- batch 2 of the subject-wide
-- rollout (6 more of the subject's 15 chapters: Polynomials, Pair of
-- Linear Equations, Arithmetic Progressions, Triangles, Coordinate
-- Geometry, Introduction to Trigonometry). Continues the pilot started
-- in quiz-questions-learn-cbse10-maths-pilot.sql (Real Numbers,
-- Quadratic Equations).
--
-- SOURCING: same disclosed limitation as the pilot batch -- authored to
-- match real CBSE Section-A (1-mark objective) exam style, topic
-- distribution, and difficulty for each chapter; NOT copied from any
-- official CBSE question paper. Official CBSE MCQs remain PDF-only with
-- no fetchable, per-question-dated verbatim source available (checked
-- again for this batch, same result as the pilot). Every question below
-- was independently math-checked before writing (not just structurally
-- validated) -- see inline verification notes were relevant.
--
-- Applied via @supabase/supabase-js, upsert(rows, { onConflict:
-- "academy_slug,technology_slug,section_slug,question", ignoreDuplicates:
-- true }) -- functionally identical to this file's ON CONFLICT clause.
-- ============================================================

INSERT INTO quiz_questions (academy_slug, technology_slug, section_slug, question, options, correct_index, explanation, difficulty) VALUES
('education', 'class-10/maths', 'polynomials', 'For the quadratic polynomial x^2 - 5x + 6, the sum and product of its zeroes are:', '["5 and 6", "-5 and 6", "5 and -6", "-5 and -6"]', 0, 'For ax^2+bx+c, sum of zeroes = -b/a = 5 and product = c/a = 6; verified by factoring: x^2-5x+6=(x-2)(x-3), zeroes 2 and 3, sum=5, product=6.', 'beginner'),
('education', 'class-10/maths', 'polynomials', 'A quadratic polynomial whose zeroes are 4 and -1 is:', '["x^2 - 3x - 4", "x^2 + 3x - 4", "x^2 - 3x + 4", "x^2 + 3x + 4"]', 0, 'Sum of zeroes = 4+(-1)=3, product = 4x(-1)=-4; polynomial = x^2-(sum)x+(product) = x^2-3x-4.', 'beginner'),
('education', 'class-10/maths', 'polynomials', 'The graph of a quadratic polynomial can intersect the x-axis at most how many points?', '["1", "2", "3", "0"]', 1, 'A quadratic polynomial has degree 2, so it has at most 2 real zeroes, meaning its graph (a parabola) intersects the x-axis at most twice.', 'beginner'),
('education', 'class-10/maths', 'polynomials', 'The zeroes of the polynomial p(x) = x^2 + 7x + 10 are:', '["-5 and -2", "5 and 2", "-5 and 2", "5 and -2"]', 0, 'Factoring: x^2+7x+10=(x+5)(x+2)=0, giving zeroes x=-5 and x=-2.', 'beginner'),
('education', 'class-10/maths', 'polynomials', 'If alpha and beta are the zeroes of 2x^2 + 5x - 3, then alpha+beta and alpha*beta are:', '["-5/2 and -3/2", "5/2 and -3/2", "-5/2 and 3/2", "5/2 and 3/2"]', 0, 'Sum of zeroes = -b/a = -5/2; product of zeroes = c/a = -3/2.', 'intermediate'),
('education', 'class-10/maths', 'linear-equations', 'A pair of linear equations a1x+b1y=c1 and a2x+b2y=c2 has a unique solution when:', '["a1/a2 = b1/b2 = c1/c2", "a1/a2 <> b1/b2", "a1/a2 = b1/b2 <> c1/c2", "a1/a2 = c1/c2"]', 1, 'A unique solution (intersecting lines) exists exactly when a1/a2 is not equal to b1/b2.', 'beginner'),
('education', 'class-10/maths', 'linear-equations', 'The pair of linear equations 2x+3y=7 and 4x+6y=14 represents:', '["Intersecting lines (unique solution)", "Parallel lines (no solution)", "Coincident lines (infinitely many solutions)", "Cannot be determined"]', 2, 'Ratios: 2/4=1/2, 3/6=1/2, 7/14=1/2 -- all three ratios are equal, so the equations represent the same line (coincident), giving infinitely many solutions.', 'intermediate'),
('education', 'class-10/maths', 'linear-equations', 'Solving x+y=5 and x-y=1 by elimination gives:', '["x=3, y=2", "x=2, y=3", "x=4, y=1", "x=1, y=4"]', 0, 'Adding both equations: 2x=6, so x=3; substituting back, y=5-3=2.', 'beginner'),
('education', 'class-10/maths', 'linear-equations', 'The graph of a linear equation in two variables, ax+by+c=0, is always:', '["A straight line", "A parabola", "A circle", "A pair of intersecting lines"]', 0, 'A linear equation in two variables represents a straight line when plotted on the Cartesian plane.', 'beginner'),
('education', 'class-10/maths', 'linear-equations', 'Solving 3x+2y=12 and 5x-2y=4 by elimination gives:', '["x=2, y=3", "x=3, y=2", "x=1, y=4.5", "x=4, y=0"]', 0, 'Adding both equations eliminates y: 8x=16, so x=2; substituting into 3x+2y=12 gives 6+2y=12, so y=3.', 'intermediate'),
('education', 'class-10/maths', 'arithmetic-progressions', 'The nth term of an arithmetic progression with first term a and common difference d is given by:', '["a + (n-1)d", "a + nd", "a x d^(n-1)", "a - (n-1)d"]', 0, 'The standard formula for the nth term of an AP is a_n = a + (n-1)d.', 'beginner'),
('education', 'class-10/maths', 'arithmetic-progressions', 'The 10th term of the AP 2, 5, 8, 11, ... is:', '["29", "28", "27", "30"]', 0, 'Here a=2, d=3; a_10 = a+(10-1)d = 2+9x3 = 2+27 = 29.', 'beginner'),
('education', 'class-10/maths', 'arithmetic-progressions', 'The sum of the first n terms of an AP with first term a and common difference d is:', '["n/2 x [2a + (n-1)d]", "n x [a + (n-1)d]", "n/2 x [a + d]", "n x [2a + d]"]', 0, 'The standard sum formula is S_n = n/2 x [2a + (n-1)d].', 'beginner'),
('education', 'class-10/maths', 'arithmetic-progressions', 'The sum of the first 10 terms of the AP 1, 2, 3, 4, ... is:', '["55", "50", "45", "60"]', 0, 'Here a=1, d=1, n=10; S_10 = 10/2 x [2(1)+(10-1)(1)] = 5 x 11 = 55.', 'beginner'),
('education', 'class-10/maths', 'arithmetic-progressions', 'In the AP with first term 5 and common difference 3, which term equals 50?', '["16th term", "15th term", "17th term", "14th term"]', 0, '5+(n-1)(3)=50, so (n-1)(3)=45, n-1=15, n=16 -- the 16th term.', 'intermediate'),
('education', 'class-10/maths', 'triangles', 'If a line is drawn parallel to one side of a triangle intersecting the other two sides, it divides the two sides in the same ratio. This is known as:', '["Basic Proportionality Theorem (Thales Theorem)", "Pythagoras Theorem", "Mid-point Theorem", "AA Similarity Theorem"]', 0, 'This statement is the Basic Proportionality Theorem, also known as Thales'' Theorem.', 'beginner'),
('education', 'class-10/maths', 'triangles', 'Which of the following is NOT a similarity criterion for triangles?', '["AA", "SSS", "SAS", "ASA"]', 3, 'AA, SSS, and SAS are recognized similarity criteria for triangles; ASA (Angle-Side-Angle) is a congruence criterion, not a similarity criterion.', 'intermediate'),
('education', 'class-10/maths', 'triangles', 'In a right triangle, if the two legs measure 6 cm and 8 cm, the length of the hypotenuse is:', '["10 cm", "12 cm", "14 cm", "16 cm"]', 0, 'By the Pythagoras theorem, hypotenuse = sqrt(6^2+8^2) = sqrt(36+64) = sqrt(100) = 10 cm.', 'beginner'),
('education', 'class-10/maths', 'triangles', 'The ratio of the areas of two similar triangles is equal to:', '["The square of the ratio of their corresponding sides", "The ratio of their corresponding sides", "The cube of the ratio of their corresponding sides", "Twice the ratio of their corresponding sides"]', 0, 'For similar triangles, the ratio of areas equals the square of the ratio of corresponding sides -- a standard, frequently tested theorem.', 'intermediate'),
('education', 'class-10/maths', 'triangles', 'Two similar triangles have corresponding sides in the ratio 2:3. What is the ratio of their areas?', '["4:9", "2:3", "8:27", "16:81"]', 0, 'Ratio of areas = square of ratio of sides = (2:3)^2 = 4:9.', 'intermediate'),
('education', 'class-10/maths', 'coordinate-geometry', 'The distance between two points (x1,y1) and (x2,y2) is given by:', '["sqrt[(x2-x1)^2 + (y2-y1)^2]", "(x2-x1) + (y2-y1)", "sqrt[(x2-x1) + (y2-y1)]", "(x2-x1)^2 + (y2-y1)^2"]', 0, 'This is the standard distance formula, derived from the Pythagoras theorem applied to the coordinate plane.', 'beginner'),
('education', 'class-10/maths', 'coordinate-geometry', 'The distance between the points (3,4) and (0,0) is:', '["5", "7", "6", "4"]', 0, 'Distance = sqrt(3^2+4^2) = sqrt(9+16) = sqrt(25) = 5.', 'beginner'),
('education', 'class-10/maths', 'coordinate-geometry', 'The midpoint of the line segment joining (2,3) and (4,7) is:', '["(3,5)", "(6,10)", "(2,4)", "(3,4)"]', 0, 'Midpoint = ((2+4)/2, (3+7)/2) = (3,5).', 'beginner'),
('education', 'class-10/maths', 'coordinate-geometry', 'The section formula gives the coordinates of a point dividing the line segment joining (x1,y1) and (x2,y2) internally in the ratio m:n as:', '["((mx2+nx1)/(m+n), (my2+ny1)/(m+n))", "((mx1+nx2)/(m+n), (my1+ny2)/(m+n))", "((x1+x2)/2, (y1+y2)/2)", "(m(x2-x1), n(y2-y1))"]', 0, 'This is the standard internal section formula.', 'intermediate'),
('education', 'class-10/maths', 'coordinate-geometry', 'The area of a triangle with vertices (0,0), (4,0), and (0,3) is:', '["6", "12", "3", "24"]', 0, 'Area = 1/2 |x1(y2-y3)+x2(y3-y1)+x3(y1-y2)| = 1/2 |0(0-3)+4(3-0)+0(0-0)| = 1/2 x 12 = 6.', 'intermediate'),
('education', 'class-10/maths', 'trigonometry', 'The value of sin 30 degrees is:', '["1/2", "sqrt(3)/2", "1", "0"]', 0, 'sin 30 degrees = 1/2, a standard trigonometric ratio value.', 'beginner'),
('education', 'class-10/maths', 'trigonometry', 'The value of tan 45 degrees is:', '["1", "0", "sqrt(3)", "1/sqrt(3)"]', 0, 'tan 45 degrees = 1, since sin 45 degrees = cos 45 degrees.', 'beginner'),
('education', 'class-10/maths', 'trigonometry', 'For any angle theta, sin^2(theta) + cos^2(theta) equals:', '["1", "0", "2", "tan(theta)"]', 0, 'This is the fundamental Pythagorean trigonometric identity, true for all values of theta.', 'beginner'),
('education', 'class-10/maths', 'trigonometry', 'If sin(theta) = 3/5 and theta is acute, then cos(theta) equals:', '["4/5", "3/4", "5/4", "4/3"]', 0, 'Using a 3-4-5 right triangle (or sin^2+cos^2=1): cos(theta) = sqrt(1-(3/5)^2) = sqrt(16/25) = 4/5.', 'intermediate'),
('education', 'class-10/maths', 'trigonometry', 'The value of sin 90 degrees + cos 0 degrees is:', '["2", "1", "0", "-1"]', 0, 'sin 90 degrees = 1 and cos 0 degrees = 1, so their sum is 1+1 = 2.', 'beginner')
ON CONFLICT (academy_slug, technology_slug, section_slug, question) DO NOTHING;
