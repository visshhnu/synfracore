// Parses the site's faq.md files into plain Q&A pairs for FAQPage JSON-LD.
//
// The corpus is NOT one consistent format — confirmed by running this parser
// against all 60 real public/content/**/faq.md files (see the audit this was
// verified against). Three distinct authoring styles exist:
//   1. H2 headers:        "## Question text?"                  answer paragraph(s) follow
//   2. Bold + "Q:"/"A:":  "**Q: Question text?**" / "A: Answer" on following line(s)
//   3. Bold, no prefix:   "**Question text?**"    / plain answer paragraph(s) follow
// All three must be handled or a large fraction of the corpus (25/60 files,
// ~42%, in the initial audit) silently produces zero FAQ items despite having
// real FAQ content — which the empty-array guard would then correctly skip,
// but that's under-delivering the feature on nearly half the site, not a
// genuine "no FAQ content here" case.
//
// This intentionally does NOT try to be a general markdown-to-text renderer.
// It only needs clean-enough plain text for acceptedAnswer.text — Google's
// FAQPage spec accepts basic HTML there, but plain text is safer against a
// stray markdown character breaking JSON-LD escaping.

export interface FaqItem {
  question: string;
  answer: string;
}

// Found via corpus audit: this content is full of literal single/double
// asterisks that are NOT markdown emphasis — "SELECT *" (SQL wildcard),
// glob patterns, pointer dereferences, etc. A naive /\*([^*]+)\*/g strips
// emphasis by matching the first "*" to the NEXT "*" anywhere later in the
// text, however far away and unrelated — on "SELECT * prevents ... SELECT *
// (which..." this paired the two unrelated literal asterisks and deleted
// both, corrupting the answer to "SELECT  prevents ... SELECT  (which...".
// Real markdown emphasis requires the asterisk to be "flanking" — no
// whitespace immediately inside the delimiter (CommonMark's flanking rule).
// "SELECT *" fails this immediately (space right after the *), which is
// exactly why real markdown renderers don't treat it as emphasis either.
// Enforcing that same constraint here fixes the corruption without needing
// a full CommonMark implementation.
function stripInlineMarkdown(text: string): string {
  return text
    .replace(/```[\s\S]*?```/g, (block) =>
      block.replace(/```[a-zA-Z0-9]*\n?/g, "").replace(/```/g, "")
    )
    .replace(/`([^`]+)`/g, "$1")
    .replace(/\*\*(\S(?:[^*\n]*\S)?)\*\*/g, "$1")
    .replace(/\*(\S(?:[^*\n]*\S)?)\*/g, "$1")
    .replace(/\[([^\]]+)\]\([^)]+\)/g, "$1")
    .trim();
}

// A bold line is treated as a question header only if the ENTIRE line is one
// bold span ending in "?" (optionally prefixed "Q:") — this deliberately
// excludes inline bold text used mid-sentence inside an answer, which is
// common in this content and must not be misread as a new question.
const BOLD_QUESTION_RE = /^\*\*(?:Q:\s*)?(.+\?)\*\*\s*$/;
const H2_QUESTION_RE = /^##\s+(.+)$/;
const ANSWER_PREFIX_RE = /^A:\s*/i;

/**
 * Parses a faq.md file's raw markdown into {question, answer} pairs.
 * Returns an empty array if no question headers are found in any of the
 * three known formats. Callers MUST treat an empty array as "don't render
 * FAQJsonLd", not as a valid zero-item FAQPage (an empty mainEntity array
 * is invalid structured data).
 */
export function parseFaqMarkdown(markdown: string): FaqItem[] {
  if (!markdown || !markdown.trim()) return [];

  // Normalize CRLF first — found via corpus audit that 3 files
  // (devops/linux, databases/sql, databases/elasticsearch) use CRLF line
  // endings, which silently broke every $ -anchored regex below (JS's `.`
  // doesn't match \r, so `.+$` can never reach end-of-string on a
  // "...text\r" line) — those three files produced zero items until this
  // normalization was added, despite being well-formed H2-format FAQs.
  const lines = markdown.replace(/\r\n/g, "\n").split("\n");
  const items: FaqItem[] = [];
  let currentQuestion: string | null = null;
  let currentAnswerLines: string[] = [];
  let awaitingFirstAnswerLine = false; // true right after a bold-style question header

  const flush = () => {
    if (currentQuestion === null) return;
    const answer = stripInlineMarkdown(currentAnswerLines.join("\n").trim());
    const question = stripInlineMarkdown(currentQuestion);
    if (question && answer) {
      items.push({ question, answer });
    }
  };

  for (const rawLine of lines) {
    const line = rawLine;
    const h2Match = line.match(H2_QUESTION_RE);
    const boldMatch = line.match(BOLD_QUESTION_RE);

    if (h2Match) {
      flush();
      currentQuestion = h2Match[1].trim();
      currentAnswerLines = [];
      awaitingFirstAnswerLine = false;
      continue;
    }
    if (boldMatch) {
      flush();
      currentQuestion = boldMatch[1].trim();
      currentAnswerLines = [];
      awaitingFirstAnswerLine = true;
      continue;
    }
    if (line.startsWith("# ")) {
      // Top-level title — not a question.
      continue;
    }
    if (currentQuestion === null) continue;

    if (awaitingFirstAnswerLine) {
      const trimmed = line.trim();
      if (trimmed === "") continue; // skip blank line(s) between question and answer
      currentAnswerLines.push(trimmed.replace(ANSWER_PREFIX_RE, ""));
      awaitingFirstAnswerLine = false;
      continue;
    }
    currentAnswerLines.push(line);
  }
  flush();

  return items;
}
