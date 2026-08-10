# VLSI Careers & Exam Pathways — Troubleshooting

## "My predicted score from Intermediate's model doesn't match my actual mock-test score"

Confirm you're applying a REALISTIC, per-category accuracy estimate rather than a single blanket number across all three question types — real performance on 1-mark MCQs, 2-mark MCQs, and NAT/MSQ questions is rarely identical, and the model's accuracy is materially improved by using three separate accuracy assumptions (one per category) rather than Intermediate's simplified uniform-accuracy examples, which were chosen for clarity of the underlying math, not as a claim that real accuracy is always uniform across categories.

## "I applied the effective_rate() formula to a NAT/MSQ question and got a different answer than the guide"

This is expected — Intermediate is explicit that NAT/MSQ questions do NOT use the effective_rate() discount at all, since there's no penalty to discount for. Applying effective_rate() to a NAT/MSQ category will UNDER-predict its expected value; the correct calculation for NAT/MSQ is simply `marks × accuracy`, with no penalty term.

## "My GATE score from Advanced's normalization formula doesn't match what I actually received"

Confirm you used the ACTUAL published Mq and Mt for your specific paper/category/session-year, not the illustrative Mq=30/Mt=70 values used in Advanced's worked example — those were explicitly flagged as illustrative. Also confirm your marks (M) were already session-normalized first if you sat a multi-session year — GATE's process normalizes marks BEFORE this score formula is applied in multi-session years.

## "I'm not sure whether to use this academy's model or Aerospace Careers & Exam Pathways' model for a specific calculation"

Both use the identical underlying effective_rate() and GATE score normalization formulas — the only real difference is GATE EC's three distinct marking schemes (1-mark MCQ, 2-mark MCQ, NAT/MSQ) versus GATE AE's single uniform -1/3 scheme. If preparing specifically for GATE EC, use THIS page's three-category breakdown; the underlying math is the same either way, as Intermediate explicitly demonstrates.

## "Fundamentals' honest technology-to-GATE-EC mapping means most of this academy has zero GATE EC benefit — should I skip studying those technologies?"

Not if the goal is an industry design/verification career — Fundamentals' own Try It exercise addresses this directly: it would be reasonable to DEPRIORITIZE those technologies if maximizing GATE EC score were the SOLE goal, but doing so leaves a candidate unprepared for the technical interviews those industry roles actually use, since (per Overview) the private semiconductor industry pathway doesn't require GATE at all and tests HDL/RTL/Verification/Physical Design skills directly.

## "The vlsi-careers/interview.md page still describes the Dholera fab as slipping to 'H1 2027,' but Overview here (and Physical Design & Fabrication's own Overview) both describe a later, mid-2028 slip"

This is a real, flagged inconsistency between two pages of this same technology — Overview's own text was corrected earlier in this campaign to reflect the more current mid-2028 finding, but the Interview Q&A page's own worked answer on this exact topic was not updated at the same time and still cites the older H1 2027 figure. This is logged as an open backlog item to resolve, not something to treat as current — check Overview's own framing (and Physical Design & Fabrication's Overview, the primary source) as the more current reference until the Interview page itself is corrected.
