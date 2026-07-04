#!/usr/bin/env bash
# Run this from inside your synfracore project folder:
#   bash setup.sh
# Safe to re-run — never overwrites files that already exist.

set -e

echo "Setting up SynfraCore project structure..."

# 1. Folders
mkdir -p docs

# 2. .env.local template (only if missing — never touches a real one)
if [ ! -f .env.local ]; then
  cat > .env.local << 'EOF'
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
EOF
  echo "Created .env.local — fill in your real keys now."
else
  echo ".env.local already exists — left untouched."
fi

# 3. Append required entries to existing .gitignore, skipping duplicates
touch .gitignore
for entry in ".env" ".env.local" ".env.*.local" "node_modules/" ".next/" "out/" ".DS_Store" ".vercel"; do
  if ! grep -qxF "$entry" .gitignore; then
    echo "$entry" >> .gitignore
    echo "Added '$entry' to .gitignore"
  fi
done

# 4. Reminder for the files already downloaded from chat
echo ""
echo "Now move these files (already downloaded) into place:"
echo "  synfracore-schema.sql            -> docs/"
echo "  synfracore-dashboard-wireframe.html -> docs/"
echo "  synfracore-pitch-onepager.html   -> docs/"
echo "  PROJECT_SUMMARY.md               -> docs/"
echo "  CLAUDE.md                        -> project root (leave here, not in docs/)"
echo ""

# 5. Install dependencies (only if package.json exists — i.e. Next.js already initialized)
if [ -f package.json ]; then
  echo "Installing Clerk + Supabase packages..."
  npm install @clerk/nextjs @supabase/supabase-js
else
  echo "No package.json found — run 'npx create-next-app@latest .' first, then re-run this script."
fi

echo ""
echo "Done. Open CLAUDE.md and tell Claude Code:"
echo '  "Read CLAUDE.md and docs/synfracore-schema.sql, then set up Clerk auth and connect Supabase as described."'
