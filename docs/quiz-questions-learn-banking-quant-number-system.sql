-- ============================================================
-- /learn quiz: Banking Quant -- Number System, the ONLY chapter across
-- the entire Banking board that carries a pyqYears badge (checked all
-- 4 subjects -- Quant, Reasoning, English, Awareness -- and every
-- other chapter has no pyqYears field at all, so no badge to back).
-- Completes the Banking board's in-scope work under this build's
-- original premise.
--
-- SOURCING: same disclosed limitation as every /learn quiz batch this
-- session -- authored to match real IBPS/SBI-style single-correct-MCQ
-- quant style, topic distribution, and difficulty; NOT copied from any
-- official banking exam question paper. Every numeric claim below was
-- independently checked before writing.
--
-- Applied via @supabase/supabase-js, upsert(rows, { onConflict:
-- "academy_slug,technology_slug,section_slug,question", ignoreDuplicates:
-- true }) -- functionally identical to this file's ON CONFLICT clause.
-- ============================================================

INSERT INTO quiz_questions (academy_slug, technology_slug, section_slug, question, options, correct_index, explanation, difficulty) VALUES
('education', 'banking/quant', 'number-system', 'For any two positive integers a and b, the relationship between their LCM and HCF is:', '["LCM(a,b) x HCF(a,b) = a x b", "LCM(a,b) + HCF(a,b) = a + b", "LCM(a,b) = HCF(a,b)", "LCM(a,b) / HCF(a,b) = a + b"]', 0, 'A fundamental number theory identity: the product of a number pair''s LCM and HCF always equals the product of the two numbers themselves.', 'beginner'),
('education', 'banking/quant', 'number-system', 'The HCF of 24 and 36 is:', '["12", "6", "18", "24"]', 0, '24 = 2^3 x 3, 36 = 2^2 x 3^2; the HCF takes the lowest power of each common prime factor: 2^2 x 3 = 12.', 'beginner'),
('education', 'banking/quant', 'number-system', 'A number that is divisible by both 2 and 3 is always divisible by:', '["6", "12", "9", "4"]', 0, 'Since 2 and 3 are coprime, any number divisible by both must be divisible by their LCM, which is 6.', 'beginner'),
('education', 'banking/quant', 'number-system', 'The repeating decimal 0.333... is equivalent to the fraction:', '["1/3", "1/33", "3/10", "1/30"]', 0, 'Setting x = 0.333..., then 10x = 3.333...; subtracting gives 9x = 3, so x = 3/9 = 1/3.', 'intermediate'),
('education', 'banking/quant', 'number-system', 'The LCM of 4 and 6 is:', '["12", "24", "10", "20"]', 0, '4 = 2^2, 6 = 2 x 3; the LCM takes the highest power of each prime present: 2^2 x 3 = 12.', 'beginner')
ON CONFLICT (academy_slug, technology_slug, section_slug, question) DO NOTHING;
