#!/usr/bin/env bash
# Builds the site locally: minifies src/index.html to the repo root (mirrors build.ps1 and .github/workflows/build.yml)
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

npx --yes html-minifier-terser@7 src/index.html \
    --collapse-whitespace --remove-comments \
    --minify-css true --minify-js true \
    -o index.html

cp -f src/wikipedia-golf.png wikipedia-golf.png

echo "Built index.html: $(stat -c %s src/index.html) -> $(stat -c %s index.html) bytes"
