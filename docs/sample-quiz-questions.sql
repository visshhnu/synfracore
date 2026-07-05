-- ============================================================
-- Sample verification questions — proves out the quiz system end to end
-- on 3 real sections. Run after docs/learner-platform-schema.sql.
--
-- This is intentionally a SAMPLE, not full coverage: Phase 6 asked for the
-- reusable system to be complete now, with content-wide generation queued
-- for later sessions rather than attempted wholesale here.
-- ============================================================

INSERT INTO quiz_questions (academy_slug, technology_slug, section_slug, question, options, correct_index, explanation, difficulty) VALUES

-- devops/linux/overview
('devops', 'linux', 'overview', 'Which command shows currently running processes with their resource usage?', '["ls -la", "top", "cat /etc/passwd", "mkdir"]', 1, '`top` (or `htop`) shows live CPU/memory usage per process — essential for diagnosing a server under load.', 'beginner'),
('devops', 'linux', 'overview', 'What does the permission string "rwxr-xr--" mean for the file owner?', '["Read only", "Read and write only", "Read, write, and execute", "No permissions"]', 2, 'The first three characters (rwx) apply to the owner — read, write, and execute all granted.', 'beginner'),
('devops', 'linux', 'overview', 'Which directory conventionally holds system configuration files?', '["/tmp", "/etc", "/home", "/dev"]', 1, '/etc is the standard location for system-wide configuration files on Linux.', 'beginner'),
('devops', 'linux', 'overview', 'What is the purpose of the `chmod` command?', '["Change file ownership", "Change file permissions", "Compress a file", "Search file contents"]', 1, 'chmod (change mode) modifies read/write/execute permissions on files and directories.', 'beginner'),
('devops', 'linux', 'overview', 'Which of these is true about a symbolic link (symlink)?', '["It duplicates the file''s full content", "It is a pointer/reference to another file or directory", "It only works for directories", "It requires root to create"]', 1, 'A symlink is a lightweight pointer to another path — deleting the original breaks the link, unlike a hard copy.', 'intermediate'),

-- ai/llm-engineering/overview
('ai', 'llm-engineering', 'overview', 'What does an LLM actually predict at each generation step?', '["The entire response at once", "A probability distribution over the next token", "A fixed lookup from a database", "The user''s intent as a JSON object"]', 1, 'LLMs are autoregressive — they predict one token at a time as a probability distribution, then sample from it.', 'beginner'),
('ai', 'llm-engineering', 'overview', 'Setting temperature to 0 makes the model output...', '["More random and creative", "Deterministic — same input gives the same output", "Faster but less accurate", "Unable to respond"]', 1, 'Temperature 0 removes sampling randomness, making next-token selection effectively greedy/deterministic.', 'beginner'),
('ai', 'llm-engineering', 'overview', 'What problem does RAG (Retrieval Augmented Generation) primarily solve?', '["Making models faster", "Grounding responses in current/private data the model wasn''t trained on", "Reducing model size", "Removing the need for prompts"]', 1, 'RAG retrieves relevant external documents and feeds them into the prompt, so the model can answer accurately about data outside its training set.', 'intermediate'),
('ai', 'llm-engineering', 'overview', 'What is a "context window"?', '["The browser window running the chat UI", "The maximum tokens (input + output) a model can process at once", "A rate limit on API calls", "The training dataset size"]', 1, 'The context window bounds how much text (prompt + generated output) the model can attend to in a single request.', 'beginner'),
('ai', 'llm-engineering', 'overview', 'When should you reach for fine-tuning instead of RAG or prompt engineering?', '["Always, it''s the best first option", "When you need the model to follow a specific style/format consistently, after simpler approaches fall short", "Only for image models", "Never — it is deprecated"]', 1, 'The recommended order is prompt engineering first, then RAG for knowledge gaps, and fine-tuning only when style/format/behavior still isn''t sufficient.', 'advanced'),

-- data/excel/overview
('data', 'excel', 'overview', 'Why is XLOOKUP generally preferred over VLOOKUP today?', '["It is older and more stable", "It can look in any direction and doesn''t break when columns are inserted", "It only works with numbers", "It is faster to type"]', 1, 'XLOOKUP removes the column-index-number fragility of VLOOKUP and can search left-to-right or right-to-left.', 'beginner'),
('data', 'excel', 'overview', 'What is the main purpose of a Pivot Table?', '["To format cells with colors", "To summarise large datasets via drag-and-drop grouping without writing formulas", "To create macros", "To password-protect a workbook"]', 1, 'Pivot Tables let you group, aggregate, and slice large datasets interactively without manually writing SUMIFS-style formulas.', 'beginner'),
('data', 'excel', 'overview', 'Which function combination is more flexible than VLOOKUP for two-way lookups?', '["SUM + IF", "INDEX + MATCH", "CONCATENATE + LEN", "ROUND + MOD"]', 1, 'INDEX/MATCH separates the lookup and return ranges, letting you look in any direction and reference columns dynamically.', 'intermediate'),
('data', 'excel', 'overview', 'What does Ctrl+E (Flash Fill) do?', '["Deletes empty rows", "Detects a pattern from your example and auto-fills the rest of the column", "Freezes panes", "Exports to PDF"]', 1, 'Flash Fill recognises a pattern from one or two typed examples (like extracting a last name) and applies it to the rest of the column.', 'beginner'),
('data', 'excel', 'overview', 'In a loan amortisation table, which function calculates the interest portion of a fixed payment?', '["PMT", "IPMT", "SUM", "VLOOKUP"]', 1, 'IPMT returns the interest component of a specified payment period, while PMT gives the total fixed payment and PPMT gives the principal portion.', 'advanced')

-- Safe to re-run: matches the UNIQUE(academy_slug, technology_slug, section_slug, question)
-- constraint on quiz_questions, so a second run of this file is a no-op, not 15 duplicate rows.
ON CONFLICT (academy_slug, technology_slug, section_slug, question) DO NOTHING;
