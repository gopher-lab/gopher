# Gopher Quick Start - TAO Strategy Evolution (Windows PowerShell)
# A tested configuration to get started with strategy evolution
#
# Prerequisites:
#   1. Install gopher CLI (see docs/installation/cli.md)
#   2. Set your API key: $env:BART_GOPHER_CODE='gopher_your-key-here'
#      Or use OpenRouter: $env:OPENROUTER_API_KEY='sk-or-v1-your-key-here'
#
# Usage:
#   .\quickstart-tao.ps1

$ErrorActionPreference = "Stop"

# Check if gopher is installed
try {
    $null = Get-Command gopher -ErrorAction Stop
} catch {
    Write-Host "Error: gopher CLI not found. Please install it first." -ForegroundColor Red
    Write-Host "See: https://github.com/gopher-lab/gopher/releases"
    exit 1
}

# Check for API key
if (-not $env:BART_GOPHER_CODE -and -not $env:OPENROUTER_API_KEY) {
    Write-Host "Warning: No API key found." -ForegroundColor Yellow
    Write-Host "Set BART_GOPHER_CODE or OPENROUTER_API_KEY environment variable."
    Write-Host ""
}

# Calculate date range (last 25 days)
$END_DATE = (Get-Date).ToString("yyyy-MM-dd")
$START_DATE = (Get-Date).AddDays(-25).ToString("yyyy-MM-dd")

Write-Host "=============================================="
Write-Host "  Gopher Quick Start - TAO Strategy Evolution"
Write-Host "=============================================="
Write-Host ""
Write-Host "Configuration:"
Write-Host "  Asset:      TAO"
Write-Host "  Date range: $START_DATE to $END_DATE"
Write-Host "  Intervals:  15m, 30m, 1h"
Write-Host "  Iterations: 50"
Write-Host "  Leverage:   10x"
Write-Host ""
Write-Host "Starting evolution..."
Write-Host ""

gopher evolve `
  --asset TAO `
  --start $START_DATE `
  --end $END_DATE `
  --intervals 15m,30m,1h `
  --iterations 50 `
  --leverage 10 `
  --model qwen/qwen3-max `
  --backtest-model qwen/qwen3-vl-8b-instruct
