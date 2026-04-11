#!/usr/bin/env bash
# =================================================================
# Git Cleanup Script
# =================================================================
# Removes cached __pycache__, .DS_Store, and other junk files from
# git tracking without deleting them locally. Then commits the
# .gitignore so they stay out for good.
#
# Usage:
#   cd Code/
#   bash cleanup-git.sh
# =================================================================

set -e

echo "================================================================="
echo "  Git Cleanup — Removing cached junk files"
echo "================================================================="

# Make sure we're in a git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "ERROR: Not inside a git repository. Run this from the Code/ directory."
    exit 1
fi

echo ""
echo "--- Step 1: Remove __pycache__ from git tracking ---"
find . -name "__pycache__" -type d -exec git rm -r --cached {} + 2>/dev/null || echo "  (no __pycache__ tracked)"

echo ""
echo "--- Step 2: Remove .pyc files from git tracking ---"
find . -name "*.pyc" -exec git rm --cached {} + 2>/dev/null || echo "  (no .pyc files tracked)"

echo ""
echo "--- Step 3: Remove .DS_Store from git tracking ---"
find . -name ".DS_Store" -exec git rm --cached {} + 2>/dev/null || echo "  (no .DS_Store tracked)"

echo ""
echo "--- Step 4: Remove generated directories from git tracking ---"
git rm -r --cached generated-service/ 2>/dev/null || echo "  (no generated-service/ tracked)"
git rm -r --cached "**/dashboards/" 2>/dev/null || echo "  (no dashboards/ tracked)"

echo ""
echo "--- Step 5: Stage the .gitignore ---"
git add .gitignore

echo ""
echo "--- Step 6: Show what will be committed ---"
git status

echo ""
echo "================================================================="
echo "  Review the changes above, then run:"
echo ""
echo "    git commit -m \"chore: add .gitignore, remove cached junk files\""
echo ""
echo "  This removes the files from git tracking only."
echo "  Your local files are untouched."
echo "================================================================="
