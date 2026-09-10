param(
    [Parameter(Mandatory=$true)][string]$PromptFile,
    [ValidateSet('ask','plan','agent')][string]$Mode='ask'
)
$ErrorActionPreference='Stop'
$workshopRoot=Split-Path $PSScriptRoot -Parent
$resolvedPrompt=(Resolve-Path -LiteralPath $PromptFile).Path
if (-not $env:BOB_API_KEY) {
    $env:BOB_API_KEY=[Environment]::GetEnvironmentVariable('BOB_API_KEY','User')
}
$promptText=Get-Content -LiteralPath $resolvedPrompt -Raw -Encoding UTF8
# Run only in a disposable exercise clone: bob run pre-approves tools.
$OutputEncoding=New-Object System.Text.UTF8Encoding($false)
$promptText | bob run --workspace $workshopRoot --mode $Mode --disable-mcp --disable-subagents --max-turns 45 --format json
exit $LASTEXITCODE
