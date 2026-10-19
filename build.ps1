$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    New-Item -ItemType Directory -Force -Path 'output/pdf' | Out-Null
    foreach ($name in @('manuscript', 'manuscript-marked', 'response-letter')) {
        & pdflatex -interaction=nonstopmode -halt-on-error "$name.tex"
        if ($LASTEXITCODE -ne 0) { throw "pdflatex failed: $name" }
        if ($name -ne 'response-letter') {
            & bibtex $name
            if ($LASTEXITCODE -ne 0) { throw "bibtex failed: $name" }
        }
        foreach ($pass in 1..2) {
            & pdflatex -interaction=nonstopmode -halt-on-error "$name.tex"
            if ($LASTEXITCODE -ne 0) { throw "pdflatex failed: $name" }
        }
        Move-Item -LiteralPath "$name.pdf" -Destination "output/pdf/$name.pdf" -Force
    }
} finally {
    Pop-Location
}
