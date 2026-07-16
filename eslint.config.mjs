import { dirname } from "path";
import { fileURLToPath } from "url";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

// Was an empty array before this fix — CI's "Lint" step passed unconditionally
// regardless of real issues, for every file including dynamic-route bracket
// directories, since there was no config to match against at all.
//
// The `ignores` entry is required, not cosmetic: unlike `next lint` (which
// applies its own implicit .next/node_modules ignores internally), a plain
// `eslint` CLI run through a FlatCompat-wrapped config has no default
// ignores — the first attempt at this fix linted compiled webpack bundles
// under .next/ wholesale (178,769 problems, almost all `require()`-forbidden
// and unused-webpack-helper noise from generated code, not real issues).
const eslintConfig = [
  { ignores: [".next/**", ".vercel/**", ".wrangler/**", "node_modules/**", "public/**", "next-env.d.ts"] },
  ...compat.extends("next/core-web-vitals", "next/typescript"),
];

export default eslintConfig;
