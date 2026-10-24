#!/usr/bin/env bash
# Publishes pages left out of SUMMARY.md at their normal URLs (e.g. /course/project-1.html)
# without adding them to the sidebar, so the team can preview them exactly as students
# will see them. Only someone with the direct URL can reach them.
# Run after `mdbook build`.
set -euo pipefail

hidden=()
for f in src/*.md; do
  name=$(basename "$f")
  [ "$name" = "SUMMARY.md" ] && continue
  [ "$name" = "README.md" ] && continue  # becomes index.html, which the real book already has
  grep -q "($name)" src/SUMMARY.md || hidden+=("$name")
done
[ ${#hidden[@]} -eq 0 ] && exit 0

# Build a second copy of the book with the hidden pages listed, then copy just those pages over.
tmp=$(mktemp -d)
cp -R book.toml src "$tmp"/
[ -f custom.css ] && cp custom.css "$tmp"/
[ -d theme ] && cp -R theme "$tmp"/
for name in "${hidden[@]}"; do echo "- [$name]($name)" >> "$tmp/src/SUMMARY.md"; done
mdbook build "$tmp" -d "$tmp/out" >/dev/null

toc=$(cd book && ls toc-*.js)
search=$(cd book && ls searchindex-*.js)
for name in "${hidden[@]}"; do
  page="${name%.md}.html"
  # Point the page at the real book's sidebar and search index, and drop the
  # previous/next arrows, so it looks like every other page.
  python3 - "$tmp/out/$page" "book/$page" "$toc" "$search" <<'PY'
import re, sys
src, dst, toc, search = sys.argv[1:]
html = open(src).read()
html = re.sub(r'toc-[0-9a-f]+\.js', toc, html)
html = re.sub(r'searchindex-[0-9a-f]+\.js', search, html)
html = re.sub(r'<nav class="nav-wrapper".*?</nav>', '', html, flags=re.S)
html = re.sub(r'<nav class="nav-wide-wrapper".*?</nav>', '', html, flags=re.S)
open(dst, 'w').write(html)
PY
  echo "Published hidden page: $page"
done
rm -rf "$tmp"
