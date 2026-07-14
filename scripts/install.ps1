[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$sourceDirectory = Join-Path $repositoryRoot 'pet'
$manifestSource = Join-Path $sourceDirectory 'pet.json'
$spritesheetSource = Join-Path $sourceDirectory 'spritesheet.webp'

if (-not (Test-Path -LiteralPath $manifestSource -PathType Leaf)) {
    throw "Missing package file: $manifestSource"
}

if (-not (Test-Path -LiteralPath $spritesheetSource -PathType Leaf)) {
    throw "Missing package file: $spritesheetSource"
}

$codexHome = if ($env:CODEX_HOME) {
    $env:CODEX_HOME
} else {
    Join-Path $HOME '.codex'
}

$destinationDirectory = Join-Path (Join-Path $codexHome 'pets') 'kesha'
New-Item -ItemType Directory -Force -Path $destinationDirectory | Out-Null

Copy-Item -LiteralPath $manifestSource -Destination (Join-Path $destinationDirectory 'pet.json') -Force
Copy-Item -LiteralPath $spritesheetSource -Destination (Join-Path $destinationDirectory 'spritesheet.webp') -Force

Write-Host "Kesha was installed to $destinationDirectory"
Write-Host 'Open Settings > Pets, select Refresh, and choose Kesha.'
