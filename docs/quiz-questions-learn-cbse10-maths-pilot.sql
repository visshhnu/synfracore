-- ============================================================
-- /learn quiz pilot: CBSE Class 10 Maths -- Real Numbers + Quadratic
-- Equations (2 of the subject's 14 chapters, a disclosed pilot scope,
-- not a full-subject or full-board rollout).
--
-- SOURCING: authored to match real CBSE Section-A (1-mark objective)
-- exam style, topic distribution, and difficulty for these two chapters
-- -- NOT copied from any official CBSE question paper. This is a
-- necessary scope narrowing from the original plan: official CBSE board
-- MCQs exist only as PDF downloads (cbseacademic.nic.in and every
-- aggregator checked -- learncbse.in, mkrgreenboard.com, edurev.in,
-- vedantu.com) with no page reproducing exact, per-question-dated MCQ
-- text as fetchable web content, unlike UPSC/KPSC/APPSC Mains PYQs.
-- Every aggregator page checked presents undated "practice questions
-- matching the exam pattern," not verbatim dated PYQs -- so unlike the
-- State PSC Mains batch, these are authored practice content, not
-- sourced PYQs, and are not claimed to be otherwise. The chapter's
-- existing pyqYears badge (lib/data/education.ts) reflects which years
-- had real exam coverage of this chapter's topics, not that these
-- specific quiz questions are verbatim from those years.
--
-- Applied via @supabase/supabase-js with the service-role key,
-- upsert(rows, { onConflict: "academy_slug,technology_slug,
-- section_slug,question", ignoreDuplicates: true }) -- functionally
-- identical to this file's own ON CONFLICT ... DO NOTHING clause below,
-- for anyone running this .sql file directly instead.
-- ============================================================

INSERT INTO quiz_questions (academy_slug, technology_slug, section_slug, question, options, correct_index, explanation, difficulty) VALUES
('education', 'class-10/maths', 'real-numbers', 'According to the Fundamental Theorem of Arithmetic, every composite number can be expressed as a product of primes in:', '["A unique way, apart from the order of the prime factors", "Multiple different ways depending on the method used", "A unique way only if the number is even", "No fixed way -- it varies by number"]', 0, 'The Fundamental Theorem of Arithmetic states that every composite number has a unique prime factorization, apart from the order in which the prime factors occur.', 'beginner'),
('education', 'class-10/maths', 'real-numbers', 'If the HCF of two numbers is 5 and their product is 150, what is their LCM?', '["25", "30", "75", "150"]', 1, 'HCF x LCM = product of the two numbers, so LCM = 150/5 = 30.', 'beginner'),
('education', 'class-10/maths', 'real-numbers', 'Which of the following is an irrational number?', '["0.6666...(recurring)", "sqrt(16)", "sqrt(2)", "22/7"]', 2, 'sqrt(2) cannot be expressed as a ratio of two integers and its decimal expansion is non-terminating and non-repeating, making it irrational; the other options are all rational.', 'beginner'),
('education', 'class-10/maths', 'real-numbers', 'The decimal expansion of 17/8 will terminate after how many decimal places?', '["1", "2", "3", "It will not terminate"]', 2, '8 = 2^3, and a rational number p/q terminates iff q (in lowest terms) has only 2 and/or 5 as prime factors, terminating after max(power of 2, power of 5) places -- here after 3 places (17/8 = 2.125).', 'intermediate'),
('education', 'class-10/maths', 'real-numbers', 'Euclid''s Division Lemma states that for any two positive integers a and b, there exist unique integers q and r such that:', '["a = bq + r, where 0 <= r < b", "a = bq - r, where 0 <= r < b", "a = bq + r, where r > b", "a = qr + b, where 0 <= r < q"]', 0, 'Euclid''s Division Lemma: a = bq + r, with 0 <= r < b, the basis of the Euclidean algorithm for finding HCF.', 'beginner'),
('education', 'class-10/maths', 'quadratic-equations', 'A quadratic equation ax^2 + bx + c = 0 (a != 0) has real and equal roots when its discriminant D = b^2 - 4ac is:', '["D > 0", "D = 0", "D < 0", "D can be any value"]', 1, 'Real and equal roots occur exactly when the discriminant D = b^2 - 4ac equals zero.', 'beginner'),
('education', 'class-10/maths', 'quadratic-equations', 'The roots of the quadratic equation x^2 - 5x + 6 = 0 are:', '["2 and 3", "1 and 6", "-2 and -3", "2 and -3"]', 0, 'Factoring: x^2 - 5x + 6 = (x-2)(x-3) = 0, giving roots x = 2 and x = 3.', 'beginner'),
('education', 'class-10/maths', 'quadratic-equations', 'For the quadratic equation 2x^2 + kx + 3 = 0 to have equal roots, the value of k must satisfy:', '["k^2 = 24", "k^2 = 12", "k = 24", "k^2 = 6"]', 0, 'Equal roots require D = 0: k^2 - 4(2)(3) = 0, so k^2 = 24.', 'intermediate'),
('education', 'class-10/maths', 'quadratic-equations', 'Which of the following is NOT a quadratic equation?', '["x^2 + 2x - 3 = 0", "3x - 7 = 0", "2x^2 - 5 = 0", "x^2 = 9"]', 1, '3x - 7 = 0 is a linear equation (highest power of x is 1), not a quadratic equation, which requires the highest power of the variable to be exactly 2.', 'beginner'),
('education', 'class-10/maths', 'quadratic-equations', 'The sum and product of the roots of the equation 3x^2 - 6x + 2 = 0 are respectively:', '["Sum = 2, Product = 2/3", "Sum = -2, Product = 2/3", "Sum = 2, Product = -2/3", "Sum = 6, Product = 2"]', 0, 'For ax^2+bx+c=0, sum of roots = -b/a = -(-6)/3 = 2, and product of roots = c/a = 2/3.', 'intermediate')
ON CONFLICT (academy_slug, technology_slug, section_slug, question) DO NOTHING;
