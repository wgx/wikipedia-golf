# Builds the site locally: minifies src\index.html to the repo root (mirrors .github/workflows/build.yml)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

npx --yes html-minifier-terser@7 src/index.html `
    --collapse-whitespace --remove-comments `
    --minify-css true --minify-js true `
    -o index.html
if ($LASTEXITCODE -ne 0) { throw "Minify failed" }

Copy-Item src\wikipedia-golf.png wikipedia-golf.png -Force

$src = (Get-Item src\index.html).Length
$out = (Get-Item index.html).Length
Write-Host "Built index.html: $src -> $out bytes"
