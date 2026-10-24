#!/usr/bin/env bash
# Builds a team preview of the book at book/preview/ (served at /course/preview/).
# Its sidebar lists every page in src/, including pages left out of SUMMARY.md,
# so instructors and TAs can see hidden pages exactly as students will.
# Run after `mdbook build`.
set -euo pipefail

tmp=$(mktemp -d)
cp -R book.toml src "$tmp"/
[ -f custom.css ] && cp custom.css "$tmp"/
[ -d theme ] && cp -R theme "$tmp"/

{
  echo
  echo "# Not yet visible to students"
  echo
  for f in src/*.md; do
    name=$(basename "$f")
    [ "$name" = "SUMMARY.md" ] && continue
    grep -q "($name)" src/SUMMARY.md && continue
    title=$(grep -m1 '^# ' "$f" | sed 's/^# //')
    echo "- [${title:-$name}]($name)"
  done
} >> "$tmp/src/SUMMARY.md"

MDBOOK_OUTPUT__HTML__SITE_URL=/course/preview/ mdbook build "$tmp" -d "$PWD/book/preview"
rm -rf "$tmp"
